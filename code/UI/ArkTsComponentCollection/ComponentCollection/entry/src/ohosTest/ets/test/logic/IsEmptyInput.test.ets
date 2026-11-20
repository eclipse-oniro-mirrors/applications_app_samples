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
import { isEmptyInput } from '../model/ComponentSampleLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentCollection]';
const BUNDLE: string = 'ComponentCollection_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for isEmptyInput (49 cases). */
export default function isEmptyInputTest(): void {
  describe('IsEmptyInputTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0001
     * @tc.name      ComponentCollection_IsEmptyInput_0001
     * @tc.desc      isEmptyInput(str="undefined") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_IsEmptyInput_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0001 begin`);
      const actual: boolean = isEmptyInput('undefined');
      logInfo(`isEmptyInput(str="undefined"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsEmptyInput_0001 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0002
     * @tc.name      ComponentCollection_IsEmptyInput_0002
     * @tc.desc      isEmptyInput(str="[^??s]") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_IsEmptyInput_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0002 begin`);
      const actual: boolean = isEmptyInput('[^\\s]');
      logInfo(`isEmptyInput(str="[^??s]"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0002 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0003
     * @tc.name      ComponentCollection_IsEmptyInput_0003
     * @tc.desc      isEmptyInput(str="UNDEFINED") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_IsEmptyInput_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0003 begin`);
      const actual: boolean = isEmptyInput('UNDEFINED');
      logInfo(`isEmptyInput(str="UNDEFINED"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0003 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0004
     * @tc.name      ComponentCollection_IsEmptyInput_0004
     * @tc.desc      isEmptyInput(str="undefine") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_IsEmptyInput_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0004 begin`);
      const actual: boolean = isEmptyInput('undefine');
      logInfo(`isEmptyInput(str="undefine"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0004 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0005
     * @tc.name      ComponentCollection_IsEmptyInput_0005
     * @tc.desc      isEmptyInput(str="undefinedx") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_IsEmptyInput_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0005 begin`);
      const actual: boolean = isEmptyInput('undefinedx');
      logInfo(`isEmptyInput(str="undefinedx"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0005 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0006
     * @tc.name      ComponentCollection_IsEmptyInput_0006
     * @tc.desc      isEmptyInput(str="[^??S]") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_IsEmptyInput_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0006 begin`);
      const actual: boolean = isEmptyInput('[^\\S]');
      logInfo(`isEmptyInput(str="[^??S]"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0006 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0007
     * @tc.name      ComponentCollection_IsEmptyInput_0007
     * @tc.desc      isEmptyInput(str="[^??s") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_IsEmptyInput_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0007 begin`);
      const actual: boolean = isEmptyInput('[^\\s');
      logInfo(`isEmptyInput(str="[^??s"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0007 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0008
     * @tc.name      ComponentCollection_IsEmptyInput_0008
     * @tc.desc      isEmptyInput(str="[^??s]x") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_IsEmptyInput_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0008 begin`);
      const actual: boolean = isEmptyInput('[^\\s]x');
      logInfo(`isEmptyInput(str="[^??s]x"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0008 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0009
     * @tc.name      ComponentCollection_IsEmptyInput_0009
     * @tc.desc      isEmptyInput(str="Hello") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsEmptyInput_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0009 begin`);
      const actual: boolean = isEmptyInput('Hello');
      logInfo(`isEmptyInput(str="Hello"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0009 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0010
     * @tc.name      ComponentCollection_IsEmptyInput_0010
     * @tc.desc      isEmptyInput(str="hello world") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsEmptyInput_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0010 begin`);
      const actual: boolean = isEmptyInput('hello world');
      logInfo(`isEmptyInput(str="hello world"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0010 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0011
     * @tc.name      ComponentCollection_IsEmptyInput_0011
     * @tc.desc      isEmptyInput(str="") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_IsEmptyInput_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0011 begin`);
      const actual: boolean = isEmptyInput('');
      logInfo(`isEmptyInput(str=""): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsEmptyInput_0011 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0012
     * @tc.name      ComponentCollection_IsEmptyInput_0012
     * @tc.desc      isEmptyInput(str=" ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsEmptyInput_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0012 begin`);
      const actual: boolean = isEmptyInput(' ');
      logInfo(`isEmptyInput(str=" "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsEmptyInput_0012 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0013
     * @tc.name      ComponentCollection_IsEmptyInput_0013
     * @tc.desc      isEmptyInput(str="A") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsEmptyInput_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0013 begin`);
      const actual: boolean = isEmptyInput('A');
      logInfo(`isEmptyInput(str="A"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0013 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0014
     * @tc.name      ComponentCollection_IsEmptyInput_0014
     * @tc.desc      isEmptyInput(str="Sample Title 123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsEmptyInput_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0014 begin`);
      const actual: boolean = isEmptyInput('Sample Title 123');
      logInfo(`isEmptyInput(str="Sample Title 123"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0014 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0015
     * @tc.name      ComponentCollection_IsEmptyInput_0015
     * @tc.desc      isEmptyInput(str="??") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsEmptyInput_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0015 begin`);
      const actual: boolean = isEmptyInput('\u4e2d\u6587');
      logInfo(`isEmptyInput(str="??"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0015 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0016
     * @tc.name      ComponentCollection_IsEmptyInput_0016
     * @tc.desc      isEmptyInput(str="a") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsEmptyInput_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0016 begin`);
      const actual: boolean = isEmptyInput('a');
      logInfo(`isEmptyInput(str="a"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0016 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0017
     * @tc.name      ComponentCollection_IsEmptyInput_0017
     * @tc.desc      isEmptyInput(str="abc") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsEmptyInput_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0017 begin`);
      const actual: boolean = isEmptyInput('abc');
      logInfo(`isEmptyInput(str="abc"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0017 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0018
     * @tc.name      ComponentCollection_IsEmptyInput_0018
     * @tc.desc      isEmptyInput(str="Hello World") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsEmptyInput_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0018 begin`);
      const actual: boolean = isEmptyInput('Hello World');
      logInfo(`isEmptyInput(str="Hello World"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0018 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0019
     * @tc.name      ComponentCollection_IsEmptyInput_0019
     * @tc.desc      isEmptyInput(str="123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsEmptyInput_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0019 begin`);
      const actual: boolean = isEmptyInput('123');
      logInfo(`isEmptyInput(str="123"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0019 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0020
     * @tc.name      ComponentCollection_IsEmptyInput_0020
     * @tc.desc      isEmptyInput(str=" undefined ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_IsEmptyInput_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0020 begin`);
      const actual: boolean = isEmptyInput(' undefined ');
      logInfo(`isEmptyInput(str=" undefined "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0020 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0021
     * @tc.name      ComponentCollection_IsEmptyInput_0021
     * @tc.desc      isEmptyInput(str="undefinedundefined") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsEmptyInput_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0021 begin`);
      const actual: boolean = isEmptyInput('undefinedundefined');
      logInfo(`isEmptyInput(str="undefinedundefined"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0021 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0022
     * @tc.name      ComponentCollection_IsEmptyInput_0022
     * @tc.desc      isEmptyInput(str="undefined_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsEmptyInput_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0022 begin`);
      const actual: boolean = isEmptyInput('undefined_1');
      logInfo(`isEmptyInput(str="undefined_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0022 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0023
     * @tc.name      ComponentCollection_IsEmptyInput_0023
     * @tc.desc      isEmptyInput(str="xundefined") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_IsEmptyInput_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0023 begin`);
      const actual: boolean = isEmptyInput('xundefined');
      logInfo(`isEmptyInput(str="xundefined"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0023 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0024
     * @tc.name      ComponentCollection_IsEmptyInput_0024
     * @tc.desc      isEmptyInput(str=" [^??s] ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_IsEmptyInput_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0024 begin`);
      const actual: boolean = isEmptyInput(' [^\\s] ');
      logInfo(`isEmptyInput(str=" [^??s] "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0024 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0025
     * @tc.name      ComponentCollection_IsEmptyInput_0025
     * @tc.desc      isEmptyInput(str="[^??s][^??s]") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsEmptyInput_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0025 begin`);
      const actual: boolean = isEmptyInput('[^\\s][^\\s]');
      logInfo(`isEmptyInput(str="[^??s][^??s]"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0025 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0026
     * @tc.name      ComponentCollection_IsEmptyInput_0026
     * @tc.desc      isEmptyInput(str="[^??s]_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsEmptyInput_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0026 begin`);
      const actual: boolean = isEmptyInput('[^\\s]_1');
      logInfo(`isEmptyInput(str="[^??s]_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0026 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0027
     * @tc.name      ComponentCollection_IsEmptyInput_0027
     * @tc.desc      isEmptyInput(str="x[^??s]") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_IsEmptyInput_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0027 begin`);
      const actual: boolean = isEmptyInput('x[^\\s]');
      logInfo(`isEmptyInput(str="x[^??s]"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0027 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0028
     * @tc.name      ComponentCollection_IsEmptyInput_0028
     * @tc.desc      isEmptyInput(str=" UNDEFINED ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_IsEmptyInput_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0028 begin`);
      const actual: boolean = isEmptyInput(' UNDEFINED ');
      logInfo(`isEmptyInput(str=" UNDEFINED "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0028 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0029
     * @tc.name      ComponentCollection_IsEmptyInput_0029
     * @tc.desc      isEmptyInput(str="UNDEFINEDUNDEFINED") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsEmptyInput_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0029 begin`);
      const actual: boolean = isEmptyInput('UNDEFINEDUNDEFINED');
      logInfo(`isEmptyInput(str="UNDEFINEDUNDEFINED"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0029 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0030
     * @tc.name      ComponentCollection_IsEmptyInput_0030
     * @tc.desc      isEmptyInput(str="UNDEFINED_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsEmptyInput_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0030 begin`);
      const actual: boolean = isEmptyInput('UNDEFINED_1');
      logInfo(`isEmptyInput(str="UNDEFINED_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0030 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0031
     * @tc.name      ComponentCollection_IsEmptyInput_0031
     * @tc.desc      isEmptyInput(str="xUNDEFINED") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_IsEmptyInput_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0031 begin`);
      const actual: boolean = isEmptyInput('xUNDEFINED');
      logInfo(`isEmptyInput(str="xUNDEFINED"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0031 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0032
     * @tc.name      ComponentCollection_IsEmptyInput_0032
     * @tc.desc      isEmptyInput(str=" undefine ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_IsEmptyInput_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0032 begin`);
      const actual: boolean = isEmptyInput(' undefine ');
      logInfo(`isEmptyInput(str=" undefine "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0032 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0033
     * @tc.name      ComponentCollection_IsEmptyInput_0033
     * @tc.desc      isEmptyInput(str="undefineundefine") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsEmptyInput_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0033 begin`);
      const actual: boolean = isEmptyInput('undefineundefine');
      logInfo(`isEmptyInput(str="undefineundefine"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0033 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0034
     * @tc.name      ComponentCollection_IsEmptyInput_0034
     * @tc.desc      isEmptyInput(str="undefine_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsEmptyInput_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0034 begin`);
      const actual: boolean = isEmptyInput('undefine_1');
      logInfo(`isEmptyInput(str="undefine_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0034 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0035
     * @tc.name      ComponentCollection_IsEmptyInput_0035
     * @tc.desc      isEmptyInput(str="xundefine") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_IsEmptyInput_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0035 begin`);
      const actual: boolean = isEmptyInput('xundefine');
      logInfo(`isEmptyInput(str="xundefine"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0035 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0036
     * @tc.name      ComponentCollection_IsEmptyInput_0036
     * @tc.desc      isEmptyInput(str=" undefinedx ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_IsEmptyInput_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0036 begin`);
      const actual: boolean = isEmptyInput(' undefinedx ');
      logInfo(`isEmptyInput(str=" undefinedx "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0036 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0037
     * @tc.name      ComponentCollection_IsEmptyInput_0037
     * @tc.desc      isEmptyInput(str="undefinedxundefinedx") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsEmptyInput_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0037 begin`);
      const actual: boolean = isEmptyInput('undefinedxundefinedx');
      logInfo(`isEmptyInput(str="undefinedxundefinedx"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0037 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0038
     * @tc.name      ComponentCollection_IsEmptyInput_0038
     * @tc.desc      isEmptyInput(str="undefinedx_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsEmptyInput_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0038 begin`);
      const actual: boolean = isEmptyInput('undefinedx_1');
      logInfo(`isEmptyInput(str="undefinedx_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0038 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0039
     * @tc.name      ComponentCollection_IsEmptyInput_0039
     * @tc.desc      isEmptyInput(str="xundefinedx") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_IsEmptyInput_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0039 begin`);
      const actual: boolean = isEmptyInput('xundefinedx');
      logInfo(`isEmptyInput(str="xundefinedx"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0039 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0040
     * @tc.name      ComponentCollection_IsEmptyInput_0040
     * @tc.desc      isEmptyInput(str=" [^??S] ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_IsEmptyInput_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0040 begin`);
      const actual: boolean = isEmptyInput(' [^\\S] ');
      logInfo(`isEmptyInput(str=" [^??S] "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0040 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0041
     * @tc.name      ComponentCollection_IsEmptyInput_0041
     * @tc.desc      isEmptyInput(str="[^??S][^??S]") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsEmptyInput_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0041 begin`);
      const actual: boolean = isEmptyInput('[^\\S][^\\S]');
      logInfo(`isEmptyInput(str="[^??S][^??S]"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0041 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0042
     * @tc.name      ComponentCollection_IsEmptyInput_0042
     * @tc.desc      isEmptyInput(str="[^??S]_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsEmptyInput_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0042 begin`);
      const actual: boolean = isEmptyInput('[^\\S]_1');
      logInfo(`isEmptyInput(str="[^??S]_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0042 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0043
     * @tc.name      ComponentCollection_IsEmptyInput_0043
     * @tc.desc      isEmptyInput(str="x[^??S]") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_IsEmptyInput_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0043 begin`);
      const actual: boolean = isEmptyInput('x[^\\S]');
      logInfo(`isEmptyInput(str="x[^??S]"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0043 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0044
     * @tc.name      ComponentCollection_IsEmptyInput_0044
     * @tc.desc      isEmptyInput(str=" [^??s ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_IsEmptyInput_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0044 begin`);
      const actual: boolean = isEmptyInput(' [^\\s ');
      logInfo(`isEmptyInput(str=" [^??s "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0044 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0045
     * @tc.name      ComponentCollection_IsEmptyInput_0045
     * @tc.desc      isEmptyInput(str="[^??s[^??s") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsEmptyInput_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0045 begin`);
      const actual: boolean = isEmptyInput('[^\\s[^\\s');
      logInfo(`isEmptyInput(str="[^??s[^??s"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0045 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0046
     * @tc.name      ComponentCollection_IsEmptyInput_0046
     * @tc.desc      isEmptyInput(str="[^??s_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsEmptyInput_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0046 begin`);
      const actual: boolean = isEmptyInput('[^\\s_1');
      logInfo(`isEmptyInput(str="[^??s_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0046 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0047
     * @tc.name      ComponentCollection_IsEmptyInput_0047
     * @tc.desc      isEmptyInput(str="x[^??s") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_IsEmptyInput_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0047 begin`);
      const actual: boolean = isEmptyInput('x[^\\s');
      logInfo(`isEmptyInput(str="x[^??s"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0047 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0048
     * @tc.name      ComponentCollection_IsEmptyInput_0048
     * @tc.desc      isEmptyInput(str=" [^??s]x ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_IsEmptyInput_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0048 begin`);
      const actual: boolean = isEmptyInput(' [^\\s]x ');
      logInfo(`isEmptyInput(str=" [^??s]x "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0048 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_EMPTY_INPUT_0049
     * @tc.name      ComponentCollection_IsEmptyInput_0049
     * @tc.desc      isEmptyInput(str="[^??s]x[^??s]x") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsEmptyInput_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsEmptyInput_0049 begin`);
      const actual: boolean = isEmptyInput('[^\\s]x[^\\s]x');
      logInfo(`isEmptyInput(str="[^??s]x[^??s]x"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsEmptyInput_0049 end`);
    });
  });
}
