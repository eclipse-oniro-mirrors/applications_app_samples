/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, expect, it } from '@ohos/hypium';
import { Driver, MatchPattern, ON, abilityDelegatorRegistry } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';

const BUNDLE_NAME: string = 'com.example.inputmethodextension';
const ENTRY_ABILITY: string = 'EntryAbility';
const LAUNCH_WAIT_MS: number = 2500;
/** 查找上限：命中即返回，只有真的不在页面上才会等满这个值 */
const FIND_WAIT_MS: number = 1000;
/** 返回首页时的短轮询上限，避免一条用例把 5000ms 预算耗在等待上 */
const HOME_CHECK_MS: number = 800;
/** 点击后的稳定时间 */
const SETTLE_MS: number = 150;
/**
 * 返回首页后的沉淀时间：NavDestination 退出动画结束前点下一张卡，
 * 点击注入会卡在过渡中的窗口上直到本用例超时。
 */
const BACK_SETTLE_MS: number = 600;

/** 首页副标题：唯一且稳定，用来判断"确实在首页" */
const HOME_SUBTITLE: string = 'IME Kit：扩展信息、输入法列表与面板';

/** 在给定上限内等一个文本出现；超时返回 false，由用例断言，不吞掉失败 */
async function hasText(active: Driver, text: string, ms: number): Promise<boolean> {
  try {
    const component = await active.waitForComponent(ON.text(text), ms);
    return component !== undefined;
  } catch (err) {
    return false;
  }
}

/** 等一个固定文本 */
async function waitText(active: Driver, text: string): Promise<boolean> {
  return hasText(active, text, FIND_WAIT_MS);
}

/** 等一段包含关系：文案后面还带数字时用这个 */
async function waitContains(active: Driver, text: string): Promise<boolean> {
  try {
    const component = await active.waitForComponent(ON.text(text, MatchPattern.CONTAINS), FIND_WAIT_MS);
    return component !== undefined;
  } catch (err) {
    return false;
  }
}

/** 点一个文本节点：点不到返回 false，同样交给用例断言 */
async function clickText(active: Driver, text: string): Promise<boolean> {
  try {
    const component = await active.waitForComponent(ON.text(text), FIND_WAIT_MS);
    if (component === undefined) {
      return false;
    }
    await component.click();
    await active.delayMs(SETTLE_MS);
    return true;
  } catch (err) {
    return false;
  }
}

/** 在首页搜索框输入关键字：输入框找不到或输入失败都返回 false */
async function typeKeyword(active: Driver, keyword: string): Promise<boolean> {
  try {
    const input = await active.waitForComponent(ON.type('TextInput'), FIND_WAIT_MS);
    if (input === undefined) {
      return false;
    }
    await input.inputText(keyword);
    await active.delayMs(SETTLE_MS);
    return true;
  } catch (err) {
    return false;
  }
}

/** 清空搜索框，把首页还原成三项 */
async function clearKeyword(active: Driver): Promise<boolean> {
  try {
    const input = await active.waitForComponent(ON.type('TextInput'), FIND_WAIT_MS);
    if (input === undefined) {
      return false;
    }
    await input.clearText();
    await active.delayMs(SETTLE_MS);
    return true;
  } catch (err) {
    return false;
  }
}

/**
 * 回到首页：上一条用例失败可能把页面停在演示页，
 * 先按返回键退回，避免一条失败连带后面全红。
 */
async function ensureHomeVisible(active: Driver): Promise<boolean> {
  if (await hasText(active, HOME_SUBTITLE, HOME_CHECK_MS)) {
    return true;
  }
  for (let i = 0; i < 2; i++) {
    try {
      await active.pressBack();
      await active.delayMs(300);
    } catch (err) {
      return false;
    }
    if (await hasText(active, HOME_SUBTITLE, HOME_CHECK_MS)) {
      return true;
    }
  }
  return false;
}

/**
 * 收起软键盘。
 *
 * 搜索框输入后软键盘会挡住下方区域，此时对卡片的 click() 会卡住直到本条用例超时
 * （本机 OpenHarmony 7.0 实测）。返回键先收键盘、不离开首页，所以用它收。
 * 返回值靠“首页副标题还在不在”判定：不在就说明这一下按的不是键盘。
 */
async function hideKeyboard(active: Driver): Promise<boolean> {
  try {
    await active.pressBack();
    await active.delayMs(SETTLE_MS);
    return await hasText(active, HOME_SUBTITLE, FIND_WAIT_MS);
  } catch (err) {
    return false;
  }
}

/**
 * 收尾返回：按一下返回键并给页面留出重建时间。
 * 上一条用例超时会让 driver 还在忙，这里吞掉错误，避免把一次超时变成后面每一条都报错。
 */
