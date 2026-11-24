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
import { historyVisible } from '../model/SearchComponentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SearchComponent]';
const BUNDLE: string = 'SearchComponent_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for historyVisible (50 cases). */
export default function historyVisibleTest(): void {
  describe('HistoryVisibleTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0001
     * @tc.name      SearchComponent_HistoryVisible_0001
     * @tc.desc      historyVisible(historyLength=0, searchContext="Hello") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_HistoryVisible_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}HistoryVisible_0001 begin`);
      const actual: boolean = historyVisible(0, 'Hello');
      logInfo(`historyVisible(historyLength=0, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0001 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0002
     * @tc.name      SearchComponent_HistoryVisible_0002
     * @tc.desc      historyVisible(historyLength=1, searchContext="") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_HistoryVisible_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}HistoryVisible_0002 begin`);
      const actual: boolean = historyVisible(1, '');
      logInfo(`historyVisible(historyLength=1, searchCon...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}HistoryVisible_0002 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0003
     * @tc.name      SearchComponent_HistoryVisible_0003
     * @tc.desc      historyVisible(historyLength=0, searchContext="hello world") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_HistoryVisible_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HistoryVisible_0003 begin`);
      const actual: boolean = historyVisible(0, 'hello world');
      logInfo(`historyVisible(historyLength=0, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0003 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0004
     * @tc.name      SearchComponent_HistoryVisible_0004
     * @tc.desc      historyVisible(historyLength=0, searchContext="") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_HistoryVisible_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HistoryVisible_0004 begin`);
      const actual: boolean = historyVisible(0, '');
      logInfo(`historyVisible(historyLength=0, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0004 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0005
     * @tc.name      SearchComponent_HistoryVisible_0005
     * @tc.desc      historyVisible(historyLength=0, searchContext=" ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_HistoryVisible_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HistoryVisible_0005 begin`);
      const actual: boolean = historyVisible(0, ' ');
      logInfo(`historyVisible(historyLength=0, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0005 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0006
     * @tc.name      SearchComponent_HistoryVisible_0006
     * @tc.desc      historyVisible(historyLength=0, searchContext="A") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_HistoryVisible_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HistoryVisible_0006 begin`);
      const actual: boolean = historyVisible(0, 'A');
      logInfo(`historyVisible(historyLength=0, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0006 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0007
     * @tc.name      SearchComponent_HistoryVisible_0007
     * @tc.desc      historyVisible(historyLength=0, searchContext="Sample Title 123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_HistoryVisible_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HistoryVisible_0007 begin`);
      const actual: boolean = historyVisible(0, 'Sample Title 123');
      logInfo(`historyVisible(historyLength=0, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0007 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0008
     * @tc.name      SearchComponent_HistoryVisible_0008
     * @tc.desc      historyVisible(historyLength=0, searchContext="??") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_HistoryVisible_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HistoryVisible_0008 begin`);
      const actual: boolean = historyVisible(0, '\u4e2d\u6587');
      logInfo(`historyVisible(historyLength=0, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0008 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0009
     * @tc.name      SearchComponent_HistoryVisible_0009
     * @tc.desc      historyVisible(historyLength=0, searchContext="a") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_HistoryVisible_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HistoryVisible_0009 begin`);
      const actual: boolean = historyVisible(0, 'a');
      logInfo(`historyVisible(historyLength=0, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0009 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0010
     * @tc.name      SearchComponent_HistoryVisible_0010
     * @tc.desc      historyVisible(historyLength=0, searchContext="abc") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_HistoryVisible_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HistoryVisible_0010 begin`);
      const actual: boolean = historyVisible(0, 'abc');
      logInfo(`historyVisible(historyLength=0, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0010 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0011
     * @tc.name      SearchComponent_HistoryVisible_0011
     * @tc.desc      historyVisible(historyLength=0, searchContext="Hello World") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_HistoryVisible_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HistoryVisible_0011 begin`);
      const actual: boolean = historyVisible(0, 'Hello World');
      logInfo(`historyVisible(historyLength=0, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0011 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0012
     * @tc.name      SearchComponent_HistoryVisible_0012
     * @tc.desc      historyVisible(historyLength=0, searchContext="123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_HistoryVisible_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HistoryVisible_0012 begin`);
      const actual: boolean = historyVisible(0, '123');
      logInfo(`historyVisible(historyLength=0, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0012 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0013
     * @tc.name      SearchComponent_HistoryVisible_0013
     * @tc.desc      historyVisible(historyLength=0, searchContext=" Hello ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_HistoryVisible_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HistoryVisible_0013 begin`);
      const actual: boolean = historyVisible(0, ' Hello ');
      logInfo(`historyVisible(historyLength=0, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0013 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0014
     * @tc.name      SearchComponent_HistoryVisible_0014
     * @tc.desc      historyVisible(historyLength=0, searchContext="HelloHello") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_HistoryVisible_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HistoryVisible_0014 begin`);
      const actual: boolean = historyVisible(0, 'HelloHello');
      logInfo(`historyVisible(historyLength=0, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0014 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0015
     * @tc.name      SearchComponent_HistoryVisible_0015
     * @tc.desc      historyVisible(historyLength=0, searchContext="Hello_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_HistoryVisible_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HistoryVisible_0015 begin`);
      const actual: boolean = historyVisible(0, 'Hello_1');
      logInfo(`historyVisible(historyLength=0, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0015 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0016
     * @tc.name      SearchComponent_HistoryVisible_0016
     * @tc.desc      historyVisible(historyLength=0, searchContext="xHello") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_HistoryVisible_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HistoryVisible_0016 begin`);
      const actual: boolean = historyVisible(0, 'xHello');
      logInfo(`historyVisible(historyLength=0, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0016 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0017
     * @tc.name      SearchComponent_HistoryVisible_0017
     * @tc.desc      historyVisible(historyLength=0, searchContext=" hello world ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_HistoryVisible_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HistoryVisible_0017 begin`);
      const actual: boolean = historyVisible(0, ' hello world ');
      logInfo(`historyVisible(historyLength=0, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0017 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0018
     * @tc.name      SearchComponent_HistoryVisible_0018
     * @tc.desc      historyVisible(historyLength=0, searchContext="hello worldhello world") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_HistoryVisible_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HistoryVisible_0018 begin`);
      const actual: boolean = historyVisible(0, 'hello worldhello world');
      logInfo(`historyVisible(historyLength=0, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0018 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0019
     * @tc.name      SearchComponent_HistoryVisible_0019
     * @tc.desc      historyVisible(historyLength=0, searchContext="hello world_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_HistoryVisible_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HistoryVisible_0019 begin`);
      const actual: boolean = historyVisible(0, 'hello world_1');
      logInfo(`historyVisible(historyLength=0, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0019 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0020
     * @tc.name      SearchComponent_HistoryVisible_0020
     * @tc.desc      historyVisible(historyLength=0, searchContext="xhello world") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_HistoryVisible_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HistoryVisible_0020 begin`);
      const actual: boolean = historyVisible(0, 'xhello world');
      logInfo(`historyVisible(historyLength=0, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0020 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0021
     * @tc.name      SearchComponent_HistoryVisible_0021
     * @tc.desc      historyVisible(historyLength=0, searchContext="   ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_HistoryVisible_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HistoryVisible_0021 begin`);
      const actual: boolean = historyVisible(0, '   ');
      logInfo(`historyVisible(historyLength=0, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0021 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0022
     * @tc.name      SearchComponent_HistoryVisible_0022
     * @tc.desc      historyVisible(historyLength=0, searchContext="  ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_HistoryVisible_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HistoryVisible_0022 begin`);
      const actual: boolean = historyVisible(0, '  ');
      logInfo(`historyVisible(historyLength=0, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0022 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0023
     * @tc.name      SearchComponent_HistoryVisible_0023
     * @tc.desc      historyVisible(historyLength=0, searchContext=" _1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_HistoryVisible_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HistoryVisible_0023 begin`);
      const actual: boolean = historyVisible(0, ' _1');
      logInfo(`historyVisible(historyLength=0, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0023 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0024
     * @tc.name      SearchComponent_HistoryVisible_0024
     * @tc.desc      historyVisible(historyLength=0, searchContext="x ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_HistoryVisible_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HistoryVisible_0024 begin`);
      const actual: boolean = historyVisible(0, 'x ');
      logInfo(`historyVisible(historyLength=0, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0024 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0025
     * @tc.name      SearchComponent_HistoryVisible_0025
     * @tc.desc      historyVisible(historyLength=0, searchContext=" A ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_HistoryVisible_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HistoryVisible_0025 begin`);
      const actual: boolean = historyVisible(0, ' A ');
      logInfo(`historyVisible(historyLength=0, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0025 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0026
     * @tc.name      SearchComponent_HistoryVisible_0026
     * @tc.desc      historyVisible(historyLength=1, searchContext="Hello") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_HistoryVisible_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HistoryVisible_0026 begin`);
      const actual: boolean = historyVisible(1, 'Hello');
      logInfo(`historyVisible(historyLength=1, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0026 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0027
     * @tc.name      SearchComponent_HistoryVisible_0027
     * @tc.desc      historyVisible(historyLength=1, searchContext="hello world") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_HistoryVisible_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HistoryVisible_0027 begin`);
      const actual: boolean = historyVisible(1, 'hello world');
      logInfo(`historyVisible(historyLength=1, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0027 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0028
     * @tc.name      SearchComponent_HistoryVisible_0028
     * @tc.desc      historyVisible(historyLength=1, searchContext=" ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_HistoryVisible_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HistoryVisible_0028 begin`);
      const actual: boolean = historyVisible(1, ' ');
      logInfo(`historyVisible(historyLength=1, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0028 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0029
     * @tc.name      SearchComponent_HistoryVisible_0029
     * @tc.desc      historyVisible(historyLength=1, searchContext="A") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_HistoryVisible_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HistoryVisible_0029 begin`);
      const actual: boolean = historyVisible(1, 'A');
      logInfo(`historyVisible(historyLength=1, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0029 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0030
     * @tc.name      SearchComponent_HistoryVisible_0030
     * @tc.desc      historyVisible(historyLength=1, searchContext="Sample Title 123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_HistoryVisible_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HistoryVisible_0030 begin`);
      const actual: boolean = historyVisible(1, 'Sample Title 123');
      logInfo(`historyVisible(historyLength=1, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0030 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0031
     * @tc.name      SearchComponent_HistoryVisible_0031
     * @tc.desc      historyVisible(historyLength=1, searchContext="??") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_HistoryVisible_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HistoryVisible_0031 begin`);
      const actual: boolean = historyVisible(1, '\u4e2d\u6587');
      logInfo(`historyVisible(historyLength=1, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0031 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0032
     * @tc.name      SearchComponent_HistoryVisible_0032
     * @tc.desc      historyVisible(historyLength=1, searchContext="a") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_HistoryVisible_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HistoryVisible_0032 begin`);
      const actual: boolean = historyVisible(1, 'a');
      logInfo(`historyVisible(historyLength=1, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0032 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0033
     * @tc.name      SearchComponent_HistoryVisible_0033
     * @tc.desc      historyVisible(historyLength=1, searchContext="abc") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_HistoryVisible_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HistoryVisible_0033 begin`);
      const actual: boolean = historyVisible(1, 'abc');
      logInfo(`historyVisible(historyLength=1, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0033 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0034
     * @tc.name      SearchComponent_HistoryVisible_0034
     * @tc.desc      historyVisible(historyLength=1, searchContext="Hello World") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_HistoryVisible_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HistoryVisible_0034 begin`);
      const actual: boolean = historyVisible(1, 'Hello World');
      logInfo(`historyVisible(historyLength=1, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0034 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0035
     * @tc.name      SearchComponent_HistoryVisible_0035
     * @tc.desc      historyVisible(historyLength=1, searchContext="123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_HistoryVisible_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HistoryVisible_0035 begin`);
      const actual: boolean = historyVisible(1, '123');
      logInfo(`historyVisible(historyLength=1, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0035 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0036
     * @tc.name      SearchComponent_HistoryVisible_0036
     * @tc.desc      historyVisible(historyLength=1, searchContext=" Hello ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_HistoryVisible_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HistoryVisible_0036 begin`);
      const actual: boolean = historyVisible(1, ' Hello ');
      logInfo(`historyVisible(historyLength=1, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0036 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0037
     * @tc.name      SearchComponent_HistoryVisible_0037
     * @tc.desc      historyVisible(historyLength=1, searchContext="HelloHello") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_HistoryVisible_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HistoryVisible_0037 begin`);
      const actual: boolean = historyVisible(1, 'HelloHello');
      logInfo(`historyVisible(historyLength=1, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0037 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0038
     * @tc.name      SearchComponent_HistoryVisible_0038
     * @tc.desc      historyVisible(historyLength=1, searchContext="Hello_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_HistoryVisible_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HistoryVisible_0038 begin`);
      const actual: boolean = historyVisible(1, 'Hello_1');
      logInfo(`historyVisible(historyLength=1, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0038 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0039
     * @tc.name      SearchComponent_HistoryVisible_0039
     * @tc.desc      historyVisible(historyLength=1, searchContext="xHello") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_HistoryVisible_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HistoryVisible_0039 begin`);
      const actual: boolean = historyVisible(1, 'xHello');
      logInfo(`historyVisible(historyLength=1, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0039 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0040
     * @tc.name      SearchComponent_HistoryVisible_0040
     * @tc.desc      historyVisible(historyLength=1, searchContext=" hello world ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_HistoryVisible_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HistoryVisible_0040 begin`);
      const actual: boolean = historyVisible(1, ' hello world ');
      logInfo(`historyVisible(historyLength=1, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0040 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0041
     * @tc.name      SearchComponent_HistoryVisible_0041
     * @tc.desc      historyVisible(historyLength=1, searchContext="hello worldhello world") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_HistoryVisible_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HistoryVisible_0041 begin`);
      const actual: boolean = historyVisible(1, 'hello worldhello world');
      logInfo(`historyVisible(historyLength=1, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0041 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0042
     * @tc.name      SearchComponent_HistoryVisible_0042
     * @tc.desc      historyVisible(historyLength=1, searchContext="hello world_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_HistoryVisible_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HistoryVisible_0042 begin`);
      const actual: boolean = historyVisible(1, 'hello world_1');
      logInfo(`historyVisible(historyLength=1, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0042 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0043
     * @tc.name      SearchComponent_HistoryVisible_0043
     * @tc.desc      historyVisible(historyLength=1, searchContext="xhello world") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_HistoryVisible_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HistoryVisible_0043 begin`);
      const actual: boolean = historyVisible(1, 'xhello world');
      logInfo(`historyVisible(historyLength=1, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0043 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0044
     * @tc.name      SearchComponent_HistoryVisible_0044
     * @tc.desc      historyVisible(historyLength=1, searchContext="   ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_HistoryVisible_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HistoryVisible_0044 begin`);
      const actual: boolean = historyVisible(1, '   ');
      logInfo(`historyVisible(historyLength=1, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0044 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0045
     * @tc.name      SearchComponent_HistoryVisible_0045
     * @tc.desc      historyVisible(historyLength=1, searchContext="  ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_HistoryVisible_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HistoryVisible_0045 begin`);
      const actual: boolean = historyVisible(1, '  ');
      logInfo(`historyVisible(historyLength=1, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0045 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0046
     * @tc.name      SearchComponent_HistoryVisible_0046
     * @tc.desc      historyVisible(historyLength=1, searchContext=" _1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_HistoryVisible_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HistoryVisible_0046 begin`);
      const actual: boolean = historyVisible(1, ' _1');
      logInfo(`historyVisible(historyLength=1, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0046 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0047
     * @tc.name      SearchComponent_HistoryVisible_0047
     * @tc.desc      historyVisible(historyLength=1, searchContext="x ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_HistoryVisible_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HistoryVisible_0047 begin`);
      const actual: boolean = historyVisible(1, 'x ');
      logInfo(`historyVisible(historyLength=1, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0047 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0048
     * @tc.name      SearchComponent_HistoryVisible_0048
     * @tc.desc      historyVisible(historyLength=1, searchContext=" A ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_HistoryVisible_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HistoryVisible_0048 begin`);
      const actual: boolean = historyVisible(1, ' A ');
      logInfo(`historyVisible(historyLength=1, searchCon...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0048 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0049
     * @tc.name      SearchComponent_HistoryVisible_0049
     * @tc.desc      historyVisible(historyLength=-1, searchContext="Hello") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_HistoryVisible_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HistoryVisible_0049 begin`);
      const actual: boolean = historyVisible(-1, 'Hello');
      logInfo(`historyVisible(historyLength=-1, searchCo...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0049 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_HISTORY_VISIBLE_0050
     * @tc.name      SearchComponent_HistoryVisible_0050
     * @tc.desc      historyVisible(historyLength=-1, searchContext="hello world") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_HistoryVisible_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HistoryVisible_0050 begin`);
      const actual: boolean = historyVisible(-1, 'hello world');
      logInfo(`historyVisible(historyLength=-1, searchCo...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}HistoryVisible_0050 end`);
    });
  });
}
