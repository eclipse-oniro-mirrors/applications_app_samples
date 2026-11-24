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
import { SearchPageState } from '../model/SearchComponentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SearchComponent]';
const BUNDLE: string = 'SearchComponent_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for SearchPageState.pick (30 cases). */
export default function searchPageStatePickTest(): void {
  describe('SearchPageStatePickTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_PICK_0001
     * @tc.name      SearchComponent_SearchPageStatePick_0001
     * @tc.desc      SearchPageState.pick(index=0) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_SearchPageStatePick_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SearchPageStatePick_0001 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.pick(0);
      logInfo(`pick(index=0): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStatePick_0001 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_PICK_0002
     * @tc.name      SearchComponent_SearchPageStatePick_0002
     * @tc.desc      SearchPageState.pick(index=1) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_SearchPageStatePick_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SearchPageStatePick_0002 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.pick(1);
      logInfo(`pick(index=1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStatePick_0002 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_PICK_0003
     * @tc.name      SearchComponent_SearchPageStatePick_0003
     * @tc.desc      SearchPageState.pick(index=-1) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchPageStatePick_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchPageStatePick_0003 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.pick(-1);
      logInfo(`pick(index=-1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStatePick_0003 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_PICK_0004
     * @tc.name      SearchComponent_SearchPageStatePick_0004
     * @tc.desc      SearchPageState.pick(index=-2) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchPageStatePick_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchPageStatePick_0004 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.pick(-2);
      logInfo(`pick(index=-2): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStatePick_0004 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_PICK_0005
     * @tc.name      SearchComponent_SearchPageStatePick_0005
     * @tc.desc      SearchPageState.pick(index=2) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStatePick_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStatePick_0005 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.pick(2);
      logInfo(`pick(index=2): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStatePick_0005 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_PICK_0006
     * @tc.name      SearchComponent_SearchPageStatePick_0006
     * @tc.desc      SearchPageState.pick(index=5) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStatePick_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStatePick_0006 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.pick(5);
      logInfo(`pick(index=5): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStatePick_0006 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_PICK_0007
     * @tc.name      SearchComponent_SearchPageStatePick_0007
     * @tc.desc      SearchPageState.pick(index=10) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStatePick_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStatePick_0007 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.pick(10);
      logInfo(`pick(index=10): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStatePick_0007 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_PICK_0008
     * @tc.name      SearchComponent_SearchPageStatePick_0008
     * @tc.desc      SearchPageState.pick(index=3) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStatePick_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStatePick_0008 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.pick(3);
      logInfo(`pick(index=3): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStatePick_0008 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_PICK_0009
     * @tc.name      SearchComponent_SearchPageStatePick_0009
     * @tc.desc      SearchPageState.pick(index=100) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStatePick_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStatePick_0009 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.pick(100);
      logInfo(`pick(index=100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStatePick_0009 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_PICK_0010
     * @tc.name      SearchComponent_SearchPageStatePick_0010
     * @tc.desc      SearchPageState.pick(index=15) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStatePick_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStatePick_0010 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.pick(15);
      logInfo(`pick(index=15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStatePick_0010 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_PICK_0011
     * @tc.name      SearchComponent_SearchPageStatePick_0011
     * @tc.desc      SearchPageState.pick(index=20) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStatePick_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStatePick_0011 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.pick(20);
      logInfo(`pick(index=20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStatePick_0011 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_PICK_0012
     * @tc.name      SearchComponent_SearchPageStatePick_0012
     * @tc.desc      SearchPageState.pick(index=25) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStatePick_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStatePick_0012 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.pick(25);
      logInfo(`pick(index=25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStatePick_0012 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_PICK_0013
     * @tc.name      SearchComponent_SearchPageStatePick_0013
     * @tc.desc      SearchPageState.pick(index=30) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStatePick_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStatePick_0013 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.pick(30);
      logInfo(`pick(index=30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStatePick_0013 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_PICK_0014
     * @tc.name      SearchComponent_SearchPageStatePick_0014
     * @tc.desc      SearchPageState.pick(index=35) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStatePick_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStatePick_0014 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.pick(35);
      logInfo(`pick(index=35): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStatePick_0014 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_PICK_0015
     * @tc.name      SearchComponent_SearchPageStatePick_0015
     * @tc.desc      SearchPageState.pick(index=40) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStatePick_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStatePick_0015 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.pick(40);
      logInfo(`pick(index=40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStatePick_0015 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_PICK_0016
     * @tc.name      SearchComponent_SearchPageStatePick_0016
     * @tc.desc      SearchPageState.pick(index=45) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStatePick_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStatePick_0016 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.pick(45);
      logInfo(`pick(index=45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStatePick_0016 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_PICK_0017
     * @tc.name      SearchComponent_SearchPageStatePick_0017
     * @tc.desc      SearchPageState.pick(index=50) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStatePick_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStatePick_0017 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.pick(50);
      logInfo(`pick(index=50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStatePick_0017 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_PICK_0018
     * @tc.name      SearchComponent_SearchPageStatePick_0018
     * @tc.desc      SearchPageState.pick(index=55) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStatePick_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStatePick_0018 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.pick(55);
      logInfo(`pick(index=55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStatePick_0018 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_PICK_0019
     * @tc.name      SearchComponent_SearchPageStatePick_0019
     * @tc.desc      SearchPageState.pick(index=60) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStatePick_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStatePick_0019 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.pick(60);
      logInfo(`pick(index=60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStatePick_0019 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_PICK_0020
     * @tc.name      SearchComponent_SearchPageStatePick_0020
     * @tc.desc      SearchPageState.pick(index=65) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStatePick_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStatePick_0020 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.pick(65);
      logInfo(`pick(index=65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStatePick_0020 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_PICK_0021
     * @tc.name      SearchComponent_SearchPageStatePick_0021
     * @tc.desc      SearchPageState.pick(index=70) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStatePick_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStatePick_0021 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.pick(70);
      logInfo(`pick(index=70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStatePick_0021 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_PICK_0022
     * @tc.name      SearchComponent_SearchPageStatePick_0022
     * @tc.desc      SearchPageState.pick(index=75) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStatePick_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStatePick_0022 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.pick(75);
      logInfo(`pick(index=75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStatePick_0022 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_PICK_0023
     * @tc.name      SearchComponent_SearchPageStatePick_0023
     * @tc.desc      SearchPageState.pick(index=80) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStatePick_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStatePick_0023 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.pick(80);
      logInfo(`pick(index=80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStatePick_0023 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_PICK_0024
     * @tc.name      SearchComponent_SearchPageStatePick_0024
     * @tc.desc      SearchPageState.pick(index=85) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStatePick_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStatePick_0024 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.pick(85);
      logInfo(`pick(index=85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStatePick_0024 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_PICK_0025
     * @tc.name      SearchComponent_SearchPageStatePick_0025
     * @tc.desc      SearchPageState.pick(index=90) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStatePick_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStatePick_0025 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.pick(90);
      logInfo(`pick(index=90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStatePick_0025 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_PICK_0026
     * @tc.name      SearchComponent_SearchPageStatePick_0026
     * @tc.desc      SearchPageState.pick(index=95) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStatePick_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStatePick_0026 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.pick(95);
      logInfo(`pick(index=95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStatePick_0026 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_PICK_0027
     * @tc.name      SearchComponent_SearchPageStatePick_0027
     * @tc.desc      SearchPageState.pick(index=105) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStatePick_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStatePick_0027 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.pick(105);
      logInfo(`pick(index=105): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStatePick_0027 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_PICK_0028
     * @tc.name      SearchComponent_SearchPageStatePick_0028
     * @tc.desc      SearchPageState.pick(index=110) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStatePick_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStatePick_0028 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.pick(110);
      logInfo(`pick(index=110): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStatePick_0028 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_PICK_0029
     * @tc.name      SearchComponent_SearchPageStatePick_0029
     * @tc.desc      SearchPageState.pick(index=115) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStatePick_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStatePick_0029 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.pick(115);
      logInfo(`pick(index=115): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStatePick_0029 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_PICK_0030
     * @tc.name      SearchComponent_SearchPageStatePick_0030
     * @tc.desc      SearchPageState.pick(index=120) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchPageStatePick_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchPageStatePick_0030 begin`);
      const subject: SearchPageState = new SearchPageState();
      const actual: string = subject.pick(120);
      logInfo(`pick(index=120): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}SearchPageStatePick_0030 end`);
    });
  });
}
