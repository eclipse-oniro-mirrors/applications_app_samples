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
import { Driver, ON } from '@kit.TestKit';
import { AbilityDelegatorRegistry } from '@kit.AbilityKit';
import { Want } from '@kit.AbilityKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';
const B='com.samples.canvasgame';
  const D=AbilityDelegatorRegistry.getAbilityDelegator();
  let drv: Driver;
  let c= D.getAppContext();
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
     * @tc.name   testCanvasExtraUi001
     * @tc.number SUB_CANVAS_EXTRA_UI_001
     * @tc.desc   Verify t.length is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraUi001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraUi001 begin');
      const t: string = c.resourceManager.getStringByNameSync('res_restart');
        await drv.assertComponentExist(ON.text(t));
        const btn = await drv.findComponent(ON.text(t));
        await btn.click();
        await w(300);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(t.length > 0));
        expect(t.length > 0).assertTrue();
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraUi001 end');
    })

    /**
     * @tc.name   testCanvasExtraUi002
     * @tc.number SUB_CANVAS_EXTRA_UI_002
     * @tc.desc   Verify t.length is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraUi002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraUi002 begin');
      const t: string = c.resourceManager.getStringByNameSync('res_fallback');
        await drv.assertComponentExist(ON.text(t));
        const btn = await drv.findComponent(ON.text(t));
        await btn.click();
        await w(300);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(t.length > 0));
        expect(t.length > 0).assertTrue();
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraUi002 end');
    })

    /**
     * @tc.name   testCanvasExtraUi003
     * @tc.number SUB_CANVAS_EXTRA_UI_003
     * @tc.desc   Verify t.length is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraUi003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraUi003 begin');
      const t: string = c.resourceManager.getStringByNameSync('res_restart');
        await drv.assertComponentExist(ON.text(t));
        const btn = await drv.findComponent(ON.text(t));
        await btn.click();
        await w(300);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(t.length > 0));
        expect(t.length > 0).assertTrue();
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraUi003 end');
    })

    /**
     * @tc.name   testCanvasExtraUi004
     * @tc.number SUB_CANVAS_EXTRA_UI_004
     * @tc.desc   Verify t.length is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraUi004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraUi004 begin');
      const t: string = c.resourceManager.getStringByNameSync('res_fallback');
        await drv.assertComponentExist(ON.text(t));
        const btn = await drv.findComponent(ON.text(t));
        await btn.click();
        await w(300);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(t.length > 0));
        expect(t.length > 0).assertTrue();
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraUi004 end');
    })

    /**
     * @tc.name   testCanvasExtraUi005
     * @tc.number SUB_CANVAS_EXTRA_UI_005
     * @tc.desc   Verify t.length is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraUi005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraUi005 begin');
      const t: string = c.resourceManager.getStringByNameSync('res_restart');
        await drv.assertComponentExist(ON.text(t));
        const btn = await drv.findComponent(ON.text(t));
        await btn.click();
        await w(300);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(t.length > 0));
        expect(t.length > 0).assertTrue();
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraUi005 end');
    })

    /**
     * @tc.name   testCanvasExtraUi006
     * @tc.number SUB_CANVAS_EXTRA_UI_006
     * @tc.desc   Verify t.length is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraUi006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraUi006 begin');
      const t: string = c.resourceManager.getStringByNameSync('res_fallback');
        await drv.assertComponentExist(ON.text(t));
        const btn = await drv.findComponent(ON.text(t));
        await btn.click();
        await w(300);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(t.length > 0));
        expect(t.length > 0).assertTrue();
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraUi006 end');
    })

    /**
     * @tc.name   testCanvasExtraUi007
     * @tc.number SUB_CANVAS_EXTRA_UI_007
     * @tc.desc   Verify t.length is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraUi007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraUi007 begin');
      const t: string = c.resourceManager.getStringByNameSync('res_restart');
        await drv.assertComponentExist(ON.text(t));
        const btn = await drv.findComponent(ON.text(t));
        await btn.click();
        await w(300);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(t.length > 0));
        expect(t.length > 0).assertTrue();
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraUi007 end');
    })

    /**
     * @tc.name   testCanvasExtraUi008
     * @tc.number SUB_CANVAS_EXTRA_UI_008
     * @tc.desc   Verify t.length is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraUi008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraUi008 begin');
      const t: string = c.resourceManager.getStringByNameSync('res_fallback');
        await drv.assertComponentExist(ON.text(t));
        const btn = await drv.findComponent(ON.text(t));
        await btn.click();
        await w(300);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(t.length > 0));
        expect(t.length > 0).assertTrue();
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasExtraUi008 end');
    })
  })
}