async function settleBack(active: Driver): Promise<void> {
  try {
    await active.pressBack();
    await active.delayMs(BACK_SETTLE_MS);
  } catch (err) {
    // 这里不抛：失败信息已经由本条的 step 断言给出
  }
}

let driver: Driver | undefined = undefined;
let setupError: string = '';

/** 首次调用时创建 Driver 并拉起首页；失败只记录原因，由用例断言 */
async function ensureHome(): Promise<void> {
  if (driver !== undefined || setupError !== '') {
    return;
  }
  try {
    const created: Driver = Driver.create();
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY
    };
    await abilityDelegatorRegistry.getAbilityDelegator().startAbility(want);
    await created.delayMs(LAUNCH_WAIT_MS);
    driver = created;
  } catch (err) {
    setupError = `UiTest 初始化或拉起页面失败：${err}`;
    driver = undefined;
  }
}

/**
 * 页面级冒烟：把 README「已知限制」里列为"手工验收"的界面路径自动化。
 *
 * 这一层不碰输入法框架，只用 UiTest 驱动真实 UIAbility：
 * 启动 → 首页渲染 → 搜索过滤 → 三条导航 → 点按钮出结果。
 * 每条都断言"看得见的文案"，因此能抓到"逻辑对但页面没接上"这一类问题——
 * 纯逻辑用例抓不到它。
 *
 * 注：当前 hypium 的 it() 只有三个入参，单条上限固定 5000ms，
 * 所以这里把查找上限压到 1s、每条只做一件事，避免被等待撑爆。
 */
