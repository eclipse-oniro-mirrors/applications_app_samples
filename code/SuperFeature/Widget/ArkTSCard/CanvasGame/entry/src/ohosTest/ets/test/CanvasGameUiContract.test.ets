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

import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Component, Driver, ON } from '@kit.TestKit';
import { common, AbilityDelegatorRegistry } from '@kit.AbilityKit';
import { Want } from '@kit.AbilityKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';
const BUNDLE: string ='com.samples.canvasgame';
const DEL: AbilityDelegatorRegistry.AbilityDelegator=AbilityDelegatorRegistry.getAbilityDelegator();
let driver: Driver;
  let ctx: common.Context = DEL.getAppContext();
function wait(ms:number): Promise<void> {
  return new Promise<void>((resolve:()=>void)=>{ setTimeout(()=>{resolve();},ms); });
  }

export default function canvasGameUiContractTest() {
  describe('CanvasGameUiContractTest', () => {
    beforeAll(async () => {
      const want: Want = { bundleName: BUNDLE, abilityName: 'EntryAbility' };
      await DEL.startAbility(want);
      await wait(2000);
      driver = await Driver.create();
    })

    /**
     * @tc.name   com.samples.canvasgame_UiContract_0001
     * @tc.number SUB_CANVAS_UI_001
     * @tc.desc   Launch CanvasGame and verify restart button.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_UiContract_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_UiContract_0001 begin');
      const restart: string = ctx.resourceManager.getStringByNameSync('res_restart');
        await driver.assertComponentExist(ON.text(restart));
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(restart.length > 0));
        expect(restart.length > 0).assertTrue();
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_UiContract_0001 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_UiContract_0002
     * @tc.number SUB_CANVAS_UI_002
     * @tc.desc   Verify fallback button exists.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_UiContract_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_UiContract_0002 begin');
      const fallback: string = ctx.resourceManager.getStringByNameSync('res_fallback');
        await driver.assertComponentExist(ON.text(fallback));
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fallback.length > 0));
        expect(fallback.length > 0).assertTrue();
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_UiContract_0002 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_UiContract_0003
     * @tc.number SUB_CANVAS_UI_003
     * @tc.desc   Click restart and keep the page available.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_UiContract_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_UiContract_0003 begin');
      const restart: Component = await driver.findComponent(ON.text(ctx.resourceManager.getStringByNameSync('res_restart')));
        await restart.click();
        await wait(500);
        await driver.assertComponentExist(ON.text(ctx.resourceManager.getStringByNameSync('res_restart')));
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_UiContract_0003 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_UiContract_0004
     * @tc.number SUB_CANVAS_UI_004
     * @tc.desc   Click fallback and keep the page available.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_UiContract_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_UiContract_0004 begin');
      const fallback: Component = await driver.findComponent(ON.text(ctx.resourceManager.getStringByNameSync('res_fallback')));
        await fallback.click();
        await wait(500);
        await driver.assertComponentExist(ON.text(ctx.resourceManager.getStringByNameSync('res_fallback')));
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_UiContract_0004 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_UiContract_0005
     * @tc.number SUB_CANVAS_UI_005
     * @tc.desc   Verify UI remains interactive 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_UiContract_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_UiContract_0005 begin');
      await wait(300);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await driver.findComponent(ON.text(ctx.resourceManager.getStringByNameSync('res_restart'))) !== null));
        expect(await driver.findComponent(ON.text(ctx.resourceManager.getStringByNameSync('res_restart'))) !== null).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await driver.findComponent(ON.text(ctx.resourceManager.getStringByNameSync('res_fallback'))) !== null));
        expect(await driver.findComponent(ON.text(ctx.resourceManager.getStringByNameSync('res_fallback'))) !== null).assertTrue();
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_UiContract_0005 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_UiContract_0006
     * @tc.number SUB_CANVAS_UI_006
     * @tc.desc   Verify UI remains interactive 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_UiContract_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_UiContract_0006 begin');
      await wait(300);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await driver.findComponent(ON.text(ctx.resourceManager.getStringByNameSync('res_restart'))) !== null));
        expect(await driver.findComponent(ON.text(ctx.resourceManager.getStringByNameSync('res_restart'))) !== null).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await driver.findComponent(ON.text(ctx.resourceManager.getStringByNameSync('res_fallback'))) !== null));
        expect(await driver.findComponent(ON.text(ctx.resourceManager.getStringByNameSync('res_fallback'))) !== null).assertTrue();
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_UiContract_0006 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_UiContract_0007
     * @tc.number SUB_CANVAS_UI_007
     * @tc.desc   Verify UI remains interactive 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_UiContract_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_UiContract_0007 begin');
      await wait(300);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await driver.findComponent(ON.text(ctx.resourceManager.getStringByNameSync('res_restart'))) !== null));
        expect(await driver.findComponent(ON.text(ctx.resourceManager.getStringByNameSync('res_restart'))) !== null).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await driver.findComponent(ON.text(ctx.resourceManager.getStringByNameSync('res_fallback'))) !== null));
        expect(await driver.findComponent(ON.text(ctx.resourceManager.getStringByNameSync('res_fallback'))) !== null).assertTrue();
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_UiContract_0007 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_UiContract_0008
     * @tc.number SUB_CANVAS_UI_008
     * @tc.desc   Verify UI remains interactive 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_UiContract_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_UiContract_0008 begin');
      await wait(300);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await driver.findComponent(ON.text(ctx.resourceManager.getStringByNameSync('res_restart'))) !== null));
        expect(await driver.findComponent(ON.text(ctx.resourceManager.getStringByNameSync('res_restart'))) !== null).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await driver.findComponent(ON.text(ctx.resourceManager.getStringByNameSync('res_fallback'))) !== null));
        expect(await driver.findComponent(ON.text(ctx.resourceManager.getStringByNameSync('res_fallback'))) !== null).assertTrue();
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_UiContract_0008 end');
    })
  })
}
