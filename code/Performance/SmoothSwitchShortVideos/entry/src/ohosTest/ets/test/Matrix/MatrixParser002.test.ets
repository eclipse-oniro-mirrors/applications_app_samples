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

export default function registerMatrixParser002(): void {
  describe('MatrixParser002', (): void => {
    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER002_0001
     * @tc.name MatrixParser002_0001
     * @tc.desc Verify parser input vector 1 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser002_0001', 0, (): void => {
      const vector = new ParserVector("01:59:43", 7183);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER002_0002
     * @tc.name MatrixParser002_0002
     * @tc.desc Verify parser input vector 2 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser002_0002', 0, (): void => {
      const vector = new ParserVector("e100:09:46", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER002_0003
     * @tc.name MatrixParser002_0003
     * @tc.desc Verify parser input vector 3 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser002_0003', 0, (): void => {
      const vector = new ParserVector("10:14", 614);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER002_0004
     * @tc.name MatrixParser002_0004
     * @tc.desc Verify parser input vector 4 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser002_0004', 0, (): void => {
      const vector = new ParserVector(" 10:14", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER002_0005
     * @tc.name MatrixParser002_0005
     * @tc.desc Verify parser input vector 5 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser002_0005', 0, (): void => {
      const vector = new ParserVector("100:01:45", 360105);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER002_0006
     * @tc.name MatrixParser002_0006
     * @tc.desc Verify parser input vector 6 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser002_0006', 0, (): void => {
      const vector = new ParserVector("١100:10:39", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER002_0007
     * @tc.name MatrixParser002_0007
     * @tc.desc Verify parser input vector 7 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser002_0007', 0, (): void => {
      const vector = new ParserVector("24:30:12", 88212);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER002_0008
     * @tc.name MatrixParser002_0008
     * @tc.desc Verify parser input vector 8 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser002_0008', 0, (): void => {
      const vector = new ParserVector("\n999:59:11", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER002_0009
     * @tc.name MatrixParser002_0009
     * @tc.desc Verify parser input vector 9 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser002_0009', 0, (): void => {
      const vector = new ParserVector("23:59:51", 86391);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER002_0010
     * @tc.name MatrixParser002_0010
     * @tc.desc Verify parser input vector 10 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser002_0010', 0, (): void => {
      const vector = new ParserVector("23:00:45 ", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER002_0011
     * @tc.name MatrixParser002_0011
     * @tc.desc Verify parser input vector 11 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser002_0011', 0, (): void => {
      const vector = new ParserVector("01:09:06", 4146);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER002_0012
     * @tc.name MatrixParser002_0012
     * @tc.desc Verify parser input vector 12 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser002_0012', 0, (): void => {
      const vector = new ParserVector("０100:09:31", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER002_0013
     * @tc.name MatrixParser002_0013
     * @tc.desc Verify parser input vector 13 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser002_0013', 0, (): void => {
      const vector = new ParserVector("10:01:33", 36093);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER002_0014
     * @tc.name MatrixParser002_0014
     * @tc.desc Verify parser input vector 14 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser002_0014', 0, (): void => {
      const vector = new ParserVector("10🎬0:01:45", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER002_0015
     * @tc.name MatrixParser002_0015
     * @tc.desc Verify parser input vector 15 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser002_0015', 0, (): void => {
      const vector = new ParserVector("999:09:08", 3596948);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER002_0016
     * @tc.name MatrixParser002_0016
     * @tc.desc Verify parser input vector 16 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser002_0016', 0, (): void => {
      const vector = new ParserVector(" 100:59:13", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER002_0017
     * @tc.name MatrixParser002_0017
     * @tc.desc Verify parser input vector 17 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser002_0017', 0, (): void => {
      const vector = new ParserVector("23:00:57", 82857);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER002_0018
     * @tc.name MatrixParser002_0018
     * @tc.desc Verify parser input vector 18 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser002_0018', 0, (): void => {
      const vector = new ParserVector("\n10:01:05", -1);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER002_0019
     * @tc.name MatrixParser002_0019
     * @tc.desc Verify parser input vector 19 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser002_0019', 0, (): void => {
      const vector = new ParserVector("100:00:28", 360028);
      verifyParser(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXPARSER002_0020
     * @tc.name MatrixParser002_0020
     * @tc.desc Verify parser input vector 20 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixParser002_0020', 0, (): void => {
      const vector = new ParserVector("🎬99:58:37", -1);
      verifyParser(vector);
    });

  });
}
