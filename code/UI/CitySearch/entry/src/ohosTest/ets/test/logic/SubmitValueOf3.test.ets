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
import { submitValueOf } from '../model/CitySearchLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CitySearch]';
const BUNDLE: string = 'CitySearch_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for submitValueOf (60 cases). */
export default function submitValueOf3Test(): void {
  describe('SubmitValueOf3Test', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0193
     * @tc.name      CitySearch_SubmitValueOf_0193
     * @tc.desc      submitValueOf(value=" ", placeholder="x123") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0193 begin`);
      const actual: string = submitValueOf(' ', 'x123');
      logInfo(`submitValueOf(value=" ", placeholder="x123"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0193 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0194
     * @tc.name      CitySearch_SubmitValueOf_0194
     * @tc.desc      submitValueOf(value=" ", placeholder="1yiYDipj") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0194 begin`);
      const actual: string = submitValueOf(' ', '1yiYDipj');
      logInfo(`submitValueOf(value=" ", placeholder="1yi...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0194 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0195
     * @tc.name      CitySearch_SubmitValueOf_0195
     * @tc.desc      submitValueOf(value=" ", placeholder="4UfKKj") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0195 begin`);
      const actual: string = submitValueOf(' ', '4UfKKj');
      logInfo(`submitValueOf(value=" ", placeholder="4Uf...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0195 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0196
     * @tc.name      CitySearch_SubmitValueOf_0196
     * @tc.desc      submitValueOf(value=" ", placeholder="Q8") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0196 begin`);
      const actual: string = submitValueOf(' ', 'Q8');
      logInfo(`submitValueOf(value=" ", placeholder="Q8"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0196 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0197
     * @tc.name      CitySearch_SubmitValueOf_0197
     * @tc.desc      submitValueOf(value=" ", placeholder="nfWpMiFnCe") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0197 begin`);
      const actual: string = submitValueOf(' ', 'nfWpMiFnCe');
      logInfo(`submitValueOf(value=" ", placeholder="nfW...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0197 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0198
     * @tc.name      CitySearch_SubmitValueOf_0198
     * @tc.desc      submitValueOf(value=" ", placeholder="45gcO") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0198 begin`);
      const actual: string = submitValueOf(' ', '45gcO');
      logInfo(`submitValueOf(value=" ", placeholder="45g...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0198 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0199
     * @tc.name      CitySearch_SubmitValueOf_0199
     * @tc.desc      submitValueOf(value=" ", placeholder="Br") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0199 begin`);
      const actual: string = submitValueOf(' ', 'Br');
      logInfo(`submitValueOf(value=" ", placeholder="Br"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0199 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0200
     * @tc.name      CitySearch_SubmitValueOf_0200
     * @tc.desc      submitValueOf(value=" ", placeholder="S4nwI2C") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0200 begin`);
      const actual: string = submitValueOf(' ', 'S4nwI2C');
      logInfo(`submitValueOf(value=" ", placeholder="S4n...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0200 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0201
     * @tc.name      CitySearch_SubmitValueOf_0201
     * @tc.desc      submitValueOf(value=" ", placeholder="1k8F") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0201 begin`);
      const actual: string = submitValueOf(' ', '1k8F');
      logInfo(`submitValueOf(value=" ", placeholder="1k8F"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0201 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0202
     * @tc.name      CitySearch_SubmitValueOf_0202
     * @tc.desc      submitValueOf(value=" ", placeholder="J68Wrt1IGFi7") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0202 begin`);
      const actual: string = submitValueOf(' ', 'J68Wrt1IGFi7');
      logInfo(`submitValueOf(value=" ", placeholder="J68...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0202 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0203
     * @tc.name      CitySearch_SubmitValueOf_0203
     * @tc.desc      submitValueOf(value=" ", placeholder="Fcr") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0203 begin`);
      const actual: string = submitValueOf(' ', 'Fcr');
      logInfo(`submitValueOf(value=" ", placeholder="Fcr"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0203 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0204
     * @tc.name      CitySearch_SubmitValueOf_0204
     * @tc.desc      submitValueOf(value=" ", placeholder="PqZ8ye") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0204 begin`);
      const actual: string = submitValueOf(' ', 'PqZ8ye');
      logInfo(`submitValueOf(value=" ", placeholder="PqZ...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0204 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0205
     * @tc.name      CitySearch_SubmitValueOf_0205
     * @tc.desc      submitValueOf(value=" ", placeholder="hyJZ1X") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0205 begin`);
      const actual: string = submitValueOf(' ', 'hyJZ1X');
      logInfo(`submitValueOf(value=" ", placeholder="hyJ...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0205 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0206
     * @tc.name      CitySearch_SubmitValueOf_0206
     * @tc.desc      submitValueOf(value=" ", placeholder="AAZGWesb") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0206 begin`);
      const actual: string = submitValueOf(' ', 'AAZGWesb');
      logInfo(`submitValueOf(value=" ", placeholder="AAZ...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0206 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0207
     * @tc.name      CitySearch_SubmitValueOf_0207
     * @tc.desc      submitValueOf(value=" ", placeholder="M") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0207 begin`);
      const actual: string = submitValueOf(' ', 'M');
      logInfo(`submitValueOf(value=" ", placeholder="M"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0207 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0208
     * @tc.name      CitySearch_SubmitValueOf_0208
     * @tc.desc      submitValueOf(value=" ", placeholder="NnBEpA1PeFW") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0208 begin`);
      const actual: string = submitValueOf(' ', 'NnBEpA1PeFW');
      logInfo(`submitValueOf(value=" ", placeholder="NnB...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0208 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0209
     * @tc.name      CitySearch_SubmitValueOf_0209
     * @tc.desc      submitValueOf(value=" ", placeholder="lL9A6v2eCpr") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0209 begin`);
      const actual: string = submitValueOf(' ', 'lL9A6v2eCpr');
      logInfo(`submitValueOf(value=" ", placeholder="lL9...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0209 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0210
     * @tc.name      CitySearch_SubmitValueOf_0210
     * @tc.desc      submitValueOf(value=" ", placeholder="jtXz3X") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0210 begin`);
      const actual: string = submitValueOf(' ', 'jtXz3X');
      logInfo(`submitValueOf(value=" ", placeholder="jtX...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0210 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0211
     * @tc.name      CitySearch_SubmitValueOf_0211
     * @tc.desc      submitValueOf(value=" ", placeholder="aA5LOQkoOgD8") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0211 begin`);
      const actual: string = submitValueOf(' ', 'aA5LOQkoOgD8');
      logInfo(`submitValueOf(value=" ", placeholder="aA5...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0211 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0212
     * @tc.name      CitySearch_SubmitValueOf_0212
     * @tc.desc      submitValueOf(value=" ", placeholder="ixNlT6jmrr5r") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0212 begin`);
      const actual: string = submitValueOf(' ', 'ixNlT6jmrr5r');
      logInfo(`submitValueOf(value=" ", placeholder="ixN...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0212 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0213
     * @tc.name      CitySearch_SubmitValueOf_0213
     * @tc.desc      submitValueOf(value=" ", placeholder="KJzqE") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0213 begin`);
      const actual: string = submitValueOf(' ', 'KJzqE');
      logInfo(`submitValueOf(value=" ", placeholder="KJz...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0213 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0214
     * @tc.name      CitySearch_SubmitValueOf_0214
     * @tc.desc      submitValueOf(value=" ", placeholder="ecWgoCV1fWD") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0214 begin`);
      const actual: string = submitValueOf(' ', 'ecWgoCV1fWD');
      logInfo(`submitValueOf(value=" ", placeholder="ecW...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0214 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0215
     * @tc.name      CitySearch_SubmitValueOf_0215
     * @tc.desc      submitValueOf(value=" ", placeholder="lz0Ex") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0215 begin`);
      const actual: string = submitValueOf(' ', 'lz0Ex');
      logInfo(`submitValueOf(value=" ", placeholder="lz0...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0215 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0216
     * @tc.name      CitySearch_SubmitValueOf_0216
     * @tc.desc      submitValueOf(value="A", placeholder="a") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0216 begin`);
      const actual: string = submitValueOf('A', 'a');
      logInfo(`submitValueOf(value="A", placeholder="a"): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0216 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0217
     * @tc.name      CitySearch_SubmitValueOf_0217
     * @tc.desc      submitValueOf(value="A", placeholder="abc") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0217 begin`);
      const actual: string = submitValueOf('A', 'abc');
      logInfo(`submitValueOf(value="A", placeholder="abc"): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0217 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0218
     * @tc.name      CitySearch_SubmitValueOf_0218
     * @tc.desc      submitValueOf(value="A", placeholder="Hello World") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0218 begin`);
      const actual: string = submitValueOf('A', 'Hello World');
      logInfo(`submitValueOf(value="A", placeholder="Hel...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0218 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0219
     * @tc.name      CitySearch_SubmitValueOf_0219
     * @tc.desc      submitValueOf(value="A", placeholder=" ") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0219 begin`);
      const actual: string = submitValueOf('A', ' ');
      logInfo(`submitValueOf(value="A", placeholder=" "): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0219 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0220
     * @tc.name      CitySearch_SubmitValueOf_0220
     * @tc.desc      submitValueOf(value="A", placeholder="123") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0220 begin`);
      const actual: string = submitValueOf('A', '123');
      logInfo(`submitValueOf(value="A", placeholder="123"): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0220 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0221
     * @tc.name      CitySearch_SubmitValueOf_0221
     * @tc.desc      submitValueOf(value="A", placeholder=" a ") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0221 begin`);
      const actual: string = submitValueOf('A', ' a ');
      logInfo(`submitValueOf(value="A", placeholder=" a "): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0221 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0222
     * @tc.name      CitySearch_SubmitValueOf_0222
     * @tc.desc      submitValueOf(value="A", placeholder="aa") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0222 begin`);
      const actual: string = submitValueOf('A', 'aa');
      logInfo(`submitValueOf(value="A", placeholder="aa"): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0222 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0223
     * @tc.name      CitySearch_SubmitValueOf_0223
     * @tc.desc      submitValueOf(value="A", placeholder="a_1") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0223 begin`);
      const actual: string = submitValueOf('A', 'a_1');
      logInfo(`submitValueOf(value="A", placeholder="a_1"): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0223 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0224
     * @tc.name      CitySearch_SubmitValueOf_0224
     * @tc.desc      submitValueOf(value="A", placeholder="xa") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0224 begin`);
      const actual: string = submitValueOf('A', 'xa');
      logInfo(`submitValueOf(value="A", placeholder="xa"): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0224 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0225
     * @tc.name      CitySearch_SubmitValueOf_0225
     * @tc.desc      submitValueOf(value="A", placeholder=" abc ") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0225 begin`);
      const actual: string = submitValueOf('A', ' abc ');
      logInfo(`submitValueOf(value="A", placeholder=" ab...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0225 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0226
     * @tc.name      CitySearch_SubmitValueOf_0226
     * @tc.desc      submitValueOf(value="A", placeholder="abcabc") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0226 begin`);
      const actual: string = submitValueOf('A', 'abcabc');
      logInfo(`submitValueOf(value="A", placeholder="abc...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0226 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0227
     * @tc.name      CitySearch_SubmitValueOf_0227
     * @tc.desc      submitValueOf(value="A", placeholder="abc_1") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0227 begin`);
      const actual: string = submitValueOf('A', 'abc_1');
      logInfo(`submitValueOf(value="A", placeholder="abc...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0227 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0228
     * @tc.name      CitySearch_SubmitValueOf_0228
     * @tc.desc      submitValueOf(value="A", placeholder="xabc") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0228 begin`);
      const actual: string = submitValueOf('A', 'xabc');
      logInfo(`submitValueOf(value="A", placeholder="xabc"): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0228 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0229
     * @tc.name      CitySearch_SubmitValueOf_0229
     * @tc.desc      submitValueOf(value="A", placeholder=" Hello World ") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0229 begin`);
      const actual: string = submitValueOf('A', ' Hello World ');
      logInfo(`submitValueOf(value="A", placeholder=" He...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0229 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0230
     * @tc.name      CitySearch_SubmitValueOf_0230
     * @tc.desc      submitValueOf(value="A", placeholder="Hello WorldHello World") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0230 begin`);
      const actual: string = submitValueOf('A', 'Hello WorldHello World');
      logInfo(`submitValueOf(value="A", placeholder="Hel...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0230 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0231
     * @tc.name      CitySearch_SubmitValueOf_0231
     * @tc.desc      submitValueOf(value="A", placeholder="Hello World_1") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0231 begin`);
      const actual: string = submitValueOf('A', 'Hello World_1');
      logInfo(`submitValueOf(value="A", placeholder="Hel...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0231 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0232
     * @tc.name      CitySearch_SubmitValueOf_0232
     * @tc.desc      submitValueOf(value="A", placeholder="xHello World") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0232 begin`);
      const actual: string = submitValueOf('A', 'xHello World');
      logInfo(`submitValueOf(value="A", placeholder="xHe...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0232 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0233
     * @tc.name      CitySearch_SubmitValueOf_0233
     * @tc.desc      submitValueOf(value="A", placeholder="   ") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0233 begin`);
      const actual: string = submitValueOf('A', '   ');
      logInfo(`submitValueOf(value="A", placeholder="   "): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0233 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0234
     * @tc.name      CitySearch_SubmitValueOf_0234
     * @tc.desc      submitValueOf(value="A", placeholder="  ") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0234 begin`);
      const actual: string = submitValueOf('A', '  ');
      logInfo(`submitValueOf(value="A", placeholder="  "): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0234 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0235
     * @tc.name      CitySearch_SubmitValueOf_0235
     * @tc.desc      submitValueOf(value="A", placeholder=" _1") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0235 begin`);
      const actual: string = submitValueOf('A', ' _1');
      logInfo(`submitValueOf(value="A", placeholder=" _1"): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0235 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0236
     * @tc.name      CitySearch_SubmitValueOf_0236
     * @tc.desc      submitValueOf(value="A", placeholder="x ") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0236 begin`);
      const actual: string = submitValueOf('A', 'x ');
      logInfo(`submitValueOf(value="A", placeholder="x "): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0236 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0237
     * @tc.name      CitySearch_SubmitValueOf_0237
     * @tc.desc      submitValueOf(value="A", placeholder=" 123 ") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0237 begin`);
      const actual: string = submitValueOf('A', ' 123 ');
      logInfo(`submitValueOf(value="A", placeholder=" 12...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0237 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0238
     * @tc.name      CitySearch_SubmitValueOf_0238
     * @tc.desc      submitValueOf(value="A", placeholder="123123") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0238 begin`);
      const actual: string = submitValueOf('A', '123123');
      logInfo(`submitValueOf(value="A", placeholder="123...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0238 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0239
     * @tc.name      CitySearch_SubmitValueOf_0239
     * @tc.desc      submitValueOf(value="A", placeholder="123_1") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0239 begin`);
      const actual: string = submitValueOf('A', '123_1');
      logInfo(`submitValueOf(value="A", placeholder="123...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0239 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0240
     * @tc.name      CitySearch_SubmitValueOf_0240
     * @tc.desc      submitValueOf(value="A", placeholder="x123") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0240 begin`);
      const actual: string = submitValueOf('A', 'x123');
      logInfo(`submitValueOf(value="A", placeholder="x123"): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0240 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0241
     * @tc.name      CitySearch_SubmitValueOf_0241
     * @tc.desc      submitValueOf(value="A", placeholder="1yiYDipj") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0241 begin`);
      const actual: string = submitValueOf('A', '1yiYDipj');
      logInfo(`submitValueOf(value="A", placeholder="1yi...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0241 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0242
     * @tc.name      CitySearch_SubmitValueOf_0242
     * @tc.desc      submitValueOf(value="A", placeholder="4UfKKj") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0242 begin`);
      const actual: string = submitValueOf('A', '4UfKKj');
      logInfo(`submitValueOf(value="A", placeholder="4Uf...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0242 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0243
     * @tc.name      CitySearch_SubmitValueOf_0243
     * @tc.desc      submitValueOf(value="A", placeholder="Q8") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0243 begin`);
      const actual: string = submitValueOf('A', 'Q8');
      logInfo(`submitValueOf(value="A", placeholder="Q8"): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0243 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0244
     * @tc.name      CitySearch_SubmitValueOf_0244
     * @tc.desc      submitValueOf(value="A", placeholder="nfWpMiFnCe") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0244 begin`);
      const actual: string = submitValueOf('A', 'nfWpMiFnCe');
      logInfo(`submitValueOf(value="A", placeholder="nfW...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0244 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0245
     * @tc.name      CitySearch_SubmitValueOf_0245
     * @tc.desc      submitValueOf(value="A", placeholder="45gcO") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0245 begin`);
      const actual: string = submitValueOf('A', '45gcO');
      logInfo(`submitValueOf(value="A", placeholder="45g...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0245 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0246
     * @tc.name      CitySearch_SubmitValueOf_0246
     * @tc.desc      submitValueOf(value="A", placeholder="Br") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0246 begin`);
      const actual: string = submitValueOf('A', 'Br');
      logInfo(`submitValueOf(value="A", placeholder="Br"): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0246 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0247
     * @tc.name      CitySearch_SubmitValueOf_0247
     * @tc.desc      submitValueOf(value="A", placeholder="S4nwI2C") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0247 begin`);
      const actual: string = submitValueOf('A', 'S4nwI2C');
      logInfo(`submitValueOf(value="A", placeholder="S4n...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0247 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0248
     * @tc.name      CitySearch_SubmitValueOf_0248
     * @tc.desc      submitValueOf(value="A", placeholder="1k8F") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0248 begin`);
      const actual: string = submitValueOf('A', '1k8F');
      logInfo(`submitValueOf(value="A", placeholder="1k8F"): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0248 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0249
     * @tc.name      CitySearch_SubmitValueOf_0249
     * @tc.desc      submitValueOf(value="A", placeholder="J68Wrt1IGFi7") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0249 begin`);
      const actual: string = submitValueOf('A', 'J68Wrt1IGFi7');
      logInfo(`submitValueOf(value="A", placeholder="J68...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0249 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0250
     * @tc.name      CitySearch_SubmitValueOf_0250
     * @tc.desc      submitValueOf(value="A", placeholder="Fcr") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0250 begin`);
      const actual: string = submitValueOf('A', 'Fcr');
      logInfo(`submitValueOf(value="A", placeholder="Fcr"): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0250 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0251
     * @tc.name      CitySearch_SubmitValueOf_0251
     * @tc.desc      submitValueOf(value="A", placeholder="PqZ8ye") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0251 begin`);
      const actual: string = submitValueOf('A', 'PqZ8ye');
      logInfo(`submitValueOf(value="A", placeholder="PqZ...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0251 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0252
     * @tc.name      CitySearch_SubmitValueOf_0252
     * @tc.desc      submitValueOf(value="A", placeholder="hyJZ1X") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0252 begin`);
      const actual: string = submitValueOf('A', 'hyJZ1X');
      logInfo(`submitValueOf(value="A", placeholder="hyJ...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0252 end`);
    });
  });
}
