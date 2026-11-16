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
import { Driver, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
const BUNDLE='com.samples.canvasgame';
const DEL=AbilityDelegatorRegistry.getAbilityDelegator();
let driver: Driver; let ctx = DEL.getAppContext();
function wait(ms:number): Promise<void> { return new Promise<void>((resolve:()=>void)=>{ setTimeout(()=>{resolve();},ms); }); }

export default function canvasGameUiContractTest() {
  describe('CanvasGameUiContractTest', () => {
    beforeAll(async () => { const want: Want = { bundleName: BUNDLE, abilityName: 'EntryAbility' }; await DEL.startAbility(want); await wait(2000); driver = await Driver.create(); })

    /**
     * @tc.name   testCanvasUiStart001
     * @tc.number SUB_CANVAS_UI_001
     * @tc.desc   Launch CanvasGame and verify restart button.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasUiStart001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const restart: string = ctx.resourceManager.getStringByNameSync('res_restart'); await driver.assertComponentExist(ON.text(restart)); expect(restart.length > 0).assertTrue();
      await Promise.resolve();
    })

    /**
     * @tc.name   testCanvasUiFallback002
     * @tc.number SUB_CANVAS_UI_002
     * @tc.desc   Verify fallback button exists.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasUiFallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const fallback: string = ctx.resourceManager.getStringByNameSync('res_fallback'); await driver.assertComponentExist(ON.text(fallback)); expect(fallback.length > 0).assertTrue();
      await Promise.resolve();
    })

    /**
     * @tc.name   testCanvasUiRestart003
     * @tc.number SUB_CANVAS_UI_003
     * @tc.desc   Click restart and keep the page available.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasUiRestart003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const restart = await driver.findComponent(ON.text(ctx.resourceManager.getStringByNameSync('res_restart'))); await restart.click(); await wait(500); await driver.assertComponentExist(ON.text(ctx.resourceManager.getStringByNameSync('res_restart')));
      await Promise.resolve();
    })

    /**
     * @tc.name   testCanvasUiFallback004
     * @tc.number SUB_CANVAS_UI_004
     * @tc.desc   Click fallback and keep the page available.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasUiFallback004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const fallback = await driver.findComponent(ON.text(ctx.resourceManager.getStringByNameSync('res_fallback'))); await fallback.click(); await wait(500); await driver.assertComponentExist(ON.text(ctx.resourceManager.getStringByNameSync('res_fallback')));
      await Promise.resolve();
    })

    /**
     * @tc.name   testCanvasUiRepeat005
     * @tc.number SUB_CANVAS_UI_005
     * @tc.desc   Verify UI remains interactive 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasUiRepeat005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await wait(300); expect(await driver.findComponent(ON.text(ctx.resourceManager.getStringByNameSync('res_restart'))) !== null).assertTrue(); expect(await driver.findComponent(ON.text(ctx.resourceManager.getStringByNameSync('res_fallback'))) !== null).assertTrue();
      await Promise.resolve();
    })

    /**
     * @tc.name   testCanvasUiRepeat006
     * @tc.number SUB_CANVAS_UI_006
     * @tc.desc   Verify UI remains interactive 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasUiRepeat006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await wait(300); expect(await driver.findComponent(ON.text(ctx.resourceManager.getStringByNameSync('res_restart'))) !== null).assertTrue(); expect(await driver.findComponent(ON.text(ctx.resourceManager.getStringByNameSync('res_fallback'))) !== null).assertTrue();
      await Promise.resolve();
    })

    /**
     * @tc.name   testCanvasUiRepeat007
     * @tc.number SUB_CANVAS_UI_007
     * @tc.desc   Verify UI remains interactive 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasUiRepeat007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await wait(300); expect(await driver.findComponent(ON.text(ctx.resourceManager.getStringByNameSync('res_restart'))) !== null).assertTrue(); expect(await driver.findComponent(ON.text(ctx.resourceManager.getStringByNameSync('res_fallback'))) !== null).assertTrue();
      await Promise.resolve();
    })

    /**
     * @tc.name   testCanvasUiRepeat008
     * @tc.number SUB_CANVAS_UI_008
     * @tc.desc   Verify UI remains interactive 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasUiRepeat008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await wait(300); expect(await driver.findComponent(ON.text(ctx.resourceManager.getStringByNameSync('res_restart'))) !== null).assertTrue(); expect(await driver.findComponent(ON.text(ctx.resourceManager.getStringByNameSync('res_fallback'))) !== null).assertTrue();
      await Promise.resolve();
    })
  })
}
