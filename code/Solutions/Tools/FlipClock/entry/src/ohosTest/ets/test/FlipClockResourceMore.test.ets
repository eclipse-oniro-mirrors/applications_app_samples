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

export default function flipClockResourceMoreTest() {
  describe('FlipClockResourceMoreTest', () => {

    /**
     * @tc.name   testFlipClockResourceMore0001
     * @tc.number SUB_FLIP_CLOCK_MORE4_RES_0001
     * @tc.desc   Load the second tab resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResourceMore0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = ctx.resourceManager.getStringByNameSync('tab1'); expect(value.length > 0).assertTrue(); expect(value === 'tab1').assertFalse(); expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testFlipClockResourceMore0002
     * @tc.number SUB_FLIP_CLOCK_MORE4_RES_0002
     * @tc.desc   Load the third tab resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResourceMore0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = ctx.resourceManager.getStringByNameSync('tab2'); expect(value.length > 0).assertTrue(); expect(value === 'tab2').assertFalse(); expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testFlipClockResourceMore0003
     * @tc.number SUB_FLIP_CLOCK_MORE4_RES_0003
     * @tc.desc   Load the fourth tab resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResourceMore0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = ctx.resourceManager.getStringByNameSync('tab3'); expect(value.length > 0).assertTrue(); expect(value === 'tab3').assertFalse(); expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testFlipClockResourceMore0004
     * @tc.number SUB_FLIP_CLOCK_MORE4_RES_0004
     * @tc.desc   Load the setting title resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResourceMore0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = ctx.resourceManager.getStringByNameSync('setting'); expect(value.length > 0).assertTrue(); expect(value === 'setting').assertFalse(); expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testFlipClockResourceMore0005
     * @tc.number SUB_FLIP_CLOCK_MORE4_RES_0005
     * @tc.desc   Load the screen light resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResourceMore0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = ctx.resourceManager.getStringByNameSync('screenLight'); expect(value.length > 0).assertTrue(); expect(value === 'screenLight').assertFalse(); expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testFlipClockResourceMore0006
     * @tc.number SUB_FLIP_CLOCK_MORE4_RES_0006
     * @tc.desc   Load the sleep lock control resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResourceMore0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = ctx.resourceManager.getStringByNameSync('control_sleepLock'); expect(value.length > 0).assertTrue(); expect(value === 'control_sleepLock').assertFalse(); expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testFlipClockResourceMore0007
     * @tc.number SUB_FLIP_CLOCK_MORE4_RES_0007
     * @tc.desc   Load the sleep lock switch resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResourceMore0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = ctx.resourceManager.getStringByNameSync('sleepLockSwitch'); expect(value.length > 0).assertTrue(); expect(value === 'sleepLockSwitch').assertFalse(); expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testFlipClockResourceMore0008
     * @tc.number SUB_FLIP_CLOCK_MORE4_RES_0008
     * @tc.desc   Load the sleep lock hint resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResourceMore0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = ctx.resourceManager.getStringByNameSync('init_output'); expect(value.length > 0).assertTrue(); expect(value === 'init_output').assertFalse(); expect(value).assertEqual(value.trim());
    })
  })
}
