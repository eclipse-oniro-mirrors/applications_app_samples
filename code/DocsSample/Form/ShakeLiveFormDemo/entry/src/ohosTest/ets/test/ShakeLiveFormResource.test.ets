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
import { abilityDelegatorRegistry } from '@kit.TestKit';
let ctx = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();

export default function shakeLiveFormResourceTest() {
  describe('ShakeLiveFormResourceTest', () => {

    /**
     * @tc.name   testShakeResource001
     * @tc.number SUB_SHAKE_RESOURCE_001
     * @tc.desc   Load resource module_desc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeResource001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: string = ctx.resourceManager.getStringByNameSync('module_desc'); expect(v.length > 0).assertTrue(); expect(v === 'module_desc').assertFalse(); expect(v).assertEqual(v.trim());
    })

    /**
     * @tc.name   testShakeResource002
     * @tc.number SUB_SHAKE_RESOURCE_002
     * @tc.desc   Load resource EntryAbility_desc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeResource002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: string = ctx.resourceManager.getStringByNameSync('EntryAbility_desc'); expect(v.length > 0).assertTrue(); expect(v === 'EntryAbility_desc').assertFalse(); expect(v).assertEqual(v.trim());
    })

    /**
     * @tc.name   testShakeResource003
     * @tc.number SUB_SHAKE_RESOURCE_003
     * @tc.desc   Load resource EntryAbility_label.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeResource003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: string = ctx.resourceManager.getStringByNameSync('EntryAbility_label'); expect(v.length > 0).assertTrue(); expect(v === 'EntryAbility_label').assertFalse(); expect(v).assertEqual(v.trim());
    })

    /**
     * @tc.name   testShakeResource004
     * @tc.number SUB_SHAKE_RESOURCE_004
     * @tc.desc   Load resource EntryFormAbility_desc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeResource004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: string = ctx.resourceManager.getStringByNameSync('EntryFormAbility_desc'); expect(v.length > 0).assertTrue(); expect(v === 'EntryFormAbility_desc').assertFalse(); expect(v).assertEqual(v.trim());
    })

    /**
     * @tc.name   testShakeResource005
     * @tc.number SUB_SHAKE_RESOURCE_005
     * @tc.desc   Load resource EntryFormAbility_label.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeResource005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: string = ctx.resourceManager.getStringByNameSync('EntryFormAbility_label'); expect(v.length > 0).assertTrue(); expect(v === 'EntryFormAbility_label').assertFalse(); expect(v).assertEqual(v.trim());
    })

    /**
     * @tc.name   testShakeResource006
     * @tc.number SUB_SHAKE_RESOURCE_006
     * @tc.desc   Load resource demoCard_desc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeResource006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: string = ctx.resourceManager.getStringByNameSync('demoCard_desc'); expect(v.length > 0).assertTrue(); expect(v === 'demoCard_desc').assertFalse(); expect(v).assertEqual(v.trim());
    })

    /**
     * @tc.name   testShakeResource007
     * @tc.number SUB_SHAKE_RESOURCE_007
     * @tc.desc   Load resource demoCard_display_name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeResource007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: string = ctx.resourceManager.getStringByNameSync('demoCard_display_name'); expect(v.length > 0).assertTrue(); expect(v === 'demoCard_display_name').assertFalse(); expect(v).assertEqual(v.trim());
    })

    /**
     * @tc.name   testShakeResource008
     * @tc.number SUB_SHAKE_RESOURCE_008
     * @tc.desc   Load resource app_name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeResource008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: string = ctx.resourceManager.getStringByNameSync('app_name'); expect(v.length > 0).assertTrue(); expect(v === 'app_name').assertFalse(); expect(v).assertEqual(v.trim());
    })
  })
}
