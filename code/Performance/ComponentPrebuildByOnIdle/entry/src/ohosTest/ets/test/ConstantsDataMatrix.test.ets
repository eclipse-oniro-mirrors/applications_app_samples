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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Constants } from '@ohos/customreusablepool/src/main/ets/constants/Constants';

import { paceTurn } from './shared/TestPace';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PrebuildOnIdle_ConstantsDataMatrix]';

const CONSTANT_VALUES: string[] = [
  Constants.HOME,
  Constants.FILM,
  Constants.TELEPLAY,
  Constants.ANIMATION,
  Constants.SPORT
];

const EXPECTED_VALUES: string[] = ['首页', '风景', '商品', '旅游', '头像'];

export default function constantsDataMatrixTest() {
  describe('constantsDataMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_PREBUILD_CONSTANTS_MATRIX_0001
     * @tc.name test_constantsDataMatrix_c0001
     * @tc.desc Verify ConstantsDataMatrix behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_constantsDataMatrix_c0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_constantsDataMatrix_c0001 begin');
      const ci: number = 0 % CONSTANT_VALUES.length;
      expect(CONSTANT_VALUES.length).assertEqual(5);
      expect(CONSTANT_VALUES[ci]).assertEqual(EXPECTED_VALUES[ci]);
      expect(CONSTANT_VALUES[ci].length).assertLarger(0);
      expect(CONSTANT_VALUES.indexOf(CONSTANT_VALUES[ci])).assertEqual(ci);
      expect(EXPECTED_VALUES.indexOf(EXPECTED_VALUES[ci])).assertEqual(ci);
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_constantsDataMatrix_c0001 end');
    });

    /**
     * @tc.number SUB_PREBUILD_CONSTANTS_MATRIX_0002
     * @tc.name test_constantsDataMatrix_c0002
     * @tc.desc Verify ConstantsDataMatrix behavior for matrix index 1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_constantsDataMatrix_c0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_constantsDataMatrix_c0002 begin');
      const ci: number = 1 % CONSTANT_VALUES.length;
      expect(CONSTANT_VALUES.length).assertEqual(5);
      expect(CONSTANT_VALUES[ci]).assertEqual(EXPECTED_VALUES[ci]);
      expect(CONSTANT_VALUES[ci].length).assertLarger(0);
      expect(CONSTANT_VALUES.indexOf(CONSTANT_VALUES[ci])).assertEqual(ci);
      expect(EXPECTED_VALUES.indexOf(EXPECTED_VALUES[ci])).assertEqual(ci);
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_constantsDataMatrix_c0002 end');
    });

    /**
     * @tc.number SUB_PREBUILD_CONSTANTS_MATRIX_0003
     * @tc.name test_constantsDataMatrix_c0003
     * @tc.desc Verify ConstantsDataMatrix behavior for matrix index 2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_constantsDataMatrix_c0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_constantsDataMatrix_c0003 begin');
      const ci: number = 2 % CONSTANT_VALUES.length;
      expect(CONSTANT_VALUES.length).assertEqual(5);
      expect(CONSTANT_VALUES[ci]).assertEqual(EXPECTED_VALUES[ci]);
      expect(CONSTANT_VALUES[ci].length).assertLarger(0);
      expect(CONSTANT_VALUES.indexOf(CONSTANT_VALUES[ci])).assertEqual(ci);
      expect(EXPECTED_VALUES.indexOf(EXPECTED_VALUES[ci])).assertEqual(ci);
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_constantsDataMatrix_c0003 end');
    });

    /**
     * @tc.number SUB_PREBUILD_CONSTANTS_MATRIX_0004
     * @tc.name test_constantsDataMatrix_c0004
     * @tc.desc Verify ConstantsDataMatrix behavior for matrix index 3
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_constantsDataMatrix_c0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_constantsDataMatrix_c0004 begin');
      const ci: number = 3 % CONSTANT_VALUES.length;
      expect(CONSTANT_VALUES.length).assertEqual(5);
      expect(CONSTANT_VALUES[ci]).assertEqual(EXPECTED_VALUES[ci]);
      expect(CONSTANT_VALUES[ci].length).assertLarger(0);
      expect(CONSTANT_VALUES.indexOf(CONSTANT_VALUES[ci])).assertEqual(ci);
      expect(EXPECTED_VALUES.indexOf(EXPECTED_VALUES[ci])).assertEqual(ci);
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_constantsDataMatrix_c0004 end');
    });

    /**
     * @tc.number SUB_PREBUILD_CONSTANTS_MATRIX_0005
     * @tc.name test_constantsDataMatrix_c0005
     * @tc.desc Verify ConstantsDataMatrix behavior for matrix index 4
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_constantsDataMatrix_c0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_constantsDataMatrix_c0005 begin');
      const ci: number = 4 % CONSTANT_VALUES.length;
      expect(CONSTANT_VALUES.length).assertEqual(5);
      expect(CONSTANT_VALUES[ci]).assertEqual(EXPECTED_VALUES[ci]);
      expect(CONSTANT_VALUES[ci].length).assertLarger(0);
      expect(CONSTANT_VALUES.indexOf(CONSTANT_VALUES[ci])).assertEqual(ci);
      expect(EXPECTED_VALUES.indexOf(EXPECTED_VALUES[ci])).assertEqual(ci);
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_constantsDataMatrix_c0005 end');
    });

    /**
     * @tc.number SUB_PREBUILD_CONSTANTS_MATRIX_0006
     * @tc.name test_constantsDataMatrix_c0006
     * @tc.desc Verify ConstantsDataMatrix behavior for matrix index 5
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_constantsDataMatrix_c0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_constantsDataMatrix_c0006 begin');
      const ci: number = 5 % CONSTANT_VALUES.length;
      expect(CONSTANT_VALUES.length).assertEqual(5);
      expect(CONSTANT_VALUES[ci]).assertEqual(EXPECTED_VALUES[ci]);
      expect(CONSTANT_VALUES[ci].length).assertLarger(0);
      expect(CONSTANT_VALUES.indexOf(CONSTANT_VALUES[ci])).assertEqual(ci);
      expect(EXPECTED_VALUES.indexOf(EXPECTED_VALUES[ci])).assertEqual(ci);
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_constantsDataMatrix_c0006 end');
    });

    /**
     * @tc.number SUB_PREBUILD_CONSTANTS_MATRIX_0128
     * @tc.name test_constantsDataMatrix_c0128
     * @tc.desc Verify ConstantsDataMatrix behavior for matrix index 127
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_constantsDataMatrix_c0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_constantsDataMatrix_c0128 begin');
      const ci: number = 127 % CONSTANT_VALUES.length;
      expect(CONSTANT_VALUES.length).assertEqual(5);
      expect(CONSTANT_VALUES[ci]).assertEqual(EXPECTED_VALUES[ci]);
      expect(CONSTANT_VALUES[ci].length).assertLarger(0);
      expect(CONSTANT_VALUES.indexOf(CONSTANT_VALUES[ci])).assertEqual(ci);
      expect(EXPECTED_VALUES.indexOf(EXPECTED_VALUES[ci])).assertEqual(ci);
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_constantsDataMatrix_c0128 end');
    });

    /**
     * @tc.number SUB_PREBUILD_CONSTANTS_MATRIX_0256
     * @tc.name test_constantsDataMatrix_c0256
     * @tc.desc Verify ConstantsDataMatrix behavior for matrix index 255
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_constantsDataMatrix_c0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_constantsDataMatrix_c0256 begin');
      const ci: number = 255 % CONSTANT_VALUES.length;
      expect(CONSTANT_VALUES.length).assertEqual(5);
      expect(CONSTANT_VALUES[ci]).assertEqual(EXPECTED_VALUES[ci]);
      expect(CONSTANT_VALUES[ci].length).assertLarger(0);
      expect(CONSTANT_VALUES.indexOf(CONSTANT_VALUES[ci])).assertEqual(ci);
      expect(EXPECTED_VALUES.indexOf(EXPECTED_VALUES[ci])).assertEqual(ci);
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_constantsDataMatrix_c0256 end');
    });

  });
}
