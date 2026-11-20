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
import { CheckEmptyUtils } from '@ohos/base';

export default function launcherPlusEmptyTest() {
  describe('LauncherPlusEmptyTest', () => {

    /**
     * @tc.name   testLauncherPlusEmpty0001
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0001
     * @tc.desc   Check empty value variants for sample 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-1')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-1  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([1])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0002
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0002
     * @tc.desc   Check empty value variants for sample 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-2')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-2  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([2])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0003
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0003
     * @tc.desc   Check empty value variants for sample 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-3')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-3  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([3])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0004
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0004
     * @tc.desc   Check empty value variants for sample 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-4')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-4  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([4])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0005
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0005
     * @tc.desc   Check empty value variants for sample 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-5')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-5  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([5])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0006
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0006
     * @tc.desc   Check empty value variants for sample 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-6')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-6  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([6])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0007
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0007
     * @tc.desc   Check empty value variants for sample 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-7')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-7  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([7])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0008
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0008
     * @tc.desc   Check empty value variants for sample 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-8')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-8  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([8])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0009
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0009
     * @tc.desc   Check empty value variants for sample 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-9')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-9  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([9])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0010
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0010
     * @tc.desc   Check empty value variants for sample 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-10')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-10  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([10])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0011
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0011
     * @tc.desc   Check empty value variants for sample 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-11')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-11  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([11])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0012
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0012
     * @tc.desc   Check empty value variants for sample 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-12')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-12  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([12])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0013
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0013
     * @tc.desc   Check empty value variants for sample 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-13')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-13  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([13])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0014
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0014
     * @tc.desc   Check empty value variants for sample 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-14')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-14  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([14])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0015
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0015
     * @tc.desc   Check empty value variants for sample 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-15')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-15  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([15])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0016
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0016
     * @tc.desc   Check empty value variants for sample 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-16')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-16  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([16])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0017
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0017
     * @tc.desc   Check empty value variants for sample 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-17')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-17  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([17])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0018
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0018
     * @tc.desc   Check empty value variants for sample 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-18')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-18  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([18])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0019
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0019
     * @tc.desc   Check empty value variants for sample 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-19')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-19  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([19])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0020
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0020
     * @tc.desc   Check empty value variants for sample 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-20')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-20  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([20])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0021
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0021
     * @tc.desc   Check empty value variants for sample 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-21')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-21  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([21])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0022
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0022
     * @tc.desc   Check empty value variants for sample 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-22')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-22  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([22])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0023
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0023
     * @tc.desc   Check empty value variants for sample 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-23')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-23  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([23])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0024
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0024
     * @tc.desc   Check empty value variants for sample 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-24')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-24  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([24])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0025
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0025
     * @tc.desc   Check empty value variants for sample 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-25')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-25  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([25])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0026
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0026
     * @tc.desc   Check empty value variants for sample 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-26')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-26  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([26])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0027
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0027
     * @tc.desc   Check empty value variants for sample 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-27')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-27  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([27])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0028
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0028
     * @tc.desc   Check empty value variants for sample 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-28')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-28  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([28])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0029
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0029
     * @tc.desc   Check empty value variants for sample 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-29')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-29  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([29])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0030
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0030
     * @tc.desc   Check empty value variants for sample 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-30')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-30  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([30])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0031
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0031
     * @tc.desc   Check empty value variants for sample 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-31')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-31  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([31])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0032
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0032
     * @tc.desc   Check empty value variants for sample 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-32')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-32  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([32])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0033
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0033
     * @tc.desc   Check empty value variants for sample 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-33')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-33  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([33])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0034
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0034
     * @tc.desc   Check empty value variants for sample 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-34')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-34  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([34])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0035
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0035
     * @tc.desc   Check empty value variants for sample 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-35')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-35  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([35])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0036
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0036
     * @tc.desc   Check empty value variants for sample 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-36')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-36  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([36])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0037
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0037
     * @tc.desc   Check empty value variants for sample 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-37')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-37  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([37])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0038
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0038
     * @tc.desc   Check empty value variants for sample 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-38')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-38  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([38])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0039
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0039
     * @tc.desc   Check empty value variants for sample 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-39')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-39  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([39])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0040
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0040
     * @tc.desc   Check empty value variants for sample 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-40')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-40  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([40])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0041
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0041
     * @tc.desc   Check empty value variants for sample 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-41')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-41  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([41])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0042
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0042
     * @tc.desc   Check empty value variants for sample 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-42')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-42  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([42])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0043
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0043
     * @tc.desc   Check empty value variants for sample 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-43')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-43  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([43])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0044
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0044
     * @tc.desc   Check empty value variants for sample 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-44')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-44  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([44])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0045
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0045
     * @tc.desc   Check empty value variants for sample 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-45')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-45  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([45])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0046
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0046
     * @tc.desc   Check empty value variants for sample 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-46')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-46  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([46])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0047
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0047
     * @tc.desc   Check empty value variants for sample 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-47')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-47  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([47])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0048
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0048
     * @tc.desc   Check empty value variants for sample 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-48')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-48  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([48])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0049
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0049
     * @tc.desc   Check empty value variants for sample 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-49')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-49  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([49])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0050
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0050
     * @tc.desc   Check empty value variants for sample 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-50')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-50  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([50])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0051
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0051
     * @tc.desc   Check empty value variants for sample 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-51')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-51  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([51])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0052
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0052
     * @tc.desc   Check empty value variants for sample 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-52')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-52  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([52])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0053
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0053
     * @tc.desc   Check empty value variants for sample 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-53')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-53  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([53])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0054
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0054
     * @tc.desc   Check empty value variants for sample 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-54')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-54  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([54])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0055
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0055
     * @tc.desc   Check empty value variants for sample 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-55')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-55  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([55])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0056
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0056
     * @tc.desc   Check empty value variants for sample 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-56')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-56  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([56])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0057
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0057
     * @tc.desc   Check empty value variants for sample 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-57')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-57  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([57])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0058
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0058
     * @tc.desc   Check empty value variants for sample 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-58')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-58  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([58])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0059
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0059
     * @tc.desc   Check empty value variants for sample 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-59')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-59  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([59])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusEmpty0060
     * @tc.number SUB_LAUNCHER_PLUS_EMPTY_0060
     * @tc.desc   Check empty value variants for sample 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusEmpty0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('launcher-60')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('  item-60  ')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([60])).assertFalse();
    })
  })
}
