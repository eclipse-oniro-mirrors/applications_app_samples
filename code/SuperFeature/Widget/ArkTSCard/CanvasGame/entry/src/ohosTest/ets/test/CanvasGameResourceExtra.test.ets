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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
let ctx = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();

export default function canvasGameResourceExtraTest() {
  describe('CanvasGameResourceExtraTest', () => {

    /**
     * @tc.name   testCanvasExtraResource001
     * @tc.number SUB_CANVAS_EXTRA_RES_001
     * @tc.desc   Verify resource EntryAbility_label.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraResource001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: string = ctx.resourceManager.getStringByNameSync('EntryAbility_label'); expect(v.length > 0).assertTrue(); expect(v === 'EntryAbility_label').assertFalse(); expect(v).assertEqual(v.trim());
    })

    /**
     * @tc.name   testCanvasExtraResource002
     * @tc.number SUB_CANVAS_EXTRA_RES_002
     * @tc.desc   Verify resource EntryAbility_desc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraResource002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: string = ctx.resourceManager.getStringByNameSync('EntryAbility_desc'); expect(v.length > 0).assertTrue(); expect(v === 'EntryAbility_desc').assertFalse(); expect(v).assertEqual(v.trim());
    })

    /**
     * @tc.name   testCanvasExtraResource003
     * @tc.number SUB_CANVAS_EXTRA_RES_003
     * @tc.desc   Verify resource EntryFormAbility_label.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraResource003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: string = ctx.resourceManager.getStringByNameSync('EntryFormAbility_label'); expect(v.length > 0).assertTrue(); expect(v === 'EntryFormAbility_label').assertFalse(); expect(v).assertEqual(v.trim());
    })

    /**
     * @tc.name   testCanvasExtraResource004
     * @tc.number SUB_CANVAS_EXTRA_RES_004
     * @tc.desc   Verify resource EntryFormAbility_desc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraResource004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: string = ctx.resourceManager.getStringByNameSync('EntryFormAbility_desc'); expect(v.length > 0).assertTrue(); expect(v === 'EntryFormAbility_desc').assertFalse(); expect(v).assertEqual(v.trim());
    })

    /**
     * @tc.name   testCanvasExtraResource005
     * @tc.number SUB_CANVAS_EXTRA_RES_005
     * @tc.desc   Verify resource module_desc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraResource005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: string = ctx.resourceManager.getStringByNameSync('module_desc'); expect(v.length > 0).assertTrue(); expect(v === 'module_desc').assertFalse(); expect(v).assertEqual(v.trim());
    })

    /**
     * @tc.name   testCanvasExtraResource006
     * @tc.number SUB_CANVAS_EXTRA_RES_006
     * @tc.desc   Verify resource res_restart.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraResource006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: string = ctx.resourceManager.getStringByNameSync('res_restart'); expect(v.length > 0).assertTrue(); expect(v === 'res_restart').assertFalse(); expect(v).assertEqual(v.trim());
    })

    /**
     * @tc.name   testCanvasExtraResource007
     * @tc.number SUB_CANVAS_EXTRA_RES_007
     * @tc.desc   Verify resource res_fallback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraResource007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: string = ctx.resourceManager.getStringByNameSync('res_fallback'); expect(v.length > 0).assertTrue(); expect(v === 'res_fallback').assertFalse(); expect(v).assertEqual(v.trim());
    })

    /**
     * @tc.name   testCanvasExtraResource008
     * @tc.number SUB_CANVAS_EXTRA_RES_008
     * @tc.desc   Verify resource app_name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraResource008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: string = ctx.resourceManager.getStringByNameSync('app_name'); expect(v.length > 0).assertTrue(); expect(v === 'app_name').assertFalse(); expect(v).assertEqual(v.trim());
    })
  })
}
