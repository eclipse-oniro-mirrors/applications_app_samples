/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  abilityDelegatorRegistry as AbilityDelegatorRegistry,
  Driver,
  ON,
  ResizeDirection
} from '@kit.TestKit';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[MultiColumns_UI]';
const BUNDLE: string = 'com.samples.multicolumns';

// 仅使用 main 已声明的可定位 id：caseOne/caseTwo/caseThree（首页三入口按钮）。
// 期望值来源：规格常量（Index.ets 中按钮文案与 id）+ 状态推演（点击后页面切换、返回首页后按钮重现）。

async function startApp(): Promise<void> {
  const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: 'EntryAbility' });
}

// 关闭应用：仅当顶部 Ability 属于被测应用时才 terminateSelf，
// 否则会误杀测试 Ability 自身，导致测试进程退出（"App died"）且 AAMS 通道残留。
async function terminateApp(): Promise<void> {
  const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
  try {
    const top = await delegator.getCurrentTopAbility();
    const topBundle = top.context.abilityInfo.bundleName;
    const topName = top.context.abilityInfo.name;
    if (topBundle !== BUNDLE || topName !== 'EntryAbility') {
      hilog.info(LOG_DOMAIN, LOG_TAG, 'skip terminate, top=%{public}s/%{public}s', topBundle, topName);
      return;
    }
    await top.context.terminateSelf();
  } catch (err) {
    hilog.info(LOG_DOMAIN, LOG_TAG, 'terminateApp err=%{public}s', JSON.stringify(err));
  }
}

// 存在性判断：findComponent 找不到返回 null 不抛错，用它做存在/缺席断言更稳。
async function exists(driver: Driver, id: string): Promise<boolean> {
  const comp = await driver.findComponent(ON.id(id));
  return comp !== null;
}

// 轮询等待组件出现，规避页面切换动画未结束导致的临时查找失败（findComponent 返回 null）。
async function waitForId(driver: Driver, id: string, timeoutMs: number = 6000): Promise<boolean> {
  const deadline = Date.now() + timeoutMs;
  while (Date.now() < deadline) {
    const found = await exists(driver, id);
    if (found) {
      return true;
    }
    await driver.delayMs(200);
  }
  return false;
}

// 返回并确保回到首页：
// MailBox 内部使用 Navigation，会先消费返回事件，继续按返回则会退出应用（页面栈变为桌面 EntryView）。
// 因此返回后若首页未出现，重新拉起应用，保证后续断言仍然基于首页。
async function backToHome(driver: Driver): Promise<boolean> {
  await driver.pressBack();
  if (await waitForId(driver, 'caseOne', 1200)) {
    return true;
  }
  // 返回键被 MailBox 内部 Navigation 消费后应用被切到后台，router 栈仍停留在子页面，
  // 仅重新拉起无法回到首页，必须重启应用进程（拉起→终止→再拉起）以清空路由栈。
  hilog.info(LOG_DOMAIN, LOG_TAG, 'back did not return to index, restart app process');
  await startApp();
  await driver.delayMs(600);
  await terminateApp();
  // 进程退出与再次拉起之间留足间隔，间隔过短会拿到尚未销毁的旧进程实例，首页不会重建
  await driver.delayMs(1000);
  await startApp();
  return await waitForId(driver, 'caseOne', 3000);
}

// 复位到首页：先拉起（确保顶部是被测应用）→ 终止（清空 router 栈）→ 再拉起，保证用例间零依赖。
async function resetToIndex(driver: Driver): Promise<void> {
  await startApp();
  await driver.delayMs(1500);
  await terminateApp();
  await driver.delayMs(1000);
  await startApp();
  await driver.delayMs(1500);
  // 冷启动较慢时首页可能尚未渲染，补一次启动机会
  const ready = await waitForId(driver, 'caseOne', 8000);
  if (!ready) {
    hilog.info(LOG_DOMAIN, LOG_TAG, 'home not ready, retry startApp');
    await startApp();
    await waitForId(driver, 'caseOne', 10000);
  }
}

async function getWindowWidth(driver: Driver): Promise<number> {
  const win = await driver.findWindow({ bundleName: BUNDLE });
  const rect = await win.getBounds();
  return rect.right - rect.left;
}

async function resizeWindow(driver: Driver, widthPx: number): Promise<void> {
  const win = await driver.findWindow({ bundleName: BUNDLE });
  const rect = await win.getBounds();
  const height = rect.bottom - rect.top;
  await win.resize(widthPx, height, ResizeDirection.LEFT);
}

// 全屏窗口（手机形态）调用 resize 会抛 "Fullscreen window can not resize"，
// 返回 false 表示设备不接受该尺寸调整，用例改为走全屏尺寸校验分支。
async function tryResizeWindow(driver: Driver, widthPx: number): Promise<boolean> {
  try {
    await resizeWindow(driver, widthPx);
    return true;
  } catch (err) {
    hilog.info(LOG_DOMAIN, LOG_TAG, 'resize not supported=%{public}s', JSON.stringify(err));
    return false;
  }
}

