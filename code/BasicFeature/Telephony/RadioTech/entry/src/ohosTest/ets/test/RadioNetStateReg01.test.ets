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

export default function radioNetStateReg01Test() {
  describe('RadioNetStateReg01Test', () => {

    /**
     * @tc.name   testRadioNetState0161
     * @tc.number SUB_RADIO_NETSTATE_0161
     * @tc.desc   regState 0 maps to documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0161 begin');
      const result: string = NetworkStateFormatter.formatRegState(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('no service'));
      expect(result).assertEqual('no service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(0) !== 1));
      expect(result === 'in service' && Number(0) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0161 end');
    })

    /**
     * @tc.name   testRadioNetState0162
     * @tc.number SUB_RADIO_NETSTATE_0162
     * @tc.desc   regState 1 maps to documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0162 begin');
      const result: string = NetworkStateFormatter.formatRegState(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('in service'));
      expect(result).assertEqual('in service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(1) !== 1));
      expect(result === 'in service' && Number(1) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0162 end');
    })

    /**
     * @tc.name   testRadioNetState0163
     * @tc.number SUB_RADIO_NETSTATE_0163
     * @tc.desc   regState 2 maps to documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0163 begin');
      const result: string = NetworkStateFormatter.formatRegState(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(2) !== 1));
      expect(result === 'in service' && Number(2) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0163 end');
    })

    /**
     * @tc.name   testRadioNetState0164
     * @tc.number SUB_RADIO_NETSTATE_0164
     * @tc.desc   regState 3 maps to documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0164 begin');
      const result: string = NetworkStateFormatter.formatRegState(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('power off'));
      expect(result).assertEqual('power off');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(3) !== 1));
      expect(result === 'in service' && Number(3) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0164 end');
    })

    /**
     * @tc.name   testRadioNetState0165
     * @tc.number SUB_RADIO_NETSTATE_0165
     * @tc.desc   regState 4 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0165 begin');
      const result: string = NetworkStateFormatter.formatRegState(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(4) !== 1));
      expect(result === 'in service' && Number(4) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0165 end');
    })

    /**
     * @tc.name   testRadioNetState0166
     * @tc.number SUB_RADIO_NETSTATE_0166
     * @tc.desc   regState 5 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0166 begin');
      const result: string = NetworkStateFormatter.formatRegState(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(5) !== 1));
      expect(result === 'in service' && Number(5) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0166 end');
    })

    /**
     * @tc.name   testRadioNetState0167
     * @tc.number SUB_RADIO_NETSTATE_0167
     * @tc.desc   regState 6 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0167 begin');
      const result: string = NetworkStateFormatter.formatRegState(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(6) !== 1));
      expect(result === 'in service' && Number(6) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0167 end');
    })

    /**
     * @tc.name   testRadioNetState0168
     * @tc.number SUB_RADIO_NETSTATE_0168
     * @tc.desc   regState 7 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0168 begin');
      const result: string = NetworkStateFormatter.formatRegState(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(7) !== 1));
      expect(result === 'in service' && Number(7) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0168 end');
    })

    /**
     * @tc.name   testRadioNetState0169
     * @tc.number SUB_RADIO_NETSTATE_0169
     * @tc.desc   regState 8 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0169 begin');
      const result: string = NetworkStateFormatter.formatRegState(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(8) !== 1));
      expect(result === 'in service' && Number(8) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0169 end');
    })

    /**
     * @tc.name   testRadioNetState0170
     * @tc.number SUB_RADIO_NETSTATE_0170
     * @tc.desc   regState 9 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0170 begin');
      const result: string = NetworkStateFormatter.formatRegState(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(9) !== 1));
      expect(result === 'in service' && Number(9) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0170 end');
    })

    /**
     * @tc.name   testRadioNetState0171
     * @tc.number SUB_RADIO_NETSTATE_0171
     * @tc.desc   regState 10 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0171 begin');
      const result: string = NetworkStateFormatter.formatRegState(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(10) !== 1));
      expect(result === 'in service' && Number(10) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0171 end');
    })

    /**
     * @tc.name   testRadioNetState0172
     * @tc.number SUB_RADIO_NETSTATE_0172
     * @tc.desc   regState 11 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0172 begin');
      const result: string = NetworkStateFormatter.formatRegState(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(11) !== 1));
      expect(result === 'in service' && Number(11) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0172 end');
    })

    /**
     * @tc.name   testRadioNetState0173
     * @tc.number SUB_RADIO_NETSTATE_0173
     * @tc.desc   regState 12 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0173 begin');
      const result: string = NetworkStateFormatter.formatRegState(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(12) !== 1));
      expect(result === 'in service' && Number(12) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0173 end');
    })

    /**
     * @tc.name   testRadioNetState0174
     * @tc.number SUB_RADIO_NETSTATE_0174
     * @tc.desc   regState 13 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0174 begin');
      const result: string = NetworkStateFormatter.formatRegState(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(13) !== 1));
      expect(result === 'in service' && Number(13) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0174 end');
    })

    /**
     * @tc.name   testRadioNetState0175
     * @tc.number SUB_RADIO_NETSTATE_0175
     * @tc.desc   regState 14 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0175 begin');
      const result: string = NetworkStateFormatter.formatRegState(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(14) !== 1));
      expect(result === 'in service' && Number(14) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0175 end');
    })

    /**
     * @tc.name   testRadioNetState0176
     * @tc.number SUB_RADIO_NETSTATE_0176
     * @tc.desc   regState 15 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0176 begin');
      const result: string = NetworkStateFormatter.formatRegState(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(15) !== 1));
      expect(result === 'in service' && Number(15) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0176 end');
    })

    /**
     * @tc.name   testRadioNetState0177
     * @tc.number SUB_RADIO_NETSTATE_0177
     * @tc.desc   regState 16 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0177 begin');
      const result: string = NetworkStateFormatter.formatRegState(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(16) !== 1));
      expect(result === 'in service' && Number(16) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0177 end');
    })

    /**
     * @tc.name   testRadioNetState0178
     * @tc.number SUB_RADIO_NETSTATE_0178
     * @tc.desc   regState 17 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0178 begin');
      const result: string = NetworkStateFormatter.formatRegState(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(17) !== 1));
      expect(result === 'in service' && Number(17) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0178 end');
    })

    /**
     * @tc.name   testRadioNetState0179
     * @tc.number SUB_RADIO_NETSTATE_0179
     * @tc.desc   regState 18 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0179 begin');
      const result: string = NetworkStateFormatter.formatRegState(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(18) !== 1));
      expect(result === 'in service' && Number(18) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0179 end');
    })

    /**
     * @tc.name   testRadioNetState0180
     * @tc.number SUB_RADIO_NETSTATE_0180
     * @tc.desc   regState 19 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0180 begin');
      const result: string = NetworkStateFormatter.formatRegState(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(19) !== 1));
      expect(result === 'in service' && Number(19) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0180 end');
    })

    /**
     * @tc.name   testRadioNetState0181
     * @tc.number SUB_RADIO_NETSTATE_0181
     * @tc.desc   regState 20 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0181 begin');
      const result: string = NetworkStateFormatter.formatRegState(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(20) !== 1));
      expect(result === 'in service' && Number(20) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0181 end');
    })

    /**
     * @tc.name   testRadioNetState0182
     * @tc.number SUB_RADIO_NETSTATE_0182
     * @tc.desc   regState 21 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0182 begin');
      const result: string = NetworkStateFormatter.formatRegState(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(21) !== 1));
      expect(result === 'in service' && Number(21) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0182 end');
    })

    /**
     * @tc.name   testRadioNetState0183
     * @tc.number SUB_RADIO_NETSTATE_0183
     * @tc.desc   regState 22 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0183 begin');
      const result: string = NetworkStateFormatter.formatRegState(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(22) !== 1));
      expect(result === 'in service' && Number(22) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0183 end');
    })

    /**
     * @tc.name   testRadioNetState0184
     * @tc.number SUB_RADIO_NETSTATE_0184
     * @tc.desc   regState 23 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0184 begin');
      const result: string = NetworkStateFormatter.formatRegState(23);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(23) !== 1));
      expect(result === 'in service' && Number(23) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0184 end');
    })

    /**
     * @tc.name   testRadioNetState0185
     * @tc.number SUB_RADIO_NETSTATE_0185
     * @tc.desc   regState 24 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0185 begin');
      const result: string = NetworkStateFormatter.formatRegState(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(24) !== 1));
      expect(result === 'in service' && Number(24) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0185 end');
    })

    /**
     * @tc.name   testRadioNetState0186
     * @tc.number SUB_RADIO_NETSTATE_0186
     * @tc.desc   regState 25 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0186 begin');
      const result: string = NetworkStateFormatter.formatRegState(25);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(25) !== 1));
      expect(result === 'in service' && Number(25) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0186 end');
    })

    /**
     * @tc.name   testRadioNetState0187
     * @tc.number SUB_RADIO_NETSTATE_0187
     * @tc.desc   regState 26 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0187 begin');
      const result: string = NetworkStateFormatter.formatRegState(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(26) !== 1));
      expect(result === 'in service' && Number(26) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0187 end');
    })

    /**
     * @tc.name   testRadioNetState0188
     * @tc.number SUB_RADIO_NETSTATE_0188
     * @tc.desc   regState 27 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0188 begin');
      const result: string = NetworkStateFormatter.formatRegState(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(27) !== 1));
      expect(result === 'in service' && Number(27) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0188 end');
    })

    /**
     * @tc.name   testRadioNetState0189
     * @tc.number SUB_RADIO_NETSTATE_0189
     * @tc.desc   regState 28 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0189 begin');
      const result: string = NetworkStateFormatter.formatRegState(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(28) !== 1));
      expect(result === 'in service' && Number(28) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0189 end');
    })

    /**
     * @tc.name   testRadioNetState0190
     * @tc.number SUB_RADIO_NETSTATE_0190
     * @tc.desc   regState 29 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0190 begin');
      const result: string = NetworkStateFormatter.formatRegState(29);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(29) !== 1));
      expect(result === 'in service' && Number(29) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0190 end');
    })

    /**
     * @tc.name   testRadioNetState0191
     * @tc.number SUB_RADIO_NETSTATE_0191
     * @tc.desc   regState 30 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0191 begin');
      const result: string = NetworkStateFormatter.formatRegState(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(30) !== 1));
      expect(result === 'in service' && Number(30) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0191 end');
    })

    /**
     * @tc.name   testRadioNetState0192
     * @tc.number SUB_RADIO_NETSTATE_0192
     * @tc.desc   regState 31 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0192 begin');
      const result: string = NetworkStateFormatter.formatRegState(31);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(31) !== 1));
      expect(result === 'in service' && Number(31) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0192 end');
    })

    /**
     * @tc.name   testRadioNetState0193
     * @tc.number SUB_RADIO_NETSTATE_0193
     * @tc.desc   regState 32 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0193 begin');
      const result: string = NetworkStateFormatter.formatRegState(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(32) !== 1));
      expect(result === 'in service' && Number(32) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0193 end');
    })

    /**
     * @tc.name   testRadioNetState0194
     * @tc.number SUB_RADIO_NETSTATE_0194
     * @tc.desc   regState 33 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0194 begin');
      const result: string = NetworkStateFormatter.formatRegState(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(33) !== 1));
      expect(result === 'in service' && Number(33) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0194 end');
    })

    /**
     * @tc.name   testRadioNetState0195
     * @tc.number SUB_RADIO_NETSTATE_0195
     * @tc.desc   regState 34 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0195 begin');
      const result: string = NetworkStateFormatter.formatRegState(34);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(34) !== 1));
      expect(result === 'in service' && Number(34) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0195 end');
    })

    /**
     * @tc.name   testRadioNetState0196
     * @tc.number SUB_RADIO_NETSTATE_0196
     * @tc.desc   regState 35 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0196 begin');
      const result: string = NetworkStateFormatter.formatRegState(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(35) !== 1));
      expect(result === 'in service' && Number(35) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0196 end');
    })

    /**
     * @tc.name   testRadioNetState0197
     * @tc.number SUB_RADIO_NETSTATE_0197
     * @tc.desc   regState 36 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0197 begin');
      const result: string = NetworkStateFormatter.formatRegState(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(36) !== 1));
      expect(result === 'in service' && Number(36) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0197 end');
    })

    /**
     * @tc.name   testRadioNetState0198
     * @tc.number SUB_RADIO_NETSTATE_0198
     * @tc.desc   regState 37 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0198 begin');
      const result: string = NetworkStateFormatter.formatRegState(37);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(37) !== 1));
      expect(result === 'in service' && Number(37) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0198 end');
    })

    /**
     * @tc.name   testRadioNetState0199
     * @tc.number SUB_RADIO_NETSTATE_0199
     * @tc.desc   regState 38 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0199 begin');
      const result: string = NetworkStateFormatter.formatRegState(38);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(38) !== 1));
      expect(result === 'in service' && Number(38) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0199 end');
    })

    /**
     * @tc.name   testRadioNetState0200
     * @tc.number SUB_RADIO_NETSTATE_0200
     * @tc.desc   regState 39 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0200 begin');
      const result: string = NetworkStateFormatter.formatRegState(39);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(39) !== 1));
      expect(result === 'in service' && Number(39) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0200 end');
    })

    /**
     * @tc.name   testRadioNetState0201
     * @tc.number SUB_RADIO_NETSTATE_0201
     * @tc.desc   regState 40 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0201 begin');
      const result: string = NetworkStateFormatter.formatRegState(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(40) !== 1));
      expect(result === 'in service' && Number(40) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0201 end');
    })

    /**
     * @tc.name   testRadioNetState0202
     * @tc.number SUB_RADIO_NETSTATE_0202
     * @tc.desc   regState 41 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0202 begin');
      const result: string = NetworkStateFormatter.formatRegState(41);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(41) !== 1));
      expect(result === 'in service' && Number(41) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0202 end');
    })

    /**
     * @tc.name   testRadioNetState0203
     * @tc.number SUB_RADIO_NETSTATE_0203
     * @tc.desc   regState 42 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0203 begin');
      const result: string = NetworkStateFormatter.formatRegState(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(42) !== 1));
      expect(result === 'in service' && Number(42) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0203 end');
    })

    /**
     * @tc.name   testRadioNetState0204
     * @tc.number SUB_RADIO_NETSTATE_0204
     * @tc.desc   regState 43 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0204 begin');
      const result: string = NetworkStateFormatter.formatRegState(43);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(43) !== 1));
      expect(result === 'in service' && Number(43) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0204 end');
    })

    /**
     * @tc.name   testRadioNetState0205
     * @tc.number SUB_RADIO_NETSTATE_0205
     * @tc.desc   regState 44 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0205 begin');
      const result: string = NetworkStateFormatter.formatRegState(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(44) !== 1));
      expect(result === 'in service' && Number(44) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0205 end');
    })

    /**
     * @tc.name   testRadioNetState0206
     * @tc.number SUB_RADIO_NETSTATE_0206
     * @tc.desc   regState 45 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0206 begin');
      const result: string = NetworkStateFormatter.formatRegState(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(45) !== 1));
      expect(result === 'in service' && Number(45) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0206 end');
    })

    /**
     * @tc.name   testRadioNetState0207
     * @tc.number SUB_RADIO_NETSTATE_0207
     * @tc.desc   regState 46 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0207 begin');
      const result: string = NetworkStateFormatter.formatRegState(46);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(46) !== 1));
      expect(result === 'in service' && Number(46) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0207 end');
    })

    /**
     * @tc.name   testRadioNetState0208
     * @tc.number SUB_RADIO_NETSTATE_0208
     * @tc.desc   regState 47 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0208 begin');
      const result: string = NetworkStateFormatter.formatRegState(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(47) !== 1));
      expect(result === 'in service' && Number(47) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0208 end');
    })

    /**
     * @tc.name   testRadioNetState0209
     * @tc.number SUB_RADIO_NETSTATE_0209
     * @tc.desc   regState 48 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0209 begin');
      const result: string = NetworkStateFormatter.formatRegState(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(48) !== 1));
      expect(result === 'in service' && Number(48) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0209 end');
    })

    /**
     * @tc.name   testRadioNetState0210
     * @tc.number SUB_RADIO_NETSTATE_0210
     * @tc.desc   regState 49 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0210 begin');
      const result: string = NetworkStateFormatter.formatRegState(49);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(49) !== 1));
      expect(result === 'in service' && Number(49) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0210 end');
    })

    /**
     * @tc.name   testRadioNetState0211
     * @tc.number SUB_RADIO_NETSTATE_0211
     * @tc.desc   regState 50 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0211 begin');
      const result: string = NetworkStateFormatter.formatRegState(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(50) !== 1));
      expect(result === 'in service' && Number(50) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0211 end');
    })

    /**
     * @tc.name   testRadioNetState0212
     * @tc.number SUB_RADIO_NETSTATE_0212
     * @tc.desc   regState 51 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0212 begin');
      const result: string = NetworkStateFormatter.formatRegState(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(51) !== 1));
      expect(result === 'in service' && Number(51) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0212 end');
    })

    /**
     * @tc.name   testRadioNetState0213
     * @tc.number SUB_RADIO_NETSTATE_0213
     * @tc.desc   regState 52 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0213 begin');
      const result: string = NetworkStateFormatter.formatRegState(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(52) !== 1));
      expect(result === 'in service' && Number(52) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0213 end');
    })

    /**
     * @tc.name   testRadioNetState0214
     * @tc.number SUB_RADIO_NETSTATE_0214
     * @tc.desc   regState 53 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0214 begin');
      const result: string = NetworkStateFormatter.formatRegState(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(53) !== 1));
      expect(result === 'in service' && Number(53) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0214 end');
    })

    /**
     * @tc.name   testRadioNetState0215
     * @tc.number SUB_RADIO_NETSTATE_0215
     * @tc.desc   regState 54 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0215 begin');
      const result: string = NetworkStateFormatter.formatRegState(54);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(54) !== 1));
      expect(result === 'in service' && Number(54) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0215 end');
    })

    /**
     * @tc.name   testRadioNetState0216
     * @tc.number SUB_RADIO_NETSTATE_0216
     * @tc.desc   regState 55 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0216 begin');
      const result: string = NetworkStateFormatter.formatRegState(55);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(55) !== 1));
      expect(result === 'in service' && Number(55) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0216 end');
    })

    /**
     * @tc.name   testRadioNetState0217
     * @tc.number SUB_RADIO_NETSTATE_0217
     * @tc.desc   regState 56 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0217 begin');
      const result: string = NetworkStateFormatter.formatRegState(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(56) !== 1));
      expect(result === 'in service' && Number(56) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0217 end');
    })

    /**
     * @tc.name   testRadioNetState0218
     * @tc.number SUB_RADIO_NETSTATE_0218
     * @tc.desc   regState 57 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0218 begin');
      const result: string = NetworkStateFormatter.formatRegState(57);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(57) !== 1));
      expect(result === 'in service' && Number(57) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0218 end');
    })

    /**
     * @tc.name   testRadioNetState0219
     * @tc.number SUB_RADIO_NETSTATE_0219
     * @tc.desc   regState 58 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0219 begin');
      const result: string = NetworkStateFormatter.formatRegState(58);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(58) !== 1));
      expect(result === 'in service' && Number(58) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0219 end');
    })

    /**
     * @tc.name   testRadioNetState0220
     * @tc.number SUB_RADIO_NETSTATE_0220
     * @tc.desc   regState 59 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0220 begin');
      const result: string = NetworkStateFormatter.formatRegState(59);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(59) !== 1));
      expect(result === 'in service' && Number(59) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0220 end');
    })

    /**
     * @tc.name   testRadioNetState0221
     * @tc.number SUB_RADIO_NETSTATE_0221
     * @tc.desc   regState 60 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0221 begin');
      const result: string = NetworkStateFormatter.formatRegState(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(60) !== 1));
      expect(result === 'in service' && Number(60) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0221 end');
    })

    /**
     * @tc.name   testRadioNetState0222
     * @tc.number SUB_RADIO_NETSTATE_0222
     * @tc.desc   regState -1 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0222 begin');
      const result: string = NetworkStateFormatter.formatRegState(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(-1) !== 1));
      expect(result === 'in service' && Number(-1) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0222 end');
    })

    /**
     * @tc.name   testRadioNetState0223
     * @tc.number SUB_RADIO_NETSTATE_0223
     * @tc.desc   regState -2 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0223 begin');
      const result: string = NetworkStateFormatter.formatRegState(-2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(-2) !== 1));
      expect(result === 'in service' && Number(-2) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0223 end');
    })

    /**
     * @tc.name   testRadioNetState0224
     * @tc.number SUB_RADIO_NETSTATE_0224
     * @tc.desc   regState -10 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0224 begin');
      const result: string = NetworkStateFormatter.formatRegState(-10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(-10) !== 1));
      expect(result === 'in service' && Number(-10) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0224 end');
    })

    /**
     * @tc.name   testRadioNetState0225
     * @tc.number SUB_RADIO_NETSTATE_0225
     * @tc.desc   regState -100 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0225 begin');
      const result: string = NetworkStateFormatter.formatRegState(-100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(-100) !== 1));
      expect(result === 'in service' && Number(-100) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0225 end');
    })

    /**
     * @tc.name   testRadioNetState0226
     * @tc.number SUB_RADIO_NETSTATE_0226
     * @tc.desc   regState 1.5 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0226 begin');
      const result: string = NetworkStateFormatter.formatRegState(1.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(1.5) !== 1));
      expect(result === 'in service' && Number(1.5) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0226 end');
    })

    /**
     * @tc.name   testRadioNetState0227
     * @tc.number SUB_RADIO_NETSTATE_0227
     * @tc.desc   regState 2.5 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0227 begin');
      const result: string = NetworkStateFormatter.formatRegState(2.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(2.5) !== 1));
      expect(result === 'in service' && Number(2.5) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0227 end');
    })

    /**
     * @tc.name   testRadioNetState0228
     * @tc.number SUB_RADIO_NETSTATE_0228
     * @tc.desc   regState 3.5 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0228 begin');
      const result: string = NetworkStateFormatter.formatRegState(3.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(3.5) !== 1));
      expect(result === 'in service' && Number(3.5) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0228 end');
    })

    /**
     * @tc.name   testRadioNetState0229
     * @tc.number SUB_RADIO_NETSTATE_0229
     * @tc.desc   regState 0.1 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0229 begin');
      const result: string = NetworkStateFormatter.formatRegState(0.1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(0.1) !== 1));
      expect(result === 'in service' && Number(0.1) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0229 end');
    })

    /**
     * @tc.name   testRadioNetState0230
     * @tc.number SUB_RADIO_NETSTATE_0230
     * @tc.desc   regState 10.25 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0230 begin');
      const result: string = NetworkStateFormatter.formatRegState(10.25);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(10.25) !== 1));
      expect(result === 'in service' && Number(10.25) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0230 end');
    })

    /**
     * @tc.name   testRadioNetState0231
     * @tc.number SUB_RADIO_NETSTATE_0231
     * @tc.desc   regState -0.5 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0231 begin');
      const result: string = NetworkStateFormatter.formatRegState(-0.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(-0.5) !== 1));
      expect(result === 'in service' && Number(-0.5) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0231 end');
    })

    /**
     * @tc.name   testRadioNetState0232
     * @tc.number SUB_RADIO_NETSTATE_0232
     * @tc.desc   regState 61 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0232 begin');
      const result: string = NetworkStateFormatter.formatRegState(61);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(61) !== 1));
      expect(result === 'in service' && Number(61) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0232 end');
    })

    /**
     * @tc.name   testRadioNetState0233
     * @tc.number SUB_RADIO_NETSTATE_0233
     * @tc.desc   regState 62 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0233 begin');
      const result: string = NetworkStateFormatter.formatRegState(62);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(62) !== 1));
      expect(result === 'in service' && Number(62) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0233 end');
    })

    /**
     * @tc.name   testRadioNetState0234
     * @tc.number SUB_RADIO_NETSTATE_0234
     * @tc.desc   regState 63 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0234 begin');
      const result: string = NetworkStateFormatter.formatRegState(63);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(63) !== 1));
      expect(result === 'in service' && Number(63) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0234 end');
    })

    /**
     * @tc.name   testRadioNetState0235
     * @tc.number SUB_RADIO_NETSTATE_0235
     * @tc.desc   regState 64 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0235 begin');
      const result: string = NetworkStateFormatter.formatRegState(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(64) !== 1));
      expect(result === 'in service' && Number(64) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0235 end');
    })

    /**
     * @tc.name   testRadioNetState0236
     * @tc.number SUB_RADIO_NETSTATE_0236
     * @tc.desc   regState 65 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0236 begin');
      const result: string = NetworkStateFormatter.formatRegState(65);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(65) !== 1));
      expect(result === 'in service' && Number(65) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0236 end');
    })

    /**
     * @tc.name   testRadioNetState0237
     * @tc.number SUB_RADIO_NETSTATE_0237
     * @tc.desc   regState 66 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0237 begin');
      const result: string = NetworkStateFormatter.formatRegState(66);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(66) !== 1));
      expect(result === 'in service' && Number(66) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0237 end');
    })

    /**
     * @tc.name   testRadioNetState0238
     * @tc.number SUB_RADIO_NETSTATE_0238
     * @tc.desc   regState 67 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0238 begin');
      const result: string = NetworkStateFormatter.formatRegState(67);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(67) !== 1));
      expect(result === 'in service' && Number(67) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0238 end');
    })

    /**
     * @tc.name   testRadioNetState0239
     * @tc.number SUB_RADIO_NETSTATE_0239
     * @tc.desc   regState 68 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0239 begin');
      const result: string = NetworkStateFormatter.formatRegState(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'in service' && Number(68) !== 1));
      expect(result === 'in service' && Number(68) !== 1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0239 end');
    })

    /**
     * @tc.name   testRadioNetState0240
     * @tc.number SUB_RADIO_NETSTATE_0240
     * @tc.desc   紧急呼叫状态映射到固定名称
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0240 begin');
      const anchorResult: string = NetworkStateFormatter.formatRegState(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(anchorResult));
      expect(anchorResult).assertEqual('emergency call only');
      expect(anchorResult.length).assertEqual(19);
      expect(anchorResult.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0240 end');
    })
  })
}
