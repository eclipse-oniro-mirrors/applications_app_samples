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

/** Logic checks for CitySearchState.submit (48 cases). */
export default function citySearchStateSubmit3Test(): void {
  describe('CitySearchStateSubmit3Test', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0133
     * @tc.name      CitySearch_CitySearchStateSubmit_0133
     * @tc.desc      CitySearchState.submit(value="6fw1OGndM") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0133 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('6fw1OGndM');
      logInfo(`submit(value="6fw1OGndM"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="6fw1OGndM") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('6fw1OGndM');
      logInfo(`submit(value="6fw1OGndM") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="6fw1OGndM") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0133 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0134
     * @tc.name      CitySearch_CitySearchStateSubmit_0134
     * @tc.desc      CitySearchState.submit(value="s546pn") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0134 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('s546pn');
      logInfo(`submit(value="s546pn"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="s546pn") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('s546pn');
      logInfo(`submit(value="s546pn") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="s546pn") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0134 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0135
     * @tc.name      CitySearch_CitySearchStateSubmit_0135
     * @tc.desc      CitySearchState.submit(value="g44BfTnGkaCx") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0135 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('g44BfTnGkaCx');
      logInfo(`submit(value="g44BfTnGkaCx"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="g44BfTnGkaCx") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('g44BfTnGkaCx');
      logInfo(`submit(value="g44BfTnGkaCx") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="g44BfTnGkaCx") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0135 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0136
     * @tc.name      CitySearch_CitySearchStateSubmit_0136
     * @tc.desc      CitySearchState.submit(value="zApH") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0136 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('zApH');
      logInfo(`submit(value="zApH"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="zApH") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('zApH');
      logInfo(`submit(value="zApH") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="zApH") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0136 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0137
     * @tc.name      CitySearch_CitySearchStateSubmit_0137
     * @tc.desc      CitySearchState.submit(value="sxHdStscq6") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0137 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('sxHdStscq6');
      logInfo(`submit(value="sxHdStscq6"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="sxHdStscq6") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('sxHdStscq6');
      logInfo(`submit(value="sxHdStscq6") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="sxHdStscq6") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0137 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0138
     * @tc.name      CitySearch_CitySearchStateSubmit_0138
     * @tc.desc      CitySearchState.submit(value="UPzS") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0138 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('UPzS');
      logInfo(`submit(value="UPzS"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="UPzS") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('UPzS');
      logInfo(`submit(value="UPzS") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="UPzS") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0138 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0139
     * @tc.name      CitySearch_CitySearchStateSubmit_0139
     * @tc.desc      CitySearchState.submit(value="Xo9bjI5PqFg") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0139 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('Xo9bjI5PqFg');
      logInfo(`submit(value="Xo9bjI5PqFg"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="Xo9bjI5PqFg") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Xo9bjI5PqFg');
      logInfo(`submit(value="Xo9bjI5PqFg") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="Xo9bjI5PqFg") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0139 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0140
     * @tc.name      CitySearch_CitySearchStateSubmit_0140
     * @tc.desc      CitySearchState.submit(value="I") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0140 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('I');
      logInfo(`submit(value="I"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="I") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('I');
      logInfo(`submit(value="I") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="I") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0140 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0141
     * @tc.name      CitySearch_CitySearchStateSubmit_0141
     * @tc.desc      CitySearchState.submit(value="xf7eKo6D") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0141 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('xf7eKo6D');
      logInfo(`submit(value="xf7eKo6D"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="xf7eKo6D") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('xf7eKo6D');
      logInfo(`submit(value="xf7eKo6D") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="xf7eKo6D") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0141 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0142
     * @tc.name      CitySearch_CitySearchStateSubmit_0142
     * @tc.desc      CitySearchState.submit(value="CCK85T") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0142 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('CCK85T');
      logInfo(`submit(value="CCK85T"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="CCK85T") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('CCK85T');
      logInfo(`submit(value="CCK85T") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="CCK85T") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0142 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0143
     * @tc.name      CitySearch_CitySearchStateSubmit_0143
     * @tc.desc      CitySearchState.submit(value="pnYKJZyR9P") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0143 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('pnYKJZyR9P');
      logInfo(`submit(value="pnYKJZyR9P"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="pnYKJZyR9P") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('pnYKJZyR9P');
      logInfo(`submit(value="pnYKJZyR9P") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="pnYKJZyR9P") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0143 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0144
     * @tc.name      CitySearch_CitySearchStateSubmit_0144
     * @tc.desc      CitySearchState.submit(value="FSoQ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0144 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('FSoQ');
      logInfo(`submit(value="FSoQ"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="FSoQ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('FSoQ');
      logInfo(`submit(value="FSoQ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="FSoQ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0144 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0145
     * @tc.name      CitySearch_CitySearchStateSubmit_0145
     * @tc.desc      CitySearchState.submit(value="mTZV") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0145 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('mTZV');
      logInfo(`submit(value="mTZV"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="mTZV") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('mTZV');
      logInfo(`submit(value="mTZV") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="mTZV") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0145 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0146
     * @tc.name      CitySearch_CitySearchStateSubmit_0146
     * @tc.desc      CitySearchState.submit(value="CJ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0146 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('CJ');
      logInfo(`submit(value="CJ"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="CJ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('CJ');
      logInfo(`submit(value="CJ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="CJ") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0146 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0147
     * @tc.name      CitySearch_CitySearchStateSubmit_0147
     * @tc.desc      CitySearchState.submit(value="Y") yields 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0147 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('Y');
      logInfo(`submit(value="Y"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`submit(value="Y") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Y');
      logInfo(`submit(value="Y") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="Y") state: subject.searchList.length=${subject.searchList.length}`);
      expect(subject.searchList.length).assertEqual(6);
      logInfo(`submit(value="Y") state: JSON.stringify(subject.se...${JSON.stringify(subject.searchList.slice(0, 3))}`);
      expect(JSON.stringify(subject.searchList.slice(0, 3)))
        .assertEqual('["\u94f6\u5ddd","\u5ef6\u5409","\u5b9c\u660c"]');
      logInfo(`submit(value="Y") state: JSON.stringify(subject.se...${JSON.stringify(subject.searchList.slice(3, 6))}`);
      expect(JSON.stringify(subject.searchList.slice(3, 6)))
        .assertEqual('["\u5ef6\u8fb9","\u626c\u5dde","\u70df\u53f0"]');
      logInfo(`${BUNDLE}CitySearchStateSubmit_0147 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0148
     * @tc.name      CitySearch_CitySearchStateSubmit_0148
     * @tc.desc      CitySearchState.submit(value="8x9qIKj76hxm") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0148 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('8x9qIKj76hxm');
      logInfo(`submit(value="8x9qIKj76hxm"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="8x9qIKj76hxm") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('8x9qIKj76hxm');
      logInfo(`submit(value="8x9qIKj76hxm") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="8x9qIKj76hxm") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0148 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0149
     * @tc.name      CitySearch_CitySearchStateSubmit_0149
     * @tc.desc      CitySearchState.submit(value="X8vmQXGbG") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0149 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('X8vmQXGbG');
      logInfo(`submit(value="X8vmQXGbG"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="X8vmQXGbG") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('X8vmQXGbG');
      logInfo(`submit(value="X8vmQXGbG") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="X8vmQXGbG") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0149 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0150
     * @tc.name      CitySearch_CitySearchStateSubmit_0150
     * @tc.desc      CitySearchState.submit(value="NC") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0150 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('NC');
      logInfo(`submit(value="NC"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="NC") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('NC');
      logInfo(`submit(value="NC") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="NC") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0150 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0151
     * @tc.name      CitySearch_CitySearchStateSubmit_0151
     * @tc.desc      CitySearchState.submit(value="EOvzoQqv93Xa") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0151 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('EOvzoQqv93Xa');
      logInfo(`submit(value="EOvzoQqv93Xa"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="EOvzoQqv93Xa") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('EOvzoQqv93Xa');
      logInfo(`submit(value="EOvzoQqv93Xa") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="EOvzoQqv93Xa") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0151 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0152
     * @tc.name      CitySearch_CitySearchStateSubmit_0152
     * @tc.desc      CitySearchState.submit(value="m8UbE") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0152 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('m8UbE');
      logInfo(`submit(value="m8UbE"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="m8UbE") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('m8UbE');
      logInfo(`submit(value="m8UbE") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="m8UbE") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0152 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0153
     * @tc.name      CitySearch_CitySearchStateSubmit_0153
     * @tc.desc      CitySearchState.submit(value="0XsDrdhw") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0153 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('0XsDrdhw');
      logInfo(`submit(value="0XsDrdhw"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="0XsDrdhw") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('0XsDrdhw');
      logInfo(`submit(value="0XsDrdhw") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="0XsDrdhw") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0153 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0154
     * @tc.name      CitySearch_CitySearchStateSubmit_0154
     * @tc.desc      CitySearchState.submit(value="ugc1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0154 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('ugc1');
      logInfo(`submit(value="ugc1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="ugc1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('ugc1');
      logInfo(`submit(value="ugc1") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="ugc1") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0154 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0155
     * @tc.name      CitySearch_CitySearchStateSubmit_0155
     * @tc.desc      CitySearchState.submit(value="obq") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0155 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('obq');
      logInfo(`submit(value="obq"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="obq") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('obq');
      logInfo(`submit(value="obq") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="obq") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0155 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0156
     * @tc.name      CitySearch_CitySearchStateSubmit_0156
     * @tc.desc      CitySearchState.submit(value="pJukfu1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0156 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('pJukfu1');
      logInfo(`submit(value="pJukfu1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="pJukfu1") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('pJukfu1');
      logInfo(`submit(value="pJukfu1") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="pJukfu1") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0156 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0157
     * @tc.name      CitySearch_CitySearchStateSubmit_0157
     * @tc.desc      CitySearchState.submit(value="9L6EfTZXtH") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0157 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('9L6EfTZXtH');
      logInfo(`submit(value="9L6EfTZXtH"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="9L6EfTZXtH") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('9L6EfTZXtH');
      logInfo(`submit(value="9L6EfTZXtH") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="9L6EfTZXtH") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0157 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0158
     * @tc.name      CitySearch_CitySearchStateSubmit_0158
     * @tc.desc      CitySearchState.submit(value="g") yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0158 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('g');
      logInfo(`submit(value="g"): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`submit(value="g") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('g');
      logInfo(`submit(value="g") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="g") state: subject.searchList.length=${subject.searchList.length}`);
      expect(subject.searchList.length).assertEqual(4);
      logInfo(`submit(value="g") state: JSON.stringify(subject.searchList)=${JSON.stringify(subject.searchList)}`);
      expect(JSON.stringify(subject.searchList))
        .assertEqual('["\u5e7f\u5dde","\u6842\u6797","\u8d63\u5dde","\u9ad8\u96c4"]');
      logInfo(`${BUNDLE}CitySearchStateSubmit_0158 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0159
     * @tc.name      CitySearch_CitySearchStateSubmit_0159
     * @tc.desc      CitySearchState.submit(value="EseWYUUTcsfb") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0159 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('EseWYUUTcsfb');
      logInfo(`submit(value="EseWYUUTcsfb"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="EseWYUUTcsfb") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('EseWYUUTcsfb');
      logInfo(`submit(value="EseWYUUTcsfb") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="EseWYUUTcsfb") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0159 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0160
     * @tc.name      CitySearch_CitySearchStateSubmit_0160
     * @tc.desc      CitySearchState.submit(value="HCv") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0160 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('HCv');
      logInfo(`submit(value="HCv"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="HCv") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('HCv');
      logInfo(`submit(value="HCv") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="HCv") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0160 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0161
     * @tc.name      CitySearch_CitySearchStateSubmit_0161
     * @tc.desc      CitySearchState.submit(value="S0oEzA") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0161 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('S0oEzA');
      logInfo(`submit(value="S0oEzA"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="S0oEzA") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('S0oEzA');
      logInfo(`submit(value="S0oEzA") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="S0oEzA") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0161 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0162
     * @tc.name      CitySearch_CitySearchStateSubmit_0162
     * @tc.desc      CitySearchState.submit(value="inRbwNmV8ok") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0162 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('inRbwNmV8ok');
      logInfo(`submit(value="inRbwNmV8ok"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="inRbwNmV8ok") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('inRbwNmV8ok');
      logInfo(`submit(value="inRbwNmV8ok") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="inRbwNmV8ok") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0162 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0163
     * @tc.name      CitySearch_CitySearchStateSubmit_0163
     * @tc.desc      CitySearchState.submit(value="Zm") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0163 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('Zm');
      logInfo(`submit(value="Zm"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="Zm") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Zm');
      logInfo(`submit(value="Zm") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="Zm") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0163 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0164
     * @tc.name      CitySearch_CitySearchStateSubmit_0164
     * @tc.desc      CitySearchState.submit(value="JK") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0164 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('JK');
      logInfo(`submit(value="JK"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="JK") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('JK');
      logInfo(`submit(value="JK") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="JK") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0164 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0165
     * @tc.name      CitySearch_CitySearchStateSubmit_0165
     * @tc.desc      CitySearchState.submit(value="7rm7osqh5RT") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0165 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('7rm7osqh5RT');
      logInfo(`submit(value="7rm7osqh5RT"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="7rm7osqh5RT") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('7rm7osqh5RT');
      logInfo(`submit(value="7rm7osqh5RT") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="7rm7osqh5RT") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0165 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0166
     * @tc.name      CitySearch_CitySearchStateSubmit_0166
     * @tc.desc      CitySearchState.submit(value="0") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0166 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('0');
      logInfo(`submit(value="0"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="0") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('0');
      logInfo(`submit(value="0") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="0") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0166 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0167
     * @tc.name      CitySearch_CitySearchStateSubmit_0167
     * @tc.desc      CitySearchState.submit(value="VI3") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0167 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('VI3');
      logInfo(`submit(value="VI3"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="VI3") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('VI3');
      logInfo(`submit(value="VI3") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="VI3") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0167 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0168
     * @tc.name      CitySearch_CitySearchStateSubmit_0168
     * @tc.desc      CitySearchState.submit(value="DXS0AGY") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0168 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('DXS0AGY');
      logInfo(`submit(value="DXS0AGY"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="DXS0AGY") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('DXS0AGY');
      logInfo(`submit(value="DXS0AGY") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="DXS0AGY") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0168 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0169
     * @tc.name      CitySearch_CitySearchStateSubmit_0169
     * @tc.desc      CitySearchState.submit(value="VHwHPbxD") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0169 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('VHwHPbxD');
      logInfo(`submit(value="VHwHPbxD"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="VHwHPbxD") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('VHwHPbxD');
      logInfo(`submit(value="VHwHPbxD") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="VHwHPbxD") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0169 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0170
     * @tc.name      CitySearch_CitySearchStateSubmit_0170
     * @tc.desc      CitySearchState.submit(value="TqO") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0170 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('TqO');
      logInfo(`submit(value="TqO"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="TqO") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('TqO');
      logInfo(`submit(value="TqO") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="TqO") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0170 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0171
     * @tc.name      CitySearch_CitySearchStateSubmit_0171
     * @tc.desc      CitySearchState.submit(value="pCqxp1Q") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0171 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('pCqxp1Q');
      logInfo(`submit(value="pCqxp1Q"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="pCqxp1Q") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('pCqxp1Q');
      logInfo(`submit(value="pCqxp1Q") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="pCqxp1Q") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0171 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0172
     * @tc.name      CitySearch_CitySearchStateSubmit_0172
     * @tc.desc      CitySearchState.submit(value="f") yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0172 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('f');
      logInfo(`submit(value="f"): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`submit(value="f") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('f');
      logInfo(`submit(value="f") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="f") state: subject.searchList.length=${subject.searchList.length}`);
      expect(subject.searchList.length).assertEqual(4);
      logInfo(`submit(value="f") state: JSON.stringify(subject.searchList)=${JSON.stringify(subject.searchList)}`);
      expect(JSON.stringify(subject.searchList))
        .assertEqual('["\u798f\u5dde","\u961c\u9633","\u4f5b\u5c71","\u629a\u987a"]');
      logInfo(`${BUNDLE}CitySearchStateSubmit_0172 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0173
     * @tc.name      CitySearch_CitySearchStateSubmit_0173
     * @tc.desc      CitySearchState.submit(value="l4eOlh3tGb0n") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0173 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('l4eOlh3tGb0n');
      logInfo(`submit(value="l4eOlh3tGb0n"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="l4eOlh3tGb0n") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('l4eOlh3tGb0n');
      logInfo(`submit(value="l4eOlh3tGb0n") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="l4eOlh3tGb0n") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0173 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0174
     * @tc.name      CitySearch_CitySearchStateSubmit_0174
     * @tc.desc      CitySearchState.submit(value="sQCJb") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0174 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('sQCJb');
      logInfo(`submit(value="sQCJb"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="sQCJb") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('sQCJb');
      logInfo(`submit(value="sQCJb") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="sQCJb") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0174 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0175
     * @tc.name      CitySearch_CitySearchStateSubmit_0175
     * @tc.desc      CitySearchState.submit(value="KG") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0175 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('KG');
      logInfo(`submit(value="KG"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="KG") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('KG');
      logInfo(`submit(value="KG") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="KG") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0175 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0176
     * @tc.name      CitySearch_CitySearchStateSubmit_0176
     * @tc.desc      CitySearchState.submit(value="1uZE") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0176 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('1uZE');
      logInfo(`submit(value="1uZE"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="1uZE") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('1uZE');
      logInfo(`submit(value="1uZE") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="1uZE") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0176 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0177
     * @tc.name      CitySearch_CitySearchStateSubmit_0177
     * @tc.desc      CitySearchState.submit(value="vl5UbIVpk") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0177 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('vl5UbIVpk');
      logInfo(`submit(value="vl5UbIVpk"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="vl5UbIVpk") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('vl5UbIVpk');
      logInfo(`submit(value="vl5UbIVpk") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="vl5UbIVpk") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0177 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0178
     * @tc.name      CitySearch_CitySearchStateSubmit_0178
     * @tc.desc      CitySearchState.submit(value="nN5NYt9Y") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0178 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('nN5NYt9Y');
      logInfo(`submit(value="nN5NYt9Y"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="nN5NYt9Y") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('nN5NYt9Y');
      logInfo(`submit(value="nN5NYt9Y") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="nN5NYt9Y") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0178 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0179
     * @tc.name      CitySearch_CitySearchStateSubmit_0179
     * @tc.desc      CitySearchState.submit(value="2tG8") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0179 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('2tG8');
      logInfo(`submit(value="2tG8"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="2tG8") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('2tG8');
      logInfo(`submit(value="2tG8") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="2tG8") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0179 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_SUBMIT_0180
     * @tc.name      CitySearch_CitySearchStateSubmit_0180
     * @tc.desc      CitySearchState.submit(value="HWMd") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateSubmit_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateSubmit_0180 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.submit('HWMd');
      logInfo(`submit(value="HWMd"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`submit(value="HWMd") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('HWMd');
      logInfo(`submit(value="HWMd") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit(value="HWMd") state: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateSubmit_0180 end`);
    });
  });
}
