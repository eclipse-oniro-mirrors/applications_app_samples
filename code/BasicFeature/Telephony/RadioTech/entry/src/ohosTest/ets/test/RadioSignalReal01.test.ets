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

export default function radioSignalReal01Test() {
  describe('RadioSignalReal01Test', () => {

    /**
     * @tc.name   testSignalReal0001
     * @tc.number SUB_RADIO_SIGREAL_0001
     * @tc.desc   single signal 1 formats type, level and raw dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0001 begin');
      const snap: SignalSnapshot = { signalType: 6, signalLevel: 4, dBm: -50 };
      const result: string = SignalFormatter.formatSignal(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('nr/great/-50'));
      expect(result).assertEqual('nr/great/-50');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.endsWith(String(-50))));
      expect(result.endsWith(String(-50))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0001 end');
    })

    /**
     * @tc.name   testSignalReal0002
     * @tc.number SUB_RADIO_SIGREAL_0002
     * @tc.desc   single signal 2 formats type, level and raw dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0002 begin');
      const snap: SignalSnapshot = { signalType: 5, signalLevel: 3, dBm: -90 };
      const result: string = SignalFormatter.formatSignal(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.typeName(5)));
      expect(SignalFormatter.typeName(5)).assertEqual('lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.levelName(3)));
      expect(SignalFormatter.levelName(3)).assertEqual('good');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('/')));
      expect(result.includes('/')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0002 end');
    })

    /**
     * @tc.name   testSignalReal0003
     * @tc.number SUB_RADIO_SIGREAL_0003
     * @tc.desc   single signal 3 formats type, level and raw dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0003 begin');
      const snap: SignalSnapshot = { signalType: 4, signalLevel: 2, dBm: -100 };
      const result: string = SignalFormatter.formatSignal(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('tdscdma/moderate/-100');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.typeName(4)));
      expect(SignalFormatter.typeName(4)).assertEqual('tdscdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.indexOf('//') >= 0));
      expect(result.indexOf('//') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0003 end');
    })

    /**
     * @tc.name   testSignalReal0004
     * @tc.number SUB_RADIO_SIGREAL_0004
     * @tc.desc   single signal 4 formats type, level and raw dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0004 begin');
      const snap: SignalSnapshot = { signalType: 3, signalLevel: 1, dBm: -110 };
      const result: string = SignalFormatter.formatSignal(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('wcdma/poor/-110');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.endsWith(String(-110))));
      expect(result.endsWith(String(-110))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0004 end');
    })

    /**
     * @tc.name   testSignalReal0005
     * @tc.number SUB_RADIO_SIGREAL_0005
     * @tc.desc   single signal 5 formats type, level and raw dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0005 begin');
      const snap: SignalSnapshot = { signalType: 2, signalLevel: 0, dBm: -120 };
      const result: string = SignalFormatter.formatSignal(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.typeName(2)));
      expect(SignalFormatter.typeName(2)).assertEqual('cdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.levelName(0)));
      expect(SignalFormatter.levelName(0)).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('/')));
      expect(result.includes('/')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0005 end');
    })

    /**
     * @tc.name   testSignalReal0006
     * @tc.number SUB_RADIO_SIGREAL_0006
     * @tc.desc   single signal 6 formats type, level and raw dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0006 begin');
      const snap: SignalSnapshot = { signalType: 1, signalLevel: 2, dBm: -95 };
      const result: string = SignalFormatter.formatSignal(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('gsm/moderate/-95');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.typeName(1)));
      expect(SignalFormatter.typeName(1)).assertEqual('gsm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.indexOf('//') >= 0));
      expect(result.indexOf('//') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0006 end');
    })

    /**
     * @tc.name   testSignalReal0007
     * @tc.number SUB_RADIO_SIGREAL_0007
     * @tc.desc   single signal 7 formats type, level and raw dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0007 begin');
      const snap: SignalSnapshot = { signalType: 0, signalLevel: 1, dBm: -88 };
      const result: string = SignalFormatter.formatSignal(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/poor/-88');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.endsWith(String(-88))));
      expect(result.endsWith(String(-88))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0007 end');
    })

    /**
     * @tc.name   testSignalReal0008
     * @tc.number SUB_RADIO_SIGREAL_0008
     * @tc.desc   single signal 8 formats type, level and raw dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0008 begin');
      const snap: SignalSnapshot = { signalType: 6, signalLevel: 0, dBm: -140 };
      const result: string = SignalFormatter.formatSignal(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.typeName(6)));
      expect(SignalFormatter.typeName(6)).assertEqual('nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.levelName(0)));
      expect(SignalFormatter.levelName(0)).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('/')));
      expect(result.includes('/')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0008 end');
    })

    /**
     * @tc.name   testSignalReal0009
     * @tc.number SUB_RADIO_SIGREAL_0009
     * @tc.desc   single signal 9 formats type, level and raw dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0009 begin');
      const snap: SignalSnapshot = { signalType: 5, signalLevel: 4, dBm: -45 };
      const result: string = SignalFormatter.formatSignal(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('lte/great/-45'));
      expect(result).assertEqual('lte/great/-45');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.typeName(5)));
      expect(SignalFormatter.typeName(5)).assertEqual('lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.indexOf('//') >= 0));
      expect(result.indexOf('//') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0009 end');
    })

    /**
     * @tc.name   testSignalReal0010
     * @tc.number SUB_RADIO_SIGREAL_0010
     * @tc.desc   single signal 10 formats type, level and raw dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0010 begin');
      const snap: SignalSnapshot = { signalType: 7, signalLevel: 4, dBm: 0 };
      const result: string = SignalFormatter.formatSignal(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/great/0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.endsWith(String(0))));
      expect(result.endsWith(String(0))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0010 end');
    })

    /**
     * @tc.name   testSignalReal0011
     * @tc.number SUB_RADIO_SIGREAL_0011
     * @tc.desc   single signal 11 formats type, level and raw dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0011 begin');
      const snap: SignalSnapshot = { signalType: 5, signalLevel: 5, dBm: -80 };
      const result: string = SignalFormatter.formatSignal(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.typeName(5)));
      expect(SignalFormatter.typeName(5)).assertEqual('lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.levelName(5)));
      expect(SignalFormatter.levelName(5)).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('/')));
      expect(result.includes('/')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0011 end');
    })

    /**
     * @tc.name   testSignalReal0012
     * @tc.number SUB_RADIO_SIGREAL_0012
     * @tc.desc   single signal 12 formats type, level and raw dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0012 begin');
      const snap: SignalSnapshot = { signalType: 4, signalLevel: -1, dBm: -70 };
      const result: string = SignalFormatter.formatSignal(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('tdscdma/none/-70');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.typeName(4)));
      expect(SignalFormatter.typeName(4)).assertEqual('tdscdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.indexOf('//') >= 0));
      expect(result.indexOf('//') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0012 end');
    })

    /**
     * @tc.name   testSignalReal0013
     * @tc.number SUB_RADIO_SIGREAL_0013
     * @tc.desc   single signal 13 formats type, level and raw dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0013 begin');
      const snap: SignalSnapshot = { signalType: -1, signalLevel: 3, dBm: -60 };
      const result: string = SignalFormatter.formatSignal(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/good/-60');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.endsWith(String(-60))));
      expect(result.endsWith(String(-60))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0013 end');
    })

    /**
     * @tc.name   testSignalReal0014
     * @tc.number SUB_RADIO_SIGREAL_0014
     * @tc.desc   single signal 14 formats type, level and raw dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0014 begin');
      const snap: SignalSnapshot = { signalType: 2.5, signalLevel: 2, dBm: -77 };
      const result: string = SignalFormatter.formatSignal(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.typeName(2.5)));
      expect(SignalFormatter.typeName(2.5)).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.levelName(2)));
      expect(SignalFormatter.levelName(2)).assertEqual('moderate');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('/')));
      expect(result.includes('/')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0014 end');
    })

    /**
     * @tc.name   testSignalReal0015
     * @tc.number SUB_RADIO_SIGREAL_0015
     * @tc.desc   single signal 15 formats type, level and raw dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0015 begin');
      const snap: SignalSnapshot = { signalType: Number.NaN, signalLevel: Number.NaN, dBm: -123 };
      const result: string = SignalFormatter.formatSignal(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/none/-123');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.typeName(Number.NaN)));
      expect(SignalFormatter.typeName(Number.NaN)).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.indexOf('//') >= 0));
      expect(result.indexOf('//') >= 0).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0015 end');
    })

    /**
     * @tc.name   testSignalReal0016
     * @tc.number SUB_RADIO_SIGREAL_0016
     * @tc.desc   single signal 16 formats type, level and raw dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0016 begin');
      const snap: SignalSnapshot = { signalType: 6, signalLevel: 4, dBm: Number.POSITIVE_INFINITY };
      const result: string = SignalFormatter.formatSignal(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('nr/great/Infinity');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.endsWith(String(Number.POSITIVE_INFINITY))));
      expect(result.endsWith(String(Number.POSITIVE_INFINITY))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0016 end');
    })

    /**
     * @tc.name   testSignalReal0017
     * @tc.number SUB_RADIO_SIGREAL_0017
     * @tc.desc   single signal 17 formats type, level and raw dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0017 begin');
      const snap: SignalSnapshot = { signalType: 5, signalLevel: 0, dBm: Number.NEGATIVE_INFINITY };
      const result: string = SignalFormatter.formatSignal(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.typeName(5)));
      expect(SignalFormatter.typeName(5)).assertEqual('lte');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.levelName(0)));
      expect(SignalFormatter.levelName(0)).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('/')));
      expect(result.includes('/')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0017 end');
    })

    /**
     * @tc.name   testSignalReal0018
     * @tc.number SUB_RADIO_SIGREAL_0018
     * @tc.desc   single signal 18 formats type, level and raw dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0018 begin');
      const snap: SignalSnapshot = { signalType: -0, signalLevel: 0, dBm: -0 };
      const result: string = SignalFormatter.formatSignal(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/none/0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.endsWith(String(-0))));
      expect(result.endsWith(String(-0))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0018 end');
    })

    /**
     * @tc.name   testSignalReal0019
     * @tc.number SUB_RADIO_SIGREAL_0019
     * @tc.desc   signal list 1 keeps order and aggregates level and dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0019 begin');
      const list: SignalSnapshot[] = [
        { signalType: 6, signalLevel: 4, dBm: -50 },
        { signalType: 5, signalLevel: 3, dBm: -90 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatList(list)));
      expect(SignalFormatter.formatList(list)).assertEqual('nr/great/-50; lte/good/-90');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0019 end');
    })

    /**
     * @tc.name   testSignalReal0020
     * @tc.number SUB_RADIO_SIGREAL_0020
     * @tc.desc   signal list 2 keeps order and aggregates level and dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0020 begin');
      const list: SignalSnapshot[] = [{ signalType: 5, signalLevel: 0, dBm: -100 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatList(list)));
      expect(SignalFormatter.formatList(list)).assertEqual('lte/none/-100');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0020 end');
    })

    /**
     * @tc.name   testSignalReal0021
     * @tc.number SUB_RADIO_SIGREAL_0021
     * @tc.desc   signal list 3 keeps order and aggregates level and dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0021 begin');
      const list: SignalSnapshot[] = [];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatList(list)));
      expect(SignalFormatter.formatList(list)).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0021 end');
    })

    /**
     * @tc.name   testSignalReal0022
     * @tc.number SUB_RADIO_SIGREAL_0022
     * @tc.desc   signal list 4 keeps order and aggregates level and dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0022 begin');
      const list: SignalSnapshot[] = [{ signalType: 6, signalLevel: -1, dBm: -60 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatList(list)));
      expect(SignalFormatter.formatList(list)).assertEqual('nr/none/-60');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.totalDbm(list)));
      expect(SignalFormatter.totalDbm(list)).assertEqual(-60);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0022 end');
    })

    /**
     * @tc.name   testSignalReal0023
     * @tc.number SUB_RADIO_SIGREAL_0023
     * @tc.desc   signal list 5 keeps order and aggregates level and dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0023 begin');
      const list: SignalSnapshot[] = [
        { signalType: 6, signalLevel: 0, dBm: -60 },
        { signalType: 6, signalLevel: 4, dBm: -40 },
        { signalType: 5, signalLevel: 2, dBm: -80 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatList(list)));
      expect(SignalFormatter.formatList(list)).assertEqual('nr/none/-60; nr/great/-40; lte/moderate/-80');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.hasType(list, 6)));
      expect(SignalFormatter.hasType(list, 6)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0023 end');
    })

    /**
     * @tc.name   testSignalReal0024
     * @tc.number SUB_RADIO_SIGREAL_0024
     * @tc.desc   signal list 6 keeps order and aggregates level and dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0024 begin');
      const list: SignalSnapshot[] = [
        { signalType: 5, signalLevel: 1, dBm: -90 },
        { signalType: 4, signalLevel: 2, dBm: -70 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatList(list)));
      expect(SignalFormatter.formatList(list)).assertEqual('lte/poor/-90; tdscdma/moderate/-70');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0024 end');
    })

    /**
     * @tc.name   testSignalReal0025
     * @tc.number SUB_RADIO_SIGREAL_0025
     * @tc.desc   signal list 7 keeps order and aggregates level and dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0025 begin');
      const list: SignalSnapshot[] = [
        { signalType: 0, signalLevel: 0, dBm: -120 },
        { signalType: 1, signalLevel: 1, dBm: -110 },
        { signalType: 2, signalLevel: 2, dBm: -100 },
        { signalType: 3, signalLevel: 3, dBm: -90 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatList(list)));
      expect(SignalFormatter.formatList(list))
        .assertEqual('unknown/none/-120; gsm/poor/-110; cdma/moderate/-100; wcdma/good/-90');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.totalDbm(list)));
      expect(SignalFormatter.totalDbm(list)).assertEqual(-420);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0025 end');
    })

    /**
     * @tc.name   testSignalReal0026
     * @tc.number SUB_RADIO_SIGREAL_0026
     * @tc.desc   signal list 8 keeps order and aggregates level and dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0026 begin');
      const list: SignalSnapshot[] = [{ signalType: 6, signalLevel: 3, dBm: -85 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatList(list)));
      expect(SignalFormatter.formatList(list)).assertEqual('nr/good/-85');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0026 end');
    })

    /**
     * @tc.name   testSignalReal0027
     * @tc.number SUB_RADIO_SIGREAL_0027
     * @tc.desc   signal list 9 keeps order and aggregates level and dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0027 begin');
      const list: SignalSnapshot[] = [
        { signalType: 4, signalLevel: 2, dBm: -95 },
        { signalType: 3, signalLevel: 1, dBm: -105 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatList(list)));
      expect(SignalFormatter.formatList(list)).assertEqual('tdscdma/moderate/-95; wcdma/poor/-105');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.totalDbm(list)));
      expect(SignalFormatter.totalDbm(list)).assertEqual(-200);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0027 end');
    })

    /**
     * @tc.name   testSignalReal0028
     * @tc.number SUB_RADIO_SIGREAL_0028
     * @tc.desc   signal list 10 keeps order and aggregates level and dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0028 begin');
      const list: SignalSnapshot[] = [{ signalType: 7, signalLevel: 6, dBm: -55 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatList(list)));
      expect(SignalFormatter.formatList(list)).assertEqual('unknown/none/-55');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0028 end');
    })

    /**
     * @tc.name   testSignalReal0029
     * @tc.number SUB_RADIO_SIGREAL_0029
     * @tc.desc   signal list 11 keeps order and aggregates level and dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0029 begin');
      const list: SignalSnapshot[] = [
        { signalType: 5, signalLevel: 4, dBm: -40 },
        { signalType: 6, signalLevel: 4, dBm: -42 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatList(list)));
      expect(SignalFormatter.formatList(list)).assertEqual('lte/great/-40; nr/great/-42');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.hasType(list, 6)));
      expect(SignalFormatter.hasType(list, 6)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0029 end');
    })

    /**
     * @tc.name   testSignalReal0030
     * @tc.number SUB_RADIO_SIGREAL_0030
     * @tc.desc   signal list 12 keeps order and aggregates level and dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0030 begin');
      const list: SignalSnapshot[] = [{ signalType: 1, signalLevel: 0, dBm: -130 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatList(list)));
      expect(SignalFormatter.formatList(list)).assertEqual('gsm/none/-130');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.totalDbm(list)));
      expect(SignalFormatter.totalDbm(list)).assertEqual(-130);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0030 end');
    })

    /**
     * @tc.name   testSignalReal0031
     * @tc.number SUB_RADIO_SIGREAL_0031
     * @tc.desc   signal list 13 keeps order and aggregates level and dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0031 begin');
      const list: SignalSnapshot[] = [
        { signalType: 2, signalLevel: 3, dBm: -88 },
        { signalType: 0, signalLevel: 0, dBm: -120 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatList(list)));
      expect(SignalFormatter.formatList(list)).assertEqual('cdma/good/-88; unknown/none/-120');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0031 end');
    })

    /**
     * @tc.name   testSignalReal0032
     * @tc.number SUB_RADIO_SIGREAL_0032
     * @tc.desc   signal list 14 keeps order and aggregates level and dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0032 begin');
      const list: SignalSnapshot[] = [
        { signalType: 6, signalLevel: 2, dBm: -80 },
        { signalType: 6, signalLevel: 1, dBm: -90 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatList(list)));
      expect(SignalFormatter.formatList(list)).assertEqual('nr/moderate/-80; nr/poor/-90');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.hasType(list, 6)));
      expect(SignalFormatter.hasType(list, 6)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0032 end');
    })

    /**
     * @tc.name   testSignalReal0033
     * @tc.number SUB_RADIO_SIGREAL_0033
     * @tc.desc   signal list 15 keeps order and aggregates level and dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0033 begin');
      const list: SignalSnapshot[] = [
        { signalType: 3, signalLevel: 4, dBm: -60 },
        { signalType: 2, signalLevel: 0, dBm: -120 },
        { signalType: 1, signalLevel: 1, dBm: -110 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatList(list)));
      expect(SignalFormatter.formatList(list)).assertEqual('wcdma/great/-60; cdma/none/-120; gsm/poor/-110');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.totalDbm(list)));
      expect(SignalFormatter.totalDbm(list)).assertEqual(-290);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0033 end');
    })

    /**
     * @tc.name   testSignalReal0034
     * @tc.number SUB_RADIO_SIGREAL_0034
     * @tc.desc   signal list 16 keeps order and aggregates level and dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0034 begin');
      const list: SignalSnapshot[] = [{ signalType: 6, signalLevel: 0, dBm: -70 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatList(list)));
      expect(SignalFormatter.formatList(list)).assertEqual('nr/none/-70');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0034 end');
    })

    /**
     * @tc.name   testSignalReal0035
     * @tc.number SUB_RADIO_SIGREAL_0035
     * @tc.desc   signal list 17 keeps order and aggregates level and dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0035 begin');
      const list: SignalSnapshot[] = [
        { signalType: 5, signalLevel: 2, dBm: -75 },
        { signalType: 5, signalLevel: 2, dBm: -76 },
        { signalType: 5, signalLevel: 2, dBm: -77 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatList(list)));
      expect(SignalFormatter.formatList(list)).assertEqual('lte/moderate/-75; lte/moderate/-76; lte/moderate/-77');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.totalDbm(list)));
      expect(SignalFormatter.totalDbm(list)).assertEqual(-228);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0035 end');
    })

    /**
     * @tc.name   testSignalReal0036
     * @tc.number SUB_RADIO_SIGREAL_0036
     * @tc.desc   signal list 18 keeps order and aggregates level and dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0036 begin');
      const list: SignalSnapshot[] = [];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatList(list)));
      expect(SignalFormatter.formatList(list)).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.totalDbm(list)));
      expect(SignalFormatter.totalDbm(list)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0036 end');
    })

    /**
     * @tc.name   testSignalReal0037
     * @tc.number SUB_RADIO_SIGREAL_0037
     * @tc.desc   signal list 19 keeps order and aggregates level and dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0037 begin');
      const list: SignalSnapshot[] = [{ signalType: 4, signalLevel: 4, dBm: -44 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatList(list)));
      expect(SignalFormatter.formatList(list)).assertEqual('tdscdma/great/-44');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0037 end');
    })

    /**
     * @tc.name   testSignalReal0038
     * @tc.number SUB_RADIO_SIGREAL_0038
     * @tc.desc   signal list 20 keeps order and aggregates level and dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0038 begin');
      const list: SignalSnapshot[] = [
        { signalType: 0, signalLevel: 1, dBm: -111 },
        { signalType: 7, signalLevel: 7, dBm: -11 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatList(list)));
      expect(SignalFormatter.formatList(list)).assertEqual('unknown/poor/-111; unknown/none/-11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.hasType(list, 6)));
      expect(SignalFormatter.hasType(list, 6)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0038 end');
    })

    /**
     * @tc.name   testSignalReal0039
     * @tc.number SUB_RADIO_SIGREAL_0039
     * @tc.desc   signal list 21 keeps order and aggregates level and dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0039 begin');
      const list: SignalSnapshot[] = [
        { signalType: 6, signalLevel: 1, dBm: -92 },
        { signalType: 6, signalLevel: 3, dBm: -82 },
        { signalType: 6, signalLevel: 4, dBm: -72 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatList(list)));
      expect(SignalFormatter.formatList(list)).assertEqual('nr/poor/-92; nr/good/-82; nr/great/-72');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.totalDbm(list)));
      expect(SignalFormatter.totalDbm(list)).assertEqual(-246);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0039 end');
    })

    /**
     * @tc.name   testSignalReal0040
     * @tc.number SUB_RADIO_SIGREAL_0040
     * @tc.desc   signal list 22 keeps order and aggregates level and dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0040 begin');
      const list: SignalSnapshot[] = [
        { signalType: 2, signalLevel: 2, dBm: -102 },
        { signalType: 2, signalLevel: 2, dBm: -103 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatList(list)));
      expect(SignalFormatter.formatList(list)).assertEqual('cdma/moderate/-102; cdma/moderate/-103');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0040 end');
    })

    /**
     * @tc.name   testSignalReal0041
     * @tc.number SUB_RADIO_SIGREAL_0041
     * @tc.desc   signal list 23 keeps order and aggregates level and dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0041 begin');
      const list: SignalSnapshot[] = [{ signalType: 5, signalLevel: 3, dBm: -83 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatList(list)));
      expect(SignalFormatter.formatList(list)).assertEqual('lte/good/-83');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.totalDbm(list)));
      expect(SignalFormatter.totalDbm(list)).assertEqual(-83);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0041 end');
    })

    /**
     * @tc.name   testSignalReal0042
     * @tc.number SUB_RADIO_SIGREAL_0042
     * @tc.desc   signal list 24 keeps order and aggregates level and dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0042 begin');
      const list: SignalSnapshot[] = [];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatList(list)));
      expect(SignalFormatter.formatList(list)).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.hasType(list, 6)));
      expect(SignalFormatter.hasType(list, 6)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0042 end');
    })

    /**
     * @tc.name   testSignalReal0043
     * @tc.number SUB_RADIO_SIGREAL_0043
     * @tc.desc   signal list 25 keeps order and aggregates level and dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0043 begin');
      const list: SignalSnapshot[] = [
        { signalType: 1, signalLevel: 4, dBm: -50 },
        { signalType: 2, signalLevel: 3, dBm: -60 },
        { signalType: 3, signalLevel: 2, dBm: -70 },
        { signalType: 4, signalLevel: 1, dBm: -80 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatList(list)));
      expect(SignalFormatter.formatList(list))
        .assertEqual('gsm/great/-50; cdma/good/-60; wcdma/moderate/-70; tdscdma/poor/-80');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.totalDbm(list)));
      expect(SignalFormatter.totalDbm(list)).assertEqual(-260);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0043 end');
    })

    /**
     * @tc.name   testSignalReal0044
     * @tc.number SUB_RADIO_SIGREAL_0044
     * @tc.desc   signal list 26 keeps order and aggregates level and dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0044 begin');
      const list: SignalSnapshot[] = [{ signalType: 6, signalLevel: 4, dBm: -41 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatList(list)));
      expect(SignalFormatter.formatList(list)).assertEqual('nr/great/-41');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0044 end');
    })

    /**
     * @tc.name   testSignalReal0045
     * @tc.number SUB_RADIO_SIGREAL_0045
     * @tc.desc   signal list 27 keeps order and aggregates level and dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0045 begin');
      const list: SignalSnapshot[] = [{ signalType: 4, signalLevel: 0, dBm: -119 }];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatList(list)));
      expect(SignalFormatter.formatList(list)).assertEqual('tdscdma/none/-119');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.hasType(list, 6)));
      expect(SignalFormatter.hasType(list, 6)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0045 end');
    })

    /**
     * @tc.name   testSignalReal0046
     * @tc.number SUB_RADIO_SIGREAL_0046
     * @tc.desc   signal list 28 keeps order and aggregates level and dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSignalReal0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0046 begin');
      const list: SignalSnapshot[] = [
        { signalType: 0, signalLevel: 3, dBm: -65 },
        { signalType: 0, signalLevel: 2, dBm: -75 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatList(list)));
      expect(SignalFormatter.formatList(list)).assertEqual('unknown/good/-65; unknown/moderate/-75');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSignalReal0046 end');
    })

  })
}
