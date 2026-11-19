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

export default function launcherPlusCheckDeepTest() {
  describe('LauncherPlusCheckDeepTest', () => {

    /**
     * @tc.name   testLauncherPlusCheckDeep0001
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0001
     * @tc.desc   Check empty string and array values 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-1')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-1')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([1, 2])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0002
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0002
     * @tc.desc   Check empty string and array values 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-2')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-2')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([2, 3])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0003
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0003
     * @tc.desc   Check empty string and array values 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-3')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-3')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([3, 4])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0004
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0004
     * @tc.desc   Check empty string and array values 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-4')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-4')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([4, 5])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0005
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0005
     * @tc.desc   Check empty string and array values 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-5')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-5')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([5, 6])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0006
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0006
     * @tc.desc   Check empty string and array values 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-6')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-6')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([6, 7])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0007
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0007
     * @tc.desc   Check empty string and array values 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-7')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-7')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([7, 8])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0008
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0008
     * @tc.desc   Check empty string and array values 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-8')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-8')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([8, 9])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0009
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0009
     * @tc.desc   Check empty string and array values 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-9')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-9')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([9, 10])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0010
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0010
     * @tc.desc   Check empty string and array values 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-10')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-10')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([10, 11])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0011
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0011
     * @tc.desc   Check empty string and array values 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-11')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-11')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([11, 12])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0012
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0012
     * @tc.desc   Check empty string and array values 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-12')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-12')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([12, 13])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0013
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0013
     * @tc.desc   Check empty string and array values 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-13')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-13')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([13, 14])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0014
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0014
     * @tc.desc   Check empty string and array values 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-14')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-14')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([14, 15])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0015
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0015
     * @tc.desc   Check empty string and array values 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-15')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-15')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([15, 16])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0016
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0016
     * @tc.desc   Check empty string and array values 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-16')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-16')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([16, 17])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0017
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0017
     * @tc.desc   Check empty string and array values 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-17')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-17')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([17, 18])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0018
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0018
     * @tc.desc   Check empty string and array values 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-18')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-18')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([18, 19])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0019
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0019
     * @tc.desc   Check empty string and array values 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-19')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-19')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([19, 20])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0020
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0020
     * @tc.desc   Check empty string and array values 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-20')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-20')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([20, 21])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0021
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0021
     * @tc.desc   Check empty string and array values 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-21')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-21')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([21, 22])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0022
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0022
     * @tc.desc   Check empty string and array values 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-22')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-22')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([22, 23])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0023
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0023
     * @tc.desc   Check empty string and array values 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-23')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-23')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([23, 24])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0024
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0024
     * @tc.desc   Check empty string and array values 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-24')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-24')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([24, 25])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0025
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0025
     * @tc.desc   Check empty string and array values 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-25')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-25')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([25, 26])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0026
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0026
     * @tc.desc   Check empty string and array values 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-26')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-26')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([26, 27])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0027
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0027
     * @tc.desc   Check empty string and array values 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-27')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-27')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([27, 28])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0028
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0028
     * @tc.desc   Check empty string and array values 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-28')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-28')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([28, 29])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0029
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0029
     * @tc.desc   Check empty string and array values 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-29')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-29')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([29, 30])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0030
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0030
     * @tc.desc   Check empty string and array values 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-30')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-30')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([30, 31])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0031
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0031
     * @tc.desc   Check empty string and array values 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-31')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-31')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([31, 32])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0032
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0032
     * @tc.desc   Check empty string and array values 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-32')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-32')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([32, 33])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0033
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0033
     * @tc.desc   Check empty string and array values 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-33')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-33')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([33, 34])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0034
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0034
     * @tc.desc   Check empty string and array values 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-34')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-34')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([34, 35])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0035
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0035
     * @tc.desc   Check empty string and array values 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-35')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-35')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([35, 36])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0036
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0036
     * @tc.desc   Check empty string and array values 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-36')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-36')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([36, 37])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0037
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0037
     * @tc.desc   Check empty string and array values 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-37')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-37')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([37, 38])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0038
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0038
     * @tc.desc   Check empty string and array values 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-38')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-38')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([38, 39])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0039
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0039
     * @tc.desc   Check empty string and array values 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-39')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-39')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([39, 40])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0040
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0040
     * @tc.desc   Check empty string and array values 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-40')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-40')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([40, 41])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0041
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0041
     * @tc.desc   Check empty string and array values 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-41')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-41')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([41, 42])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0042
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0042
     * @tc.desc   Check empty string and array values 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-42')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-42')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([42, 43])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0043
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0043
     * @tc.desc   Check empty string and array values 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-43')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-43')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([43, 44])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0044
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0044
     * @tc.desc   Check empty string and array values 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-44')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-44')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([44, 45])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0045
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0045
     * @tc.desc   Check empty string and array values 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-45')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-45')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([45, 46])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0046
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0046
     * @tc.desc   Check empty string and array values 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-46')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-46')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([46, 47])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0047
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0047
     * @tc.desc   Check empty string and array values 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-47')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-47')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([47, 48])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0048
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0048
     * @tc.desc   Check empty string and array values 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-48')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-48')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([48, 49])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0049
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0049
     * @tc.desc   Check empty string and array values 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-49')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-49')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([49, 50])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0050
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0050
     * @tc.desc   Check empty string and array values 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-50')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-50')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([50, 51])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0051
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0051
     * @tc.desc   Check empty string and array values 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-51')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-51')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([51, 52])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0052
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0052
     * @tc.desc   Check empty string and array values 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-52')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-52')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([52, 53])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0053
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0053
     * @tc.desc   Check empty string and array values 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-53')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-53')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([53, 54])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0054
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0054
     * @tc.desc   Check empty string and array values 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-54')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-54')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([54, 55])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0055
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0055
     * @tc.desc   Check empty string and array values 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-55')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-55')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([55, 56])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0056
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0056
     * @tc.desc   Check empty string and array values 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-56')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-56')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([56, 57])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0057
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0057
     * @tc.desc   Check empty string and array values 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-57')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-57')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([57, 58])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0058
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0058
     * @tc.desc   Check empty string and array values 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-58')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-58')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([58, 59])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0059
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0059
     * @tc.desc   Check empty string and array values 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-59')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-59')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([59, 60])).assertFalse();
    })

    /**
     * @tc.name   testLauncherPlusCheckDeep0060
     * @tc.number SUB_LAUNCHER_PLUS_CHECK_DEEP_0060
     * @tc.desc   Check empty string and array values 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusCheckDeep0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('value-60')).assertFalse();
      expect(CheckEmptyUtils.isEmpty(undefined)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(null)).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('item-60')).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr([60, 61])).assertFalse();
    })
  })
}
