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

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { Driver, MatchPattern, ON, abilityDelegatorRegistry } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';

const BUNDLE_NAME: string = 'com.example.distributedextension';
const ENTRY_ABILITY: string = 'EntryAbility';

/** 首页副标题：唯一且稳定，用来判断「确实在首页」 */
const HOME_SUBTITLE: string = '分布式 Extension / 链路增强 / 代理通道三个最小示例';

/** 冷启动等首页渲染：实测 dayu200 上 aboutToAppear 里两次同步查询约 1s 内完成 */
const LAUNCH_WAIT_MS: number = 2500;
/** 查找上限：命中即返回，只有真的不在页面上才会等满这个值 */
const FIND_WAIT_MS: number = 1000;
/** 返回首页时的短轮询上限，避免一条用例把 5000ms 预算耗在等待上 */
const HOME_CHECK_MS: number = 800;
/** 点击后的稳定时间 */
const SETTLE_MS: number = 150;
/**
 * NavDestination 的退出动画约 300ms，动画没结束就点下一张卡，
 * 点击会落在过渡中的窗口上，直到本用例超时。
 */
const BACK_SETTLE_MS: number = 700;

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

/** 等一段包含关系：KeyValueRow 的值后面还带一串说明时用这个 */
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
 * 收起软键盘。
 * 搜索框输入后软键盘会挡住下方卡片，此时对卡片的 click() 会卡住直到本条用例超时（实测）。
 * 返回键先收键盘、不离开首页，所以用它收；返回值靠「首页副标题还在不在」判定。
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

/** 收尾按键：上一条用例超时会让 driver 还在忙，这里吞掉错误，避免一次超时变成后面每条都报错 */
async function settleBack(active: Driver): Promise<void> {
  try {
    await active.pressBack();
    await active.delayMs(BACK_SETTLE_MS);
  } catch (err) {
    // 这里不抛：失败信息已经由本条的 step 断言给出
  }
}

/**
 * 从演示页回到首页。
 * 优先点页面自己的「返回」按钮（它走 navPathStack.pop()，是页面真正提供给用户的那条路径）；
 * 点不到时才退回系统返回键。
 *
 * 注意：Navigation 栈模式下首页一直留在组件树里，演示页盖在上面时也照样能搜到首页文案，
 * 所以「看到首页副标题」不能当作「已经在首页」；当前页改由 currentPage 显式跟踪。
 */
async function backToHome(active: Driver): Promise<boolean> {
  if (currentPage === 'home') {
    return await hasText(active, HOME_SUBTITLE, HOME_CHECK_MS);
  }
  let clicked = false;
  try {
    const back = await active.waitForComponent(ON.text('返回'), FIND_WAIT_MS);
    if (back !== undefined) {
      await back.click();
      await active.delayMs(BACK_SETTLE_MS);
      clicked = true;
    }
  } catch (err) {
    clicked = false;
  }
  if (!clicked) {
    await settleBack(active);
    return false;
  }
  if (await hasText(active, HOME_SUBTITLE, HOME_CHECK_MS)) {
    currentPage = 'home';
    return true;
  }
  return false;
}

/** 打开某个演示页：已经停在该页就直接复用，避免重复导航吃掉 5s 预算 */
async function openDemo(active: Driver, card: string, page: string): Promise<boolean> {
  if (currentPage === page) {
    return true;
  }
  if (!await backToHome(active)) {
    return false;
  }
  if (!await clickText(active, card)) {
    return false;
  }
  currentPage = page;
  await active.delayMs(SETTLE_MS);
  return true;
}

let driver: Driver | undefined = undefined;
let setupError: string = '';
/** 当前停留的页面：home / extension / link / channel，由本套件自己的点击维护 */
let currentPage: string = 'home';

/** 第一次调用时创建 Driver 并拉起首页；失败只记录原因，由用例断言 */
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
    currentPage = 'home';
  } catch (err) {
    setupError = `UiTest 初始化或拉起页面失败：${err}`;
    driver = undefined;
  }
}

