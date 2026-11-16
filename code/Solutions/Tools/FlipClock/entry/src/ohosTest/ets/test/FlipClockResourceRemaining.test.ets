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

export default function flipClockResourceRemainingTest() {
  describe('FlipClockResourceRemainingTest', () => {

    /**
     * @tc.name   testFlipClockResourceRemain0001
     * @tc.number SUB_FLIP_CLOCK_MORE5_RES_0001
     * @tc.desc   Load the support lock resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResourceRemain0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: string = ctx.resourceManager.getStringByNameSync('supportLock'); expect(v.length > 0).assertTrue(); expect(v === 'supportLock').assertFalse(); expect(v).assertEqual(v.trim());
    })

    /**
     * @tc.name   testFlipClockResourceRemain0002
     * @tc.number SUB_FLIP_CLOCK_MORE5_RES_0002
     * @tc.desc   Load the unsupported lock resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResourceRemain0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: string = ctx.resourceManager.getStringByNameSync('unsupportLock'); expect(v.length > 0).assertTrue(); expect(v === 'unsupportLock').assertFalse(); expect(v).assertEqual(v.trim());
    })

    /**
     * @tc.name   testFlipClockResourceRemain0003
     * @tc.number SUB_FLIP_CLOCK_MORE5_RES_0003
     * @tc.desc   Load the stop sleep resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResourceRemain0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: string = ctx.resourceManager.getStringByNameSync('stopSleep'); expect(v.length > 0).assertTrue(); expect(v === 'stopSleep').assertFalse(); expect(v).assertEqual(v.trim());
    })

    /**
     * @tc.name   testFlipClockResourceRemain0004
     * @tc.number SUB_FLIP_CLOCK_MORE5_RES_0004
     * @tc.desc   Load the turn sleep resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResourceRemain0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: string = ctx.resourceManager.getStringByNameSync('turnSleep'); expect(v.length > 0).assertTrue(); expect(v === 'turnSleep').assertFalse(); expect(v).assertEqual(v.trim());
    })

    /**
     * @tc.name   testFlipClockResourceRemain0005
     * @tc.number SUB_FLIP_CLOCK_MORE5_RES_0005
     * @tc.desc   Load the screen quenching resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResourceRemain0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: string = ctx.resourceManager.getStringByNameSync('screen_quenching'); expect(v.length > 0).assertTrue(); expect(v === 'screen_quenching').assertFalse(); expect(v).assertEqual(v.trim());
    })

    /**
     * @tc.name   testFlipClockResourceRemain0006
     * @tc.number SUB_FLIP_CLOCK_MORE5_RES_0006
     * @tc.desc   Load the entry main ability resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResourceRemain0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: string = ctx.resourceManager.getStringByNameSync('entry_MainAbility'); expect(v.length > 0).assertTrue(); expect(v === 'entry_MainAbility').assertFalse(); expect(v).assertEqual(v.trim());
    })

    /**
     * @tc.name   testFlipClockResourceRemain0007
     * @tc.number SUB_FLIP_CLOCK_MORE5_RES_0007
     * @tc.desc   Load the main ability description resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResourceRemain0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: string = ctx.resourceManager.getStringByNameSync('description_mainability'); expect(v.length > 0).assertTrue(); expect(v === 'description_mainability').assertFalse(); expect(v).assertEqual(v.trim());
    })

    /**
     * @tc.name   testFlipClockResourceRemain0008
     * @tc.number SUB_FLIP_CLOCK_MORE5_RES_0008
     * @tc.desc   Load the setting title resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResourceRemain0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: string = ctx.resourceManager.getStringByNameSync('setting'); expect(v.length > 0).assertTrue(); expect(v === 'setting').assertFalse(); expect(v).assertEqual(v.trim());
    })
  })
}
