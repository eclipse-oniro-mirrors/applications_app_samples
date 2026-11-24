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

export default function registerMatrixTime002(): void {
  describe('MatrixTime002', (): void => {
    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0001
     * @tc.name MatrixTime002_0001
     * @tc.desc Verify time input vector 1 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0001', 0, (): void => {
      const vector = new ClockVector(490828.123, "136:20:28", 490828);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0002
     * @tc.name MatrixTime002_0002
     * @tc.desc Verify time input vector 2 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0002', 0, (): void => {
      const vector = new ClockVector(144352.729, "40:05:52", 144352);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0003
     * @tc.name MatrixTime002_0003
     * @tc.desc Verify time input vector 3 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0003', 0, (): void => {
      const vector = new ClockVector(331992.426, "92:13:12", 331992);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0004
     * @tc.name MatrixTime002_0004
     * @tc.desc Verify time input vector 4 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0004', 0, (): void => {
      const vector = new ClockVector(589527.538, "163:45:27", 589527);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0005
     * @tc.name MatrixTime002_0005
     * @tc.desc Verify time input vector 5 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0005', 0, (): void => {
      const vector = new ClockVector(254037.063, "70:33:57", 254037);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0006
     * @tc.name MatrixTime002_0006
     * @tc.desc Verify time input vector 6 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0006', 0, (): void => {
      const vector = new ClockVector(391810.085, "108:50:10", 391810);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0007
     * @tc.name MatrixTime002_0007
     * @tc.desc Verify time input vector 7 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0007', 0, (): void => {
      const vector = new ClockVector(107512.852, "29:51:52", 107512);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0008
     * @tc.name MatrixTime002_0008
     * @tc.desc Verify time input vector 8 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0008', 0, (): void => {
      const vector = new ClockVector(8793.068, "02:26:33", 8793);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0009
     * @tc.name MatrixTime002_0009
     * @tc.desc Verify time input vector 9 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0009', 0, (): void => {
      const vector = new ClockVector(99827.232, "27:43:47", 99827);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0010
     * @tc.name MatrixTime002_0010
     * @tc.desc Verify time input vector 10 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0010', 0, (): void => {
      const vector = new ClockVector(191430.703, "53:10:30", 191430);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0011
     * @tc.name MatrixTime002_0011
     * @tc.desc Verify time input vector 11 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0011', 0, (): void => {
      const vector = new ClockVector(408138.424, "113:22:18", 408138);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0012
     * @tc.name MatrixTime002_0012
     * @tc.desc Verify time input vector 12 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0012', 0, (): void => {
      const vector = new ClockVector(267843.605, "74:24:03", 267843);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0013
     * @tc.name MatrixTime002_0013
     * @tc.desc Verify time input vector 13 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0013', 0, (): void => {
      const vector = new ClockVector(590109.919, "163:55:09", 590109);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0014
     * @tc.name MatrixTime002_0014
     * @tc.desc Verify time input vector 14 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0014', 0, (): void => {
      const vector = new ClockVector(517384.986, "143:43:04", 517384);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0015
     * @tc.name MatrixTime002_0015
     * @tc.desc Verify time input vector 15 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0015', 0, (): void => {
      const vector = new ClockVector(206966.47, "57:29:26", 206966);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0016
     * @tc.name MatrixTime002_0016
     * @tc.desc Verify time input vector 16 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0016', 0, (): void => {
      const vector = new ClockVector(4200.5, "01:10:00", 4200);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0017
     * @tc.name MatrixTime002_0017
     * @tc.desc Verify time input vector 17 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0017', 0, (): void => {
      const vector = new ClockVector(281105.218, "78:05:05", 281105);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0018
     * @tc.name MatrixTime002_0018
     * @tc.desc Verify time input vector 18 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0018', 0, (): void => {
      const vector = new ClockVector(312812.377, "86:53:32", 312812);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0019
     * @tc.name MatrixTime002_0019
     * @tc.desc Verify time input vector 19 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0019', 0, (): void => {
      const vector = new ClockVector(586614.665, "162:56:54", 586614);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0020
     * @tc.name MatrixTime002_0020
     * @tc.desc Verify time input vector 20 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0020', 0, (): void => {
      const vector = new ClockVector(462630.046, "128:30:30", 462630);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0021
     * @tc.name MatrixTime002_0021
     * @tc.desc Verify time input vector 21 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0021', 0, (): void => {
      const vector = new ClockVector(384281.345, "106:44:41", 384281);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0022
     * @tc.name MatrixTime002_0022
     * @tc.desc Verify time input vector 22 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0022', 0, (): void => {
      const vector = new ClockVector(82769.806, "22:59:29", 82769);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0023
     * @tc.name MatrixTime002_0023
     * @tc.desc Verify time input vector 23 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0023', 0, (): void => {
      const vector = new ClockVector(505221.02, "140:20:21", 505221);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0024
     * @tc.name MatrixTime002_0024
     * @tc.desc Verify time input vector 24 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0024', 0, (): void => {
      const vector = new ClockVector(409363.436, "113:42:43", 409363);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0025
     * @tc.name MatrixTime002_0025
     * @tc.desc Verify time input vector 25 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0025', 0, (): void => {
      const vector = new ClockVector(148719.327, "41:18:39", 148719);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0026
     * @tc.name MatrixTime002_0026
     * @tc.desc Verify time input vector 26 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0026', 0, (): void => {
      const vector = new ClockVector(57887.314, "16:04:47", 57887);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0027
     * @tc.name MatrixTime002_0027
     * @tc.desc Verify time input vector 27 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0027', 0, (): void => {
      const vector = new ClockVector(9058.999, "02:30:58", 9058);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0028
     * @tc.name MatrixTime002_0028
     * @tc.desc Verify time input vector 28 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0028', 0, (): void => {
      const vector = new ClockVector(546247.266, "151:44:07", 546247);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0029
     * @tc.name MatrixTime002_0029
     * @tc.desc Verify time input vector 29 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0029', 0, (): void => {
      const vector = new ClockVector(465059.678, "129:10:59", 465059);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0030
     * @tc.name MatrixTime002_0030
     * @tc.desc Verify time input vector 30 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0030', 0, (): void => {
      const vector = new ClockVector(453273.945, "125:54:33", 453273);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0031
     * @tc.name MatrixTime002_0031
     * @tc.desc Verify time input vector 31 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0031', 0, (): void => {
      const vector = new ClockVector(421591.328, "117:06:31", 421591);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0032
     * @tc.name MatrixTime002_0032
     * @tc.desc Verify time input vector 32 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0032', 0, (): void => {
      const vector = new ClockVector(285245.958, "79:14:05", 285245);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0033
     * @tc.name MatrixTime002_0033
     * @tc.desc Verify time input vector 33 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0033', 0, (): void => {
      const vector = new ClockVector(582642.457, "161:50:42", 582642);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0034
     * @tc.name MatrixTime002_0034
     * @tc.desc Verify time input vector 34 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0034', 0, (): void => {
      const vector = new ClockVector(213767.527, "59:22:47", 213767);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0035
     * @tc.name MatrixTime002_0035
     * @tc.desc Verify time input vector 35 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0035', 0, (): void => {
      const vector = new ClockVector(455736.374, "126:35:36", 455736);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0036
     * @tc.name MatrixTime002_0036
     * @tc.desc Verify time input vector 36 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0036', 0, (): void => {
      const vector = new ClockVector(564534.464, "156:48:54", 564534);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0037
     * @tc.name MatrixTime002_0037
     * @tc.desc Verify time input vector 37 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0037', 0, (): void => {
      const vector = new ClockVector(180056.545, "50:00:56", 180056);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0038
     * @tc.name MatrixTime002_0038
     * @tc.desc Verify time input vector 38 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0038', 0, (): void => {
      const vector = new ClockVector(219224.37, "60:53:44", 219224);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0039
     * @tc.name MatrixTime002_0039
     * @tc.desc Verify time input vector 39 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0039', 0, (): void => {
      const vector = new ClockVector(320373.628, "88:59:33", 320373);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0040
     * @tc.name MatrixTime002_0040
     * @tc.desc Verify time input vector 40 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0040', 0, (): void => {
      const vector = new ClockVector(258405.424, "71:46:45", 258405);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0041
     * @tc.name MatrixTime002_0041
     * @tc.desc Verify time input vector 41 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0041', 0, (): void => {
      const vector = new ClockVector(291597.181, "80:59:57", 291597);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0042
     * @tc.name MatrixTime002_0042
     * @tc.desc Verify time input vector 42 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0042', 0, (): void => {
      const vector = new ClockVector(210440.091, "58:27:20", 210440);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0043
     * @tc.name MatrixTime002_0043
     * @tc.desc Verify time input vector 43 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0043', 0, (): void => {
      const vector = new ClockVector(310275.83, "86:11:15", 310275);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0044
     * @tc.name MatrixTime002_0044
     * @tc.desc Verify time input vector 44 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0044', 0, (): void => {
      const vector = new ClockVector(108057.858, "30:00:57", 108057);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0045
     * @tc.name MatrixTime002_0045
     * @tc.desc Verify time input vector 45 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0045', 0, (): void => {
      const vector = new ClockVector(109405.065, "30:23:25", 109405);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0046
     * @tc.name MatrixTime002_0046
     * @tc.desc Verify time input vector 46 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0046', 0, (): void => {
      const vector = new ClockVector(500255.334, "138:57:35", 500255);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0047
     * @tc.name MatrixTime002_0047
     * @tc.desc Verify time input vector 47 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0047', 0, (): void => {
      const vector = new ClockVector(48507.94, "13:28:27", 48507);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0048
     * @tc.name MatrixTime002_0048
     * @tc.desc Verify time input vector 48 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0048', 0, (): void => {
      const vector = new ClockVector(392599.334, "109:03:19", 392599);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0049
     * @tc.name MatrixTime002_0049
     * @tc.desc Verify time input vector 49 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0049', 0, (): void => {
      const vector = new ClockVector(301565.397, "83:46:05", 301565);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0050
     * @tc.name MatrixTime002_0050
     * @tc.desc Verify time input vector 50 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0050', 0, (): void => {
      const vector = new ClockVector(359998.001, "99:59:58", 359998);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0051
     * @tc.name MatrixTime002_0051
     * @tc.desc Verify time input vector 51 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0051', 0, (): void => {
      const vector = new ClockVector(378909.552, "105:15:09", 378909);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0052
     * @tc.name MatrixTime002_0052
     * @tc.desc Verify time input vector 52 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0052', 0, (): void => {
      const vector = new ClockVector(412805.265, "114:40:05", 412805);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0053
     * @tc.name MatrixTime002_0053
     * @tc.desc Verify time input vector 53 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0053', 0, (): void => {
      const vector = new ClockVector(567663.66, "157:41:03", 567663);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0054
     * @tc.name MatrixTime002_0054
     * @tc.desc Verify time input vector 54 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0054', 0, (): void => {
      const vector = new ClockVector(526613.081, "146:16:53", 526613);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0055
     * @tc.name MatrixTime002_0055
     * @tc.desc Verify time input vector 55 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0055', 0, (): void => {
      const vector = new ClockVector(408394.828, "113:26:34", 408394);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0056
     * @tc.name MatrixTime002_0056
     * @tc.desc Verify time input vector 56 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0056', 0, (): void => {
      const vector = new ClockVector(83734.05, "23:15:34", 83734);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0057
     * @tc.name MatrixTime002_0057
     * @tc.desc Verify time input vector 57 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0057', 0, (): void => {
      const vector = new ClockVector(331758.702, "92:09:18", 331758);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0058
     * @tc.name MatrixTime002_0058
     * @tc.desc Verify time input vector 58 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0058', 0, (): void => {
      const vector = new ClockVector(228661.101, "63:31:01", 228661);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0059
     * @tc.name MatrixTime002_0059
     * @tc.desc Verify time input vector 59 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0059', 0, (): void => {
      const vector = new ClockVector(36659.001, "10:10:59", 36659);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0060
     * @tc.name MatrixTime002_0060
     * @tc.desc Verify time input vector 60 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0060', 0, (): void => {
      const vector = new ClockVector(166116.813, "46:08:36", 166116);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0061
     * @tc.name MatrixTime002_0061
     * @tc.desc Verify time input vector 61 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0061', 0, (): void => {
      const vector = new ClockVector(14886.856, "04:08:06", 14886);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0062
     * @tc.name MatrixTime002_0062
     * @tc.desc Verify time input vector 62 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0062', 0, (): void => {
      const vector = new ClockVector(27288.189, "07:34:48", 27288);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0063
     * @tc.name MatrixTime002_0063
     * @tc.desc Verify time input vector 63 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0063', 0, (): void => {
      const vector = new ClockVector(598631.397, "166:17:11", 598631);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0064
     * @tc.name MatrixTime002_0064
     * @tc.desc Verify time input vector 64 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0064', 0, (): void => {
      const vector = new ClockVector(296290.891, "82:18:10", 296290);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0065
     * @tc.name MatrixTime002_0065
     * @tc.desc Verify time input vector 65 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0065', 0, (): void => {
      const vector = new ClockVector(234513.065, "65:08:33", 234513);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0066
     * @tc.name MatrixTime002_0066
     * @tc.desc Verify time input vector 66 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0066', 0, (): void => {
      const vector = new ClockVector(132936.089, "36:55:36", 132936);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0067
     * @tc.name MatrixTime002_0067
     * @tc.desc Verify time input vector 67 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0067', 0, (): void => {
      const vector = new ClockVector(326316.348, "90:38:36", 326316);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0068
     * @tc.name MatrixTime002_0068
     * @tc.desc Verify time input vector 68 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0068', 0, (): void => {
      const vector = new ClockVector(326807.225, "90:46:47", 326807);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0069
     * @tc.name MatrixTime002_0069
     * @tc.desc Verify time input vector 69 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0069', 0, (): void => {
      const vector = new ClockVector(524489.314, "145:41:29", 524489);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0070
     * @tc.name MatrixTime002_0070
     * @tc.desc Verify time input vector 70 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0070', 0, (): void => {
      const vector = new ClockVector(239469.503, "66:31:09", 239469);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0071
     * @tc.name MatrixTime002_0071
     * @tc.desc Verify time input vector 71 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0071', 0, (): void => {
      const vector = new ClockVector(26641.654, "07:24:01", 26641);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0072
     * @tc.name MatrixTime002_0072
     * @tc.desc Verify time input vector 72 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0072', 0, (): void => {
      const vector = new ClockVector(85112.618, "23:38:32", 85112);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0073
     * @tc.name MatrixTime002_0073
     * @tc.desc Verify time input vector 73 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0073', 0, (): void => {
      const vector = new ClockVector(186807.937, "51:53:27", 186807);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0074
     * @tc.name MatrixTime002_0074
     * @tc.desc Verify time input vector 74 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0074', 0, (): void => {
      const vector = new ClockVector(380050.962, "105:34:10", 380050);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0075
     * @tc.name MatrixTime002_0075
     * @tc.desc Verify time input vector 75 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0075', 0, (): void => {
      const vector = new ClockVector(414913.951, "115:15:13", 414913);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0076
     * @tc.name MatrixTime002_0076
     * @tc.desc Verify time input vector 76 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0076', 0, (): void => {
      const vector = new ClockVector(565860.088, "157:11:00", 565860);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0077
     * @tc.name MatrixTime002_0077
     * @tc.desc Verify time input vector 77 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0077', 0, (): void => {
      const vector = new ClockVector(254005.371, "70:33:25", 254005);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0078
     * @tc.name MatrixTime002_0078
     * @tc.desc Verify time input vector 78 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0078', 0, (): void => {
      const vector = new ClockVector(130073.185, "36:07:53", 130073);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0079
     * @tc.name MatrixTime002_0079
     * @tc.desc Verify time input vector 79 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0079', 0, (): void => {
      const vector = new ClockVector(255744.088, "71:02:24", 255744);
      verifyClock(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXTIME002_0080
     * @tc.name MatrixTime002_0080
     * @tc.desc Verify time input vector 80 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixTime002_0080', 0, (): void => {
      const vector = new ClockVector(204947.68, "56:55:47", 204947);
      verifyClock(vector);
    });

  });
}
