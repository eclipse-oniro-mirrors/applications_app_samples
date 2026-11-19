/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { errorManager, UIAbility } from '@kit.AbilityKit';
import { Component, ON, Rect } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { getAbilityName, getTopAbility, sleep, waitForTopAbility } from './TestHelper';
import { backToHome, clickId, exists, existsId, findId, getDriver, openPage, pressBackToHome } from './UiHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AbilityRuntime]';

/** WantAgent 页有 11 个按钮，最后两个要滚到列表底部才可见。 */
async function scrollToBottom(): Promise<void> {
  const list: Component = await getDriver().findComponent(ON.type('List'));
  await list.scrollToBottom();
  await sleep(500);
}

/** 页面注册的 LoopObserver 超时后会自己注销；这里兜底注销，避免影响后续用例。 */
function removeLoopObserver(): void {
  try {
    errorManager.off('loopObserver');
  } catch (error) {
    hilog.info(DOMAIN, TAG, '%{public}s', `off loopObserver: ${JSON.stringify(error)}`);
  }
}

export default function uiSmokeTest(): void {
  describe('AbilityRuntimeUiSmokeTest', () => {
    beforeAll(async (done: Function) => {
      await backToHome();
      done();
    })

    afterAll(async (done: Function) => {
      await backToHome();
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_UI_SMOKE_0001
     * @tc.name      testUiSmoke0001
     * @tc.desc      首页显示中文标题与 appManager、dataUriUtils、WantAgent 三个入口文案
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUiSmoke0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0001 begin');
      await backToHome();
      const actual1: boolean = await exists('元能力public接口开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = await exists('appManager开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists('dataUriUtils开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await exists('WantAgent开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0001 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_UI_SMOKE_0002
     * @tc.name      testUiSmoke0002
     * @tc.desc      首页显示 ApplicationContext、errorManager、UIAbilityContext 三个入口文案
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testUiSmoke0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0002 begin');
      await backToHome();
      const actual1: boolean = await exists('ApplicationContext开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = await exists('errorManager开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists('UIAbilityContext开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0002 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_UI_SMOKE_0003
     * @tc.name      testUiSmoke0003
     * @tc.desc      首页 6 个入口都可点击
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testUiSmoke0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0003 begin');
      await backToHome();
      const actual1: boolean = await (await findId('AppManager')).isClickable();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = await (await findId('DataUriUtils')).isClickable();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await (await findId('WantAgent')).isClickable();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await (await findId('ApplicationContext')).isClickable();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = await (await findId('ErrorManager')).isClickable();
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertTrue();
      const actual6: boolean = await (await findId('UIAbilityContext')).isClickable();
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0003 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_UI_SMOKE_0004
     * @tc.name      testUiSmoke0004
     * @tc.desc      首页入口自上而下依次为 AppManager、DataUriUtils、WantAgent、ApplicationContext、ErrorManager、UIAbilityContext
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testUiSmoke0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0004 begin');
      await backToHome();
      const b0: Rect = await (await findId('AppManager')).getBounds();
      const b1: Rect = await (await findId('DataUriUtils')).getBounds();
      const b2: Rect = await (await findId('WantAgent')).getBounds();
      const b3: Rect = await (await findId('ApplicationContext')).getBounds();
      const b4: Rect = await (await findId('ErrorManager')).getBounds();
      const b5: Rect = await (await findId('UIAbilityContext')).getBounds();
      const actual1: boolean = b0.bottom <= b1.top;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = b1.bottom <= b2.top;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = b2.bottom <= b3.top;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = b3.bottom <= b4.top;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = b4.bottom <= b5.top;
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0004 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_UI_SMOKE_0005
     * @tc.name      testUiSmoke0005
     * @tc.desc      首页 6 个入口左右边界一致，标题在第一个入口上方
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testUiSmoke0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0005 begin');
      await backToHome();
      const b0: Rect = await (await findId('AppManager')).getBounds();
      const b1: Rect = await (await findId('DataUriUtils')).getBounds();
      const b2: Rect = await (await findId('WantAgent')).getBounds();
      const b3: Rect = await (await findId('ApplicationContext')).getBounds();
      const b4: Rect = await (await findId('ErrorManager')).getBounds();
      const b5: Rect = await (await findId('UIAbilityContext')).getBounds();
      const title: Rect = await (await getDriver().findComponent(ON.text('元能力public接口开发示例'))).getBounds();
      const actual1: boolean = title.bottom <= b0.top;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 b0.left=${b0.left}`);
      expect(b0.left).assertEqual(b5.left);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 b0.right=${b0.right}`);
      expect(b0.right).assertEqual(b5.right);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 b2.left=${b2.left}`);
      expect(b2.left).assertEqual(b3.left);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0005 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_UI_SMOKE_0006
     * @tc.name      testUiSmoke0006
     * @tc.desc      进入 appManager 页：isRunningInStabilityTest 与 isRamConstrainedDevice 的四个按钮都在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUiSmoke0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0006 begin');
      const actual1: boolean = await openPage('AppManager', 'isRunningInStabilityTestCallback');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = await existsId('isRunningInStabilityTestPromise');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await existsId('isRamConstrainedDeviceCallback');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await existsId('isRamConstrainedDevicePromise');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0006 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_UI_SMOKE_0007
     * @tc.name      testUiSmoke0007
     * @tc.desc      appManager 页 getAppMemorySize 与 getRunningProcessInformation 四个按钮文案正确
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testUiSmoke0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0007 begin');
      const actual1: boolean = await openPage('AppManager', 'getAppMemorySizeCallback');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = await exists('getAppMemorySize(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists('getAppMemorySize(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await exists('getRunningProcessInformation(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = await exists('getRunningProcessInformation(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0007 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_UI_SMOKE_0008
     * @tc.name      testUiSmoke0008
     * @tc.desc      appManager 页依次点击 8 个按钮：页面不跳转，栈顶仍为 EntryAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testUiSmoke0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0008 begin');
      const actual1: boolean = await openPage('AppManager', 'isRunningInStabilityTestCallback');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      await clickId('isRunningInStabilityTestCallback', 400);
      await clickId('isRunningInStabilityTestPromise', 400);
      await clickId('isRamConstrainedDeviceCallback', 400);
      await clickId('isRamConstrainedDevicePromise', 400);
      await clickId('getAppMemorySizeCallback', 400);
      await clickId('getAppMemorySizePromise', 400);
      await clickId('getRunningProcessInformationCallback', 400);
      await clickId('getRunningProcessInformationPromise', 400);
      const actual2: string = getAbilityName(await getTopAbility());
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('EntryAbility');
      const actual3: boolean = await existsId('isRunningInStabilityTestCallback');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await existsId('getRunningProcessInformationPromise');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0008 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_UI_SMOKE_0009
     * @tc.name      testUiSmoke0009
     * @tc.desc      appManager 页按返回键回到首页，首页入口重新可见
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testUiSmoke0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0009 begin');
      const actual1: boolean = await openPage('AppManager', 'getAppMemorySizePromise');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = await pressBackToHome();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await existsId('UIAbilityContext');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: string = getAbilityName(await getTopAbility());
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0009 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_UI_SMOKE_0010
     * @tc.name      testUiSmoke0010
     * @tc.desc      进入 dataUriUtils 页：getId、attachId、deleteId、updateId 四个按钮文案正确
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUiSmoke0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0010 begin');
      const actual1: boolean = await openPage('DataUriUtils', 'getId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = await exists('getId(获取指定uri路径末尾的ID)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists('attachId(将ID附加到uri的路径末尾)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await exists('deleteId(删除指定uri路径末尾的ID)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = await exists('updateId(更新指定uri中的ID)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0010 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_UI_SMOKE_0011
     * @tc.name      testUiSmoke0011
     * @tc.desc      dataUriUtils 页依次点击四个按钮：页面不跳转，栈顶仍为 EntryAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testUiSmoke0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0011 begin');
      const actual1: boolean = await openPage('DataUriUtils', 'getId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      await clickId('getId', 500);
      await clickId('attachId', 500);
      await clickId('deleteId', 500);
      await clickId('updateId', 500);
      const actual2: string = getAbilityName(await getTopAbility());
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('EntryAbility');
      const actual3: boolean = await existsId('getId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await existsId('updateId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0011 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_UI_SMOKE_0012
     * @tc.name      testUiSmoke0012
     * @tc.desc      dataUriUtils 页四个按钮自上而下排列且左右对齐
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testUiSmoke0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0012 begin');
      const actual1: boolean = await openPage('DataUriUtils', 'getId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const b0: Rect = await (await findId('getId')).getBounds();
      const b1: Rect = await (await findId('attachId')).getBounds();
      const b2: Rect = await (await findId('deleteId')).getBounds();
      const b3: Rect = await (await findId('updateId')).getBounds();
      const actual2: boolean = b0.bottom <= b1.top;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = b1.bottom <= b2.top;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = b2.bottom <= b3.top;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 b0.left=${b0.left}`);
      expect(b0.left).assertEqual(b3.left);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0012 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_UI_SMOKE_0013
     * @tc.name      testUiSmoke0013
     * @tc.desc      进入 WantAgent 页：getBundleName 与 getUid 的四个按钮都在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUiSmoke0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0013 begin');
      const actual1: boolean = await openPage('WantAgent', 'getBundleNameCallback');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = await existsId('getBundleNamePromise');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await existsId('getUidCallback');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await existsId('getUidPromise');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = await exists('getBundleName(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0013 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_UI_SMOKE_0014
     * @tc.name      testUiSmoke0014
     * @tc.desc      WantAgent 页 cancel 与 equal 的四个按钮都在，文案正确
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testUiSmoke0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0014 begin');
      const actual1: boolean = await openPage('WantAgent', 'cancelCallback');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = await existsId('cancelPromise');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await existsId('equalCallback');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await exists('cancel(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = await exists('equal(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0014 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_UI_SMOKE_0015
     * @tc.name      testUiSmoke0015
     * @tc.desc      WantAgent 页滚到列表底部后 getOperationTypePromise 与 trigger 按钮可见
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testUiSmoke0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0015 begin');
      const actual1: boolean = await openPage('WantAgent', 'getBundleNameCallback');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      await scrollToBottom();
      const actual2: boolean = await existsId('getOperationTypePromise');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await existsId('trigger');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await exists('getOperationType(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0015 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_UI_SMOKE_0016
     * @tc.name      testUiSmoke0016
     * @tc.desc      WantAgent 页依次点击前 9 个查询按钮：页面不跳转，栈顶仍为 EntryAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testUiSmoke0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0016 begin');
      const actual1: boolean = await openPage('WantAgent', 'getBundleNameCallback');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      await clickId('getBundleNameCallback', 400);
      await clickId('getBundleNamePromise', 400);
      await clickId('getUidCallback', 400);
      await clickId('getUidPromise', 400);
      await clickId('cancelCallback', 400);
      await clickId('cancelPromise', 400);
      await clickId('equalCallback', 400);
      await clickId('equalPromise', 400);
      await clickId('getOperationTypeCallback', 400);
      const actual2: string = getAbilityName(await getTopAbility());
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('EntryAbility');
      const actual3: boolean = await existsId('getBundleNameCallback');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await existsId('equalPromise');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0016 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_UI_SMOKE_0017
     * @tc.name      testUiSmoke0017
     * @tc.desc      WantAgent 页点击 trigger：拉起的仍是 EntryAbility，页面停留在 WantAgent 页
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testUiSmoke0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0017 begin');
      const actual1: boolean = await openPage('WantAgent', 'getBundleNameCallback');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      await scrollToBottom();
      await clickId('trigger', 1500);
      const entry: UIAbility | undefined = await waitForTopAbility('EntryAbility', 3000);
      const actual2: string = getAbilityName(entry);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('EntryAbility');
      const actual3: boolean = await existsId('trigger');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await existsId('getOperationTypePromise');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0017 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_UI_SMOKE_0018
     * @tc.name      testUiSmoke0018
     * @tc.desc      进入 ApplicationContext 页：getCurrentAppCloneIndex、两个 getRunningProcessInformation 与 setFont 按钮都在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUiSmoke0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0018 begin');
      const actual1: boolean = await openPage('ApplicationContext', 'getCurrentAppCloneIndex');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = await existsId('getRunningProcessInformationCallback');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await existsId('getRunningProcessInformationPromise');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await existsId('setFont');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = await exists('getCurrentAppCloneIndex');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0018 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_UI_SMOKE_0019
     * @tc.name      testUiSmoke0019
     * @tc.desc      ApplicationContext 页依次点击三个查询按钮：页面不跳转，栈顶仍为 EntryAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testUiSmoke0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0019 begin');
      const actual1: boolean = await openPage('ApplicationContext', 'getCurrentAppCloneIndex');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      await clickId('getCurrentAppCloneIndex', 500);
      await clickId('getRunningProcessInformationCallback', 500);
      await clickId('getRunningProcessInformationPromise', 500);
      const actual2: string = getAbilityName(await getTopAbility());
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('EntryAbility');
      const actual3: boolean = await existsId('getCurrentAppCloneIndex');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await existsId('setFont');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0019 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_UI_SMOKE_0020
     * @tc.name      testUiSmoke0020
     * @tc.desc      ApplicationContext 页点击 setFont 注册并设置字体后，页面文字仍正常显示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testUiSmoke0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0020 begin');
      const actual1: boolean = await openPage('ApplicationContext', 'setFont');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      await clickId('setFont', 800);
      const actual2: string = getAbilityName(await getTopAbility());
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('EntryAbility');
      const actual3: boolean = await exists('setFont');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await exists('getCurrentAppCloneIndex');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0020 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_UI_SMOKE_0021
     * @tc.name      testUiSmoke0021
     * @tc.desc      进入 errorManager 页：注册LoopObserver 与 注册UnhandledRejectionObserver 两个按钮文案正确
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUiSmoke0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0021 begin');
      const actual1: boolean = await openPage('ErrorManager', 'registerLoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = await exists('注册LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists('注册UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await existsId('registerUnhandledRejection');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0021 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_UI_SMOKE_0022
     * @tc.name      testUiSmoke0022
     * @tc.desc      点击注册UnhandledRejectionObserver：按钮 id 与文案切换为注销并出现模拟按钮，再点一次恢复为注册
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testUiSmoke0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0022 begin');
      const actual1: boolean = await openPage('ErrorManager', 'registerUnhandledRejection');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      await clickId('registerUnhandledRejection', 800);
      const switched: boolean = await existsId('unregisterUnhandledRejection');
      const switchedText: boolean = await exists('注销UnhandledRejectionObserver');
      const simulate: boolean = await existsId('simulateUnhandledRejection');
      await clickId('unregisterUnhandledRejection', 800);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 switched=${switched}`);
      expect(switched).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 switchedText=${switchedText}`);
      expect(switchedText).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 simulate=${simulate}`);
      expect(simulate).assertTrue();
      const actual5: boolean = await existsId('registerUnhandledRejection');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0022 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_UI_SMOKE_0023
     * @tc.name      testUiSmoke0023
     * @tc.desc      注册后点击模拟UnhandledRejection：页面与栈顶不变，注销后按钮恢复为注册
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testUiSmoke0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0023 begin');
      const actual1: boolean = await openPage('ErrorManager', 'registerUnhandledRejection');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      await clickId('registerUnhandledRejection', 800);
      await clickId('simulateUnhandledRejection', 1500);
      const actual2: string = getAbilityName(await getTopAbility());
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('EntryAbility');
      const actual3: boolean = await existsId('unregisterUnhandledRejection');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await clickId('unregisterUnhandledRejection', 800);
      const actual4: boolean = await existsId('registerUnhandledRejection');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0023 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_UI_SMOKE_0024
     * @tc.name      testUiSmoke0024
     * @tc.desc      点击注册LoopObserver：页面不跳转，两个按钮仍在，栈顶仍为 EntryAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testUiSmoke0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0024 begin');
      const actual1: boolean = await openPage('ErrorManager', 'registerLoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      await clickId('registerLoopObserver', 800);
      removeLoopObserver();
      const actual2: string = getAbilityName(await getTopAbility());
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('EntryAbility');
      const actual3: boolean = await existsId('registerLoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await existsId('registerUnhandledRejection');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0024 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_UI_SMOKE_0025
     * @tc.name      testUiSmoke0025
     * @tc.desc      errorManager 页两个按钮可点击，注册LoopObserver 在上方且左右对齐
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testUiSmoke0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0025 begin');
      const actual1: boolean = await openPage('ErrorManager', 'registerLoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const loop: Component = await findId('registerLoopObserver');
      const rejection: Component = await findId('registerUnhandledRejection');
      const loopBounds: Rect = await loop.getBounds();
      const rejectionBounds: Rect = await rejection.getBounds();
      const actual2: boolean = await loop.isClickable();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await rejection.isClickable();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = loopBounds.bottom <= rejectionBounds.top;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 loopBounds.left=${loopBounds.left}`);
      expect(loopBounds.left).assertEqual(rejectionBounds.left);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0025 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_UI_SMOKE_0026
     * @tc.name      testUiSmoke0026
     * @tc.desc      dataUriUtils、WantAgent、ApplicationContext、errorManager 四个页面按返回键都回到首页
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testUiSmoke0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0026 begin');
      const actual1: boolean = await openPage('DataUriUtils', 'getId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = await pressBackToHome();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await openPage('WantAgent', 'getBundleNameCallback');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await pressBackToHome();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = await openPage('ApplicationContext', 'setFont');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertTrue();
      const actual6: boolean = await pressBackToHome();
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertTrue();
      const actual7: boolean = await openPage('ErrorManager', 'registerLoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a7=${actual7}`);
      expect(actual7).assertTrue();
      const actual8: boolean = await pressBackToHome();
      hilog.info(DOMAIN, TAG, '%{public}s', `a8=${actual8}`);
      expect(actual8).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSmoke0026 end');
    })
  })
}
