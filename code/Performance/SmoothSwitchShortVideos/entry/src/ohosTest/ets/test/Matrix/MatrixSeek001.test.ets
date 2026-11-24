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

export default function registerMatrixSeek001(): void {
  describe('MatrixSeek001', (): void => {
    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0001
     * @tc.name MatrixSeek001_0001
     * @tc.desc Verify seek input vector 1 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0001', 0, (): void => {
      const vector = new SeekVector(0.9375, 499, 10, 46.78125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0002
     * @tc.name MatrixSeek001_0002
     * @tc.desc Verify seek input vector 2 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0002', 0, (): void => {
      const vector = new SeekVector(6.125, 300000, 7, 262500);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0003
     * @tc.name MatrixSeek001_0003
     * @tc.desc Verify seek input vector 3 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0003', 0, (): void => {
      const vector = new SeekVector(47.65625, 86400000, 61, 67500000);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0004
     * @tc.name MatrixSeek001_0004
     * @tc.desc Verify seek input vector 4 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0004', 0, (): void => {
      const vector = new SeekVector(281.25, 999, 1000, 280.96875);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0005
     * @tc.name MatrixSeek001_0005
     * @tc.desc Verify seek input vector 5 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0005', 0, (): void => {
      const vector = new SeekVector(46.875, 99, 60, 77.34375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0006
     * @tc.name MatrixSeek001_0006
     * @tc.desc Verify seek input vector 6 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0006', 0, (): void => {
      const vector = new SeekVector(1.125, 3599999, 3, 1349999.625);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0007
     * @tc.name MatrixSeek001_0007
     * @tc.desc Verify seek input vector 7 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0007', 0, (): void => {
      const vector = new SeekVector(-112.5, 1, 3600, 0);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0008
     * @tc.name MatrixSeek001_0008
     * @tc.desc Verify seek input vector 8 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0008', 0, (): void => {
      const vector = new SeekVector(250, 33, 500, 16.5);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0009
     * @tc.name MatrixSeek001_0009
     * @tc.desc Verify seek input vector 9 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0009', 0, (): void => {
      const vector = new SeekVector(95.625, 9999, 255, 3749.625);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0010
     * @tc.name MatrixSeek001_0010
     * @tc.desc Verify seek input vector 10 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0010', 0, (): void => {
      const vector = new SeekVector(1.875, 127, 3, 79.375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0011
     * @tc.name MatrixSeek001_0011
     * @tc.desc Verify seek input vector 11 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0011', 0, (): void => {
      const vector = new SeekVector(31.25, 30001, 1000, 937.53125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0012
     * @tc.name MatrixSeek001_0012
     * @tc.desc Verify seek input vector 12 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0012', 0, (): void => {
      const vector = new SeekVector(-31.25, 10000, 500, 0);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0013
     * @tc.name MatrixSeek001_0013
     * @tc.desc Verify seek input vector 13 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0013', 0, (): void => {
      const vector = new SeekVector(135.46875, 999, 255, 530.71875);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0014
     * @tc.name MatrixSeek001_0014
     * @tc.desc Verify seek input vector 14 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0014', 0, (): void => {
      const vector = new SeekVector(10, 3600001, 10, 3600001);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0015
     * @tc.name MatrixSeek001_0015
     * @tc.desc Verify seek input vector 15 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0015', 0, (): void => {
      const vector = new SeekVector(2.625, 3600001, 7, 1350000.375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0016
     * @tc.name MatrixSeek001_0016
     * @tc.desc Verify seek input vector 16 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0016', 0, (): void => {
      const vector = new SeekVector(0.1875, 120000, 1, 22500);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0017
     * @tc.name MatrixSeek001_0017
     * @tc.desc Verify seek input vector 17 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0017', 0, (): void => {
      const vector = new SeekVector(0, 30001, 127, 0);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0018
     * @tc.name MatrixSeek001_0018
     * @tc.desc Verify seek input vector 18 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0018', 0, (): void => {
      const vector = new SeekVector(718.75, 3599999, 1000, 2587499.28125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0019
     * @tc.name MatrixSeek001_0019
     * @tc.desc Verify seek input vector 19 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0019', 0, (): void => {
      const vector = new SeekVector(11.25, 99, 60, 18.5625);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0020
     * @tc.name MatrixSeek001_0020
     * @tc.desc Verify seek input vector 20 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0020', 0, (): void => {
      const vector = new SeekVector(1.9375, 30001, 31, 1875.0625);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0021
     * @tc.name MatrixSeek001_0021
     * @tc.desc Verify seek input vector 21 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0021', 0, (): void => {
      const vector = new SeekVector(-0.125, 6000, 2, 0);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0022
     * @tc.name MatrixSeek001_0022
     * @tc.desc Verify seek input vector 22 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0022', 0, (): void => {
      const vector = new SeekVector(71.71875, 1001, 255, 281.53125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0023
     * @tc.name MatrixSeek001_0023
     * @tc.desc Verify seek input vector 23 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0023', 0, (): void => {
      const vector = new SeekVector(11.625, 7, 31, 2.625);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0024
     * @tc.name MatrixSeek001_0024
     * @tc.desc Verify seek input vector 24 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0024', 0, (): void => {
      const vector = new SeekVector(5.3125, 60001, 10, 31875.53125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0025
     * @tc.name MatrixSeek001_0025
     * @tc.desc Verify seek input vector 25 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0025', 0, (): void => {
      const vector = new SeekVector(2700, 9999, 3600, 7499.25);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0026
     * @tc.name MatrixSeek001_0026
     * @tc.desc Verify seek input vector 26 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0026', 0, (): void => {
      const vector = new SeekVector(115.09375, 3600001, 127, 3262500.90625);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0027
     * @tc.name MatrixSeek001_0027
     * @tc.desc Verify seek input vector 27 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0027', 0, (): void => {
      const vector = new SeekVector(3712.5, 2, 3600, 2);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0028
     * @tc.name MatrixSeek001_0028
     * @tc.desc Verify seek input vector 28 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0028', 0, (): void => {
      const vector = new SeekVector(3.125, 255, 100, 7.96875);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0029
     * @tc.name MatrixSeek001_0029
     * @tc.desc Verify seek input vector 29 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0029', 0, (): void => {
      const vector = new SeekVector(51.625, 7, 59, 6.125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0030
     * @tc.name MatrixSeek001_0030
     * @tc.desc Verify seek input vector 30 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0030', 0, (): void => {
      const vector = new SeekVector(5.9375, 999, 10, 593.15625);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0031
     * @tc.name MatrixSeek001_0031
     * @tc.desc Verify seek input vector 31 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0031', 0, (): void => {
      const vector = new SeekVector(6, 60001, 16, 22500.375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0032
     * @tc.name MatrixSeek001_0032
     * @tc.desc Verify seek input vector 32 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0032', 0, (): void => {
      const vector = new SeekVector(-0.96875, 3600000, 31, 0);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0033
     * @tc.name MatrixSeek001_0033
     * @tc.desc Verify seek input vector 33 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0033', 0, (): void => {
      const vector = new SeekVector(7.5, 3599999, 10, 2699999.25);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0034
     * @tc.name MatrixSeek001_0034
     * @tc.desc Verify seek input vector 34 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0034', 0, (): void => {
      const vector = new SeekVector(13.5625, 12999, 31, 5687.0625);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0035
     * @tc.name MatrixSeek001_0035
     * @tc.desc Verify seek input vector 35 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0035', 0, (): void => {
      const vector = new SeekVector(562.5, 60000, 3600, 9375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0036
     * @tc.name MatrixSeek001_0036
     * @tc.desc Verify seek input vector 36 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0036', 0, (): void => {
      const vector = new SeekVector(1.875, 1001, 3, 625.625);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0037
     * @tc.name MatrixSeek001_0037
     * @tc.desc Verify seek input vector 37 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0037', 0, (): void => {
      const vector = new SeekVector(81.25, 86400000, 100, 70200000);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0038
     * @tc.name MatrixSeek001_0038
     * @tc.desc Verify seek input vector 38 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0038', 0, (): void => {
      const vector = new SeekVector(33.1875, 127, 59, 71.4375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0039
     * @tc.name MatrixSeek001_0039
     * @tc.desc Verify seek input vector 39 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0039', 0, (): void => {
      const vector = new SeekVector(183.28125, 172800000, 255, 124200000);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0040
     * @tc.name MatrixSeek001_0040
     * @tc.desc Verify seek input vector 40 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0040', 0, (): void => {
      const vector = new SeekVector(27.125, 1001, 31, 875.875);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0041
     * @tc.name MatrixSeek001_0041
     * @tc.desc Verify seek input vector 41 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0041', 0, (): void => {
      const vector = new SeekVector(22.875, 120000, 61, 45000);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0042
     * @tc.name MatrixSeek001_0042
     * @tc.desc Verify seek input vector 42 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0042', 0, (): void => {
      const vector = new SeekVector(93.75, 999, 1000, 93.65625);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0043
     * @tc.name MatrixSeek001_0043
     * @tc.desc Verify seek input vector 43 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0043', 0, (): void => {
      const vector = new SeekVector(95.25, 255, 127, 191.25);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0044
     * @tc.name MatrixSeek001_0044
     * @tc.desc Verify seek input vector 44 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0044', 0, (): void => {
      const vector = new SeekVector(0.3125, 300000, 2, 46875);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0045
     * @tc.name MatrixSeek001_0045
     * @tc.desc Verify seek input vector 45 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0045', 0, (): void => {
      const vector = new SeekVector(0.1875, 61000, 3, 3812.5);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0046
     * @tc.name MatrixSeek001_0046
     * @tc.desc Verify seek input vector 46 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0046', 0, (): void => {
      const vector = new SeekVector(11.90625, 255, 127, 23.90625);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0047
     * @tc.name MatrixSeek001_0047
     * @tc.desc Verify seek input vector 47 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0047', 0, (): void => {
      const vector = new SeekVector(2812.5, 172800000, 3600, 135000000);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0048
     * @tc.name MatrixSeek001_0048
     * @tc.desc Verify seek input vector 48 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0048', 0, (): void => {
      const vector = new SeekVector(0.9375, 2, 3, 0.625);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0049
     * @tc.name MatrixSeek001_0049
     * @tc.desc Verify seek input vector 49 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0049', 0, (): void => {
      const vector = new SeekVector(31.96875, 86400000, 31, 86400000);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0050
     * @tc.name MatrixSeek001_0050
     * @tc.desc Verify seek input vector 50 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0050', 0, (): void => {
      const vector = new SeekVector(3.0625, 99, 7, 43.3125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0051
     * @tc.name MatrixSeek001_0051
     * @tc.desc Verify seek input vector 51 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0051', 0, (): void => {
      const vector = new SeekVector(0.625, 59999, 1, 37499.375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0052
     * @tc.name MatrixSeek001_0052
     * @tc.desc Verify seek input vector 52 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0052', 0, (): void => {
      const vector = new SeekVector(2.25, 12999, 3, 9749.25);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0053
     * @tc.name MatrixSeek001_0053
     * @tc.desc Verify seek input vector 53 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0053', 0, (): void => {
      const vector = new SeekVector(1.875, 61000, 3, 38125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0054
     * @tc.name MatrixSeek001_0054
     * @tc.desc Verify seek input vector 54 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0054', 0, (): void => {
      const vector = new SeekVector(265.625, 120000, 500, 63750);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0055
     * @tc.name MatrixSeek001_0055
     * @tc.desc Verify seek input vector 55 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0055', 0, (): void => {
      const vector = new SeekVector(0, 999, 255, 0);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0056
     * @tc.name MatrixSeek001_0056
     * @tc.desc Verify seek input vector 56 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0056', 0, (): void => {
      const vector = new SeekVector(0.5, 59999, 2, 14999.75);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0057
     * @tc.name MatrixSeek001_0057
     * @tc.desc Verify seek input vector 57 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0057', 0, (): void => {
      const vector = new SeekVector(-0.15625, 1377, 5, 0);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0058
     * @tc.name MatrixSeek001_0058
     * @tc.desc Verify seek input vector 58 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0058', 0, (): void => {
      const vector = new SeekVector(1.4375, 5999, 2, 4311.78125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0059
     * @tc.name MatrixSeek001_0059
     * @tc.desc Verify seek input vector 59 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0059', 0, (): void => {
      const vector = new SeekVector(17.4375, 120000, 31, 67500);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0060
     * @tc.name MatrixSeek001_0060
     * @tc.desc Verify seek input vector 60 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0060', 0, (): void => {
      const vector = new SeekVector(9.0625, 1, 10, 0.90625);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0061
     * @tc.name MatrixSeek001_0061
     * @tc.desc Verify seek input vector 61 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0061', 0, (): void => {
      const vector = new SeekVector(-15.625, 3600001, 500, 0);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0062
     * @tc.name MatrixSeek001_0062
     * @tc.desc Verify seek input vector 62 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0062', 0, (): void => {
      const vector = new SeekVector(119.0625, 300000, 127, 281250);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0063
     * @tc.name MatrixSeek001_0063
     * @tc.desc Verify seek input vector 63 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0063', 0, (): void => {
      const vector = new SeekVector(1.40625, 1001, 5, 281.53125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0064
     * @tc.name MatrixSeek001_0064
     * @tc.desc Verify seek input vector 64 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0064', 0, (): void => {
      const vector = new SeekVector(199.21875, 9999, 255, 7811.71875);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0065
     * @tc.name MatrixSeek001_0065
     * @tc.desc Verify seek input vector 65 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0065', 0, (): void => {
      const vector = new SeekVector(1.8125, 3599999, 2, 3262499.09375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0066
     * @tc.name MatrixSeek001_0066
     * @tc.desc Verify seek input vector 66 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0066', 0, (): void => {
      const vector = new SeekVector(562.5, 3600000, 1000, 2025000);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0067
     * @tc.name MatrixSeek001_0067
     * @tc.desc Verify seek input vector 67 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0067', 0, (): void => {
      const vector = new SeekVector(2025, 999, 3600, 561.9375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0068
     * @tc.name MatrixSeek001_0068
     * @tc.desc Verify seek input vector 68 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0068', 0, (): void => {
      const vector = new SeekVector(0.53125, 999, 1, 530.71875);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0069
     * @tc.name MatrixSeek001_0069
     * @tc.desc Verify seek input vector 69 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0069', 0, (): void => {
      const vector = new SeekVector(1.125, 1001, 2, 563.0625);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0070
     * @tc.name MatrixSeek001_0070
     * @tc.desc Verify seek input vector 70 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0070', 0, (): void => {
      const vector = new SeekVector(2.25, 30001, 3, 22500.75);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0071
     * @tc.name MatrixSeek001_0071
     * @tc.desc Verify seek input vector 71 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0071', 0, (): void => {
      const vector = new SeekVector(10, 255, 16, 159.375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0072
     * @tc.name MatrixSeek001_0072
     * @tc.desc Verify seek input vector 72 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0072', 0, (): void => {
      const vector = new SeekVector(0.3125, 127, 10, 3.96875);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0073
     * @tc.name MatrixSeek001_0073
     * @tc.desc Verify seek input vector 73 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0073', 0, (): void => {
      const vector = new SeekVector(0.71875, 999, 1, 718.03125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0074
     * @tc.name MatrixSeek001_0074
     * @tc.desc Verify seek input vector 74 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0074', 0, (): void => {
      const vector = new SeekVector(0.1875, 86400000, 1, 16200000);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0075
     * @tc.name MatrixSeek001_0075
     * @tc.desc Verify seek input vector 75 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0075', 0, (): void => {
      const vector = new SeekVector(1.0625, 1, 1, 1);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0076
     * @tc.name MatrixSeek001_0076
     * @tc.desc Verify seek input vector 76 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0076', 0, (): void => {
      const vector = new SeekVector(5.625, 6000, 10, 3375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0077
     * @tc.name MatrixSeek001_0077
     * @tc.desc Verify seek input vector 77 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0077', 0, (): void => {
      const vector = new SeekVector(1, 59999, 16, 3749.9375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0078
     * @tc.name MatrixSeek001_0078
     * @tc.desc Verify seek input vector 78 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0078', 0, (): void => {
      const vector = new SeekVector(63.75, 60000, 60, 60000);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0079
     * @tc.name MatrixSeek001_0079
     * @tc.desc Verify seek input vector 79 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0079', 0, (): void => {
      const vector = new SeekVector(51.59375, 300000, 127, 121875);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0080
     * @tc.name MatrixSeek001_0080
     * @tc.desc Verify seek input vector 80 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0080', 0, (): void => {
      const vector = new SeekVector(2.34375, 12999, 5, 6093.28125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0081
     * @tc.name MatrixSeek001_0081
     * @tc.desc Verify seek input vector 81 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0081', 0, (): void => {
      const vector = new SeekVector(3.8125, 7, 61, 0.4375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0082
     * @tc.name MatrixSeek001_0082
     * @tc.desc Verify seek input vector 82 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0082', 0, (): void => {
      const vector = new SeekVector(255, 59999, 255, 59999);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0083
     * @tc.name MatrixSeek001_0083
     * @tc.desc Verify seek input vector 83 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0083', 0, (): void => {
      const vector = new SeekVector(46.09375, 86400000, 59, 67500000);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0084
     * @tc.name MatrixSeek001_0084
     * @tc.desc Verify seek input vector 84 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0084', 0, (): void => {
      const vector = new SeekVector(33.75, 999, 60, 561.9375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0085
     * @tc.name MatrixSeek001_0085
     * @tc.desc Verify seek input vector 85 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0085', 0, (): void => {
      const vector = new SeekVector(1.25, 7, 2, 4.375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0086
     * @tc.name MatrixSeek001_0086
     * @tc.desc Verify seek input vector 86 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0086', 0, (): void => {
      const vector = new SeekVector(78.125, 172800000, 100, 135000000);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0087
     * @tc.name MatrixSeek001_0087
     * @tc.desc Verify seek input vector 87 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0087', 0, (): void => {
      const vector = new SeekVector(3.1875, 499, 3, 499);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0088
     * @tc.name MatrixSeek001_0088
     * @tc.desc Verify seek input vector 88 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0088', 0, (): void => {
      const vector = new SeekVector(26.25, 33, 60, 14.4375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0089
     * @tc.name MatrixSeek001_0089
     * @tc.desc Verify seek input vector 89 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0089', 0, (): void => {
      const vector = new SeekVector(390.625, 6000, 500, 4687.5);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0090
     * @tc.name MatrixSeek001_0090
     * @tc.desc Verify seek input vector 90 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0090', 0, (): void => {
      const vector = new SeekVector(3.125, 7, 5, 4.375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0091
     * @tc.name MatrixSeek001_0091
     * @tc.desc Verify seek input vector 91 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0091', 0, (): void => {
      const vector = new SeekVector(3.96875, 60000, 127, 1875);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0092
     * @tc.name MatrixSeek001_0092
     * @tc.desc Verify seek input vector 92 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0092', 0, (): void => {
      const vector = new SeekVector(2.25, 9999, 3, 7499.25);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0093
     * @tc.name MatrixSeek001_0093
     * @tc.desc Verify seek input vector 93 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0093', 0, (): void => {
      const vector = new SeekVector(0.46875, 99, 5, 9.28125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0094
     * @tc.name MatrixSeek001_0094
     * @tc.desc Verify seek input vector 94 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0094', 0, (): void => {
      const vector = new SeekVector(62.90625, 9999, 61, 9999);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0095
     * @tc.name MatrixSeek001_0095
     * @tc.desc Verify seek input vector 95 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0095', 0, (): void => {
      const vector = new SeekVector(25, 59999, 100, 14999.75);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0096
     * @tc.name MatrixSeek001_0096
     * @tc.desc Verify seek input vector 96 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0096', 0, (): void => {
      const vector = new SeekVector(119.0625, 999, 127, 936.5625);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0097
     * @tc.name MatrixSeek001_0097
     * @tc.desc Verify seek input vector 97 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0097', 0, (): void => {
      const vector = new SeekVector(68.75, 300000, 100, 206250);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0098
     * @tc.name MatrixSeek001_0098
     * @tc.desc Verify seek input vector 98 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0098', 0, (): void => {
      const vector = new SeekVector(2.1875, 172800000, 5, 75600000);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0099
     * @tc.name MatrixSeek001_0099
     * @tc.desc Verify seek input vector 99 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0099', 0, (): void => {
      const vector = new SeekVector(-225, 5999, 3600, 0);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK001_0100
     * @tc.name MatrixSeek001_0100
     * @tc.desc Verify seek input vector 100 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek001_0100', 0, (): void => {
      const vector = new SeekVector(3.5, 3599999, 16, 787499.78125);
      verifySeek(vector);
    });

  });
}
