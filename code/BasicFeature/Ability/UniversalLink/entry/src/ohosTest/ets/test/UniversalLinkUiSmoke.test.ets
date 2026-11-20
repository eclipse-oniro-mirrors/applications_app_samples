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

import { afterAll, beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { UIAbility } from '@kit.AbilityKit';
import { Component, Driver, ON, Rect } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { closeOpenLinkAbility, dismissNoMatchDialog, getDriver } from './LinkHelper';
import {
  ENTRY_ABILITY,
  getAbilityName,
  getTopAbility,
  launchAbility,
  sleep,
  startAndCapture,
  StartResult,
  waitForTopAbility
} from './TestHelper';

const DOMAIN: number = 0xFF00;
const TAG: string = '[Sample_UniversalLink_UiSmoke]';
const OPEN_LINK: string = 'OpenLinkAbility';
const HOME_TITLE: string = 'UniversalLink开发示例';
const PROMISE_TEXT: string = 'openLink(promise)拉起应用';
const CALLBACK_TEXT: string = 'openLink(callback)拉起应用';
const OPEN_LINK_TITLE: string = 'UniversalLink方式拉起Ability成功';

/** 回到首页：收起栈顶的 OpenLinkAbility，再把 EntryAbility 拉到前台并等页面渲染。 */
async function backToHome(): Promise<void> {
  await dismissNoMatchDialog(300);
  await closeOpenLinkAbility();
  await launchAbility(ENTRY_ABILITY);
  await sleep(800);
}

/** 点击首页某个按钮，等 OpenLinkAbility 到栈顶并渲染出标题。 */
async function clickButton(id: string): Promise<UIAbility | undefined> {
  const driver: Driver = getDriver();
  const button: Component = await driver.findComponent(ON.id(id));
  await button.click();
  const top: UIAbility | undefined = await waitForTopAbility(OPEN_LINK, 4000);
  await sleep(800);
  return top;
}

async function exists(text: string): Promise<boolean> {
  return (await getDriver().findComponent(ON.text(text))) !== null;
}

/** pressBack 后等首页回到栈顶。 */
async function pressBackToHome(): Promise<string> {
  await getDriver().pressBack();
  const top: UIAbility | undefined = await waitForTopAbility(ENTRY_ABILITY, 4000);
  await sleep(800);
  return getAbilityName(top);
}

export default function universalLinkUiSmokeTest(): void {
  describe('UniversalLinkUiSmokeTest', () => {
    beforeAll(async (done: Function) => {
      await backToHome();
      done();
    })

    afterAll(async (done: Function) => {
      await dismissNoMatchDialog(500);
      await closeOpenLinkAbility();
      done();
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_UI_SMOKE_0001
     * @tc.name      testUniversalLinkUiSmoke0001
     * @tc.desc      首页显示中文标题与两个按钮的中文文案，没有 OpenLinkAbility 的页面标题
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUniversalLinkUiSmoke0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUniversalLinkUiSmoke0001 begin');
      await backToHome();
      expect(await exists(HOME_TITLE)).assertTrue();
      expect(await exists(PROMISE_TEXT)).assertTrue();
      expect(await exists(CALLBACK_TEXT)).assertTrue();
      expect(await exists(OPEN_LINK_TITLE)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUniversalLinkUiSmoke0001 end');
      done();
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_UI_SMOKE_0002
     * @tc.name      testUniversalLinkUiSmoke0002
     * @tc.desc      两个按钮都可点击，promise 按钮在 callback 按钮上方，左右边界一致
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testUniversalLinkUiSmoke0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUniversalLinkUiSmoke0002 begin');
      await backToHome();
      const promiseButton: Component = await getDriver().findComponent(ON.id('openLinkPromise'));
      const callbackButton: Component = await getDriver().findComponent(ON.id('openLinkCallback'));
      const promiseBounds: Rect = await promiseButton.getBounds();
      const callbackBounds: Rect = await callbackButton.getBounds();
      expect(await promiseButton.isClickable()).assertTrue();
      expect(await callbackButton.isClickable()).assertTrue();
      expect(promiseBounds.bottom < callbackBounds.top).assertTrue();
      expect(promiseBounds.left).assertEqual(callbackBounds.left);
      expect(promiseBounds.right).assertEqual(callbackBounds.right);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUniversalLinkUiSmoke0002 end');
      done();
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_UI_SMOKE_0003
     * @tc.name      testUniversalLinkUiSmoke0003
     * @tc.desc      首页标题位于两个按钮上方，按钮文案与按钮在同一行区域内
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testUniversalLinkUiSmoke0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUniversalLinkUiSmoke0003 begin');
      await backToHome();
      const title: Rect = await (await getDriver().findComponent(ON.text(HOME_TITLE))).getBounds();
      const button: Rect = await (await getDriver().findComponent(ON.id('openLinkPromise'))).getBounds();
      const text: Rect = await (await getDriver().findComponent(ON.text(PROMISE_TEXT))).getBounds();
      expect(title.bottom <= button.top).assertTrue();
      expect(text.top >= button.top).assertTrue();
      expect(text.bottom <= button.bottom).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUniversalLinkUiSmoke0003 end');
      done();
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_UI_SMOKE_0004
     * @tc.name      testUniversalLinkUiSmoke0004
     * @tc.desc      点击 promise 按钮拉起 OpenLinkAbility，页面显示拉起成功标题，首页按钮不可见
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUniversalLinkUiSmoke0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUniversalLinkUiSmoke0004 begin');
      await backToHome();
      const top: UIAbility | undefined = await clickButton('openLinkPromise');
      expect(getAbilityName(top)).assertEqual('OpenLinkAbility');
      expect(await exists(OPEN_LINK_TITLE)).assertTrue();
      expect(await exists(PROMISE_TEXT)).assertFalse();
      await backToHome();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUniversalLinkUiSmoke0004 end');
      done();
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_UI_SMOKE_0005
     * @tc.name      testUniversalLinkUiSmoke0005
     * @tc.desc      promise 按钮拉起的 OpenLinkAbility 收到按钮里写死的链接、viewData 与 appLinkingOnly=false
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUniversalLinkUiSmoke0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUniversalLinkUiSmoke0005 begin');
      await backToHome();
      const top: UIAbility | undefined = await clickButton('openLinkPromise');
      expect(top === undefined).assertFalse();
      if (top !== undefined) {
        expect(top.lastRequestWant.uri).assertEqual('http://docs.openharmony.cn');
        expect(top.lastRequestWant.action).assertEqual('ohos.want.action.viewData');
        expect(top.lastRequestWant.parameters?.['appLinkingOnly']).assertEqual(false);
        expect(top.lastRequestWant.parameters?.['ohos.aafwk.param.callerAbilityName']).assertEqual('EntryAbility');
      }
      await backToHome();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUniversalLinkUiSmoke0005 end');
      done();
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_UI_SMOKE_0006
     * @tc.name      testUniversalLinkUiSmoke0006
     * @tc.desc      promise 按钮拉起 OpenLinkAbility 后按返回键回到首页，两个按钮仍在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testUniversalLinkUiSmoke0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUniversalLinkUiSmoke0006 begin');
      await backToHome();
      const top: UIAbility | undefined = await clickButton('openLinkPromise');
      expect(getAbilityName(top)).assertEqual('OpenLinkAbility');
      expect(await pressBackToHome()).assertEqual('EntryAbility');
      expect(await exists(PROMISE_TEXT)).assertTrue();
      expect(await exists(CALLBACK_TEXT)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUniversalLinkUiSmoke0006 end');
      done();
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_UI_SMOKE_0007
     * @tc.name      testUniversalLinkUiSmoke0007
     * @tc.desc      按返回键离开的 OpenLinkAbility 只是退到后台，再点 promise 按钮复用同一实例
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testUniversalLinkUiSmoke0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUniversalLinkUiSmoke0007 begin');
      await backToHome();
      const first: UIAbility | undefined = await clickButton('openLinkPromise');
      expect(await pressBackToHome()).assertEqual('EntryAbility');
      const second: UIAbility | undefined = await clickButton('openLinkPromise');
      expect(getAbilityName(first)).assertEqual('OpenLinkAbility');
      expect(getAbilityName(second)).assertEqual('OpenLinkAbility');
      expect(first === second).assertTrue();
      await backToHome();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUniversalLinkUiSmoke0007 end');
      done();
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_UI_SMOKE_0008
     * @tc.name      testUniversalLinkUiSmoke0008
     * @tc.desc      点击 callback 按钮同样拉起 OpenLinkAbility 并显示拉起成功标题，收到同一个链接
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUniversalLinkUiSmoke0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUniversalLinkUiSmoke0008 begin');
      await backToHome();
      const top: UIAbility | undefined = await clickButton('openLinkCallback');
      expect(getAbilityName(top)).assertEqual('OpenLinkAbility');
      expect(await exists(OPEN_LINK_TITLE)).assertTrue();
      expect(top?.lastRequestWant.uri).assertEqual('http://docs.openharmony.cn');
      expect(top?.lastRequestWant.parameters?.['appLinkingOnly']).assertEqual(false);
      await backToHome();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUniversalLinkUiSmoke0008 end');
      done();
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_UI_SMOKE_0009
     * @tc.name      testUniversalLinkUiSmoke0009
     * @tc.desc      callback 按钮拉起的 OpenLinkAbility 带结果结束后回到首页，首页按钮可再次点击
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testUniversalLinkUiSmoke0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUniversalLinkUiSmoke0009 begin');
      await backToHome();
      const top: UIAbility | undefined = await clickButton('openLinkCallback');
      expect(getAbilityName(top)).assertEqual('OpenLinkAbility');
      if (top !== undefined) {
        await top.context.terminateSelfWithResult({ resultCode: 3, want: { parameters: { 'from': 'ui' } } });
      }
      const home: UIAbility | undefined = await waitForTopAbility(ENTRY_ABILITY, 4000);
      await sleep(800);
      expect(getAbilityName(home)).assertEqual('EntryAbility');
      expect(await (await getDriver().findComponent(ON.id('openLinkCallback'))).isClickable()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUniversalLinkUiSmoke0009 end');
      done();
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_UI_SMOKE_0010
     * @tc.name      testUniversalLinkUiSmoke0010
     * @tc.desc      callback 按钮拉起 OpenLinkAbility 后按返回键回到首页，首页标题仍在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testUniversalLinkUiSmoke0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUniversalLinkUiSmoke0010 begin');
      await backToHome();
      const top: UIAbility | undefined = await clickButton('openLinkCallback');
      expect(getAbilityName(top)).assertEqual('OpenLinkAbility');
      expect(await pressBackToHome()).assertEqual('EntryAbility');
      expect(await exists(HOME_TITLE)).assertTrue();
      expect(await exists(OPEN_LINK_TITLE)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUniversalLinkUiSmoke0010 end');
      done();
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_UI_SMOKE_0011
     * @tc.name      testUniversalLinkUiSmoke0011
     * @tc.desc      依次点击 promise、callback 按钮并各自返回首页（原 Ability.test 场景），每一步栈顶都符合预期
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUniversalLinkUiSmoke0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUniversalLinkUiSmoke0011 begin');
      await backToHome();
      const byPromise: UIAbility | undefined = await clickButton('openLinkPromise');
      expect(getAbilityName(byPromise)).assertEqual('OpenLinkAbility');
      expect(await pressBackToHome()).assertEqual('EntryAbility');
      const byCallback: UIAbility | undefined = await clickButton('openLinkCallback');
      expect(getAbilityName(byCallback)).assertEqual('OpenLinkAbility');
      expect(await pressBackToHome()).assertEqual('EntryAbility');
      expect(await exists(PROMISE_TEXT)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUniversalLinkUiSmoke0011 end');
      done();
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_UI_SMOKE_0012
     * @tc.name      testUniversalLinkUiSmoke0012
     * @tc.desc      无应用能处理的链接会弹出系统“无法打开此文件”对话框，期间栈顶不是本应用 Ability
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testUniversalLinkUiSmoke0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUniversalLinkUiSmoke0012 begin');
      await backToHome();
      const result: StartResult = await startAndCapture({
        action: 'ohos.want.action.viewData',
        uri: 'https://docs.openharmony.cn'
      });
      await sleep(1500);
      expect(result.code).assertEqual(16000019);
      expect(await exists('无法打开此文件')).assertTrue();
      expect(await exists('知道了')).assertTrue();
      expect(getAbilityName(await getTopAbility())).assertEqual('');
      await dismissNoMatchDialog();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUniversalLinkUiSmoke0012 end');
      done();
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_UI_SMOKE_0013
     * @tc.name      testUniversalLinkUiSmoke0013
     * @tc.desc      点“知道了”关闭系统对话框后回到首页，首页按钮重新可见
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testUniversalLinkUiSmoke0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUniversalLinkUiSmoke0013 begin');
      await backToHome();
      const result: StartResult = await startAndCapture({
        action: 'ohos.want.action.viewData',
        uri: 'ftp://docs.openharmony.cn'
      });
      const shown: boolean = await dismissNoMatchDialog();
      await sleep(500);
      const top: UIAbility | undefined = await launchAbility(ENTRY_ABILITY);
      expect(result.code).assertEqual(16000019);
      expect(shown).assertTrue();
      expect(await exists('知道了')).assertFalse();
      expect(getAbilityName(top)).assertEqual('EntryAbility');
      expect(await exists(PROMISE_TEXT)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUniversalLinkUiSmoke0013 end');
      done();
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_UI_SMOKE_0014
     * @tc.name      testUniversalLinkUiSmoke0014
     * @tc.desc      OpenLinkAbility 页面只有一行标题文本，没有首页的两个按钮
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testUniversalLinkUiSmoke0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUniversalLinkUiSmoke0014 begin');
      await backToHome();
      const top: UIAbility | undefined = await clickButton('openLinkPromise');
      expect(getAbilityName(top)).assertEqual('OpenLinkAbility');
      expect(await exists(OPEN_LINK_TITLE)).assertTrue();
      expect((await getDriver().findComponent(ON.id('openLinkPromise'))) === null).assertTrue();
      expect((await getDriver().findComponent(ON.id('openLinkCallback'))) === null).assertTrue();
      await backToHome();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUniversalLinkUiSmoke0014 end');
      done();
    })
  })
}
