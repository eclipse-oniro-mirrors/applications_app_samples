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

export default function registerMatrixSurface003(): void {
  describe('MatrixSurface003', (): void => {
    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0001
     * @tc.name MatrixSurface003_0001
     * @tc.desc Verify fitted video dimensions for input vector 1 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0001', 0, (): void => {
      const vector = new SurfaceVector(1, 8192, 1920, 1067, 0.1302490234375, 1067);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0002
     * @tc.name MatrixSurface003_0002
     * @tc.desc Verify fitted video dimensions for input vector 2 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0002', 0, (): void => {
      const vector = new SurfaceVector(1080, 1080, 3423, 1439, 1439, 1439);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0003
     * @tc.name MatrixSurface003_0003
     * @tc.desc Verify fitted video dimensions for input vector 3 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0003', 0, (): void => {
      const vector = new SurfaceVector(1080, 1920, 1365, 768, 432, 768);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0004
     * @tc.name MatrixSurface003_0004
     * @tc.desc Verify fitted video dimensions for input vector 4 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0004', 0, (): void => {
      const vector = new SurfaceVector(854, 480, 1871, 1163, 1871, 1051.615925058548);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0005
     * @tc.name MatrixSurface003_0005
     * @tc.desc Verify fitted video dimensions for input vector 5 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0005', 0, (): void => {
      const vector = new SurfaceVector(9, 16, 1536, 2048, 1152, 2048);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0006
     * @tc.name MatrixSurface003_0006
     * @tc.desc Verify fitted video dimensions for input vector 6 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0006', 0, (): void => {
      const vector = new SurfaceVector(2560, 1080, 2048, 1499, 2048, 864);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0007
     * @tc.name MatrixSurface003_0007
     * @tc.desc Verify fitted video dimensions for input vector 7 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0007', 0, (): void => {
      const vector = new SurfaceVector(21, 9, 551, 987, 551, 236.14285714285714);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0008
     * @tc.name MatrixSurface003_0008
     * @tc.desc Verify fitted video dimensions for input vector 8 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0008', 0, (): void => {
      const vector = new SurfaceVector(4096, 2160, 1903, 1200, 1903, 1003.53515625);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0009
     * @tc.name MatrixSurface003_0009
     * @tc.desc Verify fitted video dimensions for input vector 9 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0009', 0, (): void => {
      const vector = new SurfaceVector(1, 1, 640, 359, 359, 359);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0010
     * @tc.name MatrixSurface003_0010
     * @tc.desc Verify fitted video dimensions for input vector 10 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0010', 0, (): void => {
      const vector = new SurfaceVector(2200, 2480, 1536, 2035, 1536, 1731.490909090909);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0011
     * @tc.name MatrixSurface003_0011
     * @tc.desc Verify fitted video dimensions for input vector 11 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0011', 0, (): void => {
      const vector = new SurfaceVector(9, 16, 1903, 1163, 654.1875, 1163);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0012
     * @tc.name MatrixSurface003_0012
     * @tc.desc Verify fitted video dimensions for input vector 12 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0012', 0, (): void => {
      const vector = new SurfaceVector(1440, 2560, 551, 1023, 551, 979.5555555555555);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0013
     * @tc.name MatrixSurface003_0013
     * @tc.desc Verify fitted video dimensions for input vector 13 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0013', 0, (): void => {
      const vector = new SurfaceVector(1, 8192, 640, 347, 0.0423583984375, 347);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0014
     * @tc.name MatrixSurface003_0014
     * @tc.desc Verify fitted video dimensions for input vector 14 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0014', 0, (): void => {
      const vector = new SurfaceVector(4096, 2160, 2048, 1536, 2048, 1080);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0015
     * @tc.name MatrixSurface003_0015
     * @tc.desc Verify fitted video dimensions for input vector 15 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0015', 0, (): void => {
      const vector = new SurfaceVector(3, 4, 1366, 767, 575.25, 767);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0016
     * @tc.name MatrixSurface003_0016
     * @tc.desc Verify fitted video dimensions for input vector 16 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0016', 0, (): void => {
      const vector = new SurfaceVector(1440, 1080, 2543, 1067, 1422.6666666666667, 1067);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0017
     * @tc.name MatrixSurface003_0017
     * @tc.desc Verify fitted video dimensions for input vector 17 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0017', 0, (): void => {
      const vector = new SurfaceVector(2560, 1440, 767, 1023, 767, 431.4375);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0018
     * @tc.name MatrixSurface003_0018
     * @tc.desc Verify fitted video dimensions for input vector 18 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0018', 0, (): void => {
      const vector = new SurfaceVector(4096, 2160, 719, 987, 719, 379.16015625);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0019
     * @tc.name MatrixSurface003_0019
     * @tc.desc Verify fitted video dimensions for input vector 19 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0019', 0, (): void => {
      const vector = new SurfaceVector(8192, 1, 1031, 1920, 1031, 0.1258544921875);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0020
     * @tc.name MatrixSurface003_0020
     * @tc.desc Verify fitted video dimensions for input vector 20 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0020', 0, (): void => {
      const vector = new SurfaceVector(3, 4, 1920, 1199, 899.25, 1199);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0021
     * @tc.name MatrixSurface003_0021
     * @tc.desc Verify fitted video dimensions for input vector 21 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0021', 0, (): void => {
      const vector = new SurfaceVector(352, 288, 719, 1024, 719, 588.2727272727273);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0022
     * @tc.name MatrixSurface003_0022
     * @tc.desc Verify fitted video dimensions for input vector 22 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0022', 0, (): void => {
      const vector = new SurfaceVector(1920, 1080, 2183, 2467, 2183, 1227.9375);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0023
     * @tc.name MatrixSurface003_0023
     * @tc.desc Verify fitted video dimensions for input vector 23 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0023', 0, (): void => {
      const vector = new SurfaceVector(1080, 2340, 800, 599, 276.46153846153845, 599);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0024
     * @tc.name MatrixSurface003_0024
     * @tc.desc Verify fitted video dimensions for input vector 24 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0024', 0, (): void => {
      const vector = new SurfaceVector(1080, 1920, 1487, 2048, 1152, 2048);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0025
     * @tc.name MatrixSurface003_0025
     * @tc.desc Verify fitted video dimensions for input vector 25 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0025', 0, (): void => {
      const vector = new SurfaceVector(2200, 2480, 1279, 787, 698.1451612903226, 787);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0026
     * @tc.name MatrixSurface003_0026
     * @tc.desc Verify fitted video dimensions for input vector 26 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0026', 0, (): void => {
      const vector = new SurfaceVector(9, 21, 640, 323, 138.42857142857142, 323);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0027
     * @tc.name MatrixSurface003_0027
     * @tc.desc Verify fitted video dimensions for input vector 27 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0027', 0, (): void => {
      const vector = new SurfaceVector(9, 16, 1349, 767, 431.4375, 767);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0028
     * @tc.name MatrixSurface003_0028
     * @tc.desc Verify fitted video dimensions for input vector 28 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0028', 0, (): void => {
      const vector = new SurfaceVector(352, 288, 271, 239, 271, 221.72727272727272);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0029
     * @tc.name MatrixSurface003_0029
     * @tc.desc Verify fitted video dimensions for input vector 29 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0029', 0, (): void => {
      const vector = new SurfaceVector(2560, 1080, 1151, 1883, 1151, 485.578125);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0030
     * @tc.name MatrixSurface003_0030
     * @tc.desc Verify fitted video dimensions for input vector 30 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0030', 0, (): void => {
      const vector = new SurfaceVector(720, 1280, 671, 1280, 671, 1192.888888888889);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0031
     * @tc.name MatrixSurface003_0031
     * @tc.desc Verify fitted video dimensions for input vector 31 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0031', 0, (): void => {
      const vector = new SurfaceVector(3840, 2160, 1280, 787, 1280, 720);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0032
     * @tc.name MatrixSurface003_0032
     * @tc.desc Verify fitted video dimensions for input vector 32 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0032', 0, (): void => {
      const vector = new SurfaceVector(9, 16, 1871, 1187, 667.6875, 1187);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0033
     * @tc.name MatrixSurface003_0033
     * @tc.desc Verify fitted video dimensions for input vector 33 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0033', 0, (): void => {
      const vector = new SurfaceVector(2560, 1080, 358, 630, 358, 151.03125);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0034
     * @tc.name MatrixSurface003_0034
     * @tc.desc Verify fitted video dimensions for input vector 34 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0034', 0, (): void => {
      const vector = new SurfaceVector(720, 1280, 1903, 1163, 654.1875, 1163);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0035
     * @tc.name MatrixSurface003_0035
     * @tc.desc Verify fitted video dimensions for input vector 35 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0035', 0, (): void => {
      const vector = new SurfaceVector(1920, 1080, 358, 666, 358, 201.375);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0036
     * @tc.name MatrixSurface003_0036
     * @tc.desc Verify fitted video dimensions for input vector 36 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0036', 0, (): void => {
      const vector = new SurfaceVector(854, 480, 599, 1023, 599, 336.6744730679157);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0037
     * @tc.name MatrixSurface003_0037
     * @tc.desc Verify fitted video dimensions for input vector 37 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0037', 0, (): void => {
      const vector = new SurfaceVector(1, 1, 239, 319, 239, 239);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0038
     * @tc.name MatrixSurface003_0038
     * @tc.desc Verify fitted video dimensions for input vector 38 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0038', 0, (): void => {
      const vector = new SurfaceVector(1080, 2340, 3791, 2160, 996.9230769230769, 2160);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0039
     * @tc.name MatrixSurface003_0039
     * @tc.desc Verify fitted video dimensions for input vector 39 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0039', 0, (): void => {
      const vector = new SurfaceVector(4, 3, 599, 987, 599, 449.25);
      verifySurface(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXSURFACE003_0040
     * @tc.name MatrixSurface003_0040
     * @tc.desc Verify fitted video dimensions for input vector 40 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixSurface003_0040', 0, (): void => {
      const vector = new SurfaceVector(854, 480, 1423, 2559, 1423, 799.8126463700235);
      verifySurface(vector);
    });

  });
}
