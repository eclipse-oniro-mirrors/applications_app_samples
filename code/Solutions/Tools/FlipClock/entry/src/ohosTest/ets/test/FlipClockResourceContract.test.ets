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
let appContext = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();

export default function flipClockResourceContractTest() {
  describe('FlipClockResourceContractTest', () => {

    /**
     * @tc.name   testFlipClockResource001
     * @tc.number SUB_FLIP_CLOCK_RESOURCE_001
     * @tc.desc   Load the alarm clock title resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResource001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = appContext.resourceManager.getStringByNameSync('alarmClock'); expect(value.length > 0).assertTrue(); expect(value === 'alarmClock').assertFalse(); expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testFlipClockResource002
     * @tc.number SUB_FLIP_CLOCK_RESOURCE_002
     * @tc.desc   Load the delete label resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResource002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = appContext.resourceManager.getStringByNameSync('delete'); expect(value.length > 0).assertTrue(); expect(value === 'delete').assertFalse(); expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testFlipClockResource003
     * @tc.number SUB_FLIP_CLOCK_RESOURCE_003
     * @tc.desc   Load the hour label resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResource003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = appContext.resourceManager.getStringByNameSync('hour'); expect(value.length > 0).assertTrue(); expect(value === 'hour').assertFalse(); expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testFlipClockResource004
     * @tc.number SUB_FLIP_CLOCK_RESOURCE_004
     * @tc.desc   Load the minute label resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResource004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = appContext.resourceManager.getStringByNameSync('minute'); expect(value.length > 0).assertTrue(); expect(value === 'minute').assertFalse(); expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testFlipClockResource005
     * @tc.number SUB_FLIP_CLOCK_RESOURCE_005
     * @tc.desc   Load the seconds label resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResource005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = appContext.resourceManager.getStringByNameSync('seconds'); expect(value.length > 0).assertTrue(); expect(value === 'seconds').assertFalse(); expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testFlipClockResource006
     * @tc.number SUB_FLIP_CLOCK_RESOURCE_006
     * @tc.desc   Load the yes label resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResource006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = appContext.resourceManager.getStringByNameSync('yes'); expect(value.length > 0).assertTrue(); expect(value === 'yes').assertFalse(); expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testFlipClockResource007
     * @tc.number SUB_FLIP_CLOCK_RESOURCE_007
     * @tc.desc   Load the no label resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResource007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = appContext.resourceManager.getStringByNameSync('no'); expect(value.length > 0).assertTrue(); expect(value === 'no').assertFalse(); expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testFlipClockResource008
     * @tc.number SUB_FLIP_CLOCK_RESOURCE_008
     * @tc.desc   Load the full screen label resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResource008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = appContext.resourceManager.getStringByNameSync('fullScreen'); expect(value.length > 0).assertTrue(); expect(value === 'fullScreen').assertFalse(); expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testFlipClockResource009
     * @tc.number SUB_FLIP_CLOCK_RESOURCE_009
     * @tc.desc   Load the brightness label resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResource009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = appContext.resourceManager.getStringByNameSync('brightness'); expect(value.length > 0).assertTrue(); expect(value === 'brightness').assertFalse(); expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testFlipClockResource010
     * @tc.number SUB_FLIP_CLOCK_RESOURCE_010
     * @tc.desc   Load the first tab label resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResource010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = appContext.resourceManager.getStringByNameSync('tab0'); expect(value.length > 0).assertTrue(); expect(value === 'tab0').assertFalse(); expect(value).assertEqual(value.trim());
    })
  })
}
