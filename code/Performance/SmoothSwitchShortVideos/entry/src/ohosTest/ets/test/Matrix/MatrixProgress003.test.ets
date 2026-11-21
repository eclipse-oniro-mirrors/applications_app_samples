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

export default function registerMatrixProgress003(): void {
  describe('MatrixProgress003', (): void => {
    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0001
     * @tc.name MatrixProgress003_0001
     * @tc.desc Verify progress input vector 1 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0001', 0, (): void => {
      const vector = new ProgressVector(2437.3125, 12999, 16, 3);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0002
     * @tc.name MatrixProgress003_0002
     * @tc.desc Verify progress input vector 2 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0002', 0, (): void => {
      const vector = new ProgressVector(2362500.65625, 3600001, 31, 20);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0003
     * @tc.name MatrixProgress003_0003
     * @tc.desc Verify progress input vector 3 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0003', 0, (): void => {
      const vector = new ProgressVector(1575000, 3600000, 127, 55);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0004
     * @tc.name MatrixProgress003_0004
     * @tc.desc Verify progress input vector 4 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0004', 0, (): void => {
      const vector = new ProgressVector(937.5, 10000, 127, 11);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0005
     * @tc.name MatrixProgress003_0005
     * @tc.desc Verify progress input vector 5 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0005', 0, (): void => {
      const vector = new ProgressVector(3262500, 3600000, 1, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0006
     * @tc.name MatrixProgress003_0006
     * @tc.desc Verify progress input vector 6 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0006', 0, (): void => {
      const vector = new ProgressVector(3750.125, 30001, 1, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0007
     * @tc.name MatrixProgress003_0007
     * @tc.desc Verify progress input vector 7 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0007', 0, (): void => {
      const vector = new ProgressVector(46875, 60000, 100, 78);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0008
     * @tc.name MatrixProgress003_0008
     * @tc.desc Verify progress input vector 8 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0008', 0, (): void => {
      const vector = new ProgressVector(45750, 61000, 31, 23);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0009
     * @tc.name MatrixProgress003_0009
     * @tc.desc Verify progress input vector 9 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0009', 0, (): void => {
      const vector = new ProgressVector(129.09375, 1377, 60, 5);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0010
     * @tc.name MatrixProgress003_0010
     * @tc.desc Verify progress input vector 10 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0010', 0, (): void => {
      const vector = new ProgressVector(5625, 10000, 60, 33);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0011
     * @tc.name MatrixProgress003_0011
     * @tc.desc Verify progress input vector 11 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0011', 0, (): void => {
      const vector = new ProgressVector(26249.5625, 59999, 3, 1);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0012
     * @tc.name MatrixProgress003_0012
     * @tc.desc Verify progress input vector 12 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0012', 0, (): void => {
      const vector = new ProgressVector(2.625, 7, 127, 47);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0013
     * @tc.name MatrixProgress003_0013
     * @tc.desc Verify progress input vector 13 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0013', 0, (): void => {
      const vector = new ProgressVector(0.4375, 2, 3, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0014
     * @tc.name MatrixProgress003_0014
     * @tc.desc Verify progress input vector 14 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0014', 0, (): void => {
      const vector = new ProgressVector(140400000, 172800000, 60, 48);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0015
     * @tc.name MatrixProgress003_0015
     * @tc.desc Verify progress input vector 15 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0015', 0, (): void => {
      const vector = new ProgressVector(999, 999, 31, 31);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0016
     * @tc.name MatrixProgress003_0016
     * @tc.desc Verify progress input vector 16 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0016', 0, (): void => {
      const vector = new ProgressVector(18749.6875, 59999, 16, 5);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0017
     * @tc.name MatrixProgress003_0017
     * @tc.desc Verify progress input vector 17 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0017', 0, (): void => {
      const vector = new ProgressVector(937.53125, 30001, 500, 15);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0018
     * @tc.name MatrixProgress003_0018
     * @tc.desc Verify progress input vector 18 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0018', 0, (): void => {
      const vector = new ProgressVector(93.75, 1000, 127, 11);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0019
     * @tc.name MatrixProgress003_0019
     * @tc.desc Verify progress input vector 19 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0019', 0, (): void => {
      const vector = new ProgressVector(-1, 12999, 255, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0020
     * @tc.name MatrixProgress003_0020
     * @tc.desc Verify progress input vector 20 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0020', 0, (): void => {
      const vector = new ProgressVector(4.8125, 7, 5, 3);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0021
     * @tc.name MatrixProgress003_0021
     * @tc.desc Verify progress input vector 21 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0021', 0, (): void => {
      const vector = new ProgressVector(343.40625, 999, 3, 1);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0022
     * @tc.name MatrixProgress003_0022
     * @tc.desc Verify progress input vector 22 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0022', 0, (): void => {
      const vector = new ProgressVector(6905.71875, 12999, 1000, 531);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0023
     * @tc.name MatrixProgress003_0023
     * @tc.desc Verify progress input vector 23 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0023', 0, (): void => {
      const vector = new ProgressVector(374.25, 499, 10, 7);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0024
     * @tc.name MatrixProgress003_0024
     * @tc.desc Verify progress input vector 24 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0024', 0, (): void => {
      const vector = new ProgressVector(7.9375, 127, 60, 3);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0025
     * @tc.name MatrixProgress003_0025
     * @tc.desc Verify progress input vector 25 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0025', 0, (): void => {
      const vector = new ProgressVector(1237499.65625, 3599999, 255, 87);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0026
     * @tc.name MatrixProgress003_0026
     * @tc.desc Verify progress input vector 26 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0026', 0, (): void => {
      const vector = new ProgressVector(0, 2, 2, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0027
     * @tc.name MatrixProgress003_0027
     * @tc.desc Verify progress input vector 27 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0027', 0, (): void => {
      const vector = new ProgressVector(58125.96875, 60001, 127, 123);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0028
     * @tc.name MatrixProgress003_0028
     * @tc.desc Verify progress input vector 28 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0028', 0, (): void => {
      const vector = new ProgressVector(3.28125, 7, 100, 46);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0029
     * @tc.name MatrixProgress003_0029
     * @tc.desc Verify progress input vector 29 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0029', 0, (): void => {
      const vector = new ProgressVector(731.53125, 1377, 31, 16);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0030
     * @tc.name MatrixProgress003_0030
     * @tc.desc Verify progress input vector 30 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0030', 0, (): void => {
      const vector = new ProgressVector(109.15625, 499, 100, 21);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0031
     * @tc.name MatrixProgress003_0031
     * @tc.desc Verify progress input vector 31 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0031', 0, (): void => {
      const vector = new ProgressVector(2.1875, 7, 500, 156);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0032
     * @tc.name MatrixProgress003_0032
     * @tc.desc Verify progress input vector 32 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0032', 0, (): void => {
      const vector = new ProgressVector(4125, 6000, 5, 3);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0033
     * @tc.name MatrixProgress003_0033
     * @tc.desc Verify progress input vector 33 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0033', 0, (): void => {
      const vector = new ProgressVector(0.8125, 2, 59, 23);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0034
     * @tc.name MatrixProgress003_0034
     * @tc.desc Verify progress input vector 34 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0034', 0, (): void => {
      const vector = new ProgressVector(3375, 6000, 500, 281);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0035
     * @tc.name MatrixProgress003_0035
     * @tc.desc Verify progress input vector 35 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0035', 0, (): void => {
      const vector = new ProgressVector(83.34375, 127, 1000, 656);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0036
     * @tc.name MatrixProgress003_0036
     * @tc.desc Verify progress input vector 36 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0036', 0, (): void => {
      const vector = new ProgressVector(1875.0625, 30001, 2, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0037
     * @tc.name MatrixProgress003_0037
     * @tc.desc Verify progress input vector 37 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0037', 0, (): void => {
      const vector = new ProgressVector(3600001, 3600001, 1000, 1000);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0038
     * @tc.name MatrixProgress003_0038
     * @tc.desc Verify progress input vector 38 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0038', 0, (): void => {
      const vector = new ProgressVector(5400000, 172800000, 31, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0039
     * @tc.name MatrixProgress003_0039
     * @tc.desc Verify progress input vector 39 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0039', 0, (): void => {
      const vector = new ProgressVector(5437.5, 6000, 1, 0);
      verifyProgress(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPROGRESS003_0040
     * @tc.name MatrixProgress003_0040
     * @tc.desc Verify progress input vector 40 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixProgress003_0040', 0, (): void => {
      const vector = new ProgressVector(1.25, 2, 31, 19);
      verifyProgress(vector);
    });

  });
}
