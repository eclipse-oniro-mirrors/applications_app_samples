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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SignalFormatter, SignalSnapshot } from '../../../main/ets/model/SignalFormatter';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function radioSignalList05Test() {
  describe('RadioSignalList05Test', () => {

    /**
     * @tc.name   testRadioSignalList0081
     * @tc.number SUB_RADIO_SIGNALLIST_0081
     * @tc.desc   signal list #80 of 4 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0081 begin');
      const list: SignalSnapshot[] = [
        { signalType: 2, signalLevel: 4, dBm: -83 },
        { signalType: 3, signalLevel: 2, dBm: -72 },
        { signalType: 4, signalLevel: 0, dBm: -61 },
        { signalType: 5, signalLevel: 3, dBm: -50 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('cdma/great/-83; wcdma/moderate/-72; tdscdma/none/-61; lte/good/-50');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0081 end');
    })

    /**
     * @tc.name   testRadioSignalList0082
     * @tc.number SUB_RADIO_SIGNALLIST_0082
     * @tc.desc   signal list #81 of 0 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0082 begin');
      const list: SignalSnapshot[] = [];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0082 end');
    })

    /**
     * @tc.name   testRadioSignalList0083
     * @tc.number SUB_RADIO_SIGNALLIST_0083
     * @tc.desc   signal list #82 of 1 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0083 begin');
      const list: SignalSnapshot[] = [{ signalType: 4, signalLevel: 1, dBm: -77 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('tdscdma/poor/-77');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0083 end');
    })

    /**
     * @tc.name   testRadioSignalList0084
     * @tc.number SUB_RADIO_SIGNALLIST_0084
     * @tc.desc   signal list #83 of 2 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0084 begin');
      const list: SignalSnapshot[] = [
        { signalType: 5, signalLevel: 2, dBm: -74 },
        { signalType: 6, signalLevel: 0, dBm: -63 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('lte/moderate/-74; nr/none/-63');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0084 end');
    })

    /**
     * @tc.name   testRadioSignalList0085
     * @tc.number SUB_RADIO_SIGNALLIST_0085
     * @tc.desc   signal list #84 of 3 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0085 begin');
      const list: SignalSnapshot[] = [
        { signalType: 6, signalLevel: 3, dBm: -71 },
        { signalType: 0, signalLevel: 1, dBm: -60 },
        { signalType: 1, signalLevel: 4, dBm: -49 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('nr/good/-71; unknown/poor/-60; gsm/great/-49');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0085 end');
    })

    /**
     * @tc.name   testRadioSignalList0086
     * @tc.number SUB_RADIO_SIGNALLIST_0086
     * @tc.desc   signal list #85 of 4 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0086 begin');
      const list: SignalSnapshot[] = [
        { signalType: 0, signalLevel: 4, dBm: -68 },
        { signalType: 1, signalLevel: 2, dBm: -57 },
        { signalType: 2, signalLevel: 0, dBm: -46 },
        { signalType: 3, signalLevel: 3, dBm: -35 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/great/-68; gsm/moderate/-57; cdma/none/-46; wcdma/good/-35');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0086 end');
    })

    /**
     * @tc.name   testRadioSignalList0087
     * @tc.number SUB_RADIO_SIGNALLIST_0087
     * @tc.desc   signal list #86 of 0 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0087 begin');
      const list: SignalSnapshot[] = [];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0087 end');
    })

    /**
     * @tc.name   testRadioSignalList0088
     * @tc.number SUB_RADIO_SIGNALLIST_0088
     * @tc.desc   signal list #87 of 1 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0088 begin');
      const list: SignalSnapshot[] = [{ signalType: 2, signalLevel: 1, dBm: -62 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('cdma/poor/-62'));
      expect(result).assertEqual('cdma/poor/-62');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0088 end');
    })

    /**
     * @tc.name   testRadioSignalList0089
     * @tc.number SUB_RADIO_SIGNALLIST_0089
     * @tc.desc   signal list #88 of 2 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0089 begin');
      const list: SignalSnapshot[] = [
        { signalType: 3, signalLevel: 2, dBm: -59 },
        { signalType: 4, signalLevel: 0, dBm: -48 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('wcdma/moderate/-59; tdscdma/none/-48');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0089 end');
    })

    /**
     * @tc.name   testRadioSignalList0090
     * @tc.number SUB_RADIO_SIGNALLIST_0090
     * @tc.desc   signal list #89 of 3 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0090 begin');
      const list: SignalSnapshot[] = [
        { signalType: 4, signalLevel: 3, dBm: -56 },
        { signalType: 5, signalLevel: 1, dBm: -45 },
        { signalType: 6, signalLevel: 4, dBm: -34 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('tdscdma/good/-56; lte/poor/-45; nr/great/-34');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0090 end');
    })

    /**
     * @tc.name   testRadioSignalList0091
     * @tc.number SUB_RADIO_SIGNALLIST_0091
     * @tc.desc   signal list #90 of 4 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0091 begin');
      const list: SignalSnapshot[] = [
        { signalType: 5, signalLevel: 4, dBm: -53 },
        { signalType: 6, signalLevel: 2, dBm: -42 },
        { signalType: 0, signalLevel: 0, dBm: -31 },
        { signalType: 1, signalLevel: 3, dBm: -120 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('lte/great/-53; nr/moderate/-42; unknown/none/-31; gsm/good/-120');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0091 end');
    })

    /**
     * @tc.name   testRadioSignalList0092
     * @tc.number SUB_RADIO_SIGNALLIST_0092
     * @tc.desc   signal list #91 of 0 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0092 begin');
      const list: SignalSnapshot[] = [];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0092 end');
    })

    /**
     * @tc.name   testRadioSignalList0093
     * @tc.number SUB_RADIO_SIGNALLIST_0093
     * @tc.desc   signal list #92 of 1 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0093 begin');
      const list: SignalSnapshot[] = [{ signalType: 0, signalLevel: 1, dBm: -47 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/poor/-47');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0093 end');
    })

    /**
     * @tc.name   testRadioSignalList0094
     * @tc.number SUB_RADIO_SIGNALLIST_0094
     * @tc.desc   signal list #93 of 2 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0094 begin');
      const list: SignalSnapshot[] = [
        { signalType: 1, signalLevel: 2, dBm: -44 },
        { signalType: 2, signalLevel: 0, dBm: -33 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('gsm/moderate/-44; cdma/none/-33');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0094 end');
    })

    /**
     * @tc.name   testRadioSignalList0095
     * @tc.number SUB_RADIO_SIGNALLIST_0095
     * @tc.desc   signal list #94 of 3 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0095 begin');
      const list: SignalSnapshot[] = [
        { signalType: 2, signalLevel: 3, dBm: -41 },
        { signalType: 3, signalLevel: 1, dBm: -30 },
        { signalType: 4, signalLevel: 4, dBm: -119 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('cdma/good/-41; wcdma/poor/-30; tdscdma/great/-119');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0095 end');
    })

    /**
     * @tc.name   testRadioSignalList0096
     * @tc.number SUB_RADIO_SIGNALLIST_0096
     * @tc.desc   signal list #95 of 4 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0096 begin');
      const list: SignalSnapshot[] = [
        { signalType: 3, signalLevel: 4, dBm: -38 },
        { signalType: 4, signalLevel: 2, dBm: -27 },
        { signalType: 5, signalLevel: 0, dBm: -116 },
        { signalType: 6, signalLevel: 3, dBm: -105 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('wcdma/great/-38; tdscdma/moderate/-27; lte/none/-116; nr/good/-105');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0096 end');
    })

    /**
     * @tc.name   testRadioSignalList0097
     * @tc.number SUB_RADIO_SIGNALLIST_0097
     * @tc.desc   signal list #96 of 0 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0097 begin');
      const list: SignalSnapshot[] = [];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0097 end');
    })

    /**
     * @tc.name   testRadioSignalList0098
     * @tc.number SUB_RADIO_SIGNALLIST_0098
     * @tc.desc   signal list #97 of 1 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0098 begin');
      const list: SignalSnapshot[] = [{ signalType: 5, signalLevel: 1, dBm: -32 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('lte/poor/-32'));
      expect(result).assertEqual('lte/poor/-32');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0098 end');
    })

    /**
     * @tc.name   testRadioSignalList0099
     * @tc.number SUB_RADIO_SIGNALLIST_0099
     * @tc.desc   signal list #98 of 2 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0099 begin');
      const list: SignalSnapshot[] = [
        { signalType: 6, signalLevel: 2, dBm: -29 },
        { signalType: 0, signalLevel: 0, dBm: -118 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('nr/moderate/-29; unknown/none/-118');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0099 end');
    })

    /**
     * @tc.name   testRadioSignalList0100
     * @tc.number SUB_RADIO_SIGNALLIST_0100
     * @tc.desc   signal list #99 of 3 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0100 begin');
      const list: SignalSnapshot[] = [
        { signalType: 0, signalLevel: 3, dBm: -26 },
        { signalType: 1, signalLevel: 1, dBm: -115 },
        { signalType: 2, signalLevel: 4, dBm: -104 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/good/-26; gsm/poor/-115; cdma/great/-104');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0100 end');
    })

    /**
     * @tc.name   testRadioSignalList0101
     * @tc.number SUB_RADIO_SIGNALLIST_0101
     * @tc.desc   signal list #100 of 4 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0101 begin');
      const list: SignalSnapshot[] = [
        { signalType: 1, signalLevel: 4, dBm: -23 },
        { signalType: 2, signalLevel: 2, dBm: -112 },
        { signalType: 3, signalLevel: 0, dBm: -101 },
        { signalType: 4, signalLevel: 3, dBm: -90 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('gsm/great/-23; cdma/moderate/-112; wcdma/none/-101; tdscdma/good/-90');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0101 end');
    })

    /**
     * @tc.name   testRadioSignalList0102
     * @tc.number SUB_RADIO_SIGNALLIST_0102
     * @tc.desc   signal list #101 of 0 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0102 begin');
      const list: SignalSnapshot[] = [];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0102 end');
    })

    /**
     * @tc.name   testRadioSignalList0103
     * @tc.number SUB_RADIO_SIGNALLIST_0103
     * @tc.desc   signal list #102 of 1 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0103 begin');
      const list: SignalSnapshot[] = [{ signalType: 3, signalLevel: 1, dBm: -117 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('wcdma/poor/-117');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0103 end');
    })

    /**
     * @tc.name   testRadioSignalList0104
     * @tc.number SUB_RADIO_SIGNALLIST_0104
     * @tc.desc   signal list #103 of 2 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0104 begin');
      const list: SignalSnapshot[] = [
        { signalType: 4, signalLevel: 2, dBm: -114 },
        { signalType: 5, signalLevel: 0, dBm: -103 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('tdscdma/moderate/-114; lte/none/-103');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0104 end');
    })

    /**
     * @tc.name   testRadioSignalList0105
     * @tc.number SUB_RADIO_SIGNALLIST_0105
     * @tc.desc   signal list #104 of 3 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0105 begin');
      const list: SignalSnapshot[] = [
        { signalType: 5, signalLevel: 3, dBm: -111 },
        { signalType: 6, signalLevel: 1, dBm: -100 },
        { signalType: 0, signalLevel: 4, dBm: -89 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('lte/good/-111; nr/poor/-100; unknown/great/-89');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0105 end');
    })

    /**
     * @tc.name   testRadioSignalList0106
     * @tc.number SUB_RADIO_SIGNALLIST_0106
     * @tc.desc   signal list #105 of 4 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0106 begin');
      const list: SignalSnapshot[] = [
        { signalType: 6, signalLevel: 4, dBm: -108 },
        { signalType: 0, signalLevel: 2, dBm: -97 },
        { signalType: 1, signalLevel: 0, dBm: -86 },
        { signalType: 2, signalLevel: 3, dBm: -75 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('nr/great/-108; unknown/moderate/-97; gsm/none/-86; cdma/good/-75');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0106 end');
    })

    /**
     * @tc.name   testRadioSignalList0107
     * @tc.number SUB_RADIO_SIGNALLIST_0107
     * @tc.desc   signal list #106 of 0 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0107 begin');
      const list: SignalSnapshot[] = [];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0107 end');
    })

    /**
     * @tc.name   testRadioSignalList0108
     * @tc.number SUB_RADIO_SIGNALLIST_0108
     * @tc.desc   signal list #107 of 1 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0108 begin');
      const list: SignalSnapshot[] = [{ signalType: 1, signalLevel: 1, dBm: -102 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('gsm/poor/-102'));
      expect(result).assertEqual('gsm/poor/-102');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0108 end');
    })

    /**
     * @tc.name   testRadioSignalList0109
     * @tc.number SUB_RADIO_SIGNALLIST_0109
     * @tc.desc   signal list #108 of 2 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0109 begin');
      const list: SignalSnapshot[] = [
        { signalType: 2, signalLevel: 2, dBm: -99 },
        { signalType: 3, signalLevel: 0, dBm: -88 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('cdma/moderate/-99; wcdma/none/-88');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0109 end');
    })

    /**
     * @tc.name   testRadioSignalList0110
     * @tc.number SUB_RADIO_SIGNALLIST_0110
     * @tc.desc   signal list #109 of 3 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0110 begin');
      const list: SignalSnapshot[] = [
        { signalType: 3, signalLevel: 3, dBm: -96 },
        { signalType: 4, signalLevel: 1, dBm: -85 },
        { signalType: 5, signalLevel: 4, dBm: -74 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('wcdma/good/-96; tdscdma/poor/-85; lte/great/-74');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0110 end');
    })

    /**
     * @tc.name   testRadioSignalList0111
     * @tc.number SUB_RADIO_SIGNALLIST_0111
     * @tc.desc   signal list #110 of 4 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0111 begin');
      const list: SignalSnapshot[] = [
        { signalType: 4, signalLevel: 4, dBm: -93 },
        { signalType: 5, signalLevel: 2, dBm: -82 },
        { signalType: 6, signalLevel: 0, dBm: -71 },
        { signalType: 0, signalLevel: 3, dBm: -60 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('tdscdma/great/-93; lte/moderate/-82; nr/none/-71; unknown/good/-60');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0111 end');
    })

    /**
     * @tc.name   testRadioSignalList0112
     * @tc.number SUB_RADIO_SIGNALLIST_0112
     * @tc.desc   signal list #111 of 0 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0112 begin');
      const list: SignalSnapshot[] = [];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0112 end');
    })

    /**
     * @tc.name   testRadioSignalList0113
     * @tc.number SUB_RADIO_SIGNALLIST_0113
     * @tc.desc   signal list #112 of 1 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0113 begin');
      const list: SignalSnapshot[] = [{ signalType: 6, signalLevel: 1, dBm: -87 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('nr/poor/-87'));
      expect(result).assertEqual('nr/poor/-87');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0113 end');
    })

    /**
     * @tc.name   testRadioSignalList0114
     * @tc.number SUB_RADIO_SIGNALLIST_0114
     * @tc.desc   signal list #113 of 2 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0114 begin');
      const list: SignalSnapshot[] = [
        { signalType: 0, signalLevel: 2, dBm: -84 },
        { signalType: 1, signalLevel: 0, dBm: -73 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/moderate/-84; gsm/none/-73');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0114 end');
    })

    /**
     * @tc.name   testRadioSignalList0115
     * @tc.number SUB_RADIO_SIGNALLIST_0115
     * @tc.desc   signal list #114 of 3 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0115 begin');
      const list: SignalSnapshot[] = [
        { signalType: 1, signalLevel: 3, dBm: -81 },
        { signalType: 2, signalLevel: 1, dBm: -70 },
        { signalType: 3, signalLevel: 4, dBm: -59 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('gsm/good/-81; cdma/poor/-70; wcdma/great/-59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0115 end');
    })

    /**
     * @tc.name   testRadioSignalList0116
     * @tc.number SUB_RADIO_SIGNALLIST_0116
     * @tc.desc   signal list #115 of 4 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0116 begin');
      const list: SignalSnapshot[] = [
        { signalType: 2, signalLevel: 4, dBm: -78 },
        { signalType: 3, signalLevel: 2, dBm: -67 },
        { signalType: 4, signalLevel: 0, dBm: -56 },
        { signalType: 5, signalLevel: 3, dBm: -45 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('cdma/great/-78; wcdma/moderate/-67; tdscdma/none/-56; lte/good/-45');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0116 end');
    })

    /**
     * @tc.name   testRadioSignalList0117
     * @tc.number SUB_RADIO_SIGNALLIST_0117
     * @tc.desc   signal list #116 of 0 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0117 begin');
      const list: SignalSnapshot[] = [];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0117 end');
    })

    /**
     * @tc.name   testRadioSignalList0118
     * @tc.number SUB_RADIO_SIGNALLIST_0118
     * @tc.desc   signal list #117 of 1 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0118 begin');
      const list: SignalSnapshot[] = [{ signalType: 4, signalLevel: 1, dBm: -72 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('tdscdma/poor/-72');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0118 end');
    })

    /**
     * @tc.name   testRadioSignalList0119
     * @tc.number SUB_RADIO_SIGNALLIST_0119
     * @tc.desc   signal list #118 of 2 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0119 begin');
      const list: SignalSnapshot[] = [
        { signalType: 5, signalLevel: 2, dBm: -69 },
        { signalType: 6, signalLevel: 0, dBm: -58 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('lte/moderate/-69; nr/none/-58');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0119 end');
    })

    /**
     * @tc.name   testRadioSignalList0120
     * @tc.number SUB_RADIO_SIGNALLIST_0120
     * @tc.desc   signal list #119 of 3 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0120 begin');
      const list: SignalSnapshot[] = [
        { signalType: 6, signalLevel: 3, dBm: -66 },
        { signalType: 0, signalLevel: 1, dBm: -55 },
        { signalType: 1, signalLevel: 4, dBm: -44 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('nr/good/-66; unknown/poor/-55; gsm/great/-44');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0120 end');
    })

    /**
     * @tc.name   testRadioSignalList0121
     * @tc.number SUB_RADIO_SIGNALLIST_0121
     * @tc.desc   signal list #120 of 4 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0121 begin');
      const list: SignalSnapshot[] = [
        { signalType: 0, signalLevel: 4, dBm: -63 },
        { signalType: 1, signalLevel: 2, dBm: -52 },
        { signalType: 2, signalLevel: 0, dBm: -41 },
        { signalType: 3, signalLevel: 3, dBm: -30 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/great/-63; gsm/moderate/-52; cdma/none/-41; wcdma/good/-30');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0121 end');
    })

    /**
     * @tc.name   testRadioSignalList0122
     * @tc.number SUB_RADIO_SIGNALLIST_0122
     * @tc.desc   signal list #121 of 0 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0122 begin');
      const list: SignalSnapshot[] = [];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0122 end');
    })

    /**
     * @tc.name   testRadioSignalList0123
     * @tc.number SUB_RADIO_SIGNALLIST_0123
     * @tc.desc   signal list #122 of 1 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0123 begin');
      const list: SignalSnapshot[] = [{ signalType: 2, signalLevel: 1, dBm: -57 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('cdma/poor/-57'));
      expect(result).assertEqual('cdma/poor/-57');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0123 end');
    })

    /**
     * @tc.name   testRadioSignalList0124
     * @tc.number SUB_RADIO_SIGNALLIST_0124
     * @tc.desc   signal list #123 of 2 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0124 begin');
      const list: SignalSnapshot[] = [
        { signalType: 3, signalLevel: 2, dBm: -54 },
        { signalType: 4, signalLevel: 0, dBm: -43 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('wcdma/moderate/-54; tdscdma/none/-43');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0124 end');
    })

    /**
     * @tc.name   testRadioSignalList0125
     * @tc.number SUB_RADIO_SIGNALLIST_0125
     * @tc.desc   signal list #124 of 3 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0125 begin');
      const list: SignalSnapshot[] = [
        { signalType: 4, signalLevel: 3, dBm: -51 },
        { signalType: 5, signalLevel: 1, dBm: -40 },
        { signalType: 6, signalLevel: 4, dBm: -29 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('tdscdma/good/-51; lte/poor/-40; nr/great/-29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0125 end');
    })

    /**
     * @tc.name   testRadioSignalList0126
     * @tc.number SUB_RADIO_SIGNALLIST_0126
     * @tc.desc   signal list #125 of 4 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0126 begin');
      const list: SignalSnapshot[] = [
        { signalType: 5, signalLevel: 4, dBm: -48 },
        { signalType: 6, signalLevel: 2, dBm: -37 },
        { signalType: 0, signalLevel: 0, dBm: -26 },
        { signalType: 1, signalLevel: 3, dBm: -115 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('lte/great/-48; nr/moderate/-37; unknown/none/-26; gsm/good/-115');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0126 end');
    })

    /**
     * @tc.name   testRadioSignalList0127
     * @tc.number SUB_RADIO_SIGNALLIST_0127
     * @tc.desc   signal list #126 of 0 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0127 begin');
      const list: SignalSnapshot[] = [];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0127 end');
    })

    /**
     * @tc.name   testRadioSignalList0128
     * @tc.number SUB_RADIO_SIGNALLIST_0128
     * @tc.desc   signal list #127 of 1 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0128 begin');
      const list: SignalSnapshot[] = [{ signalType: 0, signalLevel: 1, dBm: -42 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/poor/-42');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0128 end');
    })

    /**
     * @tc.name   testRadioSignalList0129
     * @tc.number SUB_RADIO_SIGNALLIST_0129
     * @tc.desc   signal list #128 of 2 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0129 begin');
      const list: SignalSnapshot[] = [
        { signalType: 1, signalLevel: 2, dBm: -39 },
        { signalType: 2, signalLevel: 0, dBm: -28 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('gsm/moderate/-39; cdma/none/-28');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0129 end');
    })

    /**
     * @tc.name   testRadioSignalList0130
     * @tc.number SUB_RADIO_SIGNALLIST_0130
     * @tc.desc   signal list #129 of 3 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0130 begin');
      const list: SignalSnapshot[] = [
        { signalType: 2, signalLevel: 3, dBm: -36 },
        { signalType: 3, signalLevel: 1, dBm: -25 },
        { signalType: 4, signalLevel: 4, dBm: -114 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('cdma/good/-36; wcdma/poor/-25; tdscdma/great/-114');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0130 end');
    })

    /**
     * @tc.name   testRadioSignalList0131
     * @tc.number SUB_RADIO_SIGNALLIST_0131
     * @tc.desc   signal list #130 of 4 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0131 begin');
      const list: SignalSnapshot[] = [
        { signalType: 3, signalLevel: 4, dBm: -33 },
        { signalType: 4, signalLevel: 2, dBm: -22 },
        { signalType: 5, signalLevel: 0, dBm: -111 },
        { signalType: 6, signalLevel: 3, dBm: -100 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('wcdma/great/-33; tdscdma/moderate/-22; lte/none/-111; nr/good/-100');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0131 end');
    })

    /**
     * @tc.name   testRadioSignalList0132
     * @tc.number SUB_RADIO_SIGNALLIST_0132
     * @tc.desc   signal list #131 of 0 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0132 begin');
      const list: SignalSnapshot[] = [];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0132 end');
    })

    /**
     * @tc.name   testRadioSignalList0133
     * @tc.number SUB_RADIO_SIGNALLIST_0133
     * @tc.desc   signal list #132 of 1 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0133 begin');
      const list: SignalSnapshot[] = [{ signalType: 5, signalLevel: 1, dBm: -27 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('lte/poor/-27'));
      expect(result).assertEqual('lte/poor/-27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0133 end');
    })

    /**
     * @tc.name   testRadioSignalList0134
     * @tc.number SUB_RADIO_SIGNALLIST_0134
     * @tc.desc   signal list #133 of 2 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0134 begin');
      const list: SignalSnapshot[] = [
        { signalType: 6, signalLevel: 2, dBm: -24 },
        { signalType: 0, signalLevel: 0, dBm: -113 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('nr/moderate/-24; unknown/none/-113');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0134 end');
    })

    /**
     * @tc.name   testRadioSignalList0135
     * @tc.number SUB_RADIO_SIGNALLIST_0135
     * @tc.desc   signal list #134 of 3 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0135 begin');
      const list: SignalSnapshot[] = [
        { signalType: 0, signalLevel: 3, dBm: -21 },
        { signalType: 1, signalLevel: 1, dBm: -110 },
        { signalType: 2, signalLevel: 4, dBm: -99 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/good/-21; gsm/poor/-110; cdma/great/-99');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0135 end');
    })

    /**
     * @tc.name   testRadioSignalList0136
     * @tc.number SUB_RADIO_SIGNALLIST_0136
     * @tc.desc   signal list #135 of 4 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0136 begin');
      const list: SignalSnapshot[] = [
        { signalType: 1, signalLevel: 4, dBm: -118 },
        { signalType: 2, signalLevel: 2, dBm: -107 },
        { signalType: 3, signalLevel: 0, dBm: -96 },
        { signalType: 4, signalLevel: 3, dBm: -85 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('gsm/great/-118; cdma/moderate/-107; wcdma/none/-96; tdscdma/good/-85');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0136 end');
    })

    /**
     * @tc.name   testRadioSignalList0137
     * @tc.number SUB_RADIO_SIGNALLIST_0137
     * @tc.desc   signal list #136 of 0 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0137 begin');
      const list: SignalSnapshot[] = [];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0137 end');
    })

    /**
     * @tc.name   testRadioSignalList0138
     * @tc.number SUB_RADIO_SIGNALLIST_0138
     * @tc.desc   signal list #137 of 1 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0138 begin');
      const list: SignalSnapshot[] = [{ signalType: 3, signalLevel: 1, dBm: -112 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('wcdma/poor/-112');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0138 end');
    })

    /**
     * @tc.name   testRadioSignalList0139
     * @tc.number SUB_RADIO_SIGNALLIST_0139
     * @tc.desc   signal list #138 of 2 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0139 begin');
      const list: SignalSnapshot[] = [
        { signalType: 4, signalLevel: 2, dBm: -109 },
        { signalType: 5, signalLevel: 0, dBm: -98 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('tdscdma/moderate/-109; lte/none/-98');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0139 end');
    })

    /**
     * @tc.name   testRadioSignalList0140
     * @tc.number SUB_RADIO_SIGNALLIST_0140
     * @tc.desc   signal list #139 of 3 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0140 begin');
      const list: SignalSnapshot[] = [
        { signalType: 5, signalLevel: 3, dBm: -106 },
        { signalType: 6, signalLevel: 1, dBm: -95 },
        { signalType: 0, signalLevel: 4, dBm: -84 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('lte/good/-106; nr/poor/-95; unknown/great/-84');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0140 end');
    })

    /**
     * @tc.name   testRadioSignalList0141
     * @tc.number SUB_RADIO_SIGNALLIST_0141
     * @tc.desc   signal list #140 of 4 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0141 begin');
      const list: SignalSnapshot[] = [
        { signalType: 6, signalLevel: 4, dBm: -103 },
        { signalType: 0, signalLevel: 2, dBm: -92 },
        { signalType: 1, signalLevel: 0, dBm: -81 },
        { signalType: 2, signalLevel: 3, dBm: -70 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('nr/great/-103; unknown/moderate/-92; gsm/none/-81; cdma/good/-70');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0141 end');
    })

    /**
     * @tc.name   testRadioSignalList0142
     * @tc.number SUB_RADIO_SIGNALLIST_0142
     * @tc.desc   signal list #141 of 0 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0142 begin');
      const list: SignalSnapshot[] = [];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0142 end');
    })

    /**
     * @tc.name   testRadioSignalList0143
     * @tc.number SUB_RADIO_SIGNALLIST_0143
     * @tc.desc   signal list #142 of 1 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0143 begin');
      const list: SignalSnapshot[] = [{ signalType: 1, signalLevel: 1, dBm: -97 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('gsm/poor/-97'));
      expect(result).assertEqual('gsm/poor/-97');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0143 end');
    })

    /**
     * @tc.name   testRadioSignalList0144
     * @tc.number SUB_RADIO_SIGNALLIST_0144
     * @tc.desc   signal list #143 of 2 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0144 begin');
      const list: SignalSnapshot[] = [
        { signalType: 2, signalLevel: 2, dBm: -94 },
        { signalType: 3, signalLevel: 0, dBm: -83 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('cdma/moderate/-94; wcdma/none/-83');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0144 end');
    })

    /**
     * @tc.name   testRadioSignalList0145
     * @tc.number SUB_RADIO_SIGNALLIST_0145
     * @tc.desc   signal list #144 of 3 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0145 begin');
      const list: SignalSnapshot[] = [
        { signalType: 3, signalLevel: 3, dBm: -91 },
        { signalType: 4, signalLevel: 1, dBm: -80 },
        { signalType: 5, signalLevel: 4, dBm: -69 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('wcdma/good/-91; tdscdma/poor/-80; lte/great/-69');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0145 end');
    })

    /**
     * @tc.name   testRadioSignalList0146
     * @tc.number SUB_RADIO_SIGNALLIST_0146
     * @tc.desc   signal list #145 of 4 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0146 begin');
      const list: SignalSnapshot[] = [
        { signalType: 4, signalLevel: 4, dBm: -88 },
        { signalType: 5, signalLevel: 2, dBm: -77 },
        { signalType: 6, signalLevel: 0, dBm: -66 },
        { signalType: 0, signalLevel: 3, dBm: -55 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('tdscdma/great/-88; lte/moderate/-77; nr/none/-66; unknown/good/-55');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0146 end');
    })

    /**
     * @tc.name   testRadioSignalList0147
     * @tc.number SUB_RADIO_SIGNALLIST_0147
     * @tc.desc   signal list #146 of 0 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0147 begin');
      const list: SignalSnapshot[] = [];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0147 end');
    })

    /**
     * @tc.name   testRadioSignalList0148
     * @tc.number SUB_RADIO_SIGNALLIST_0148
     * @tc.desc   signal list #147 of 1 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0148 begin');
      const list: SignalSnapshot[] = [{ signalType: 6, signalLevel: 1, dBm: -82 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('nr/poor/-82'));
      expect(result).assertEqual('nr/poor/-82');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0148 end');
    })

    /**
     * @tc.name   testRadioSignalList0149
     * @tc.number SUB_RADIO_SIGNALLIST_0149
     * @tc.desc   signal list #148 of 2 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0149 begin');
      const list: SignalSnapshot[] = [
        { signalType: 0, signalLevel: 2, dBm: -79 },
        { signalType: 1, signalLevel: 0, dBm: -68 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/moderate/-79; gsm/none/-68');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0149 end');
    })

    /**
     * @tc.name   testRadioSignalList0150
     * @tc.number SUB_RADIO_SIGNALLIST_0150
     * @tc.desc   signal list #149 of 3 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0150 begin');
      const list: SignalSnapshot[] = [
        { signalType: 1, signalLevel: 3, dBm: -76 },
        { signalType: 2, signalLevel: 1, dBm: -65 },
        { signalType: 3, signalLevel: 4, dBm: -54 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('gsm/good/-76; cdma/poor/-65; wcdma/great/-54');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0150 end');
    })

    /**
     * @tc.name   testRadioSignalList0151
     * @tc.number SUB_RADIO_SIGNALLIST_0151
     * @tc.desc   signal list #150 of 4 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0151 begin');
      const list: SignalSnapshot[] = [
        { signalType: 2, signalLevel: 4, dBm: -73 },
        { signalType: 3, signalLevel: 2, dBm: -62 },
        { signalType: 4, signalLevel: 0, dBm: -51 },
        { signalType: 5, signalLevel: 3, dBm: -40 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('cdma/great/-73; wcdma/moderate/-62; tdscdma/none/-51; lte/good/-40');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0151 end');
    })

    /**
     * @tc.name   testRadioSignalList0152
     * @tc.number SUB_RADIO_SIGNALLIST_0152
     * @tc.desc   signal list #151 of 0 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0152 begin');
      const list: SignalSnapshot[] = [];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0152 end');
    })

    /**
     * @tc.name   testRadioSignalList0153
     * @tc.number SUB_RADIO_SIGNALLIST_0153
     * @tc.desc   signal list #152 of 1 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0153 begin');
      const list: SignalSnapshot[] = [{ signalType: 4, signalLevel: 1, dBm: -67 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('tdscdma/poor/-67');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0153 end');
    })

    /**
     * @tc.name   testRadioSignalList0154
     * @tc.number SUB_RADIO_SIGNALLIST_0154
     * @tc.desc   signal list #153 of 2 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0154 begin');
      const list: SignalSnapshot[] = [
        { signalType: 5, signalLevel: 2, dBm: -64 },
        { signalType: 6, signalLevel: 0, dBm: -53 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('lte/moderate/-64; nr/none/-53');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0154 end');
    })

    /**
     * @tc.name   testRadioSignalList0155
     * @tc.number SUB_RADIO_SIGNALLIST_0155
     * @tc.desc   signal list #154 of 3 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0155 begin');
      const list: SignalSnapshot[] = [
        { signalType: 6, signalLevel: 3, dBm: -61 },
        { signalType: 0, signalLevel: 1, dBm: -50 },
        { signalType: 1, signalLevel: 4, dBm: -39 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('nr/good/-61; unknown/poor/-50; gsm/great/-39');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0155 end');
    })

    /**
     * @tc.name   testRadioSignalList0156
     * @tc.number SUB_RADIO_SIGNALLIST_0156
     * @tc.desc   signal list #155 of 4 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0156 begin');
      const list: SignalSnapshot[] = [
        { signalType: 0, signalLevel: 4, dBm: -58 },
        { signalType: 1, signalLevel: 2, dBm: -47 },
        { signalType: 2, signalLevel: 0, dBm: -36 },
        { signalType: 3, signalLevel: 3, dBm: -25 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/great/-58; gsm/moderate/-47; cdma/none/-36; wcdma/good/-25');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0156 end');
    })

    /**
     * @tc.name   testRadioSignalList0157
     * @tc.number SUB_RADIO_SIGNALLIST_0157
     * @tc.desc   signal list #156 of 0 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0157 begin');
      const list: SignalSnapshot[] = [];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0157 end');
    })

    /**
     * @tc.name   testRadioSignalList0158
     * @tc.number SUB_RADIO_SIGNALLIST_0158
     * @tc.desc   signal list #157 of 1 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0158 begin');
      const list: SignalSnapshot[] = [{ signalType: 2, signalLevel: 1, dBm: -52 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('cdma/poor/-52'));
      expect(result).assertEqual('cdma/poor/-52');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0158 end');
    })

    /**
     * @tc.name   testRadioSignalList0159
     * @tc.number SUB_RADIO_SIGNALLIST_0159
     * @tc.desc   signal list #158 of 2 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0159 begin');
      const list: SignalSnapshot[] = [
        { signalType: 3, signalLevel: 2, dBm: -49 },
        { signalType: 4, signalLevel: 0, dBm: -38 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('wcdma/moderate/-49; tdscdma/none/-38');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0159 end');
    })

    /**
     * @tc.name   testRadioSignalList0160
     * @tc.number SUB_RADIO_SIGNALLIST_0160
     * @tc.desc   空信号列表返回 not available 且 bestLevel 为 -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0160 begin');
      const anchorResult: string = SignalFormatter.formatList([]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(anchorResult));
      expect(anchorResult).assertEqual('not available');
      expect(SignalFormatter.bestLevel([])).assertEqual(-1);
      expect(anchorResult.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0160 end');
    })
  })
}
