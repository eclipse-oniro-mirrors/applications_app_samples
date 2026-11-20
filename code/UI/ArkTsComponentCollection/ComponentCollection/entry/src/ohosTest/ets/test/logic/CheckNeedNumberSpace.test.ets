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
import { checkNeedNumberSpace } from '../model/ComponentSampleLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentCollection]';
const BUNDLE: string = 'ComponentCollection_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for checkNeedNumberSpace (49 cases). */
export default function checkNeedNumberSpaceTest(): void {
  describe('CheckNeedNumberSpaceTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0001
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0001
     * @tc.desc      checkNeedNumberSpace(numText="[??+;,#??*]") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_CheckNeedNumberSpace_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0001 begin`);
      const actual: boolean = checkNeedNumberSpace('[\\+;,#\\*]');
      logInfo(`checkNeedNumberSpace(numText="[??+;,#??*]"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0001 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0002
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0002
     * @tc.desc      checkNeedNumberSpace(numText="g") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_CheckNeedNumberSpace_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0002 begin`);
      const actual: boolean = checkNeedNumberSpace('g');
      logInfo(`checkNeedNumberSpace(numText="g"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0002 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0003
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0003
     * @tc.desc      checkNeedNumberSpace(numText="^??+.*") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CheckNeedNumberSpace_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0003 begin`);
      const actual: boolean = checkNeedNumberSpace('^\\+.*');
      logInfo(`checkNeedNumberSpace(numText="^??+.*"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0003 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0004
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0004
     * @tc.desc      checkNeedNumberSpace(numText="[??+;,#??*") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_CheckNeedNumberSpace_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0004 begin`);
      const actual: boolean = checkNeedNumberSpace('[\\+;,#\\*');
      logInfo(`checkNeedNumberSpace(numText="[??+;,#??*"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0004 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0005
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0005
     * @tc.desc      checkNeedNumberSpace(numText="[??+;,#??*]x") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_CheckNeedNumberSpace_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0005 begin`);
      const actual: boolean = checkNeedNumberSpace('[\\+;,#\\*]x');
      logInfo(`checkNeedNumberSpace(numText="[??+;,#??*]x"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0005 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0006
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0006
     * @tc.desc      checkNeedNumberSpace(numText="gx") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_CheckNeedNumberSpace_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0006 begin`);
      const actual: boolean = checkNeedNumberSpace('gx');
      logInfo(`checkNeedNumberSpace(numText="gx"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0006 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0007
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0007
     * @tc.desc      checkNeedNumberSpace(numText="^??+.") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_CheckNeedNumberSpace_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0007 begin`);
      const actual: boolean = checkNeedNumberSpace('^\\+.');
      logInfo(`checkNeedNumberSpace(numText="^??+."): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0007 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0008
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0008
     * @tc.desc      checkNeedNumberSpace(numText="^??+.*x") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_CheckNeedNumberSpace_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0008 begin`);
      const actual: boolean = checkNeedNumberSpace('^\\+.*x');
      logInfo(`checkNeedNumberSpace(numText="^??+.*x"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0008 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0009
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0009
     * @tc.desc      checkNeedNumberSpace(numText="Hello") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CheckNeedNumberSpace_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0009 begin`);
      const actual: boolean = checkNeedNumberSpace('Hello');
      logInfo(`checkNeedNumberSpace(numText="Hello"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0009 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0010
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0010
     * @tc.desc      checkNeedNumberSpace(numText="hello world") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CheckNeedNumberSpace_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0010 begin`);
      const actual: boolean = checkNeedNumberSpace('hello world');
      logInfo(`checkNeedNumberSpace(numText="hello world"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0010 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0011
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0011
     * @tc.desc      checkNeedNumberSpace(numText="") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_CheckNeedNumberSpace_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0011 begin`);
      const actual: boolean = checkNeedNumberSpace('');
      logInfo(`checkNeedNumberSpace(numText=""): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0011 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0012
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0012
     * @tc.desc      checkNeedNumberSpace(numText=" ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CheckNeedNumberSpace_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0012 begin`);
      const actual: boolean = checkNeedNumberSpace(' ');
      logInfo(`checkNeedNumberSpace(numText=" "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0012 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0013
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0013
     * @tc.desc      checkNeedNumberSpace(numText="A") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CheckNeedNumberSpace_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0013 begin`);
      const actual: boolean = checkNeedNumberSpace('A');
      logInfo(`checkNeedNumberSpace(numText="A"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0013 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0014
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0014
     * @tc.desc      checkNeedNumberSpace(numText="Sample Title 123") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CheckNeedNumberSpace_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0014 begin`);
      const actual: boolean = checkNeedNumberSpace('Sample Title 123');
      logInfo(`checkNeedNumberSpace(numText="Sample Titl...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0014 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0015
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0015
     * @tc.desc      checkNeedNumberSpace(numText="??") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CheckNeedNumberSpace_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0015 begin`);
      const actual: boolean = checkNeedNumberSpace('\u4e2d\u6587');
      logInfo(`checkNeedNumberSpace(numText="??"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0015 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0016
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0016
     * @tc.desc      checkNeedNumberSpace(numText="a") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CheckNeedNumberSpace_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0016 begin`);
      const actual: boolean = checkNeedNumberSpace('a');
      logInfo(`checkNeedNumberSpace(numText="a"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0016 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0017
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0017
     * @tc.desc      checkNeedNumberSpace(numText="abc") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CheckNeedNumberSpace_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0017 begin`);
      const actual: boolean = checkNeedNumberSpace('abc');
      logInfo(`checkNeedNumberSpace(numText="abc"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0017 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0018
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0018
     * @tc.desc      checkNeedNumberSpace(numText="Hello World") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CheckNeedNumberSpace_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0018 begin`);
      const actual: boolean = checkNeedNumberSpace('Hello World');
      logInfo(`checkNeedNumberSpace(numText="Hello World"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0018 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0019
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0019
     * @tc.desc      checkNeedNumberSpace(numText="123") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CheckNeedNumberSpace_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0019 begin`);
      const actual: boolean = checkNeedNumberSpace('123');
      logInfo(`checkNeedNumberSpace(numText="123"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0019 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0020
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0020
     * @tc.desc      checkNeedNumberSpace(numText=" [??+;,#??*] ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_CheckNeedNumberSpace_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0020 begin`);
      const actual: boolean = checkNeedNumberSpace(' [\\+;,#\\*] ');
      logInfo(`checkNeedNumberSpace(numText=" [??+;,#??*...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0020 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0021
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0021
     * @tc.desc      checkNeedNumberSpace(numText="[??+;,#??*][??+;,#??*]") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CheckNeedNumberSpace_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0021 begin`);
      const actual: boolean = checkNeedNumberSpace('[\\+;,#\\*][\\+;,#\\*]');
      logInfo(`checkNeedNumberSpace(numText="[??+;,#??*]...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0021 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0022
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0022
     * @tc.desc      checkNeedNumberSpace(numText="[??+;,#??*]_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CheckNeedNumberSpace_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0022 begin`);
      const actual: boolean = checkNeedNumberSpace('[\\+;,#\\*]_1');
      logInfo(`checkNeedNumberSpace(numText="[??+;,#??*]...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0022 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0023
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0023
     * @tc.desc      checkNeedNumberSpace(numText="x[??+;,#??*]") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_CheckNeedNumberSpace_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0023 begin`);
      const actual: boolean = checkNeedNumberSpace('x[\\+;,#\\*]');
      logInfo(`checkNeedNumberSpace(numText="x[??+;,#??*]"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0023 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0024
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0024
     * @tc.desc      checkNeedNumberSpace(numText=" g ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_CheckNeedNumberSpace_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0024 begin`);
      const actual: boolean = checkNeedNumberSpace(' g ');
      logInfo(`checkNeedNumberSpace(numText=" g "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0024 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0025
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0025
     * @tc.desc      checkNeedNumberSpace(numText="gg") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CheckNeedNumberSpace_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0025 begin`);
      const actual: boolean = checkNeedNumberSpace('gg');
      logInfo(`checkNeedNumberSpace(numText="gg"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0025 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0026
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0026
     * @tc.desc      checkNeedNumberSpace(numText="g_1") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CheckNeedNumberSpace_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0026 begin`);
      const actual: boolean = checkNeedNumberSpace('g_1');
      logInfo(`checkNeedNumberSpace(numText="g_1"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0026 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0027
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0027
     * @tc.desc      checkNeedNumberSpace(numText="xg") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_CheckNeedNumberSpace_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0027 begin`);
      const actual: boolean = checkNeedNumberSpace('xg');
      logInfo(`checkNeedNumberSpace(numText="xg"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0027 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0028
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0028
     * @tc.desc      checkNeedNumberSpace(numText=" ^??+.* ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_CheckNeedNumberSpace_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0028 begin`);
      const actual: boolean = checkNeedNumberSpace(' ^\\+.* ');
      logInfo(`checkNeedNumberSpace(numText=" ^??+.* "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0028 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0029
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0029
     * @tc.desc      checkNeedNumberSpace(numText="^??+.*^??+.*") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CheckNeedNumberSpace_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0029 begin`);
      const actual: boolean = checkNeedNumberSpace('^\\+.*^\\+.*');
      logInfo(`checkNeedNumberSpace(numText="^??+.*^??+.*"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0029 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0030
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0030
     * @tc.desc      checkNeedNumberSpace(numText="^??+.*_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CheckNeedNumberSpace_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0030 begin`);
      const actual: boolean = checkNeedNumberSpace('^\\+.*_1');
      logInfo(`checkNeedNumberSpace(numText="^??+.*_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0030 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0031
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0031
     * @tc.desc      checkNeedNumberSpace(numText="x^??+.*") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_CheckNeedNumberSpace_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0031 begin`);
      const actual: boolean = checkNeedNumberSpace('x^\\+.*');
      logInfo(`checkNeedNumberSpace(numText="x^??+.*"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0031 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0032
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0032
     * @tc.desc      checkNeedNumberSpace(numText=" [??+;,#??* ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_CheckNeedNumberSpace_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0032 begin`);
      const actual: boolean = checkNeedNumberSpace(' [\\+;,#\\* ');
      logInfo(`checkNeedNumberSpace(numText=" [??+;,#??* "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0032 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0033
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0033
     * @tc.desc      checkNeedNumberSpace(numText="[??+;,#??*[??+;,#??*") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CheckNeedNumberSpace_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0033 begin`);
      const actual: boolean = checkNeedNumberSpace('[\\+;,#\\*[\\+;,#\\*');
      logInfo(`checkNeedNumberSpace(numText="[??+;,#??*[...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0033 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0034
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0034
     * @tc.desc      checkNeedNumberSpace(numText="[??+;,#??*_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CheckNeedNumberSpace_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0034 begin`);
      const actual: boolean = checkNeedNumberSpace('[\\+;,#\\*_1');
      logInfo(`checkNeedNumberSpace(numText="[??+;,#??*_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0034 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0035
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0035
     * @tc.desc      checkNeedNumberSpace(numText="x[??+;,#??*") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_CheckNeedNumberSpace_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0035 begin`);
      const actual: boolean = checkNeedNumberSpace('x[\\+;,#\\*');
      logInfo(`checkNeedNumberSpace(numText="x[??+;,#??*"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0035 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0036
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0036
     * @tc.desc      checkNeedNumberSpace(numText=" [??+;,#??*]x ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_CheckNeedNumberSpace_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0036 begin`);
      const actual: boolean = checkNeedNumberSpace(' [\\+;,#\\*]x ');
      logInfo(`checkNeedNumberSpace(numText=" [??+;,#??*...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0036 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0037
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0037
     * @tc.desc      checkNeedNumberSpace(numText="[??+;,#??*]x[??+;,#??*]x") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CheckNeedNumberSpace_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0037 begin`);
      const actual: boolean = checkNeedNumberSpace('[\\+;,#\\*]x[\\+;,#\\*]x');
      logInfo(`checkNeedNumberSpace(numText="[??+;,#??*]...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0037 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0038
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0038
     * @tc.desc      checkNeedNumberSpace(numText="[??+;,#??*]x_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CheckNeedNumberSpace_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0038 begin`);
      const actual: boolean = checkNeedNumberSpace('[\\+;,#\\*]x_1');
      logInfo(`checkNeedNumberSpace(numText="[??+;,#??*]...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0038 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0039
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0039
     * @tc.desc      checkNeedNumberSpace(numText="x[??+;,#??*]x") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_CheckNeedNumberSpace_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0039 begin`);
      const actual: boolean = checkNeedNumberSpace('x[\\+;,#\\*]x');
      logInfo(`checkNeedNumberSpace(numText="x[??+;,#??*...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0039 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0040
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0040
     * @tc.desc      checkNeedNumberSpace(numText=" gx ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_CheckNeedNumberSpace_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0040 begin`);
      const actual: boolean = checkNeedNumberSpace(' gx ');
      logInfo(`checkNeedNumberSpace(numText=" gx "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0040 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0041
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0041
     * @tc.desc      checkNeedNumberSpace(numText="gxgx") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CheckNeedNumberSpace_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0041 begin`);
      const actual: boolean = checkNeedNumberSpace('gxgx');
      logInfo(`checkNeedNumberSpace(numText="gxgx"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0041 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0042
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0042
     * @tc.desc      checkNeedNumberSpace(numText="gx_1") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CheckNeedNumberSpace_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0042 begin`);
      const actual: boolean = checkNeedNumberSpace('gx_1');
      logInfo(`checkNeedNumberSpace(numText="gx_1"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0042 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0043
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0043
     * @tc.desc      checkNeedNumberSpace(numText="xgx") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_CheckNeedNumberSpace_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0043 begin`);
      const actual: boolean = checkNeedNumberSpace('xgx');
      logInfo(`checkNeedNumberSpace(numText="xgx"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0043 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0044
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0044
     * @tc.desc      checkNeedNumberSpace(numText=" ^??+. ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_CheckNeedNumberSpace_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0044 begin`);
      const actual: boolean = checkNeedNumberSpace(' ^\\+. ');
      logInfo(`checkNeedNumberSpace(numText=" ^??+. "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0044 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0045
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0045
     * @tc.desc      checkNeedNumberSpace(numText="^??+.^??+.") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CheckNeedNumberSpace_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0045 begin`);
      const actual: boolean = checkNeedNumberSpace('^\\+.^\\+.');
      logInfo(`checkNeedNumberSpace(numText="^??+.^??+."): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0045 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0046
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0046
     * @tc.desc      checkNeedNumberSpace(numText="^??+._1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CheckNeedNumberSpace_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0046 begin`);
      const actual: boolean = checkNeedNumberSpace('^\\+._1');
      logInfo(`checkNeedNumberSpace(numText="^??+._1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0046 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0047
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0047
     * @tc.desc      checkNeedNumberSpace(numText="x^??+.") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_CheckNeedNumberSpace_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0047 begin`);
      const actual: boolean = checkNeedNumberSpace('x^\\+.');
      logInfo(`checkNeedNumberSpace(numText="x^??+."): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0047 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0048
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0048
     * @tc.desc      checkNeedNumberSpace(numText=" ^??+.*x ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_CheckNeedNumberSpace_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0048 begin`);
      const actual: boolean = checkNeedNumberSpace(' ^\\+.*x ');
      logInfo(`checkNeedNumberSpace(numText=" ^??+.*x "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0048 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CHECK_NEED_NUMBER_SPACE_0049
     * @tc.name      ComponentCollection_CheckNeedNumberSpace_0049
     * @tc.desc      checkNeedNumberSpace(numText="^??+.*x^??+.*x") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CheckNeedNumberSpace_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0049 begin`);
      const actual: boolean = checkNeedNumberSpace('^\\+.*x^\\+.*x');
      logInfo(`checkNeedNumberSpace(numText="^??+.*x^??+...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CheckNeedNumberSpace_0049 end`);
    });
  });
}
