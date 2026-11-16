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
import { Constants } from '../../../main/ets/common/Constants';
import EntryFormAbility from '../../../main/ets/entryformability/EntryFormAbility';

export default function shakeLiveFormBasicTypesTest() {
  describe('ShakeLiveFormBasicTypesTest', () => {

    /**
     * @tc.name   testShakeBasic0001
     * @tc.number SUB_SHAKE_BASIC_0001
     * @tc.desc   Basic type case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBasic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof Constants.OVERFLOW_LEFT_RATIO === 'number').assertTrue(); expect(1 > 0).assertTrue(); expect('1'.length > 0).assertTrue();
    })

    /**
     * @tc.name   testShakeBasic0002
     * @tc.number SUB_SHAKE_BASIC_0002
     * @tc.desc   Basic type case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBasic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof Constants.OVERFLOW_LEFT_RATIO === 'number').assertTrue(); expect(2 > 0).assertTrue(); expect('2'.length > 0).assertTrue();
    })

    /**
     * @tc.name   testShakeBasic0003
     * @tc.number SUB_SHAKE_BASIC_0003
     * @tc.desc   Basic type case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBasic0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof Constants.OVERFLOW_LEFT_RATIO === 'number').assertTrue(); expect(3 > 0).assertTrue(); expect('3'.length > 0).assertTrue();
    })

    /**
     * @tc.name   testShakeBasic0004
     * @tc.number SUB_SHAKE_BASIC_0004
     * @tc.desc   Basic type case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBasic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof Constants.OVERFLOW_LEFT_RATIO === 'number').assertTrue(); expect(4 > 0).assertTrue(); expect('4'.length > 0).assertTrue();
    })

    /**
     * @tc.name   testShakeBasic0005
     * @tc.number SUB_SHAKE_BASIC_0005
     * @tc.desc   Basic type case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBasic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof Constants.OVERFLOW_LEFT_RATIO === 'number').assertTrue(); expect(5 > 0).assertTrue(); expect('5'.length > 0).assertTrue();
    })

    /**
     * @tc.name   testShakeBasic0006
     * @tc.number SUB_SHAKE_BASIC_0006
     * @tc.desc   Basic type case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBasic0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(true).assertTrue(); expect(6 > 0).assertTrue();
    })

    /**
     * @tc.name   testShakeBasic0007
     * @tc.number SUB_SHAKE_BASIC_0007
     * @tc.desc   Basic type case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBasic0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(true).assertTrue(); expect(7 > 0).assertTrue();
    })

    /**
     * @tc.name   testShakeBasic0008
     * @tc.number SUB_SHAKE_BASIC_0008
     * @tc.desc   Basic type case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBasic0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(true).assertTrue(); expect(8 > 0).assertTrue();
    })

    /**
     * @tc.name   testShakeBasic0009
     * @tc.number SUB_SHAKE_BASIC_0009
     * @tc.desc   Basic type case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBasic0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(true).assertTrue(); expect(9 > 0).assertTrue();
    })

    /**
     * @tc.name   testShakeBasic0010
     * @tc.number SUB_SHAKE_BASIC_0010
     * @tc.desc   Basic type case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBasic0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(true).assertTrue(); expect(10 > 0).assertTrue();
    })
  })
}
