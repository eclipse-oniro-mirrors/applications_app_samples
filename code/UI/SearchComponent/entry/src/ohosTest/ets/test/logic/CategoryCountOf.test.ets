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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../../utils/TestScheduler';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { categoryCountOf } from '../model/SearchComponentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SearchComponent]';
const BUNDLE: string = 'SearchComponent_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for categoryCountOf (30 cases). */
export default function categoryCountOfTest(): void {
  describe('CategoryCountOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_COUNT_OF_0001
     * @tc.name      SearchComponent_CategoryCountOf_0001
     * @tc.desc      categoryCountOf(category="") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_CategoryCountOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CategoryCountOf_0001 begin`);
      const actual: number = categoryCountOf('');
      logInfo(`categoryCountOf(category=""): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CategoryCountOf_0001 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_COUNT_OF_0002
     * @tc.name      SearchComponent_CategoryCountOf_0002
     * @tc.desc      categoryCountOf(category="a") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_CategoryCountOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CategoryCountOf_0002 begin`);
      const actual: number = categoryCountOf('a');
      logInfo(`categoryCountOf(category="a"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CategoryCountOf_0002 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_COUNT_OF_0003
     * @tc.name      SearchComponent_CategoryCountOf_0003
     * @tc.desc      categoryCountOf(category="abc") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryCountOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryCountOf_0003 begin`);
      const actual: number = categoryCountOf('abc');
      logInfo(`categoryCountOf(category="abc"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CategoryCountOf_0003 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_COUNT_OF_0004
     * @tc.name      SearchComponent_CategoryCountOf_0004
     * @tc.desc      categoryCountOf(category="Hello World") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryCountOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryCountOf_0004 begin`);
      const actual: number = categoryCountOf('Hello World');
      logInfo(`categoryCountOf(category="Hello World"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CategoryCountOf_0004 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_COUNT_OF_0005
     * @tc.name      SearchComponent_CategoryCountOf_0005
     * @tc.desc      categoryCountOf(category=" ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryCountOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryCountOf_0005 begin`);
      const actual: number = categoryCountOf(' ');
      logInfo(`categoryCountOf(category=" "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CategoryCountOf_0005 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_COUNT_OF_0006
     * @tc.name      SearchComponent_CategoryCountOf_0006
     * @tc.desc      categoryCountOf(category="123") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryCountOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryCountOf_0006 begin`);
      const actual: number = categoryCountOf('123');
      logInfo(`categoryCountOf(category="123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CategoryCountOf_0006 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_COUNT_OF_0007
     * @tc.name      SearchComponent_CategoryCountOf_0007
     * @tc.desc      categoryCountOf(category=" a ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_CategoryCountOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CategoryCountOf_0007 begin`);
      const actual: number = categoryCountOf(' a ');
      logInfo(`categoryCountOf(category=" a "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CategoryCountOf_0007 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_COUNT_OF_0008
     * @tc.name      SearchComponent_CategoryCountOf_0008
     * @tc.desc      categoryCountOf(category="aa") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryCountOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryCountOf_0008 begin`);
      const actual: number = categoryCountOf('aa');
      logInfo(`categoryCountOf(category="aa"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CategoryCountOf_0008 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_COUNT_OF_0009
     * @tc.name      SearchComponent_CategoryCountOf_0009
     * @tc.desc      categoryCountOf(category="a_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryCountOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryCountOf_0009 begin`);
      const actual: number = categoryCountOf('a_1');
      logInfo(`categoryCountOf(category="a_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CategoryCountOf_0009 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_COUNT_OF_0010
     * @tc.name      SearchComponent_CategoryCountOf_0010
     * @tc.desc      categoryCountOf(category="xa") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_CategoryCountOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CategoryCountOf_0010 begin`);
      const actual: number = categoryCountOf('xa');
      logInfo(`categoryCountOf(category="xa"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CategoryCountOf_0010 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_COUNT_OF_0011
     * @tc.name      SearchComponent_CategoryCountOf_0011
     * @tc.desc      categoryCountOf(category=" abc ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_CategoryCountOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CategoryCountOf_0011 begin`);
      const actual: number = categoryCountOf(' abc ');
      logInfo(`categoryCountOf(category=" abc "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CategoryCountOf_0011 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_COUNT_OF_0012
     * @tc.name      SearchComponent_CategoryCountOf_0012
     * @tc.desc      categoryCountOf(category="abcabc") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryCountOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryCountOf_0012 begin`);
      const actual: number = categoryCountOf('abcabc');
      logInfo(`categoryCountOf(category="abcabc"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CategoryCountOf_0012 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_COUNT_OF_0013
     * @tc.name      SearchComponent_CategoryCountOf_0013
     * @tc.desc      categoryCountOf(category="abc_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryCountOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryCountOf_0013 begin`);
      const actual: number = categoryCountOf('abc_1');
      logInfo(`categoryCountOf(category="abc_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CategoryCountOf_0013 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_COUNT_OF_0014
     * @tc.name      SearchComponent_CategoryCountOf_0014
     * @tc.desc      categoryCountOf(category="xabc") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_CategoryCountOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CategoryCountOf_0014 begin`);
      const actual: number = categoryCountOf('xabc');
      logInfo(`categoryCountOf(category="xabc"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CategoryCountOf_0014 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_COUNT_OF_0015
     * @tc.name      SearchComponent_CategoryCountOf_0015
     * @tc.desc      categoryCountOf(category=" Hello World ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_CategoryCountOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CategoryCountOf_0015 begin`);
      const actual: number = categoryCountOf(' Hello World ');
      logInfo(`categoryCountOf(category=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CategoryCountOf_0015 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_COUNT_OF_0016
     * @tc.name      SearchComponent_CategoryCountOf_0016
     * @tc.desc      categoryCountOf(category="Hello WorldHello World") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryCountOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryCountOf_0016 begin`);
      const actual: number = categoryCountOf('Hello WorldHello World');
      logInfo(`categoryCountOf(category="Hello WorldHell...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CategoryCountOf_0016 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_COUNT_OF_0017
     * @tc.name      SearchComponent_CategoryCountOf_0017
     * @tc.desc      categoryCountOf(category="Hello World_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryCountOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryCountOf_0017 begin`);
      const actual: number = categoryCountOf('Hello World_1');
      logInfo(`categoryCountOf(category="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CategoryCountOf_0017 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_COUNT_OF_0018
     * @tc.name      SearchComponent_CategoryCountOf_0018
     * @tc.desc      categoryCountOf(category="xHello World") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_CategoryCountOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CategoryCountOf_0018 begin`);
      const actual: number = categoryCountOf('xHello World');
      logInfo(`categoryCountOf(category="xHello World"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CategoryCountOf_0018 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_COUNT_OF_0019
     * @tc.name      SearchComponent_CategoryCountOf_0019
     * @tc.desc      categoryCountOf(category="   ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_CategoryCountOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CategoryCountOf_0019 begin`);
      const actual: number = categoryCountOf('   ');
      logInfo(`categoryCountOf(category="   "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CategoryCountOf_0019 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_COUNT_OF_0020
     * @tc.name      SearchComponent_CategoryCountOf_0020
     * @tc.desc      categoryCountOf(category="  ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryCountOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryCountOf_0020 begin`);
      const actual: number = categoryCountOf('  ');
      logInfo(`categoryCountOf(category="  "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CategoryCountOf_0020 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_COUNT_OF_0021
     * @tc.name      SearchComponent_CategoryCountOf_0021
     * @tc.desc      categoryCountOf(category=" _1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryCountOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryCountOf_0021 begin`);
      const actual: number = categoryCountOf(' _1');
      logInfo(`categoryCountOf(category=" _1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CategoryCountOf_0021 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_COUNT_OF_0022
     * @tc.name      SearchComponent_CategoryCountOf_0022
     * @tc.desc      categoryCountOf(category="x ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_CategoryCountOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CategoryCountOf_0022 begin`);
      const actual: number = categoryCountOf('x ');
      logInfo(`categoryCountOf(category="x "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CategoryCountOf_0022 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_COUNT_OF_0023
     * @tc.name      SearchComponent_CategoryCountOf_0023
     * @tc.desc      categoryCountOf(category=" 123 ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_CategoryCountOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CategoryCountOf_0023 begin`);
      const actual: number = categoryCountOf(' 123 ');
      logInfo(`categoryCountOf(category=" 123 "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CategoryCountOf_0023 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_COUNT_OF_0024
     * @tc.name      SearchComponent_CategoryCountOf_0024
     * @tc.desc      categoryCountOf(category="123123") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryCountOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryCountOf_0024 begin`);
      const actual: number = categoryCountOf('123123');
      logInfo(`categoryCountOf(category="123123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CategoryCountOf_0024 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_COUNT_OF_0025
     * @tc.name      SearchComponent_CategoryCountOf_0025
     * @tc.desc      categoryCountOf(category="123_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryCountOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryCountOf_0025 begin`);
      const actual: number = categoryCountOf('123_1');
      logInfo(`categoryCountOf(category="123_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CategoryCountOf_0025 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_COUNT_OF_0026
     * @tc.name      SearchComponent_CategoryCountOf_0026
     * @tc.desc      categoryCountOf(category="x123") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_CategoryCountOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CategoryCountOf_0026 begin`);
      const actual: number = categoryCountOf('x123');
      logInfo(`categoryCountOf(category="x123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CategoryCountOf_0026 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_COUNT_OF_0027
     * @tc.name      SearchComponent_CategoryCountOf_0027
     * @tc.desc      categoryCountOf(category="P3CyI") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryCountOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryCountOf_0027 begin`);
      const actual: number = categoryCountOf('P3CyI');
      logInfo(`categoryCountOf(category="P3CyI"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CategoryCountOf_0027 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_COUNT_OF_0028
     * @tc.name      SearchComponent_CategoryCountOf_0028
     * @tc.desc      categoryCountOf(category="jDpWa9s0") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryCountOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryCountOf_0028 begin`);
      const actual: number = categoryCountOf('jDpWa9s0');
      logInfo(`categoryCountOf(category="jDpWa9s0"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CategoryCountOf_0028 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_COUNT_OF_0029
     * @tc.name      SearchComponent_CategoryCountOf_0029
     * @tc.desc      categoryCountOf(category="GcZlfsm0q") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryCountOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryCountOf_0029 begin`);
      const actual: number = categoryCountOf('GcZlfsm0q');
      logInfo(`categoryCountOf(category="GcZlfsm0q"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CategoryCountOf_0029 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_COUNT_OF_0030
     * @tc.name      SearchComponent_CategoryCountOf_0030
     * @tc.desc      categoryCountOf(category="q") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryCountOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryCountOf_0030 begin`);
      const actual: number = categoryCountOf('q');
      logInfo(`categoryCountOf(category="q"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CategoryCountOf_0030 end`);
    });
  });
}