/**
 * 页面级冒烟：把三个演示页的界面链路自动化。
 *
 * 纯逻辑用例能证明「函数算得对」，但证明不了「页面把结果接上了」：
 * 按钮没绑 onAction、KeyValueRow 绑错字段、导航页注册漏了，这些只有真跑 UI 才会红。
 * 这一层启动真实 UIAbility，按用户路径点按钮，断言屏幕上看得见的文案。
 *
 * 前置数据来自真机 uitest dumpLayout：首页三张卡（y≈638/838/1020）、
 * 扩展页的「模拟 onCollaborate」（y≈1010）、链路页的 createServer（y≈1015）、
 * 代理通道页的 closeProxyChannel（y≈1118）都在首屏内，所以本套件不需要滚动。
 *
 * 注：当前 hypium 的 it() 只有三个入参，单条上限固定 5000ms，因此每条只做一到两件事。
 */
export default function distributedUiSmokeTest() {
  describe('DistributedUiSmokeTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_UI_0100
     * @tc.name testUiSmoke0001
     * @tc.desc Verify the home page shows its title block and the prerequisite card after launch.
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
        expect(await waitText(active, '本机前置条件')).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_UI_0200
     * @tc.name testUiSmoke0002
     * @tc.desc Verify the prerequisite card lists both user_grant permissions and the request button.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUiSmoke0002', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      let step = 'no-driver';
      if (active !== undefined && await backToHome(active)) {
        step = 'fail-datasync';
        if (await waitText(active, 'DISTRIBUTED_DATASYNC')) {
          step = 'fail-bluetooth';
          if (await waitText(active, 'ACCESS_BLUETOOTH')) {
            step = 'fail-request-button';
            if (await waitText(active, '申请两个权限')) {
              // syscap 那一行只有两种口径：已声明 / 未声明（错误码），两种都必须能读出来
              step = (await waitContains(active, '已声明 AppCollaboration')) ||
                (await waitContains(active, '未声明')) ? 'ok' : 'fail-syscap-row';
            }
          }
        }
      }
      expect(step).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_UI_0300
     * @tc.name testUiSmoke0003
     * @tc.desc Verify the catalog renders three capability cards with the code chips and the item counter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUiSmoke0003', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      if (active !== undefined && await backToHome(active)) {
        expect(await waitText(active, '3 项')).assertTrue();
        // 三个 code 徽标来自 FEATURE_METAS，各出现一次，用来确认 catalog 三项都渲染了
        expect(await waitText(active, 'EXT')).assertTrue();
        expect(await waitText(active, 'LINK')).assertTrue();
        expect(await waitText(active, 'CHAN')).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_UI_0400
     * @tc.name testUiSmoke0004
     * @tc.desc Verify typing proxyChannel into the search box narrows the three cards down to one.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUiSmoke0004', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      if (active !== undefined && await backToHome(active)) {
        expect(await typeKeyword(active, 'proxyChannel')).assertTrue();
        expect(await waitText(active, '1 项')).assertTrue();
        expect(await waitText(active, '代理通道')).assertTrue();
        expect(await hideKeyboard(active)).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_UI_0500
     * @tc.name testUiSmoke0005
     * @tc.desc Verify a keyword that matches nothing shows the empty state instead of a blank page.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUiSmoke0005', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      let step = 'no-driver';
      if (active !== undefined && await backToHome(active)) {
        step = 'fail-clear';
        if (await clearKeyword(active)) {
          step = 'fail-type';
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
     * @tc.number SUB_DISTRIBUTED_EXT_UI_0600
     * @tc.name testUiSmoke0006
     * @tc.desc Verify clearing the keyword brings all three cards back, so the filter is not one way.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUiSmoke0006', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      if (active !== undefined && await backToHome(active)) {
        expect(await clearKeyword(active)).assertTrue();
        expect(await waitText(active, '3 项')).assertTrue();
        expect(await waitText(active, '链路增强')).assertTrue();
        expect(await hideKeyboard(active)).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_UI_0700
     * @tc.name testUiSmoke0007
     * @tc.desc Verify tapping the extension card opens its demo page with the first two section cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUiSmoke0007', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      let step = 'no-driver';
      if (active !== undefined && await openDemo(active, '分布式扩展', 'extension')) {
        step = 'fail-page-opened';
        if (await waitText(active, '扩展与契约')) {
          step = 'fail-back-button';
          if (await waitText(active, '返回')) {
            step = 'fail-action-card';
            if (await waitText(active, '接口调用')) {
              step = 'ok';
            }
          }
        }
      }
      expect(step).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_UI_0800
     * @tc.name testUiSmoke0008
     * @tc.desc Verify the extension page reports the distributed extension read back by bundleManager.
     *
     * 这条断言的是整个示例的前提：module.json5 里那段 type: distributed 的扩展真的读得到。
     * type 写错或 srcEntry 失配时页面显示「扩展未读到」，纯逻辑用例不会因此变红。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUiSmoke0008', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      if (active !== undefined && await openDemo(active, '分布式扩展', 'extension')) {
        expect(await waitContains(active, '扩展已注册')).assertTrue();
        expect(await waitContains(active, '已注册 DistributedExtAbility')).assertTrue();
        expect(await waitContains(active, 'extensionAbilities[1]')).assertTrue();
        expect(await waitContains(active, 'ExtensionAbilityType.DISTRIBUTED')).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_UI_0900
     * @tc.name testUiSmoke0009
     * @tc.desc Verify the enum check button refreshes the row with the three runtime values of the module.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUiSmoke0009', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      let step = 'no-driver';
      if (active !== undefined && await openDemo(active, '分布式扩展', 'extension')) {
        step = 'fail-click-button';
        if (await clickText(active, '核对枚举')) {
          step = 'fail-link-value';
          if (await waitContains(active, 'LINK_BR=0（一致）')) {
            step = 'fail-channel-value';
            if (await waitContains(active, 'CHANNEL_RESUME=1（一致）')) {
              step = 'fail-collab-value';
              if (await waitContains(active, 'ACCEPT=0')) {
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
     * @tc.number SUB_DISTRIBUTED_EXT_UI_1000
     * @tc.name testUiSmoke0010
     * @tc.desc Verify simulating onCollaborate with a non empty index renders the ACCEPT branch.
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
      if (active !== undefined && await openDemo(active, '分布式扩展', 'extension')) {
        step = 'fail-click-simulate';
        if (await clickText(active, '模拟 onCollaborate')) {
          step = 'fail-summary';
          if (await waitContains(active, '参数 1 个 → ACCEPT')) {
            step = 'fail-result';
            if (await waitContains(active, 'ACCEPT（0）：接受协同')) {
              step = 'ok';
            }
          }
        }
      }
      expect(step).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_UI_1100
     * @tc.name testUiSmoke0011
     * @tc.desc Verify clearing the index flips the simulated onCollaborate result to the REJECT branch.
     *
     * 接续上一条：页面已经停在扩展演示页且结果行上是 ACCEPT，
     * 这里清空下标再点一次，结果行必须变成 REJECT——同一条链路上的两种分支都走一遍。
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
      if (active !== undefined && await openDemo(active, '分布式扩展', 'extension')) {
        step = 'fail-click-clear';
        if (await clickText(active, '清空下标')) {
          step = 'fail-click-simulate';
          if (await clickText(active, '模拟 onCollaborate')) {
            step = 'fail-summary';
            if (await waitContains(active, '参数 0 个 → REJECT')) {
              step = 'fail-result';
              if (await waitContains(active, 'REJECT（1）：拒绝协同')) {
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
     * @tc.number SUB_DISTRIBUTED_EXT_UI_1200
     * @tc.name testUiSmoke0012
     * @tc.desc Verify the in page back button returns home and the demo actions were logged there.
     *
     * 演示页的每个动作都经 Logger 写进 AppStorage，首页「首页事件」面板统一展示；
     * 这条把「进演示页 → 返回首页 → 首页面板出现页面写的记录」这条跨页链路串起来。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testUiSmoke0012', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      let step = 'no-driver';
      if (active !== undefined) {
        step = 'fail-back-home';
        if (await backToHome(active)) {
          step = 'fail-home-subtitle';
          if (await waitText(active, HOME_SUBTITLE)) {
            // 首页事件面板：演示页里点的每一张卡都由 Index.openDemo 写一条「首页·导航」
            step = 'fail-home-panel';
            if (await waitText(active, '首页事件')) {
              step = 'fail-home-log';
              if (await waitContains(active, '首页·导航')) {
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
     * @tc.number SUB_DISTRIBUTED_EXT_UI_1300
     * @tc.name testUiSmoke0013
     * @tc.desc Verify the link enhance page renders its status lines and the peer discovery card.
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
      if (active !== undefined && await openDemo(active, '链路增强', 'link')) {
        step = 'fail-status-card';
        if (await waitText(active, '链路状态') && await waitText(active, '两条对象链')) {
          step = 'fail-peer-card';
          if (await waitText(active, '对端发现')) {
            step = 'fail-server-card';
            if (await waitText(active, '服务端 Server')) {
              step = 'ok';
            }
          }
        }
      }
      expect(step).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_UI_1400
     * @tc.name testUiSmoke0014
     * @tc.desc Verify createServer either reports success or a readable error, and the stage row agrees.
     *
     * 这是第一条点了真接口的用例：createServer 是同步调用，本机没有对端也不会挂住。
     * 未授予 DISTRIBUTED_DATASYNC 时系统会拒绝，于是两个分支都必须能读出来：
     * 成功时「服务端」行推进到「服务端已创建」，失败时仍停在「未创建」。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUiSmoke0014', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      let branch = 'none';
      if (active !== undefined && await openDemo(active, '链路增强', 'link')) {
        if (await clickText(active, 'createServer')) {
          if (await waitContains(active, 'createServer成功')) {
            branch = 'success';
          } else if (await waitContains(active, 'createServer失败')) {
            branch = 'failure';
          }
        }
      }
      expect(branch === 'none').assertFalse();
      expect(branch === 'success' || branch === 'failure').assertTrue();
      if (branch === 'success') {
        // 成功必须伴随状态机推进，否则页面显示的成功和阶段自相矛盾
        expect(active !== undefined && await waitContains(active, '服务端已创建')).assertTrue();
      } else {
        expect(active !== undefined && await waitContains(active, '未创建：先创建服务端')).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_UI_1500
     * @tc.name testUiSmoke0015
     * @tc.desc Verify the proxy channel page renders its state line and the BR peer picker card.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUiSmoke0015', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      let step = 'no-driver';
      if (active !== undefined && await openDemo(active, '代理通道', 'channel')) {
        step = 'fail-state-card';
        if (await waitText(active, '通道状态') && await waitText(active, '两条状态线')) {
          step = 'fail-peer-card';
          if (await waitText(active, '获取对端地址') && await waitText(active, '经典蓝牙 · BR/EDR')) {
            step = 'ok';
          }
        }
      }
      expect(step).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_UI_1600
     * @tc.name testUiSmoke0016
     * @tc.desc Verify the default peer parameters pass the local format check before any request.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUiSmoke0016', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      if (active !== undefined && await openDemo(active, '代理通道', 'channel')) {
        // 默认 MAC/UUID 必须过本地校验，否则页面会在发请求前就拦住，示例等于跑不通
        expect(await waitContains(active, 'MAC 格式：通过')).assertTrue();
        expect(await waitContains(active, 'UUID 格式：通过')).assertTrue();
        expect(await waitContains(active, '这里只校验格式，不校验真实性')).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_UI_1700
     * @tc.name testUiSmoke0017
     * @tc.desc Verify closing a channel that was never opened is rejected locally instead of calling the system.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUiSmoke0017', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      let step = 'no-driver';
      if (active !== undefined && await openDemo(active, '代理通道', 'channel')) {
        step = 'fail-click-close';
        if (await clickText(active, 'closeProxyChannel')) {
          step = 'fail-guard-text';
          // 没有 channelId 时 ChannelRunner 直接返回「未执行」，不会把请求发给系统
          if (await waitContains(active, 'closeProxyChannel未执行：当前没有打开的通道')) {
            step = 'fail-hint';
            if (await waitContains(active, '按顺序完成前一步再调用该接口')) {
              step = 'ok';
            }
          }
        }
      }
      expect(step).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_UI_1800
     * @tc.name testUiSmoke0018
     * @tc.desc Verify the channel page status card starts at the closed stage with empty callback rows.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUiSmoke0018', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      if (active !== undefined && await openDemo(active, '代理通道', 'channel')) {
        expect(await waitContains(active, '未打开：先 openProxyChannel')).assertTrue();
        expect(await waitText(active, '暂无状态回调')).assertTrue();
        expect(await waitContains(active, '尚未调用接口')).assertTrue();
        expect(await waitText(active, '暂无回调')).assertTrue();
        expect(await waitContains(active, '尚未收到数据')).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_UI_1900
     * @tc.name testUiSmoke0019
     * @tc.desc Verify the peer picker card explains both address sources before any scan runs.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUiSmoke0019', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      if (active !== undefined && await openDemo(active, '代理通道', 'channel')) {
        expect(await waitText(active, '获取对端地址')).assertTrue();
        expect(await waitContains(active, '经典蓝牙 · BR/EDR')).assertTrue();
        expect(await waitContains(active, '先点「读取已配对」')).assertTrue();
        expect(await waitContains(active, '未持有 system_basic 级')).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_UI_2000
     * @tc.name testUiSmoke0020
     * @tc.desc Verify the parameter card states the BR link type and all three open preconditions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUiSmoke0020', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      if (active !== undefined && await openDemo(active, '代理通道', 'channel')) {
        expect(await waitText(active, '对端参数')).assertTrue();
        expect(await waitContains(active, 'linkType 固定使用 LinkType.LINK_BR(0)')).assertTrue();
        expect(await waitContains(active, '32390002')).assertTrue();
        expect(await waitContains(active, '32390100')).assertTrue();
        expect(await waitContains(active, '32390101')).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_UI_2100
     * @tc.name testUiSmoke0021
     * @tc.desc Verify the channel send card counts the default payload and names the demo cap.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testUiSmoke0021', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      if (active !== undefined && await openDemo(active, '代理通道', 'channel')) {
        expect(await waitContains(active, '当前 18 字节 / 演示上限 256 字节')).assertTrue();
        expect(await waitContains(active, 'receiveData / channelStateChange')).assertTrue();
        expect(await waitText(active, 'sendData')).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_UI_2200
     * @tc.name testUiSmoke0022
     * @tc.desc Verify the capacity note names both the api limit and the smaller demo limit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testUiSmoke0022', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      if (active !== undefined && await openDemo(active, '代理通道', 'channel')) {
        expect(await waitText(active, '能力边界')).assertTrue();
        expect(await waitContains(active, 'd.ts 里 sendData 的上限是 4096 字节')).assertTrue();
        expect(await waitContains(active, '限制到 256 字节')).assertTrue();
        expect(await waitContains(active, '基于经典蓝牙（BR）打开一条代理通道')).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_UI_2300
     * @tc.name testUiSmoke0023
     * @tc.desc Verify loading the paired list always replaces the note with one of three outcomes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testUiSmoke0023', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      let note = 'none';
      if (active !== undefined && await openDemo(active, '代理通道', 'channel')) {
        if (await clickText(active, '读取已配对')) {
          if (await waitContains(active, '取地址失败')) {
            note = 'error';
          } else if (await waitContains(active, '还没有候选')) {
            note = 'empty';
          } else if (await waitContains(active, '候选')) {
            note = 'peers';
          }
        }
      }
      expect(note === 'none').assertFalse();
      expect(note === 'error' || note === 'empty' || note === 'peers').assertTrue();
      expect(await waitText(active, '获取对端地址')).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_UI_2400
     * @tc.name testUiSmoke0024
     * @tc.desc Verify starting a discovery reports peers or a readable failure in the same note.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testUiSmoke0024', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      let note = 'none';
      if (active !== undefined && await openDemo(active, '代理通道', 'channel')) {
        if (await clickText(active, '发现附近设备')) {
          if (await waitContains(active, '取地址失败')) {
            note = 'error';
          } else if (await waitContains(active, '还没有候选')) {
            note = 'empty';
          } else if (await waitContains(active, '候选')) {
            note = 'peers';
          }
        }
      }
      expect(note === 'none').assertFalse();
      expect(note === 'error' || note === 'empty' || note === 'peers').assertTrue();
      expect(await waitText(active, '获取对端地址')).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_UI_2500
     * @tc.name testUiSmoke0025
     * @tc.desc Verify opening a channel ends in a readable branch and the stage row follows it.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUiSmoke0025', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      let branch = 'none';
      // 上一条用例在通道页扫过对端，候选行会把打开按钮挤出屏幕下沿，点不到就等于没点；
      // 先回首页再重进，通道页按初始态重建，按钮回到可见区域后再点。
      if (active !== undefined && await backToHome(active)
        && await openDemo(active, '代理通道', 'channel')) {
        if (await clickText(active, 'openProxyChannel')) {
          if (await waitContains(active, 'openProxyChannel成功')) {
            branch = 'success';
          } else if (await waitContains(active, 'openProxyChannel失败')) {
            branch = 'failure';
          }
        }
      }
      expect(branch === 'none').assertFalse();
      expect(branch === 'success' || branch === 'failure').assertTrue();
      if (branch === 'failure') {
        expect(active !== undefined && await waitContains(active, '打开失败')).assertTrue();
      } else {
        expect(active !== undefined && await waitContains(active, '通道已打开')).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_UI_2600
     * @tc.name testUiSmoke0026
     * @tc.desc Verify the link page starts both object chains at empty with no callback text yet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUiSmoke0026', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      const emptyHint = '未创建：先创建服务端（createServer）或连接对象（createConnection）';
      if (active !== undefined && await openDemo(active, '链路增强', 'link')) {
        expect(await waitContains(active, emptyHint)).assertTrue();
        expect(await waitContains(active, '尚未调用接口')).assertTrue();
        expect(await waitText(active, '暂无回调')).assertTrue();
        expect(await waitContains(active, '尚未收到数据')).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_UI_2700
     * @tc.name testUiSmoke0027
     * @tc.desc Verify the peer card explains the scan and advertise steps before either is used.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUiSmoke0027', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      if (active !== undefined && await openDemo(active, '链路增强', 'link')) {
        expect(await waitContains(active, '尚未扫描：点「扫描对端广播」')).assertTrue();
        expect(await waitContains(active, '本机未广播：服务端需要先开广播')).assertTrue();
        expect(await waitText(active, '扫描对端广播')).assertTrue();
        expect(await waitText(active, '开启本机广播')).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_UI_2800
     * @tc.name testUiSmoke0028
     * @tc.desc Verify the server card exposes the four server actions and the single machine caveat.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUiSmoke0028', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      if (active !== undefined && await openDemo(active, '链路增强', 'link')) {
        expect(await waitText(active, '服务端 Server')).assertTrue();
        expect(await waitContains(active, 'createServer / start / stop / close')).assertTrue();
        expect(await waitContains(active, 'start() 之后对端才能连上本机')).assertTrue();
        expect(await waitText(active, 'createServer')).assertTrue();
        expect(await waitText(active, 'stop')).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_UI_2900
     * @tc.name testUiSmoke0029
     * @tc.desc Verify the client card names the four connection actions and the reconnect caveat.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUiSmoke0029', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      if (active !== undefined && await openDemo(active, '链路增强', 'link')) {
        expect(await waitText(active, '连接端 Connection')).assertTrue();
        expect(await waitContains(active, 'createConnection / connect / disconnect / close')).assertTrue();
        expect(await waitContains(active, '32390200 / 32390300')).assertTrue();
        expect(await waitText(active, 'createConnection')).assertTrue();
        expect(await waitText(active, 'disconnect')).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_UI_3000
     * @tc.name testUiSmoke0030
     * @tc.desc Verify the link send card counts the default payload against the 1024 byte api cap.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testUiSmoke0030', 0, async (done: Function) => {
      await ensureHome();
      expect(setupError).assertEqual('');
      const active = driver;
      expect(active === undefined).assertFalse();
      if (active !== undefined && await openDemo(active, '链路增强', 'link')) {
        expect(await waitContains(active, '当前 17 字节 / 上限 1024 字节')).assertTrue();
        expect(await waitContains(active, '「跳过回调发送」用于验证负向路径')).assertTrue();
        expect(await waitContains(active, '32390205')).assertTrue();
      }
      done();
    });

  });
}
