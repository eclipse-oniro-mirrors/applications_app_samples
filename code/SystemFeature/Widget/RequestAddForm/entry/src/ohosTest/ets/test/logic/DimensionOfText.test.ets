/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { dimensionOfText } from '../model/RequestAddFormLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_RequestAddForm]';
const BUNDLE: string = 'RequestAddForm_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for dimensionOfText (96 cases). */
export default function dimensionOfTextTest(): void {
  describe('DimensionOfTextTest', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0001
     * @tc.name      RequestAddForm_DimensionOfText_0001
     * @tc.desc      dimensionOfText(text="1*2") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_DimensionOfText_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0001 begin`);
      const actual: number = dimensionOfText('1*2');
      logInfo(`dimensionOfText(text="1*2"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DimensionOfText_0001 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0002
     * @tc.name      RequestAddForm_DimensionOfText_0002
     * @tc.desc      dimensionOfText(text="2*2") returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_DimensionOfText_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0002 begin`);
      const actual: number = dimensionOfText('2*2');
      logInfo(`dimensionOfText(text="2*2"): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}DimensionOfText_0002 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0003
     * @tc.name      RequestAddForm_DimensionOfText_0003
     * @tc.desc      dimensionOfText(text="2*4") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_DimensionOfText_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0003 begin`);
      const actual: number = dimensionOfText('2*4');
      logInfo(`dimensionOfText(text="2*4"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}DimensionOfText_0003 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0004
     * @tc.name      RequestAddForm_DimensionOfText_0004
     * @tc.desc      dimensionOfText(text="4*4") returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_DimensionOfText_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0004 begin`);
      const actual: number = dimensionOfText('4*4');
      logInfo(`dimensionOfText(text="4*4"): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}DimensionOfText_0004 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0005
     * @tc.name      RequestAddForm_DimensionOfText_0005
     * @tc.desc      dimensionOfText(text="1*") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionOfText_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0005 begin`);
      const actual: number = dimensionOfText('1*');
      logInfo(`dimensionOfText(text="1*"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0005 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0006
     * @tc.name      RequestAddForm_DimensionOfText_0006
     * @tc.desc      dimensionOfText(text="1*2x") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionOfText_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0006 begin`);
      const actual: number = dimensionOfText('1*2x');
      logInfo(`dimensionOfText(text="1*2x"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0006 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0007
     * @tc.name      RequestAddForm_DimensionOfText_0007
     * @tc.desc      dimensionOfText(text="2*") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionOfText_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0007 begin`);
      const actual: number = dimensionOfText('2*');
      logInfo(`dimensionOfText(text="2*"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0007 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0008
     * @tc.name      RequestAddForm_DimensionOfText_0008
     * @tc.desc      dimensionOfText(text="2*2x") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionOfText_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0008 begin`);
      const actual: number = dimensionOfText('2*2x');
      logInfo(`dimensionOfText(text="2*2x"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0008 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0009
     * @tc.name      RequestAddForm_DimensionOfText_0009
     * @tc.desc      dimensionOfText(text="2*4x") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionOfText_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0009 begin`);
      const actual: number = dimensionOfText('2*4x');
      logInfo(`dimensionOfText(text="2*4x"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0009 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0010
     * @tc.name      RequestAddForm_DimensionOfText_0010
     * @tc.desc      dimensionOfText(text="4*") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionOfText_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0010 begin`);
      const actual: number = dimensionOfText('4*');
      logInfo(`dimensionOfText(text="4*"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0010 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0011
     * @tc.name      RequestAddForm_DimensionOfText_0011
     * @tc.desc      dimensionOfText(text="4*4x") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionOfText_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0011 begin`);
      const actual: number = dimensionOfText('4*4x');
      logInfo(`dimensionOfText(text="4*4x"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0011 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0012
     * @tc.name      RequestAddForm_DimensionOfText_0012
     * @tc.desc      dimensionOfText(text="Hello") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0012 begin`);
      const actual: number = dimensionOfText('Hello');
      logInfo(`dimensionOfText(text="Hello"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0012 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0013
     * @tc.name      RequestAddForm_DimensionOfText_0013
     * @tc.desc      dimensionOfText(text="hello world") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0013 begin`);
      const actual: number = dimensionOfText('hello world');
      logInfo(`dimensionOfText(text="hello world"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0013 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0014
     * @tc.name      RequestAddForm_DimensionOfText_0014
     * @tc.desc      dimensionOfText(text="") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionOfText_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0014 begin`);
      const actual: number = dimensionOfText('');
      logInfo(`dimensionOfText(text=""): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0014 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0015
     * @tc.name      RequestAddForm_DimensionOfText_0015
     * @tc.desc      dimensionOfText(text=" ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0015 begin`);
      const actual: number = dimensionOfText(' ');
      logInfo(`dimensionOfText(text=" "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0015 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0016
     * @tc.name      RequestAddForm_DimensionOfText_0016
     * @tc.desc      dimensionOfText(text="A") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0016 begin`);
      const actual: number = dimensionOfText('A');
      logInfo(`dimensionOfText(text="A"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0016 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0017
     * @tc.name      RequestAddForm_DimensionOfText_0017
     * @tc.desc      dimensionOfText(text="Sample Title 123") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0017 begin`);
      const actual: number = dimensionOfText('Sample Title 123');
      logInfo(`dimensionOfText(text="Sample Title 123"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0017 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0018
     * @tc.name      RequestAddForm_DimensionOfText_0018
     * @tc.desc      dimensionOfText(text="??") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0018 begin`);
      const actual: number = dimensionOfText('\u4e2d\u6587');
      logInfo(`dimensionOfText(text="??"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0018 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0019
     * @tc.name      RequestAddForm_DimensionOfText_0019
     * @tc.desc      dimensionOfText(text="a") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0019 begin`);
      const actual: number = dimensionOfText('a');
      logInfo(`dimensionOfText(text="a"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0019 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0020
     * @tc.name      RequestAddForm_DimensionOfText_0020
     * @tc.desc      dimensionOfText(text="abc") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0020 begin`);
      const actual: number = dimensionOfText('abc');
      logInfo(`dimensionOfText(text="abc"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0020 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0021
     * @tc.name      RequestAddForm_DimensionOfText_0021
     * @tc.desc      dimensionOfText(text="Hello World") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0021 begin`);
      const actual: number = dimensionOfText('Hello World');
      logInfo(`dimensionOfText(text="Hello World"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0021 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0022
     * @tc.name      RequestAddForm_DimensionOfText_0022
     * @tc.desc      dimensionOfText(text="123") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0022 begin`);
      const actual: number = dimensionOfText('123');
      logInfo(`dimensionOfText(text="123"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0022 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0023
     * @tc.name      RequestAddForm_DimensionOfText_0023
     * @tc.desc      dimensionOfText(text=" 1*2 ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionOfText_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0023 begin`);
      const actual: number = dimensionOfText(' 1*2 ');
      logInfo(`dimensionOfText(text=" 1*2 "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0023 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0024
     * @tc.name      RequestAddForm_DimensionOfText_0024
     * @tc.desc      dimensionOfText(text="1*21*2") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0024 begin`);
      const actual: number = dimensionOfText('1*21*2');
      logInfo(`dimensionOfText(text="1*21*2"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0024 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0025
     * @tc.name      RequestAddForm_DimensionOfText_0025
     * @tc.desc      dimensionOfText(text="1*2_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0025 begin`);
      const actual: number = dimensionOfText('1*2_1');
      logInfo(`dimensionOfText(text="1*2_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0025 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0026
     * @tc.name      RequestAddForm_DimensionOfText_0026
     * @tc.desc      dimensionOfText(text="x1*2") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionOfText_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0026 begin`);
      const actual: number = dimensionOfText('x1*2');
      logInfo(`dimensionOfText(text="x1*2"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0026 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0027
     * @tc.name      RequestAddForm_DimensionOfText_0027
     * @tc.desc      dimensionOfText(text=" 2*2 ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionOfText_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0027 begin`);
      const actual: number = dimensionOfText(' 2*2 ');
      logInfo(`dimensionOfText(text=" 2*2 "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0027 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0028
     * @tc.name      RequestAddForm_DimensionOfText_0028
     * @tc.desc      dimensionOfText(text="2*22*2") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0028 begin`);
      const actual: number = dimensionOfText('2*22*2');
      logInfo(`dimensionOfText(text="2*22*2"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0028 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0029
     * @tc.name      RequestAddForm_DimensionOfText_0029
     * @tc.desc      dimensionOfText(text="2*2_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0029 begin`);
      const actual: number = dimensionOfText('2*2_1');
      logInfo(`dimensionOfText(text="2*2_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0029 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0030
     * @tc.name      RequestAddForm_DimensionOfText_0030
     * @tc.desc      dimensionOfText(text="x2*2") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionOfText_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0030 begin`);
      const actual: number = dimensionOfText('x2*2');
      logInfo(`dimensionOfText(text="x2*2"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0030 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0031
     * @tc.name      RequestAddForm_DimensionOfText_0031
     * @tc.desc      dimensionOfText(text=" 2*4 ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionOfText_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0031 begin`);
      const actual: number = dimensionOfText(' 2*4 ');
      logInfo(`dimensionOfText(text=" 2*4 "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0031 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0032
     * @tc.name      RequestAddForm_DimensionOfText_0032
     * @tc.desc      dimensionOfText(text="2*42*4") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0032 begin`);
      const actual: number = dimensionOfText('2*42*4');
      logInfo(`dimensionOfText(text="2*42*4"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0032 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0033
     * @tc.name      RequestAddForm_DimensionOfText_0033
     * @tc.desc      dimensionOfText(text="2*4_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0033 begin`);
      const actual: number = dimensionOfText('2*4_1');
      logInfo(`dimensionOfText(text="2*4_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0033 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0034
     * @tc.name      RequestAddForm_DimensionOfText_0034
     * @tc.desc      dimensionOfText(text="x2*4") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionOfText_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0034 begin`);
      const actual: number = dimensionOfText('x2*4');
      logInfo(`dimensionOfText(text="x2*4"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0034 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0035
     * @tc.name      RequestAddForm_DimensionOfText_0035
     * @tc.desc      dimensionOfText(text=" 4*4 ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionOfText_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0035 begin`);
      const actual: number = dimensionOfText(' 4*4 ');
      logInfo(`dimensionOfText(text=" 4*4 "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0035 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0036
     * @tc.name      RequestAddForm_DimensionOfText_0036
     * @tc.desc      dimensionOfText(text="4*44*4") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0036 begin`);
      const actual: number = dimensionOfText('4*44*4');
      logInfo(`dimensionOfText(text="4*44*4"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0036 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0037
     * @tc.name      RequestAddForm_DimensionOfText_0037
     * @tc.desc      dimensionOfText(text="4*4_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0037 begin`);
      const actual: number = dimensionOfText('4*4_1');
      logInfo(`dimensionOfText(text="4*4_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0037 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0038
     * @tc.name      RequestAddForm_DimensionOfText_0038
     * @tc.desc      dimensionOfText(text="x4*4") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionOfText_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0038 begin`);
      const actual: number = dimensionOfText('x4*4');
      logInfo(`dimensionOfText(text="x4*4"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0038 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0039
     * @tc.name      RequestAddForm_DimensionOfText_0039
     * @tc.desc      dimensionOfText(text=" 1* ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionOfText_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0039 begin`);
      const actual: number = dimensionOfText(' 1* ');
      logInfo(`dimensionOfText(text=" 1* "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0039 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0040
     * @tc.name      RequestAddForm_DimensionOfText_0040
     * @tc.desc      dimensionOfText(text="1*1*") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0040 begin`);
      const actual: number = dimensionOfText('1*1*');
      logInfo(`dimensionOfText(text="1*1*"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0040 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0041
     * @tc.name      RequestAddForm_DimensionOfText_0041
     * @tc.desc      dimensionOfText(text="1*_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0041 begin`);
      const actual: number = dimensionOfText('1*_1');
      logInfo(`dimensionOfText(text="1*_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0041 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0042
     * @tc.name      RequestAddForm_DimensionOfText_0042
     * @tc.desc      dimensionOfText(text="x1*") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionOfText_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0042 begin`);
      const actual: number = dimensionOfText('x1*');
      logInfo(`dimensionOfText(text="x1*"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0042 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0043
     * @tc.name      RequestAddForm_DimensionOfText_0043
     * @tc.desc      dimensionOfText(text=" 1*2x ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionOfText_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0043 begin`);
      const actual: number = dimensionOfText(' 1*2x ');
      logInfo(`dimensionOfText(text=" 1*2x "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0043 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0044
     * @tc.name      RequestAddForm_DimensionOfText_0044
     * @tc.desc      dimensionOfText(text="1*2x1*2x") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0044 begin`);
      const actual: number = dimensionOfText('1*2x1*2x');
      logInfo(`dimensionOfText(text="1*2x1*2x"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0044 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0045
     * @tc.name      RequestAddForm_DimensionOfText_0045
     * @tc.desc      dimensionOfText(text="1*2x_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0045 begin`);
      const actual: number = dimensionOfText('1*2x_1');
      logInfo(`dimensionOfText(text="1*2x_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0045 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0046
     * @tc.name      RequestAddForm_DimensionOfText_0046
     * @tc.desc      dimensionOfText(text="x1*2x") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionOfText_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0046 begin`);
      const actual: number = dimensionOfText('x1*2x');
      logInfo(`dimensionOfText(text="x1*2x"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0046 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0047
     * @tc.name      RequestAddForm_DimensionOfText_0047
     * @tc.desc      dimensionOfText(text=" 2* ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionOfText_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0047 begin`);
      const actual: number = dimensionOfText(' 2* ');
      logInfo(`dimensionOfText(text=" 2* "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0047 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0048
     * @tc.name      RequestAddForm_DimensionOfText_0048
     * @tc.desc      dimensionOfText(text="2*2*") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0048 begin`);
      const actual: number = dimensionOfText('2*2*');
      logInfo(`dimensionOfText(text="2*2*"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0048 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0049
     * @tc.name      RequestAddForm_DimensionOfText_0049
     * @tc.desc      dimensionOfText(text="2*_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0049 begin`);
      const actual: number = dimensionOfText('2*_1');
      logInfo(`dimensionOfText(text="2*_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0049 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0050
     * @tc.name      RequestAddForm_DimensionOfText_0050
     * @tc.desc      dimensionOfText(text="x2*") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionOfText_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0050 begin`);
      const actual: number = dimensionOfText('x2*');
      logInfo(`dimensionOfText(text="x2*"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0050 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0051
     * @tc.name      RequestAddForm_DimensionOfText_0051
     * @tc.desc      dimensionOfText(text=" 2*2x ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionOfText_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0051 begin`);
      const actual: number = dimensionOfText(' 2*2x ');
      logInfo(`dimensionOfText(text=" 2*2x "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0051 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0052
     * @tc.name      RequestAddForm_DimensionOfText_0052
     * @tc.desc      dimensionOfText(text="2*2x2*2x") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0052 begin`);
      const actual: number = dimensionOfText('2*2x2*2x');
      logInfo(`dimensionOfText(text="2*2x2*2x"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0052 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0053
     * @tc.name      RequestAddForm_DimensionOfText_0053
     * @tc.desc      dimensionOfText(text="2*2x_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0053 begin`);
      const actual: number = dimensionOfText('2*2x_1');
      logInfo(`dimensionOfText(text="2*2x_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0053 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0054
     * @tc.name      RequestAddForm_DimensionOfText_0054
     * @tc.desc      dimensionOfText(text="x2*2x") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionOfText_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0054 begin`);
      const actual: number = dimensionOfText('x2*2x');
      logInfo(`dimensionOfText(text="x2*2x"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0054 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0055
     * @tc.name      RequestAddForm_DimensionOfText_0055
     * @tc.desc      dimensionOfText(text=" 2*4x ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionOfText_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0055 begin`);
      const actual: number = dimensionOfText(' 2*4x ');
      logInfo(`dimensionOfText(text=" 2*4x "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0055 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0056
     * @tc.name      RequestAddForm_DimensionOfText_0056
     * @tc.desc      dimensionOfText(text="2*4x2*4x") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0056 begin`);
      const actual: number = dimensionOfText('2*4x2*4x');
      logInfo(`dimensionOfText(text="2*4x2*4x"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0056 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0057
     * @tc.name      RequestAddForm_DimensionOfText_0057
     * @tc.desc      dimensionOfText(text="2*4x_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0057 begin`);
      const actual: number = dimensionOfText('2*4x_1');
      logInfo(`dimensionOfText(text="2*4x_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0057 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0058
     * @tc.name      RequestAddForm_DimensionOfText_0058
     * @tc.desc      dimensionOfText(text="x2*4x") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionOfText_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0058 begin`);
      const actual: number = dimensionOfText('x2*4x');
      logInfo(`dimensionOfText(text="x2*4x"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0058 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0059
     * @tc.name      RequestAddForm_DimensionOfText_0059
     * @tc.desc      dimensionOfText(text=" 4* ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionOfText_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0059 begin`);
      const actual: number = dimensionOfText(' 4* ');
      logInfo(`dimensionOfText(text=" 4* "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0059 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0060
     * @tc.name      RequestAddForm_DimensionOfText_0060
     * @tc.desc      dimensionOfText(text="4*4*") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0060 begin`);
      const actual: number = dimensionOfText('4*4*');
      logInfo(`dimensionOfText(text="4*4*"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0060 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0061
     * @tc.name      RequestAddForm_DimensionOfText_0061
     * @tc.desc      dimensionOfText(text="4*_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0061 begin`);
      const actual: number = dimensionOfText('4*_1');
      logInfo(`dimensionOfText(text="4*_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0061 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0062
     * @tc.name      RequestAddForm_DimensionOfText_0062
     * @tc.desc      dimensionOfText(text="x4*") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionOfText_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0062 begin`);
      const actual: number = dimensionOfText('x4*');
      logInfo(`dimensionOfText(text="x4*"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0062 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0063
     * @tc.name      RequestAddForm_DimensionOfText_0063
     * @tc.desc      dimensionOfText(text=" 4*4x ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionOfText_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0063 begin`);
      const actual: number = dimensionOfText(' 4*4x ');
      logInfo(`dimensionOfText(text=" 4*4x "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0063 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0064
     * @tc.name      RequestAddForm_DimensionOfText_0064
     * @tc.desc      dimensionOfText(text="4*4x4*4x") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0064 begin`);
      const actual: number = dimensionOfText('4*4x4*4x');
      logInfo(`dimensionOfText(text="4*4x4*4x"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0064 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0065
     * @tc.name      RequestAddForm_DimensionOfText_0065
     * @tc.desc      dimensionOfText(text="4*4x_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0065 begin`);
      const actual: number = dimensionOfText('4*4x_1');
      logInfo(`dimensionOfText(text="4*4x_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0065 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0066
     * @tc.name      RequestAddForm_DimensionOfText_0066
     * @tc.desc      dimensionOfText(text="x4*4x") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionOfText_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0066 begin`);
      const actual: number = dimensionOfText('x4*4x');
      logInfo(`dimensionOfText(text="x4*4x"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0066 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0067
     * @tc.name      RequestAddForm_DimensionOfText_0067
     * @tc.desc      dimensionOfText(text=" Hello ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionOfText_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0067 begin`);
      const actual: number = dimensionOfText(' Hello ');
      logInfo(`dimensionOfText(text=" Hello "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0067 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0068
     * @tc.name      RequestAddForm_DimensionOfText_0068
     * @tc.desc      dimensionOfText(text="HelloHello") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0068 begin`);
      const actual: number = dimensionOfText('HelloHello');
      logInfo(`dimensionOfText(text="HelloHello"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0068 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0069
     * @tc.name      RequestAddForm_DimensionOfText_0069
     * @tc.desc      dimensionOfText(text="Hello_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0069 begin`);
      const actual: number = dimensionOfText('Hello_1');
      logInfo(`dimensionOfText(text="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0069 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0070
     * @tc.name      RequestAddForm_DimensionOfText_0070
     * @tc.desc      dimensionOfText(text="xHello") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionOfText_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0070 begin`);
      const actual: number = dimensionOfText('xHello');
      logInfo(`dimensionOfText(text="xHello"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0070 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0071
     * @tc.name      RequestAddForm_DimensionOfText_0071
     * @tc.desc      dimensionOfText(text="IS9Z") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0071 begin`);
      const actual: number = dimensionOfText('IS9Z');
      logInfo(`dimensionOfText(text="IS9Z"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0071 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0072
     * @tc.name      RequestAddForm_DimensionOfText_0072
     * @tc.desc      dimensionOfText(text="1S09CrqKU") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0072 begin`);
      const actual: number = dimensionOfText('1S09CrqKU');
      logInfo(`dimensionOfText(text="1S09CrqKU"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0072 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0073
     * @tc.name      RequestAddForm_DimensionOfText_0073
     * @tc.desc      dimensionOfText(text="q1Hm") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0073 begin`);
      const actual: number = dimensionOfText('q1Hm');
      logInfo(`dimensionOfText(text="q1Hm"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0073 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0074
     * @tc.name      RequestAddForm_DimensionOfText_0074
     * @tc.desc      dimensionOfText(text="ATr6") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0074 begin`);
      const actual: number = dimensionOfText('ATr6');
      logInfo(`dimensionOfText(text="ATr6"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0074 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0075
     * @tc.name      RequestAddForm_DimensionOfText_0075
     * @tc.desc      dimensionOfText(text="RGvbAJwS") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0075 begin`);
      const actual: number = dimensionOfText('RGvbAJwS');
      logInfo(`dimensionOfText(text="RGvbAJwS"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0075 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0076
     * @tc.name      RequestAddForm_DimensionOfText_0076
     * @tc.desc      dimensionOfText(text="IaKXdfr0u4") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0076 begin`);
      const actual: number = dimensionOfText('IaKXdfr0u4');
      logInfo(`dimensionOfText(text="IaKXdfr0u4"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0076 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0077
     * @tc.name      RequestAddForm_DimensionOfText_0077
     * @tc.desc      dimensionOfText(text="x") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0077 begin`);
      const actual: number = dimensionOfText('x');
      logInfo(`dimensionOfText(text="x"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0077 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0078
     * @tc.name      RequestAddForm_DimensionOfText_0078
     * @tc.desc      dimensionOfText(text="BKthf") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0078 begin`);
      const actual: number = dimensionOfText('BKthf');
      logInfo(`dimensionOfText(text="BKthf"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0078 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0079
     * @tc.name      RequestAddForm_DimensionOfText_0079
     * @tc.desc      dimensionOfText(text="aVaRCaDyUfc") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0079 begin`);
      const actual: number = dimensionOfText('aVaRCaDyUfc');
      logInfo(`dimensionOfText(text="aVaRCaDyUfc"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0079 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0080
     * @tc.name      RequestAddForm_DimensionOfText_0080
     * @tc.desc      dimensionOfText(text="qP6u") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0080 begin`);
      const actual: number = dimensionOfText('qP6u');
      logInfo(`dimensionOfText(text="qP6u"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0080 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0081
     * @tc.name      RequestAddForm_DimensionOfText_0081
     * @tc.desc      dimensionOfText(text="bBmqZ5hrr39Z") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0081 begin`);
      const actual: number = dimensionOfText('bBmqZ5hrr39Z');
      logInfo(`dimensionOfText(text="bBmqZ5hrr39Z"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0081 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0082
     * @tc.name      RequestAddForm_DimensionOfText_0082
     * @tc.desc      dimensionOfText(text="DOVZCF6vt1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0082 begin`);
      const actual: number = dimensionOfText('DOVZCF6vt1');
      logInfo(`dimensionOfText(text="DOVZCF6vt1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0082 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0083
     * @tc.name      RequestAddForm_DimensionOfText_0083
     * @tc.desc      dimensionOfText(text="gAcmvyS5X4Wf") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0083 begin`);
      const actual: number = dimensionOfText('gAcmvyS5X4Wf');
      logInfo(`dimensionOfText(text="gAcmvyS5X4Wf"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0083 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0084
     * @tc.name      RequestAddForm_DimensionOfText_0084
     * @tc.desc      dimensionOfText(text="owZG1YJhT7") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0084 begin`);
      const actual: number = dimensionOfText('owZG1YJhT7');
      logInfo(`dimensionOfText(text="owZG1YJhT7"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0084 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0085
     * @tc.name      RequestAddForm_DimensionOfText_0085
     * @tc.desc      dimensionOfText(text="UY1nBpR") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0085 begin`);
      const actual: number = dimensionOfText('UY1nBpR');
      logInfo(`dimensionOfText(text="UY1nBpR"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0085 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0086
     * @tc.name      RequestAddForm_DimensionOfText_0086
     * @tc.desc      dimensionOfText(text="O") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0086 begin`);
      const actual: number = dimensionOfText('O');
      logInfo(`dimensionOfText(text="O"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0086 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0087
     * @tc.name      RequestAddForm_DimensionOfText_0087
     * @tc.desc      dimensionOfText(text="p") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0087 begin`);
      const actual: number = dimensionOfText('p');
      logInfo(`dimensionOfText(text="p"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0087 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0088
     * @tc.name      RequestAddForm_DimensionOfText_0088
     * @tc.desc      dimensionOfText(text="A4") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0088 begin`);
      const actual: number = dimensionOfText('A4');
      logInfo(`dimensionOfText(text="A4"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0088 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0089
     * @tc.name      RequestAddForm_DimensionOfText_0089
     * @tc.desc      dimensionOfText(text="LHQM1OA") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0089 begin`);
      const actual: number = dimensionOfText('LHQM1OA');
      logInfo(`dimensionOfText(text="LHQM1OA"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0089 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0090
     * @tc.name      RequestAddForm_DimensionOfText_0090
     * @tc.desc      dimensionOfText(text="1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0090 begin`);
      const actual: number = dimensionOfText('1');
      logInfo(`dimensionOfText(text="1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0090 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0091
     * @tc.name      RequestAddForm_DimensionOfText_0091
     * @tc.desc      dimensionOfText(text="hORuMb56I") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0091 begin`);
      const actual: number = dimensionOfText('hORuMb56I');
      logInfo(`dimensionOfText(text="hORuMb56I"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0091 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0092
     * @tc.name      RequestAddForm_DimensionOfText_0092
     * @tc.desc      dimensionOfText(text="tJNGWi") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0092 begin`);
      const actual: number = dimensionOfText('tJNGWi');
      logInfo(`dimensionOfText(text="tJNGWi"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0092 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0093
     * @tc.name      RequestAddForm_DimensionOfText_0093
     * @tc.desc      dimensionOfText(text="O9abH7vk3Oq3") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0093 begin`);
      const actual: number = dimensionOfText('O9abH7vk3Oq3');
      logInfo(`dimensionOfText(text="O9abH7vk3Oq3"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0093 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0094
     * @tc.name      RequestAddForm_DimensionOfText_0094
     * @tc.desc      dimensionOfText(text="rP0a46JdE") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0094 begin`);
      const actual: number = dimensionOfText('rP0a46JdE');
      logInfo(`dimensionOfText(text="rP0a46JdE"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0094 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0095
     * @tc.name      RequestAddForm_DimensionOfText_0095
     * @tc.desc      dimensionOfText(text="Z27nO") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0095 begin`);
      const actual: number = dimensionOfText('Z27nO');
      logInfo(`dimensionOfText(text="Z27nO"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0095 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0096
     * @tc.name      RequestAddForm_DimensionOfText_0096
     * @tc.desc      dimensionOfText(text="Di4fZA") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0096 begin`);
      const actual: number = dimensionOfText('Di4fZA');
      logInfo(`dimensionOfText(text="Di4fZA"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0096 end`);
    });
  });
}
