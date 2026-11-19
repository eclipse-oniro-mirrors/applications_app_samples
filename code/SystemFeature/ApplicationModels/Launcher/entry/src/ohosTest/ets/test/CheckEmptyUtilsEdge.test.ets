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

class EmptyObject {
}

export default function checkEmptyUtilsEdgeTest() {
  describe('LauncherCheckEmptyUtilsEdgeTest', () => {

    /**
     * @tc.name   testIsEmptyUndefined0001
     * @tc.number SUB_LAUNCHER_ENTRY_EMPTY_0100
     * @tc.desc   Test that isEmpty treats undefined and null as empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsEmptyUndefined0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const undefinedValue: Object | undefined = undefined;
      const nullValue: Object | null = null;
      expect(CheckEmptyUtils.isEmpty(undefinedValue)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(nullValue)).assertTrue();
    })

    /**
     * @tc.name   testIsEmptyScalar0002
     * @tc.number SUB_LAUNCHER_ENTRY_EMPTY_0200
     * @tc.desc   Test that isEmpty does not treat zero or false as empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsEmptyScalar0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty(0)).assertFalse();
      expect(CheckEmptyUtils.isEmpty(false)).assertFalse();
      expect(CheckEmptyUtils.isEmpty('0')).assertFalse();
    })

    /**
     * @tc.name   testIsEmptyContainer0003
     * @tc.number SUB_LAUNCHER_ENTRY_EMPTY_0300
     * @tc.desc   Test that isEmpty only checks the container reference, not its content.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsEmptyContainer0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const emptyObject: Object = new EmptyObject();
      const emptyArray: Array<string> = [];
      expect(CheckEmptyUtils.isEmpty(emptyObject)).assertFalse();
      expect(CheckEmptyUtils.isEmpty(emptyArray)).assertFalse();
    })

    /**
     * @tc.name   testCheckStrWhitespace0004
     * @tc.number SUB_LAUNCHER_ENTRY_EMPTY_0400
     * @tc.desc   Test whitespace-only and tab-only strings for checkStrIsEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCheckStrWhitespace0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('\t')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('\n')).assertTrue();
    })

    /**
     * @tc.name   testCheckStrNonEmpty0005
     * @tc.number SUB_LAUNCHER_ENTRY_EMPTY_0500
     * @tc.desc   Test non-empty strings with leading or trailing whitespace.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCheckStrNonEmpty0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.checkStrIsEmpty(' a ')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('a')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('0')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('null')).assertFalse();
    })

    /**
     * @tc.name   testIsEmptyArrBoundary0006
     * @tc.number SUB_LAUNCHER_ENTRY_EMPTY_0600
     * @tc.desc   Test arrays with one, two and many elements.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsEmptyArrBoundary0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmptyArr<string>([])).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr<string>(['a'])).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr<number>([0, 0])).assertFalse();
      expect(CheckEmptyUtils.isEmptyArr<boolean>([false])).assertFalse();
    })

    /**
     * @tc.name   testIsEmptyArrNumeric0007
     * @tc.number SUB_LAUNCHER_ENTRY_EMPTY_0700
     * @tc.desc   Test that zero and negative values do not make an array empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsEmptyArrNumeric0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const values: number[] = [0, -1, Number.NaN];
      expect(CheckEmptyUtils.isEmptyArr<number>(values)).assertFalse();
      expect(values.length).assertEqual(3);
    })

    /**
     * @tc.name   testIsEmptyStringVsCheckStr0008
     * @tc.number SUB_LAUNCHER_ENTRY_EMPTY_0800
     * @tc.desc   Test the difference between isEmpty and checkStrIsEmpty for whitespace strings.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsEmptyStringVsCheckStr0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CheckEmptyUtils.isEmpty('   ')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
    })

  })
}
