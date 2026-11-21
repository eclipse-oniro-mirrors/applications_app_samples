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

export default function radioSignalFormat01Test() {
  describe('RadioSignalFormat01Test', () => {

    /**
     * @tc.name   testRadioSignalFormat0001
     * @tc.number SUB_RADIO_SIGNALFORMAT_0001
     * @tc.desc   signal unknown level none at -113dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0001 begin');
      const signal: SignalSnapshot = { signalType: 0, signalLevel: 0, dBm: -113 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/none/-113');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-113');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0001 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0002
     * @tc.number SUB_RADIO_SIGNALFORMAT_0002
     * @tc.desc   signal gsm level poor at -106dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0002 begin');
      const signal: SignalSnapshot = { signalType: 1, signalLevel: 1, dBm: -106 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('gsm/poor/-106'));
      expect(result).assertEqual('gsm/poor/-106');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-106');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0002 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0003
     * @tc.number SUB_RADIO_SIGNALFORMAT_0003
     * @tc.desc   signal cdma level moderate at -99dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0003 begin');
      const signal: SignalSnapshot = { signalType: 2, signalLevel: 2, dBm: -99 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('cdma/moderate/-99');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-99');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0003 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0004
     * @tc.number SUB_RADIO_SIGNALFORMAT_0004
     * @tc.desc   signal wcdma level good at -92dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0004 begin');
      const signal: SignalSnapshot = { signalType: 3, signalLevel: 3, dBm: -92 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('wcdma/good/-92');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-92');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0004 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0005
     * @tc.number SUB_RADIO_SIGNALFORMAT_0005
     * @tc.desc   signal tdscdma level great at -85dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0005 begin');
      const signal: SignalSnapshot = { signalType: 4, signalLevel: 4, dBm: -85 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('tdscdma/great/-85');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-85');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0005 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0006
     * @tc.number SUB_RADIO_SIGNALFORMAT_0006
     * @tc.desc   signal lte level none at -78dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0006 begin');
      const signal: SignalSnapshot = { signalType: 5, signalLevel: 0, dBm: -78 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('lte/none/-78'));
      expect(result).assertEqual('lte/none/-78');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-78');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0006 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0007
     * @tc.number SUB_RADIO_SIGNALFORMAT_0007
     * @tc.desc   signal nr level poor at -71dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0007 begin');
      const signal: SignalSnapshot = { signalType: 6, signalLevel: 1, dBm: -71 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('nr/poor/-71'));
      expect(result).assertEqual('nr/poor/-71');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-71');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0007 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0008
     * @tc.number SUB_RADIO_SIGNALFORMAT_0008
     * @tc.desc   signal unknown level moderate at -64dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0008 begin');
      const signal: SignalSnapshot = { signalType: 0, signalLevel: 2, dBm: -64 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/moderate/-64');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-64');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0008 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0009
     * @tc.number SUB_RADIO_SIGNALFORMAT_0009
     * @tc.desc   signal gsm level good at -57dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0009 begin');
      const signal: SignalSnapshot = { signalType: 1, signalLevel: 3, dBm: -57 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('gsm/good/-57'));
      expect(result).assertEqual('gsm/good/-57');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-57');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0009 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0010
     * @tc.number SUB_RADIO_SIGNALFORMAT_0010
     * @tc.desc   signal cdma level great at -50dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0010 begin');
      const signal: SignalSnapshot = { signalType: 2, signalLevel: 4, dBm: -50 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('cdma/great/-50');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-50');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0010 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0011
     * @tc.number SUB_RADIO_SIGNALFORMAT_0011
     * @tc.desc   signal wcdma level none at -43dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0011 begin');
      const signal: SignalSnapshot = { signalType: 3, signalLevel: 0, dBm: -43 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('wcdma/none/-43');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-43');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0011 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0012
     * @tc.number SUB_RADIO_SIGNALFORMAT_0012
     * @tc.desc   signal tdscdma level poor at -36dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0012 begin');
      const signal: SignalSnapshot = { signalType: 4, signalLevel: 1, dBm: -36 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('tdscdma/poor/-36');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-36');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0012 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0013
     * @tc.number SUB_RADIO_SIGNALFORMAT_0013
     * @tc.desc   signal lte level moderate at -29dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0013 begin');
      const signal: SignalSnapshot = { signalType: 5, signalLevel: 2, dBm: -29 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('lte/moderate/-29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-29');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0013 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0014
     * @tc.number SUB_RADIO_SIGNALFORMAT_0014
     * @tc.desc   signal nr level good at -112dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0014 begin');
      const signal: SignalSnapshot = { signalType: 6, signalLevel: 3, dBm: -112 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('nr/good/-112'));
      expect(result).assertEqual('nr/good/-112');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-112');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0014 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0015
     * @tc.number SUB_RADIO_SIGNALFORMAT_0015
     * @tc.desc   signal unknown level great at -105dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0015 begin');
      const signal: SignalSnapshot = { signalType: 0, signalLevel: 4, dBm: -105 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/great/-105');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-105');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0015 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0016
     * @tc.number SUB_RADIO_SIGNALFORMAT_0016
     * @tc.desc   signal gsm level none at -98dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0016 begin');
      const signal: SignalSnapshot = { signalType: 1, signalLevel: 0, dBm: -98 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('gsm/none/-98'));
      expect(result).assertEqual('gsm/none/-98');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-98');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0016 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0017
     * @tc.number SUB_RADIO_SIGNALFORMAT_0017
     * @tc.desc   signal cdma level poor at -91dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0017 begin');
      const signal: SignalSnapshot = { signalType: 2, signalLevel: 1, dBm: -91 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('cdma/poor/-91'));
      expect(result).assertEqual('cdma/poor/-91');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-91');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0017 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0018
     * @tc.number SUB_RADIO_SIGNALFORMAT_0018
     * @tc.desc   signal wcdma level moderate at -84dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0018 begin');
      const signal: SignalSnapshot = { signalType: 3, signalLevel: 2, dBm: -84 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('wcdma/moderate/-84');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-84');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0018 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0019
     * @tc.number SUB_RADIO_SIGNALFORMAT_0019
     * @tc.desc   signal tdscdma level good at -77dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0019 begin');
      const signal: SignalSnapshot = { signalType: 4, signalLevel: 3, dBm: -77 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('tdscdma/good/-77');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-77');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0019 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0020
     * @tc.number SUB_RADIO_SIGNALFORMAT_0020
     * @tc.desc   signal lte level great at -70dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0020 begin');
      const signal: SignalSnapshot = { signalType: 5, signalLevel: 4, dBm: -70 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('lte/great/-70'));
      expect(result).assertEqual('lte/great/-70');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-70');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0020 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0021
     * @tc.number SUB_RADIO_SIGNALFORMAT_0021
     * @tc.desc   signal nr level none at -63dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0021 begin');
      const signal: SignalSnapshot = { signalType: 6, signalLevel: 0, dBm: -63 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('nr/none/-63'));
      expect(result).assertEqual('nr/none/-63');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-63');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0021 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0022
     * @tc.number SUB_RADIO_SIGNALFORMAT_0022
     * @tc.desc   signal unknown level poor at -56dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0022 begin');
      const signal: SignalSnapshot = { signalType: 0, signalLevel: 1, dBm: -56 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/poor/-56');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-56');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0022 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0023
     * @tc.number SUB_RADIO_SIGNALFORMAT_0023
     * @tc.desc   signal gsm level moderate at -49dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0023 begin');
      const signal: SignalSnapshot = { signalType: 1, signalLevel: 2, dBm: -49 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('gsm/moderate/-49');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-49');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0023 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0024
     * @tc.number SUB_RADIO_SIGNALFORMAT_0024
     * @tc.desc   signal cdma level good at -42dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0024 begin');
      const signal: SignalSnapshot = { signalType: 2, signalLevel: 3, dBm: -42 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('cdma/good/-42'));
      expect(result).assertEqual('cdma/good/-42');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-42');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0024 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0025
     * @tc.number SUB_RADIO_SIGNALFORMAT_0025
     * @tc.desc   signal wcdma level great at -35dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0025 begin');
      const signal: SignalSnapshot = { signalType: 3, signalLevel: 4, dBm: -35 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('wcdma/great/-35');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-35');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0025 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0026
     * @tc.number SUB_RADIO_SIGNALFORMAT_0026
     * @tc.desc   signal tdscdma level none at -28dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0026 begin');
      const signal: SignalSnapshot = { signalType: 4, signalLevel: 0, dBm: -28 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('tdscdma/none/-28');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-28');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0026 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0027
     * @tc.number SUB_RADIO_SIGNALFORMAT_0027
     * @tc.desc   signal lte level poor at -111dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0027 begin');
      const signal: SignalSnapshot = { signalType: 5, signalLevel: 1, dBm: -111 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('lte/poor/-111'));
      expect(result).assertEqual('lte/poor/-111');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-111');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0027 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0028
     * @tc.number SUB_RADIO_SIGNALFORMAT_0028
     * @tc.desc   signal nr level moderate at -104dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0028 begin');
      const signal: SignalSnapshot = { signalType: 6, signalLevel: 2, dBm: -104 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('nr/moderate/-104');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-104');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0028 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0029
     * @tc.number SUB_RADIO_SIGNALFORMAT_0029
     * @tc.desc   signal unknown level good at -97dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0029 begin');
      const signal: SignalSnapshot = { signalType: 0, signalLevel: 3, dBm: -97 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/good/-97');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-97');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0029 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0030
     * @tc.number SUB_RADIO_SIGNALFORMAT_0030
     * @tc.desc   signal gsm level great at -90dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0030 begin');
      const signal: SignalSnapshot = { signalType: 1, signalLevel: 4, dBm: -90 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('gsm/great/-90'));
      expect(result).assertEqual('gsm/great/-90');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-90');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0030 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0031
     * @tc.number SUB_RADIO_SIGNALFORMAT_0031
     * @tc.desc   signal cdma level none at -83dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0031 begin');
      const signal: SignalSnapshot = { signalType: 2, signalLevel: 0, dBm: -83 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('cdma/none/-83'));
      expect(result).assertEqual('cdma/none/-83');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-83');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0031 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0032
     * @tc.number SUB_RADIO_SIGNALFORMAT_0032
     * @tc.desc   signal wcdma level poor at -76dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0032 begin');
      const signal: SignalSnapshot = { signalType: 3, signalLevel: 1, dBm: -76 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('wcdma/poor/-76');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-76');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0032 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0033
     * @tc.number SUB_RADIO_SIGNALFORMAT_0033
     * @tc.desc   signal tdscdma level moderate at -69dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0033 begin');
      const signal: SignalSnapshot = { signalType: 4, signalLevel: 2, dBm: -69 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('tdscdma/moderate/-69');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-69');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0033 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0034
     * @tc.number SUB_RADIO_SIGNALFORMAT_0034
     * @tc.desc   signal lte level good at -62dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0034 begin');
      const signal: SignalSnapshot = { signalType: 5, signalLevel: 3, dBm: -62 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('lte/good/-62'));
      expect(result).assertEqual('lte/good/-62');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-62');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0034 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0035
     * @tc.number SUB_RADIO_SIGNALFORMAT_0035
     * @tc.desc   signal nr level great at -55dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0035 begin');
      const signal: SignalSnapshot = { signalType: 6, signalLevel: 4, dBm: -55 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('nr/great/-55'));
      expect(result).assertEqual('nr/great/-55');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-55');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0035 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0036
     * @tc.number SUB_RADIO_SIGNALFORMAT_0036
     * @tc.desc   signal unknown level none at -48dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0036 begin');
      const signal: SignalSnapshot = { signalType: 0, signalLevel: 0, dBm: -48 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/none/-48');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-48');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0036 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0037
     * @tc.number SUB_RADIO_SIGNALFORMAT_0037
     * @tc.desc   signal gsm level poor at -41dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0037 begin');
      const signal: SignalSnapshot = { signalType: 1, signalLevel: 1, dBm: -41 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('gsm/poor/-41'));
      expect(result).assertEqual('gsm/poor/-41');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-41');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0037 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0038
     * @tc.number SUB_RADIO_SIGNALFORMAT_0038
     * @tc.desc   signal cdma level moderate at -34dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0038 begin');
      const signal: SignalSnapshot = { signalType: 2, signalLevel: 2, dBm: -34 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('cdma/moderate/-34');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-34');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0038 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0039
     * @tc.number SUB_RADIO_SIGNALFORMAT_0039
     * @tc.desc   signal wcdma level good at -27dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0039 begin');
      const signal: SignalSnapshot = { signalType: 3, signalLevel: 3, dBm: -27 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('wcdma/good/-27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-27');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0039 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0040
     * @tc.number SUB_RADIO_SIGNALFORMAT_0040
     * @tc.desc   signal tdscdma level great at -110dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0040 begin');
      const signal: SignalSnapshot = { signalType: 4, signalLevel: 4, dBm: -110 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('tdscdma/great/-110');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-110');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0040 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0041
     * @tc.number SUB_RADIO_SIGNALFORMAT_0041
     * @tc.desc   signal lte level none at -103dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0041 begin');
      const signal: SignalSnapshot = { signalType: 5, signalLevel: 0, dBm: -103 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('lte/none/-103'));
      expect(result).assertEqual('lte/none/-103');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-103');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0041 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0042
     * @tc.number SUB_RADIO_SIGNALFORMAT_0042
     * @tc.desc   signal nr level poor at -96dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0042 begin');
      const signal: SignalSnapshot = { signalType: 6, signalLevel: 1, dBm: -96 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('nr/poor/-96'));
      expect(result).assertEqual('nr/poor/-96');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-96');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0042 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0043
     * @tc.number SUB_RADIO_SIGNALFORMAT_0043
     * @tc.desc   signal unknown level moderate at -89dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0043 begin');
      const signal: SignalSnapshot = { signalType: 0, signalLevel: 2, dBm: -89 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/moderate/-89');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-89');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0043 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0044
     * @tc.number SUB_RADIO_SIGNALFORMAT_0044
     * @tc.desc   signal gsm level good at -82dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0044 begin');
      const signal: SignalSnapshot = { signalType: 1, signalLevel: 3, dBm: -82 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('gsm/good/-82'));
      expect(result).assertEqual('gsm/good/-82');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-82');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0044 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0045
     * @tc.number SUB_RADIO_SIGNALFORMAT_0045
     * @tc.desc   signal cdma level great at -75dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0045 begin');
      const signal: SignalSnapshot = { signalType: 2, signalLevel: 4, dBm: -75 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('cdma/great/-75');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-75');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0045 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0046
     * @tc.number SUB_RADIO_SIGNALFORMAT_0046
     * @tc.desc   signal wcdma level none at -68dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0046 begin');
      const signal: SignalSnapshot = { signalType: 3, signalLevel: 0, dBm: -68 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('wcdma/none/-68');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-68');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0046 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0047
     * @tc.number SUB_RADIO_SIGNALFORMAT_0047
     * @tc.desc   signal tdscdma level poor at -61dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0047 begin');
      const signal: SignalSnapshot = { signalType: 4, signalLevel: 1, dBm: -61 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('tdscdma/poor/-61');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-61');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0047 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0048
     * @tc.number SUB_RADIO_SIGNALFORMAT_0048
     * @tc.desc   signal lte level moderate at -54dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0048 begin');
      const signal: SignalSnapshot = { signalType: 5, signalLevel: 2, dBm: -54 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('lte/moderate/-54');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-54');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0048 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0049
     * @tc.number SUB_RADIO_SIGNALFORMAT_0049
     * @tc.desc   signal nr level good at -47dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0049 begin');
      const signal: SignalSnapshot = { signalType: 6, signalLevel: 3, dBm: -47 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('nr/good/-47'));
      expect(result).assertEqual('nr/good/-47');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-47');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0049 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0050
     * @tc.number SUB_RADIO_SIGNALFORMAT_0050
     * @tc.desc   signal unknown level great at -40dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0050 begin');
      const signal: SignalSnapshot = { signalType: 0, signalLevel: 4, dBm: -40 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/great/-40');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-40');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0050 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0051
     * @tc.number SUB_RADIO_SIGNALFORMAT_0051
     * @tc.desc   signal gsm level none at -33dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0051 begin');
      const signal: SignalSnapshot = { signalType: 1, signalLevel: 0, dBm: -33 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('gsm/none/-33'));
      expect(result).assertEqual('gsm/none/-33');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-33');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0051 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0052
     * @tc.number SUB_RADIO_SIGNALFORMAT_0052
     * @tc.desc   signal cdma level poor at -26dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0052 begin');
      const signal: SignalSnapshot = { signalType: 2, signalLevel: 1, dBm: -26 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('cdma/poor/-26'));
      expect(result).assertEqual('cdma/poor/-26');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-26');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0052 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0053
     * @tc.number SUB_RADIO_SIGNALFORMAT_0053
     * @tc.desc   signal wcdma level moderate at -109dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0053 begin');
      const signal: SignalSnapshot = { signalType: 3, signalLevel: 2, dBm: -109 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('wcdma/moderate/-109');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-109');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0053 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0054
     * @tc.number SUB_RADIO_SIGNALFORMAT_0054
     * @tc.desc   signal tdscdma level good at -102dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0054 begin');
      const signal: SignalSnapshot = { signalType: 4, signalLevel: 3, dBm: -102 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('tdscdma/good/-102');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-102');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0054 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0055
     * @tc.number SUB_RADIO_SIGNALFORMAT_0055
     * @tc.desc   signal lte level great at -95dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0055 begin');
      const signal: SignalSnapshot = { signalType: 5, signalLevel: 4, dBm: -95 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('lte/great/-95'));
      expect(result).assertEqual('lte/great/-95');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-95');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0055 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0056
     * @tc.number SUB_RADIO_SIGNALFORMAT_0056
     * @tc.desc   signal nr level none at -88dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0056 begin');
      const signal: SignalSnapshot = { signalType: 6, signalLevel: 0, dBm: -88 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('nr/none/-88'));
      expect(result).assertEqual('nr/none/-88');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-88');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0056 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0057
     * @tc.number SUB_RADIO_SIGNALFORMAT_0057
     * @tc.desc   signal unknown level poor at -81dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0057 begin');
      const signal: SignalSnapshot = { signalType: 0, signalLevel: 1, dBm: -81 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/poor/-81');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-81');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0057 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0058
     * @tc.number SUB_RADIO_SIGNALFORMAT_0058
     * @tc.desc   signal gsm level moderate at -74dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0058 begin');
      const signal: SignalSnapshot = { signalType: 1, signalLevel: 2, dBm: -74 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('gsm/moderate/-74');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-74');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0058 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0059
     * @tc.number SUB_RADIO_SIGNALFORMAT_0059
     * @tc.desc   signal cdma level good at -67dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0059 begin');
      const signal: SignalSnapshot = { signalType: 2, signalLevel: 3, dBm: -67 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('cdma/good/-67'));
      expect(result).assertEqual('cdma/good/-67');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-67');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0059 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0060
     * @tc.number SUB_RADIO_SIGNALFORMAT_0060
     * @tc.desc   signal wcdma level great at -60dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0060 begin');
      const signal: SignalSnapshot = { signalType: 3, signalLevel: 4, dBm: -60 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('wcdma/great/-60');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-60');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0060 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0061
     * @tc.number SUB_RADIO_SIGNALFORMAT_0061
     * @tc.desc   signal tdscdma level none at -53dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0061 begin');
      const signal: SignalSnapshot = { signalType: 4, signalLevel: 0, dBm: -53 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('tdscdma/none/-53');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-53');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0061 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0062
     * @tc.number SUB_RADIO_SIGNALFORMAT_0062
     * @tc.desc   signal lte level poor at -46dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0062 begin');
      const signal: SignalSnapshot = { signalType: 5, signalLevel: 1, dBm: -46 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('lte/poor/-46'));
      expect(result).assertEqual('lte/poor/-46');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-46');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0062 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0063
     * @tc.number SUB_RADIO_SIGNALFORMAT_0063
     * @tc.desc   signal nr level moderate at -39dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0063 begin');
      const signal: SignalSnapshot = { signalType: 6, signalLevel: 2, dBm: -39 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('nr/moderate/-39');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-39');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0063 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0064
     * @tc.number SUB_RADIO_SIGNALFORMAT_0064
     * @tc.desc   signal unknown level good at -32dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0064 begin');
      const signal: SignalSnapshot = { signalType: 0, signalLevel: 3, dBm: -32 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/good/-32');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-32');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0064 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0065
     * @tc.number SUB_RADIO_SIGNALFORMAT_0065
     * @tc.desc   signal gsm level great at -25dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0065 begin');
      const signal: SignalSnapshot = { signalType: 1, signalLevel: 4, dBm: -25 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('gsm/great/-25'));
      expect(result).assertEqual('gsm/great/-25');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-25');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0065 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0066
     * @tc.number SUB_RADIO_SIGNALFORMAT_0066
     * @tc.desc   signal cdma level none at -108dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0066 begin');
      const signal: SignalSnapshot = { signalType: 2, signalLevel: 0, dBm: -108 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('cdma/none/-108');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-108');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0066 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0067
     * @tc.number SUB_RADIO_SIGNALFORMAT_0067
     * @tc.desc   signal wcdma level poor at -101dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0067 begin');
      const signal: SignalSnapshot = { signalType: 3, signalLevel: 1, dBm: -101 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('wcdma/poor/-101');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-101');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0067 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0068
     * @tc.number SUB_RADIO_SIGNALFORMAT_0068
     * @tc.desc   signal tdscdma level moderate at -94dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0068 begin');
      const signal: SignalSnapshot = { signalType: 4, signalLevel: 2, dBm: -94 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('tdscdma/moderate/-94');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-94');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0068 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0069
     * @tc.number SUB_RADIO_SIGNALFORMAT_0069
     * @tc.desc   signal lte level good at -87dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0069 begin');
      const signal: SignalSnapshot = { signalType: 5, signalLevel: 3, dBm: -87 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('lte/good/-87'));
      expect(result).assertEqual('lte/good/-87');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-87');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0069 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0070
     * @tc.number SUB_RADIO_SIGNALFORMAT_0070
     * @tc.desc   signal nr level great at -80dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0070 begin');
      const signal: SignalSnapshot = { signalType: 6, signalLevel: 4, dBm: -80 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('nr/great/-80'));
      expect(result).assertEqual('nr/great/-80');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-80');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0070 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0071
     * @tc.number SUB_RADIO_SIGNALFORMAT_0071
     * @tc.desc   signal unknown level none at -73dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0071 begin');
      const signal: SignalSnapshot = { signalType: 0, signalLevel: 0, dBm: -73 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/none/-73');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-73');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0071 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0072
     * @tc.number SUB_RADIO_SIGNALFORMAT_0072
     * @tc.desc   signal gsm level poor at -66dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0072 begin');
      const signal: SignalSnapshot = { signalType: 1, signalLevel: 1, dBm: -66 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('gsm/poor/-66'));
      expect(result).assertEqual('gsm/poor/-66');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-66');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0072 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0073
     * @tc.number SUB_RADIO_SIGNALFORMAT_0073
     * @tc.desc   signal cdma level moderate at -59dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0073 begin');
      const signal: SignalSnapshot = { signalType: 2, signalLevel: 2, dBm: -59 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('cdma/moderate/-59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0073 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0074
     * @tc.number SUB_RADIO_SIGNALFORMAT_0074
     * @tc.desc   signal wcdma level good at -52dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0074 begin');
      const signal: SignalSnapshot = { signalType: 3, signalLevel: 3, dBm: -52 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('wcdma/good/-52');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-52');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0074 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0075
     * @tc.number SUB_RADIO_SIGNALFORMAT_0075
     * @tc.desc   signal tdscdma level great at -45dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0075 begin');
      const signal: SignalSnapshot = { signalType: 4, signalLevel: 4, dBm: -45 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('tdscdma/great/-45');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-45');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0075 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0076
     * @tc.number SUB_RADIO_SIGNALFORMAT_0076
     * @tc.desc   signal lte level none at -38dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0076 begin');
      const signal: SignalSnapshot = { signalType: 5, signalLevel: 0, dBm: -38 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('lte/none/-38'));
      expect(result).assertEqual('lte/none/-38');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-38');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0076 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0077
     * @tc.number SUB_RADIO_SIGNALFORMAT_0077
     * @tc.desc   signal nr level poor at -31dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0077 begin');
      const signal: SignalSnapshot = { signalType: 6, signalLevel: 1, dBm: -31 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('nr/poor/-31'));
      expect(result).assertEqual('nr/poor/-31');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-31');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0077 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0078
     * @tc.number SUB_RADIO_SIGNALFORMAT_0078
     * @tc.desc   signal unknown level moderate at -24dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0078 begin');
      const signal: SignalSnapshot = { signalType: 0, signalLevel: 2, dBm: -24 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('unknown/moderate/-24');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-24');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0078 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0079
     * @tc.number SUB_RADIO_SIGNALFORMAT_0079
     * @tc.desc   signal gsm level good at -107dBm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0079 begin');
      const signal: SignalSnapshot = { signalType: 1, signalLevel: 3, dBm: -107 };
      const result: string = SignalFormatter.formatSignal(signal);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('gsm/good/-107'));
      expect(result).assertEqual('gsm/good/-107');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/')[2]));
      expect(result.split('/')[2]).assertEqual('-107');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0079 end');
    })

    /**
     * @tc.name   testRadioSignalFormat0080
     * @tc.number SUB_RADIO_SIGNALFORMAT_0080
     * @tc.desc   最低 RSRP 边界值原样保留符号
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSignalFormat0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0080 begin');
      const anchorResult: string = SignalFormatter.formatSignal({ signalType: 5, signalLevel: 0, dBm: -113 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(anchorResult));
      expect(anchorResult).assertEqual('lte/none/-113');
      expect(anchorResult.length).assertEqual(13);
      expect(anchorResult.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSignalFormat0080 end');
    })
  })
}
