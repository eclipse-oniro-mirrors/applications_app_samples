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
import { CitySearchState } from '../model/CitySearchLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CitySearch]';
const BUNDLE: string = 'CitySearch_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for CitySearchState.pickResult (30 cases). */
export default function citySearchStatePickResultTest(): void {
  describe('CitySearchStatePickResultTest', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_RESULT_0001
     * @tc.name      CitySearch_CitySearchStatePickResult_0001
     * @tc.desc      CitySearchState.pickResult(index=0) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CitySearchStatePickResult_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CitySearchStatePickResult_0001 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pickResult(0);
      logInfo(`pickResult(index=0): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CitySearchStatePickResult_0001 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_RESULT_0002
     * @tc.name      CitySearch_CitySearchStatePickResult_0002
     * @tc.desc      CitySearchState.pickResult(index=1) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CitySearchStatePickResult_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CitySearchStatePickResult_0002 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pickResult(1);
      logInfo(`pickResult(index=1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CitySearchStatePickResult_0002 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_RESULT_0003
     * @tc.name      CitySearch_CitySearchStatePickResult_0003
     * @tc.desc      CitySearchState.pickResult(index=-1) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CitySearch_CitySearchStatePickResult_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CitySearchStatePickResult_0003 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pickResult(-1);
      logInfo(`pickResult(index=-1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CitySearchStatePickResult_0003 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_RESULT_0004
     * @tc.name      CitySearch_CitySearchStatePickResult_0004
     * @tc.desc      CitySearchState.pickResult(index=2) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePickResult_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePickResult_0004 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pickResult(2);
      logInfo(`pickResult(index=2): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CitySearchStatePickResult_0004 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_RESULT_0005
     * @tc.name      CitySearch_CitySearchStatePickResult_0005
     * @tc.desc      CitySearchState.pickResult(index=5) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePickResult_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePickResult_0005 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pickResult(5);
      logInfo(`pickResult(index=5): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CitySearchStatePickResult_0005 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_RESULT_0006
     * @tc.name      CitySearch_CitySearchStatePickResult_0006
     * @tc.desc      CitySearchState.pickResult(index=10) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePickResult_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePickResult_0006 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pickResult(10);
      logInfo(`pickResult(index=10): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CitySearchStatePickResult_0006 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_RESULT_0007
     * @tc.name      CitySearch_CitySearchStatePickResult_0007
     * @tc.desc      CitySearchState.pickResult(index=3) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePickResult_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePickResult_0007 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pickResult(3);
      logInfo(`pickResult(index=3): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CitySearchStatePickResult_0007 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_RESULT_0008
     * @tc.name      CitySearch_CitySearchStatePickResult_0008
     * @tc.desc      CitySearchState.pickResult(index=100) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePickResult_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePickResult_0008 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pickResult(100);
      logInfo(`pickResult(index=100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CitySearchStatePickResult_0008 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_RESULT_0009
     * @tc.name      CitySearch_CitySearchStatePickResult_0009
     * @tc.desc      CitySearchState.pickResult(index=15) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePickResult_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePickResult_0009 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pickResult(15);
      logInfo(`pickResult(index=15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CitySearchStatePickResult_0009 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_RESULT_0010
     * @tc.name      CitySearch_CitySearchStatePickResult_0010
     * @tc.desc      CitySearchState.pickResult(index=20) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePickResult_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePickResult_0010 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pickResult(20);
      logInfo(`pickResult(index=20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CitySearchStatePickResult_0010 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_RESULT_0011
     * @tc.name      CitySearch_CitySearchStatePickResult_0011
     * @tc.desc      CitySearchState.pickResult(index=25) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePickResult_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePickResult_0011 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pickResult(25);
      logInfo(`pickResult(index=25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CitySearchStatePickResult_0011 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_RESULT_0012
     * @tc.name      CitySearch_CitySearchStatePickResult_0012
     * @tc.desc      CitySearchState.pickResult(index=30) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePickResult_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePickResult_0012 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pickResult(30);
      logInfo(`pickResult(index=30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CitySearchStatePickResult_0012 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_RESULT_0013
     * @tc.name      CitySearch_CitySearchStatePickResult_0013
     * @tc.desc      CitySearchState.pickResult(index=35) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePickResult_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePickResult_0013 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pickResult(35);
      logInfo(`pickResult(index=35): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CitySearchStatePickResult_0013 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_RESULT_0014
     * @tc.name      CitySearch_CitySearchStatePickResult_0014
     * @tc.desc      CitySearchState.pickResult(index=40) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePickResult_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePickResult_0014 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pickResult(40);
      logInfo(`pickResult(index=40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CitySearchStatePickResult_0014 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_RESULT_0015
     * @tc.name      CitySearch_CitySearchStatePickResult_0015
     * @tc.desc      CitySearchState.pickResult(index=45) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePickResult_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePickResult_0015 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pickResult(45);
      logInfo(`pickResult(index=45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CitySearchStatePickResult_0015 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_RESULT_0016
     * @tc.name      CitySearch_CitySearchStatePickResult_0016
     * @tc.desc      CitySearchState.pickResult(index=50) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePickResult_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePickResult_0016 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pickResult(50);
      logInfo(`pickResult(index=50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CitySearchStatePickResult_0016 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_RESULT_0017
     * @tc.name      CitySearch_CitySearchStatePickResult_0017
     * @tc.desc      CitySearchState.pickResult(index=55) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePickResult_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePickResult_0017 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pickResult(55);
      logInfo(`pickResult(index=55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CitySearchStatePickResult_0017 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_RESULT_0018
     * @tc.name      CitySearch_CitySearchStatePickResult_0018
     * @tc.desc      CitySearchState.pickResult(index=60) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePickResult_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePickResult_0018 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pickResult(60);
      logInfo(`pickResult(index=60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CitySearchStatePickResult_0018 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_RESULT_0019
     * @tc.name      CitySearch_CitySearchStatePickResult_0019
     * @tc.desc      CitySearchState.pickResult(index=65) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePickResult_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePickResult_0019 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pickResult(65);
      logInfo(`pickResult(index=65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CitySearchStatePickResult_0019 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_RESULT_0020
     * @tc.name      CitySearch_CitySearchStatePickResult_0020
     * @tc.desc      CitySearchState.pickResult(index=70) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePickResult_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePickResult_0020 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pickResult(70);
      logInfo(`pickResult(index=70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CitySearchStatePickResult_0020 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_RESULT_0021
     * @tc.name      CitySearch_CitySearchStatePickResult_0021
     * @tc.desc      CitySearchState.pickResult(index=75) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePickResult_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePickResult_0021 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pickResult(75);
      logInfo(`pickResult(index=75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CitySearchStatePickResult_0021 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_RESULT_0022
     * @tc.name      CitySearch_CitySearchStatePickResult_0022
     * @tc.desc      CitySearchState.pickResult(index=80) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePickResult_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePickResult_0022 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pickResult(80);
      logInfo(`pickResult(index=80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CitySearchStatePickResult_0022 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_RESULT_0023
     * @tc.name      CitySearch_CitySearchStatePickResult_0023
     * @tc.desc      CitySearchState.pickResult(index=85) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePickResult_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePickResult_0023 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pickResult(85);
      logInfo(`pickResult(index=85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CitySearchStatePickResult_0023 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_RESULT_0024
     * @tc.name      CitySearch_CitySearchStatePickResult_0024
     * @tc.desc      CitySearchState.pickResult(index=90) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePickResult_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePickResult_0024 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pickResult(90);
      logInfo(`pickResult(index=90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CitySearchStatePickResult_0024 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_RESULT_0025
     * @tc.name      CitySearch_CitySearchStatePickResult_0025
     * @tc.desc      CitySearchState.pickResult(index=95) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePickResult_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePickResult_0025 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pickResult(95);
      logInfo(`pickResult(index=95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CitySearchStatePickResult_0025 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_RESULT_0026
     * @tc.name      CitySearch_CitySearchStatePickResult_0026
     * @tc.desc      CitySearchState.pickResult(index=105) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePickResult_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePickResult_0026 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pickResult(105);
      logInfo(`pickResult(index=105): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CitySearchStatePickResult_0026 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_RESULT_0027
     * @tc.name      CitySearch_CitySearchStatePickResult_0027
     * @tc.desc      CitySearchState.pickResult(index=110) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePickResult_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePickResult_0027 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pickResult(110);
      logInfo(`pickResult(index=110): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CitySearchStatePickResult_0027 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_RESULT_0028
     * @tc.name      CitySearch_CitySearchStatePickResult_0028
     * @tc.desc      CitySearchState.pickResult(index=115) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePickResult_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePickResult_0028 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pickResult(115);
      logInfo(`pickResult(index=115): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CitySearchStatePickResult_0028 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_RESULT_0029
     * @tc.name      CitySearch_CitySearchStatePickResult_0029
     * @tc.desc      CitySearchState.pickResult(index=120) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePickResult_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePickResult_0029 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pickResult(120);
      logInfo(`pickResult(index=120): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CitySearchStatePickResult_0029 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_RESULT_0030
     * @tc.name      CitySearch_CitySearchStatePickResult_0030
     * @tc.desc      CitySearchState.pickResult(index=125) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePickResult_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePickResult_0030 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pickResult(125);
      logInfo(`pickResult(index=125): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CitySearchStatePickResult_0030 end`);
    });
  });
}
