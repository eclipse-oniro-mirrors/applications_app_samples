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
import { removeSpace } from '../model/ComponentSampleLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentCollection]';
const BUNDLE: string = 'ComponentCollection_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for removeSpace (49 cases). */
export default function removeSpaceTest(): void {
  describe('RemoveSpaceTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0001
     * @tc.name      ComponentCollection_RemoveSpace_0001
     * @tc.desc      removeSpace(str="") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_RemoveSpace_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RemoveSpace_0001 begin`);
      const actual: string = removeSpace('');
      logInfo(`removeSpace(str=""): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}RemoveSpace_0001 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0002
     * @tc.name      ComponentCollection_RemoveSpace_0002
     * @tc.desc      removeSpace(str="[??s]") returns "[??s]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_RemoveSpace_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RemoveSpace_0002 begin`);
      const actual: string = removeSpace('[\\s]');
      logInfo(`removeSpace(str="[??s]"): actual=${actual}`);
      expect(actual).assertEqual('[\\s]');
      logInfo(`${BUNDLE}RemoveSpace_0002 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0003
     * @tc.name      ComponentCollection_RemoveSpace_0003
     * @tc.desc      removeSpace(str="g") returns "g"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_RemoveSpace_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemoveSpace_0003 begin`);
      const actual: string = removeSpace('g');
      logInfo(`removeSpace(str="g"): actual=${actual}`);
      expect(actual).assertEqual('g');
      logInfo(`${BUNDLE}RemoveSpace_0003 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0004
     * @tc.name      ComponentCollection_RemoveSpace_0004
     * @tc.desc      removeSpace(str="x") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_RemoveSpace_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemoveSpace_0004 begin`);
      const actual: string = removeSpace('x');
      logInfo(`removeSpace(str="x"): actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}RemoveSpace_0004 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0005
     * @tc.name      ComponentCollection_RemoveSpace_0005
     * @tc.desc      removeSpace(str="[??S]") returns "[??S]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_RemoveSpace_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemoveSpace_0005 begin`);
      const actual: string = removeSpace('[\\S]');
      logInfo(`removeSpace(str="[??S]"): actual=${actual}`);
      expect(actual).assertEqual('[\\S]');
      logInfo(`${BUNDLE}RemoveSpace_0005 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0006
     * @tc.name      ComponentCollection_RemoveSpace_0006
     * @tc.desc      removeSpace(str="[??s") returns "[??s"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_RemoveSpace_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemoveSpace_0006 begin`);
      const actual: string = removeSpace('[\\s');
      logInfo(`removeSpace(str="[??s"): actual=${actual}`);
      expect(actual).assertEqual('[\\s');
      logInfo(`${BUNDLE}RemoveSpace_0006 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0007
     * @tc.name      ComponentCollection_RemoveSpace_0007
     * @tc.desc      removeSpace(str="[??s]x") returns "[??s]x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_RemoveSpace_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemoveSpace_0007 begin`);
      const actual: string = removeSpace('[\\s]x');
      logInfo(`removeSpace(str="[??s]x"): actual=${actual}`);
      expect(actual).assertEqual('[\\s]x');
      logInfo(`${BUNDLE}RemoveSpace_0007 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0008
     * @tc.name      ComponentCollection_RemoveSpace_0008
     * @tc.desc      removeSpace(str="gx") returns "gx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_RemoveSpace_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemoveSpace_0008 begin`);
      const actual: string = removeSpace('gx');
      logInfo(`removeSpace(str="gx"): actual=${actual}`);
      expect(actual).assertEqual('gx');
      logInfo(`${BUNDLE}RemoveSpace_0008 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0009
     * @tc.name      ComponentCollection_RemoveSpace_0009
     * @tc.desc      removeSpace(str="Hello") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RemoveSpace_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemoveSpace_0009 begin`);
      const actual: string = removeSpace('Hello');
      logInfo(`removeSpace(str="Hello"): actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}RemoveSpace_0009 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0010
     * @tc.name      ComponentCollection_RemoveSpace_0010
     * @tc.desc      removeSpace(str="hello world") returns "helloworld"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RemoveSpace_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemoveSpace_0010 begin`);
      const actual: string = removeSpace('hello world');
      logInfo(`removeSpace(str="hello world"): actual=${actual}`);
      expect(actual).assertEqual('helloworld');
      logInfo(`${BUNDLE}RemoveSpace_0010 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0011
     * @tc.name      ComponentCollection_RemoveSpace_0011
     * @tc.desc      removeSpace(str="A") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RemoveSpace_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemoveSpace_0011 begin`);
      const actual: string = removeSpace('A');
      logInfo(`removeSpace(str="A"): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}RemoveSpace_0011 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0012
     * @tc.name      ComponentCollection_RemoveSpace_0012
     * @tc.desc      removeSpace(str="Sample Title 123") returns "SampleTitle123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RemoveSpace_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemoveSpace_0012 begin`);
      const actual: string = removeSpace('Sample Title 123');
      logInfo(`removeSpace(str="Sample Title 123"): actual=${actual}`);
      expect(actual).assertEqual('SampleTitle123');
      logInfo(`${BUNDLE}RemoveSpace_0012 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0013
     * @tc.name      ComponentCollection_RemoveSpace_0013
     * @tc.desc      removeSpace(str="??") returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RemoveSpace_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemoveSpace_0013 begin`);
      const actual: string = removeSpace('\u4e2d\u6587');
      logInfo(`removeSpace(str="??"): actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}RemoveSpace_0013 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0014
     * @tc.name      ComponentCollection_RemoveSpace_0014
     * @tc.desc      removeSpace(str="a") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RemoveSpace_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemoveSpace_0014 begin`);
      const actual: string = removeSpace('a');
      logInfo(`removeSpace(str="a"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}RemoveSpace_0014 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0015
     * @tc.name      ComponentCollection_RemoveSpace_0015
     * @tc.desc      removeSpace(str="abc") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RemoveSpace_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemoveSpace_0015 begin`);
      const actual: string = removeSpace('abc');
      logInfo(`removeSpace(str="abc"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}RemoveSpace_0015 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0016
     * @tc.name      ComponentCollection_RemoveSpace_0016
     * @tc.desc      removeSpace(str="Hello World") returns "HelloWorld"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RemoveSpace_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemoveSpace_0016 begin`);
      const actual: string = removeSpace('Hello World');
      logInfo(`removeSpace(str="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('HelloWorld');
      logInfo(`${BUNDLE}RemoveSpace_0016 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0017
     * @tc.name      ComponentCollection_RemoveSpace_0017
     * @tc.desc      removeSpace(str="123") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RemoveSpace_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemoveSpace_0017 begin`);
      const actual: string = removeSpace('123');
      logInfo(`removeSpace(str="123"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}RemoveSpace_0017 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0018
     * @tc.name      ComponentCollection_RemoveSpace_0018
     * @tc.desc      removeSpace(str="[??s][??s]") returns "[??s][??s]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RemoveSpace_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemoveSpace_0018 begin`);
      const actual: string = removeSpace('[\\s][\\s]');
      logInfo(`removeSpace(str="[??s][??s]"): actual=${actual}`);
      expect(actual).assertEqual('[\\s][\\s]');
      logInfo(`${BUNDLE}RemoveSpace_0018 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0019
     * @tc.name      ComponentCollection_RemoveSpace_0019
     * @tc.desc      removeSpace(str="[??s]_1") returns "[??s]_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RemoveSpace_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemoveSpace_0019 begin`);
      const actual: string = removeSpace('[\\s]_1');
      logInfo(`removeSpace(str="[??s]_1"): actual=${actual}`);
      expect(actual).assertEqual('[\\s]_1');
      logInfo(`${BUNDLE}RemoveSpace_0019 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0020
     * @tc.name      ComponentCollection_RemoveSpace_0020
     * @tc.desc      removeSpace(str="x[??s]") returns "x[??s]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_RemoveSpace_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemoveSpace_0020 begin`);
      const actual: string = removeSpace('x[\\s]');
      logInfo(`removeSpace(str="x[??s]"): actual=${actual}`);
      expect(actual).assertEqual('x[\\s]');
      logInfo(`${BUNDLE}RemoveSpace_0020 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0021
     * @tc.name      ComponentCollection_RemoveSpace_0021
     * @tc.desc      removeSpace(str="gg") returns "gg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RemoveSpace_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemoveSpace_0021 begin`);
      const actual: string = removeSpace('gg');
      logInfo(`removeSpace(str="gg"): actual=${actual}`);
      expect(actual).assertEqual('gg');
      logInfo(`${BUNDLE}RemoveSpace_0021 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0022
     * @tc.name      ComponentCollection_RemoveSpace_0022
     * @tc.desc      removeSpace(str="g_1") returns "g_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RemoveSpace_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemoveSpace_0022 begin`);
      const actual: string = removeSpace('g_1');
      logInfo(`removeSpace(str="g_1"): actual=${actual}`);
      expect(actual).assertEqual('g_1');
      logInfo(`${BUNDLE}RemoveSpace_0022 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0023
     * @tc.name      ComponentCollection_RemoveSpace_0023
     * @tc.desc      removeSpace(str="xg") returns "xg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_RemoveSpace_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemoveSpace_0023 begin`);
      const actual: string = removeSpace('xg');
      logInfo(`removeSpace(str="xg"): actual=${actual}`);
      expect(actual).assertEqual('xg');
      logInfo(`${BUNDLE}RemoveSpace_0023 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0024
     * @tc.name      ComponentCollection_RemoveSpace_0024
     * @tc.desc      removeSpace(str="xx") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RemoveSpace_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemoveSpace_0024 begin`);
      const actual: string = removeSpace('xx');
      logInfo(`removeSpace(str="xx"): actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}RemoveSpace_0024 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0025
     * @tc.name      ComponentCollection_RemoveSpace_0025
     * @tc.desc      removeSpace(str="x_1") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RemoveSpace_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemoveSpace_0025 begin`);
      const actual: string = removeSpace('x_1');
      logInfo(`removeSpace(str="x_1"): actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}RemoveSpace_0025 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0026
     * @tc.name      ComponentCollection_RemoveSpace_0026
     * @tc.desc      removeSpace(str="[??S][??S]") returns "[??S][??S]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RemoveSpace_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemoveSpace_0026 begin`);
      const actual: string = removeSpace('[\\S][\\S]');
      logInfo(`removeSpace(str="[??S][??S]"): actual=${actual}`);
      expect(actual).assertEqual('[\\S][\\S]');
      logInfo(`${BUNDLE}RemoveSpace_0026 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0027
     * @tc.name      ComponentCollection_RemoveSpace_0027
     * @tc.desc      removeSpace(str="[??S]_1") returns "[??S]_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RemoveSpace_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemoveSpace_0027 begin`);
      const actual: string = removeSpace('[\\S]_1');
      logInfo(`removeSpace(str="[??S]_1"): actual=${actual}`);
      expect(actual).assertEqual('[\\S]_1');
      logInfo(`${BUNDLE}RemoveSpace_0027 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0028
     * @tc.name      ComponentCollection_RemoveSpace_0028
     * @tc.desc      removeSpace(str="x[??S]") returns "x[??S]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_RemoveSpace_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemoveSpace_0028 begin`);
      const actual: string = removeSpace('x[\\S]');
      logInfo(`removeSpace(str="x[??S]"): actual=${actual}`);
      expect(actual).assertEqual('x[\\S]');
      logInfo(`${BUNDLE}RemoveSpace_0028 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0029
     * @tc.name      ComponentCollection_RemoveSpace_0029
     * @tc.desc      removeSpace(str="[??s[??s") returns "[??s[??s"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RemoveSpace_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemoveSpace_0029 begin`);
      const actual: string = removeSpace('[\\s[\\s');
      logInfo(`removeSpace(str="[??s[??s"): actual=${actual}`);
      expect(actual).assertEqual('[\\s[\\s');
      logInfo(`${BUNDLE}RemoveSpace_0029 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0030
     * @tc.name      ComponentCollection_RemoveSpace_0030
     * @tc.desc      removeSpace(str="[??s_1") returns "[??s_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RemoveSpace_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemoveSpace_0030 begin`);
      const actual: string = removeSpace('[\\s_1');
      logInfo(`removeSpace(str="[??s_1"): actual=${actual}`);
      expect(actual).assertEqual('[\\s_1');
      logInfo(`${BUNDLE}RemoveSpace_0030 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0031
     * @tc.name      ComponentCollection_RemoveSpace_0031
     * @tc.desc      removeSpace(str="x[??s") returns "x[??s"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_RemoveSpace_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemoveSpace_0031 begin`);
      const actual: string = removeSpace('x[\\s');
      logInfo(`removeSpace(str="x[??s"): actual=${actual}`);
      expect(actual).assertEqual('x[\\s');
      logInfo(`${BUNDLE}RemoveSpace_0031 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0032
     * @tc.name      ComponentCollection_RemoveSpace_0032
     * @tc.desc      removeSpace(str="[??s]x[??s]x") returns "[??s]x[??s]x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RemoveSpace_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemoveSpace_0032 begin`);
      const actual: string = removeSpace('[\\s]x[\\s]x');
      logInfo(`removeSpace(str="[??s]x[??s]x"): actual=${actual}`);
      expect(actual).assertEqual('[\\s]x[\\s]x');
      logInfo(`${BUNDLE}RemoveSpace_0032 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0033
     * @tc.name      ComponentCollection_RemoveSpace_0033
     * @tc.desc      removeSpace(str="[??s]x_1") returns "[??s]x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RemoveSpace_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemoveSpace_0033 begin`);
      const actual: string = removeSpace('[\\s]x_1');
      logInfo(`removeSpace(str="[??s]x_1"): actual=${actual}`);
      expect(actual).assertEqual('[\\s]x_1');
      logInfo(`${BUNDLE}RemoveSpace_0033 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0034
     * @tc.name      ComponentCollection_RemoveSpace_0034
     * @tc.desc      removeSpace(str="x[??s]x") returns "x[??s]x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_RemoveSpace_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemoveSpace_0034 begin`);
      const actual: string = removeSpace('x[\\s]x');
      logInfo(`removeSpace(str="x[??s]x"): actual=${actual}`);
      expect(actual).assertEqual('x[\\s]x');
      logInfo(`${BUNDLE}RemoveSpace_0034 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0035
     * @tc.name      ComponentCollection_RemoveSpace_0035
     * @tc.desc      removeSpace(str="gxgx") returns "gxgx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RemoveSpace_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemoveSpace_0035 begin`);
      const actual: string = removeSpace('gxgx');
      logInfo(`removeSpace(str="gxgx"): actual=${actual}`);
      expect(actual).assertEqual('gxgx');
      logInfo(`${BUNDLE}RemoveSpace_0035 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0036
     * @tc.name      ComponentCollection_RemoveSpace_0036
     * @tc.desc      removeSpace(str="gx_1") returns "gx_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RemoveSpace_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemoveSpace_0036 begin`);
      const actual: string = removeSpace('gx_1');
      logInfo(`removeSpace(str="gx_1"): actual=${actual}`);
      expect(actual).assertEqual('gx_1');
      logInfo(`${BUNDLE}RemoveSpace_0036 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0037
     * @tc.name      ComponentCollection_RemoveSpace_0037
     * @tc.desc      removeSpace(str="xgx") returns "xgx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_RemoveSpace_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemoveSpace_0037 begin`);
      const actual: string = removeSpace('xgx');
      logInfo(`removeSpace(str="xgx"): actual=${actual}`);
      expect(actual).assertEqual('xgx');
      logInfo(`${BUNDLE}RemoveSpace_0037 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0038
     * @tc.name      ComponentCollection_RemoveSpace_0038
     * @tc.desc      removeSpace(str="HelloHello") returns "HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RemoveSpace_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemoveSpace_0038 begin`);
      const actual: string = removeSpace('HelloHello');
      logInfo(`removeSpace(str="HelloHello"): actual=${actual}`);
      expect(actual).assertEqual('HelloHello');
      logInfo(`${BUNDLE}RemoveSpace_0038 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0039
     * @tc.name      ComponentCollection_RemoveSpace_0039
     * @tc.desc      removeSpace(str="Hello_1") returns "Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RemoveSpace_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemoveSpace_0039 begin`);
      const actual: string = removeSpace('Hello_1');
      logInfo(`removeSpace(str="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual('Hello_1');
      logInfo(`${BUNDLE}RemoveSpace_0039 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0040
     * @tc.name      ComponentCollection_RemoveSpace_0040
     * @tc.desc      removeSpace(str="xHello") returns "xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_RemoveSpace_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemoveSpace_0040 begin`);
      const actual: string = removeSpace('xHello');
      logInfo(`removeSpace(str="xHello"): actual=${actual}`);
      expect(actual).assertEqual('xHello');
      logInfo(`${BUNDLE}RemoveSpace_0040 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0041
     * @tc.name      ComponentCollection_RemoveSpace_0041
     * @tc.desc      removeSpace(str="hello worldhello world") returns "helloworldhelloworld"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RemoveSpace_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemoveSpace_0041 begin`);
      const actual: string = removeSpace('hello worldhello world');
      logInfo(`removeSpace(str="hello worldhello world"): actual=${actual}`);
      expect(actual).assertEqual('helloworldhelloworld');
      logInfo(`${BUNDLE}RemoveSpace_0041 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0042
     * @tc.name      ComponentCollection_RemoveSpace_0042
     * @tc.desc      removeSpace(str="hello world_1") returns "helloworld_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RemoveSpace_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemoveSpace_0042 begin`);
      const actual: string = removeSpace('hello world_1');
      logInfo(`removeSpace(str="hello world_1"): actual=${actual}`);
      expect(actual).assertEqual('helloworld_1');
      logInfo(`${BUNDLE}RemoveSpace_0042 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0043
     * @tc.name      ComponentCollection_RemoveSpace_0043
     * @tc.desc      removeSpace(str="xhello world") returns "xhelloworld"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_RemoveSpace_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemoveSpace_0043 begin`);
      const actual: string = removeSpace('xhello world');
      logInfo(`removeSpace(str="xhello world"): actual=${actual}`);
      expect(actual).assertEqual('xhelloworld');
      logInfo(`${BUNDLE}RemoveSpace_0043 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0044
     * @tc.name      ComponentCollection_RemoveSpace_0044
     * @tc.desc      removeSpace(str=" _1") returns "_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RemoveSpace_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemoveSpace_0044 begin`);
      const actual: string = removeSpace(' _1');
      logInfo(`removeSpace(str=" _1"): actual=${actual}`);
      expect(actual).assertEqual('_1');
      logInfo(`${BUNDLE}RemoveSpace_0044 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0045
     * @tc.name      ComponentCollection_RemoveSpace_0045
     * @tc.desc      removeSpace(str="AA") returns "AA"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RemoveSpace_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemoveSpace_0045 begin`);
      const actual: string = removeSpace('AA');
      logInfo(`removeSpace(str="AA"): actual=${actual}`);
      expect(actual).assertEqual('AA');
      logInfo(`${BUNDLE}RemoveSpace_0045 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0046
     * @tc.name      ComponentCollection_RemoveSpace_0046
     * @tc.desc      removeSpace(str="A_1") returns "A_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RemoveSpace_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemoveSpace_0046 begin`);
      const actual: string = removeSpace('A_1');
      logInfo(`removeSpace(str="A_1"): actual=${actual}`);
      expect(actual).assertEqual('A_1');
      logInfo(`${BUNDLE}RemoveSpace_0046 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0047
     * @tc.name      ComponentCollection_RemoveSpace_0047
     * @tc.desc      removeSpace(str="xA") returns "xA"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_RemoveSpace_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemoveSpace_0047 begin`);
      const actual: string = removeSpace('xA');
      logInfo(`removeSpace(str="xA"): actual=${actual}`);
      expect(actual).assertEqual('xA');
      logInfo(`${BUNDLE}RemoveSpace_0047 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0048
     * @tc.name      ComponentCollection_RemoveSpace_0048
     * @tc.desc      removeSpace(str="Sample Title 123Sample Title 123") returns "SampleTitle123SampleTitle123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RemoveSpace_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemoveSpace_0048 begin`);
      const actual: string = removeSpace('Sample Title 123Sample Title 123');
      logInfo(`removeSpace(str="Sample Title 123Sample T...: actual=${actual}`);
      expect(actual).assertEqual('SampleTitle123SampleTitle123');
      logInfo(`${BUNDLE}RemoveSpace_0048 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_REMOVE_SPACE_0049
     * @tc.name      ComponentCollection_RemoveSpace_0049
     * @tc.desc      removeSpace(str="Sample Title 123_1") returns "SampleTitle123_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RemoveSpace_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemoveSpace_0049 begin`);
      const actual: string = removeSpace('Sample Title 123_1');
      logInfo(`removeSpace(str="Sample Title 123_1"): actual=${actual}`);
      expect(actual).assertEqual('SampleTitle123_1');
      logInfo(`${BUNDLE}RemoveSpace_0049 end`);
    });
  });
}
