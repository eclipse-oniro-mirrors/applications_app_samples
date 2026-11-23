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
import { SurfaceVector, verifySurface } from '../Shared/MatrixFixture';

export default function registerMatrixSurface002(): void {
  describe('MatrixSurface002', (): void => {
    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0001
     * @tc.name MatrixSurface002_0001
     * @tc.desc Verify fitted video dimensions for input vector 1 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0001', 0, (): void => {
      const vector = new SurfaceVector(1080, 1920, 600, 987, 555.1875, 987);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0002
     * @tc.name MatrixSurface002_0002
     * @tc.desc Verify fitted video dimensions for input vector 2 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0002', 0, (): void => {
      const vector = new SurfaceVector(1, 1, 1391, 2560, 1391, 1391);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0003
     * @tc.name MatrixSurface002_0003
     * @tc.desc Verify fitted video dimensions for input vector 3 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0003', 0, (): void => {
      const vector = new SurfaceVector(352, 288, 2543, 1080, 1320, 1080);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0004
     * @tc.name MatrixSurface002_0004
     * @tc.desc Verify fitted video dimensions for input vector 4 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0004', 0, (): void => {
      const vector = new SurfaceVector(1080, 1080, 751, 587, 587, 587);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0005
     * @tc.name MatrixSurface002_0005
     * @tc.desc Verify fitted video dimensions for input vector 5 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0005', 0, (): void => {
      const vector = new SurfaceVector(8192, 1, 1999, 1499, 1999, 0.2440185546875);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0006
     * @tc.name MatrixSurface002_0006
     * @tc.desc Verify fitted video dimensions for input vector 6 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0006', 0, (): void => {
      const vector = new SurfaceVector(2560, 1440, 1024, 563, 1000.8888888888889, 563);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0007
     * @tc.name MatrixSurface002_0007
     * @tc.desc Verify fitted video dimensions for input vector 7 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0007', 0, (): void => {
      const vector = new SurfaceVector(640, 480, 1183, 1883, 1183, 887.25);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0008
     * @tc.name MatrixSurface002_0008
     * @tc.desc Verify fitted video dimensions for input vector 8 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0008', 0, (): void => {
      const vector = new SurfaceVector(9, 16, 319, 239, 134.4375, 239);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0009
     * @tc.name MatrixSurface002_0009
     * @tc.desc Verify fitted video dimensions for input vector 9 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0009', 0, (): void => {
      const vector = new SurfaceVector(9, 16, 768, 987, 555.1875, 987);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0010
     * @tc.name MatrixSurface002_0010
     * @tc.desc Verify fitted video dimensions for input vector 10 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0010', 0, (): void => {
      const vector = new SurfaceVector(1, 8192, 599, 800, 0.09765625, 800);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0011
     * @tc.name MatrixSurface002_0011
     * @tc.desc Verify fitted video dimensions for input vector 11 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0011', 0, (): void => {
      const vector = new SurfaceVector(3, 4, 1231, 800, 600, 800);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0012
     * @tc.name MatrixSurface002_0012
     * @tc.desc Verify fitted video dimensions for input vector 12 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0012', 0, (): void => {
      const vector = new SurfaceVector(1080, 1080, 412, 878, 412, 412);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0013
     * @tc.name MatrixSurface002_0013
     * @tc.desc Verify fitted video dimensions for input vector 13 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0013', 0, (): void => {
      const vector = new SurfaceVector(1, 8192, 1999, 1523, 0.1859130859375, 1523);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0014
     * @tc.name MatrixSurface002_0014
     * @tc.desc Verify fitted video dimensions for input vector 14 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0014', 0, (): void => {
      const vector = new SurfaceVector(4096, 2160, 1423, 2559, 1423, 750.41015625);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0015
     * @tc.name MatrixSurface002_0015
     * @tc.desc Verify fitted video dimensions for input vector 15 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0015', 0, (): void => {
      const vector = new SurfaceVector(1536, 2048, 3791, 2147, 1610.25, 2147);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0016
     * @tc.name MatrixSurface002_0016
     * @tc.desc Verify fitted video dimensions for input vector 16 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0016', 0, (): void => {
      const vector = new SurfaceVector(8192, 1, 3440, 1439, 3440, 0.419921875);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0017
     * @tc.name MatrixSurface002_0017
     * @tc.desc Verify fitted video dimensions for input vector 17 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0017', 0, (): void => {
      const vector = new SurfaceVector(9, 21, 2543, 1067, 457.2857142857143, 1067);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0018
     * @tc.name MatrixSurface002_0018
     * @tc.desc Verify fitted video dimensions for input vector 18 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0018', 0, (): void => {
      const vector = new SurfaceVector(2560, 1440, 1440, 2559, 1440, 810);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0019
     * @tc.name MatrixSurface002_0019
     * @tc.desc Verify fitted video dimensions for input vector 19 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0019', 0, (): void => {
      const vector = new SurfaceVector(21, 9, 3791, 2147, 3791, 1624.7142857142858);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0020
     * @tc.name MatrixSurface002_0020
     * @tc.desc Verify fitted video dimensions for input vector 20 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0020', 0, (): void => {
      const vector = new SurfaceVector(2048, 1536, 390, 831, 390, 292.5);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0021
     * @tc.name MatrixSurface002_0021
     * @tc.desc Verify fitted video dimensions for input vector 21 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0021', 0, (): void => {
      const vector = new SurfaceVector(4, 3, 390, 843, 390, 292.5);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0022
     * @tc.name MatrixSurface002_0022
     * @tc.desc Verify fitted video dimensions for input vector 22 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0022', 0, (): void => {
      const vector = new SurfaceVector(9, 21, 2048, 1499, 642.4285714285714, 1499);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0023
     * @tc.name MatrixSurface002_0023
     * @tc.desc Verify fitted video dimensions for input vector 23 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0023', 0, (): void => {
      const vector = new SurfaceVector(9, 16, 1183, 1883, 1059.1875, 1883);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0024
     * @tc.name MatrixSurface002_0024
     * @tc.desc Verify fitted video dimensions for input vector 24 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0024', 0, (): void => {
      const vector = new SurfaceVector(1440, 2560, 191, 320, 180, 320);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0025
     * @tc.name MatrixSurface002_0025
     * @tc.desc Verify fitted video dimensions for input vector 25 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0025', 0, (): void => {
      const vector = new SurfaceVector(21, 9, 3791, 2123, 3791, 1624.7142857142858);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0026
     * @tc.name MatrixSurface002_0026
     * @tc.desc Verify fitted video dimensions for input vector 26 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0026', 0, (): void => {
      const vector = new SurfaceVector(16, 9, 1023, 563, 1000.8888888888889, 563);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0027
     * @tc.name MatrixSurface002_0027
     * @tc.desc Verify fitted video dimensions for input vector 27 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0027', 0, (): void => {
      const vector = new SurfaceVector(854, 480, 343, 640, 343, 192.78688524590163);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0028
     * @tc.name MatrixSurface002_0028
     * @tc.desc Verify fitted video dimensions for input vector 28 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0028', 0, (): void => {
      const vector = new SurfaceVector(2048, 1536, 1024, 755, 1006.6666666666666, 755);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0029
     * @tc.name MatrixSurface002_0029
     * @tc.desc Verify fitted video dimensions for input vector 29 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0029', 0, (): void => {
      const vector = new SurfaceVector(16, 9, 1183, 1883, 1183, 665.4375);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0030
     * @tc.name MatrixSurface002_0030
     * @tc.desc Verify fitted video dimensions for input vector 30 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0030', 0, (): void => {
      const vector = new SurfaceVector(2560, 1080, 240, 283, 240, 101.25);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0031
     * @tc.name MatrixSurface002_0031
     * @tc.desc Verify fitted video dimensions for input vector 31 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0031', 0, (): void => {
      const vector = new SurfaceVector(9, 16, 1080, 1919, 1079.4375, 1919);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0032
     * @tc.name MatrixSurface002_0032
     * @tc.desc Verify fitted video dimensions for input vector 32 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0032', 0, (): void => {
      const vector = new SurfaceVector(1080, 1920, 1280, 800, 450, 800);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0033
     * @tc.name MatrixSurface002_0033
     * @tc.desc Verify fitted video dimensions for input vector 33 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0033', 0, (): void => {
      const vector = new SurfaceVector(1440, 2560, 1280, 800, 450, 800);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0034
     * @tc.name MatrixSurface002_0034
     * @tc.desc Verify fitted video dimensions for input vector 34 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0034', 0, (): void => {
      const vector = new SurfaceVector(640, 480, 591, 359, 478.6666666666667, 359);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0035
     * @tc.name MatrixSurface002_0035
     * @tc.desc Verify fitted video dimensions for input vector 35 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0035', 0, (): void => {
      const vector = new SurfaceVector(1440, 2560, 600, 787, 442.6875, 787);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0036
     * @tc.name MatrixSurface002_0036
     * @tc.desc Verify fitted video dimensions for input vector 36 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0036', 0, (): void => {
      const vector = new SurfaceVector(2200, 2480, 599, 763, 599, 675.2363636363636);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0037
     * @tc.name MatrixSurface002_0037
     * @tc.desc Verify fitted video dimensions for input vector 37 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0037', 0, (): void => {
      const vector = new SurfaceVector(2048, 1536, 1999, 1523, 1999, 1499.25);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0038
     * @tc.name MatrixSurface002_0038
     * @tc.desc Verify fitted video dimensions for input vector 38 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0038', 0, (): void => {
      const vector = new SurfaceVector(4096, 2160, 326, 630, 326, 171.9140625);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0039
     * @tc.name MatrixSurface002_0039
     * @tc.desc Verify fitted video dimensions for input vector 39 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0039', 0, (): void => {
      const vector = new SurfaceVector(1440, 1080, 358, 666, 358, 268.5);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0040
     * @tc.name MatrixSurface002_0040
     * @tc.desc Verify fitted video dimensions for input vector 40 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0040', 0, (): void => {
      const vector = new SurfaceVector(1080, 1080, 311, 627, 311, 311);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0041
     * @tc.name MatrixSurface002_0041
     * @tc.desc Verify fitted video dimensions for input vector 41 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0041', 0, (): void => {
      const vector = new SurfaceVector(640, 480, 363, 914, 363, 272.25);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0042
     * @tc.name MatrixSurface002_0042
     * @tc.desc Verify fitted video dimensions for input vector 42 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0042', 0, (): void => {
      const vector = new SurfaceVector(2560, 1080, 1023, 600, 1023, 431.578125);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0043
     * @tc.name MatrixSurface002_0043
     * @tc.desc Verify fitted video dimensions for input vector 43 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0043', 0, (): void => {
      const vector = new SurfaceVector(2200, 2480, 375, 654, 375, 422.72727272727275);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0044
     * @tc.name MatrixSurface002_0044
     * @tc.desc Verify fitted video dimensions for input vector 44 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0044', 0, (): void => {
      const vector = new SurfaceVector(3840, 2160, 358, 654, 358, 201.375);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0045
     * @tc.name MatrixSurface002_0045
     * @tc.desc Verify fitted video dimensions for input vector 45 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0045', 0, (): void => {
      const vector = new SurfaceVector(640, 480, 2511, 1079, 1438.6666666666667, 1079);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0046
     * @tc.name MatrixSurface002_0046
     * @tc.desc Verify fitted video dimensions for input vector 46 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0046', 0, (): void => {
      const vector = new SurfaceVector(1080, 2340, 2560, 1043, 481.38461538461536, 1043);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0047
     * @tc.name MatrixSurface002_0047
     * @tc.desc Verify fitted video dimensions for input vector 47 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0047', 0, (): void => {
      const vector = new SurfaceVector(854, 480, 1079, 1883, 1079, 606.4637002341921);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0048
     * @tc.name MatrixSurface002_0048
     * @tc.desc Verify fitted video dimensions for input vector 48 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0048', 0, (): void => {
      const vector = new SurfaceVector(2048, 1536, 1279, 720, 960, 720);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0049
     * @tc.name MatrixSurface002_0049
     * @tc.desc Verify fitted video dimensions for input vector 49 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0049', 0, (): void => {
      const vector = new SurfaceVector(2560, 1080, 2511, 1427, 2511, 1059.328125);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0050
     * @tc.name MatrixSurface002_0050
     * @tc.desc Verify fitted video dimensions for input vector 50 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0050', 0, (): void => {
      const vector = new SurfaceVector(1920, 1080, 191, 319, 191, 107.4375);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0051
     * @tc.name MatrixSurface002_0051
     * @tc.desc Verify fitted video dimensions for input vector 51 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0051', 0, (): void => {
      const vector = new SurfaceVector(8192, 1, 1183, 1920, 1183, 0.1444091796875);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0052
     * @tc.name MatrixSurface002_0052
     * @tc.desc Verify fitted video dimensions for input vector 52 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0052', 0, (): void => {
      const vector = new SurfaceVector(2560, 1440, 1200, 1920, 1200, 675);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0053
     * @tc.name MatrixSurface002_0053
     * @tc.desc Verify fitted video dimensions for input vector 53 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0053', 0, (): void => {
      const vector = new SurfaceVector(2560, 1440, 1199, 1920, 1199, 674.4375);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0054
     * @tc.name MatrixSurface002_0054
     * @tc.desc Verify fitted video dimensions for input vector 54 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0054', 0, (): void => {
      const vector = new SurfaceVector(1920, 1080, 1023, 599, 1023, 575.4375);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0055
     * @tc.name MatrixSurface002_0055
     * @tc.desc Verify fitted video dimensions for input vector 55 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0055', 0, (): void => {
      const vector = new SurfaceVector(2048, 1536, 583, 800, 583, 437.25);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0056
     * @tc.name MatrixSurface002_0056
     * @tc.desc Verify fitted video dimensions for input vector 56 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0056', 0, (): void => {
      const vector = new SurfaceVector(16, 9, 3823, 2123, 3774.222222222222, 2123);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0057
     * @tc.name MatrixSurface002_0057
     * @tc.desc Verify fitted video dimensions for input vector 57 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0057', 0, (): void => {
      const vector = new SurfaceVector(21, 9, 1365, 768, 1365, 585);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0058
     * @tc.name MatrixSurface002_0058
     * @tc.desc Verify fitted video dimensions for input vector 58 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0058', 0, (): void => {
      const vector = new SurfaceVector(1440, 2560, 783, 1243, 699.1875, 1243);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0059
     * @tc.name MatrixSurface002_0059
     * @tc.desc Verify fitted video dimensions for input vector 59 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0059', 0, (): void => {
      const vector = new SurfaceVector(352, 288, 2511, 1403, 1714.7777777777778, 1403);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0060
     * @tc.name MatrixSurface002_0060
     * @tc.desc Verify fitted video dimensions for input vector 60 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0060', 0, (): void => {
      const vector = new SurfaceVector(3, 4, 2199, 2479, 1859.25, 2479);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0061
     * @tc.name MatrixSurface002_0061
     * @tc.desc Verify fitted video dimensions for input vector 61 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0061', 0, (): void => {
      const vector = new SurfaceVector(21, 9, 1439, 2559, 1439, 616.7142857142857);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0062
     * @tc.name MatrixSurface002_0062
     * @tc.desc Verify fitted video dimensions for input vector 62 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0062', 0, (): void => {
      const vector = new SurfaceVector(1080, 1920, 3439, 1403, 789.1875, 1403);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0063
     * @tc.name MatrixSurface002_0063
     * @tc.desc Verify fitted video dimensions for input vector 63 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0063', 0, (): void => {
      const vector = new SurfaceVector(4096, 2160, 719, 1011, 719, 379.16015625);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0064
     * @tc.name MatrixSurface002_0064
     * @tc.desc Verify fitted video dimensions for input vector 64 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0064', 0, (): void => {
      const vector = new SurfaceVector(4, 3, 2199, 2467, 2199, 1649.25);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0065
     * @tc.name MatrixSurface002_0065
     * @tc.desc Verify fitted video dimensions for input vector 65 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0065', 0, (): void => {
      const vector = new SurfaceVector(16, 9, 1231, 720, 1231, 692.4375);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0066
     * @tc.name MatrixSurface002_0066
     * @tc.desc Verify fitted video dimensions for input vector 66 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0066', 0, (): void => {
      const vector = new SurfaceVector(21, 9, 2543, 1403, 2543, 1089.857142857143);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0067
     * @tc.name MatrixSurface002_0067
     * @tc.desc Verify fitted video dimensions for input vector 67 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0067', 0, (): void => {
      const vector = new SurfaceVector(1440, 1080, 623, 360, 480, 360);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0068
     * @tc.name MatrixSurface002_0068
     * @tc.desc Verify fitted video dimensions for input vector 68 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0068', 0, (): void => {
      const vector = new SurfaceVector(3, 4, 1349, 768, 576, 768);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0069
     * @tc.name MatrixSurface002_0069
     * @tc.desc Verify fitted video dimensions for input vector 69 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0069', 0, (): void => {
      const vector = new SurfaceVector(2560, 1440, 240, 307, 240, 135);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0070
     * @tc.name MatrixSurface002_0070
     * @tc.desc Verify fitted video dimensions for input vector 70 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0070', 0, (): void => {
      const vector = new SurfaceVector(2560, 1440, 1031, 1883, 1031, 579.9375);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0071
     * @tc.name MatrixSurface002_0071
     * @tc.desc Verify fitted video dimensions for input vector 71 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0071', 0, (): void => {
      const vector = new SurfaceVector(2048, 1536, 2511, 1403, 1870.6666666666667, 1403);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0072
     * @tc.name MatrixSurface002_0072
     * @tc.desc Verify fitted video dimensions for input vector 72 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0072', 0, (): void => {
      const vector = new SurfaceVector(1, 1, 783, 1279, 783, 783);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0073
     * @tc.name MatrixSurface002_0073
     * @tc.desc Verify fitted video dimensions for input vector 73 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0073', 0, (): void => {
      const vector = new SurfaceVector(1536, 2048, 1871, 1200, 900, 1200);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0074
     * @tc.name MatrixSurface002_0074
     * @tc.desc Verify fitted video dimensions for input vector 74 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0074', 0, (): void => {
      const vector = new SurfaceVector(9, 16, 591, 347, 195.1875, 347);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0075
     * @tc.name MatrixSurface002_0075
     * @tc.desc Verify fitted video dimensions for input vector 75 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0075', 0, (): void => {
      const vector = new SurfaceVector(16, 9, 1023, 767, 1023, 575.4375);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0076
     * @tc.name MatrixSurface002_0076
     * @tc.desc Verify fitted video dimensions for input vector 76 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0076', 0, (): void => {
      const vector = new SurfaceVector(9, 21, 1263, 763, 327, 763);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0077
     * @tc.name MatrixSurface002_0077
     * @tc.desc Verify fitted video dimensions for input vector 77 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0077', 0, (): void => {
      const vector = new SurfaceVector(9, 16, 2560, 1440, 810, 1440);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0078
     * @tc.name MatrixSurface002_0078
     * @tc.desc Verify fitted video dimensions for input vector 78 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0078', 0, (): void => {
      const vector = new SurfaceVector(8192, 1, 2047, 1499, 2047, 0.2498779296875);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0079
     * @tc.name MatrixSurface002_0079
     * @tc.desc Verify fitted video dimensions for input vector 79 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0079', 0, (): void => {
      const vector = new SurfaceVector(2200, 2480, 799, 1279, 799, 900.6909090909091);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0080
     * @tc.name MatrixSurface002_0080
     * @tc.desc Verify fitted video dimensions for input vector 80 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0080', 0, (): void => {
      const vector = new SurfaceVector(3, 4, 311, 627, 311, 414.6666666666667);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0081
     * @tc.name MatrixSurface002_0081
     * @tc.desc Verify fitted video dimensions for input vector 81 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0081', 0, (): void => {
      const vector = new SurfaceVector(3, 4, 239, 307, 230.25, 307);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0082
     * @tc.name MatrixSurface002_0082
     * @tc.desc Verify fitted video dimensions for input vector 82 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0082', 0, (): void => {
      const vector = new SurfaceVector(9, 16, 1063, 1907, 1063, 1889.7777777777778);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0083
     * @tc.name MatrixSurface002_0083
     * @tc.desc Verify fitted video dimensions for input vector 83 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0083', 0, (): void => {
      const vector = new SurfaceVector(1, 1, 640, 347, 347, 347);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0084
     * @tc.name MatrixSurface002_0084
     * @tc.desc Verify fitted video dimensions for input vector 84 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0084', 0, (): void => {
      const vector = new SurfaceVector(352, 288, 359, 603, 359, 293.72727272727275);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0085
     * @tc.name MatrixSurface002_0085
     * @tc.desc Verify fitted video dimensions for input vector 85 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0085', 0, (): void => {
      const vector = new SurfaceVector(1440, 2560, 1920, 1067, 600.1875, 1067);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0086
     * @tc.name MatrixSurface002_0086
     * @tc.desc Verify fitted video dimensions for input vector 86 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0086', 0, (): void => {
      const vector = new SurfaceVector(9, 16, 719, 987, 555.1875, 987);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0087
     * @tc.name MatrixSurface002_0087
     * @tc.desc Verify fitted video dimensions for input vector 87 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0087', 0, (): void => {
      const vector = new SurfaceVector(3, 4, 1920, 1080, 810, 1080);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0088
     * @tc.name MatrixSurface002_0088
     * @tc.desc Verify fitted video dimensions for input vector 88 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0088', 0, (): void => {
      const vector = new SurfaceVector(2560, 1440, 2047, 1536, 2047, 1151.4375);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0089
     * @tc.name MatrixSurface002_0089
     * @tc.desc Verify fitted video dimensions for input vector 89 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0089', 0, (): void => {
      const vector = new SurfaceVector(1080, 1920, 640, 359, 201.9375, 359);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0090
     * @tc.name MatrixSurface002_0090
     * @tc.desc Verify fitted video dimensions for input vector 90 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0090', 0, (): void => {
      const vector = new SurfaceVector(1440, 2560, 1031, 1907, 1031, 1832.888888888889);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0091
     * @tc.name MatrixSurface002_0091
     * @tc.desc Verify fitted video dimensions for input vector 91 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0091', 0, (): void => {
      const vector = new SurfaceVector(1, 8192, 975, 768, 0.09375, 768);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0092
     * @tc.name MatrixSurface002_0092
     * @tc.desc Verify fitted video dimensions for input vector 92 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0092', 0, (): void => {
      const vector = new SurfaceVector(21, 9, 359, 640, 359, 153.85714285714286);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0093
     * @tc.name MatrixSurface002_0093
     * @tc.desc Verify fitted video dimensions for input vector 93 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0093', 0, (): void => {
      const vector = new SurfaceVector(21, 9, 2511, 1043, 2433.6666666666665, 1043);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0094
     * @tc.name MatrixSurface002_0094
     * @tc.desc Verify fitted video dimensions for input vector 94 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0094', 0, (): void => {
      const vector = new SurfaceVector(854, 480, 600, 787, 600, 337.23653395784544);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0095
     * @tc.name MatrixSurface002_0095
     * @tc.desc Verify fitted video dimensions for input vector 95 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0095', 0, (): void => {
      const vector = new SurfaceVector(854, 480, 751, 587, 751, 422.10772833723655);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0096
     * @tc.name MatrixSurface002_0096
     * @tc.desc Verify fitted video dimensions for input vector 96 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0096', 0, (): void => {
      const vector = new SurfaceVector(1440, 2560, 600, 987, 555.1875, 987);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0097
     * @tc.name MatrixSurface002_0097
     * @tc.desc Verify fitted video dimensions for input vector 97 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0097', 0, (): void => {
      const vector = new SurfaceVector(1080, 1080, 1439, 2547, 1439, 1439);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0098
     * @tc.name MatrixSurface002_0098
     * @tc.desc Verify fitted video dimensions for input vector 98 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0098', 0, (): void => {
      const vector = new SurfaceVector(640, 480, 320, 227, 302.6666666666667, 227);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0099
     * @tc.name MatrixSurface002_0099
     * @tc.desc Verify fitted video dimensions for input vector 99 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0099', 0, (): void => {
      const vector = new SurfaceVector(640, 480, 1903, 1080, 1440, 1080);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE002_0100
     * @tc.name MatrixSurface002_0100
     * @tc.desc Verify fitted video dimensions for input vector 100 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface002_0100', 0, (): void => {
      const vector = new SurfaceVector(1920, 1080, 975, 755, 975, 548.4375);
      verifySurface(vector);
    });

  });
}
