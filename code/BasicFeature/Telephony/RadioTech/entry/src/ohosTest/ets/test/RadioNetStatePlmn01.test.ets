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
import { NetworkStateFormatter, NetworkStateSnapshot } from '../../../main/ets/model/NetworkStateFormatter';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function radioNetStatePlmn01Test() {
  describe('RadioNetStatePlmn01Test', () => {

    /**
     * @tc.name   testRadioNetState0081
     * @tc.number SUB_RADIO_NETSTATE_0081
     * @tc.desc   PLMN input #1 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0081 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20000'));
      expect(result).assertEqual('20000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0081 end');
    })

    /**
     * @tc.name   testRadioNetState0082
     * @tc.number SUB_RADIO_NETSTATE_0082
     * @tc.desc   PLMN input #2 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0082 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20001');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20001'));
      expect(result).assertEqual('20001');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0082 end');
    })

    /**
     * @tc.name   testRadioNetState0083
     * @tc.number SUB_RADIO_NETSTATE_0083
     * @tc.desc   PLMN input #3 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0083 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20002');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20002'));
      expect(result).assertEqual('20002');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0083 end');
    })

    /**
     * @tc.name   testRadioNetState0084
     * @tc.number SUB_RADIO_NETSTATE_0084
     * @tc.desc   PLMN input #4 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0084 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20003');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20003'));
      expect(result).assertEqual('20003');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0084 end');
    })

    /**
     * @tc.name   testRadioNetState0085
     * @tc.number SUB_RADIO_NETSTATE_0085
     * @tc.desc   PLMN input #5 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0085 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20004');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20004'));
      expect(result).assertEqual('20004');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0085 end');
    })

    /**
     * @tc.name   testRadioNetState0086
     * @tc.number SUB_RADIO_NETSTATE_0086
     * @tc.desc   PLMN input #6 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0086 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20005');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20005'));
      expect(result).assertEqual('20005');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0086 end');
    })

    /**
     * @tc.name   testRadioNetState0087
     * @tc.number SUB_RADIO_NETSTATE_0087
     * @tc.desc   PLMN input #7 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0087 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20006');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20006'));
      expect(result).assertEqual('20006');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0087 end');
    })

    /**
     * @tc.name   testRadioNetState0088
     * @tc.number SUB_RADIO_NETSTATE_0088
     * @tc.desc   PLMN input #8 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0088 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20007');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20007'));
      expect(result).assertEqual('20007');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0088 end');
    })

    /**
     * @tc.name   testRadioNetState0089
     * @tc.number SUB_RADIO_NETSTATE_0089
     * @tc.desc   PLMN input #9 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0089 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20008');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20008'));
      expect(result).assertEqual('20008');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0089 end');
    })

    /**
     * @tc.name   testRadioNetState0090
     * @tc.number SUB_RADIO_NETSTATE_0090
     * @tc.desc   PLMN input #10 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0090 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20009');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20009'));
      expect(result).assertEqual('20009');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0090 end');
    })

    /**
     * @tc.name   testRadioNetState0091
     * @tc.number SUB_RADIO_NETSTATE_0091
     * @tc.desc   PLMN input #11 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0091 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20010');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20010'));
      expect(result).assertEqual('20010');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0091 end');
    })

    /**
     * @tc.name   testRadioNetState0092
     * @tc.number SUB_RADIO_NETSTATE_0092
     * @tc.desc   PLMN input #12 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0092 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20011');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20011'));
      expect(result).assertEqual('20011');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0092 end');
    })

    /**
     * @tc.name   testRadioNetState0093
     * @tc.number SUB_RADIO_NETSTATE_0093
     * @tc.desc   PLMN input #13 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0093 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20012');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20012'));
      expect(result).assertEqual('20012');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0093 end');
    })

    /**
     * @tc.name   testRadioNetState0094
     * @tc.number SUB_RADIO_NETSTATE_0094
     * @tc.desc   PLMN input #14 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0094 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20013');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20013'));
      expect(result).assertEqual('20013');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0094 end');
    })

    /**
     * @tc.name   testRadioNetState0095
     * @tc.number SUB_RADIO_NETSTATE_0095
     * @tc.desc   PLMN input #15 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0095 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20014');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20014'));
      expect(result).assertEqual('20014');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0095 end');
    })

    /**
     * @tc.name   testRadioNetState0096
     * @tc.number SUB_RADIO_NETSTATE_0096
     * @tc.desc   PLMN input #16 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0096 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20015');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20015'));
      expect(result).assertEqual('20015');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0096 end');
    })

    /**
     * @tc.name   testRadioNetState0097
     * @tc.number SUB_RADIO_NETSTATE_0097
     * @tc.desc   PLMN input #17 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0097 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20016');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20016'));
      expect(result).assertEqual('20016');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0097 end');
    })

    /**
     * @tc.name   testRadioNetState0098
     * @tc.number SUB_RADIO_NETSTATE_0098
     * @tc.desc   PLMN input #18 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0098 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20017');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20017'));
      expect(result).assertEqual('20017');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0098 end');
    })

    /**
     * @tc.name   testRadioNetState0099
     * @tc.number SUB_RADIO_NETSTATE_0099
     * @tc.desc   PLMN input #19 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0099 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20018');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20018'));
      expect(result).assertEqual('20018');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0099 end');
    })

    /**
     * @tc.name   testRadioNetState0100
     * @tc.number SUB_RADIO_NETSTATE_0100
     * @tc.desc   PLMN input #20 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0100 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20019');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20019'));
      expect(result).assertEqual('20019');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0100 end');
    })

    /**
     * @tc.name   testRadioNetState0101
     * @tc.number SUB_RADIO_NETSTATE_0101
     * @tc.desc   PLMN input #21 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0101 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20020');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20020'));
      expect(result).assertEqual('20020');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0101 end');
    })

    /**
     * @tc.name   testRadioNetState0102
     * @tc.number SUB_RADIO_NETSTATE_0102
     * @tc.desc   PLMN input #22 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0102 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20021');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20021'));
      expect(result).assertEqual('20021');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0102 end');
    })

    /**
     * @tc.name   testRadioNetState0103
     * @tc.number SUB_RADIO_NETSTATE_0103
     * @tc.desc   PLMN input #23 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0103 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20022');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20022'));
      expect(result).assertEqual('20022');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0103 end');
    })

    /**
     * @tc.name   testRadioNetState0104
     * @tc.number SUB_RADIO_NETSTATE_0104
     * @tc.desc   PLMN input #24 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0104 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20023');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20023'));
      expect(result).assertEqual('20023');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0104 end');
    })

    /**
     * @tc.name   testRadioNetState0105
     * @tc.number SUB_RADIO_NETSTATE_0105
     * @tc.desc   PLMN input #25 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0105 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20024');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20024'));
      expect(result).assertEqual('20024');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0105 end');
    })

    /**
     * @tc.name   testRadioNetState0106
     * @tc.number SUB_RADIO_NETSTATE_0106
     * @tc.desc   PLMN input #26 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0106 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20025');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20025'));
      expect(result).assertEqual('20025');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0106 end');
    })

    /**
     * @tc.name   testRadioNetState0107
     * @tc.number SUB_RADIO_NETSTATE_0107
     * @tc.desc   PLMN input #27 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0107 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20026');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20026'));
      expect(result).assertEqual('20026');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0107 end');
    })

    /**
     * @tc.name   testRadioNetState0108
     * @tc.number SUB_RADIO_NETSTATE_0108
     * @tc.desc   PLMN input #28 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0108 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20027');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20027'));
      expect(result).assertEqual('20027');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0108 end');
    })

    /**
     * @tc.name   testRadioNetState0109
     * @tc.number SUB_RADIO_NETSTATE_0109
     * @tc.desc   PLMN input #29 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0109 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20028');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20028'));
      expect(result).assertEqual('20028');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0109 end');
    })

    /**
     * @tc.name   testRadioNetState0110
     * @tc.number SUB_RADIO_NETSTATE_0110
     * @tc.desc   PLMN input #30 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0110 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20029');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20029'));
      expect(result).assertEqual('20029');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0110 end');
    })

    /**
     * @tc.name   testRadioNetState0111
     * @tc.number SUB_RADIO_NETSTATE_0111
     * @tc.desc   PLMN input #31 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0111 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20030');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20030'));
      expect(result).assertEqual('20030');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0111 end');
    })

    /**
     * @tc.name   testRadioNetState0112
     * @tc.number SUB_RADIO_NETSTATE_0112
     * @tc.desc   PLMN input #32 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0112 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20031');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20031'));
      expect(result).assertEqual('20031');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0112 end');
    })

    /**
     * @tc.name   testRadioNetState0113
     * @tc.number SUB_RADIO_NETSTATE_0113
     * @tc.desc   PLMN input #33 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0113 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20032');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20032'));
      expect(result).assertEqual('20032');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0113 end');
    })

    /**
     * @tc.name   testRadioNetState0114
     * @tc.number SUB_RADIO_NETSTATE_0114
     * @tc.desc   PLMN input #34 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0114 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20033');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20033'));
      expect(result).assertEqual('20033');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0114 end');
    })

    /**
     * @tc.name   testRadioNetState0115
     * @tc.number SUB_RADIO_NETSTATE_0115
     * @tc.desc   PLMN input #35 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0115 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20034');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20034'));
      expect(result).assertEqual('20034');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0115 end');
    })

    /**
     * @tc.name   testRadioNetState0116
     * @tc.number SUB_RADIO_NETSTATE_0116
     * @tc.desc   PLMN input #36 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0116 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20035');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20035'));
      expect(result).assertEqual('20035');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0116 end');
    })

    /**
     * @tc.name   testRadioNetState0117
     * @tc.number SUB_RADIO_NETSTATE_0117
     * @tc.desc   PLMN input #37 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0117 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20036');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20036'));
      expect(result).assertEqual('20036');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0117 end');
    })

    /**
     * @tc.name   testRadioNetState0118
     * @tc.number SUB_RADIO_NETSTATE_0118
     * @tc.desc   PLMN input #38 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0118 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20037');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20037'));
      expect(result).assertEqual('20037');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0118 end');
    })

    /**
     * @tc.name   testRadioNetState0119
     * @tc.number SUB_RADIO_NETSTATE_0119
     * @tc.desc   PLMN input #39 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0119 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20038');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20038'));
      expect(result).assertEqual('20038');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0119 end');
    })

    /**
     * @tc.name   testRadioNetState0120
     * @tc.number SUB_RADIO_NETSTATE_0120
     * @tc.desc   PLMN input #40 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0120 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20039');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20039'));
      expect(result).assertEqual('20039');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0120 end');
    })

    /**
     * @tc.name   testRadioNetState0121
     * @tc.number SUB_RADIO_NETSTATE_0121
     * @tc.desc   PLMN input #41 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0121 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20040');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20040'));
      expect(result).assertEqual('20040');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0121 end');
    })

    /**
     * @tc.name   testRadioNetState0122
     * @tc.number SUB_RADIO_NETSTATE_0122
     * @tc.desc   PLMN input #42 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0122 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20041');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20041'));
      expect(result).assertEqual('20041');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0122 end');
    })

    /**
     * @tc.name   testRadioNetState0123
     * @tc.number SUB_RADIO_NETSTATE_0123
     * @tc.desc   PLMN input #43 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0123 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20042');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20042'));
      expect(result).assertEqual('20042');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0123 end');
    })

    /**
     * @tc.name   testRadioNetState0124
     * @tc.number SUB_RADIO_NETSTATE_0124
     * @tc.desc   PLMN input #44 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0124 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20043');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20043'));
      expect(result).assertEqual('20043');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0124 end');
    })

    /**
     * @tc.name   testRadioNetState0125
     * @tc.number SUB_RADIO_NETSTATE_0125
     * @tc.desc   PLMN input #45 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0125 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20044');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20044'));
      expect(result).assertEqual('20044');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0125 end');
    })

    /**
     * @tc.name   testRadioNetState0126
     * @tc.number SUB_RADIO_NETSTATE_0126
     * @tc.desc   PLMN input #46 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0126 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20045');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20045'));
      expect(result).assertEqual('20045');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0126 end');
    })

    /**
     * @tc.name   testRadioNetState0127
     * @tc.number SUB_RADIO_NETSTATE_0127
     * @tc.desc   PLMN input #47 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0127 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20046');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20046'));
      expect(result).assertEqual('20046');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0127 end');
    })

    /**
     * @tc.name   testRadioNetState0128
     * @tc.number SUB_RADIO_NETSTATE_0128
     * @tc.desc   PLMN input #48 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0128 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20047');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20047'));
      expect(result).assertEqual('20047');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0128 end');
    })

    /**
     * @tc.name   testRadioNetState0129
     * @tc.number SUB_RADIO_NETSTATE_0129
     * @tc.desc   PLMN input #49 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0129 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20048');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20048'));
      expect(result).assertEqual('20048');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0129 end');
    })

    /**
     * @tc.name   testRadioNetState0130
     * @tc.number SUB_RADIO_NETSTATE_0130
     * @tc.desc   PLMN input #50 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0130 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20049');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20049'));
      expect(result).assertEqual('20049');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0130 end');
    })

    /**
     * @tc.name   testRadioNetState0131
     * @tc.number SUB_RADIO_NETSTATE_0131
     * @tc.desc   PLMN input #51 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0131 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20050');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20050'));
      expect(result).assertEqual('20050');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0131 end');
    })

    /**
     * @tc.name   testRadioNetState0132
     * @tc.number SUB_RADIO_NETSTATE_0132
     * @tc.desc   PLMN input #52 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0132 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20051');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20051'));
      expect(result).assertEqual('20051');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0132 end');
    })

    /**
     * @tc.name   testRadioNetState0133
     * @tc.number SUB_RADIO_NETSTATE_0133
     * @tc.desc   PLMN input #53 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0133 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20052');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20052'));
      expect(result).assertEqual('20052');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0133 end');
    })

    /**
     * @tc.name   testRadioNetState0134
     * @tc.number SUB_RADIO_NETSTATE_0134
     * @tc.desc   PLMN input #54 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0134 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20053');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20053'));
      expect(result).assertEqual('20053');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0134 end');
    })

    /**
     * @tc.name   testRadioNetState0135
     * @tc.number SUB_RADIO_NETSTATE_0135
     * @tc.desc   PLMN input #55 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0135 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20054');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20054'));
      expect(result).assertEqual('20054');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0135 end');
    })

    /**
     * @tc.name   testRadioNetState0136
     * @tc.number SUB_RADIO_NETSTATE_0136
     * @tc.desc   PLMN input #56 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0136 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20055');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20055'));
      expect(result).assertEqual('20055');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0136 end');
    })

    /**
     * @tc.name   testRadioNetState0137
     * @tc.number SUB_RADIO_NETSTATE_0137
     * @tc.desc   PLMN input #57 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0137 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20056');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20056'));
      expect(result).assertEqual('20056');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0137 end');
    })

    /**
     * @tc.name   testRadioNetState0138
     * @tc.number SUB_RADIO_NETSTATE_0138
     * @tc.desc   PLMN input #58 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0138 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20057');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20057'));
      expect(result).assertEqual('20057');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0138 end');
    })

    /**
     * @tc.name   testRadioNetState0139
     * @tc.number SUB_RADIO_NETSTATE_0139
     * @tc.desc   PLMN input #59 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0139 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20058');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20058'));
      expect(result).assertEqual('20058');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0139 end');
    })

    /**
     * @tc.name   testRadioNetState0140
     * @tc.number SUB_RADIO_NETSTATE_0140
     * @tc.desc   PLMN input #60 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0140 begin');
      const result: string = NetworkStateFormatter.formatPlmn('20059');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20059'));
      expect(result).assertEqual('20059');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0140 end');
    })

    /**
     * @tc.name   testRadioNetState0141
     * @tc.number SUB_RADIO_NETSTATE_0141
     * @tc.desc   PLMN input #61 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0141 begin');
      const result: string = NetworkStateFormatter.formatPlmn(' 46000 ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('46000'));
      expect(result).assertEqual('46000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0141 end');
    })

    /**
     * @tc.name   testRadioNetState0142
     * @tc.number SUB_RADIO_NETSTATE_0142
     * @tc.desc   PLMN input #62 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0142 begin');
      const result: string = NetworkStateFormatter.formatPlmn(' 46001 ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('46001'));
      expect(result).assertEqual('46001');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0142 end');
    })

    /**
     * @tc.name   testRadioNetState0143
     * @tc.number SUB_RADIO_NETSTATE_0143
     * @tc.desc   PLMN input #63 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0143 begin');
      const result: string = NetworkStateFormatter.formatPlmn(' 46002 ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('46002'));
      expect(result).assertEqual('46002');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0143 end');
    })

    /**
     * @tc.name   testRadioNetState0144
     * @tc.number SUB_RADIO_NETSTATE_0144
     * @tc.desc   PLMN input #64 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0144 begin');
      const result: string = NetworkStateFormatter.formatPlmn(' 46003 ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('46003'));
      expect(result).assertEqual('46003');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0144 end');
    })

    /**
     * @tc.name   testRadioNetState0145
     * @tc.number SUB_RADIO_NETSTATE_0145
     * @tc.desc   PLMN input #65 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0145 begin');
      const result: string = NetworkStateFormatter.formatPlmn(' 46011 ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('46011'));
      expect(result).assertEqual('46011');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0145 end');
    })

    /**
     * @tc.name   testRadioNetState0146
     * @tc.number SUB_RADIO_NETSTATE_0146
     * @tc.desc   PLMN input #66 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0146 begin');
      const result: string = NetworkStateFormatter.formatPlmn(' 310260 ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('310260'));
      expect(result).assertEqual('310260');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0146 end');
    })

    /**
     * @tc.name   testRadioNetState0147
     * @tc.number SUB_RADIO_NETSTATE_0147
     * @tc.desc   PLMN input #67 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0147 begin');
      const result: string = NetworkStateFormatter.formatPlmn(' 310410 ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('310410'));
      expect(result).assertEqual('310410');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0147 end');
    })

    /**
     * @tc.name   testRadioNetState0148
     * @tc.number SUB_RADIO_NETSTATE_0148
     * @tc.desc   PLMN input #68 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0148 begin');
      const result: string = NetworkStateFormatter.formatPlmn(' 44010 ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('44010'));
      expect(result).assertEqual('44010');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0148 end');
    })

    /**
     * @tc.name   testRadioNetState0149
     * @tc.number SUB_RADIO_NETSTATE_0149
     * @tc.desc   PLMN input #69 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0149 begin');
      const result: string = NetworkStateFormatter.formatPlmn(' 45000 ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('45000'));
      expect(result).assertEqual('45000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0149 end');
    })

    /**
     * @tc.name   testRadioNetState0150
     * @tc.number SUB_RADIO_NETSTATE_0150
     * @tc.desc   PLMN input #70 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0150 begin');
      const result: string = NetworkStateFormatter.formatPlmn(' 99999 ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('99999'));
      expect(result).assertEqual('99999');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0150 end');
    })

    /**
     * @tc.name   testRadioNetState0151
     * @tc.number SUB_RADIO_NETSTATE_0151
     * @tc.desc   PLMN input #71 falls back
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0151 begin');
      const result: string = NetworkStateFormatter.formatPlmn('1234');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0151 end');
    })

    /**
     * @tc.name   testRadioNetState0152
     * @tc.number SUB_RADIO_NETSTATE_0152
     * @tc.desc   PLMN input #72 falls back
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0152 begin');
      const result: string = NetworkStateFormatter.formatPlmn('1234567');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0152 end');
    })

    /**
     * @tc.name   testRadioNetState0153
     * @tc.number SUB_RADIO_NETSTATE_0153
     * @tc.desc   PLMN input #73 falls back
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0153 begin');
      const result: string = NetworkStateFormatter.formatPlmn('abcde');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0153 end');
    })

    /**
     * @tc.name   testRadioNetState0154
     * @tc.number SUB_RADIO_NETSTATE_0154
     * @tc.desc   PLMN input #74 falls back
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0154 begin');
      const result: string = NetworkStateFormatter.formatPlmn('12a45');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0154 end');
    })

    /**
     * @tc.name   testRadioNetState0155
     * @tc.number SUB_RADIO_NETSTATE_0155
     * @tc.desc   PLMN input #75 falls back
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0155 begin');
      const result: string = NetworkStateFormatter.formatPlmn('4600');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0155 end');
    })

    /**
     * @tc.name   testRadioNetState0156
     * @tc.number SUB_RADIO_NETSTATE_0156
     * @tc.desc   PLMN input #76 falls back
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0156 begin');
      const result: string = NetworkStateFormatter.formatPlmn('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0156 end');
    })

    /**
     * @tc.name   testRadioNetState0157
     * @tc.number SUB_RADIO_NETSTATE_0157
     * @tc.desc   PLMN input #77 falls back
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0157 begin');
      const result: string = NetworkStateFormatter.formatPlmn('   ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0157 end');
    })

    /**
     * @tc.name   testRadioNetState0158
     * @tc.number SUB_RADIO_NETSTATE_0158
     * @tc.desc   PLMN input #78 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0158 begin');
      const result: string = NetworkStateFormatter.formatPlmn('46000 ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('46000'));
      expect(result).assertEqual('46000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0158 end');
    })

    /**
     * @tc.name   testRadioNetState0159
     * @tc.number SUB_RADIO_NETSTATE_0159
     * @tc.desc   PLMN input #79 keeps digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0159 begin');
      const result: string = NetworkStateFormatter.formatPlmn(' 46000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('46000'));
      expect(result).assertEqual('46000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result === 'not available' || result.length === 5 || result.length === 6));
      expect(result === 'not available' || result.length === 5 || result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0159 end');
    })

    /**
     * @tc.name   testRadioNetState0160
     * @tc.number SUB_RADIO_NETSTATE_0160
     * @tc.desc   六位 PLMN 走 3 位 MNC 分支
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0160 begin');
      const anchorResult: string = NetworkStateFormatter.formatPlmn('460001');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(anchorResult), String('460001'));
      expect(anchorResult).assertEqual('460001');
      expect(anchorResult.length).assertEqual(6);
      expect(anchorResult.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0160 end');
    })
  })
}
