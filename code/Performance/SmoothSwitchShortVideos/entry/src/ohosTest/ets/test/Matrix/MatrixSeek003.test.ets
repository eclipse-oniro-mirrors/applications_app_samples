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

export default function registerMatrixSeek003(): void {
  describe('MatrixSeek003', (): void => {
    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0001
     * @tc.name MatrixSeek003_0001
     * @tc.desc Verify seek input vector 1 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0001', 0, (): void => {
      const vector = new SeekVector(1, 300000, 1, 300000);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0002
     * @tc.name MatrixSeek003_0002
     * @tc.desc Verify seek input vector 2 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0002', 0, (): void => {
      const vector = new SeekVector(0.5, 6000, 2, 1500);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0003
     * @tc.name MatrixSeek003_0003
     * @tc.desc Verify seek input vector 3 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0003', 0, (): void => {
      const vector = new SeekVector(5.3125, 7, 10, 3.71875);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0004
     * @tc.name MatrixSeek003_0004
     * @tc.desc Verify seek input vector 4 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0004', 0, (): void => {
      const vector = new SeekVector(0, 1001, 5, 0);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0005
     * @tc.name MatrixSeek003_0005
     * @tc.desc Verify seek input vector 5 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0005', 0, (): void => {
      const vector = new SeekVector(43.84375, 33, 61, 23.71875);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0006
     * @tc.name MatrixSeek003_0006
     * @tc.desc Verify seek input vector 6 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0006', 0, (): void => {
      const vector = new SeekVector(159.375, 1001, 255, 625.625);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0007
     * @tc.name MatrixSeek003_0007
     * @tc.desc Verify seek input vector 7 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0007', 0, (): void => {
      const vector = new SeekVector(6.5, 99, 16, 40.21875);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0008
     * @tc.name MatrixSeek003_0008
     * @tc.desc Verify seek input vector 8 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0008', 0, (): void => {
      const vector = new SeekVector(843.75, 6000, 1000, 5062.5);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0009
     * @tc.name MatrixSeek003_0009
     * @tc.desc Verify seek input vector 9 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0009', 0, (): void => {
      const vector = new SeekVector(0, 99, 500, 0);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0010
     * @tc.name MatrixSeek003_0010
     * @tc.desc Verify seek input vector 10 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0010', 0, (): void => {
      const vector = new SeekVector(1462.5, 499, 3600, 202.71875);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0011
     * @tc.name MatrixSeek003_0011
     * @tc.desc Verify seek input vector 11 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0011', 0, (): void => {
      const vector = new SeekVector(51.625, 59999, 59, 52499.125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0012
     * @tc.name MatrixSeek003_0012
     * @tc.desc Verify seek input vector 12 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0012', 0, (): void => {
      const vector = new SeekVector(1.9375, 255, 31, 15.9375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0013
     * @tc.name MatrixSeek003_0013
     * @tc.desc Verify seek input vector 13 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0013', 0, (): void => {
      const vector = new SeekVector(4.375, 255, 7, 159.375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0014
     * @tc.name MatrixSeek003_0014
     * @tc.desc Verify seek input vector 14 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0014', 0, (): void => {
      const vector = new SeekVector(19.84375, 61000, 127, 9531.25);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0015
     * @tc.name MatrixSeek003_0015
     * @tc.desc Verify seek input vector 15 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0015', 0, (): void => {
      const vector = new SeekVector(468.75, 6000, 1000, 2812.5);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0016
     * @tc.name MatrixSeek003_0016
     * @tc.desc Verify seek input vector 16 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0016', 0, (): void => {
      const vector = new SeekVector(57.1875, 1, 61, 0.9375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0017
     * @tc.name MatrixSeek003_0017
     * @tc.desc Verify seek input vector 17 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0017', 0, (): void => {
      const vector = new SeekVector(0.875, 6000, 2, 2625);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0018
     * @tc.name MatrixSeek003_0018
     * @tc.desc Verify seek input vector 18 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0018', 0, (): void => {
      const vector = new SeekVector(0.21875, 999, 1, 218.53125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0019
     * @tc.name MatrixSeek003_0019
     * @tc.desc Verify seek input vector 19 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0019', 0, (): void => {
      const vector = new SeekVector(9.0625, 86400000, 10, 78300000);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0020
     * @tc.name MatrixSeek003_0020
     * @tc.desc Verify seek input vector 20 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0020', 0, (): void => {
      const vector = new SeekVector(0.5, 300000, 16, 9375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0021
     * @tc.name MatrixSeek003_0021
     * @tc.desc Verify seek input vector 21 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0021', 0, (): void => {
      const vector = new SeekVector(187.5, 5999, 500, 2249.625);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0022
     * @tc.name MatrixSeek003_0022
     * @tc.desc Verify seek input vector 22 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0022', 0, (): void => {
      const vector = new SeekVector(12.5, 1001, 100, 125.125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0023
     * @tc.name MatrixSeek003_0023
     * @tc.desc Verify seek input vector 23 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0023', 0, (): void => {
      const vector = new SeekVector(38.125, 999, 61, 624.375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0024
     * @tc.name MatrixSeek003_0024
     * @tc.desc Verify seek input vector 24 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0024', 0, (): void => {
      const vector = new SeekVector(1.25, 1001, 10, 125.125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0025
     * @tc.name MatrixSeek003_0025
     * @tc.desc Verify seek input vector 25 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0025', 0, (): void => {
      const vector = new SeekVector(5.9375, 3600000, 10, 2137500);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0026
     * @tc.name MatrixSeek003_0026
     * @tc.desc Verify seek input vector 26 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0026', 0, (): void => {
      const vector = new SeekVector(247.03125, 99, 255, 95.90625);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0027
     * @tc.name MatrixSeek003_0027
     * @tc.desc Verify seek input vector 27 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0027', 0, (): void => {
      const vector = new SeekVector(53.46875, 172800000, 59, 156600000);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0028
     * @tc.name MatrixSeek003_0028
     * @tc.desc Verify seek input vector 28 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0028', 0, (): void => {
      const vector = new SeekVector(0.3125, 499, 1, 155.9375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0029
     * @tc.name MatrixSeek003_0029
     * @tc.desc Verify seek input vector 29 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0029', 0, (): void => {
      const vector = new SeekVector(2587.5, 59999, 3600, 43124.28125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0030
     * @tc.name MatrixSeek003_0030
     * @tc.desc Verify seek input vector 30 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0030', 0, (): void => {
      const vector = new SeekVector(0.34375, 33, 1, 11.34375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0031
     * @tc.name MatrixSeek003_0031
     * @tc.desc Verify seek input vector 31 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0031', 0, (): void => {
      const vector = new SeekVector(13.5, 1000, 16, 843.75);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0032
     * @tc.name MatrixSeek003_0032
     * @tc.desc Verify seek input vector 32 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0032', 0, (): void => {
      const vector = new SeekVector(9.5, 120000, 16, 71250);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0033
     * @tc.name MatrixSeek003_0033
     * @tc.desc Verify seek input vector 33 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0033', 0, (): void => {
      const vector = new SeekVector(2.8125, 5999, 3, 5624.0625);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0034
     * @tc.name MatrixSeek003_0034
     * @tc.desc Verify seek input vector 34 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0034', 0, (): void => {
      const vector = new SeekVector(2362.5, 86400000, 3600, 56700000);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0035
     * @tc.name MatrixSeek003_0035
     * @tc.desc Verify seek input vector 35 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0035', 0, (): void => {
      const vector = new SeekVector(2.0625, 3599999, 3, 2474999.3125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0036
     * @tc.name MatrixSeek003_0036
     * @tc.desc Verify seek input vector 36 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0036', 0, (): void => {
      const vector = new SeekVector(11.25, 3599999, 60, 674999.8125);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0037
     * @tc.name MatrixSeek003_0037
     * @tc.desc Verify seek input vector 37 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0037', 0, (): void => {
      const vector = new SeekVector(8.5, 172800000, 16, 91800000);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0038
     * @tc.name MatrixSeek003_0038
     * @tc.desc Verify seek input vector 38 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0038', 0, (): void => {
      const vector = new SeekVector(14.5, 9999, 16, 9061.59375);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0039
     * @tc.name MatrixSeek003_0039
     * @tc.desc Verify seek input vector 39 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0039', 0, (): void => {
      const vector = new SeekVector(234.375, 99, 500, 46.40625);
      verifySeek(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSEEK003_0040
     * @tc.name MatrixSeek003_0040
     * @tc.desc Verify seek input vector 40 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSeek003_0040', 0, (): void => {
      const vector = new SeekVector(159.375, 60001, 255, 37500.625);
      verifySeek(vector);
    });

  });
}
