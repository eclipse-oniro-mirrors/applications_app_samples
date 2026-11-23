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

export default function radioSignalList04Test() {
  describe('RadioSignalList04Test', () => {

    /**
     * @tc.name   testRadioSignalList0001
     * @tc.number SUB_RADIO_SIGNALLIST_0001
     * @tc.desc   signal list #1 of 0 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0001 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0001 end');
    })

    /**
     * @tc.name   testRadioSignalList0002
     * @tc.number SUB_RADIO_SIGNALLIST_0002
     * @tc.desc   signal list #2 of 1 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0002 begin');
      const list: SignalSnapshot[] = [{ signalType: 1, signalLevel: 1, dBm: -117 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('gsm/poor/-117'));
      expect(result).assertEqual('gsm/poor/-117');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0002 end');
    })

    /**
     * @tc.name   testRadioSignalList0003
     * @tc.number SUB_RADIO_SIGNALLIST_0003
     * @tc.desc   signal list #3 of 2 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0003 begin');
      const list: SignalSnapshot[] = [
        { signalType: 2, signalLevel: 2, dBm: -114 },
        { signalType: 3, signalLevel: 0, dBm: -103 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('cdma/moderate/-114; wcdma/none/-103');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0003 end');
    })

    /**
     * @tc.name   testRadioSignalList0004
     * @tc.number SUB_RADIO_SIGNALLIST_0004
     * @tc.desc   signal list #4 of 3 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0004 begin');
      const list: SignalSnapshot[] = [
        { signalType: 3, signalLevel: 3, dBm: -111 },
        { signalType: 4, signalLevel: 1, dBm: -100 },
        { signalType: 5, signalLevel: 4, dBm: -89 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('wcdma/good/-111; tdscdma/poor/-100; lte/great/-89');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0004 end');
    })

    /**
     * @tc.name   testRadioSignalList0005
     * @tc.number SUB_RADIO_SIGNALLIST_0005
     * @tc.desc   signal list #5 of 4 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0005 begin');
      const list: SignalSnapshot[] = [
        { signalType: 4, signalLevel: 4, dBm: -108 },
        { signalType: 5, signalLevel: 2, dBm: -97 },
        { signalType: 6, signalLevel: 0, dBm: -86 },
        { signalType: 0, signalLevel: 3, dBm: -75 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('tdscdma/great/-108; lte/moderate/-97; nr/none/-86; unknown/good/-75');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0005 end');
    })

    /**
     * @tc.name   testRadioSignalList0006
     * @tc.number SUB_RADIO_SIGNALLIST_0006
     * @tc.desc   signal list #6 of 0 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0006 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0006 end');
    })

    /**
     * @tc.name   testRadioSignalList0007
     * @tc.number SUB_RADIO_SIGNALLIST_0007
     * @tc.desc   signal list #7 of 1 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0007 begin');
      const list: SignalSnapshot[] = [{ signalType: 6, signalLevel: 1, dBm: -102 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('nr/poor/-102'));
      expect(result).assertEqual('nr/poor/-102');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0007 end');
    })

    /**
     * @tc.name   testRadioSignalList0008
     * @tc.number SUB_RADIO_SIGNALLIST_0008
     * @tc.desc   signal list #8 of 2 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0008 begin');
      const list: SignalSnapshot[] = [
        { signalType: 0, signalLevel: 2, dBm: -99 },
        { signalType: 1, signalLevel: 0, dBm: -88 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/moderate/-99; gsm/none/-88');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0008 end');
    })

    /**
     * @tc.name   testRadioSignalList0009
     * @tc.number SUB_RADIO_SIGNALLIST_0009
     * @tc.desc   signal list #9 of 3 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0009 begin');
      const list: SignalSnapshot[] = [
        { signalType: 1, signalLevel: 3, dBm: -96 },
        { signalType: 2, signalLevel: 1, dBm: -85 },
        { signalType: 3, signalLevel: 4, dBm: -74 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('gsm/good/-96; cdma/poor/-85; wcdma/great/-74');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0009 end');
    })

    /**
     * @tc.name   testRadioSignalList0010
     * @tc.number SUB_RADIO_SIGNALLIST_0010
     * @tc.desc   signal list #10 of 4 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0010 begin');
      const list: SignalSnapshot[] = [
        { signalType: 2, signalLevel: 4, dBm: -93 },
        { signalType: 3, signalLevel: 2, dBm: -82 },
        { signalType: 4, signalLevel: 0, dBm: -71 },
        { signalType: 5, signalLevel: 3, dBm: -60 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('cdma/great/-93; wcdma/moderate/-82; tdscdma/none/-71; lte/good/-60');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0010 end');
    })

    /**
     * @tc.name   testRadioSignalList0011
     * @tc.number SUB_RADIO_SIGNALLIST_0011
     * @tc.desc   signal list #11 of 0 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0011 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0011 end');
    })

    /**
     * @tc.name   testRadioSignalList0012
     * @tc.number SUB_RADIO_SIGNALLIST_0012
     * @tc.desc   signal list #12 of 1 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0012 begin');
      const list: SignalSnapshot[] = [{ signalType: 4, signalLevel: 1, dBm: -87 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('tdscdma/poor/-87');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0012 end');
    })

    /**
     * @tc.name   testRadioSignalList0013
     * @tc.number SUB_RADIO_SIGNALLIST_0013
     * @tc.desc   signal list #13 of 2 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0013 begin');
      const list: SignalSnapshot[] = [
        { signalType: 5, signalLevel: 2, dBm: -84 },
        { signalType: 6, signalLevel: 0, dBm: -73 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('lte/moderate/-84; nr/none/-73');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0013 end');
    })

    /**
     * @tc.name   testRadioSignalList0014
     * @tc.number SUB_RADIO_SIGNALLIST_0014
     * @tc.desc   signal list #14 of 3 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0014 begin');
      const list: SignalSnapshot[] = [
        { signalType: 6, signalLevel: 3, dBm: -81 },
        { signalType: 0, signalLevel: 1, dBm: -70 },
        { signalType: 1, signalLevel: 4, dBm: -59 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('nr/good/-81; unknown/poor/-70; gsm/great/-59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0014 end');
    })

    /**
     * @tc.name   testRadioSignalList0015
     * @tc.number SUB_RADIO_SIGNALLIST_0015
     * @tc.desc   signal list #15 of 4 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0015 begin');
      const list: SignalSnapshot[] = [
        { signalType: 0, signalLevel: 4, dBm: -78 },
        { signalType: 1, signalLevel: 2, dBm: -67 },
        { signalType: 2, signalLevel: 0, dBm: -56 },
        { signalType: 3, signalLevel: 3, dBm: -45 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/great/-78; gsm/moderate/-67; cdma/none/-56; wcdma/good/-45');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0015 end');
    })

    /**
     * @tc.name   testRadioSignalList0016
     * @tc.number SUB_RADIO_SIGNALLIST_0016
     * @tc.desc   signal list #16 of 0 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0016 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0016 end');
    })

    /**
     * @tc.name   testRadioSignalList0017
     * @tc.number SUB_RADIO_SIGNALLIST_0017
     * @tc.desc   signal list #17 of 1 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0017 begin');
      const list: SignalSnapshot[] = [{ signalType: 2, signalLevel: 1, dBm: -72 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('cdma/poor/-72'));
      expect(result).assertEqual('cdma/poor/-72');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0017 end');
    })

    /**
     * @tc.name   testRadioSignalList0018
     * @tc.number SUB_RADIO_SIGNALLIST_0018
     * @tc.desc   signal list #18 of 2 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0018 begin');
      const list: SignalSnapshot[] = [
        { signalType: 3, signalLevel: 2, dBm: -69 },
        { signalType: 4, signalLevel: 0, dBm: -58 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('wcdma/moderate/-69; tdscdma/none/-58');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0018 end');
    })

    /**
     * @tc.name   testRadioSignalList0019
     * @tc.number SUB_RADIO_SIGNALLIST_0019
     * @tc.desc   signal list #19 of 3 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0019 begin');
      const list: SignalSnapshot[] = [
        { signalType: 4, signalLevel: 3, dBm: -66 },
        { signalType: 5, signalLevel: 1, dBm: -55 },
        { signalType: 6, signalLevel: 4, dBm: -44 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('tdscdma/good/-66; lte/poor/-55; nr/great/-44');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0019 end');
    })

    /**
     * @tc.name   testRadioSignalList0020
     * @tc.number SUB_RADIO_SIGNALLIST_0020
     * @tc.desc   signal list #20 of 4 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0020 begin');
      const list: SignalSnapshot[] = [
        { signalType: 5, signalLevel: 4, dBm: -63 },
        { signalType: 6, signalLevel: 2, dBm: -52 },
        { signalType: 0, signalLevel: 0, dBm: -41 },
        { signalType: 1, signalLevel: 3, dBm: -30 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('lte/great/-63; nr/moderate/-52; unknown/none/-41; gsm/good/-30');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0020 end');
    })

    /**
     * @tc.name   testRadioSignalList0021
     * @tc.number SUB_RADIO_SIGNALLIST_0021
     * @tc.desc   signal list #21 of 0 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0021 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0021 end');
    })

    /**
     * @tc.name   testRadioSignalList0022
     * @tc.number SUB_RADIO_SIGNALLIST_0022
     * @tc.desc   signal list #22 of 1 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0022 begin');
      const list: SignalSnapshot[] = [{ signalType: 0, signalLevel: 1, dBm: -57 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/poor/-57');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0022 end');
    })

    /**
     * @tc.name   testRadioSignalList0023
     * @tc.number SUB_RADIO_SIGNALLIST_0023
     * @tc.desc   signal list #23 of 2 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0023 begin');
      const list: SignalSnapshot[] = [
        { signalType: 1, signalLevel: 2, dBm: -54 },
        { signalType: 2, signalLevel: 0, dBm: -43 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('gsm/moderate/-54; cdma/none/-43');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0023 end');
    })

    /**
     * @tc.name   testRadioSignalList0024
     * @tc.number SUB_RADIO_SIGNALLIST_0024
     * @tc.desc   signal list #24 of 3 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0024 begin');
      const list: SignalSnapshot[] = [
        { signalType: 2, signalLevel: 3, dBm: -51 },
        { signalType: 3, signalLevel: 1, dBm: -40 },
        { signalType: 4, signalLevel: 4, dBm: -29 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('cdma/good/-51; wcdma/poor/-40; tdscdma/great/-29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0024 end');
    })

    /**
     * @tc.name   testRadioSignalList0025
     * @tc.number SUB_RADIO_SIGNALLIST_0025
     * @tc.desc   signal list #25 of 4 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0025 begin');
      const list: SignalSnapshot[] = [
        { signalType: 3, signalLevel: 4, dBm: -48 },
        { signalType: 4, signalLevel: 2, dBm: -37 },
        { signalType: 5, signalLevel: 0, dBm: -26 },
        { signalType: 6, signalLevel: 3, dBm: -115 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('wcdma/great/-48; tdscdma/moderate/-37; lte/none/-26; nr/good/-115');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0025 end');
    })

    /**
     * @tc.name   testRadioSignalList0026
     * @tc.number SUB_RADIO_SIGNALLIST_0026
     * @tc.desc   signal list #26 of 0 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0026 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0026 end');
    })

    /**
     * @tc.name   testRadioSignalList0027
     * @tc.number SUB_RADIO_SIGNALLIST_0027
     * @tc.desc   signal list #27 of 1 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0027 begin');
      const list: SignalSnapshot[] = [{ signalType: 5, signalLevel: 1, dBm: -42 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('lte/poor/-42'));
      expect(result).assertEqual('lte/poor/-42');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0027 end');
    })

    /**
     * @tc.name   testRadioSignalList0028
     * @tc.number SUB_RADIO_SIGNALLIST_0028
     * @tc.desc   signal list #28 of 2 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0028 begin');
      const list: SignalSnapshot[] = [
        { signalType: 6, signalLevel: 2, dBm: -39 },
        { signalType: 0, signalLevel: 0, dBm: -28 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('nr/moderate/-39; unknown/none/-28');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0028 end');
    })

    /**
     * @tc.name   testRadioSignalList0029
     * @tc.number SUB_RADIO_SIGNALLIST_0029
     * @tc.desc   signal list #29 of 3 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0029 begin');
      const list: SignalSnapshot[] = [
        { signalType: 0, signalLevel: 3, dBm: -36 },
        { signalType: 1, signalLevel: 1, dBm: -25 },
        { signalType: 2, signalLevel: 4, dBm: -114 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/good/-36; gsm/poor/-25; cdma/great/-114');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0029 end');
    })

    /**
     * @tc.name   testRadioSignalList0030
     * @tc.number SUB_RADIO_SIGNALLIST_0030
     * @tc.desc   signal list #30 of 4 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0030 begin');
      const list: SignalSnapshot[] = [
        { signalType: 1, signalLevel: 4, dBm: -33 },
        { signalType: 2, signalLevel: 2, dBm: -22 },
        { signalType: 3, signalLevel: 0, dBm: -111 },
        { signalType: 4, signalLevel: 3, dBm: -100 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('gsm/great/-33; cdma/moderate/-22; wcdma/none/-111; tdscdma/good/-100');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0030 end');
    })

    /**
     * @tc.name   testRadioSignalList0031
     * @tc.number SUB_RADIO_SIGNALLIST_0031
     * @tc.desc   signal list #31 of 0 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0031 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0031 end');
    })

    /**
     * @tc.name   testRadioSignalList0032
     * @tc.number SUB_RADIO_SIGNALLIST_0032
     * @tc.desc   signal list #32 of 1 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0032 begin');
      const list: SignalSnapshot[] = [{ signalType: 3, signalLevel: 1, dBm: -27 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('wcdma/poor/-27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0032 end');
    })

    /**
     * @tc.name   testRadioSignalList0033
     * @tc.number SUB_RADIO_SIGNALLIST_0033
     * @tc.desc   signal list #33 of 2 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0033 begin');
      const list: SignalSnapshot[] = [
        { signalType: 4, signalLevel: 2, dBm: -24 },
        { signalType: 5, signalLevel: 0, dBm: -113 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('tdscdma/moderate/-24; lte/none/-113');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0033 end');
    })

    /**
     * @tc.name   testRadioSignalList0034
     * @tc.number SUB_RADIO_SIGNALLIST_0034
     * @tc.desc   signal list #34 of 3 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0034 begin');
      const list: SignalSnapshot[] = [
        { signalType: 5, signalLevel: 3, dBm: -21 },
        { signalType: 6, signalLevel: 1, dBm: -110 },
        { signalType: 0, signalLevel: 4, dBm: -99 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('lte/good/-21; nr/poor/-110; unknown/great/-99');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0034 end');
    })

    /**
     * @tc.name   testRadioSignalList0035
     * @tc.number SUB_RADIO_SIGNALLIST_0035
     * @tc.desc   signal list #35 of 4 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0035 begin');
      const list: SignalSnapshot[] = [
        { signalType: 6, signalLevel: 4, dBm: -118 },
        { signalType: 0, signalLevel: 2, dBm: -107 },
        { signalType: 1, signalLevel: 0, dBm: -96 },
        { signalType: 2, signalLevel: 3, dBm: -85 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('nr/great/-118; unknown/moderate/-107; gsm/none/-96; cdma/good/-85');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0035 end');
    })

    /**
     * @tc.name   testRadioSignalList0036
     * @tc.number SUB_RADIO_SIGNALLIST_0036
     * @tc.desc   signal list #36 of 0 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0036 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0036 end');
    })

    /**
     * @tc.name   testRadioSignalList0037
     * @tc.number SUB_RADIO_SIGNALLIST_0037
     * @tc.desc   signal list #37 of 1 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0037 begin');
      const list: SignalSnapshot[] = [{ signalType: 1, signalLevel: 1, dBm: -112 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('gsm/poor/-112'));
      expect(result).assertEqual('gsm/poor/-112');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0037 end');
    })

    /**
     * @tc.name   testRadioSignalList0038
     * @tc.number SUB_RADIO_SIGNALLIST_0038
     * @tc.desc   signal list #38 of 2 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0038 begin');
      const list: SignalSnapshot[] = [
        { signalType: 2, signalLevel: 2, dBm: -109 },
        { signalType: 3, signalLevel: 0, dBm: -98 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('cdma/moderate/-109; wcdma/none/-98');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0038 end');
    })

    /**
     * @tc.name   testRadioSignalList0039
     * @tc.number SUB_RADIO_SIGNALLIST_0039
     * @tc.desc   signal list #39 of 3 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0039 begin');
      const list: SignalSnapshot[] = [
        { signalType: 3, signalLevel: 3, dBm: -106 },
        { signalType: 4, signalLevel: 1, dBm: -95 },
        { signalType: 5, signalLevel: 4, dBm: -84 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('wcdma/good/-106; tdscdma/poor/-95; lte/great/-84');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0039 end');
    })

    /**
     * @tc.name   testRadioSignalList0040
     * @tc.number SUB_RADIO_SIGNALLIST_0040
     * @tc.desc   signal list #40 of 4 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0040 begin');
      const list: SignalSnapshot[] = [
        { signalType: 4, signalLevel: 4, dBm: -103 },
        { signalType: 5, signalLevel: 2, dBm: -92 },
        { signalType: 6, signalLevel: 0, dBm: -81 },
        { signalType: 0, signalLevel: 3, dBm: -70 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('tdscdma/great/-103; lte/moderate/-92; nr/none/-81; unknown/good/-70');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0040 end');
    })

    /**
     * @tc.name   testRadioSignalList0041
     * @tc.number SUB_RADIO_SIGNALLIST_0041
     * @tc.desc   signal list #41 of 0 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0041 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0041 end');
    })

    /**
     * @tc.name   testRadioSignalList0042
     * @tc.number SUB_RADIO_SIGNALLIST_0042
     * @tc.desc   signal list #42 of 1 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0042 begin');
      const list: SignalSnapshot[] = [{ signalType: 6, signalLevel: 1, dBm: -97 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('nr/poor/-97'));
      expect(result).assertEqual('nr/poor/-97');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0042 end');
    })

    /**
     * @tc.name   testRadioSignalList0043
     * @tc.number SUB_RADIO_SIGNALLIST_0043
     * @tc.desc   signal list #43 of 2 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0043 begin');
      const list: SignalSnapshot[] = [
        { signalType: 0, signalLevel: 2, dBm: -94 },
        { signalType: 1, signalLevel: 0, dBm: -83 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/moderate/-94; gsm/none/-83');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0043 end');
    })

    /**
     * @tc.name   testRadioSignalList0044
     * @tc.number SUB_RADIO_SIGNALLIST_0044
     * @tc.desc   signal list #44 of 3 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0044 begin');
      const list: SignalSnapshot[] = [
        { signalType: 1, signalLevel: 3, dBm: -91 },
        { signalType: 2, signalLevel: 1, dBm: -80 },
        { signalType: 3, signalLevel: 4, dBm: -69 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('gsm/good/-91; cdma/poor/-80; wcdma/great/-69');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0044 end');
    })

    /**
     * @tc.name   testRadioSignalList0045
     * @tc.number SUB_RADIO_SIGNALLIST_0045
     * @tc.desc   signal list #45 of 4 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0045 begin');
      const list: SignalSnapshot[] = [
        { signalType: 2, signalLevel: 4, dBm: -88 },
        { signalType: 3, signalLevel: 2, dBm: -77 },
        { signalType: 4, signalLevel: 0, dBm: -66 },
        { signalType: 5, signalLevel: 3, dBm: -55 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('cdma/great/-88; wcdma/moderate/-77; tdscdma/none/-66; lte/good/-55');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0045 end');
    })

    /**
     * @tc.name   testRadioSignalList0046
     * @tc.number SUB_RADIO_SIGNALLIST_0046
     * @tc.desc   signal list #46 of 0 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0046 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0046 end');
    })

    /**
     * @tc.name   testRadioSignalList0047
     * @tc.number SUB_RADIO_SIGNALLIST_0047
     * @tc.desc   signal list #47 of 1 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0047 begin');
      const list: SignalSnapshot[] = [{ signalType: 4, signalLevel: 1, dBm: -82 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('tdscdma/poor/-82');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0047 end');
    })

    /**
     * @tc.name   testRadioSignalList0048
     * @tc.number SUB_RADIO_SIGNALLIST_0048
     * @tc.desc   signal list #48 of 2 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0048 begin');
      const list: SignalSnapshot[] = [
        { signalType: 5, signalLevel: 2, dBm: -79 },
        { signalType: 6, signalLevel: 0, dBm: -68 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('lte/moderate/-79; nr/none/-68');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0048 end');
    })

    /**
     * @tc.name   testRadioSignalList0049
     * @tc.number SUB_RADIO_SIGNALLIST_0049
     * @tc.desc   signal list #49 of 3 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0049 begin');
      const list: SignalSnapshot[] = [
        { signalType: 6, signalLevel: 3, dBm: -76 },
        { signalType: 0, signalLevel: 1, dBm: -65 },
        { signalType: 1, signalLevel: 4, dBm: -54 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('nr/good/-76; unknown/poor/-65; gsm/great/-54');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0049 end');
    })

    /**
     * @tc.name   testRadioSignalList0050
     * @tc.number SUB_RADIO_SIGNALLIST_0050
     * @tc.desc   signal list #50 of 4 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0050 begin');
      const list: SignalSnapshot[] = [
        { signalType: 0, signalLevel: 4, dBm: -73 },
        { signalType: 1, signalLevel: 2, dBm: -62 },
        { signalType: 2, signalLevel: 0, dBm: -51 },
        { signalType: 3, signalLevel: 3, dBm: -40 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/great/-73; gsm/moderate/-62; cdma/none/-51; wcdma/good/-40');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0050 end');
    })

    /**
     * @tc.name   testRadioSignalList0051
     * @tc.number SUB_RADIO_SIGNALLIST_0051
     * @tc.desc   signal list #51 of 0 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0051 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0051 end');
    })

    /**
     * @tc.name   testRadioSignalList0052
     * @tc.number SUB_RADIO_SIGNALLIST_0052
     * @tc.desc   signal list #52 of 1 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0052 begin');
      const list: SignalSnapshot[] = [{ signalType: 2, signalLevel: 1, dBm: -67 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('cdma/poor/-67'));
      expect(result).assertEqual('cdma/poor/-67');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0052 end');
    })

    /**
     * @tc.name   testRadioSignalList0053
     * @tc.number SUB_RADIO_SIGNALLIST_0053
     * @tc.desc   signal list #53 of 2 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0053 begin');
      const list: SignalSnapshot[] = [
        { signalType: 3, signalLevel: 2, dBm: -64 },
        { signalType: 4, signalLevel: 0, dBm: -53 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('wcdma/moderate/-64; tdscdma/none/-53');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0053 end');
    })

    /**
     * @tc.name   testRadioSignalList0054
     * @tc.number SUB_RADIO_SIGNALLIST_0054
     * @tc.desc   signal list #54 of 3 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0054 begin');
      const list: SignalSnapshot[] = [
        { signalType: 4, signalLevel: 3, dBm: -61 },
        { signalType: 5, signalLevel: 1, dBm: -50 },
        { signalType: 6, signalLevel: 4, dBm: -39 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('tdscdma/good/-61; lte/poor/-50; nr/great/-39');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0054 end');
    })

    /**
     * @tc.name   testRadioSignalList0055
     * @tc.number SUB_RADIO_SIGNALLIST_0055
     * @tc.desc   signal list #55 of 4 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0055 begin');
      const list: SignalSnapshot[] = [
        { signalType: 5, signalLevel: 4, dBm: -58 },
        { signalType: 6, signalLevel: 2, dBm: -47 },
        { signalType: 0, signalLevel: 0, dBm: -36 },
        { signalType: 1, signalLevel: 3, dBm: -25 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('lte/great/-58; nr/moderate/-47; unknown/none/-36; gsm/good/-25');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0055 end');
    })

    /**
     * @tc.name   testRadioSignalList0056
     * @tc.number SUB_RADIO_SIGNALLIST_0056
     * @tc.desc   signal list #56 of 0 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0056 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0056 end');
    })

    /**
     * @tc.name   testRadioSignalList0057
     * @tc.number SUB_RADIO_SIGNALLIST_0057
     * @tc.desc   signal list #57 of 1 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0057 begin');
      const list: SignalSnapshot[] = [{ signalType: 0, signalLevel: 1, dBm: -52 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/poor/-52');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0057 end');
    })

    /**
     * @tc.name   testRadioSignalList0058
     * @tc.number SUB_RADIO_SIGNALLIST_0058
     * @tc.desc   signal list #58 of 2 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0058 begin');
      const list: SignalSnapshot[] = [
        { signalType: 1, signalLevel: 2, dBm: -49 },
        { signalType: 2, signalLevel: 0, dBm: -38 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('gsm/moderate/-49; cdma/none/-38');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0058 end');
    })

    /**
     * @tc.name   testRadioSignalList0059
     * @tc.number SUB_RADIO_SIGNALLIST_0059
     * @tc.desc   signal list #59 of 3 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0059 begin');
      const list: SignalSnapshot[] = [
        { signalType: 2, signalLevel: 3, dBm: -46 },
        { signalType: 3, signalLevel: 1, dBm: -35 },
        { signalType: 4, signalLevel: 4, dBm: -24 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('cdma/good/-46; wcdma/poor/-35; tdscdma/great/-24');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0059 end');
    })

    /**
     * @tc.name   testRadioSignalList0060
     * @tc.number SUB_RADIO_SIGNALLIST_0060
     * @tc.desc   signal list #60 of 4 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0060 begin');
      const list: SignalSnapshot[] = [
        { signalType: 3, signalLevel: 4, dBm: -43 },
        { signalType: 4, signalLevel: 2, dBm: -32 },
        { signalType: 5, signalLevel: 0, dBm: -21 },
        { signalType: 6, signalLevel: 3, dBm: -110 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('wcdma/great/-43; tdscdma/moderate/-32; lte/none/-21; nr/good/-110');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0060 end');
    })

    /**
     * @tc.name   testRadioSignalList0061
     * @tc.number SUB_RADIO_SIGNALLIST_0061
     * @tc.desc   signal list #61 of 0 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0061 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0061 end');
    })

    /**
     * @tc.name   testRadioSignalList0062
     * @tc.number SUB_RADIO_SIGNALLIST_0062
     * @tc.desc   signal list #62 of 1 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0062 begin');
      const list: SignalSnapshot[] = [{ signalType: 5, signalLevel: 1, dBm: -37 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('lte/poor/-37'));
      expect(result).assertEqual('lte/poor/-37');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0062 end');
    })

    /**
     * @tc.name   testRadioSignalList0063
     * @tc.number SUB_RADIO_SIGNALLIST_0063
     * @tc.desc   signal list #63 of 2 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0063 begin');
      const list: SignalSnapshot[] = [
        { signalType: 6, signalLevel: 2, dBm: -34 },
        { signalType: 0, signalLevel: 0, dBm: -23 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('nr/moderate/-34; unknown/none/-23');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0063 end');
    })

    /**
     * @tc.name   testRadioSignalList0064
     * @tc.number SUB_RADIO_SIGNALLIST_0064
     * @tc.desc   signal list #64 of 3 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0064 begin');
      const list: SignalSnapshot[] = [
        { signalType: 0, signalLevel: 3, dBm: -31 },
        { signalType: 1, signalLevel: 1, dBm: -120 },
        { signalType: 2, signalLevel: 4, dBm: -109 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/good/-31; gsm/poor/-120; cdma/great/-109');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0064 end');
    })

    /**
     * @tc.name   testRadioSignalList0065
     * @tc.number SUB_RADIO_SIGNALLIST_0065
     * @tc.desc   signal list #65 of 4 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0065 begin');
      const list: SignalSnapshot[] = [
        { signalType: 1, signalLevel: 4, dBm: -28 },
        { signalType: 2, signalLevel: 2, dBm: -117 },
        { signalType: 3, signalLevel: 0, dBm: -106 },
        { signalType: 4, signalLevel: 3, dBm: -95 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('gsm/great/-28; cdma/moderate/-117; wcdma/none/-106; tdscdma/good/-95');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0065 end');
    })

    /**
     * @tc.name   testRadioSignalList0066
     * @tc.number SUB_RADIO_SIGNALLIST_0066
     * @tc.desc   signal list #66 of 0 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0066 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0066 end');
    })

    /**
     * @tc.name   testRadioSignalList0067
     * @tc.number SUB_RADIO_SIGNALLIST_0067
     * @tc.desc   signal list #67 of 1 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0067 begin');
      const list: SignalSnapshot[] = [{ signalType: 3, signalLevel: 1, dBm: -22 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('wcdma/poor/-22');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0067 end');
    })

    /**
     * @tc.name   testRadioSignalList0068
     * @tc.number SUB_RADIO_SIGNALLIST_0068
     * @tc.desc   signal list #68 of 2 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0068 begin');
      const list: SignalSnapshot[] = [
        { signalType: 4, signalLevel: 2, dBm: -119 },
        { signalType: 5, signalLevel: 0, dBm: -108 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('tdscdma/moderate/-119; lte/none/-108');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0068 end');
    })

    /**
     * @tc.name   testRadioSignalList0069
     * @tc.number SUB_RADIO_SIGNALLIST_0069
     * @tc.desc   signal list #69 of 3 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0069 begin');
      const list: SignalSnapshot[] = [
        { signalType: 5, signalLevel: 3, dBm: -116 },
        { signalType: 6, signalLevel: 1, dBm: -105 },
        { signalType: 0, signalLevel: 4, dBm: -94 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('lte/good/-116; nr/poor/-105; unknown/great/-94');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0069 end');
    })

    /**
     * @tc.name   testRadioSignalList0070
     * @tc.number SUB_RADIO_SIGNALLIST_0070
     * @tc.desc   signal list #70 of 4 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0070 begin');
      const list: SignalSnapshot[] = [
        { signalType: 6, signalLevel: 4, dBm: -113 },
        { signalType: 0, signalLevel: 2, dBm: -102 },
        { signalType: 1, signalLevel: 0, dBm: -91 },
        { signalType: 2, signalLevel: 3, dBm: -80 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('nr/great/-113; unknown/moderate/-102; gsm/none/-91; cdma/good/-80');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0070 end');
    })

    /**
     * @tc.name   testRadioSignalList0071
     * @tc.number SUB_RADIO_SIGNALLIST_0071
     * @tc.desc   signal list #71 of 0 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0071 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0071 end');
    })

    /**
     * @tc.name   testRadioSignalList0072
     * @tc.number SUB_RADIO_SIGNALLIST_0072
     * @tc.desc   signal list #72 of 1 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0072 begin');
      const list: SignalSnapshot[] = [{ signalType: 1, signalLevel: 1, dBm: -107 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('gsm/poor/-107'));
      expect(result).assertEqual('gsm/poor/-107');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0072 end');
    })

    /**
     * @tc.name   testRadioSignalList0073
     * @tc.number SUB_RADIO_SIGNALLIST_0073
     * @tc.desc   signal list #73 of 2 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0073 begin');
      const list: SignalSnapshot[] = [
        { signalType: 2, signalLevel: 2, dBm: -104 },
        { signalType: 3, signalLevel: 0, dBm: -93 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('cdma/moderate/-104; wcdma/none/-93');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0073 end');
    })

    /**
     * @tc.name   testRadioSignalList0074
     * @tc.number SUB_RADIO_SIGNALLIST_0074
     * @tc.desc   signal list #74 of 3 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0074 begin');
      const list: SignalSnapshot[] = [
        { signalType: 3, signalLevel: 3, dBm: -101 },
        { signalType: 4, signalLevel: 1, dBm: -90 },
        { signalType: 5, signalLevel: 4, dBm: -79 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('wcdma/good/-101; tdscdma/poor/-90; lte/great/-79');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0074 end');
    })

    /**
     * @tc.name   testRadioSignalList0075
     * @tc.number SUB_RADIO_SIGNALLIST_0075
     * @tc.desc   signal list #75 of 4 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0075 begin');
      const list: SignalSnapshot[] = [
        { signalType: 4, signalLevel: 4, dBm: -98 },
        { signalType: 5, signalLevel: 2, dBm: -87 },
        { signalType: 6, signalLevel: 0, dBm: -76 },
        { signalType: 0, signalLevel: 3, dBm: -65 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('tdscdma/great/-98; lte/moderate/-87; nr/none/-76; unknown/good/-65');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0075 end');
    })

    /**
     * @tc.name   testRadioSignalList0076
     * @tc.number SUB_RADIO_SIGNALLIST_0076
     * @tc.desc   signal list #76 of 0 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0076 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0076 end');
    })

    /**
     * @tc.name   testRadioSignalList0077
     * @tc.number SUB_RADIO_SIGNALLIST_0077
     * @tc.desc   signal list #77 of 1 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0077 begin');
      const list: SignalSnapshot[] = [{ signalType: 6, signalLevel: 1, dBm: -92 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('nr/poor/-92'));
      expect(result).assertEqual('nr/poor/-92');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0077 end');
    })

    /**
     * @tc.name   testRadioSignalList0078
     * @tc.number SUB_RADIO_SIGNALLIST_0078
     * @tc.desc   signal list #78 of 2 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0078 begin');
      const list: SignalSnapshot[] = [
        { signalType: 0, signalLevel: 2, dBm: -89 },
        { signalType: 1, signalLevel: 0, dBm: -78 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/moderate/-89; gsm/none/-78');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0078 end');
    })

    /**
     * @tc.name   testRadioSignalList0079
     * @tc.number SUB_RADIO_SIGNALLIST_0079
     * @tc.desc   signal list #79 of 3 entries keeps order and separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0079 begin');
      const list: SignalSnapshot[] = [
        { signalType: 1, signalLevel: 3, dBm: -86 },
        { signalType: 2, signalLevel: 1, dBm: -75 },
        { signalType: 3, signalLevel: 4, dBm: -64 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('gsm/good/-86; cdma/poor/-75; wcdma/great/-64');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0079 end');
    })

    /**
     * @tc.name   testRadioSignalList0080
     * @tc.number SUB_RADIO_SIGNALLIST_0080
     * @tc.desc   空信号列表返回 not available 且 bestLevel 为 -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalList0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0080 begin');
      const anchorResult: string = SignalFormatter.formatList([]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(anchorResult));
      expect(anchorResult).assertEqual('not available');
      expect(SignalFormatter.bestLevel([])).assertEqual(-1);
      expect(anchorResult.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalList0080 end');
    })
  })
}
