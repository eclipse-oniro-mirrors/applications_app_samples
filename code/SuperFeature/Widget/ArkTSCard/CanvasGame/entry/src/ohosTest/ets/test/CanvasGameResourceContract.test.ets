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
import { common, AbilityDelegatorRegistry } from '@kit.AbilityKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';
let ctx: common.Context = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();

export default function canvasGameResourceContractTest() {
  describe('CanvasGameResourceContractTest', () => {

    /**
     * @tc.name   testCanvasResource001
     * @tc.number SUB_CANVAS_RESOURCE_001
     * @tc.desc   Load the entry ability label resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasResource001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasResource001 begin');
      const v: string = ctx.resourceManager.getStringByNameSync('EntryAbility_label');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v.length > 0));
        expect(v.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v === 'EntryAbility_label'));
        expect(v === 'EntryAbility_label').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v), String(v.trim()));
        expect(v).assertEqual(v.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasResource001 end');
    })

    /**
     * @tc.name   testCanvasResource002
     * @tc.number SUB_CANVAS_RESOURCE_002
     * @tc.desc   Load the entry ability description resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasResource002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasResource002 begin');
      const v: string = ctx.resourceManager.getStringByNameSync('EntryAbility_desc');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v.length > 0));
        expect(v.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v === 'EntryAbility_desc'));
        expect(v === 'EntryAbility_desc').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v), String(v.trim()));
        expect(v).assertEqual(v.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasResource002 end');
    })

    /**
     * @tc.name   testCanvasResource003
     * @tc.number SUB_CANVAS_RESOURCE_003
     * @tc.desc   Load the form ability label resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasResource003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasResource003 begin');
      const v: string = ctx.resourceManager.getStringByNameSync('EntryFormAbility_label');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v.length > 0));
        expect(v.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v === 'EntryFormAbility_label'));
        expect(v === 'EntryFormAbility_label').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v), String(v.trim()));
        expect(v).assertEqual(v.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasResource003 end');
    })

    /**
     * @tc.name   testCanvasResource004
     * @tc.number SUB_CANVAS_RESOURCE_004
     * @tc.desc   Load the form ability description resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasResource004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasResource004 begin');
      const v: string = ctx.resourceManager.getStringByNameSync('EntryFormAbility_desc');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v.length > 0));
        expect(v.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v === 'EntryFormAbility_desc'));
        expect(v === 'EntryFormAbility_desc').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v), String(v.trim()));
        expect(v).assertEqual(v.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasResource004 end');
    })

    /**
     * @tc.name   testCanvasResource005
     * @tc.number SUB_CANVAS_RESOURCE_005
     * @tc.desc   Load the module description resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasResource005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasResource005 begin');
      const v: string = ctx.resourceManager.getStringByNameSync('module_desc');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v.length > 0));
        expect(v.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v === 'module_desc'));
        expect(v === 'module_desc').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v), String(v.trim()));
        expect(v).assertEqual(v.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasResource005 end');
    })

    /**
     * @tc.name   testCanvasResource006
     * @tc.number SUB_CANVAS_RESOURCE_006
     * @tc.desc   Load the restart button resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasResource006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasResource006 begin');
      const v: string = ctx.resourceManager.getStringByNameSync('res_restart');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v.length > 0));
        expect(v.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v === 'res_restart'));
        expect(v === 'res_restart').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v), String(v.trim()));
        expect(v).assertEqual(v.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasResource006 end');
    })

    /**
     * @tc.name   testCanvasResource007
     * @tc.number SUB_CANVAS_RESOURCE_007
     * @tc.desc   Load the fallback button resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasResource007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasResource007 begin');
      const v: string = ctx.resourceManager.getStringByNameSync('res_fallback');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v.length > 0));
        expect(v.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v === 'res_fallback'));
        expect(v === 'res_fallback').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v), String(v.trim()));
        expect(v).assertEqual(v.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasResource007 end');
    })

    /**
     * @tc.name   testCanvasResource008
     * @tc.number SUB_CANVAS_RESOURCE_008
     * @tc.desc   Load the application name resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasResource008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasResource008 begin');
      const v: string = ctx.resourceManager.getStringByNameSync('app_name');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v.length > 0));
        expect(v.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v === 'app_name'));
        expect(v === 'app_name').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v), String(v.trim()));
        expect(v).assertEqual(v.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasResource008 end');
    })

    /**
     * @tc.name   testCanvasResource009
     * @tc.number SUB_CANVAS_RESOURCE_009
     * @tc.desc   Load the add form button resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasResource009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasResource009 begin');
      const v: string = ctx.resourceManager.getStringByNameSync('AddForm');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v.length > 0));
        expect(v.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v === 'AddForm'));
        expect(v === 'AddForm').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v), String(v.trim()));
        expect(v).assertEqual(v.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasResource009 end');
    })

    /**
     * @tc.name   testCanvasResource010
     * @tc.number SUB_CANVAS_RESOURCE_010
     * @tc.desc   Load the card button resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasResource010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasResource010 begin');
      const v: string = ctx.resourceManager.getStringByNameSync('res_restart');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v.length > 0));
        expect(v.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v === 'res_restart'));
        expect(v === 'res_restart').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v), String(v.trim()));
        expect(v).assertEqual(v.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasResource010 end');
    })
  })
}
