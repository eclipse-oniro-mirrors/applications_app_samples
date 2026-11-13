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
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
const BUNDLE_NAME: string = 'com.example.movingphotoviewsample';
const DELEGATOR = abilityDelegatorRegistry.getAbilityDelegator();
function delay(ms: number): Promise<void> { return new Promise<void>((resolve: () => void) => { setTimeout(() => { resolve(); }, ms); }); }
export default function movingPhotoUiContractTest() {
  describe('MovingPhotoUiContractTest', () => {
    let driver: Driver;
    beforeAll(async () => { const want: Want = { bundleName: BUNDLE_NAME, abilityName: 'EntryAbility' }; await DELEGATOR.startAbility(want); await delay(2500); driver = await Driver.create(); })

    /**
     * @tc.name   testUiContract0001
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0001
     * @tc.desc   Test UI contract case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('PLAY')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0002
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0002
     * @tc.desc   Test UI contract case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('STOP')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0003
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0003
     * @tc.desc   Test UI contract case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0004
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0004
     * @tc.desc   Test UI contract case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u53d6\u6d88\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0005
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0005
     * @tc.desc   Test UI contract case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u52a8\u6001\u7167\u7247\u5df2\u52a0\u8f7d\uff0c\u957f\u6309\u53ef\u64ad\u653e')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0006
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0006
     * @tc.desc   Test UI contract case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('PLAY')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0007
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0007
     * @tc.desc   Test UI contract case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('STOP')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0008
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0008
     * @tc.desc   Test UI contract case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0009
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0009
     * @tc.desc   Test UI contract case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u53d6\u6d88\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0010
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0010
     * @tc.desc   Test UI contract case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u52a8\u6001\u7167\u7247\u5df2\u52a0\u8f7d\uff0c\u957f\u6309\u53ef\u64ad\u653e')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0011
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0011
     * @tc.desc   Test UI contract case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('PLAY')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0012
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0012
     * @tc.desc   Test UI contract case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('STOP')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0013
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0013
     * @tc.desc   Test UI contract case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0014
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0014
     * @tc.desc   Test UI contract case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u53d6\u6d88\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0015
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0015
     * @tc.desc   Test UI contract case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u52a8\u6001\u7167\u7247\u5df2\u52a0\u8f7d\uff0c\u957f\u6309\u53ef\u64ad\u653e')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0016
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0016
     * @tc.desc   Test UI contract case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('PLAY')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0017
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0017
     * @tc.desc   Test UI contract case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('STOP')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0018
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0018
     * @tc.desc   Test UI contract case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0019
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0019
     * @tc.desc   Test UI contract case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u53d6\u6d88\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0020
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0020
     * @tc.desc   Test UI contract case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u52a8\u6001\u7167\u7247\u5df2\u52a0\u8f7d\uff0c\u957f\u6309\u53ef\u64ad\u653e')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0021
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0021
     * @tc.desc   Test UI contract case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('PLAY')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0022
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0022
     * @tc.desc   Test UI contract case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('STOP')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0023
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0023
     * @tc.desc   Test UI contract case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0024
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0024
     * @tc.desc   Test UI contract case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u53d6\u6d88\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0025
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0025
     * @tc.desc   Test UI contract case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u52a8\u6001\u7167\u7247\u5df2\u52a0\u8f7d\uff0c\u957f\u6309\u53ef\u64ad\u653e')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0026
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0026
     * @tc.desc   Test UI contract case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('PLAY')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0027
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0027
     * @tc.desc   Test UI contract case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('STOP')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0028
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0028
     * @tc.desc   Test UI contract case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0029
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0029
     * @tc.desc   Test UI contract case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u53d6\u6d88\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0030
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0030
     * @tc.desc   Test UI contract case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u52a8\u6001\u7167\u7247\u5df2\u52a0\u8f7d\uff0c\u957f\u6309\u53ef\u64ad\u653e')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0031
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0031
     * @tc.desc   Test UI contract case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('PLAY')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0032
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0032
     * @tc.desc   Test UI contract case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('STOP')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0033
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0033
     * @tc.desc   Test UI contract case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0034
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0034
     * @tc.desc   Test UI contract case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u53d6\u6d88\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0035
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0035
     * @tc.desc   Test UI contract case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u52a8\u6001\u7167\u7247\u5df2\u52a0\u8f7d\uff0c\u957f\u6309\u53ef\u64ad\u653e')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0036
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0036
     * @tc.desc   Test UI contract case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('PLAY')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0037
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0037
     * @tc.desc   Test UI contract case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('STOP')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0038
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0038
     * @tc.desc   Test UI contract case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0039
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0039
     * @tc.desc   Test UI contract case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u53d6\u6d88\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0040
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0040
     * @tc.desc   Test UI contract case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u52a8\u6001\u7167\u7247\u5df2\u52a0\u8f7d\uff0c\u957f\u6309\u53ef\u64ad\u653e')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0041
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0041
     * @tc.desc   Test UI contract case 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('PLAY')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0042
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0042
     * @tc.desc   Test UI contract case 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('STOP')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0043
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0043
     * @tc.desc   Test UI contract case 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0044
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0044
     * @tc.desc   Test UI contract case 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u53d6\u6d88\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0045
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0045
     * @tc.desc   Test UI contract case 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u52a8\u6001\u7167\u7247\u5df2\u52a0\u8f7d\uff0c\u957f\u6309\u53ef\u64ad\u653e')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0046
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0046
     * @tc.desc   Test UI contract case 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('PLAY')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0047
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0047
     * @tc.desc   Test UI contract case 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('STOP')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0048
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0048
     * @tc.desc   Test UI contract case 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0049
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0049
     * @tc.desc   Test UI contract case 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u53d6\u6d88\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiContract0050
     * @tc.number MOVING_PHOTO_UI_CONTRACT_0050
     * @tc.desc   Test UI contract case 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiContract0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u52a8\u6001\u7167\u7247\u5df2\u52a0\u8f7d\uff0c\u957f\u6309\u53ef\u64ad\u653e')); expect(true).assertTrue(); })
  })
}
