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
import { SeekVector, verifySeek } from '../Shared/MatrixFixture';

export default function registerMatrixSeek002(): void {
  describe('MatrixSeek002', (): void => {
    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0001
     * @tc.name MatrixSeek002_0001
     * @tc.desc Verify seek input vector 1 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0001', 0, (): void => {
      const vector = new SeekVector(31.875, 41, 255, 5.125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0002
     * @tc.name MatrixSeek002_0002
     * @tc.desc Verify seek input vector 2 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0002', 0, (): void => {
      const vector = new SeekVector(59.375, 86400000, 100, 51300000);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0003
     * @tc.name MatrixSeek002_0003
     * @tc.desc Verify seek input vector 3 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0003', 0, (): void => {
      const vector = new SeekVector(2.625, 33, 7, 12.375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0004
     * @tc.name MatrixSeek002_0004
     * @tc.desc Verify seek input vector 4 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0004', 0, (): void => {
      const vector = new SeekVector(47.625, 300000, 127, 112500);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0005
     * @tc.name MatrixSeek002_0005
     * @tc.desc Verify seek input vector 5 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0005', 0, (): void => {
      const vector = new SeekVector(39.84375, 3599999, 255, 562499.84375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0006
     * @tc.name MatrixSeek002_0006
     * @tc.desc Verify seek input vector 6 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0006', 0, (): void => {
      const vector = new SeekVector(5.03125, 59999, 7, 43124.28125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0007
     * @tc.name MatrixSeek002_0007
     * @tc.desc Verify seek input vector 7 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0007', 0, (): void => {
      const vector = new SeekVector(1, 5999, 2, 2999.5);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0008
     * @tc.name MatrixSeek002_0008
     * @tc.desc Verify seek input vector 8 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0008', 0, (): void => {
      const vector = new SeekVector(1.84375, 499, 59, 15.59375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0009
     * @tc.name MatrixSeek002_0009
     * @tc.desc Verify seek input vector 9 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0009', 0, (): void => {
      const vector = new SeekVector(156.25, 3600001, 500, 1125000.3125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0010
     * @tc.name MatrixSeek002_0010
     * @tc.desc Verify seek input vector 10 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0010', 0, (): void => {
      const vector = new SeekVector(39.375, 12999, 60, 8530.59375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0011
     * @tc.name MatrixSeek002_0011
     * @tc.desc Verify seek input vector 11 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0011', 0, (): void => {
      const vector = new SeekVector(34.3125, 2, 61, 1.125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0012
     * @tc.name MatrixSeek002_0012
     * @tc.desc Verify seek input vector 12 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0012', 0, (): void => {
      const vector = new SeekVector(28.125, 61000, 60, 28593.75);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0013
     * @tc.name MatrixSeek002_0013
     * @tc.desc Verify seek input vector 13 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0013', 0, (): void => {
      const vector = new SeekVector(0.78125, 120000, 5, 18750);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0014
     * @tc.name MatrixSeek002_0014
     * @tc.desc Verify seek input vector 14 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0014', 0, (): void => {
      const vector = new SeekVector(375, 41, 500, 30.75);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0015
     * @tc.name MatrixSeek002_0015
     * @tc.desc Verify seek input vector 15 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0015', 0, (): void => {
      const vector = new SeekVector(223.125, 60001, 255, 52500.875);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0016
     * @tc.name MatrixSeek002_0016
     * @tc.desc Verify seek input vector 16 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0016', 0, (): void => {
      const vector = new SeekVector(28.59375, 60000, 61, 28125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0017
     * @tc.name MatrixSeek002_0017
     * @tc.desc Verify seek input vector 17 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0017', 0, (): void => {
      const vector = new SeekVector(1031.25, 9999, 1000, 9999);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0018
     * @tc.name MatrixSeek002_0018
     * @tc.desc Verify seek input vector 18 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0018', 0, (): void => {
      const vector = new SeekVector(359.375, 30001, 500, 21563.21875);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0019
     * @tc.name MatrixSeek002_0019
     * @tc.desc Verify seek input vector 19 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0019', 0, (): void => {
      const vector = new SeekVector(48.75, 59999, 60, 48749.1875);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0020
     * @tc.name MatrixSeek002_0020
     * @tc.desc Verify seek input vector 20 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0020', 0, (): void => {
      const vector = new SeekVector(1.96875, 127, 3, 83.34375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0021
     * @tc.name MatrixSeek002_0021
     * @tc.desc Verify seek input vector 21 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0021', 0, (): void => {
      const vector = new SeekVector(27.125, 2, 31, 1.75);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0022
     * @tc.name MatrixSeek002_0022
     * @tc.desc Verify seek input vector 22 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0022', 0, (): void => {
      const vector = new SeekVector(15.25, 30001, 61, 7500.25);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0023
     * @tc.name MatrixSeek002_0023
     * @tc.desc Verify seek input vector 23 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0023', 0, (): void => {
      const vector = new SeekVector(247.03125, 1377, 255, 1333.96875);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0024
     * @tc.name MatrixSeek002_0024
     * @tc.desc Verify seek input vector 24 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0024', 0, (): void => {
      const vector = new SeekVector(2.8125, 6000, 10, 1687.5);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0025
     * @tc.name MatrixSeek002_0025
     * @tc.desc Verify seek input vector 25 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0025', 0, (): void => {
      const vector = new SeekVector(20.28125, 3600001, 59, 1237500.34375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0026
     * @tc.name MatrixSeek002_0026
     * @tc.desc Verify seek input vector 26 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0026', 0, (): void => {
      const vector = new SeekVector(15.5, 1, 16, 0.96875);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0027
     * @tc.name MatrixSeek002_0027
     * @tc.desc Verify seek input vector 27 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0027', 0, (): void => {
      const vector = new SeekVector(750, 1, 1000, 0.75);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0028
     * @tc.name MatrixSeek002_0028
     * @tc.desc Verify seek input vector 28 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0028', 0, (): void => {
      const vector = new SeekVector(0.9375, 6000, 3, 1875);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0029
     * @tc.name MatrixSeek002_0029
     * @tc.desc Verify seek input vector 29 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0029', 0, (): void => {
      const vector = new SeekVector(37.5, 1377, 100, 516.375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0030
     * @tc.name MatrixSeek002_0030
     * @tc.desc Verify seek input vector 30 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0030', 0, (): void => {
      const vector = new SeekVector(3.4375, 499, 10, 171.53125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0031
     * @tc.name MatrixSeek002_0031
     * @tc.desc Verify seek input vector 31 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0031', 0, (): void => {
      const vector = new SeekVector(1.9375, 60001, 31, 3750.0625);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0032
     * @tc.name MatrixSeek002_0032
     * @tc.desc Verify seek input vector 32 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0032', 0, (): void => {
      const vector = new SeekVector(406.25, 10000, 500, 8125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0033
     * @tc.name MatrixSeek002_0033
     * @tc.desc Verify seek input vector 33 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0033', 0, (): void => {
      const vector = new SeekVector(7.1875, 120000, 10, 86250);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0034
     * @tc.name MatrixSeek002_0034
     * @tc.desc Verify seek input vector 34 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0034', 0, (): void => {
      const vector = new SeekVector(906.25, 120000, 1000, 108750);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0035
     * @tc.name MatrixSeek002_0035
     * @tc.desc Verify seek input vector 35 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0035', 0, (): void => {
      const vector = new SeekVector(3, 7, 16, 1.3125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0036
     * @tc.name MatrixSeek002_0036
     * @tc.desc Verify seek input vector 36 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0036', 0, (): void => {
      const vector = new SeekVector(0.78125, 3599999, 5, 562499.84375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0037
     * @tc.name MatrixSeek002_0037
     * @tc.desc Verify seek input vector 37 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0037', 0, (): void => {
      const vector = new SeekVector(32.40625, 12999, 61, 6905.71875);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0038
     * @tc.name MatrixSeek002_0038
     * @tc.desc Verify seek input vector 38 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0038', 0, (): void => {
      const vector = new SeekVector(4.0625, 2, 5, 1.625);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0039
     * @tc.name MatrixSeek002_0039
     * @tc.desc Verify seek input vector 39 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0039', 0, (): void => {
      const vector = new SeekVector(59.09375, 2, 61, 1.9375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0040
     * @tc.name MatrixSeek002_0040
     * @tc.desc Verify seek input vector 40 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0040', 0, (): void => {
      const vector = new SeekVector(4.84375, 99, 5, 95.90625);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0041
     * @tc.name MatrixSeek002_0041
     * @tc.desc Verify seek input vector 41 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0041', 0, (): void => {
      const vector = new SeekVector(10, 127, 10, 127);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0042
     * @tc.name MatrixSeek002_0042
     * @tc.desc Verify seek input vector 42 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0042', 0, (): void => {
      const vector = new SeekVector(43.84375, 172800000, 61, 124200000);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0043
     * @tc.name MatrixSeek002_0043
     * @tc.desc Verify seek input vector 43 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0043', 0, (): void => {
      const vector = new SeekVector(875, 86400000, 1000, 75600000);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0044
     * @tc.name MatrixSeek002_0044
     * @tc.desc Verify seek input vector 44 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0044', 0, (): void => {
      const vector = new SeekVector(50, 172800000, 100, 86400000);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0045
     * @tc.name MatrixSeek002_0045
     * @tc.desc Verify seek input vector 45 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0045', 0, (): void => {
      const vector = new SeekVector(337.5, 12999, 3600, 1218.65625);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0046
     * @tc.name MatrixSeek002_0046
     * @tc.desc Verify seek input vector 46 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0046', 0, (): void => {
      const vector = new SeekVector(0.78125, 9999, 1, 7811.71875);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0047
     * @tc.name MatrixSeek002_0047
     * @tc.desc Verify seek input vector 47 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0047', 0, (): void => {
      const vector = new SeekVector(32.40625, 60000, 61, 31875);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0048
     * @tc.name MatrixSeek002_0048
     * @tc.desc Verify seek input vector 48 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0048', 0, (): void => {
      const vector = new SeekVector(1.75, 1377, 7, 344.25);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0049
     * @tc.name MatrixSeek002_0049
     * @tc.desc Verify seek input vector 49 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0049', 0, (): void => {
      const vector = new SeekVector(3.75, 1, 5, 0.75);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0050
     * @tc.name MatrixSeek002_0050
     * @tc.desc Verify seek input vector 50 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0050', 0, (): void => {
      const vector = new SeekVector(-3.96875, 1, 127, 0);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0051
     * @tc.name MatrixSeek002_0051
     * @tc.desc Verify seek input vector 51 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0051', 0, (): void => {
      const vector = new SeekVector(9, 59999, 16, 33749.4375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0052
     * @tc.name MatrixSeek002_0052
     * @tc.desc Verify seek input vector 52 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0052', 0, (): void => {
      const vector = new SeekVector(7, 999, 16, 437.0625);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0053
     * @tc.name MatrixSeek002_0053
     * @tc.desc Verify seek input vector 53 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0053', 0, (): void => {
      const vector = new SeekVector(468.75, 1001, 1000, 469.21875);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0054
     * @tc.name MatrixSeek002_0054
     * @tc.desc Verify seek input vector 54 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0054', 0, (): void => {
      const vector = new SeekVector(53.125, 10000, 100, 5312.5);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0055
     * @tc.name MatrixSeek002_0055
     * @tc.desc Verify seek input vector 55 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0055', 0, (): void => {
      const vector = new SeekVector(0.875, 10000, 1, 8750);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0056
     * @tc.name MatrixSeek002_0056
     * @tc.desc Verify seek input vector 56 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0056', 0, (): void => {
      const vector = new SeekVector(0, 1377, 59, 0);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0057
     * @tc.name MatrixSeek002_0057
     * @tc.desc Verify seek input vector 57 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0057', 0, (): void => {
      const vector = new SeekVector(937.5, 61000, 1000, 57187.5);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0058
     * @tc.name MatrixSeek002_0058
     * @tc.desc Verify seek input vector 58 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0058', 0, (): void => {
      const vector = new SeekVector(23.96875, 10000, 59, 4062.5);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0059
     * @tc.name MatrixSeek002_0059
     * @tc.desc Verify seek input vector 59 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0059', 0, (): void => {
      const vector = new SeekVector(207.1875, 120000, 255, 97500);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0060
     * @tc.name MatrixSeek002_0060
     * @tc.desc Verify seek input vector 60 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0060', 0, (): void => {
      const vector = new SeekVector(3037.5, 30001, 3600, 25313.34375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0061
     * @tc.name MatrixSeek002_0061
     * @tc.desc Verify seek input vector 61 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0061', 0, (): void => {
      const vector = new SeekVector(13, 86400000, 16, 70200000);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0062
     * @tc.name MatrixSeek002_0062
     * @tc.desc Verify seek input vector 62 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0062', 0, (): void => {
      const vector = new SeekVector(7.625, 120000, 61, 15000);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0063
     * @tc.name MatrixSeek002_0063
     * @tc.desc Verify seek input vector 63 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0063', 0, (): void => {
      const vector = new SeekVector(843.75, 3599999, 1000, 3037499.15625);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0064
     * @tc.name MatrixSeek002_0064
     * @tc.desc Verify seek input vector 64 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0064', 0, (): void => {
      const vector = new SeekVector(281.25, 3599999, 1000, 1012499.71875);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0065
     * @tc.name MatrixSeek002_0065
     * @tc.desc Verify seek input vector 65 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0065', 0, (): void => {
      const vector = new SeekVector(3375, 172800000, 3600, 162000000);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0066
     * @tc.name MatrixSeek002_0066
     * @tc.desc Verify seek input vector 66 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0066', 0, (): void => {
      const vector = new SeekVector(0.125, 7, 2, 0.4375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0067
     * @tc.name MatrixSeek002_0067
     * @tc.desc Verify seek input vector 67 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0067', 0, (): void => {
      const vector = new SeekVector(84.375, 120000, 100, 101250);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0068
     * @tc.name MatrixSeek002_0068
     * @tc.desc Verify seek input vector 68 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0068', 0, (): void => {
      const vector = new SeekVector(4.375, 12999, 10, 5687.0625);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0069
     * @tc.name MatrixSeek002_0069
     * @tc.desc Verify seek input vector 69 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0069', 0, (): void => {
      const vector = new SeekVector(31.25, 33, 100, 10.3125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0070
     * @tc.name MatrixSeek002_0070
     * @tc.desc Verify seek input vector 70 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0070', 0, (): void => {
      const vector = new SeekVector(0.5, 10000, 1, 5000);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0071
     * @tc.name MatrixSeek002_0071
     * @tc.desc Verify seek input vector 71 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0071', 0, (): void => {
      const vector = new SeekVector(9.0625, 30001, 10, 27188.40625);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0072
     * @tc.name MatrixSeek002_0072
     * @tc.desc Verify seek input vector 72 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0072', 0, (): void => {
      const vector = new SeekVector(0.375, 61000, 2, 11437.5);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0073
     * @tc.name MatrixSeek002_0073
     * @tc.desc Verify seek input vector 73 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0073', 0, (): void => {
      const vector = new SeekVector(2137.5, 3599999, 3600, 2137499.40625);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0074
     * @tc.name MatrixSeek002_0074
     * @tc.desc Verify seek input vector 74 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0074', 0, (): void => {
      const vector = new SeekVector(24.375, 30001, 60, 12187.90625);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0075
     * @tc.name MatrixSeek002_0075
     * @tc.desc Verify seek input vector 75 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0075', 0, (): void => {
      const vector = new SeekVector(109.375, 33, 500, 7.21875);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0076
     * @tc.name MatrixSeek002_0076
     * @tc.desc Verify seek input vector 76 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0076', 0, (): void => {
      const vector = new SeekVector(2.90625, 10000, 3, 9687.5);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0077
     * @tc.name MatrixSeek002_0077
     * @tc.desc Verify seek input vector 77 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0077', 0, (): void => {
      const vector = new SeekVector(343.75, 7, 500, 4.8125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0078
     * @tc.name MatrixSeek002_0078
     * @tc.desc Verify seek input vector 78 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0078', 0, (): void => {
      const vector = new SeekVector(63.75, 3599999, 255, 899999.75);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0079
     * @tc.name MatrixSeek002_0079
     * @tc.desc Verify seek input vector 79 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0079', 0, (): void => {
      const vector = new SeekVector(47.65625, 3600001, 61, 2812500.78125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0080
     * @tc.name MatrixSeek002_0080
     * @tc.desc Verify seek input vector 80 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0080', 0, (): void => {
      const vector = new SeekVector(0, 127, 31, 0);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0081
     * @tc.name MatrixSeek002_0081
     * @tc.desc Verify seek input vector 81 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0081', 0, (): void => {
      const vector = new SeekVector(2.5, 499, 5, 249.5);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0082
     * @tc.name MatrixSeek002_0082
     * @tc.desc Verify seek input vector 82 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0082', 0, (): void => {
      const vector = new SeekVector(718.75, 60000, 1000, 43125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0083
     * @tc.name MatrixSeek002_0083
     * @tc.desc Verify seek input vector 83 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0083', 0, (): void => {
      const vector = new SeekVector(1462.5, 300000, 3600, 121875);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0084
     * @tc.name MatrixSeek002_0084
     * @tc.desc Verify seek input vector 84 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0084', 0, (): void => {
      const vector = new SeekVector(3.59375, 9999, 5, 7186.78125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0085
     * @tc.name MatrixSeek002_0085
     * @tc.desc Verify seek input vector 85 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0085', 0, (): void => {
      const vector = new SeekVector(9.375, 120000, 60, 18750);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0086
     * @tc.name MatrixSeek002_0086
     * @tc.desc Verify seek input vector 86 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0086', 0, (): void => {
      const vector = new SeekVector(1.9375, 3599999, 2, 3487499.03125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0087
     * @tc.name MatrixSeek002_0087
     * @tc.desc Verify seek input vector 87 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0087', 0, (): void => {
      const vector = new SeekVector(656.25, 7, 1000, 4.59375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0088
     * @tc.name MatrixSeek002_0088
     * @tc.desc Verify seek input vector 88 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0088', 0, (): void => {
      const vector = new SeekVector(24.21875, 5999, 31, 4686.71875);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0089
     * @tc.name MatrixSeek002_0089
     * @tc.desc Verify seek input vector 89 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0089', 0, (): void => {
      const vector = new SeekVector(103.59375, 6000, 255, 2437.5);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0090
     * @tc.name MatrixSeek002_0090
     * @tc.desc Verify seek input vector 90 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0090', 0, (): void => {
      const vector = new SeekVector(0.75, 499, 2, 187.125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0091
     * @tc.name MatrixSeek002_0091
     * @tc.desc Verify seek input vector 91 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0091', 0, (): void => {
      const vector = new SeekVector(7.5, 120000, 10, 90000);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0092
     * @tc.name MatrixSeek002_0092
     * @tc.desc Verify seek input vector 92 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0092', 0, (): void => {
      const vector = new SeekVector(1.0625, 1, 2, 0.53125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0093
     * @tc.name MatrixSeek002_0093
     * @tc.desc Verify seek input vector 93 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0093', 0, (): void => {
      const vector = new SeekVector(49.78125, 99, 59, 83.53125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0094
     * @tc.name MatrixSeek002_0094
     * @tc.desc Verify seek input vector 94 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0094', 0, (): void => {
      const vector = new SeekVector(40.03125, 1, 61, 0.65625);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0095
     * @tc.name MatrixSeek002_0095
     * @tc.desc Verify seek input vector 95 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0095', 0, (): void => {
      const vector = new SeekVector(7.5, 60000, 16, 28125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0096
     * @tc.name MatrixSeek002_0096
     * @tc.desc Verify seek input vector 96 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0096', 0, (): void => {
      const vector = new SeekVector(223.125, 120000, 255, 105000);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0097
     * @tc.name MatrixSeek002_0097
     * @tc.desc Verify seek input vector 97 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0097', 0, (): void => {
      const vector = new SeekVector(43.125, 6000, 60, 4312.5);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0098
     * @tc.name MatrixSeek002_0098
     * @tc.desc Verify seek input vector 98 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0098', 0, (): void => {
      const vector = new SeekVector(515.625, 60000, 500, 60000);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0099
     * @tc.name MatrixSeek002_0099
     * @tc.desc Verify seek input vector 99 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0099', 0, (): void => {
      const vector = new SeekVector(0.09375, 5999, 3, 187.46875);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK002_0100
     * @tc.name MatrixSeek002_0100
     * @tc.desc Verify seek input vector 100 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek002_0100', 0, (): void => {
      const vector = new SeekVector(0.25, 99, 1, 24.75);
      verifySeek(vector);
    });

  });
}
