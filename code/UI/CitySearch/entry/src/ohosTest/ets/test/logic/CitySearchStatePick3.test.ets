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

/** Logic checks for CitySearchState.pick (18 cases). */
export default function citySearchStatePick3Test(): void {
  describe('CitySearchStatePick3Test', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0163
     * @tc.name      CitySearch_CitySearchStatePick_0163
     * @tc.desc      CitySearchState.pick(name="04v") yields "04v"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0163 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('04v');
      logInfo(`pick(name="04v"): actual=${actual}`);
      expect(actual).assertEqual('04v');
      logInfo(`pick(name="04v") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('04v');
      logInfo(`${BUNDLE}CitySearchStatePick_0163 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0164
     * @tc.name      CitySearch_CitySearchStatePick_0164
     * @tc.desc      CitySearchState.pick(name="djH3") yields "djH3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0164 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('djH3');
      logInfo(`pick(name="djH3"): actual=${actual}`);
      expect(actual).assertEqual('djH3');
      logInfo(`pick(name="djH3") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('djH3');
      logInfo(`${BUNDLE}CitySearchStatePick_0164 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0165
     * @tc.name      CitySearch_CitySearchStatePick_0165
     * @tc.desc      CitySearchState.pick(name="R32YCswiOmT") yields "R32YCswiOmT"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0165 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('R32YCswiOmT');
      logInfo(`pick(name="R32YCswiOmT"): actual=${actual}`);
      expect(actual).assertEqual('R32YCswiOmT');
      logInfo(`pick(name="R32YCswiOmT") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('R32YCswiOmT');
      logInfo(`${BUNDLE}CitySearchStatePick_0165 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0166
     * @tc.name      CitySearch_CitySearchStatePick_0166
     * @tc.desc      CitySearchState.pick(name="5gTiDSo") yields "5gTiDSo"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0166 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('5gTiDSo');
      logInfo(`pick(name="5gTiDSo"): actual=${actual}`);
      expect(actual).assertEqual('5gTiDSo');
      logInfo(`pick(name="5gTiDSo") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('5gTiDSo');
      logInfo(`${BUNDLE}CitySearchStatePick_0166 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0167
     * @tc.name      CitySearch_CitySearchStatePick_0167
     * @tc.desc      CitySearchState.pick(name="FNfanmSp5") yields "FNfanmSp5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0167 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('FNfanmSp5');
      logInfo(`pick(name="FNfanmSp5"): actual=${actual}`);
      expect(actual).assertEqual('FNfanmSp5');
      logInfo(`pick(name="FNfanmSp5") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('FNfanmSp5');
      logInfo(`${BUNDLE}CitySearchStatePick_0167 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0168
     * @tc.name      CitySearch_CitySearchStatePick_0168
     * @tc.desc      CitySearchState.pick(name="Wl") yields "Wl"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0168 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('Wl');
      logInfo(`pick(name="Wl"): actual=${actual}`);
      expect(actual).assertEqual('Wl');
      logInfo(`pick(name="Wl") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Wl');
      logInfo(`${BUNDLE}CitySearchStatePick_0168 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0169
     * @tc.name      CitySearch_CitySearchStatePick_0169
     * @tc.desc      CitySearchState.pick(name="zMnMG") yields "zMnMG"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0169 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('zMnMG');
      logInfo(`pick(name="zMnMG"): actual=${actual}`);
      expect(actual).assertEqual('zMnMG');
      logInfo(`pick(name="zMnMG") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('zMnMG');
      logInfo(`${BUNDLE}CitySearchStatePick_0169 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0170
     * @tc.name      CitySearch_CitySearchStatePick_0170
     * @tc.desc      CitySearchState.pick(name="B") yields "B"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0170 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('B');
      logInfo(`pick(name="B"): actual=${actual}`);
      expect(actual).assertEqual('B');
      logInfo(`pick(name="B") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('B');
      logInfo(`${BUNDLE}CitySearchStatePick_0170 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0171
     * @tc.name      CitySearch_CitySearchStatePick_0171
     * @tc.desc      CitySearchState.pick(name="Gs") yields "Gs"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0171 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('Gs');
      logInfo(`pick(name="Gs"): actual=${actual}`);
      expect(actual).assertEqual('Gs');
      logInfo(`pick(name="Gs") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Gs');
      logInfo(`${BUNDLE}CitySearchStatePick_0171 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0172
     * @tc.name      CitySearch_CitySearchStatePick_0172
     * @tc.desc      CitySearchState.pick(name="ivvaFdT6SJ5") yields "ivvaFdT6SJ5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0172 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('ivvaFdT6SJ5');
      logInfo(`pick(name="ivvaFdT6SJ5"): actual=${actual}`);
      expect(actual).assertEqual('ivvaFdT6SJ5');
      logInfo(`pick(name="ivvaFdT6SJ5") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('ivvaFdT6SJ5');
      logInfo(`${BUNDLE}CitySearchStatePick_0172 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0173
     * @tc.name      CitySearch_CitySearchStatePick_0173
     * @tc.desc      CitySearchState.pick(name="oAwo") yields "oAwo"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0173 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('oAwo');
      logInfo(`pick(name="oAwo"): actual=${actual}`);
      expect(actual).assertEqual('oAwo');
      logInfo(`pick(name="oAwo") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('oAwo');
      logInfo(`${BUNDLE}CitySearchStatePick_0173 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0174
     * @tc.name      CitySearch_CitySearchStatePick_0174
     * @tc.desc      CitySearchState.pick(name="5zz6yKJYB") yields "5zz6yKJYB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0174 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('5zz6yKJYB');
      logInfo(`pick(name="5zz6yKJYB"): actual=${actual}`);
      expect(actual).assertEqual('5zz6yKJYB');
      logInfo(`pick(name="5zz6yKJYB") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('5zz6yKJYB');
      logInfo(`${BUNDLE}CitySearchStatePick_0174 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0175
     * @tc.name      CitySearch_CitySearchStatePick_0175
     * @tc.desc      CitySearchState.pick(name="hGkmq0TCoNVb") yields "hGkmq0TCoNVb"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0175 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('hGkmq0TCoNVb');
      logInfo(`pick(name="hGkmq0TCoNVb"): actual=${actual}`);
      expect(actual).assertEqual('hGkmq0TCoNVb');
      logInfo(`pick(name="hGkmq0TCoNVb") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('hGkmq0TCoNVb');
      logInfo(`${BUNDLE}CitySearchStatePick_0175 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0176
     * @tc.name      CitySearch_CitySearchStatePick_0176
     * @tc.desc      CitySearchState.pick(name="Y") yields "Y"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0176 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('Y');
      logInfo(`pick(name="Y"): actual=${actual}`);
      expect(actual).assertEqual('Y');
      logInfo(`pick(name="Y") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Y');
      logInfo(`${BUNDLE}CitySearchStatePick_0176 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0177
     * @tc.name      CitySearch_CitySearchStatePick_0177
     * @tc.desc      CitySearchState.pick(name="1rTxM607vhT") yields "1rTxM607vhT"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0177 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('1rTxM607vhT');
      logInfo(`pick(name="1rTxM607vhT"): actual=${actual}`);
      expect(actual).assertEqual('1rTxM607vhT');
      logInfo(`pick(name="1rTxM607vhT") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('1rTxM607vhT');
      logInfo(`${BUNDLE}CitySearchStatePick_0177 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0178
     * @tc.name      CitySearch_CitySearchStatePick_0178
     * @tc.desc      CitySearchState.pick(name="ZBaLAEWJy5iz") yields "ZBaLAEWJy5iz"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0178 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('ZBaLAEWJy5iz');
      logInfo(`pick(name="ZBaLAEWJy5iz"): actual=${actual}`);
      expect(actual).assertEqual('ZBaLAEWJy5iz');
      logInfo(`pick(name="ZBaLAEWJy5iz") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('ZBaLAEWJy5iz');
      logInfo(`${BUNDLE}CitySearchStatePick_0178 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0179
     * @tc.name      CitySearch_CitySearchStatePick_0179
     * @tc.desc      CitySearchState.pick(name="rDG2yuhcx") yields "rDG2yuhcx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0179 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('rDG2yuhcx');
      logInfo(`pick(name="rDG2yuhcx"): actual=${actual}`);
      expect(actual).assertEqual('rDG2yuhcx');
      logInfo(`pick(name="rDG2yuhcx") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('rDG2yuhcx');
      logInfo(`${BUNDLE}CitySearchStatePick_0179 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0180
     * @tc.name      CitySearch_CitySearchStatePick_0180
     * @tc.desc      CitySearchState.pick(name="oL014NSE8YZv") yields "oL014NSE8YZv"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0180 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('oL014NSE8YZv');
      logInfo(`pick(name="oL014NSE8YZv"): actual=${actual}`);
      expect(actual).assertEqual('oL014NSE8YZv');
      logInfo(`pick(name="oL014NSE8YZv") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('oL014NSE8YZv');
      logInfo(`${BUNDLE}CitySearchStatePick_0180 end`);
    });
  });
}
