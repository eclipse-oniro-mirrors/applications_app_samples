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

export default function registerMatrixProgress002(): void {
  describe('MatrixProgress002', (): void => {
    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0001
     * @tc.name MatrixProgress002_0001
     * @tc.desc Verify progress input vector 1 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0001', 0, (): void => {
      const vector = new ProgressVector(1333.96875, 1377, 127, 123);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0002
     * @tc.name MatrixProgress002_0002
     * @tc.desc Verify progress input vector 2 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0002', 0, (): void => {
      const vector = new ProgressVector(79.375, 127, 100, 62);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0003
     * @tc.name MatrixProgress002_0003
     * @tc.desc Verify progress input vector 3 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0003', 0, (): void => {
      const vector = new ProgressVector(430.3125, 1377, 1000, 312);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0004
     * @tc.name MatrixProgress002_0004
     * @tc.desc Verify progress input vector 4 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0004', 0, (): void => {
      const vector = new ProgressVector(5624.90625, 59999, 7, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0005
     * @tc.name MatrixProgress002_0005
     * @tc.desc Verify progress input vector 5 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0005', 0, (): void => {
      const vector = new ProgressVector(655.59375, 999, 2, 1);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0006
     * @tc.name MatrixProgress002_0006
     * @tc.desc Verify progress input vector 6 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0006', 0, (): void => {
      const vector = new ProgressVector(9687.5, 10000, 10, 9);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0007
     * @tc.name MatrixProgress002_0007
     * @tc.desc Verify progress input vector 7 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0007', 0, (): void => {
      const vector = new ProgressVector(0.21875, 7, 100, 3);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0008
     * @tc.name MatrixProgress002_0008
     * @tc.desc Verify progress input vector 8 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0008', 0, (): void => {
      const vector = new ProgressVector(83.53125, 99, 127, 107);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0009
     * @tc.name MatrixProgress002_0009
     * @tc.desc Verify progress input vector 9 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0009', 0, (): void => {
      const vector = new ProgressVector(0, 120000, 61, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0010
     * @tc.name MatrixProgress002_0010
     * @tc.desc Verify progress input vector 10 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0010', 0, (): void => {
      const vector = new ProgressVector(108750, 120000, 3, 2);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0011
     * @tc.name MatrixProgress002_0011
     * @tc.desc Verify progress input vector 11 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0011', 0, (): void => {
      const vector = new ProgressVector(15000.25, 60001, 59, 14);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0012
     * @tc.name MatrixProgress002_0012
     * @tc.desc Verify progress input vector 12 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0012', 0, (): void => {
      const vector = new ProgressVector(5.90625, 7, 61, 51);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0013
     * @tc.name MatrixProgress002_0013
     * @tc.desc Verify progress input vector 13 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0013', 0, (): void => {
      const vector = new ProgressVector(1, 30001, 127, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0014
     * @tc.name MatrixProgress002_0014
     * @tc.desc Verify progress input vector 14 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0014', 0, (): void => {
      const vector = new ProgressVector(28124.53125, 59999, 5, 2);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0015
     * @tc.name MatrixProgress002_0015
     * @tc.desc Verify progress input vector 15 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0015', 0, (): void => {
      const vector = new ProgressVector(58124.03125, 59999, 60, 58);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0016
     * @tc.name MatrixProgress002_0016
     * @tc.desc Verify progress input vector 16 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0016', 0, (): void => {
      const vector = new ProgressVector(86400000, 86400000, 100, 100);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0017
     * @tc.name MatrixProgress002_0017
     * @tc.desc Verify progress input vector 17 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0017', 0, (): void => {
      const vector = new ProgressVector(93.5625, 499, 3600, 675);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0018
     * @tc.name MatrixProgress002_0018
     * @tc.desc Verify progress input vector 18 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0018', 0, (): void => {
      const vector = new ProgressVector(2062.15625, 5999, 127, 43);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0019
     * @tc.name MatrixProgress002_0019
     * @tc.desc Verify progress input vector 19 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0019', 0, (): void => {
      const vector = new ProgressVector(7, 7, 100, 100);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0020
     * @tc.name MatrixProgress002_0020
     * @tc.desc Verify progress input vector 20 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0020', 0, (): void => {
      const vector = new ProgressVector(5000, 10000, 255, 127);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0021
     * @tc.name MatrixProgress002_0021
     * @tc.desc Verify progress input vector 21 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0021', 0, (): void => {
      const vector = new ProgressVector(937.5, 1000, 5, 4);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0022
     * @tc.name MatrixProgress002_0022
     * @tc.desc Verify progress input vector 22 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0022', 0, (): void => {
      const vector = new ProgressVector(218.53125, 999, 3600, 787);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0023
     * @tc.name MatrixProgress002_0023
     * @tc.desc Verify progress input vector 23 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0023', 0, (): void => {
      const vector = new ProgressVector(151.40625, 255, 5, 2);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0024
     * @tc.name MatrixProgress002_0024
     * @tc.desc Verify progress input vector 24 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0024', 0, (): void => {
      const vector = new ProgressVector(12592.78125, 12999, 10, 9);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0025
     * @tc.name MatrixProgress002_0025
     * @tc.desc Verify progress input vector 25 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0025', 0, (): void => {
      const vector = new ProgressVector(16.5, 33, 2, 1);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0026
     * @tc.name MatrixProgress002_0026
     * @tc.desc Verify progress input vector 26 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0026', 0, (): void => {
      const vector = new ProgressVector(3.28125, 7, 5, 2);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0027
     * @tc.name MatrixProgress002_0027
     * @tc.desc Verify progress input vector 27 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0027', 0, (): void => {
      const vector = new ProgressVector(0.0625, 2, 59, 1);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0028
     * @tc.name MatrixProgress002_0028
     * @tc.desc Verify progress input vector 28 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0028', 0, (): void => {
      const vector = new ProgressVector(48749.1875, 59999, 2, 1);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0029
     * @tc.name MatrixProgress002_0029
     * @tc.desc Verify progress input vector 29 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0029', 0, (): void => {
      const vector = new ProgressVector(156.25, 1000, 7, 1);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0030
     * @tc.name MatrixProgress002_0030
     * @tc.desc Verify progress input vector 30 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0030', 0, (): void => {
      const vector = new ProgressVector(875, 1000, 2, 1);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0031
     * @tc.name MatrixProgress002_0031
     * @tc.desc Verify progress input vector 31 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0031', 0, (): void => {
      const vector = new ProgressVector(3125, 10000, 16, 5);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0032
     * @tc.name MatrixProgress002_0032
     * @tc.desc Verify progress input vector 32 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0032', 0, (): void => {
      const vector = new ProgressVector(674999.8125, 3599999, 3, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0033
     * @tc.name MatrixProgress002_0033
     * @tc.desc Verify progress input vector 33 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0033', 0, (): void => {
      const vector = new ProgressVector(91.28125, 127, 255, 183);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0034
     * @tc.name MatrixProgress002_0034
     * @tc.desc Verify progress input vector 34 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0034', 0, (): void => {
      const vector = new ProgressVector(0.5, 1, 1, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0035
     * @tc.name MatrixProgress002_0035
     * @tc.desc Verify progress input vector 35 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0035', 0, (): void => {
      const vector = new ProgressVector(8936.8125, 12999, 16, 11);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0036
     * @tc.name MatrixProgress002_0036
     * @tc.desc Verify progress input vector 36 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0036', 0, (): void => {
      const vector = new ProgressVector(0, 60000, 61, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0037
     * @tc.name MatrixProgress002_0037
     * @tc.desc Verify progress input vector 37 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0037', 0, (): void => {
      const vector = new ProgressVector(14.09375, 41, 16, 5);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0038
     * @tc.name MatrixProgress002_0038
     * @tc.desc Verify progress input vector 38 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0038', 0, (): void => {
      const vector = new ProgressVector(27.78125, 127, 500, 109);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0039
     * @tc.name MatrixProgress002_0039
     * @tc.desc Verify progress input vector 39 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0039', 0, (): void => {
      const vector = new ProgressVector(123.03125, 127, 60, 58);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0040
     * @tc.name MatrixProgress002_0040
     * @tc.desc Verify progress input vector 40 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0040', 0, (): void => {
      const vector = new ProgressVector(2812.5, 10000, 5, 1);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0041
     * @tc.name MatrixProgress002_0041
     * @tc.desc Verify progress input vector 41 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0041', 0, (): void => {
      const vector = new ProgressVector(51.59375, 127, 7, 2);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0042
     * @tc.name MatrixProgress002_0042
     * @tc.desc Verify progress input vector 42 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0042', 0, (): void => {
      const vector = new ProgressVector(90000, 120000, 1000, 750);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0043
     * @tc.name MatrixProgress002_0043
     * @tc.desc Verify progress input vector 43 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0043', 0, (): void => {
      const vector = new ProgressVector(172799999, 172800000, 1000, 999);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0044
     * @tc.name MatrixProgress002_0044
     * @tc.desc Verify progress input vector 44 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0044', 0, (): void => {
      const vector = new ProgressVector(121875, 300000, 10, 4);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0045
     * @tc.name MatrixProgress002_0045
     * @tc.desc Verify progress input vector 45 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0045', 0, (): void => {
      const vector = new ProgressVector(782.03125, 1001, 127, 99);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0046
     * @tc.name MatrixProgress002_0046
     * @tc.desc Verify progress input vector 46 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0046', 0, (): void => {
      const vector = new ProgressVector(22.6875, 33, 1000, 687);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0047
     * @tc.name MatrixProgress002_0047
     * @tc.desc Verify progress input vector 47 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0047', 0, (): void => {
      const vector = new ProgressVector(-1, 1001, 3600, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0048
     * @tc.name MatrixProgress002_0048
     * @tc.desc Verify progress input vector 48 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0048', 0, (): void => {
      const vector = new ProgressVector(38.4375, 41, 1000, 937);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0049
     * @tc.name MatrixProgress002_0049
     * @tc.desc Verify progress input vector 49 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0049', 0, (): void => {
      const vector = new ProgressVector(140625, 300000, 59, 27);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0050
     * @tc.name MatrixProgress002_0050
     * @tc.desc Verify progress input vector 50 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0050', 0, (): void => {
      const vector = new ProgressVector(12999, 12999, 2, 2);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0051
     * @tc.name MatrixProgress002_0051
     * @tc.desc Verify progress input vector 51 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0051', 0, (): void => {
      const vector = new ProgressVector(1, 12999, 1000, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0052
     * @tc.name MatrixProgress002_0052
     * @tc.desc Verify progress input vector 52 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0052', 0, (): void => {
      const vector = new ProgressVector(4687.03125, 9999, 59, 27);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0053
     * @tc.name MatrixProgress002_0053
     * @tc.desc Verify progress input vector 53 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0053', 0, (): void => {
      const vector = new ProgressVector(78750, 120000, 3600, 2362);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0054
     * @tc.name MatrixProgress002_0054
     * @tc.desc Verify progress input vector 54 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0054', 0, (): void => {
      const vector = new ProgressVector(155.9375, 499, 500, 156);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0055
     * @tc.name MatrixProgress002_0055
     * @tc.desc Verify progress input vector 55 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0055', 0, (): void => {
      const vector = new ProgressVector(749.25, 999, 31, 23);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0056
     * @tc.name MatrixProgress002_0056
     * @tc.desc Verify progress input vector 56 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0056', 0, (): void => {
      const vector = new ProgressVector(449999.875, 3599999, 7, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0057
     * @tc.name MatrixProgress002_0057
     * @tc.desc Verify progress input vector 57 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0057', 0, (): void => {
      const vector = new ProgressVector(43125.71875, 60001, 5, 3);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0058
     * @tc.name MatrixProgress002_0058
     * @tc.desc Verify progress input vector 58 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0058', 0, (): void => {
      const vector = new ProgressVector(1, 172800000, 5, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0059
     * @tc.name MatrixProgress002_0059
     * @tc.desc Verify progress input vector 59 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0059', 0, (): void => {
      const vector = new ProgressVector(5998, 5999, 60, 59);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0060
     * @tc.name MatrixProgress002_0060
     * @tc.desc Verify progress input vector 60 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0060', 0, (): void => {
      const vector = new ProgressVector(2187.28125, 9999, 127, 27);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0061
     * @tc.name MatrixProgress002_0061
     * @tc.desc Verify progress input vector 61 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0061', 0, (): void => {
      const vector = new ProgressVector(0.84375, 1, 3600, 3037);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0062
     * @tc.name MatrixProgress002_0062
     * @tc.desc Verify progress input vector 62 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0062', 0, (): void => {
      const vector = new ProgressVector(90000, 120000, 61, 45);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0063
     * @tc.name MatrixProgress002_0063
     * @tc.desc Verify progress input vector 63 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0063', 0, (): void => {
      const vector = new ProgressVector(249.5, 499, 1, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0064
     * @tc.name MatrixProgress002_0064
     * @tc.desc Verify progress input vector 64 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0064', 0, (): void => {
      const vector = new ProgressVector(61000, 61000, 3, 3);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0065
     * @tc.name MatrixProgress002_0065
     * @tc.desc Verify progress input vector 65 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0065', 0, (): void => {
      const vector = new ProgressVector(718.03125, 999, 3, 2);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0066
     * @tc.name MatrixProgress002_0066
     * @tc.desc Verify progress input vector 66 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0066', 0, (): void => {
      const vector = new ProgressVector(129600000, 172800000, 31, 23);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0067
     * @tc.name MatrixProgress002_0067
     * @tc.desc Verify progress input vector 67 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0067', 0, (): void => {
      const vector = new ProgressVector(-1, 86400000, 255, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0068
     * @tc.name MatrixProgress002_0068
     * @tc.desc Verify progress input vector 68 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0068', 0, (): void => {
      const vector = new ProgressVector(405.4375, 499, 7, 5);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0069
     * @tc.name MatrixProgress002_0069
     * @tc.desc Verify progress input vector 69 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0069', 0, (): void => {
      const vector = new ProgressVector(-1, 120000, 1, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0070
     * @tc.name MatrixProgress002_0070
     * @tc.desc Verify progress input vector 70 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0070', 0, (): void => {
      const vector = new ProgressVector(58.78125, 99, 60, 35);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0071
     * @tc.name MatrixProgress002_0071
     * @tc.desc Verify progress input vector 71 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0071', 0, (): void => {
      const vector = new ProgressVector(0, 172800000, 127, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0072
     * @tc.name MatrixProgress002_0072
     * @tc.desc Verify progress input vector 72 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0072', 0, (): void => {
      const vector = new ProgressVector(750, 6000, 61, 7);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0073
     * @tc.name MatrixProgress002_0073
     * @tc.desc Verify progress input vector 73 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0073', 0, (): void => {
      const vector = new ProgressVector(5249.125, 5999, 10, 8);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0074
     * @tc.name MatrixProgress002_0074
     * @tc.desc Verify progress input vector 74 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0074', 0, (): void => {
      const vector = new ProgressVector(3374999.0625, 3599999, 5, 4);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0075
     * @tc.name MatrixProgress002_0075
     * @tc.desc Verify progress input vector 75 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0075', 0, (): void => {
      const vector = new ProgressVector(473.34375, 1377, 100, 34);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0076
     * @tc.name MatrixProgress002_0076
     * @tc.desc Verify progress input vector 76 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0076', 0, (): void => {
      const vector = new ProgressVector(13125.21875, 60001, 60, 13);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0077
     * @tc.name MatrixProgress002_0077
     * @tc.desc Verify progress input vector 77 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0077', 0, (): void => {
      const vector = new ProgressVector(6.1875, 33, 7, 1);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0078
     * @tc.name MatrixProgress002_0078
     * @tc.desc Verify progress input vector 78 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0078', 0, (): void => {
      const vector = new ProgressVector(5249.125, 5999, 7, 6);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0079
     * @tc.name MatrixProgress002_0079
     * @tc.desc Verify progress input vector 79 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0079', 0, (): void => {
      const vector = new ProgressVector(20625.6875, 30001, 59, 40);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0080
     * @tc.name MatrixProgress002_0080
     * @tc.desc Verify progress input vector 80 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0080', 0, (): void => {
      const vector = new ProgressVector(1875.0625, 30001, 100, 6);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0081
     * @tc.name MatrixProgress002_0081
     * @tc.desc Verify progress input vector 81 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0081', 0, (): void => {
      const vector = new ProgressVector(22.6875, 33, 1, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0082
     * @tc.name MatrixProgress002_0082
     * @tc.desc Verify progress input vector 82 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0082', 0, (): void => {
      const vector = new ProgressVector(27.84375, 33, 127, 107);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0083
     * @tc.name MatrixProgress002_0083
     * @tc.desc Verify progress input vector 83 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0083', 0, (): void => {
      const vector = new ProgressVector(937.5, 10000, 100, 9);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0084
     * @tc.name MatrixProgress002_0084
     * @tc.desc Verify progress input vector 84 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0084', 0, (): void => {
      const vector = new ProgressVector(98, 99, 100, 98);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0085
     * @tc.name MatrixProgress002_0085
     * @tc.desc Verify progress input vector 85 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0085', 0, (): void => {
      const vector = new ProgressVector(718.03125, 999, 59, 42);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0086
     * @tc.name MatrixProgress002_0086
     * @tc.desc Verify progress input vector 86 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0086', 0, (): void => {
      const vector = new ProgressVector(2625, 6000, 60, 26);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0087
     * @tc.name MatrixProgress002_0087
     * @tc.desc Verify progress input vector 87 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0087', 0, (): void => {
      const vector = new ProgressVector(6, 7, 100, 85);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0088
     * @tc.name MatrixProgress002_0088
     * @tc.desc Verify progress input vector 88 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0088', 0, (): void => {
      const vector = new ProgressVector(337499.90625, 3599999, 10, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0089
     * @tc.name MatrixProgress002_0089
     * @tc.desc Verify progress input vector 89 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0089', 0, (): void => {
      const vector = new ProgressVector(75000, 300000, 100, 25);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0090
     * @tc.name MatrixProgress002_0090
     * @tc.desc Verify progress input vector 90 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0090', 0, (): void => {
      const vector = new ProgressVector(781.25, 1000, 2, 1);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0091
     * @tc.name MatrixProgress002_0091
     * @tc.desc Verify progress input vector 91 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0091', 0, (): void => {
      const vector = new ProgressVector(4999.5, 9999, 59, 29);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0092
     * @tc.name MatrixProgress002_0092
     * @tc.desc Verify progress input vector 92 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0092', 0, (): void => {
      const vector = new ProgressVector(842.90625, 999, 3600, 3037);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0093
     * @tc.name MatrixProgress002_0093
     * @tc.desc Verify progress input vector 93 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0093', 0, (): void => {
      const vector = new ProgressVector(11.90625, 127, 3, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0094
     * @tc.name MatrixProgress002_0094
     * @tc.desc Verify progress input vector 94 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0094', 0, (): void => {
      const vector = new ProgressVector(30000, 60000, 100, 50);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0095
     * @tc.name MatrixProgress002_0095
     * @tc.desc Verify progress input vector 95 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0095', 0, (): void => {
      const vector = new ProgressVector(2812.5, 10000, 3, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0096
     * @tc.name MatrixProgress002_0096
     * @tc.desc Verify progress input vector 96 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0096', 0, (): void => {
      const vector = new ProgressVector(498, 499, 7, 6);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0097
     * @tc.name MatrixProgress002_0097
     * @tc.desc Verify progress input vector 97 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0097', 0, (): void => {
      const vector = new ProgressVector(60001, 60000, 16, 16);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0098
     * @tc.name MatrixProgress002_0098
     * @tc.desc Verify progress input vector 98 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0098', 0, (): void => {
      const vector = new ProgressVector(406.65625, 1001, 127, 51);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0099
     * @tc.name MatrixProgress002_0099
     * @tc.desc Verify progress input vector 99 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0099', 0, (): void => {
      const vector = new ProgressVector(37500, 120000, 1000, 312);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS002_0100
     * @tc.name MatrixProgress002_0100
     * @tc.desc Verify progress input vector 100 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress002_0100', 0, (): void => {
      const vector = new ProgressVector(468.75, 1000, 59, 27);
      verifyProgress(vector);
    });

  });
}
