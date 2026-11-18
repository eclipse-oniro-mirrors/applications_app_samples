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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { common } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';
let ctx: common.Context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();

export default function canvasGameResourceExtraTest() {
  describe('CanvasGameResourceExtraTest', () => {

    /**
     * @tc.name   com.samples.canvasgame_ResourceExtra_0001
     * @tc.number SUB_CANVAS_EXTRA_RES_001
     * @tc.desc   Verify resource EntryAbility_label.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_ResourceExtra_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ResourceExtra_0001 begin');
      const v: string = ctx.resourceManager.getStringByNameSync('EntryAbility_label');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v.length > 0));
        expect(v.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v === 'EntryAbility_label'));
        expect(v === 'EntryAbility_label').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v), String(v.trim()));
        expect(v).assertEqual(v.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ResourceExtra_0001 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_ResourceExtra_0002
     * @tc.number SUB_CANVAS_EXTRA_RES_002
     * @tc.desc   Verify resource EntryAbility_desc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_ResourceExtra_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ResourceExtra_0002 begin');
      const v: string = ctx.resourceManager.getStringByNameSync('EntryAbility_desc');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v.length > 0));
        expect(v.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v === 'EntryAbility_desc'));
        expect(v === 'EntryAbility_desc').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v), String(v.trim()));
        expect(v).assertEqual(v.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ResourceExtra_0002 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_ResourceExtra_0003
     * @tc.number SUB_CANVAS_EXTRA_RES_003
     * @tc.desc   Verify resource EntryFormAbility_label.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_ResourceExtra_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ResourceExtra_0003 begin');
      const v: string = ctx.resourceManager.getStringByNameSync('EntryFormAbility_label');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v.length > 0));
        expect(v.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v === 'EntryFormAbility_label'));
        expect(v === 'EntryFormAbility_label').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v), String(v.trim()));
        expect(v).assertEqual(v.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ResourceExtra_0003 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_ResourceExtra_0004
     * @tc.number SUB_CANVAS_EXTRA_RES_004
     * @tc.desc   Verify resource EntryFormAbility_desc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_ResourceExtra_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ResourceExtra_0004 begin');
      const v: string = ctx.resourceManager.getStringByNameSync('EntryFormAbility_desc');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v.length > 0));
        expect(v.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v === 'EntryFormAbility_desc'));
        expect(v === 'EntryFormAbility_desc').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v), String(v.trim()));
        expect(v).assertEqual(v.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ResourceExtra_0004 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_ResourceExtra_0005
     * @tc.number SUB_CANVAS_EXTRA_RES_005
     * @tc.desc   Verify resource module_desc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_ResourceExtra_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ResourceExtra_0005 begin');
      const v: string = ctx.resourceManager.getStringByNameSync('module_desc');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v.length > 0));
        expect(v.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v === 'module_desc'));
        expect(v === 'module_desc').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v), String(v.trim()));
        expect(v).assertEqual(v.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ResourceExtra_0005 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_ResourceExtra_0006
     * @tc.number SUB_CANVAS_EXTRA_RES_006
     * @tc.desc   Verify resource res_restart.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_ResourceExtra_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ResourceExtra_0006 begin');
      const v: string = ctx.resourceManager.getStringByNameSync('res_restart');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v.length > 0));
        expect(v.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v === 'res_restart'));
        expect(v === 'res_restart').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v), String(v.trim()));
        expect(v).assertEqual(v.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ResourceExtra_0006 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_ResourceExtra_0007
     * @tc.number SUB_CANVAS_EXTRA_RES_007
     * @tc.desc   Verify resource res_fallback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_ResourceExtra_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ResourceExtra_0007 begin');
      const v: string = ctx.resourceManager.getStringByNameSync('res_fallback');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v.length > 0));
        expect(v.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v === 'res_fallback'));
        expect(v === 'res_fallback').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v), String(v.trim()));
        expect(v).assertEqual(v.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ResourceExtra_0007 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_ResourceExtra_0008
     * @tc.number SUB_CANVAS_EXTRA_RES_008
     * @tc.desc   Verify resource app_name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_ResourceExtra_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ResourceExtra_0008 begin');
      const v: string = ctx.resourceManager.getStringByNameSync('app_name');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v.length > 0));
        expect(v.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v === 'app_name'));
        expect(v === 'app_name').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v), String(v.trim()));
        expect(v).assertEqual(v.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ResourceExtra_0008 end');
    })
  })
}
