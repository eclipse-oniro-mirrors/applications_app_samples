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
import { TestType, Size, Level } from '@ohos/hypium';
import { describe, it, expect } from '@ohos/hypium';
import { CommonConstants } from '../../../main/ets/common/CommonConstants';

export default function projectConstantsExpandedTest() {
  describe('projectConstantsExpandedTest', () => {
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0001
     * @tc.name      testExpConstant0001
     * @tc.desc      CommonConstants scale calculation 0 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 0;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 0 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1920);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0002
     * @tc.name      testExpConstant0002
     * @tc.desc      CommonConstants scale calculation 1 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 1;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 1 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1921);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0003
     * @tc.name      testExpConstant0003
     * @tc.desc      CommonConstants scale calculation 2 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 2;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 2 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1922);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0004
     * @tc.name      testExpConstant0004
     * @tc.desc      CommonConstants scale calculation 3 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 3;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 3 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1923);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0005
     * @tc.name      testExpConstant0005
     * @tc.desc      CommonConstants scale calculation 4 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 4;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 4 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1924);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0006
     * @tc.name      testExpConstant0006
     * @tc.desc      CommonConstants scale calculation 5 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 5;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 5 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1925);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0007
     * @tc.name      testExpConstant0007
     * @tc.desc      CommonConstants scale calculation 6 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 6;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 6 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1926);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0008
     * @tc.name      testExpConstant0008
     * @tc.desc      CommonConstants scale calculation 7 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 7;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 7 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1927);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0009
     * @tc.name      testExpConstant0009
     * @tc.desc      CommonConstants scale calculation 8 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 8;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 8 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1928);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0010
     * @tc.name      testExpConstant0010
     * @tc.desc      CommonConstants scale calculation 9 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 9;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 9 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1929);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0011
     * @tc.name      testExpConstant0011
     * @tc.desc      CommonConstants scale calculation 10 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 10;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 10 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1930);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0012
     * @tc.name      testExpConstant0012
     * @tc.desc      CommonConstants scale calculation 11 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 11;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 11 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1931);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0013
     * @tc.name      testExpConstant0013
     * @tc.desc      CommonConstants scale calculation 12 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 12;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 12 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1932);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0014
     * @tc.name      testExpConstant0014
     * @tc.desc      CommonConstants scale calculation 13 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 13;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 13 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1933);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0015
     * @tc.name      testExpConstant0015
     * @tc.desc      CommonConstants scale calculation 14 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 14;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 14 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1934);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0016
     * @tc.name      testExpConstant0016
     * @tc.desc      CommonConstants scale calculation 15 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 15;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 15 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1935);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0017
     * @tc.name      testExpConstant0017
     * @tc.desc      CommonConstants scale calculation 16 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 16;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 16 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1936);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0018
     * @tc.name      testExpConstant0018
     * @tc.desc      CommonConstants scale calculation 17 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 17;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 17 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1937);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0019
     * @tc.name      testExpConstant0019
     * @tc.desc      CommonConstants scale calculation 18 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 18;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 18 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1938);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0020
     * @tc.name      testExpConstant0020
     * @tc.desc      CommonConstants scale calculation 19 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 19;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 19 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1939);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0021
     * @tc.name      testExpConstant0021
     * @tc.desc      CommonConstants scale calculation 20 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 20;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 20 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1940);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0022
     * @tc.name      testExpConstant0022
     * @tc.desc      CommonConstants scale calculation 21 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 21;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 21 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1941);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0023
     * @tc.name      testExpConstant0023
     * @tc.desc      CommonConstants scale calculation 22 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 22;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 22 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1942);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0024
     * @tc.name      testExpConstant0024
     * @tc.desc      CommonConstants scale calculation 23 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 23;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 23 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1943);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0025
     * @tc.name      testExpConstant0025
     * @tc.desc      CommonConstants scale calculation 24 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 24;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 24 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1944);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0026
     * @tc.name      testExpConstant0026
     * @tc.desc      CommonConstants scale calculation 25 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 25;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 25 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1945);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0027
     * @tc.name      testExpConstant0027
     * @tc.desc      CommonConstants scale calculation 26 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 26;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 26 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1946);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0028
     * @tc.name      testExpConstant0028
     * @tc.desc      CommonConstants scale calculation 27 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 27;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 27 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1947);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0029
     * @tc.name      testExpConstant0029
     * @tc.desc      CommonConstants scale calculation 28 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 28;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 28 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1948);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0030
     * @tc.name      testExpConstant0030
     * @tc.desc      CommonConstants scale calculation 29 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 29;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 29 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1949);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0031
     * @tc.name      testExpConstant0031
     * @tc.desc      CommonConstants scale calculation 30 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 30;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 30 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1950);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0032
     * @tc.name      testExpConstant0032
     * @tc.desc      CommonConstants scale calculation 31 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 31;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 31 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1951);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0033
     * @tc.name      testExpConstant0033
     * @tc.desc      CommonConstants scale calculation 32 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 32;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 32 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1952);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0034
     * @tc.name      testExpConstant0034
     * @tc.desc      CommonConstants scale calculation 33 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 33;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 33 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1953);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0035
     * @tc.name      testExpConstant0035
     * @tc.desc      CommonConstants scale calculation 34 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 34;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 34 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1954);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0036
     * @tc.name      testExpConstant0036
     * @tc.desc      CommonConstants scale calculation 35 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 35;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 35 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1955);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0037
     * @tc.name      testExpConstant0037
     * @tc.desc      CommonConstants scale calculation 36 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 36;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 36 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1956);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0038
     * @tc.name      testExpConstant0038
     * @tc.desc      CommonConstants scale calculation 37 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 37;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 37 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1957);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0039
     * @tc.name      testExpConstant0039
     * @tc.desc      CommonConstants scale calculation 38 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 38;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 38 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1958);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0040
     * @tc.name      testExpConstant0040
     * @tc.desc      CommonConstants scale calculation 39 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 39;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 39 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1959);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0041
     * @tc.name      testExpConstant0041
     * @tc.desc      CommonConstants scale calculation 40 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 40;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 40 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1960);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0042
     * @tc.name      testExpConstant0042
     * @tc.desc      CommonConstants scale calculation 41 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 41;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 41 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1961);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0043
     * @tc.name      testExpConstant0043
     * @tc.desc      CommonConstants scale calculation 42 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 42;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 42 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1962);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0044
     * @tc.name      testExpConstant0044
     * @tc.desc      CommonConstants scale calculation 43 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 43;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 43 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1963);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0045
     * @tc.name      testExpConstant0045
     * @tc.desc      CommonConstants scale calculation 44 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 44;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 44 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1964);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0046
     * @tc.name      testExpConstant0046
     * @tc.desc      CommonConstants scale calculation 45 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 45;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 45 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1965);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0047
     * @tc.name      testExpConstant0047
     * @tc.desc      CommonConstants scale calculation 46 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 46;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 46 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1966);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0048
     * @tc.name      testExpConstant0048
     * @tc.desc      CommonConstants scale calculation 47 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 47;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 47 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1967);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0049
     * @tc.name      testExpConstant0049
     * @tc.desc      CommonConstants scale calculation 48 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 48;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 48 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1968);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0050
     * @tc.name      testExpConstant0050
     * @tc.desc      CommonConstants scale calculation 49 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 49;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 49 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1969);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0051
     * @tc.name      testExpConstant0051
     * @tc.desc      CommonConstants scale calculation 50 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 50;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 50 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1970);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0052
     * @tc.name      testExpConstant0052
     * @tc.desc      CommonConstants scale calculation 51 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 51;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 51 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1971);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0053
     * @tc.name      testExpConstant0053
     * @tc.desc      CommonConstants scale calculation 52 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 52;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 52 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1972);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0054
     * @tc.name      testExpConstant0054
     * @tc.desc      CommonConstants scale calculation 53 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 53;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 53 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1973);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0055
     * @tc.name      testExpConstant0055
     * @tc.desc      CommonConstants scale calculation 54 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 54;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 54 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1974);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0056
     * @tc.name      testExpConstant0056
     * @tc.desc      CommonConstants scale calculation 55 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 55;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 55 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1975);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0057
     * @tc.name      testExpConstant0057
     * @tc.desc      CommonConstants scale calculation 56 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 56;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 56 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1976);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0058
     * @tc.name      testExpConstant0058
     * @tc.desc      CommonConstants scale calculation 57 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 57;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 57 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1977);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0059
     * @tc.name      testExpConstant0059
     * @tc.desc      CommonConstants scale calculation 58 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 58;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 58 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1978);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0060
     * @tc.name      testExpConstant0060
     * @tc.desc      CommonConstants scale calculation 59 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 59;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 59 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1979);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0061
     * @tc.name      testExpConstant0061
     * @tc.desc      CommonConstants scale calculation 60 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 60;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 60 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1980);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0062
     * @tc.name      testExpConstant0062
     * @tc.desc      CommonConstants scale calculation 61 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 61;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 61 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1981);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0063
     * @tc.name      testExpConstant0063
     * @tc.desc      CommonConstants scale calculation 62 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 62;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 62 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1982);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0064
     * @tc.name      testExpConstant0064
     * @tc.desc      CommonConstants scale calculation 63 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 63;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 63 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1983);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0065
     * @tc.name      testExpConstant0065
     * @tc.desc      CommonConstants scale calculation 64 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 64;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 64 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1984);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0066
     * @tc.name      testExpConstant0066
     * @tc.desc      CommonConstants scale calculation 65 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 65;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 65 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1985);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0067
     * @tc.name      testExpConstant0067
     * @tc.desc      CommonConstants scale calculation 66 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 66;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 66 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1986);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0068
     * @tc.name      testExpConstant0068
     * @tc.desc      CommonConstants scale calculation 67 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 67;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 67 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1987);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0069
     * @tc.name      testExpConstant0069
     * @tc.desc      CommonConstants scale calculation 68 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 68;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 68 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1988);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0070
     * @tc.name      testExpConstant0070
     * @tc.desc      CommonConstants scale calculation 69 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 69;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 69 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1989);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0071
     * @tc.name      testExpConstant0071
     * @tc.desc      CommonConstants scale calculation 70 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 70;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 70 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1990);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0072
     * @tc.name      testExpConstant0072
     * @tc.desc      CommonConstants scale calculation 71 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 71;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 71 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1991);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0073
     * @tc.name      testExpConstant0073
     * @tc.desc      CommonConstants scale calculation 72 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 72;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 72 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1992);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0074
     * @tc.name      testExpConstant0074
     * @tc.desc      CommonConstants scale calculation 73 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 73;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 73 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1993);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0075
     * @tc.name      testExpConstant0075
     * @tc.desc      CommonConstants scale calculation 74 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 74;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 74 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1994);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0076
     * @tc.name      testExpConstant0076
     * @tc.desc      CommonConstants scale calculation 75 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 75;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 75 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1995);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0077
     * @tc.name      testExpConstant0077
     * @tc.desc      CommonConstants scale calculation 76 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 76;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 76 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1996);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0078
     * @tc.name      testExpConstant0078
     * @tc.desc      CommonConstants scale calculation 77 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 77;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 77 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1997);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0079
     * @tc.name      testExpConstant0079
     * @tc.desc      CommonConstants scale calculation 78 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 78;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 78 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1998);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0080
     * @tc.name      testExpConstant0080
     * @tc.desc      CommonConstants scale calculation 79 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 79;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 79 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(1999);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0081
     * @tc.name      testExpConstant0081
     * @tc.desc      CommonConstants scale calculation 80 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 80;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 80 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(2000);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0082
     * @tc.name      testExpConstant0082
     * @tc.desc      CommonConstants scale calculation 81 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 81;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 81 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(2001);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0083
     * @tc.name      testExpConstant0083
     * @tc.desc      CommonConstants scale calculation 82 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 82;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 82 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(2002);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0084
     * @tc.name      testExpConstant0084
     * @tc.desc      CommonConstants scale calculation 83 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 83;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 83 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(2003);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0085
     * @tc.name      testExpConstant0085
     * @tc.desc      CommonConstants scale calculation 84 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 84;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 84 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(2004);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0086
     * @tc.name      testExpConstant0086
     * @tc.desc      CommonConstants scale calculation 85 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 85;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 85 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(2005);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0087
     * @tc.name      testExpConstant0087
     * @tc.desc      CommonConstants scale calculation 86 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 86;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 86 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(2006);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0088
     * @tc.name      testExpConstant0088
     * @tc.desc      CommonConstants scale calculation 87 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 87;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 87 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(2007);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0089
     * @tc.name      testExpConstant0089
     * @tc.desc      CommonConstants scale calculation 88 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 88;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 88 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(2008);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0090
     * @tc.name      testExpConstant0090
     * @tc.desc      CommonConstants scale calculation 89 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 89;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 89 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(2009);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0091
     * @tc.name      testExpConstant0091
     * @tc.desc      CommonConstants scale calculation 90 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 90;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 90 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(2010);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0092
     * @tc.name      testExpConstant0092
     * @tc.desc      CommonConstants scale calculation 91 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 91;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 91 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(2011);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0093
     * @tc.name      testExpConstant0093
     * @tc.desc      CommonConstants scale calculation 92 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 92;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 92 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(2012);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0094
     * @tc.name      testExpConstant0094
     * @tc.desc      CommonConstants scale calculation 93 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 93;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 93 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(2013);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0095
     * @tc.name      testExpConstant0095
     * @tc.desc      CommonConstants scale calculation 94 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 94;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 94 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(2014);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0096
     * @tc.name      testExpConstant0096
     * @tc.desc      CommonConstants scale calculation 95 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 95;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 95 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(2015);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0097
     * @tc.name      testExpConstant0097
     * @tc.desc      CommonConstants scale calculation 96 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 96;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 96 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(2016);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0098
     * @tc.name      testExpConstant0098
     * @tc.desc      CommonConstants scale calculation 97 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 97;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 97 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(2017);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0099
     * @tc.name      testExpConstant0099
     * @tc.desc      CommonConstants scale calculation 98 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 98;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 98 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(2018);
    })
    /**
     * @tc.number    SUB_AVS_EXP_CONST_0100
     * @tc.name      testExpConstant0100
     * @tc.desc      CommonConstants scale calculation 99 stays consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpConstant0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = CommonConstants.DEFAULT_WIDTH + 99;
      const height: number = CommonConstants.DEFAULT_HEIGHT;
      const scaledHeight: number = width * height / CommonConstants.DEFAULT_WIDTH;
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.PX).assertEqual('px');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(scaledHeight).assertEqual(height + height * 99 / CommonConstants.DEFAULT_WIDTH);
      expect(width).assertEqual(2019);
    })
  })
}
