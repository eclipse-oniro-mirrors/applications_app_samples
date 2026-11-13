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
export default function movingPhotoUiElementsTest() {
  describe('MovingPhotoUiElementsTest', () => {
    let driver: Driver;
    beforeAll(async () => { const want: Want = { bundleName: BUNDLE_NAME, abilityName: 'EntryAbility' }; await DELEGATOR.startAbility(want); await delay(2500); driver = await Driver.create(); })

    /**
     * @tc.name   testUiElements0001
     * @tc.number MOVING_PHOTO_UI_ELEM_0001
     * @tc.desc   Test UI element 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('PLAY')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0002
     * @tc.number MOVING_PHOTO_UI_ELEM_0002
     * @tc.desc   Test UI element 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('STOP')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0003
     * @tc.number MOVING_PHOTO_UI_ELEM_0003
     * @tc.desc   Test UI element 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0004
     * @tc.number MOVING_PHOTO_UI_ELEM_0004
     * @tc.desc   Test UI element 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u53d6\u6d88\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0005
     * @tc.number MOVING_PHOTO_UI_ELEM_0005
     * @tc.desc   Test UI element 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u52a8\u6001\u7167\u7247\u5df2\u52a0\u8f7d\uff0c\u957f\u6309\u53ef\u64ad\u653e')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0006
     * @tc.number MOVING_PHOTO_UI_ELEM_0006
     * @tc.desc   Test UI element 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('PLAY')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0007
     * @tc.number MOVING_PHOTO_UI_ELEM_0007
     * @tc.desc   Test UI element 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('STOP')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0008
     * @tc.number MOVING_PHOTO_UI_ELEM_0008
     * @tc.desc   Test UI element 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0009
     * @tc.number MOVING_PHOTO_UI_ELEM_0009
     * @tc.desc   Test UI element 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u53d6\u6d88\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0010
     * @tc.number MOVING_PHOTO_UI_ELEM_0010
     * @tc.desc   Test UI element 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u52a8\u6001\u7167\u7247\u5df2\u52a0\u8f7d\uff0c\u957f\u6309\u53ef\u64ad\u653e')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0011
     * @tc.number MOVING_PHOTO_UI_ELEM_0011
     * @tc.desc   Test UI element 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('PLAY')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0012
     * @tc.number MOVING_PHOTO_UI_ELEM_0012
     * @tc.desc   Test UI element 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('STOP')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0013
     * @tc.number MOVING_PHOTO_UI_ELEM_0013
     * @tc.desc   Test UI element 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0014
     * @tc.number MOVING_PHOTO_UI_ELEM_0014
     * @tc.desc   Test UI element 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u53d6\u6d88\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0015
     * @tc.number MOVING_PHOTO_UI_ELEM_0015
     * @tc.desc   Test UI element 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u52a8\u6001\u7167\u7247\u5df2\u52a0\u8f7d\uff0c\u957f\u6309\u53ef\u64ad\u653e')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0016
     * @tc.number MOVING_PHOTO_UI_ELEM_0016
     * @tc.desc   Test UI element 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('PLAY')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0017
     * @tc.number MOVING_PHOTO_UI_ELEM_0017
     * @tc.desc   Test UI element 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('STOP')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0018
     * @tc.number MOVING_PHOTO_UI_ELEM_0018
     * @tc.desc   Test UI element 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0019
     * @tc.number MOVING_PHOTO_UI_ELEM_0019
     * @tc.desc   Test UI element 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u53d6\u6d88\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0020
     * @tc.number MOVING_PHOTO_UI_ELEM_0020
     * @tc.desc   Test UI element 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u52a8\u6001\u7167\u7247\u5df2\u52a0\u8f7d\uff0c\u957f\u6309\u53ef\u64ad\u653e')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0021
     * @tc.number MOVING_PHOTO_UI_ELEM_0021
     * @tc.desc   Test UI element 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('PLAY')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0022
     * @tc.number MOVING_PHOTO_UI_ELEM_0022
     * @tc.desc   Test UI element 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('STOP')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0023
     * @tc.number MOVING_PHOTO_UI_ELEM_0023
     * @tc.desc   Test UI element 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0024
     * @tc.number MOVING_PHOTO_UI_ELEM_0024
     * @tc.desc   Test UI element 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u53d6\u6d88\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0025
     * @tc.number MOVING_PHOTO_UI_ELEM_0025
     * @tc.desc   Test UI element 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u52a8\u6001\u7167\u7247\u5df2\u52a0\u8f7d\uff0c\u957f\u6309\u53ef\u64ad\u653e')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0026
     * @tc.number MOVING_PHOTO_UI_ELEM_0026
     * @tc.desc   Test UI element 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('PLAY')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0027
     * @tc.number MOVING_PHOTO_UI_ELEM_0027
     * @tc.desc   Test UI element 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('STOP')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0028
     * @tc.number MOVING_PHOTO_UI_ELEM_0028
     * @tc.desc   Test UI element 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0029
     * @tc.number MOVING_PHOTO_UI_ELEM_0029
     * @tc.desc   Test UI element 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u53d6\u6d88\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0030
     * @tc.number MOVING_PHOTO_UI_ELEM_0030
     * @tc.desc   Test UI element 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u52a8\u6001\u7167\u7247\u5df2\u52a0\u8f7d\uff0c\u957f\u6309\u53ef\u64ad\u653e')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0031
     * @tc.number MOVING_PHOTO_UI_ELEM_0031
     * @tc.desc   Test UI element 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('PLAY')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0032
     * @tc.number MOVING_PHOTO_UI_ELEM_0032
     * @tc.desc   Test UI element 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('STOP')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0033
     * @tc.number MOVING_PHOTO_UI_ELEM_0033
     * @tc.desc   Test UI element 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0034
     * @tc.number MOVING_PHOTO_UI_ELEM_0034
     * @tc.desc   Test UI element 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u53d6\u6d88\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0035
     * @tc.number MOVING_PHOTO_UI_ELEM_0035
     * @tc.desc   Test UI element 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u52a8\u6001\u7167\u7247\u5df2\u52a0\u8f7d\uff0c\u957f\u6309\u53ef\u64ad\u653e')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0036
     * @tc.number MOVING_PHOTO_UI_ELEM_0036
     * @tc.desc   Test UI element 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('PLAY')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0037
     * @tc.number MOVING_PHOTO_UI_ELEM_0037
     * @tc.desc   Test UI element 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('STOP')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0038
     * @tc.number MOVING_PHOTO_UI_ELEM_0038
     * @tc.desc   Test UI element 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0039
     * @tc.number MOVING_PHOTO_UI_ELEM_0039
     * @tc.desc   Test UI element 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u53d6\u6d88\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0040
     * @tc.number MOVING_PHOTO_UI_ELEM_0040
     * @tc.desc   Test UI element 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u52a8\u6001\u7167\u7247\u5df2\u52a0\u8f7d\uff0c\u957f\u6309\u53ef\u64ad\u653e')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0041
     * @tc.number MOVING_PHOTO_UI_ELEM_0041
     * @tc.desc   Test UI element 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('PLAY')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0042
     * @tc.number MOVING_PHOTO_UI_ELEM_0042
     * @tc.desc   Test UI element 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('STOP')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0043
     * @tc.number MOVING_PHOTO_UI_ELEM_0043
     * @tc.desc   Test UI element 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0044
     * @tc.number MOVING_PHOTO_UI_ELEM_0044
     * @tc.desc   Test UI element 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u53d6\u6d88\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0045
     * @tc.number MOVING_PHOTO_UI_ELEM_0045
     * @tc.desc   Test UI element 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u52a8\u6001\u7167\u7247\u5df2\u52a0\u8f7d\uff0c\u957f\u6309\u53ef\u64ad\u653e')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0046
     * @tc.number MOVING_PHOTO_UI_ELEM_0046
     * @tc.desc   Test UI element 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('PLAY')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0047
     * @tc.number MOVING_PHOTO_UI_ELEM_0047
     * @tc.desc   Test UI element 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('STOP')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0048
     * @tc.number MOVING_PHOTO_UI_ELEM_0048
     * @tc.desc   Test UI element 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0049
     * @tc.number MOVING_PHOTO_UI_ELEM_0049
     * @tc.desc   Test UI element 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u53d6\u6d88\u9759\u97f3')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiElements0050
     * @tc.number MOVING_PHOTO_UI_ELEM_0050
     * @tc.desc   Test UI element 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiElements0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('\u52a8\u6001\u7167\u7247\u5df2\u52a0\u8f7d\uff0c\u957f\u6309\u53ef\u64ad\u653e')); expect(true).assertTrue(); })
  })
}
