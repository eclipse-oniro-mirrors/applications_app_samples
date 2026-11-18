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

/** Logic checks for CitySearchState.pick (81 cases). */
export default function citySearchStatePick2Test(): void {
  describe('CitySearchStatePick2Test', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0082
     * @tc.name      CitySearch_CitySearchStatePick_0082
     * @tc.desc      CitySearchState.pick(name="XFcJ") yields "XFcJ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0082 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('XFcJ');
      logInfo(`pick(name="XFcJ"): actual=${actual}`);
      expect(actual).assertEqual('XFcJ');
      logInfo(`pick(name="XFcJ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('XFcJ');
      logInfo(`${BUNDLE}CitySearchStatePick_0082 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0083
     * @tc.name      CitySearch_CitySearchStatePick_0083
     * @tc.desc      CitySearchState.pick(name="b5gewLT") yields "b5gewLT"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0083 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('b5gewLT');
      logInfo(`pick(name="b5gewLT"): actual=${actual}`);
      expect(actual).assertEqual('b5gewLT');
      logInfo(`pick(name="b5gewLT") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('b5gewLT');
      logInfo(`${BUNDLE}CitySearchStatePick_0083 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0084
     * @tc.name      CitySearch_CitySearchStatePick_0084
     * @tc.desc      CitySearchState.pick(name="vXn") yields "vXn"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0084 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('vXn');
      logInfo(`pick(name="vXn"): actual=${actual}`);
      expect(actual).assertEqual('vXn');
      logInfo(`pick(name="vXn") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('vXn');
      logInfo(`${BUNDLE}CitySearchStatePick_0084 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0085
     * @tc.name      CitySearch_CitySearchStatePick_0085
     * @tc.desc      CitySearchState.pick(name="KwcaithN2t6E") yields "KwcaithN2t6E"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0085 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('KwcaithN2t6E');
      logInfo(`pick(name="KwcaithN2t6E"): actual=${actual}`);
      expect(actual).assertEqual('KwcaithN2t6E');
      logInfo(`pick(name="KwcaithN2t6E") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('KwcaithN2t6E');
      logInfo(`${BUNDLE}CitySearchStatePick_0085 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0086
     * @tc.name      CitySearch_CitySearchStatePick_0086
     * @tc.desc      CitySearchState.pick(name="SDMoxAL") yields "SDMoxAL"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0086 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('SDMoxAL');
      logInfo(`pick(name="SDMoxAL"): actual=${actual}`);
      expect(actual).assertEqual('SDMoxAL');
      logInfo(`pick(name="SDMoxAL") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('SDMoxAL');
      logInfo(`${BUNDLE}CitySearchStatePick_0086 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0087
     * @tc.name      CitySearch_CitySearchStatePick_0087
     * @tc.desc      CitySearchState.pick(name="h30r1l665j") yields "h30r1l665j"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0087 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('h30r1l665j');
      logInfo(`pick(name="h30r1l665j"): actual=${actual}`);
      expect(actual).assertEqual('h30r1l665j');
      logInfo(`pick(name="h30r1l665j") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('h30r1l665j');
      logInfo(`${BUNDLE}CitySearchStatePick_0087 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0088
     * @tc.name      CitySearch_CitySearchStatePick_0088
     * @tc.desc      CitySearchState.pick(name="2Qvw2CcBLo2") yields "2Qvw2CcBLo2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0088 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('2Qvw2CcBLo2');
      logInfo(`pick(name="2Qvw2CcBLo2"): actual=${actual}`);
      expect(actual).assertEqual('2Qvw2CcBLo2');
      logInfo(`pick(name="2Qvw2CcBLo2") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('2Qvw2CcBLo2');
      logInfo(`${BUNDLE}CitySearchStatePick_0088 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0089
     * @tc.name      CitySearch_CitySearchStatePick_0089
     * @tc.desc      CitySearchState.pick(name="l") yields "l"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0089 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('l');
      logInfo(`pick(name="l"): actual=${actual}`);
      expect(actual).assertEqual('l');
      logInfo(`pick(name="l") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('l');
      logInfo(`${BUNDLE}CitySearchStatePick_0089 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0090
     * @tc.name      CitySearch_CitySearchStatePick_0090
     * @tc.desc      CitySearchState.pick(name="IUpWcES") yields "IUpWcES"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0090 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('IUpWcES');
      logInfo(`pick(name="IUpWcES"): actual=${actual}`);
      expect(actual).assertEqual('IUpWcES');
      logInfo(`pick(name="IUpWcES") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('IUpWcES');
      logInfo(`${BUNDLE}CitySearchStatePick_0090 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0091
     * @tc.name      CitySearch_CitySearchStatePick_0091
     * @tc.desc      CitySearchState.pick(name="O0u") yields "O0u"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0091 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('O0u');
      logInfo(`pick(name="O0u"): actual=${actual}`);
      expect(actual).assertEqual('O0u');
      logInfo(`pick(name="O0u") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('O0u');
      logInfo(`${BUNDLE}CitySearchStatePick_0091 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0092
     * @tc.name      CitySearch_CitySearchStatePick_0092
     * @tc.desc      CitySearchState.pick(name="sh79ANK") yields "sh79ANK"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0092 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('sh79ANK');
      logInfo(`pick(name="sh79ANK"): actual=${actual}`);
      expect(actual).assertEqual('sh79ANK');
      logInfo(`pick(name="sh79ANK") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('sh79ANK');
      logInfo(`${BUNDLE}CitySearchStatePick_0092 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0093
     * @tc.name      CitySearch_CitySearchStatePick_0093
     * @tc.desc      CitySearchState.pick(name="JDCMIp") yields "JDCMIp"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0093 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('JDCMIp');
      logInfo(`pick(name="JDCMIp"): actual=${actual}`);
      expect(actual).assertEqual('JDCMIp');
      logInfo(`pick(name="JDCMIp") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('JDCMIp');
      logInfo(`${BUNDLE}CitySearchStatePick_0093 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0094
     * @tc.name      CitySearch_CitySearchStatePick_0094
     * @tc.desc      CitySearchState.pick(name="kIg6KJl1iaCB") yields "kIg6KJl1iaCB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0094 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('kIg6KJl1iaCB');
      logInfo(`pick(name="kIg6KJl1iaCB"): actual=${actual}`);
      expect(actual).assertEqual('kIg6KJl1iaCB');
      logInfo(`pick(name="kIg6KJl1iaCB") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('kIg6KJl1iaCB');
      logInfo(`${BUNDLE}CitySearchStatePick_0094 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0095
     * @tc.name      CitySearch_CitySearchStatePick_0095
     * @tc.desc      CitySearchState.pick(name="c5CVmfFHdAk") yields "c5CVmfFHdAk"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0095 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('c5CVmfFHdAk');
      logInfo(`pick(name="c5CVmfFHdAk"): actual=${actual}`);
      expect(actual).assertEqual('c5CVmfFHdAk');
      logInfo(`pick(name="c5CVmfFHdAk") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('c5CVmfFHdAk');
      logInfo(`${BUNDLE}CitySearchStatePick_0095 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0096
     * @tc.name      CitySearch_CitySearchStatePick_0096
     * @tc.desc      CitySearchState.pick(name="1RvdZVBQVXa") yields "1RvdZVBQVXa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0096 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('1RvdZVBQVXa');
      logInfo(`pick(name="1RvdZVBQVXa"): actual=${actual}`);
      expect(actual).assertEqual('1RvdZVBQVXa');
      logInfo(`pick(name="1RvdZVBQVXa") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('1RvdZVBQVXa');
      logInfo(`${BUNDLE}CitySearchStatePick_0096 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0097
     * @tc.name      CitySearch_CitySearchStatePick_0097
     * @tc.desc      CitySearchState.pick(name="8hWXmIXRMSs") yields "8hWXmIXRMSs"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0097 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('8hWXmIXRMSs');
      logInfo(`pick(name="8hWXmIXRMSs"): actual=${actual}`);
      expect(actual).assertEqual('8hWXmIXRMSs');
      logInfo(`pick(name="8hWXmIXRMSs") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('8hWXmIXRMSs');
      logInfo(`${BUNDLE}CitySearchStatePick_0097 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0098
     * @tc.name      CitySearch_CitySearchStatePick_0098
     * @tc.desc      CitySearchState.pick(name="W0q1SdqJRH") yields "W0q1SdqJRH"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0098 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('W0q1SdqJRH');
      logInfo(`pick(name="W0q1SdqJRH"): actual=${actual}`);
      expect(actual).assertEqual('W0q1SdqJRH');
      logInfo(`pick(name="W0q1SdqJRH") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('W0q1SdqJRH');
      logInfo(`${BUNDLE}CitySearchStatePick_0098 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0099
     * @tc.name      CitySearch_CitySearchStatePick_0099
     * @tc.desc      CitySearchState.pick(name="zknIrBNwk") yields "zknIrBNwk"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0099 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('zknIrBNwk');
      logInfo(`pick(name="zknIrBNwk"): actual=${actual}`);
      expect(actual).assertEqual('zknIrBNwk');
      logInfo(`pick(name="zknIrBNwk") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('zknIrBNwk');
      logInfo(`${BUNDLE}CitySearchStatePick_0099 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0100
     * @tc.name      CitySearch_CitySearchStatePick_0100
     * @tc.desc      CitySearchState.pick(name="dwDQ5Tx") yields "dwDQ5Tx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0100 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('dwDQ5Tx');
      logInfo(`pick(name="dwDQ5Tx"): actual=${actual}`);
      expect(actual).assertEqual('dwDQ5Tx');
      logInfo(`pick(name="dwDQ5Tx") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('dwDQ5Tx');
      logInfo(`${BUNDLE}CitySearchStatePick_0100 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0101
     * @tc.name      CitySearch_CitySearchStatePick_0101
     * @tc.desc      CitySearchState.pick(name="MOuUZO") yields "MOuUZO"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0101 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('MOuUZO');
      logInfo(`pick(name="MOuUZO"): actual=${actual}`);
      expect(actual).assertEqual('MOuUZO');
      logInfo(`pick(name="MOuUZO") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('MOuUZO');
      logInfo(`${BUNDLE}CitySearchStatePick_0101 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0102
     * @tc.name      CitySearch_CitySearchStatePick_0102
     * @tc.desc      CitySearchState.pick(name="0if0Rq") yields "0if0Rq"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0102 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('0if0Rq');
      logInfo(`pick(name="0if0Rq"): actual=${actual}`);
      expect(actual).assertEqual('0if0Rq');
      logInfo(`pick(name="0if0Rq") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('0if0Rq');
      logInfo(`${BUNDLE}CitySearchStatePick_0102 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0103
     * @tc.name      CitySearch_CitySearchStatePick_0103
     * @tc.desc      CitySearchState.pick(name="fwJbCLJR24") yields "fwJbCLJR24"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0103 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('fwJbCLJR24');
      logInfo(`pick(name="fwJbCLJR24"): actual=${actual}`);
      expect(actual).assertEqual('fwJbCLJR24');
      logInfo(`pick(name="fwJbCLJR24") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('fwJbCLJR24');
      logInfo(`${BUNDLE}CitySearchStatePick_0103 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0104
     * @tc.name      CitySearch_CitySearchStatePick_0104
     * @tc.desc      CitySearchState.pick(name="yt") yields "yt"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0104 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('yt');
      logInfo(`pick(name="yt"): actual=${actual}`);
      expect(actual).assertEqual('yt');
      logInfo(`pick(name="yt") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('yt');
      logInfo(`${BUNDLE}CitySearchStatePick_0104 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0105
     * @tc.name      CitySearch_CitySearchStatePick_0105
     * @tc.desc      CitySearchState.pick(name="B4S7YT10RtA") yields "B4S7YT10RtA"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0105 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('B4S7YT10RtA');
      logInfo(`pick(name="B4S7YT10RtA"): actual=${actual}`);
      expect(actual).assertEqual('B4S7YT10RtA');
      logInfo(`pick(name="B4S7YT10RtA") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('B4S7YT10RtA');
      logInfo(`${BUNDLE}CitySearchStatePick_0105 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0106
     * @tc.name      CitySearch_CitySearchStatePick_0106
     * @tc.desc      CitySearchState.pick(name="iZVGOf") yields "iZVGOf"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0106 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('iZVGOf');
      logInfo(`pick(name="iZVGOf"): actual=${actual}`);
      expect(actual).assertEqual('iZVGOf');
      logInfo(`pick(name="iZVGOf") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('iZVGOf');
      logInfo(`${BUNDLE}CitySearchStatePick_0106 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0107
     * @tc.name      CitySearch_CitySearchStatePick_0107
     * @tc.desc      CitySearchState.pick(name="WZ") yields "WZ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0107 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('WZ');
      logInfo(`pick(name="WZ"): actual=${actual}`);
      expect(actual).assertEqual('WZ');
      logInfo(`pick(name="WZ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('WZ');
      logInfo(`${BUNDLE}CitySearchStatePick_0107 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0108
     * @tc.name      CitySearch_CitySearchStatePick_0108
     * @tc.desc      CitySearchState.pick(name="421NtdRXe") yields "421NtdRXe"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0108 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('421NtdRXe');
      logInfo(`pick(name="421NtdRXe"): actual=${actual}`);
      expect(actual).assertEqual('421NtdRXe');
      logInfo(`pick(name="421NtdRXe") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('421NtdRXe');
      logInfo(`${BUNDLE}CitySearchStatePick_0108 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0109
     * @tc.name      CitySearch_CitySearchStatePick_0109
     * @tc.desc      CitySearchState.pick(name="O3HR") yields "O3HR"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0109 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('O3HR');
      logInfo(`pick(name="O3HR"): actual=${actual}`);
      expect(actual).assertEqual('O3HR');
      logInfo(`pick(name="O3HR") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('O3HR');
      logInfo(`${BUNDLE}CitySearchStatePick_0109 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0110
     * @tc.name      CitySearch_CitySearchStatePick_0110
     * @tc.desc      CitySearchState.pick(name="rlk") yields "rlk"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0110 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('rlk');
      logInfo(`pick(name="rlk"): actual=${actual}`);
      expect(actual).assertEqual('rlk');
      logInfo(`pick(name="rlk") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('rlk');
      logInfo(`${BUNDLE}CitySearchStatePick_0110 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0111
     * @tc.name      CitySearch_CitySearchStatePick_0111
     * @tc.desc      CitySearchState.pick(name="AKNDi") yields "AKNDi"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0111 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('AKNDi');
      logInfo(`pick(name="AKNDi"): actual=${actual}`);
      expect(actual).assertEqual('AKNDi');
      logInfo(`pick(name="AKNDi") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('AKNDi');
      logInfo(`${BUNDLE}CitySearchStatePick_0111 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0112
     * @tc.name      CitySearch_CitySearchStatePick_0112
     * @tc.desc      CitySearchState.pick(name="kqsTcNJxbff") yields "kqsTcNJxbff"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0112 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('kqsTcNJxbff');
      logInfo(`pick(name="kqsTcNJxbff"): actual=${actual}`);
      expect(actual).assertEqual('kqsTcNJxbff');
      logInfo(`pick(name="kqsTcNJxbff") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('kqsTcNJxbff');
      logInfo(`${BUNDLE}CitySearchStatePick_0112 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0113
     * @tc.name      CitySearch_CitySearchStatePick_0113
     * @tc.desc      CitySearchState.pick(name="SXS") yields "SXS"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0113 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('SXS');
      logInfo(`pick(name="SXS"): actual=${actual}`);
      expect(actual).assertEqual('SXS');
      logInfo(`pick(name="SXS") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('SXS');
      logInfo(`${BUNDLE}CitySearchStatePick_0113 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0114
     * @tc.name      CitySearch_CitySearchStatePick_0114
     * @tc.desc      CitySearchState.pick(name="ZM2AtjMjS") yields "ZM2AtjMjS"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0114 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('ZM2AtjMjS');
      logInfo(`pick(name="ZM2AtjMjS"): actual=${actual}`);
      expect(actual).assertEqual('ZM2AtjMjS');
      logInfo(`pick(name="ZM2AtjMjS") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('ZM2AtjMjS');
      logInfo(`${BUNDLE}CitySearchStatePick_0114 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0115
     * @tc.name      CitySearch_CitySearchStatePick_0115
     * @tc.desc      CitySearchState.pick(name="iqv") yields "iqv"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0115 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('iqv');
      logInfo(`pick(name="iqv"): actual=${actual}`);
      expect(actual).assertEqual('iqv');
      logInfo(`pick(name="iqv") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('iqv');
      logInfo(`${BUNDLE}CitySearchStatePick_0115 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0116
     * @tc.name      CitySearch_CitySearchStatePick_0116
     * @tc.desc      CitySearchState.pick(name="s811h") yields "s811h"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0116 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('s811h');
      logInfo(`pick(name="s811h"): actual=${actual}`);
      expect(actual).assertEqual('s811h');
      logInfo(`pick(name="s811h") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('s811h');
      logInfo(`${BUNDLE}CitySearchStatePick_0116 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0117
     * @tc.name      CitySearch_CitySearchStatePick_0117
     * @tc.desc      CitySearchState.pick(name="XHAva") yields "XHAva"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0117 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('XHAva');
      logInfo(`pick(name="XHAva"): actual=${actual}`);
      expect(actual).assertEqual('XHAva');
      logInfo(`pick(name="XHAva") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('XHAva');
      logInfo(`${BUNDLE}CitySearchStatePick_0117 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0118
     * @tc.name      CitySearch_CitySearchStatePick_0118
     * @tc.desc      CitySearchState.pick(name="ZGbcFLIGlMt") yields "ZGbcFLIGlMt"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0118 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('ZGbcFLIGlMt');
      logInfo(`pick(name="ZGbcFLIGlMt"): actual=${actual}`);
      expect(actual).assertEqual('ZGbcFLIGlMt');
      logInfo(`pick(name="ZGbcFLIGlMt") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('ZGbcFLIGlMt');
      logInfo(`${BUNDLE}CitySearchStatePick_0118 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0119
     * @tc.name      CitySearch_CitySearchStatePick_0119
     * @tc.desc      CitySearchState.pick(name="2") yields "2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0119 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('2');
      logInfo(`pick(name="2"): actual=${actual}`);
      expect(actual).assertEqual('2');
      logInfo(`pick(name="2") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('2');
      logInfo(`${BUNDLE}CitySearchStatePick_0119 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0120
     * @tc.name      CitySearch_CitySearchStatePick_0120
     * @tc.desc      CitySearchState.pick(name="RDtUCM7JhqLP") yields "RDtUCM7JhqLP"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0120 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('RDtUCM7JhqLP');
      logInfo(`pick(name="RDtUCM7JhqLP"): actual=${actual}`);
      expect(actual).assertEqual('RDtUCM7JhqLP');
      logInfo(`pick(name="RDtUCM7JhqLP") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('RDtUCM7JhqLP');
      logInfo(`${BUNDLE}CitySearchStatePick_0120 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0121
     * @tc.name      CitySearch_CitySearchStatePick_0121
     * @tc.desc      CitySearchState.pick(name="ZNGA") yields "ZNGA"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0121 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('ZNGA');
      logInfo(`pick(name="ZNGA"): actual=${actual}`);
      expect(actual).assertEqual('ZNGA');
      logInfo(`pick(name="ZNGA") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('ZNGA');
      logInfo(`${BUNDLE}CitySearchStatePick_0121 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0122
     * @tc.name      CitySearch_CitySearchStatePick_0122
     * @tc.desc      CitySearchState.pick(name="FcYMXJw") yields "FcYMXJw"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0122 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('FcYMXJw');
      logInfo(`pick(name="FcYMXJw"): actual=${actual}`);
      expect(actual).assertEqual('FcYMXJw');
      logInfo(`pick(name="FcYMXJw") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('FcYMXJw');
      logInfo(`${BUNDLE}CitySearchStatePick_0122 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0123
     * @tc.name      CitySearch_CitySearchStatePick_0123
     * @tc.desc      CitySearchState.pick(name="KEC") yields "KEC"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0123 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('KEC');
      logInfo(`pick(name="KEC"): actual=${actual}`);
      expect(actual).assertEqual('KEC');
      logInfo(`pick(name="KEC") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('KEC');
      logInfo(`${BUNDLE}CitySearchStatePick_0123 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0124
     * @tc.name      CitySearch_CitySearchStatePick_0124
     * @tc.desc      CitySearchState.pick(name="XwBJWh") yields "XwBJWh"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0124 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('XwBJWh');
      logInfo(`pick(name="XwBJWh"): actual=${actual}`);
      expect(actual).assertEqual('XwBJWh');
      logInfo(`pick(name="XwBJWh") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('XwBJWh');
      logInfo(`${BUNDLE}CitySearchStatePick_0124 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0125
     * @tc.name      CitySearch_CitySearchStatePick_0125
     * @tc.desc      CitySearchState.pick(name="GVDDV5") yields "GVDDV5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0125 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('GVDDV5');
      logInfo(`pick(name="GVDDV5"): actual=${actual}`);
      expect(actual).assertEqual('GVDDV5');
      logInfo(`pick(name="GVDDV5") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('GVDDV5');
      logInfo(`${BUNDLE}CitySearchStatePick_0125 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0126
     * @tc.name      CitySearch_CitySearchStatePick_0126
     * @tc.desc      CitySearchState.pick(name="2ZhPNpB") yields "2ZhPNpB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0126 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('2ZhPNpB');
      logInfo(`pick(name="2ZhPNpB"): actual=${actual}`);
      expect(actual).assertEqual('2ZhPNpB');
      logInfo(`pick(name="2ZhPNpB") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('2ZhPNpB');
      logInfo(`${BUNDLE}CitySearchStatePick_0126 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0127
     * @tc.name      CitySearch_CitySearchStatePick_0127
     * @tc.desc      CitySearchState.pick(name="mgqpy1l9UZzJ") yields "mgqpy1l9UZzJ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0127 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('mgqpy1l9UZzJ');
      logInfo(`pick(name="mgqpy1l9UZzJ"): actual=${actual}`);
      expect(actual).assertEqual('mgqpy1l9UZzJ');
      logInfo(`pick(name="mgqpy1l9UZzJ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('mgqpy1l9UZzJ');
      logInfo(`${BUNDLE}CitySearchStatePick_0127 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0128
     * @tc.name      CitySearch_CitySearchStatePick_0128
     * @tc.desc      CitySearchState.pick(name="zRG45KYbEPfV") yields "zRG45KYbEPfV"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0128 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('zRG45KYbEPfV');
      logInfo(`pick(name="zRG45KYbEPfV"): actual=${actual}`);
      expect(actual).assertEqual('zRG45KYbEPfV');
      logInfo(`pick(name="zRG45KYbEPfV") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('zRG45KYbEPfV');
      logInfo(`${BUNDLE}CitySearchStatePick_0128 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0129
     * @tc.name      CitySearch_CitySearchStatePick_0129
     * @tc.desc      CitySearchState.pick(name="hyni") yields "hyni"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0129 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('hyni');
      logInfo(`pick(name="hyni"): actual=${actual}`);
      expect(actual).assertEqual('hyni');
      logInfo(`pick(name="hyni") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('hyni');
      logInfo(`${BUNDLE}CitySearchStatePick_0129 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0130
     * @tc.name      CitySearch_CitySearchStatePick_0130
     * @tc.desc      CitySearchState.pick(name="kjR9MeK") yields "kjR9MeK"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0130 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('kjR9MeK');
      logInfo(`pick(name="kjR9MeK"): actual=${actual}`);
      expect(actual).assertEqual('kjR9MeK');
      logInfo(`pick(name="kjR9MeK") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('kjR9MeK');
      logInfo(`${BUNDLE}CitySearchStatePick_0130 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0131
     * @tc.name      CitySearch_CitySearchStatePick_0131
     * @tc.desc      CitySearchState.pick(name="lUYaCLRc76wv") yields "lUYaCLRc76wv"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0131 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('lUYaCLRc76wv');
      logInfo(`pick(name="lUYaCLRc76wv"): actual=${actual}`);
      expect(actual).assertEqual('lUYaCLRc76wv');
      logInfo(`pick(name="lUYaCLRc76wv") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('lUYaCLRc76wv');
      logInfo(`${BUNDLE}CitySearchStatePick_0131 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0132
     * @tc.name      CitySearch_CitySearchStatePick_0132
     * @tc.desc      CitySearchState.pick(name="wZdgE") yields "wZdgE"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0132 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('wZdgE');
      logInfo(`pick(name="wZdgE"): actual=${actual}`);
      expect(actual).assertEqual('wZdgE');
      logInfo(`pick(name="wZdgE") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('wZdgE');
      logInfo(`${BUNDLE}CitySearchStatePick_0132 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0133
     * @tc.name      CitySearch_CitySearchStatePick_0133
     * @tc.desc      CitySearchState.pick(name="uqha8S4qGMu") yields "uqha8S4qGMu"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0133 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('uqha8S4qGMu');
      logInfo(`pick(name="uqha8S4qGMu"): actual=${actual}`);
      expect(actual).assertEqual('uqha8S4qGMu');
      logInfo(`pick(name="uqha8S4qGMu") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('uqha8S4qGMu');
      logInfo(`${BUNDLE}CitySearchStatePick_0133 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0134
     * @tc.name      CitySearch_CitySearchStatePick_0134
     * @tc.desc      CitySearchState.pick(name="8HJrUz") yields "8HJrUz"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0134 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('8HJrUz');
      logInfo(`pick(name="8HJrUz"): actual=${actual}`);
      expect(actual).assertEqual('8HJrUz');
      logInfo(`pick(name="8HJrUz") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('8HJrUz');
      logInfo(`${BUNDLE}CitySearchStatePick_0134 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0135
     * @tc.name      CitySearch_CitySearchStatePick_0135
     * @tc.desc      CitySearchState.pick(name="V7") yields "V7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0135 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('V7');
      logInfo(`pick(name="V7"): actual=${actual}`);
      expect(actual).assertEqual('V7');
      logInfo(`pick(name="V7") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('V7');
      logInfo(`${BUNDLE}CitySearchStatePick_0135 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0136
     * @tc.name      CitySearch_CitySearchStatePick_0136
     * @tc.desc      CitySearchState.pick(name="yNWqzCeJ") yields "yNWqzCeJ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0136 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('yNWqzCeJ');
      logInfo(`pick(name="yNWqzCeJ"): actual=${actual}`);
      expect(actual).assertEqual('yNWqzCeJ');
      logInfo(`pick(name="yNWqzCeJ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('yNWqzCeJ');
      logInfo(`${BUNDLE}CitySearchStatePick_0136 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0137
     * @tc.name      CitySearch_CitySearchStatePick_0137
     * @tc.desc      CitySearchState.pick(name="nwjxGHIPr") yields "nwjxGHIPr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0137 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('nwjxGHIPr');
      logInfo(`pick(name="nwjxGHIPr"): actual=${actual}`);
      expect(actual).assertEqual('nwjxGHIPr');
      logInfo(`pick(name="nwjxGHIPr") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('nwjxGHIPr');
      logInfo(`${BUNDLE}CitySearchStatePick_0137 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0138
     * @tc.name      CitySearch_CitySearchStatePick_0138
     * @tc.desc      CitySearchState.pick(name="6n") yields "6n"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0138 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('6n');
      logInfo(`pick(name="6n"): actual=${actual}`);
      expect(actual).assertEqual('6n');
      logInfo(`pick(name="6n") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('6n');
      logInfo(`${BUNDLE}CitySearchStatePick_0138 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0139
     * @tc.name      CitySearch_CitySearchStatePick_0139
     * @tc.desc      CitySearchState.pick(name="PC3zvv") yields "PC3zvv"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0139 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('PC3zvv');
      logInfo(`pick(name="PC3zvv"): actual=${actual}`);
      expect(actual).assertEqual('PC3zvv');
      logInfo(`pick(name="PC3zvv") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('PC3zvv');
      logInfo(`${BUNDLE}CitySearchStatePick_0139 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0140
     * @tc.name      CitySearch_CitySearchStatePick_0140
     * @tc.desc      CitySearchState.pick(name="OFp5j2f") yields "OFp5j2f"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0140 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('OFp5j2f');
      logInfo(`pick(name="OFp5j2f"): actual=${actual}`);
      expect(actual).assertEqual('OFp5j2f');
      logInfo(`pick(name="OFp5j2f") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('OFp5j2f');
      logInfo(`${BUNDLE}CitySearchStatePick_0140 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0141
     * @tc.name      CitySearch_CitySearchStatePick_0141
     * @tc.desc      CitySearchState.pick(name="t7gGfd0") yields "t7gGfd0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0141 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('t7gGfd0');
      logInfo(`pick(name="t7gGfd0"): actual=${actual}`);
      expect(actual).assertEqual('t7gGfd0');
      logInfo(`pick(name="t7gGfd0") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('t7gGfd0');
      logInfo(`${BUNDLE}CitySearchStatePick_0141 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0142
     * @tc.name      CitySearch_CitySearchStatePick_0142
     * @tc.desc      CitySearchState.pick(name="MH9sFVSx") yields "MH9sFVSx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0142 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('MH9sFVSx');
      logInfo(`pick(name="MH9sFVSx"): actual=${actual}`);
      expect(actual).assertEqual('MH9sFVSx');
      logInfo(`pick(name="MH9sFVSx") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('MH9sFVSx');
      logInfo(`${BUNDLE}CitySearchStatePick_0142 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0143
     * @tc.name      CitySearch_CitySearchStatePick_0143
     * @tc.desc      CitySearchState.pick(name="KUw6hfX") yields "KUw6hfX"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0143 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('KUw6hfX');
      logInfo(`pick(name="KUw6hfX"): actual=${actual}`);
      expect(actual).assertEqual('KUw6hfX');
      logInfo(`pick(name="KUw6hfX") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('KUw6hfX');
      logInfo(`${BUNDLE}CitySearchStatePick_0143 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0144
     * @tc.name      CitySearch_CitySearchStatePick_0144
     * @tc.desc      CitySearchState.pick(name="oKDe0c3") yields "oKDe0c3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0144 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('oKDe0c3');
      logInfo(`pick(name="oKDe0c3"): actual=${actual}`);
      expect(actual).assertEqual('oKDe0c3');
      logInfo(`pick(name="oKDe0c3") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('oKDe0c3');
      logInfo(`${BUNDLE}CitySearchStatePick_0144 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0145
     * @tc.name      CitySearch_CitySearchStatePick_0145
     * @tc.desc      CitySearchState.pick(name="iKY") yields "iKY"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0145 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('iKY');
      logInfo(`pick(name="iKY"): actual=${actual}`);
      expect(actual).assertEqual('iKY');
      logInfo(`pick(name="iKY") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('iKY');
      logInfo(`${BUNDLE}CitySearchStatePick_0145 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0146
     * @tc.name      CitySearch_CitySearchStatePick_0146
     * @tc.desc      CitySearchState.pick(name="zMcJ4ZAS") yields "zMcJ4ZAS"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0146 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('zMcJ4ZAS');
      logInfo(`pick(name="zMcJ4ZAS"): actual=${actual}`);
      expect(actual).assertEqual('zMcJ4ZAS');
      logInfo(`pick(name="zMcJ4ZAS") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('zMcJ4ZAS');
      logInfo(`${BUNDLE}CitySearchStatePick_0146 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0147
     * @tc.name      CitySearch_CitySearchStatePick_0147
     * @tc.desc      CitySearchState.pick(name="iefu") yields "iefu"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0147 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('iefu');
      logInfo(`pick(name="iefu"): actual=${actual}`);
      expect(actual).assertEqual('iefu');
      logInfo(`pick(name="iefu") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('iefu');
      logInfo(`${BUNDLE}CitySearchStatePick_0147 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0148
     * @tc.name      CitySearch_CitySearchStatePick_0148
     * @tc.desc      CitySearchState.pick(name="Dow") yields "Dow"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0148 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('Dow');
      logInfo(`pick(name="Dow"): actual=${actual}`);
      expect(actual).assertEqual('Dow');
      logInfo(`pick(name="Dow") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Dow');
      logInfo(`${BUNDLE}CitySearchStatePick_0148 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0149
     * @tc.name      CitySearch_CitySearchStatePick_0149
     * @tc.desc      CitySearchState.pick(name="KXdIWk7lp") yields "KXdIWk7lp"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0149 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('KXdIWk7lp');
      logInfo(`pick(name="KXdIWk7lp"): actual=${actual}`);
      expect(actual).assertEqual('KXdIWk7lp');
      logInfo(`pick(name="KXdIWk7lp") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('KXdIWk7lp');
      logInfo(`${BUNDLE}CitySearchStatePick_0149 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0150
     * @tc.name      CitySearch_CitySearchStatePick_0150
     * @tc.desc      CitySearchState.pick(name="FgcnsHN") yields "FgcnsHN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0150 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('FgcnsHN');
      logInfo(`pick(name="FgcnsHN"): actual=${actual}`);
      expect(actual).assertEqual('FgcnsHN');
      logInfo(`pick(name="FgcnsHN") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('FgcnsHN');
      logInfo(`${BUNDLE}CitySearchStatePick_0150 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0151
     * @tc.name      CitySearch_CitySearchStatePick_0151
     * @tc.desc      CitySearchState.pick(name="ermIEOfui1H") yields "ermIEOfui1H"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0151 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('ermIEOfui1H');
      logInfo(`pick(name="ermIEOfui1H"): actual=${actual}`);
      expect(actual).assertEqual('ermIEOfui1H');
      logInfo(`pick(name="ermIEOfui1H") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('ermIEOfui1H');
      logInfo(`${BUNDLE}CitySearchStatePick_0151 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0152
     * @tc.name      CitySearch_CitySearchStatePick_0152
     * @tc.desc      CitySearchState.pick(name="0Hyc") yields "0Hyc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0152 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('0Hyc');
      logInfo(`pick(name="0Hyc"): actual=${actual}`);
      expect(actual).assertEqual('0Hyc');
      logInfo(`pick(name="0Hyc") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('0Hyc');
      logInfo(`${BUNDLE}CitySearchStatePick_0152 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0153
     * @tc.name      CitySearch_CitySearchStatePick_0153
     * @tc.desc      CitySearchState.pick(name="5CTDXPL1Q6e") yields "5CTDXPL1Q6e"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0153 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('5CTDXPL1Q6e');
      logInfo(`pick(name="5CTDXPL1Q6e"): actual=${actual}`);
      expect(actual).assertEqual('5CTDXPL1Q6e');
      logInfo(`pick(name="5CTDXPL1Q6e") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('5CTDXPL1Q6e');
      logInfo(`${BUNDLE}CitySearchStatePick_0153 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0154
     * @tc.name      CitySearch_CitySearchStatePick_0154
     * @tc.desc      CitySearchState.pick(name="5") yields "5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0154 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('5');
      logInfo(`pick(name="5"): actual=${actual}`);
      expect(actual).assertEqual('5');
      logInfo(`pick(name="5") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('5');
      logInfo(`${BUNDLE}CitySearchStatePick_0154 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0155
     * @tc.name      CitySearch_CitySearchStatePick_0155
     * @tc.desc      CitySearchState.pick(name="j2") yields "j2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0155 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('j2');
      logInfo(`pick(name="j2"): actual=${actual}`);
      expect(actual).assertEqual('j2');
      logInfo(`pick(name="j2") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('j2');
      logInfo(`${BUNDLE}CitySearchStatePick_0155 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0156
     * @tc.name      CitySearch_CitySearchStatePick_0156
     * @tc.desc      CitySearchState.pick(name="4sb5ifX78bt") yields "4sb5ifX78bt"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0156 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('4sb5ifX78bt');
      logInfo(`pick(name="4sb5ifX78bt"): actual=${actual}`);
      expect(actual).assertEqual('4sb5ifX78bt');
      logInfo(`pick(name="4sb5ifX78bt") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('4sb5ifX78bt');
      logInfo(`${BUNDLE}CitySearchStatePick_0156 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0157
     * @tc.name      CitySearch_CitySearchStatePick_0157
     * @tc.desc      CitySearchState.pick(name="XDB") yields "XDB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0157 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('XDB');
      logInfo(`pick(name="XDB"): actual=${actual}`);
      expect(actual).assertEqual('XDB');
      logInfo(`pick(name="XDB") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('XDB');
      logInfo(`${BUNDLE}CitySearchStatePick_0157 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0158
     * @tc.name      CitySearch_CitySearchStatePick_0158
     * @tc.desc      CitySearchState.pick(name="0V") yields "0V"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0158 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('0V');
      logInfo(`pick(name="0V"): actual=${actual}`);
      expect(actual).assertEqual('0V');
      logInfo(`pick(name="0V") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('0V');
      logInfo(`${BUNDLE}CitySearchStatePick_0158 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0159
     * @tc.name      CitySearch_CitySearchStatePick_0159
     * @tc.desc      CitySearchState.pick(name="SKaVCSo") yields "SKaVCSo"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0159 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('SKaVCSo');
      logInfo(`pick(name="SKaVCSo"): actual=${actual}`);
      expect(actual).assertEqual('SKaVCSo');
      logInfo(`pick(name="SKaVCSo") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('SKaVCSo');
      logInfo(`${BUNDLE}CitySearchStatePick_0159 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0160
     * @tc.name      CitySearch_CitySearchStatePick_0160
     * @tc.desc      CitySearchState.pick(name="JWNd2C14S") yields "JWNd2C14S"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0160 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('JWNd2C14S');
      logInfo(`pick(name="JWNd2C14S"): actual=${actual}`);
      expect(actual).assertEqual('JWNd2C14S');
      logInfo(`pick(name="JWNd2C14S") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('JWNd2C14S');
      logInfo(`${BUNDLE}CitySearchStatePick_0160 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0161
     * @tc.name      CitySearch_CitySearchStatePick_0161
     * @tc.desc      CitySearchState.pick(name="awcmIKBryv") yields "awcmIKBryv"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0161 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('awcmIKBryv');
      logInfo(`pick(name="awcmIKBryv"): actual=${actual}`);
      expect(actual).assertEqual('awcmIKBryv');
      logInfo(`pick(name="awcmIKBryv") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('awcmIKBryv');
      logInfo(`${BUNDLE}CitySearchStatePick_0161 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_PICK_0162
     * @tc.name      CitySearch_CitySearchStatePick_0162
     * @tc.desc      CitySearchState.pick(name="zLR") yields "zLR"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStatePick_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStatePick_0162 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: string = subject.pick('zLR');
      logInfo(`pick(name="zLR"): actual=${actual}`);
      expect(actual).assertEqual('zLR');
      logInfo(`pick(name="zLR") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('zLR');
      logInfo(`${BUNDLE}CitySearchStatePick_0162 end`);
    });
  });
}