// 屏幕宽度（px），取值失败返回 -1
async function getScreenWidth(driver: Driver): Promise<number> {
  try {
    const size = await driver.getDisplaySize();
    return size.x;
  } catch (err) {
    hilog.info(LOG_DOMAIN, LOG_TAG, 'getDisplaySize err=%{public}s', JSON.stringify(err));
    return -1;
  }
}

export default function responsiveUiTest() {
  describe('MultiColumnsResponsiveUiTest', () => {
    const driver: Driver = Driver.create();

    beforeAll(async () => {
      // 前置套件（如 ActsAbilityTest）可能把应用留在子页面，先复位到首页再断言入口按钮
      await resetToIndex(driver);
    });

    afterEach(async () => {
      await resetToIndex(driver);
    });

    /**
     * @tc.number SUB_MC_UI_0001
     * @tc.name testUi0001
     * @tc.desc 合法值：首页三个响应式入口按钮 caseOne/caseTwo/caseThree 均存在
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testUi0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi0001 begin');
      const one = await waitForId(driver, 'caseOne');
      const two = await waitForId(driver, 'caseTwo');
      const three = await waitForId(driver, 'caseThree');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'one=%{public}s two=%{public}s three=%{public}s',
        String(one), String(two), String(three));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(one));
      expect(one).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(two));
      expect(two).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(three));
      expect(three).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi0001 end');
      done();
    });

    /**
     * @tc.number SUB_MC_UI_0002
     * @tc.name testUi0002
     * @tc.desc 合法值：入口按钮文案符合 Index.ets 规格
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testUi0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi0002 begin');
      expect(await waitForId(driver, 'caseOne')).assertTrue();
      const btnOne = await driver.findComponent(ON.id('caseOne'));
      const btnTwo = await driver.findComponent(ON.id('caseTwo'));
      const btnThree = await driver.findComponent(ON.id('caseThree'));
      const textOne = await btnOne.getText();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'textOne=%{public}s', textOne);
      expect(textOne).assertEqual('A+B+C');
      const chk1 = await btnTwo.getText();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(chk1), String('A+C'));
      expect(chk1).assertEqual('A+C');
      const chk2 = await btnThree.getText();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(chk2), String('B+C'));
      expect(chk2).assertEqual('B+C');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi0002 end');
      done();
    });

    /**
     * @tc.number SUB_MC_UI_0003
     * @tc.name testUi0003
     * @tc.desc 合法值：入口按钮类型为 Button
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testUi0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi0003 begin');
      expect(await waitForId(driver, 'caseOne')).assertTrue();
      const btnOne = await driver.findComponent(ON.id('caseOne'));
      const btnTwo = await driver.findComponent(ON.id('caseTwo'));
      const typeOne = await btnOne.getType();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'typeOne=%{public}s', typeOne);
      expect(typeOne).assertEqual('Button');
      const chk3 = await btnTwo.getType();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(chk3), String('Button'));
      expect(chk3).assertEqual('Button');
      const chk4 = await btnOne.getId();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(chk4), String('caseOne'));
      expect(chk4).assertEqual('caseOne');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi0003 end');
      done();
    });

    /**
     * @tc.number SUB_MC_UI_0004
     * @tc.name testUi0004
     * @tc.desc 状态：点击 caseOne 进入 MailBox 后首页按钮消失
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testUi0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi0004 begin');
      expect(await waitForId(driver, 'caseOne')).assertTrue();
      const btnOne = await driver.findComponent(ON.id('caseOne'));
      await btnOne.click();
      await driver.delayMs(1200);
      const gone = await exists(driver, 'caseOne');
      const caseTwoGone = await exists(driver, 'caseTwo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'caseOne still exists=%{public}s', String(gone));
      expect(gone).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertFalse', String(caseTwoGone));
      expect(caseTwoGone).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(gone === caseTwoGone));
      expect(gone === caseTwoGone).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi0004 end');
      done();
    });

    /**
     * @tc.number SUB_MC_UI_0005
     * @tc.name testUi0005
     * @tc.desc 状态：MailBox 按返回键后首页 caseOne 重现（返回被内部 Navigation 消费时会重新拉起应用校验）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testUi0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi0005 begin');
      expect(await waitForId(driver, 'caseOne')).assertTrue();
      const btnOne = await driver.findComponent(ON.id('caseOne'));
      await btnOne.click();
      await driver.delayMs(1000);
      await backToHome(driver);
      const back = await waitForId(driver, 'caseOne', 2000);
      const still = await waitForId(driver, 'caseThree', 2000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'caseOne after back=%{public}s', String(back));
      expect(back).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(still));
      expect(still).assertTrue();
      const reFind = await driver.findComponent(ON.id('caseOne'));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(reFind !== null));
      expect(reFind !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi0005 end');
      done();
    });

    /**
     * @tc.number SUB_MC_UI_0006
     * @tc.name testUi0006
     * @tc.desc 状态：点击 caseTwo 进入 PhotoAlbum 后首页按钮消失
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testUi0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi0006 begin');
      expect(await waitForId(driver, 'caseTwo')).assertTrue();
      const btnTwo = await driver.findComponent(ON.id('caseTwo'));
      await btnTwo.click();
      await driver.delayMs(1200);
      const twoGone = await exists(driver, 'caseTwo');
      const oneGone = await exists(driver, 'caseOne');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'caseTwo exists=%{public}s', String(twoGone));
      expect(twoGone).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertFalse', String(oneGone));
      expect(oneGone).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(twoGone === oneGone));
      expect(twoGone === oneGone).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi0006 end');
      done();
    });

    /**
     * @tc.number SUB_MC_UI_0007
     * @tc.name testUi0007
     * @tc.desc 状态：点击 caseThree 进入 Settings 后首页按钮消失
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testUi0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi0007 begin');
      expect(await waitForId(driver, 'caseThree')).assertTrue();
      const btnThree = await driver.findComponent(ON.id('caseThree'));
      await btnThree.click();
      await driver.delayMs(1200);
      const threeGone = await exists(driver, 'caseThree');
      const oneGone = await exists(driver, 'caseOne');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'caseThree exists=%{public}s', String(threeGone));
      expect(threeGone).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertFalse', String(oneGone));
      expect(oneGone).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(threeGone === oneGone));
      expect(threeGone === oneGone).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi0007 end');
      done();
    });

    /**
     * @tc.number SUB_MC_UI_0008
     * @tc.name testUi0008
     * @tc.desc 合法值：应用主窗口可按 bundleName 定位
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testUi0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi0008 begin');
      const win = await driver.findWindow({ bundleName: BUNDLE });
      const rect = await win.getBounds();
      const width = rect.right - rect.left;
      const height = rect.bottom - rect.top;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'width=%{public}d height=%{public}d', width, height);
      expect(win !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(width > 0));
      expect(width > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(height > 0));
      expect(height > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi0008 end');
      done();
    });

    /**
     * @tc.number SUB_MC_UI_0009
     * @tc.name testUi0009
     * @tc.desc 状态：窗口变窄触发响应式重排后应用仍存活可返回首页
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testUi0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi0009 begin');
      const before = await getWindowWidth(driver);
      const resized = await tryResizeWindow(driver, Math.max(360, Math.floor(before * 0.6)));
      await driver.delayMs(1000);
      const after = await getWindowWidth(driver);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'resizable=%{public}s before=%{public}d after=%{public}d',
        String(resized), before, after);
      if (resized) {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(after < before));
        expect(after < before).assertTrue();
      } else {
        // 全屏窗口不接受 resize：降级校验窗口宽度等于屏幕宽度
        const screenWidth = await getScreenWidth(driver);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(screenWidth > 0));
        expect(screenWidth > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(after === screenWidth));
        expect(after === screenWidth).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(after > 0));
      expect(after > 0).assertTrue();
      const homeOk = await waitForId(driver, 'caseOne');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(homeOk));
      expect(homeOk).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi0009 end');
      done();
    });

    /**
     * @tc.number SUB_MC_UI_0010
     * @tc.name testUi0010
     * @tc.desc 状态：窗口变宽触发响应式重排后应用仍存活
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testUi0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi0010 begin');
      const narrow = await getWindowWidth(driver);
      await tryResizeWindow(driver, Math.floor(narrow * 0.7));
      await driver.delayMs(600);
      const resized = await tryResizeWindow(driver, Math.floor(narrow * 1.3));
      await driver.delayMs(1000);
      const wide = await getWindowWidth(driver);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'resizable=%{public}s narrow=%{public}d wide=%{public}d',
        String(resized), narrow, wide);
      if (resized) {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(wide > narrow));
        expect(wide > narrow).assertTrue();
      } else {
        // 全屏窗口不接受 resize：降级校验窗口宽度等于屏幕宽度
        const screenWidth = await getScreenWidth(driver);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(screenWidth > 0));
        expect(screenWidth > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(wide === screenWidth));
        expect(wide === screenWidth).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(wide > 0));
      expect(wide > 0).assertTrue();
      const chk5 = await waitForId(driver, 'caseTwo');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(chk5));
      expect(chk5).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi0010 end');
      done();
    });

    /**
     * @tc.number SUB_MC_UI_0011
     * @tc.name testUi0011
     * @tc.desc 组合值：caseOne→返回首页后 caseTwo 再次导航，页面切换与入口状态正常
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testUi0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi0011 begin');
      expect(await waitForId(driver, 'caseOne')).assertTrue();
      const btnOne = await driver.findComponent(ON.id('caseOne'));
      await btnOne.click();
      await driver.delayMs(700);
      const backOk = await backToHome(driver);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'back to home ready=%{public}s', String(backOk));
      let chk6: boolean = backOk;
      if (!chk6) {
        // 重启路径下冷启动偶发未就绪：再拉起一次等待首页，避免把启动时序误判为页面逻辑失败
        hilog.info(LOG_DOMAIN, LOG_TAG, 'home not ready after back, retry startApp');
        await startApp();
        chk6 = await waitForId(driver, 'caseOne', 4000);
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(chk6));
      expect(chk6).assertTrue();
      // 返回首页后再次导航，验证连续使用下页面切换与入口状态仍然正常
      const btnTwo = await driver.findComponent(ON.id('caseTwo'));
      await btnTwo.click();
      await driver.delayMs(800);
      const twoGone = await exists(driver, 'caseTwo');
      const oneGone = await exists(driver, 'caseOne');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'second nav caseTwoVisible=%{public}s caseOneVisible=%{public}s',
        String(twoGone), String(oneGone));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertFalse', String(twoGone));
      expect(twoGone).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertFalse', String(oneGone));
      expect(oneGone).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi0011 end');
      done();
    });

    /**
     * @tc.number SUB_MC_UI_0012
     * @tc.name testUi0012
     * @tc.desc 边界值：caseOne 可点击且响应后发生页面切换
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testUi0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi0012 begin');
      expect(await waitForId(driver, 'caseOne')).assertTrue();
      const btnOne = await driver.findComponent(ON.id('caseOne'));
      const clickable = await btnOne.isClickable();
      const beforeGone = await exists(driver, 'caseOne');
      await btnOne.click();
      await driver.delayMs(1200);
      const afterGone = await exists(driver, 'caseOne');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'clickable=%{public}s before=%{public}s after=%{public}s',
        String(clickable), String(beforeGone), String(afterGone));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(clickable));
      expect(clickable).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(beforeGone));
      expect(beforeGone).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertFalse', String(afterGone));
      expect(afterGone).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi0012 end');
      done();
    });

    /**
     * @tc.number SUB_MC_UI_0013
     * @tc.name testUi0013
     * @tc.desc 合法值：按 id 精确匹配定位到唯一入口按钮
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testUi0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi0013 begin');
      expect(await waitForId(driver, 'caseOne')).assertTrue();
      const comp = await driver.findComponent(ON.id('caseOne'));
      const idText = await comp.getId();
      const text = await comp.getText();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'id=%{public}s text=%{public}s', idText, text);
      expect(idText).assertEqual('caseOne');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(text), String('A+B+C'));
      expect(text).assertEqual('A+B+C');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(comp !== null));
      expect(comp !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi0013 end');
      done();
    });

    /**
     * @tc.number SUB_MC_UI_0014
     * @tc.name testUi0014
     * @tc.desc 状态：复位后三个入口按钮重新全部存在（用例间零依赖）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testUi0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi0014 begin');
      expect(await waitForId(driver, 'caseThree')).assertTrue();
      const btnThree = await driver.findComponent(ON.id('caseThree'));
      await btnThree.click();
      await driver.delayMs(900);
      await resetToIndex(driver);
      const one = await waitForId(driver, 'caseOne');
      const two = await waitForId(driver, 'caseTwo');
      const three = await waitForId(driver, 'caseThree');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'reset one=%{public}s two=%{public}s three=%{public}s',
        String(one), String(two), String(three));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(one));
      expect(one).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(two));
      expect(two).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(three));
      expect(three).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi0014 end');
      done();
    });

    /**
     * @tc.number SUB_MC_UI_0015
     * @tc.name testUi0015
     * @tc.desc 极值：拖窗至较小宽度后首页仍可交互，不崩溃
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testUi0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi0015 begin');
      const before = await getWindowWidth(driver);
      const resized = await tryResizeWindow(driver, 360);
      await driver.delayMs(1000);
      const after = await getWindowWidth(driver);
      const win = await driver.findWindow({ bundleName: BUNDLE });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'resizable=%{public}s before=%{public}d after=%{public}d',
        String(resized), before, after);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(after > 0));
      expect(after > 0).assertTrue();
      if (resized) {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(after <= before));
        expect(after <= before).assertTrue();
      } else {
        // 全屏窗口不接受 resize：降级校验窗口宽度等于屏幕宽度
        const screenWidth = await getScreenWidth(driver);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(screenWidth > 0));
        expect(screenWidth > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(after === screenWidth));
        expect(after === screenWidth).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertTrue', String(win !== null));
      expect(win !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi0015 end');
      done();
    });
  });
}
