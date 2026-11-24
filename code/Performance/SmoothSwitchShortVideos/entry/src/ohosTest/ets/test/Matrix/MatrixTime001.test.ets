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
import { ClockVector, verifyClock } from '../Shared/MatrixFixture';

export default function registerMatrixTime001(): void {
  describe('MatrixTime001', (): void => {
    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0001
     * @tc.name MatrixTime001_0001
     * @tc.desc Verify time input vector 1 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0001', 0, (): void => {
      const vector = new ClockVector(198882.035, "55:14:42", 198882);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0002
     * @tc.name MatrixTime001_0002
     * @tc.desc Verify time input vector 2 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0002', 0, (): void => {
      const vector = new ClockVector(146552.613, "40:42:32", 146552);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0003
     * @tc.name MatrixTime001_0003
     * @tc.desc Verify time input vector 3 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0003', 0, (): void => {
      const vector = new ClockVector(530109.001, "147:15:09", 530109);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0004
     * @tc.name MatrixTime001_0004
     * @tc.desc Verify time input vector 4 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0004', 0, (): void => {
      const vector = new ClockVector(91752.473, "25:29:12", 91752);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0005
     * @tc.name MatrixTime001_0005
     * @tc.desc Verify time input vector 5 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0005', 0, (): void => {
      const vector = new ClockVector(18676.969, "05:11:16", 18676);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0006
     * @tc.name MatrixTime001_0006
     * @tc.desc Verify time input vector 6 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0006', 0, (): void => {
      const vector = new ClockVector(7258.5, "02:00:58", 7258);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0007
     * @tc.name MatrixTime001_0007
     * @tc.desc Verify time input vector 7 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0007', 0, (): void => {
      const vector = new ClockVector(158960.081, "44:09:20", 158960);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0008
     * @tc.name MatrixTime001_0008
     * @tc.desc Verify time input vector 8 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0008', 0, (): void => {
      const vector = new ClockVector(126015.832, "35:00:15", 126015);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0009
     * @tc.name MatrixTime001_0009
     * @tc.desc Verify time input vector 9 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0009', 0, (): void => {
      const vector = new ClockVector(299455.086, "83:10:55", 299455);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0010
     * @tc.name MatrixTime001_0010
     * @tc.desc Verify time input vector 10 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0010', 0, (): void => {
      const vector = new ClockVector(231327.731, "64:15:27", 231327);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0011
     * @tc.name MatrixTime001_0011
     * @tc.desc Verify time input vector 11 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0011', 0, (): void => {
      const vector = new ClockVector(249956.414, "69:25:56", 249956);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0012
     * @tc.name MatrixTime001_0012
     * @tc.desc Verify time input vector 12 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0012', 0, (): void => {
      const vector = new ClockVector(560900.989, "155:48:20", 560900);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0013
     * @tc.name MatrixTime001_0013
     * @tc.desc Verify time input vector 13 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0013', 0, (): void => {
      const vector = new ClockVector(563439.765, "156:30:39", 563439);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0014
     * @tc.name MatrixTime001_0014
     * @tc.desc Verify time input vector 14 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0014', 0, (): void => {
      const vector = new ClockVector(269170.82, "74:46:10", 269170);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0015
     * @tc.name MatrixTime001_0015
     * @tc.desc Verify time input vector 15 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0015', 0, (): void => {
      const vector = new ClockVector(245095.512, "68:04:55", 245095);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0016
     * @tc.name MatrixTime001_0016
     * @tc.desc Verify time input vector 16 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0016', 0, (): void => {
      const vector = new ClockVector(449334.423, "124:48:54", 449334);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0017
     * @tc.name MatrixTime001_0017
     * @tc.desc Verify time input vector 17 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0017', 0, (): void => {
      const vector = new ClockVector(510731.12, "141:52:11", 510731);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0018
     * @tc.name MatrixTime001_0018
     * @tc.desc Verify time input vector 18 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0018', 0, (): void => {
      const vector = new ClockVector(205548.736, "57:05:48", 205548);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0019
     * @tc.name MatrixTime001_0019
     * @tc.desc Verify time input vector 19 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0019', 0, (): void => {
      const vector = new ClockVector(205405.141, "57:03:25", 205405);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0020
     * @tc.name MatrixTime001_0020
     * @tc.desc Verify time input vector 20 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0020', 0, (): void => {
      const vector = new ClockVector(461197.737, "128:06:37", 461197);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0021
     * @tc.name MatrixTime001_0021
     * @tc.desc Verify time input vector 21 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0021', 0, (): void => {
      const vector = new ClockVector(310149.596, "86:09:09", 310149);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0022
     * @tc.name MatrixTime001_0022
     * @tc.desc Verify time input vector 22 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0022', 0, (): void => {
      const vector = new ClockVector(383304.237, "106:28:24", 383304);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0023
     * @tc.name MatrixTime001_0023
     * @tc.desc Verify time input vector 23 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0023', 0, (): void => {
      const vector = new ClockVector(918549.5, "255:09:09", 918549);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0024
     * @tc.name MatrixTime001_0024
     * @tc.desc Verify time input vector 24 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0024', 0, (): void => {
      const vector = new ClockVector(572516.898, "159:01:56", 572516);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0025
     * @tc.name MatrixTime001_0025
     * @tc.desc Verify time input vector 25 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0025', 0, (): void => {
      const vector = new ClockVector(257600.879, "71:33:20", 257600);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0026
     * @tc.name MatrixTime001_0026
     * @tc.desc Verify time input vector 26 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0026', 0, (): void => {
      const vector = new ClockVector(11326.961, "03:08:46", 11326);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0027
     * @tc.name MatrixTime001_0027
     * @tc.desc Verify time input vector 27 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0027', 0, (): void => {
      const vector = new ClockVector(141139.456, "39:12:19", 141139);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0028
     * @tc.name MatrixTime001_0028
     * @tc.desc Verify time input vector 28 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0028', 0, (): void => {
      const vector = new ClockVector(11750.952, "03:15:50", 11750);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0029
     * @tc.name MatrixTime001_0029
     * @tc.desc Verify time input vector 29 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0029', 0, (): void => {
      const vector = new ClockVector(161104.766, "44:45:04", 161104);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0030
     * @tc.name MatrixTime001_0030
     * @tc.desc Verify time input vector 30 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0030', 0, (): void => {
      const vector = new ClockVector(381281.384, "105:54:41", 381281);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0031
     * @tc.name MatrixTime001_0031
     * @tc.desc Verify time input vector 31 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0031', 0, (): void => {
      const vector = new ClockVector(18166.682, "05:02:46", 18166);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0032
     * @tc.name MatrixTime001_0032
     * @tc.desc Verify time input vector 32 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0032', 0, (): void => {
      const vector = new ClockVector(133125.091, "36:58:45", 133125);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0033
     * @tc.name MatrixTime001_0033
     * @tc.desc Verify time input vector 33 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0033', 0, (): void => {
      const vector = new ClockVector(574941.606, "159:42:21", 574941);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0034
     * @tc.name MatrixTime001_0034
     * @tc.desc Verify time input vector 34 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0034', 0, (): void => {
      const vector = new ClockVector(276407.508, "76:46:47", 276407);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0035
     * @tc.name MatrixTime001_0035
     * @tc.desc Verify time input vector 35 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0035', 0, (): void => {
      const vector = new ClockVector(456044.614, "126:40:44", 456044);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0036
     * @tc.name MatrixTime001_0036
     * @tc.desc Verify time input vector 36 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0036', 0, (): void => {
      const vector = new ClockVector(124593.929, "34:36:33", 124593);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0037
     * @tc.name MatrixTime001_0037
     * @tc.desc Verify time input vector 37 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0037', 0, (): void => {
      const vector = new ClockVector(351070.113, "97:31:10", 351070);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0038
     * @tc.name MatrixTime001_0038
     * @tc.desc Verify time input vector 38 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0038', 0, (): void => {
      const vector = new ClockVector(6318.107, "01:45:18", 6318);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0039
     * @tc.name MatrixTime001_0039
     * @tc.desc Verify time input vector 39 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0039', 0, (): void => {
      const vector = new ClockVector(245181.17, "68:06:21", 245181);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0040
     * @tc.name MatrixTime001_0040
     * @tc.desc Verify time input vector 40 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0040', 0, (): void => {
      const vector = new ClockVector(125415.753, "34:50:15", 125415);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0041
     * @tc.name MatrixTime001_0041
     * @tc.desc Verify time input vector 41 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0041', 0, (): void => {
      const vector = new ClockVector(167833.105, "46:37:13", 167833);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0042
     * @tc.name MatrixTime001_0042
     * @tc.desc Verify time input vector 42 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0042', 0, (): void => {
      const vector = new ClockVector(217125.704, "60:18:45", 217125);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0043
     * @tc.name MatrixTime001_0043
     * @tc.desc Verify time input vector 43 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0043', 0, (): void => {
      const vector = new ClockVector(135542.92, "37:39:02", 135542);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0044
     * @tc.name MatrixTime001_0044
     * @tc.desc Verify time input vector 44 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0044', 0, (): void => {
      const vector = new ClockVector(15093.186, "04:11:33", 15093);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0045
     * @tc.name MatrixTime001_0045
     * @tc.desc Verify time input vector 45 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0045', 0, (): void => {
      const vector = new ClockVector(418238.488, "116:10:38", 418238);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0046
     * @tc.name MatrixTime001_0046
     * @tc.desc Verify time input vector 46 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0046', 0, (): void => {
      const vector = new ClockVector(433648.543, "120:27:28", 433648);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0047
     * @tc.name MatrixTime001_0047
     * @tc.desc Verify time input vector 47 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0047', 0, (): void => {
      const vector = new ClockVector(496049.152, "137:47:29", 496049);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0048
     * @tc.name MatrixTime001_0048
     * @tc.desc Verify time input vector 48 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0048', 0, (): void => {
      const vector = new ClockVector(241681.989, "67:08:01", 241681);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0049
     * @tc.name MatrixTime001_0049
     * @tc.desc Verify time input vector 49 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0049', 0, (): void => {
      const vector = new ClockVector(376666.681, "104:37:46", 376666);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0050
     * @tc.name MatrixTime001_0050
     * @tc.desc Verify time input vector 50 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0050', 0, (): void => {
      const vector = new ClockVector(255026.501, "70:50:26", 255026);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0051
     * @tc.name MatrixTime001_0051
     * @tc.desc Verify time input vector 51 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0051', 0, (): void => {
      const vector = new ClockVector(5653.046, "01:34:13", 5653);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0052
     * @tc.name MatrixTime001_0052
     * @tc.desc Verify time input vector 52 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0052', 0, (): void => {
      const vector = new ClockVector(327719.779, "91:01:59", 327719);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0053
     * @tc.name MatrixTime001_0053
     * @tc.desc Verify time input vector 53 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0053', 0, (): void => {
      const vector = new ClockVector(469896.64, "130:31:36", 469896);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0054
     * @tc.name MatrixTime001_0054
     * @tc.desc Verify time input vector 54 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0054', 0, (): void => {
      const vector = new ClockVector(366723.553, "101:52:03", 366723);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0055
     * @tc.name MatrixTime001_0055
     * @tc.desc Verify time input vector 55 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0055', 0, (): void => {
      const vector = new ClockVector(449037.787, "124:43:57", 449037);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0056
     * @tc.name MatrixTime001_0056
     * @tc.desc Verify time input vector 56 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0056', 0, (): void => {
      const vector = new ClockVector(551708.534, "153:15:08", 551708);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0057
     * @tc.name MatrixTime001_0057
     * @tc.desc Verify time input vector 57 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0057', 0, (): void => {
      const vector = new ClockVector(207837.684, "57:43:57", 207837);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0058
     * @tc.name MatrixTime001_0058
     * @tc.desc Verify time input vector 58 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0058', 0, (): void => {
      const vector = new ClockVector(497602.571, "138:13:22", 497602);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0059
     * @tc.name MatrixTime001_0059
     * @tc.desc Verify time input vector 59 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0059', 0, (): void => {
      const vector = new ClockVector(541689, "150:28:09", 541689);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0060
     * @tc.name MatrixTime001_0060
     * @tc.desc Verify time input vector 60 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0060', 0, (): void => {
      const vector = new ClockVector(363539.001, "100:58:59", 363539);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0061
     * @tc.name MatrixTime001_0061
     * @tc.desc Verify time input vector 61 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0061', 0, (): void => {
      const vector = new ClockVector(422909.419, "117:28:29", 422909);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0062
     * @tc.name MatrixTime001_0062
     * @tc.desc Verify time input vector 62 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0062', 0, (): void => {
      const vector = new ClockVector(332822.157, "92:27:02", 332822);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0063
     * @tc.name MatrixTime001_0063
     * @tc.desc Verify time input vector 63 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0063', 0, (): void => {
      const vector = new ClockVector(273270.462, "75:54:30", 273270);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0064
     * @tc.name MatrixTime001_0064
     * @tc.desc Verify time input vector 64 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0064', 0, (): void => {
      const vector = new ClockVector(468425.269, "130:07:05", 468425);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0065
     * @tc.name MatrixTime001_0065
     * @tc.desc Verify time input vector 65 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0065', 0, (): void => {
      const vector = new ClockVector(308273.926, "85:37:53", 308273);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0066
     * @tc.name MatrixTime001_0066
     * @tc.desc Verify time input vector 66 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0066', 0, (): void => {
      const vector = new ClockVector(20778.173, "05:46:18", 20778);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0067
     * @tc.name MatrixTime001_0067
     * @tc.desc Verify time input vector 67 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0067', 0, (): void => {
      const vector = new ClockVector(562628.265, "156:17:08", 562628);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0068
     * @tc.name MatrixTime001_0068
     * @tc.desc Verify time input vector 68 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0068', 0, (): void => {
      const vector = new ClockVector(431973.616, "119:59:33", 431973);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0069
     * @tc.name MatrixTime001_0069
     * @tc.desc Verify time input vector 69 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0069', 0, (): void => {
      const vector = new ClockVector(564731.901, "156:52:11", 564731);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0070
     * @tc.name MatrixTime001_0070
     * @tc.desc Verify time input vector 70 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0070', 0, (): void => {
      const vector = new ClockVector(918599, "255:09:59", 918599);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0071
     * @tc.name MatrixTime001_0071
     * @tc.desc Verify time input vector 71 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0071', 0, (): void => {
      const vector = new ClockVector(545663.477, "151:34:23", 545663);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0072
     * @tc.name MatrixTime001_0072
     * @tc.desc Verify time input vector 72 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0072', 0, (): void => {
      const vector = new ClockVector(128845.768, "35:47:25", 128845);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0073
     * @tc.name MatrixTime001_0073
     * @tc.desc Verify time input vector 73 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0073', 0, (): void => {
      const vector = new ClockVector(6072.623, "01:41:12", 6072);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0074
     * @tc.name MatrixTime001_0074
     * @tc.desc Verify time input vector 74 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0074', 0, (): void => {
      const vector = new ClockVector(358210.001, "99:30:10", 358210);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0075
     * @tc.name MatrixTime001_0075
     * @tc.desc Verify time input vector 75 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0075', 0, (): void => {
      const vector = new ClockVector(168712.114, "46:51:52", 168712);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0076
     * @tc.name MatrixTime001_0076
     * @tc.desc Verify time input vector 76 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0076', 0, (): void => {
      const vector = new ClockVector(356459.001, "99:00:59", 356459);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0077
     * @tc.name MatrixTime001_0077
     * @tc.desc Verify time input vector 77 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0077', 0, (): void => {
      const vector = new ClockVector(224222.536, "62:17:02", 224222);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0078
     * @tc.name MatrixTime001_0078
     * @tc.desc Verify time input vector 78 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0078', 0, (): void => {
      const vector = new ClockVector(421265.048, "117:01:05", 421265);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0079
     * @tc.name MatrixTime001_0079
     * @tc.desc Verify time input vector 79 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0079', 0, (): void => {
      const vector = new ClockVector(122384.116, "33:59:44", 122384);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0080
     * @tc.name MatrixTime001_0080
     * @tc.desc Verify time input vector 80 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0080', 0, (): void => {
      const vector = new ClockVector(472287.262, "131:11:27", 472287);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0081
     * @tc.name MatrixTime001_0081
     * @tc.desc Verify time input vector 81 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0081', 0, (): void => {
      const vector = new ClockVector(74527.361, "20:42:07", 74527);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0082
     * @tc.name MatrixTime001_0082
     * @tc.desc Verify time input vector 82 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0082', 0, (): void => {
      const vector = new ClockVector(208825.857, "58:00:25", 208825);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0083
     * @tc.name MatrixTime001_0083
     * @tc.desc Verify time input vector 83 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0083', 0, (): void => {
      const vector = new ClockVector(4258.001, "01:10:58", 4258);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0084
     * @tc.name MatrixTime001_0084
     * @tc.desc Verify time input vector 84 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0084', 0, (): void => {
      const vector = new ClockVector(492322.037, "136:45:22", 492322);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0085
     * @tc.name MatrixTime001_0085
     * @tc.desc Verify time input vector 85 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0085', 0, (): void => {
      const vector = new ClockVector(428338.597, "118:58:58", 428338);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0086
     * @tc.name MatrixTime001_0086
     * @tc.desc Verify time input vector 86 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0086', 0, (): void => {
      const vector = new ClockVector(337185.43, "93:39:45", 337185);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0087
     * @tc.name MatrixTime001_0087
     * @tc.desc Verify time input vector 87 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0087', 0, (): void => {
      const vector = new ClockVector(332388.96, "92:19:48", 332388);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0088
     * @tc.name MatrixTime001_0088
     * @tc.desc Verify time input vector 88 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0088', 0, (): void => {
      const vector = new ClockVector(522243.489, "145:04:03", 522243);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0089
     * @tc.name MatrixTime001_0089
     * @tc.desc Verify time input vector 89 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0089', 0, (): void => {
      const vector = new ClockVector(564281.621, "156:44:41", 564281);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0090
     * @tc.name MatrixTime001_0090
     * @tc.desc Verify time input vector 90 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0090', 0, (): void => {
      const vector = new ClockVector(3719.999, "01:01:59", 3719);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0091
     * @tc.name MatrixTime001_0091
     * @tc.desc Verify time input vector 91 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0091', 0, (): void => {
      const vector = new ClockVector(576344.039, "160:05:44", 576344);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0092
     * @tc.name MatrixTime001_0092
     * @tc.desc Verify time input vector 92 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0092', 0, (): void => {
      const vector = new ClockVector(94061.555, "26:07:41", 94061);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0093
     * @tc.name MatrixTime001_0093
     * @tc.desc Verify time input vector 93 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0093', 0, (): void => {
      const vector = new ClockVector(525953.92, "146:05:53", 525953);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0094
     * @tc.name MatrixTime001_0094
     * @tc.desc Verify time input vector 94 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0094', 0, (): void => {
      const vector = new ClockVector(110928.068, "30:48:48", 110928);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0095
     * @tc.name MatrixTime001_0095
     * @tc.desc Verify time input vector 95 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0095', 0, (): void => {
      const vector = new ClockVector(336552.945, "93:29:12", 336552);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0096
     * @tc.name MatrixTime001_0096
     * @tc.desc Verify time input vector 96 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0096', 0, (): void => {
      const vector = new ClockVector(440476.108, "122:21:16", 440476);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0097
     * @tc.name MatrixTime001_0097
     * @tc.desc Verify time input vector 97 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0097', 0, (): void => {
      const vector = new ClockVector(297441.156, "82:37:21", 297441);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0098
     * @tc.name MatrixTime001_0098
     * @tc.desc Verify time input vector 98 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0098', 0, (): void => {
      const vector = new ClockVector(596924.271, "165:48:44", 596924);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0099
     * @tc.name MatrixTime001_0099
     * @tc.desc Verify time input vector 99 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0099', 0, (): void => {
      const vector = new ClockVector(236348.4, "65:39:08", 236348);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME001_0100
     * @tc.name MatrixTime001_0100
     * @tc.desc Verify time input vector 100 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime001_0100', 0, (): void => {
      const vector = new ClockVector(514863.99, "143:01:03", 514863);
      verifyClock(vector);
    });

  });
}
