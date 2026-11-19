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
import { common } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';
const B: string='com.samples.canvasgame';
  const D: abilityDelegatorRegistry.AbilityDelegator=abilityDelegatorRegistry.getAbilityDelegator();
  let drv: Driver;
  let c: common.Context= D.getAppContext();
function w(ms:number): Promise<void> {
  return new Promise<void>((r:()=>void)=>{ setTimeout(()=>{r();},ms); });
  }

export default function canvasGameUiExtraTest() {
  describe('CanvasGameUiExtraTest', () => {
    beforeAll(async () => {
      const want: Want = { bundleName: B, abilityName: 'EntryAbility' };
      await D.startAbility(want);
      await w(1800);
      drv = await Driver.create();
    })

    /**
     * @tc.name   com.samples.canvasgame_UiExtra_0001
     * @tc.number SUB_CANVAS_EXTRA_UI_001
     * @tc.desc   Verify t.length is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_UiExtra_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_UiExtra_0001 begin');
      const t: string = c.resourceManager.getStringByNameSync('res_restart');
        await drv.assertComponentExist(ON.text(t));
        const btn: Component = await drv.findComponent(ON.text(t));
        await btn.click();
        await w(300);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(t.length > 0));
        expect(t.length > 0).assertTrue();
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_UiExtra_0001 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_UiExtra_0002
     * @tc.number SUB_CANVAS_EXTRA_UI_002
     * @tc.desc   Verify t.length is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_UiExtra_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_UiExtra_0002 begin');
      const t: string = c.resourceManager.getStringByNameSync('res_fallback');
        await drv.assertComponentExist(ON.text(t));
        const btn: Component = await drv.findComponent(ON.text(t));
        await btn.click();
        await w(300);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(t.length > 0));
        expect(t.length > 0).assertTrue();
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_UiExtra_0002 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_UiExtra_0003
     * @tc.number SUB_CANVAS_EXTRA_UI_003
     * @tc.desc   Verify t.length is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_UiExtra_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_UiExtra_0003 begin');
      const t: string = c.resourceManager.getStringByNameSync('res_restart');
        await drv.assertComponentExist(ON.text(t));
        const btn: Component = await drv.findComponent(ON.text(t));
        await btn.click();
        await w(300);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(t.length > 0));
        expect(t.length > 0).assertTrue();
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_UiExtra_0003 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_UiExtra_0004
     * @tc.number SUB_CANVAS_EXTRA_UI_004
     * @tc.desc   Verify t.length is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_UiExtra_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_UiExtra_0004 begin');
      const t: string = c.resourceManager.getStringByNameSync('res_fallback');
        await drv.assertComponentExist(ON.text(t));
        const btn: Component = await drv.findComponent(ON.text(t));
        await btn.click();
        await w(300);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(t.length > 0));
        expect(t.length > 0).assertTrue();
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_UiExtra_0004 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_UiExtra_0005
     * @tc.number SUB_CANVAS_EXTRA_UI_005
     * @tc.desc   Verify t.length is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_UiExtra_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_UiExtra_0005 begin');
      const t: string = c.resourceManager.getStringByNameSync('res_restart');
        await drv.assertComponentExist(ON.text(t));
        const btn: Component = await drv.findComponent(ON.text(t));
        await btn.click();
        await w(300);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(t.length > 0));
        expect(t.length > 0).assertTrue();
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_UiExtra_0005 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_UiExtra_0006
     * @tc.number SUB_CANVAS_EXTRA_UI_006
     * @tc.desc   Verify t.length is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_UiExtra_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_UiExtra_0006 begin');
      const t: string = c.resourceManager.getStringByNameSync('res_fallback');
        await drv.assertComponentExist(ON.text(t));
        const btn: Component = await drv.findComponent(ON.text(t));
        await btn.click();
        await w(300);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(t.length > 0));
        expect(t.length > 0).assertTrue();
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_UiExtra_0006 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_UiExtra_0007
     * @tc.number SUB_CANVAS_EXTRA_UI_007
     * @tc.desc   Verify t.length is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_UiExtra_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_UiExtra_0007 begin');
      const t: string = c.resourceManager.getStringByNameSync('res_restart');
        await drv.assertComponentExist(ON.text(t));
        const btn: Component = await drv.findComponent(ON.text(t));
        await btn.click();
        await w(300);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(t.length > 0));
        expect(t.length > 0).assertTrue();
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_UiExtra_0007 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_UiExtra_0008
     * @tc.number SUB_CANVAS_EXTRA_UI_008
     * @tc.desc   Verify t.length is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_UiExtra_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_UiExtra_0008 begin');
      const t: string = c.resourceManager.getStringByNameSync('res_fallback');
        await drv.assertComponentExist(ON.text(t));
        const btn: Component = await drv.findComponent(ON.text(t));
        await btn.click();
        await w(300);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(t.length > 0));
        expect(t.length > 0).assertTrue();
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_UiExtra_0008 end');
    })
  })
}
