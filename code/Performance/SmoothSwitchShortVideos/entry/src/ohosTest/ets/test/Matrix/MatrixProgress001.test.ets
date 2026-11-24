/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it } from '@ohos/hypium';
import { ProgressVector, verifyProgress } from '../Shared/MatrixFixture';

export default function registerMatrixProgress001(): void {
  describe('MatrixProgress001', (): void => {
    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0001
     * @tc.name MatrixProgress001_0001
     * @tc.desc Verify progress input vector 1 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0001', 0, (): void => {
      const vector = new ProgressVector(23.0625, 41, 60, 33);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0002
     * @tc.name MatrixProgress001_0002
     * @tc.desc Verify progress input vector 2 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0002', 0, (): void => {
      const vector = new ProgressVector(749.875, 5999, 16, 2);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0003
     * @tc.name MatrixProgress001_0003
     * @tc.desc Verify progress input vector 3 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0003', 0, (): void => {
      const vector = new ProgressVector(120001, 120000, 100, 100);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0004
     * @tc.name MatrixProgress001_0004
     * @tc.desc Verify progress input vector 4 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0004', 0, (): void => {
      const vector = new ProgressVector(2250000, 3600000, 61, 38);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0005
     * @tc.name MatrixProgress001_0005
     * @tc.desc Verify progress input vector 5 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0005', 0, (): void => {
      const vector = new ProgressVector(15938.03125, 30001, 1, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0006
     * @tc.name MatrixProgress001_0006
     * @tc.desc Verify progress input vector 6 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0006', 0, (): void => {
      const vector = new ProgressVector(0.25, 2, 3600, 450);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0007
     * @tc.name MatrixProgress001_0007
     * @tc.desc Verify progress input vector 7 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0007', 0, (): void => {
      const vector = new ProgressVector(95.625, 255, 100, 37);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0008
     * @tc.name MatrixProgress001_0008
     * @tc.desc Verify progress input vector 8 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0008', 0, (): void => {
      const vector = new ProgressVector(48600000, 172800000, 61, 17);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0009
     * @tc.name MatrixProgress001_0009
     * @tc.desc Verify progress input vector 9 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0009', 0, (): void => {
      const vector = new ProgressVector(20625.34375, 60001, 1, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0010
     * @tc.name MatrixProgress001_0010
     * @tc.desc Verify progress input vector 10 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0010', 0, (): void => {
      const vector = new ProgressVector(311.875, 499, 31, 19);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0011
     * @tc.name MatrixProgress001_0011
     * @tc.desc Verify progress input vector 11 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0011', 0, (): void => {
      const vector = new ProgressVector(7811.71875, 9999, 3600, 2812);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0012
     * @tc.name MatrixProgress001_0012
     * @tc.desc Verify progress input vector 12 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0012', 0, (): void => {
      const vector = new ProgressVector(1687500.46875, 3600001, 255, 119);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0013
     * @tc.name MatrixProgress001_0013
     * @tc.desc Verify progress input vector 13 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0013', 0, (): void => {
      const vector = new ProgressVector(187.6875, 1001, 10, 1);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0014
     * @tc.name MatrixProgress001_0014
     * @tc.desc Verify progress input vector 14 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0014', 0, (): void => {
      const vector = new ProgressVector(624.9375, 9999, 10, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0015
     * @tc.name MatrixProgress001_0015
     * @tc.desc Verify progress input vector 15 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0015', 0, (): void => {
      const vector = new ProgressVector(99.21875, 127, 127, 99);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0016
     * @tc.name MatrixProgress001_0016
     * @tc.desc Verify progress input vector 16 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0016', 0, (): void => {
      const vector = new ProgressVector(5625, 6000, 2, 1);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0017
     * @tc.name MatrixProgress001_0017
     * @tc.desc Verify progress input vector 17 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0017', 0, (): void => {
      const vector = new ProgressVector(969.71875, 1001, 127, 123);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0018
     * @tc.name MatrixProgress001_0018
     * @tc.desc Verify progress input vector 18 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0018', 0, (): void => {
      const vector = new ProgressVector(31875.53125, 60001, 16, 8);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0019
     * @tc.name MatrixProgress001_0019
     * @tc.desc Verify progress input vector 19 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0019', 0, (): void => {
      const vector = new ProgressVector(-1, 9999, 1000, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0020
     * @tc.name MatrixProgress001_0020
     * @tc.desc Verify progress input vector 20 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0020', 0, (): void => {
      const vector = new ProgressVector(249.75, 999, 16, 4);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0021
     * @tc.name MatrixProgress001_0021
     * @tc.desc Verify progress input vector 21 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0021', 0, (): void => {
      const vector = new ProgressVector(199.21875, 255, 255, 199);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0022
     * @tc.name MatrixProgress001_0022
     * @tc.desc Verify progress input vector 22 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0022', 0, (): void => {
      const vector = new ProgressVector(234375, 300000, 3, 2);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0023
     * @tc.name MatrixProgress001_0023
     * @tc.desc Verify progress input vector 23 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0023', 0, (): void => {
      const vector = new ProgressVector(2812.03125, 5999, 10, 4);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0024
     * @tc.name MatrixProgress001_0024
     * @tc.desc Verify progress input vector 24 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0024', 0, (): void => {
      const vector = new ProgressVector(87.3125, 127, 1, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0025
     * @tc.name MatrixProgress001_0025
     * @tc.desc Verify progress input vector 25 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0025', 0, (): void => {
      const vector = new ProgressVector(35.875, 41, 255, 223);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0026
     * @tc.name MatrixProgress001_0026
     * @tc.desc Verify progress input vector 26 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0026', 0, (): void => {
      const vector = new ProgressVector(12.375, 99, 3600, 450);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0027
     * @tc.name MatrixProgress001_0027
     * @tc.desc Verify progress input vector 27 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0027', 0, (): void => {
      const vector = new ProgressVector(1000, 1001, 255, 254);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0028
     * @tc.name MatrixProgress001_0028
     * @tc.desc Verify progress input vector 28 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0028', 0, (): void => {
      const vector = new ProgressVector(2062.5, 6000, 255, 87);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0029
     * @tc.name MatrixProgress001_0029
     * @tc.desc Verify progress input vector 29 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0029', 0, (): void => {
      const vector = new ProgressVector(28.1875, 41, 60, 41);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0030
     * @tc.name MatrixProgress001_0030
     * @tc.desc Verify progress input vector 30 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0030', 0, (): void => {
      const vector = new ProgressVector(55.5625, 127, 255, 111);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0031
     * @tc.name MatrixProgress001_0031
     * @tc.desc Verify progress input vector 31 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0031', 0, (): void => {
      const vector = new ProgressVector(5280.84375, 12999, 1, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0032
     * @tc.name MatrixProgress001_0032
     * @tc.desc Verify progress input vector 32 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0032', 0, (): void => {
      const vector = new ProgressVector(875, 1000, 61, 53);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0033
     * @tc.name MatrixProgress001_0033
     * @tc.desc Verify progress input vector 33 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0033', 0, (): void => {
      const vector = new ProgressVector(1218.65625, 12999, 5, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0034
     * @tc.name MatrixProgress001_0034
     * @tc.desc Verify progress input vector 34 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0034', 0, (): void => {
      const vector = new ProgressVector(0, 120000, 255, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0035
     * @tc.name MatrixProgress001_0035
     * @tc.desc Verify progress input vector 35 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0035', 0, (): void => {
      const vector = new ProgressVector(787500, 3600000, 61, 13);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0036
     * @tc.name MatrixProgress001_0036
     * @tc.desc Verify progress input vector 36 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0036', 0, (): void => {
      const vector = new ProgressVector(875, 1000, 3600, 3150);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0037
     * @tc.name MatrixProgress001_0037
     * @tc.desc Verify progress input vector 37 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0037', 0, (): void => {
      const vector = new ProgressVector(265.09375, 499, 3600, 1912);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0038
     * @tc.name MatrixProgress001_0038
     * @tc.desc Verify progress input vector 38 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0038', 0, (): void => {
      const vector = new ProgressVector(998, 999, 1000, 998);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0039
     * @tc.name MatrixProgress001_0039
     * @tc.desc Verify progress input vector 39 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0039', 0, (): void => {
      const vector = new ProgressVector(167.34375, 255, 16, 10);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0040
     * @tc.name MatrixProgress001_0040
     * @tc.desc Verify progress input vector 40 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0040', 0, (): void => {
      const vector = new ProgressVector(43125, 60000, 7, 5);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0041
     * @tc.name MatrixProgress001_0041
     * @tc.desc Verify progress input vector 41 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0041', 0, (): void => {
      const vector = new ProgressVector(3262500.90625, 3600001, 7, 6);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0042
     * @tc.name MatrixProgress001_0042
     * @tc.desc Verify progress input vector 42 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0042', 0, (): void => {
      const vector = new ProgressVector(0, 9999, 60, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0043
     * @tc.name MatrixProgress001_0043
     * @tc.desc Verify progress input vector 43 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0043', 0, (): void => {
      const vector = new ProgressVector(67500000, 86400000, 16, 12);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0044
     * @tc.name MatrixProgress001_0044
     * @tc.desc Verify progress input vector 44 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0044', 0, (): void => {
      const vector = new ProgressVector(9375, 60000, 5, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0045
     * @tc.name MatrixProgress001_0045
     * @tc.desc Verify progress input vector 45 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0045', 0, (): void => {
      const vector = new ProgressVector(95.90625, 99, 255, 247);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0046
     * @tc.name MatrixProgress001_0046
     * @tc.desc Verify progress input vector 46 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0046', 0, (): void => {
      const vector = new ProgressVector(1075.78125, 1377, 59, 46);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0047
     * @tc.name MatrixProgress001_0047
     * @tc.desc Verify progress input vector 47 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0047', 0, (): void => {
      const vector = new ProgressVector(281.53125, 1001, 500, 140);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0048
     * @tc.name MatrixProgress001_0048
     * @tc.desc Verify progress input vector 48 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0048', 0, (): void => {
      const vector = new ProgressVector(5718.75, 61000, 2, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0049
     * @tc.name MatrixProgress001_0049
     * @tc.desc Verify progress input vector 49 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0049', 0, (): void => {
      const vector = new ProgressVector(6000, 5999, 61, 61);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0050
     * @tc.name MatrixProgress001_0050
     * @tc.desc Verify progress input vector 50 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0050', 0, (): void => {
      const vector = new ProgressVector(116250, 120000, 255, 247);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0051
     * @tc.name MatrixProgress001_0051
     * @tc.desc Verify progress input vector 51 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0051', 0, (): void => {
      const vector = new ProgressVector(10312.84375, 30001, 1000, 343);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0052
     * @tc.name MatrixProgress001_0052
     * @tc.desc Verify progress input vector 52 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0052', 0, (): void => {
      const vector = new ProgressVector(5000, 10000, 2, 1);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0053
     * @tc.name MatrixProgress001_0053
     * @tc.desc Verify progress input vector 53 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0053', 0, (): void => {
      const vector = new ProgressVector(11.34375, 33, 500, 171);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0054
     * @tc.name MatrixProgress001_0054
     * @tc.desc Verify progress input vector 54 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0054', 0, (): void => {
      const vector = new ProgressVector(2925000.8125, 3600001, 127, 103);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0055
     * @tc.name MatrixProgress001_0055
     * @tc.desc Verify progress input vector 55 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0055', 0, (): void => {
      const vector = new ProgressVector(0.1875, 1, 59, 11);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0056
     * @tc.name MatrixProgress001_0056
     * @tc.desc Verify progress input vector 56 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0056', 0, (): void => {
      const vector = new ProgressVector(1, 10000, 127, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0057
     * @tc.name MatrixProgress001_0057
     * @tc.desc Verify progress input vector 57 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0057', 0, (): void => {
      const vector = new ProgressVector(7500, 120000, 500, 31);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0058
     * @tc.name MatrixProgress001_0058
     * @tc.desc Verify progress input vector 58 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0058', 0, (): void => {
      const vector = new ProgressVector(0.75, 1, 31, 23);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0059
     * @tc.name MatrixProgress001_0059
     * @tc.desc Verify progress input vector 59 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0059', 0, (): void => {
      const vector = new ProgressVector(77.34375, 99, 2, 1);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0060
     * @tc.name MatrixProgress001_0060
     * @tc.desc Verify progress input vector 60 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0060', 0, (): void => {
      const vector = new ProgressVector(28125, 60000, 31, 14);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0061
     * @tc.name MatrixProgress001_0061
     * @tc.desc Verify progress input vector 61 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0061', 0, (): void => {
      const vector = new ProgressVector(46.78125, 499, 1000, 93);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0062
     * @tc.name MatrixProgress001_0062
     * @tc.desc Verify progress input vector 62 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0062', 0, (): void => {
      const vector = new ProgressVector(4687.5, 6000, 2, 1);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0063
     * @tc.name MatrixProgress001_0063
     * @tc.desc Verify progress input vector 63 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0063', 0, (): void => {
      const vector = new ProgressVector(56250.9375, 60001, 1, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0064
     * @tc.name MatrixProgress001_0064
     * @tc.desc Verify progress input vector 64 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0064', 0, (): void => {
      const vector = new ProgressVector(0.71875, 1, 61, 43);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0065
     * @tc.name MatrixProgress001_0065
     * @tc.desc Verify progress input vector 65 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0065', 0, (): void => {
      const vector = new ProgressVector(1350000, 3600000, 100, 37);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0066
     * @tc.name MatrixProgress001_0066
     * @tc.desc Verify progress input vector 66 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0066', 0, (): void => {
      const vector = new ProgressVector(102600000, 172800000, 16, 9);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0067
     * @tc.name MatrixProgress001_0067
     * @tc.desc Verify progress input vector 67 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0067', 0, (): void => {
      const vector = new ProgressVector(43125.71875, 60001, 60, 43);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0068
     * @tc.name MatrixProgress001_0068
     * @tc.desc Verify progress input vector 68 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0068', 0, (): void => {
      const vector = new ProgressVector(16875, 60000, 127, 35);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0069
     * @tc.name MatrixProgress001_0069
     * @tc.desc Verify progress input vector 69 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0069', 0, (): void => {
      const vector = new ProgressVector(300001, 300000, 61, 61);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0070
     * @tc.name MatrixProgress001_0070
     * @tc.desc Verify progress input vector 70 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0070', 0, (): void => {
      const vector = new ProgressVector(5.15625, 33, 31, 4);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0071
     * @tc.name MatrixProgress001_0071
     * @tc.desc Verify progress input vector 71 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0071', 0, (): void => {
      const vector = new ProgressVector(3150000.875, 3600001, 3, 2);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0072
     * @tc.name MatrixProgress001_0072
     * @tc.desc Verify progress input vector 72 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0072', 0, (): void => {
      const vector = new ProgressVector(452.21875, 499, 16, 14);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0073
     * @tc.name MatrixProgress001_0073
     * @tc.desc Verify progress input vector 73 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0073', 0, (): void => {
      const vector = new ProgressVector(2812.5, 10000, 255, 71);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0074
     * @tc.name MatrixProgress001_0074
     * @tc.desc Verify progress input vector 74 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0074', 0, (): void => {
      const vector = new ProgressVector(4.8125, 7, 7, 4);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0075
     * @tc.name MatrixProgress001_0075
     * @tc.desc Verify progress input vector 75 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0075', 0, (): void => {
      const vector = new ProgressVector(1.0625, 2, 5, 2);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0076
     * @tc.name MatrixProgress001_0076
     * @tc.desc Verify progress input vector 76 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0076', 0, (): void => {
      const vector = new ProgressVector(156.09375, 999, 61, 9);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0077
     * @tc.name MatrixProgress001_0077
     * @tc.desc Verify progress input vector 77 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0077', 0, (): void => {
      const vector = new ProgressVector(593.75, 1000, 2, 1);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0078
     * @tc.name MatrixProgress001_0078
     * @tc.desc Verify progress input vector 78 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0078', 0, (): void => {
      const vector = new ProgressVector(688.5, 1377, 16, 8);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0079
     * @tc.name MatrixProgress001_0079
     * @tc.desc Verify progress input vector 79 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0079', 0, (): void => {
      const vector = new ProgressVector(43125, 60000, 61, 43);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0080
     * @tc.name MatrixProgress001_0080
     * @tc.desc Verify progress input vector 80 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0080', 0, (): void => {
      const vector = new ProgressVector(81000000, 172800000, 2, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0081
     * @tc.name MatrixProgress001_0081
     * @tc.desc Verify progress input vector 81 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0081', 0, (): void => {
      const vector = new ProgressVector(14999.75, 59999, 7, 1);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0082
     * @tc.name MatrixProgress001_0082
     * @tc.desc Verify progress input vector 82 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0082', 0, (): void => {
      const vector = new ProgressVector(750.75, 1001, 1000, 750);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0083
     * @tc.name MatrixProgress001_0083
     * @tc.desc Verify progress input vector 83 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0083', 0, (): void => {
      const vector = new ProgressVector(26250.4375, 60001, 31, 13);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0084
     * @tc.name MatrixProgress001_0084
     * @tc.desc Verify progress input vector 84 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0084', 0, (): void => {
      const vector = new ProgressVector(225000, 300000, 1, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0085
     * @tc.name MatrixProgress001_0085
     * @tc.desc Verify progress input vector 85 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0085', 0, (): void => {
      const vector = new ProgressVector(29700000, 86400000, 3600, 1237);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0086
     * @tc.name MatrixProgress001_0086
     * @tc.desc Verify progress input vector 86 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0086', 0, (): void => {
      const vector = new ProgressVector(2812.5, 6000, 5, 2);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0087
     * @tc.name MatrixProgress001_0087
     * @tc.desc Verify progress input vector 87 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0087', 0, (): void => {
      const vector = new ProgressVector(26250.875, 30001, 255, 223);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0088
     * @tc.name MatrixProgress001_0088
     * @tc.desc Verify progress input vector 88 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0088', 0, (): void => {
      const vector = new ProgressVector(135.46875, 255, 1, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0089
     * @tc.name MatrixProgress001_0089
     * @tc.desc Verify progress input vector 89 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0089', 0, (): void => {
      const vector = new ProgressVector(9343.03125, 12999, 10, 7);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0090
     * @tc.name MatrixProgress001_0090
     * @tc.desc Verify progress input vector 90 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0090', 0, (): void => {
      const vector = new ProgressVector(25.78125, 33, 16, 12);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0091
     * @tc.name MatrixProgress001_0091
     * @tc.desc Verify progress input vector 91 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0091', 0, (): void => {
      const vector = new ProgressVector(0.4375, 1, 2, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0092
     * @tc.name MatrixProgress001_0092
     * @tc.desc Verify progress input vector 92 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0092', 0, (): void => {
      const vector = new ProgressVector(327.46875, 499, 255, 167);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0093
     * @tc.name MatrixProgress001_0093
     * @tc.desc Verify progress input vector 93 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0093', 0, (): void => {
      const vector = new ProgressVector(2.5625, 41, 5, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0094
     * @tc.name MatrixProgress001_0094
     * @tc.desc Verify progress input vector 94 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0094', 0, (): void => {
      const vector = new ProgressVector(1.4375, 2, 16, 11);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0095
     * @tc.name MatrixProgress001_0095
     * @tc.desc Verify progress input vector 95 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0095', 0, (): void => {
      const vector = new ProgressVector(113400000, 172800000, 1, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0096
     * @tc.name MatrixProgress001_0096
     * @tc.desc Verify progress input vector 96 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0096', 0, (): void => {
      const vector = new ProgressVector(2812.5, 6000, 16, 7);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0097
     * @tc.name MatrixProgress001_0097
     * @tc.desc Verify progress input vector 97 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0097', 0, (): void => {
      const vector = new ProgressVector(127.5, 255, 31, 15);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0098
     * @tc.name MatrixProgress001_0098
     * @tc.desc Verify progress input vector 98 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0098', 0, (): void => {
      const vector = new ProgressVector(4124.3125, 5999, 500, 343);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0099
     * @tc.name MatrixProgress001_0099
     * @tc.desc Verify progress input vector 99 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0099', 0, (): void => {
      const vector = new ProgressVector(3037499.15625, 3599999, 3600, 3037);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS001_0100
     * @tc.name MatrixProgress001_0100
     * @tc.desc Verify progress input vector 100 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress001_0100', 0, (): void => {
      const vector = new ProgressVector(37500, 60000, 5, 3);
      verifyProgress(vector);
    });

  });
}
