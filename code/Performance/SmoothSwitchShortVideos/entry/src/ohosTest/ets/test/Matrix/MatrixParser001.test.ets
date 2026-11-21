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
import { ParserVector, verifyParser } from '../Shared/MatrixFixture';

export default function registerMatrixParser001(): void {
  describe('MatrixParser001', (): void => {
    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0001
     * @tc.name MatrixParser001_0001
     * @tc.desc Verify parser input vector 1 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0001', 0, (): void => {
      const vector = new ParserVector("99:58:37", 359917);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0002
     * @tc.name MatrixParser001_0002
     * @tc.desc Verify parser input vector 2 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0002', 0, (): void => {
      const vector = new ParserVector("10 :30:15", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0003
     * @tc.name MatrixParser001_0003
     * @tc.desc Verify parser input vector 3 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0003', 0, (): void => {
      const vector = new ParserVector("10:10:30", 36630);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0004
     * @tc.name MatrixParser001_0004
     * @tc.desc Verify parser input vector 4 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0004', 0, (): void => {
      const vector = new ParserVector("999:10:12 ", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0005
     * @tc.name MatrixParser001_0005
     * @tc.desc Verify parser input vector 5 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0005', 0, (): void => {
      const vector = new ParserVector("09:58:52", 35932);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0006
     * @tc.name MatrixParser001_0006
     * @tc.desc Verify parser input vector 6 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0006', 0, (): void => {
      const vector = new ParserVector("10🎬:14", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0007
     * @tc.name MatrixParser001_0007
     * @tc.desc Verify parser input vector 7 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0007', 0, (): void => {
      const vector = new ParserVector("100:09:31", 360571);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0008
     * @tc.name MatrixParser001_0008
     * @tc.desc Verify parser input vector 8 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0008', 0, (): void => {
      const vector = new ParserVector("01:01:08-", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0009
     * @tc.name MatrixParser001_0009
     * @tc.desc Verify parser input vector 9 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0009', 0, (): void => {
      const vector = new ParserVector("23:09:58", 83398);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0010
     * @tc.name MatrixParser001_0010
     * @tc.desc Verify parser input vector 10 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0010', 0, (): void => {
      const vector = new ParserVector("23０:00:57", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0011
     * @tc.name MatrixParser001_0011
     * @tc.desc Verify parser input vector 11 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0011', 0, (): void => {
      const vector = new ParserVector("09:09:52", 32992);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0012
     * @tc.name MatrixParser001_0012
     * @tc.desc Verify parser input vector 12 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0012', 0, (): void => {
      const vector = new ParserVector("10\t0:59:33", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0013
     * @tc.name MatrixParser001_0013
     * @tc.desc Verify parser input vector 13 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0013', 0, (): void => {
      const vector = new ParserVector("10:30:15", 37815);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0014
     * @tc.name MatrixParser001_0014
     * @tc.desc Verify parser input vector 14 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0014', 0, (): void => {
      const vector = new ParserVector("01:09:19+", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0015
     * @tc.name MatrixParser001_0015
     * @tc.desc Verify parser input vector 15 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0015', 0, (): void => {
      const vector = new ParserVector("10:01:05", 36065);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0016
     * @tc.name MatrixParser001_0016
     * @tc.desc Verify parser input vector 16 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0016', 0, (): void => {
      const vector = new ParserVector("10\n:14", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0017
     * @tc.name MatrixParser001_0017
     * @tc.desc Verify parser input vector 17 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0017', 0, (): void => {
      const vector = new ParserVector("999:59:11", 3599951);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0018
     * @tc.name MatrixParser001_0018
     * @tc.desc Verify parser input vector 18 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0018', 0, (): void => {
      const vector = new ParserVector("23:59:51-", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0019
     * @tc.name MatrixParser001_0019
     * @tc.desc Verify parser input vector 19 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0019', 0, (): void => {
      const vector = new ParserVector("100:10:39", 360639);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0020
     * @tc.name MatrixParser001_0020
     * @tc.desc Verify parser input vector 20 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0020', 0, (): void => {
      const vector = new ParserVector("24:10:41e", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0021
     * @tc.name MatrixParser001_0021
     * @tc.desc Verify parser input vector 21 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0021', 0, (): void => {
      const vector = new ParserVector("999:30:22", 3598222);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0022
     * @tc.name MatrixParser001_0022
     * @tc.desc Verify parser input vector 22 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0022', 0, (): void => {
      const vector = new ParserVector("999:01:53+", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0023
     * @tc.name MatrixParser001_0023
     * @tc.desc Verify parser input vector 23 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0023', 0, (): void => {
      const vector = new ParserVector("999:10:12", 3597012);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0024
     * @tc.name MatrixParser001_0024
     * @tc.desc Verify parser input vector 24 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0024', 0, (): void => {
      const vector = new ParserVector("999:58:07 ", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0025
     * @tc.name MatrixParser001_0025
     * @tc.desc Verify parser input vector 25 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0025', 0, (): void => {
      const vector = new ParserVector("01:01:46", 3706);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0026
     * @tc.name MatrixParser001_0026
     * @tc.desc Verify parser input vector 26 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0026', 0, (): void => {
      const vector = new ParserVector("\t09:00:14", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0027
     * @tc.name MatrixParser001_0027
     * @tc.desc Verify parser input vector 27 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0027', 0, (): void => {
      const vector = new ParserVector("24:59:43", 89983);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0028
     * @tc.name MatrixParser001_0028
     * @tc.desc Verify parser input vector 28 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0028', 0, (): void => {
      const vector = new ParserVector("-100:09:31", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0029
     * @tc.name MatrixParser001_0029
     * @tc.desc Verify parser input vector 29 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0029', 0, (): void => {
      const vector = new ParserVector("24:10:43", 87043);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0030
     * @tc.name MatrixParser001_0030
     * @tc.desc Verify parser input vector 30 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0030', 0, (): void => {
      const vector = new ParserVector("99\t:59:08", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0031
     * @tc.name MatrixParser001_0031
     * @tc.desc Verify parser input vector 31 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0031', 0, (): void => {
      const vector = new ParserVector("999:00:44", 3596444);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0032
     * @tc.name MatrixParser001_0032
     * @tc.desc Verify parser input vector 32 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0032', 0, (): void => {
      const vector = new ParserVector("10０:10:30", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0033
     * @tc.name MatrixParser001_0033
     * @tc.desc Verify parser input vector 33 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0033', 0, (): void => {
      const vector = new ParserVector("100:59:33", 363573);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0034
     * @tc.name MatrixParser001_0034
     * @tc.desc Verify parser input vector 34 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0034', 0, (): void => {
      const vector = new ParserVector("23:09:19e", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0035
     * @tc.name MatrixParser001_0035
     * @tc.desc Verify parser input vector 35 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0035', 0, (): void => {
      const vector = new ParserVector("24:09:48", 86988);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0036
     * @tc.name MatrixParser001_0036
     * @tc.desc Verify parser input vector 36 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0036', 0, (): void => {
      const vector = new ParserVector("+10:14", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0037
     * @tc.name MatrixParser001_0037
     * @tc.desc Verify parser input vector 37 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0037', 0, (): void => {
      const vector = new ParserVector("09:00:14", 32414);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0038
     * @tc.name MatrixParser001_0038
     * @tc.desc Verify parser input vector 38 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0038', 0, (): void => {
      const vector = new ParserVector("x10:14", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0039
     * @tc.name MatrixParser001_0039
     * @tc.desc Verify parser input vector 39 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0039', 0, (): void => {
      const vector = new ParserVector("100:59:13", 363553);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0040
     * @tc.name MatrixParser001_0040
     * @tc.desc Verify parser input vector 40 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0040', 0, (): void => {
      const vector = new ParserVector("23x:00:57", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0041
     * @tc.name MatrixParser001_0041
     * @tc.desc Verify parser input vector 41 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0041', 0, (): void => {
      const vector = new ParserVector("09:58:53", 35933);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0042
     * @tc.name MatrixParser001_0042
     * @tc.desc Verify parser input vector 42 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0042', 0, (): void => {
      const vector = new ParserVector("01x:09:06", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0043
     * @tc.name MatrixParser001_0043
     * @tc.desc Verify parser input vector 43 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0043', 0, (): void => {
      const vector = new ParserVector("24:58:09", 89889);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0044
     * @tc.name MatrixParser001_0044
     * @tc.desc Verify parser input vector 44 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0044', 0, (): void => {
      const vector = new ParserVector("24\u0000:10:41", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0045
     * @tc.name MatrixParser001_0045
     * @tc.desc Verify parser input vector 45 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0045', 0, (): void => {
      const vector = new ParserVector("99:59:08", 359948);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0046
     * @tc.name MatrixParser001_0046
     * @tc.desc Verify parser input vector 46 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0046', 0, (): void => {
      const vector = new ParserVector("+99:58:37", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0047
     * @tc.name MatrixParser001_0047
     * @tc.desc Verify parser input vector 47 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0047', 0, (): void => {
      const vector = new ParserVector("01:09:19", 4159);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0048
     * @tc.name MatrixParser001_0048
     * @tc.desc Verify parser input vector 48 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0048', 0, (): void => {
      const vector = new ParserVector("🎬09:01:52", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0049
     * @tc.name MatrixParser001_0049
     * @tc.desc Verify parser input vector 49 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0049', 0, (): void => {
      const vector = new ParserVector("10:59:44", 39584);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0050
     * @tc.name MatrixParser001_0050
     * @tc.desc Verify parser input vector 50 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0050', 0, (): void => {
      const vector = new ParserVector("\u000000:15", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0051
     * @tc.name MatrixParser001_0051
     * @tc.desc Verify parser input vector 51 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0051', 0, (): void => {
      const vector = new ParserVector("100:09:24", 360564);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0052
     * @tc.name MatrixParser001_0052
     * @tc.desc Verify parser input vector 52 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0052', 0, (): void => {
      const vector = new ParserVector("-999:10:12", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0053
     * @tc.name MatrixParser001_0053
     * @tc.desc Verify parser input vector 53 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0053', 0, (): void => {
      const vector = new ParserVector("01:01:08", 3668);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0054
     * @tc.name MatrixParser001_0054
     * @tc.desc Verify parser input vector 54 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0054', 0, (): void => {
      const vector = new ParserVector("01\n:01:46", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0055
     * @tc.name MatrixParser001_0055
     * @tc.desc Verify parser input vector 55 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0055', 0, (): void => {
      const vector = new ParserVector("23:00:45", 82845);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0056
     * @tc.name MatrixParser001_0056
     * @tc.desc Verify parser input vector 56 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0056', 0, (): void => {
      const vector = new ParserVector("24:58:09\u0000", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0057
     * @tc.name MatrixParser001_0057
     * @tc.desc Verify parser input vector 57 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0057', 0, (): void => {
      const vector = new ParserVector("24:00:20", 86420);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0058
     * @tc.name MatrixParser001_0058
     * @tc.desc Verify parser input vector 58 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0058', 0, (): void => {
      const vector = new ParserVector("09\u0000:58:45", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0059
     * @tc.name MatrixParser001_0059
     * @tc.desc Verify parser input vector 59 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0059', 0, (): void => {
      const vector = new ParserVector("30:42", 1842);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0060
     * @tc.name MatrixParser001_0060
     * @tc.desc Verify parser input vector 60 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0060', 0, (): void => {
      const vector = new ParserVector("\t24:10:41", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0061
     * @tc.name MatrixParser001_0061
     * @tc.desc Verify parser input vector 61 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0061', 0, (): void => {
      const vector = new ParserVector("99:01:33", 356493);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0062
     * @tc.name MatrixParser001_0062
     * @tc.desc Verify parser input vector 62 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0062', 0, (): void => {
      const vector = new ParserVector("100:59:33\r", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0063
     * @tc.name MatrixParser001_0063
     * @tc.desc Verify parser input vector 63 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0063', 0, (): void => {
      const vector = new ParserVector("999:09:59", 3596999);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0064
     * @tc.name MatrixParser001_0064
     * @tc.desc Verify parser input vector 64 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0064', 0, (): void => {
      const vector = new ParserVector("01\n:59:43", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0065
     * @tc.name MatrixParser001_0065
     * @tc.desc Verify parser input vector 65 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0065', 0, (): void => {
      const vector = new ParserVector("99:59:52", 359992);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0066
     * @tc.name MatrixParser001_0066
     * @tc.desc Verify parser input vector 66 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0066', 0, (): void => {
      const vector = new ParserVector("e100:10:39", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0067
     * @tc.name MatrixParser001_0067
     * @tc.desc Verify parser input vector 67 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0067', 0, (): void => {
      const vector = new ParserVector("100:30:47", 361847);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0068
     * @tc.name MatrixParser001_0068
     * @tc.desc Verify parser input vector 68 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0068', 0, (): void => {
      const vector = new ParserVector("-999:59:11", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0069
     * @tc.name MatrixParser001_0069
     * @tc.desc Verify parser input vector 69 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0069', 0, (): void => {
      const vector = new ParserVector("01:00:37", 3637);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0070
     * @tc.name MatrixParser001_0070
     * @tc.desc Verify parser input vector 70 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0070', 0, (): void => {
      const vector = new ParserVector("09:00:06\r", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0071
     * @tc.name MatrixParser001_0071
     * @tc.desc Verify parser input vector 71 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0071', 0, (): void => {
      const vector = new ParserVector("09:01:52", 32512);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0072
     * @tc.name MatrixParser001_0072
     * @tc.desc Verify parser input vector 72 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0072', 0, (): void => {
      const vector = new ParserVector("23:09:19١", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0073
     * @tc.name MatrixParser001_0073
     * @tc.desc Verify parser input vector 73 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0073', 0, (): void => {
      const vector = new ParserVector("24:10:41", 87041);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0074
     * @tc.name MatrixParser001_0074
     * @tc.desc Verify parser input vector 74 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0074', 0, (): void => {
      const vector = new ParserVector("23:00:45０", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0075
     * @tc.name MatrixParser001_0075
     * @tc.desc Verify parser input vector 75 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0075', 0, (): void => {
      const vector = new ParserVector("23:09:19", 83359);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0076
     * @tc.name MatrixParser001_0076
     * @tc.desc Verify parser input vector 76 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0076', 0, (): void => {
      const vector = new ParserVector("99​:01:33", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0077
     * @tc.name MatrixParser001_0077
     * @tc.desc Verify parser input vector 77 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0077', 0, (): void => {
      const vector = new ParserVector("09:00:06", 32406);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0078
     * @tc.name MatrixParser001_0078
     * @tc.desc Verify parser input vector 78 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0078', 0, (): void => {
      const vector = new ParserVector("09:01:58\r", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0079
     * @tc.name MatrixParser001_0079
     * @tc.desc Verify parser input vector 79 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0079', 0, (): void => {
      const vector = new ParserVector("99:09:37", 356977);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0080
     * @tc.name MatrixParser001_0080
     * @tc.desc Verify parser input vector 80 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0080', 0, (): void => {
      const vector = new ParserVector("09\n:01:52", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0081
     * @tc.name MatrixParser001_0081
     * @tc.desc Verify parser input vector 81 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0081', 0, (): void => {
      const vector = new ParserVector("01:59:57", 7197);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0082
     * @tc.name MatrixParser001_0082
     * @tc.desc Verify parser input vector 82 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0082', 0, (): void => {
      const vector = new ParserVector("09🎬:58:52", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0083
     * @tc.name MatrixParser001_0083
     * @tc.desc Verify parser input vector 83 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0083', 0, (): void => {
      const vector = new ParserVector("99:10:54", 357054);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0084
     * @tc.name MatrixParser001_0084
     * @tc.desc Verify parser input vector 84 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0084', 0, (): void => {
      const vector = new ParserVector("100:09:31🎬", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0085
     * @tc.name MatrixParser001_0085
     * @tc.desc Verify parser input vector 85 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0085', 0, (): void => {
      const vector = new ParserVector("999:58:07", 3599887);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0086
     * @tc.name MatrixParser001_0086
     * @tc.desc Verify parser input vector 86 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0086', 0, (): void => {
      const vector = new ParserVector("10-0:09:31", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0087
     * @tc.name MatrixParser001_0087
     * @tc.desc Verify parser input vector 87 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0087', 0, (): void => {
      const vector = new ParserVector("09:58:45", 35925);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0088
     * @tc.name MatrixParser001_0088
     * @tc.desc Verify parser input vector 88 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0088', 0, (): void => {
      const vector = new ParserVector("23.:59:51", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0089
     * @tc.name MatrixParser001_0089
     * @tc.desc Verify parser input vector 89 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0089', 0, (): void => {
      const vector = new ParserVector("01:30", 90);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0090
     * @tc.name MatrixParser001_0090
     * @tc.desc Verify parser input vector 90 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0090', 0, (): void => {
      const vector = new ParserVector("24🎬:30:12", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0091
     * @tc.name MatrixParser001_0091
     * @tc.desc Verify parser input vector 91 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0091', 0, (): void => {
      const vector = new ParserVector("10:10:04", 36604);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0092
     * @tc.name MatrixParser001_0092
     * @tc.desc Verify parser input vector 92 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0092', 0, (): void => {
      const vector = new ParserVector("30:42.", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0093
     * @tc.name MatrixParser001_0093
     * @tc.desc Verify parser input vector 93 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0093', 0, (): void => {
      const vector = new ParserVector("23:30:40", 84640);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0094
     * @tc.name MatrixParser001_0094
     * @tc.desc Verify parser input vector 94 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0094', 0, (): void => {
      const vector = new ParserVector("23e:10:58", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0095
     * @tc.name MatrixParser001_0095
     * @tc.desc Verify parser input vector 95 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0095', 0, (): void => {
      const vector = new ParserVector("09:01:58", 32518);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0096
     * @tc.name MatrixParser001_0096
     * @tc.desc Verify parser input vector 96 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0096', 0, (): void => {
      const vector = new ParserVector("09:58:53\r", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0097
     * @tc.name MatrixParser001_0097
     * @tc.desc Verify parser input vector 97 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0097', 0, (): void => {
      const vector = new ParserVector("24:10:19", 87019);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0098
     * @tc.name MatrixParser001_0098
     * @tc.desc Verify parser input vector 98 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0098', 0, (): void => {
      const vector = new ParserVector("١23:09:50", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0099
     * @tc.name MatrixParser001_0099
     * @tc.desc Verify parser input vector 99 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0099', 0, (): void => {
      const vector = new ParserVector("100:09:46", 360586);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER001_0100
     * @tc.name MatrixParser001_0100
     * @tc.desc Verify parser input vector 100 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser001_0100', 0, (): void => {
      const vector = new ParserVector("99🎬9:09:08", -1);
      verifyParser(vector);
    });

  });
}
