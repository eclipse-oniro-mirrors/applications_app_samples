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

export default function registerMatrixSurface001(): void {
  describe('MatrixSurface001', (): void => {
    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0001
     * @tc.name MatrixSurface001_0001
     * @tc.desc Verify surface input vector 1 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0001', 0, (): void => {
      const vector = new SurfaceVector(9, 21, 1366, 767, 328.7142857142857, 767);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0002
     * @tc.name MatrixSurface001_0002
     * @tc.desc Verify surface input vector 2 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0002', 0, (): void => {
      const vector = new SurfaceVector(1080, 1080, 395, 878, 395, 395);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0003
     * @tc.name MatrixSurface001_0003
     * @tc.desc Verify surface input vector 3 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0003', 0, (): void => {
      const vector = new SurfaceVector(1, 1, 1999, 1523, 1523, 1523);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0004
     * @tc.name MatrixSurface001_0004
     * @tc.desc Verify surface input vector 4 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0004', 0, (): void => {
      const vector = new SurfaceVector(21, 9, 3440, 1439, 3357.6666666666665, 1439);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0005
     * @tc.name MatrixSurface001_0005
     * @tc.desc Verify surface input vector 5 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0005', 0, (): void => {
      const vector = new SurfaceVector(352, 288, 374, 666, 374, 306);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0006
     * @tc.name MatrixSurface001_0006
     * @tc.desc Verify surface input vector 6 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0006', 0, (): void => {
      const vector = new SurfaceVector(1440, 2560, 2543, 1067, 600.1875, 1067);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0007
     * @tc.name MatrixSurface001_0007
     * @tc.desc Verify surface input vector 7 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0007', 0, (): void => {
      const vector = new SurfaceVector(1080, 1080, 1023, 563, 563, 563);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0008
     * @tc.name MatrixSurface001_0008
     * @tc.desc Verify surface input vector 8 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0008', 0, (): void => {
      const vector = new SurfaceVector(352, 288, 2151, 2480, 2151, 1759.909090909091);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0009
     * @tc.name MatrixSurface001_0009
     * @tc.desc Verify surface input vector 9 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0009', 0, (): void => {
      const vector = new SurfaceVector(4, 3, 640, 359, 478.6666666666667, 359);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0010
     * @tc.name MatrixSurface001_0010
     * @tc.desc Verify surface input vector 10 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0010', 0, (): void => {
      const vector = new SurfaceVector(2560, 1440, 358, 654, 358, 201.375);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0011
     * @tc.name MatrixSurface001_0011
     * @tc.desc Verify surface input vector 11 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0011', 0, (): void => {
      const vector = new SurfaceVector(8192, 1, 374, 666, 374, 0.045654296875);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0012
     * @tc.name MatrixSurface001_0012
     * @tc.desc Verify surface input vector 12 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0012', 0, (): void => {
      const vector = new SurfaceVector(854, 480, 3391, 1427, 2538.8708333333334, 1427);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0013
     * @tc.name MatrixSurface001_0013
     * @tc.desc Verify surface input vector 13 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0013', 0, (): void => {
      const vector = new SurfaceVector(720, 1280, 2151, 2480, 1395, 2480);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0014
     * @tc.name MatrixSurface001_0014
     * @tc.desc Verify surface input vector 14 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0014', 0, (): void => {
      const vector = new SurfaceVector(3840, 2160, 2560, 1439, 2558.222222222222, 1439);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0015
     * @tc.name MatrixSurface001_0015
     * @tc.desc Verify surface input vector 15 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0015', 0, (): void => {
      const vector = new SurfaceVector(9, 21, 551, 1023, 438.42857142857144, 1023);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0016
     * @tc.name MatrixSurface001_0016
     * @tc.desc Verify surface input vector 16 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0016', 0, (): void => {
      const vector = new SurfaceVector(4, 3, 975, 755, 975, 731.25);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0017
     * @tc.name MatrixSurface001_0017
     * @tc.desc Verify surface input vector 17 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0017', 0, (): void => {
      const vector = new SurfaceVector(1536, 2048, 671, 1279, 671, 894.6666666666666);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0018
     * @tc.name MatrixSurface001_0018
     * @tc.desc Verify surface input vector 18 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0018', 0, (): void => {
      const vector = new SurfaceVector(1080, 1920, 1263, 763, 429.1875, 763);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0019
     * @tc.name MatrixSurface001_0019
     * @tc.desc Verify surface input vector 19 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0019', 0, (): void => {
      const vector = new SurfaceVector(1080, 1080, 799, 587, 587, 587);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0020
     * @tc.name MatrixSurface001_0020
     * @tc.desc Verify surface input vector 20 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0020', 0, (): void => {
      const vector = new SurfaceVector(720, 1280, 1919, 1067, 600.1875, 1067);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0021
     * @tc.name MatrixSurface001_0021
     * @tc.desc Verify surface input vector 21 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0021', 0, (): void => {
      const vector = new SurfaceVector(21, 9, 671, 1280, 671, 287.57142857142856);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0022
     * @tc.name MatrixSurface001_0022
     * @tc.desc Verify surface input vector 22 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0022', 0, (): void => {
      const vector = new SurfaceVector(1536, 2048, 1024, 731, 548.25, 731);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0023
     * @tc.name MatrixSurface001_0023
     * @tc.desc Verify surface input vector 23 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0023', 0, (): void => {
      const vector = new SurfaceVector(4, 3, 2511, 1043, 1390.6666666666667, 1043);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0024
     * @tc.name MatrixSurface001_0024
     * @tc.desc Verify surface input vector 24 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0024', 0, (): void => {
      const vector = new SurfaceVector(352, 288, 1366, 755, 922.7777777777778, 755);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0025
     * @tc.name MatrixSurface001_0025
     * @tc.desc Verify surface input vector 25 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0025', 0, (): void => {
      const vector = new SurfaceVector(3, 4, 358, 654, 358, 477.3333333333333);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0026
     * @tc.name MatrixSurface001_0026
     * @tc.desc Verify surface input vector 26 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0026', 0, (): void => {
      const vector = new SurfaceVector(9, 21, 751, 1267, 543, 1267);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0027
     * @tc.name MatrixSurface001_0027
     * @tc.desc Verify surface input vector 27 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0027', 0, (): void => {
      const vector = new SurfaceVector(1080, 2340, 2560, 1079, 498, 1079);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0028
     * @tc.name MatrixSurface001_0028
     * @tc.desc Verify surface input vector 28 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0028', 0, (): void => {
      const vector = new SurfaceVector(640, 480, 311, 603, 311, 233.25);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0029
     * @tc.name MatrixSurface001_0029
     * @tc.desc Verify surface input vector 29 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0029', 0, (): void => {
      const vector = new SurfaceVector(2560, 1080, 1031, 1919, 1031, 434.953125);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0030
     * @tc.name MatrixSurface001_0030
     * @tc.desc Verify surface input vector 30 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0030', 0, (): void => {
      const vector = new SurfaceVector(1, 1, 374, 666, 374, 374);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0031
     * @tc.name MatrixSurface001_0031
     * @tc.desc Verify surface input vector 31 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0031', 0, (): void => {
      const vector = new SurfaceVector(720, 1280, 783, 1267, 712.6875, 1267);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0032
     * @tc.name MatrixSurface001_0032
     * @tc.desc Verify surface input vector 32 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0032', 0, (): void => {
      const vector = new SurfaceVector(1440, 1080, 1263, 799, 1065.3333333333333, 799);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0033
     * @tc.name MatrixSurface001_0033
     * @tc.desc Verify surface input vector 33 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0033', 0, (): void => {
      const vector = new SurfaceVector(2200, 2480, 1999, 1499, 1329.758064516129, 1499);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0034
     * @tc.name MatrixSurface001_0034
     * @tc.desc Verify surface input vector 34 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0034', 0, (): void => {
      const vector = new SurfaceVector(854, 480, 3440, 1440, 2562, 1440);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0035
     * @tc.name MatrixSurface001_0035
     * @tc.desc Verify surface input vector 35 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0035', 0, (): void => {
      const vector = new SurfaceVector(1080, 1080, 1151, 1919, 1151, 1151);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0036
     * @tc.name MatrixSurface001_0036
     * @tc.desc Verify surface input vector 36 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0036', 0, (): void => {
      const vector = new SurfaceVector(1080, 1080, 223, 320, 223, 223);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0037
     * @tc.name MatrixSurface001_0037
     * @tc.desc Verify surface input vector 37 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0037', 0, (): void => {
      const vector = new SurfaceVector(9, 21, 1391, 2560, 1097.142857142857, 2560);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0038
     * @tc.name MatrixSurface001_0038
     * @tc.desc Verify surface input vector 38 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0038', 0, (): void => {
      const vector = new SurfaceVector(2200, 2480, 975, 599, 531.3709677419355, 599);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0039
     * @tc.name MatrixSurface001_0039
     * @tc.desc Verify surface input vector 39 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0039', 0, (): void => {
      const vector = new SurfaceVector(2560, 1080, 639, 323, 639, 269.578125);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0040
     * @tc.name MatrixSurface001_0040
     * @tc.desc Verify surface input vector 40 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0040', 0, (): void => {
      const vector = new SurfaceVector(352, 288, 1031, 1919, 1031, 843.5454545454545);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0041
     * @tc.name MatrixSurface001_0041
     * @tc.desc Verify surface input vector 41 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0041', 0, (): void => {
      const vector = new SurfaceVector(1536, 2048, 551, 799, 551, 734.6666666666666);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0042
     * @tc.name MatrixSurface001_0042
     * @tc.desc Verify surface input vector 42 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0042', 0, (): void => {
      const vector = new SurfaceVector(1080, 1080, 2183, 2479, 2183, 2183);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0043
     * @tc.name MatrixSurface001_0043
     * @tc.desc Verify surface input vector 43 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0043', 0, (): void => {
      const vector = new SurfaceVector(720, 1280, 599, 799, 449.4375, 799);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0044
     * @tc.name MatrixSurface001_0044
     * @tc.desc Verify surface input vector 44 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0044', 0, (): void => {
      const vector = new SurfaceVector(4, 3, 583, 987, 583, 437.25);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0045
     * @tc.name MatrixSurface001_0045
     * @tc.desc Verify surface input vector 45 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0045', 0, (): void => {
      const vector = new SurfaceVector(21, 9, 1487, 2048, 1487, 637.2857142857143);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0046
     * @tc.name MatrixSurface001_0046
     * @tc.desc Verify surface input vector 46 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0046', 0, (): void => {
      const vector = new SurfaceVector(2048, 1536, 2031, 1523, 2030.6666666666667, 1523);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0047
     * @tc.name MatrixSurface001_0047
     * @tc.desc Verify surface input vector 47 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0047', 0, (): void => {
      const vector = new SurfaceVector(2560, 1440, 375, 630, 375, 210.9375);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0048
     * @tc.name MatrixSurface001_0048
     * @tc.desc Verify surface input vector 48 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0048', 0, (): void => {
      const vector = new SurfaceVector(2560, 1440, 1439, 2547, 1439, 809.4375);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0049
     * @tc.name MatrixSurface001_0049
     * @tc.desc Verify surface input vector 49 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0049', 0, (): void => {
      const vector = new SurfaceVector(9, 21, 411, 902, 386.57142857142856, 902);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0050
     * @tc.name MatrixSurface001_0050
     * @tc.desc Verify surface input vector 50 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0050', 0, (): void => {
      const vector = new SurfaceVector(8192, 1, 799, 587, 799, 0.0975341796875);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0051
     * @tc.name MatrixSurface001_0051
     * @tc.desc Verify surface input vector 51 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0051', 0, (): void => {
      const vector = new SurfaceVector(1920, 1080, 583, 799, 583, 327.9375);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0052
     * @tc.name MatrixSurface001_0052
     * @tc.desc Verify surface input vector 52 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0052', 0, (): void => {
      const vector = new SurfaceVector(1536, 2048, 395, 878, 395, 526.6666666666666);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0053
     * @tc.name MatrixSurface001_0053
     * @tc.desc Verify surface input vector 53 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0053', 0, (): void => {
      const vector = new SurfaceVector(720, 1280, 1007, 587, 330.1875, 587);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0054
     * @tc.name MatrixSurface001_0054
     * @tc.desc Verify surface input vector 54 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0054', 0, (): void => {
      const vector = new SurfaceVector(854, 480, 1920, 1199, 1920, 1079.1569086651054);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0055
     * @tc.name MatrixSurface001_0055
     * @tc.desc Verify surface input vector 55 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0055', 0, (): void => {
      const vector = new SurfaceVector(1, 8192, 2199, 2479, 0.3026123046875, 2479);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0056
     * @tc.name MatrixSurface001_0056
     * @tc.desc Verify surface input vector 56 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0056', 0, (): void => {
      const vector = new SurfaceVector(4096, 2160, 751, 1280, 751, 396.03515625);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0057
     * @tc.name MatrixSurface001_0057
     * @tc.desc Verify surface input vector 57 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0057', 0, (): void => {
      const vector = new SurfaceVector(4096, 2160, 1535, 2047, 1535, 809.47265625);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0058
     * @tc.name MatrixSurface001_0058
     * @tc.desc Verify surface input vector 58 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0058', 0, (): void => {
      const vector = new SurfaceVector(2560, 1440, 395, 915, 395, 222.1875);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0059
     * @tc.name MatrixSurface001_0059
     * @tc.desc Verify surface input vector 59 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0059', 0, (): void => {
      const vector = new SurfaceVector(854, 480, 1151, 1883, 1151, 646.9320843091335);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0060
     * @tc.name MatrixSurface001_0060
     * @tc.desc Verify surface input vector 60 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0060', 0, (): void => {
      const vector = new SurfaceVector(1080, 1080, 2560, 1067, 1067, 1067);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0061
     * @tc.name MatrixSurface001_0061
     * @tc.desc Verify surface input vector 61 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0061', 0, (): void => {
      const vector = new SurfaceVector(2560, 1080, 3840, 2147, 3840, 1620);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0062
     * @tc.name MatrixSurface001_0062
     * @tc.desc Verify surface input vector 62 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0062', 0, (): void => {
      const vector = new SurfaceVector(854, 480, 975, 587, 975, 548.0093676814988);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0063
     * @tc.name MatrixSurface001_0063
     * @tc.desc Verify surface input vector 63 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0063', 0, (): void => {
      const vector = new SurfaceVector(2560, 1440, 600, 1024, 600, 337.5);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0064
     * @tc.name MatrixSurface001_0064
     * @tc.desc Verify surface input vector 64 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0064', 0, (): void => {
      const vector = new SurfaceVector(640, 480, 639, 347, 462.6666666666667, 347);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0065
     * @tc.name MatrixSurface001_0065
     * @tc.desc Verify surface input vector 65 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0065', 0, (): void => {
      const vector = new SurfaceVector(3, 4, 1920, 1187, 890.25, 1187);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0066
     * @tc.name MatrixSurface001_0066
     * @tc.desc Verify surface input vector 66 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0066', 0, (): void => {
      const vector = new SurfaceVector(9, 16, 583, 987, 555.1875, 987);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0067
     * @tc.name MatrixSurface001_0067
     * @tc.desc Verify surface input vector 67 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0067', 0, (): void => {
      const vector = new SurfaceVector(3, 4, 319, 240, 180, 240);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0068
     * @tc.name MatrixSurface001_0068
     * @tc.desc Verify surface input vector 68 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0068', 0, (): void => {
      const vector = new SurfaceVector(2560, 1440, 223, 320, 223, 125.4375);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0069
     * @tc.name MatrixSurface001_0069
     * @tc.desc Verify surface input vector 69 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0069', 0, (): void => {
      const vector = new SurfaceVector(9, 16, 3839, 2159, 1214.4375, 2159);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0070
     * @tc.name MatrixSurface001_0070
     * @tc.desc Verify surface input vector 70 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0070', 0, (): void => {
      const vector = new SurfaceVector(2560, 1080, 360, 639, 360, 151.875);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0071
     * @tc.name MatrixSurface001_0071
     * @tc.desc Verify surface input vector 71 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0071', 0, (): void => {
      const vector = new SurfaceVector(9, 21, 975, 767, 328.7142857142857, 767);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0072
     * @tc.name MatrixSurface001_0072
     * @tc.desc Verify surface input vector 72 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0072', 0, (): void => {
      const vector = new SurfaceVector(2560, 1440, 271, 239, 271, 152.4375);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0073
     * @tc.name MatrixSurface001_0073
     * @tc.desc Verify surface input vector 73 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0073', 0, (): void => {
      const vector = new SurfaceVector(1, 1, 1440, 2523, 1440, 1440);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0074
     * @tc.name MatrixSurface001_0074
     * @tc.desc Verify surface input vector 74 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0074', 0, (): void => {
      const vector = new SurfaceVector(1440, 2560, 551, 987, 551, 979.5555555555555);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0075
     * @tc.name MatrixSurface001_0075
     * @tc.desc Verify surface input vector 75 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0075', 0, (): void => {
      const vector = new SurfaceVector(3840, 2160, 191, 320, 191, 107.4375);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0076
     * @tc.name MatrixSurface001_0076
     * @tc.desc Verify surface input vector 76 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0076', 0, (): void => {
      const vector = new SurfaceVector(1920, 1080, 1200, 1920, 1200, 675);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0077
     * @tc.name MatrixSurface001_0077
     * @tc.desc Verify surface input vector 77 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0077', 0, (): void => {
      const vector = new SurfaceVector(2048, 1536, 1999, 1535, 1999, 1499.25);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0078
     * @tc.name MatrixSurface001_0078
     * @tc.desc Verify surface input vector 78 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0078', 0, (): void => {
      const vector = new SurfaceVector(1, 1, 2559, 1440, 1440, 1440);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0079
     * @tc.name MatrixSurface001_0079
     * @tc.desc Verify surface input vector 79 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0079', 0, (): void => {
      const vector = new SurfaceVector(4, 3, 1183, 1883, 1183, 887.25);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0080
     * @tc.name MatrixSurface001_0080
     * @tc.desc Verify surface input vector 80 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0080', 0, (): void => {
      const vector = new SurfaceVector(4096, 2160, 1151, 1919, 1151, 606.97265625);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0081
     * @tc.name MatrixSurface001_0081
     * @tc.desc Verify surface input vector 81 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0081', 0, (): void => {
      const vector = new SurfaceVector(1920, 1080, 1279, 763, 1279, 719.4375);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0082
     * @tc.name MatrixSurface001_0082
     * @tc.desc Verify surface input vector 82 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0082', 0, (): void => {
      const vector = new SurfaceVector(4096, 2160, 1231, 720, 1231, 649.16015625);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0083
     * @tc.name MatrixSurface001_0083
     * @tc.desc Verify surface input vector 83 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0083', 0, (): void => {
      const vector = new SurfaceVector(720, 1280, 719, 1243, 699.1875, 1243);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0084
     * @tc.name MatrixSurface001_0084
     * @tc.desc Verify surface input vector 84 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0084', 0, (): void => {
      const vector = new SurfaceVector(1, 8192, 1519, 2035, 0.2484130859375, 2035);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0085
     * @tc.name MatrixSurface001_0085
     * @tc.desc Verify surface input vector 85 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0085', 0, (): void => {
      const vector = new SurfaceVector(2048, 1536, 2048, 1536, 2048, 1536);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0086
     * @tc.name MatrixSurface001_0086
     * @tc.desc Verify surface input vector 86 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0086', 0, (): void => {
      const vector = new SurfaceVector(1, 8192, 1007, 755, 0.0921630859375, 755);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0087
     * @tc.name MatrixSurface001_0087
     * @tc.desc Verify surface input vector 87 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0087', 0, (): void => {
      const vector = new SurfaceVector(640, 480, 341, 844, 341, 255.75);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0088
     * @tc.name MatrixSurface001_0088
     * @tc.desc Verify surface input vector 88 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0088', 0, (): void => {
      const vector = new SurfaceVector(2560, 1080, 551, 763, 551, 232.453125);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0089
     * @tc.name MatrixSurface001_0089
     * @tc.desc Verify surface input vector 89 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0089', 0, (): void => {
      const vector = new SurfaceVector(1080, 1080, 1279, 799, 799, 799);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0090
     * @tc.name MatrixSurface001_0090
     * @tc.desc Verify surface input vector 90 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0090', 0, (): void => {
      const vector = new SurfaceVector(1536, 2048, 1183, 1883, 1183, 1577.3333333333333);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0091
     * @tc.name MatrixSurface001_0091
     * @tc.desc Verify surface input vector 91 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0091', 0, (): void => {
      const vector = new SurfaceVector(2048, 1536, 600, 987, 600, 450);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0092
     * @tc.name MatrixSurface001_0092
     * @tc.desc Verify surface input vector 92 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0092', 0, (): void => {
      const vector = new SurfaceVector(2048, 1536, 359, 639, 359, 269.25);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0093
     * @tc.name MatrixSurface001_0093
     * @tc.desc Verify surface input vector 93 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0093', 0, (): void => {
      const vector = new SurfaceVector(16, 9, 1903, 1163, 1903, 1070.4375);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0094
     * @tc.name MatrixSurface001_0094
     * @tc.desc Verify surface input vector 94 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0094', 0, (): void => {
      const vector = new SurfaceVector(9, 21, 3439, 1403, 601.2857142857143, 1403);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0095
     * @tc.name MatrixSurface001_0095
     * @tc.desc Verify surface input vector 95 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0095', 0, (): void => {
      const vector = new SurfaceVector(1, 1, 1439, 2523, 1439, 1439);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0096
     * @tc.name MatrixSurface001_0096
     * @tc.desc Verify surface input vector 96 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0096', 0, (): void => {
      const vector = new SurfaceVector(2560, 1440, 1279, 763, 1279, 719.4375);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0097
     * @tc.name MatrixSurface001_0097
     * @tc.desc Verify surface input vector 97 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0097', 0, (): void => {
      const vector = new SurfaceVector(1, 1, 1080, 1919, 1080, 1080);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0098
     * @tc.name MatrixSurface001_0098
     * @tc.desc Verify surface input vector 98 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0098', 0, (): void => {
      const vector = new SurfaceVector(3, 4, 767, 1011, 758.25, 1011);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0099
     * @tc.name MatrixSurface001_0099
     * @tc.desc Verify surface input vector 99 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0099', 0, (): void => {
      const vector = new SurfaceVector(1536, 2048, 591, 359, 269.25, 359);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE001_0100
     * @tc.name MatrixSurface001_0100
     * @tc.desc Verify surface input vector 100 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface001_0100', 0, (): void => {
      const vector = new SurfaceVector(1, 1, 3391, 1427, 1427, 1427);
      verifySurface(vector);
    });

  });
}