export default function inputMethodUiSmokeTest() {
  describe('InputMethodUiSmokeTest', () => {
    /**
     * @tc.number SUB_INPUT_METHOD_UI_0100
     * @tc.name testUiSmoke0001
     * @tc.desc Verify the home page renders its title block and the syscap card after launch.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUiSmoke0001', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      if (active !== undefined) {
        expect(await waitText(active, HOME_SUBTITLE)).assertTrue();
        expect(await waitText(active, '系统能力')).assertTrue();
        expect(await waitText(active, '重新检测系统能力')).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UI_0200
     * @tc.name testUiSmoke0002
     * @tc.desc Verify the three capability cards, the uncovered card and the item counter are all on the first screen.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUiSmoke0002', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      if (active !== undefined) {
        expect(await ensureHomeVisible(active)).assertTrue();
        expect(await waitText(active, '扩展信息')).assertTrue();
        expect(await waitText(active, '输入法列表')).assertTrue();
        expect(await waitText(active, '面板与模式')).assertTrue();
        expect(await waitText(active, '本示例未覆盖的部分')).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UI_0300
     * @tc.name testUiSmoke0003
     * @tc.desc Verify typing a keyword into the search box narrows the three cards down to one.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUiSmoke0003', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      if (active !== undefined) {
        expect(await ensureHomeVisible(active)).assertTrue();
        expect(await waitText(active, '3 项')).assertTrue();
        expect(await typeKeyword(active, '面板')).assertTrue();
        expect(await waitText(active, '1 项')).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UI_0350
     * @tc.name testUiSmoke0004
     * @tc.desc Verify a keyword that matches nothing shows the empty state instead of an empty page.
     *
     * 已有的搜索用例都在验证“能命中”，这条是唯一的负向路径：
     * 过滤结果为空时页面必须自己给出提示，而不是留一片空白让人以为页面挂了。
     *
     * 位置很关键：紧跟在 UI_0300 之后，输入框刚被用过、必定存在且已聚焦；
     * 放到本套件末尾试过，那时页面刚从演示页返回，找不到输入框。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUiSmoke0004', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      let step = 'no-driver';
      if (active !== undefined) {
        step = 'fail-clear-keyword';
        if (await clearKeyword(active)) {
          step = 'fail-type-keyword';
          if (await typeKeyword(active, 'zzz')) {
            step = 'fail-counter';
            if (await waitText(active, '0 项')) {
              step = 'fail-empty-hint';
              if (await waitContains(active, '没有匹配的能力')) {
                step = 'ok';
              }
            }
          }
        }
      }
      expect(step).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UI_0400
     * @tc.name testUiSmoke0005
     * @tc.desc Verify clearing the keyword brings all three cards back, so the filter is not a one way street.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUiSmoke0005', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      if (active !== undefined) {
        expect(await clearKeyword(active)).assertTrue();
        expect(await waitText(active, '3 项')).assertTrue();
        expect(await waitText(active, '面板与模式')).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UI_0500
     * @tc.name testUiSmoke0006
     * @tc.desc Verify opening the extra config demo and pressing build shows the four key success line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUiSmoke0006', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      if (active !== undefined) {
        expect(await ensureHomeVisible(active)).assertTrue();
        expect(await clickText(active, '扩展信息')).assertTrue();
        expect(await clickText(active, '构造默认配置')).assertTrue();
        expect(await waitContains(active, '成功：4 个键')).assertTrue();
        await settleBack(active);
      }
      done();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UI_0600
     * @tc.name testUiSmoke0007
     * @tc.desc Verify typing a list keyword into the search box leaves exactly one card, the list demo card.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUiSmoke0007', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      if (active !== undefined) {
        expect(await typeKeyword(active, '列表')).assertTrue();
        expect(await waitText(active, '输入法列表')).assertTrue();
        expect(await hideKeyboard(active)).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UI_0700
     * @tc.name testUiSmoke0008
     * @tc.desc Verify tapping the filtered list card opens the demo page with its open action on screen.
     *
     * 承接上一条：首页已被过滤成唯一一张卡，它落在首屏顶部，所以这里只需点击与等待。
     * 实测一次 inputText 约 2.2s、一次点击约 0.7s，两件事放同一条就会顶到 5s 上限。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUiSmoke0008', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      let step = 'no-driver';
      if (active !== undefined) {
        step = 'fail-click-card';
        if (await clickText(active, '输入法列表')) {
          step = 'fail-page-opened';
          if (await waitText(active, '打开输入法列表')) {
            step = 'ok';
          }
        }
        await settleBack(active);
        await clearKeyword(active);
      }
      expect(step).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UI_0800
     * @tc.name testUiSmoke0009
     * @tc.desc Verify the panel keyword narrows the home list down to the panel card alone.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUiSmoke0009', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      if (active !== undefined) {
        expect(await typeKeyword(active, '面板')).assertTrue();
        expect(await waitText(active, '面板与模式')).assertTrue();
        expect(await hideKeyboard(active)).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UI_0900
     * @tc.name testUiSmoke0010
     * @tc.desc Verify tapping the filtered panel card opens the demo page with its createPanel action.
     *
     * 跑完停在面板演示页、不返回：后面两条用例接着这一页继续断言，
     * 每条只有 5s 预算，重新导航一次就要花掉 3s 以上。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUiSmoke0010', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      let step = 'no-driver';
      if (active !== undefined) {
        step = 'fail-click-card';
        if (await clickText(active, '面板与模式')) {
          step = 'fail-page-opened';
          if (await waitText(active, '调用 createPanel')) {
            step = 'ok';
          }
        }
      }
      expect(step).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UI_1000
     * @tc.name testUiSmoke0011
     * @tc.desc Verify the panel page reports the inputMethod extension of this hap as registered.
     *
     * 接续上一条：页面已经停在面板演示页，这里只读不导航。
     * 断言的是整个示例的前提——module.json5 里那段 inputMethod 扩展真的能被读到：
     * type 写错或 srcEntry 失配时页面会显示“未注册”，系统永远不会拉起这个输入法，
     * 而除了这条之外没有任何用例会发现。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUiSmoke0011', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      let step = 'no-driver';
      if (active !== undefined) {
        step = 'fail-label-missing';
        if (await waitText(active, 'inputMethod 扩展')) {
          step = 'fail-not-registered';
          if (await waitContains(active, '已注册：InputMethodService')) {
            step = 'ok';
          }
        }
      }
      expect(step).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UI_1100
     * @tc.name testUiSmoke0012
     * @tc.desc Verify probing every panel combination pushes the status bar combination into the result list.
     *
     * 这是第一条真正点下去看结果的用例：前面几条只证明按钮画在页面上，
     * 这里证明“点击 → probePanelInfo → outcomeRow → 结果列表”这条链是通的。
     * 断言“状态栏·固定”而不是“软键盘·固定”，因为后者两个按钮都会产生，区分不出走了哪个分支。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUiSmoke0012', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      let step = 'no-driver';
      if (active !== undefined) {
        step = 'fail-click-button';
        if (await clickText(active, '四种组合都试')) {
          step = 'fail-no-result-row';
          if (await waitContains(active, '状态栏·固定')) {
            step = 'ok';
          }
        }
      }
      expect(step).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UI_1200
     * @tc.name testUiSmoke0013
     * @tc.desc Verify the home log panel shows records written by the demo pages, closing the loop across pages.
     *
     * 前面几条在演示页里点过按钮，那些动作经 Logger 写进 AppStorage；
     * 这条回到首页，断言“首页事件”面板里真的出现了扩展信息页写的记录。
     * “各页写日志、首页统一展示”这条链此前完全没有用例，断了也不会有纯逻辑用例变红。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUiSmoke0013', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      let step = 'no-driver';
      if (active !== undefined) {
        step = 'fail-home';
        if (await ensureHomeVisible(active)) {
          step = 'fail-no-home-panel';
          if (await waitText(active, '首页事件')) {
            step = 'fail-no-demo-record';
            if (await waitContains(active, 'ExtraConfig·')) {
              step = 'ok';
            }
          }
        }
      }
      expect(step).assertEqual('ok');
      done();
    });
  });
}
