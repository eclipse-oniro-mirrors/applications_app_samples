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

export default function radioNetStateNsa01Test() {
  describe('RadioNetStateNsa01Test', () => {

    /**
     * @tc.name   testRadioNetState0241
     * @tc.number SUB_RADIO_NETSTATE_0241
     * @tc.desc   nsaState 0 maps to documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0241 begin');
      const result: string = NetworkStateFormatter.formatNsaState(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(0) !== 6));
      expect(result === 'sa attached' && Number(0) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0241 end');
    })

    /**
     * @tc.name   testRadioNetState0242
     * @tc.number SUB_RADIO_NETSTATE_0242
     * @tc.desc   nsaState 1 maps to documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0242 begin');
      const result: string = NetworkStateFormatter.formatNsaState(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not support'));
      expect(result).assertEqual('not support');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(1) !== 6));
      expect(result === 'sa attached' && Number(1) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0242 end');
    })

    /**
     * @tc.name   testRadioNetState0243
     * @tc.number SUB_RADIO_NETSTATE_0243
     * @tc.desc   nsaState 2 maps to documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0243 begin');
      const result: string = NetworkStateFormatter.formatNsaState(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('no detect'));
      expect(result).assertEqual('no detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(2) !== 6));
      expect(result === 'sa attached' && Number(2) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0243 end');
    })

    /**
     * @tc.name   testRadioNetState0244
     * @tc.number SUB_RADIO_NETSTATE_0244
     * @tc.desc   nsaState 3 maps to documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0244 begin');
      const result: string = NetworkStateFormatter.formatNsaState(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('connected detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(3) !== 6));
      expect(result === 'sa attached' && Number(3) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0244 end');
    })

    /**
     * @tc.name   testRadioNetState0245
     * @tc.number SUB_RADIO_NETSTATE_0245
     * @tc.desc   nsaState 4 maps to documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0245 begin');
      const result: string = NetworkStateFormatter.formatNsaState(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('idle detect'));
      expect(result).assertEqual('idle detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(4) !== 6));
      expect(result === 'sa attached' && Number(4) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0245 end');
    })

    /**
     * @tc.name   testRadioNetState0246
     * @tc.number SUB_RADIO_NETSTATE_0246
     * @tc.desc   nsaState 5 maps to documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0246 begin');
      const result: string = NetworkStateFormatter.formatNsaState(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('dual connected');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(5) !== 6));
      expect(result === 'sa attached' && Number(5) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0246 end');
    })

    /**
     * @tc.name   testRadioNetState0247
     * @tc.number SUB_RADIO_NETSTATE_0247
     * @tc.desc   nsaState 6 maps to documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0247 begin');
      const result: string = NetworkStateFormatter.formatNsaState(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('sa attached'));
      expect(result).assertEqual('sa attached');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(6) !== 6));
      expect(result === 'sa attached' && Number(6) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0247 end');
    })

    /**
     * @tc.name   testRadioNetState0248
     * @tc.number SUB_RADIO_NETSTATE_0248
     * @tc.desc   nsaState 7 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0248 begin');
      const result: string = NetworkStateFormatter.formatNsaState(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(7) !== 6));
      expect(result === 'sa attached' && Number(7) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0248 end');
    })

    /**
     * @tc.name   testRadioNetState0249
     * @tc.number SUB_RADIO_NETSTATE_0249
     * @tc.desc   nsaState 8 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0249 begin');
      const result: string = NetworkStateFormatter.formatNsaState(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(8) !== 6));
      expect(result === 'sa attached' && Number(8) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0249 end');
    })

    /**
     * @tc.name   testRadioNetState0250
     * @tc.number SUB_RADIO_NETSTATE_0250
     * @tc.desc   nsaState 9 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0250 begin');
      const result: string = NetworkStateFormatter.formatNsaState(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(9) !== 6));
      expect(result === 'sa attached' && Number(9) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0250 end');
    })

    /**
     * @tc.name   testRadioNetState0251
     * @tc.number SUB_RADIO_NETSTATE_0251
     * @tc.desc   nsaState 10 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0251 begin');
      const result: string = NetworkStateFormatter.formatNsaState(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(10) !== 6));
      expect(result === 'sa attached' && Number(10) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0251 end');
    })

    /**
     * @tc.name   testRadioNetState0252
     * @tc.number SUB_RADIO_NETSTATE_0252
     * @tc.desc   nsaState 11 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0252 begin');
      const result: string = NetworkStateFormatter.formatNsaState(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(11) !== 6));
      expect(result === 'sa attached' && Number(11) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0252 end');
    })

    /**
     * @tc.name   testRadioNetState0253
     * @tc.number SUB_RADIO_NETSTATE_0253
     * @tc.desc   nsaState 12 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0253 begin');
      const result: string = NetworkStateFormatter.formatNsaState(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(12) !== 6));
      expect(result === 'sa attached' && Number(12) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0253 end');
    })

    /**
     * @tc.name   testRadioNetState0254
     * @tc.number SUB_RADIO_NETSTATE_0254
     * @tc.desc   nsaState 13 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0254 begin');
      const result: string = NetworkStateFormatter.formatNsaState(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(13) !== 6));
      expect(result === 'sa attached' && Number(13) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0254 end');
    })

    /**
     * @tc.name   testRadioNetState0255
     * @tc.number SUB_RADIO_NETSTATE_0255
     * @tc.desc   nsaState 14 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0255 begin');
      const result: string = NetworkStateFormatter.formatNsaState(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(14) !== 6));
      expect(result === 'sa attached' && Number(14) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0255 end');
    })

    /**
     * @tc.name   testRadioNetState0256
     * @tc.number SUB_RADIO_NETSTATE_0256
     * @tc.desc   nsaState 15 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0256 begin');
      const result: string = NetworkStateFormatter.formatNsaState(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(15) !== 6));
      expect(result === 'sa attached' && Number(15) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0256 end');
    })

    /**
     * @tc.name   testRadioNetState0257
     * @tc.number SUB_RADIO_NETSTATE_0257
     * @tc.desc   nsaState 16 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0257 begin');
      const result: string = NetworkStateFormatter.formatNsaState(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(16) !== 6));
      expect(result === 'sa attached' && Number(16) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0257 end');
    })

    /**
     * @tc.name   testRadioNetState0258
     * @tc.number SUB_RADIO_NETSTATE_0258
     * @tc.desc   nsaState 17 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0258 begin');
      const result: string = NetworkStateFormatter.formatNsaState(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(17) !== 6));
      expect(result === 'sa attached' && Number(17) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0258 end');
    })

    /**
     * @tc.name   testRadioNetState0259
     * @tc.number SUB_RADIO_NETSTATE_0259
     * @tc.desc   nsaState 18 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0259 begin');
      const result: string = NetworkStateFormatter.formatNsaState(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(18) !== 6));
      expect(result === 'sa attached' && Number(18) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0259 end');
    })

    /**
     * @tc.name   testRadioNetState0260
     * @tc.number SUB_RADIO_NETSTATE_0260
     * @tc.desc   nsaState 19 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0260 begin');
      const result: string = NetworkStateFormatter.formatNsaState(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(19) !== 6));
      expect(result === 'sa attached' && Number(19) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0260 end');
    })

    /**
     * @tc.name   testRadioNetState0261
     * @tc.number SUB_RADIO_NETSTATE_0261
     * @tc.desc   nsaState 20 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0261 begin');
      const result: string = NetworkStateFormatter.formatNsaState(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(20) !== 6));
      expect(result === 'sa attached' && Number(20) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0261 end');
    })

    /**
     * @tc.name   testRadioNetState0262
     * @tc.number SUB_RADIO_NETSTATE_0262
     * @tc.desc   nsaState 21 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0262 begin');
      const result: string = NetworkStateFormatter.formatNsaState(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(21) !== 6));
      expect(result === 'sa attached' && Number(21) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0262 end');
    })

    /**
     * @tc.name   testRadioNetState0263
     * @tc.number SUB_RADIO_NETSTATE_0263
     * @tc.desc   nsaState 22 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0263 begin');
      const result: string = NetworkStateFormatter.formatNsaState(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(22) !== 6));
      expect(result === 'sa attached' && Number(22) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0263 end');
    })

    /**
     * @tc.name   testRadioNetState0264
     * @tc.number SUB_RADIO_NETSTATE_0264
     * @tc.desc   nsaState 23 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0264 begin');
      const result: string = NetworkStateFormatter.formatNsaState(23);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(23) !== 6));
      expect(result === 'sa attached' && Number(23) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0264 end');
    })

    /**
     * @tc.name   testRadioNetState0265
     * @tc.number SUB_RADIO_NETSTATE_0265
     * @tc.desc   nsaState 24 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0265 begin');
      const result: string = NetworkStateFormatter.formatNsaState(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(24) !== 6));
      expect(result === 'sa attached' && Number(24) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0265 end');
    })

    /**
     * @tc.name   testRadioNetState0266
     * @tc.number SUB_RADIO_NETSTATE_0266
     * @tc.desc   nsaState 25 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0266 begin');
      const result: string = NetworkStateFormatter.formatNsaState(25);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(25) !== 6));
      expect(result === 'sa attached' && Number(25) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0266 end');
    })

    /**
     * @tc.name   testRadioNetState0267
     * @tc.number SUB_RADIO_NETSTATE_0267
     * @tc.desc   nsaState 26 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0267 begin');
      const result: string = NetworkStateFormatter.formatNsaState(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(26) !== 6));
      expect(result === 'sa attached' && Number(26) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0267 end');
    })

    /**
     * @tc.name   testRadioNetState0268
     * @tc.number SUB_RADIO_NETSTATE_0268
     * @tc.desc   nsaState 27 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0268 begin');
      const result: string = NetworkStateFormatter.formatNsaState(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(27) !== 6));
      expect(result === 'sa attached' && Number(27) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0268 end');
    })

    /**
     * @tc.name   testRadioNetState0269
     * @tc.number SUB_RADIO_NETSTATE_0269
     * @tc.desc   nsaState 28 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0269 begin');
      const result: string = NetworkStateFormatter.formatNsaState(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(28) !== 6));
      expect(result === 'sa attached' && Number(28) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0269 end');
    })

    /**
     * @tc.name   testRadioNetState0270
     * @tc.number SUB_RADIO_NETSTATE_0270
     * @tc.desc   nsaState 29 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0270 begin');
      const result: string = NetworkStateFormatter.formatNsaState(29);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(29) !== 6));
      expect(result === 'sa attached' && Number(29) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0270 end');
    })

    /**
     * @tc.name   testRadioNetState0271
     * @tc.number SUB_RADIO_NETSTATE_0271
     * @tc.desc   nsaState 30 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0271 begin');
      const result: string = NetworkStateFormatter.formatNsaState(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(30) !== 6));
      expect(result === 'sa attached' && Number(30) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0271 end');
    })

    /**
     * @tc.name   testRadioNetState0272
     * @tc.number SUB_RADIO_NETSTATE_0272
     * @tc.desc   nsaState 31 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0272 begin');
      const result: string = NetworkStateFormatter.formatNsaState(31);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(31) !== 6));
      expect(result === 'sa attached' && Number(31) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0272 end');
    })

    /**
     * @tc.name   testRadioNetState0273
     * @tc.number SUB_RADIO_NETSTATE_0273
     * @tc.desc   nsaState 32 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0273 begin');
      const result: string = NetworkStateFormatter.formatNsaState(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(32) !== 6));
      expect(result === 'sa attached' && Number(32) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0273 end');
    })

    /**
     * @tc.name   testRadioNetState0274
     * @tc.number SUB_RADIO_NETSTATE_0274
     * @tc.desc   nsaState 33 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0274 begin');
      const result: string = NetworkStateFormatter.formatNsaState(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(33) !== 6));
      expect(result === 'sa attached' && Number(33) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0274 end');
    })

    /**
     * @tc.name   testRadioNetState0275
     * @tc.number SUB_RADIO_NETSTATE_0275
     * @tc.desc   nsaState 34 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0275 begin');
      const result: string = NetworkStateFormatter.formatNsaState(34);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(34) !== 6));
      expect(result === 'sa attached' && Number(34) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0275 end');
    })

    /**
     * @tc.name   testRadioNetState0276
     * @tc.number SUB_RADIO_NETSTATE_0276
     * @tc.desc   nsaState 35 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0276 begin');
      const result: string = NetworkStateFormatter.formatNsaState(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(35) !== 6));
      expect(result === 'sa attached' && Number(35) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0276 end');
    })

    /**
     * @tc.name   testRadioNetState0277
     * @tc.number SUB_RADIO_NETSTATE_0277
     * @tc.desc   nsaState 36 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0277 begin');
      const result: string = NetworkStateFormatter.formatNsaState(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(36) !== 6));
      expect(result === 'sa attached' && Number(36) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0277 end');
    })

    /**
     * @tc.name   testRadioNetState0278
     * @tc.number SUB_RADIO_NETSTATE_0278
     * @tc.desc   nsaState 37 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0278 begin');
      const result: string = NetworkStateFormatter.formatNsaState(37);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(37) !== 6));
      expect(result === 'sa attached' && Number(37) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0278 end');
    })

    /**
     * @tc.name   testRadioNetState0279
     * @tc.number SUB_RADIO_NETSTATE_0279
     * @tc.desc   nsaState 38 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0279 begin');
      const result: string = NetworkStateFormatter.formatNsaState(38);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(38) !== 6));
      expect(result === 'sa attached' && Number(38) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0279 end');
    })

    /**
     * @tc.name   testRadioNetState0280
     * @tc.number SUB_RADIO_NETSTATE_0280
     * @tc.desc   nsaState 39 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0280 begin');
      const result: string = NetworkStateFormatter.formatNsaState(39);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(39) !== 6));
      expect(result === 'sa attached' && Number(39) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0280 end');
    })

    /**
     * @tc.name   testRadioNetState0281
     * @tc.number SUB_RADIO_NETSTATE_0281
     * @tc.desc   nsaState 40 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0281 begin');
      const result: string = NetworkStateFormatter.formatNsaState(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(40) !== 6));
      expect(result === 'sa attached' && Number(40) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0281 end');
    })

    /**
     * @tc.name   testRadioNetState0282
     * @tc.number SUB_RADIO_NETSTATE_0282
     * @tc.desc   nsaState 41 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0282 begin');
      const result: string = NetworkStateFormatter.formatNsaState(41);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(41) !== 6));
      expect(result === 'sa attached' && Number(41) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0282 end');
    })

    /**
     * @tc.name   testRadioNetState0283
     * @tc.number SUB_RADIO_NETSTATE_0283
     * @tc.desc   nsaState 42 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0283 begin');
      const result: string = NetworkStateFormatter.formatNsaState(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(42) !== 6));
      expect(result === 'sa attached' && Number(42) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0283 end');
    })

    /**
     * @tc.name   testRadioNetState0284
     * @tc.number SUB_RADIO_NETSTATE_0284
     * @tc.desc   nsaState 43 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0284 begin');
      const result: string = NetworkStateFormatter.formatNsaState(43);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(43) !== 6));
      expect(result === 'sa attached' && Number(43) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0284 end');
    })

    /**
     * @tc.name   testRadioNetState0285
     * @tc.number SUB_RADIO_NETSTATE_0285
     * @tc.desc   nsaState 44 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0285 begin');
      const result: string = NetworkStateFormatter.formatNsaState(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(44) !== 6));
      expect(result === 'sa attached' && Number(44) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0285 end');
    })

    /**
     * @tc.name   testRadioNetState0286
     * @tc.number SUB_RADIO_NETSTATE_0286
     * @tc.desc   nsaState 45 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0286 begin');
      const result: string = NetworkStateFormatter.formatNsaState(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(45) !== 6));
      expect(result === 'sa attached' && Number(45) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0286 end');
    })

    /**
     * @tc.name   testRadioNetState0287
     * @tc.number SUB_RADIO_NETSTATE_0287
     * @tc.desc   nsaState 46 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0287 begin');
      const result: string = NetworkStateFormatter.formatNsaState(46);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(46) !== 6));
      expect(result === 'sa attached' && Number(46) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0287 end');
    })

    /**
     * @tc.name   testRadioNetState0288
     * @tc.number SUB_RADIO_NETSTATE_0288
     * @tc.desc   nsaState 47 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0288 begin');
      const result: string = NetworkStateFormatter.formatNsaState(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(47) !== 6));
      expect(result === 'sa attached' && Number(47) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0288 end');
    })

    /**
     * @tc.name   testRadioNetState0289
     * @tc.number SUB_RADIO_NETSTATE_0289
     * @tc.desc   nsaState 48 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0289 begin');
      const result: string = NetworkStateFormatter.formatNsaState(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(48) !== 6));
      expect(result === 'sa attached' && Number(48) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0289 end');
    })

    /**
     * @tc.name   testRadioNetState0290
     * @tc.number SUB_RADIO_NETSTATE_0290
     * @tc.desc   nsaState 49 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0290 begin');
      const result: string = NetworkStateFormatter.formatNsaState(49);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(49) !== 6));
      expect(result === 'sa attached' && Number(49) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0290 end');
    })

    /**
     * @tc.name   testRadioNetState0291
     * @tc.number SUB_RADIO_NETSTATE_0291
     * @tc.desc   nsaState 50 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0291 begin');
      const result: string = NetworkStateFormatter.formatNsaState(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(50) !== 6));
      expect(result === 'sa attached' && Number(50) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0291 end');
    })

    /**
     * @tc.name   testRadioNetState0292
     * @tc.number SUB_RADIO_NETSTATE_0292
     * @tc.desc   nsaState 51 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0292 begin');
      const result: string = NetworkStateFormatter.formatNsaState(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(51) !== 6));
      expect(result === 'sa attached' && Number(51) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0292 end');
    })

    /**
     * @tc.name   testRadioNetState0293
     * @tc.number SUB_RADIO_NETSTATE_0293
     * @tc.desc   nsaState 52 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0293 begin');
      const result: string = NetworkStateFormatter.formatNsaState(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(52) !== 6));
      expect(result === 'sa attached' && Number(52) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0293 end');
    })

    /**
     * @tc.name   testRadioNetState0294
     * @tc.number SUB_RADIO_NETSTATE_0294
     * @tc.desc   nsaState 53 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0294 begin');
      const result: string = NetworkStateFormatter.formatNsaState(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(53) !== 6));
      expect(result === 'sa attached' && Number(53) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0294 end');
    })

    /**
     * @tc.name   testRadioNetState0295
     * @tc.number SUB_RADIO_NETSTATE_0295
     * @tc.desc   nsaState 54 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0295 begin');
      const result: string = NetworkStateFormatter.formatNsaState(54);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(54) !== 6));
      expect(result === 'sa attached' && Number(54) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0295 end');
    })

    /**
     * @tc.name   testRadioNetState0296
     * @tc.number SUB_RADIO_NETSTATE_0296
     * @tc.desc   nsaState 55 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0296 begin');
      const result: string = NetworkStateFormatter.formatNsaState(55);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(55) !== 6));
      expect(result === 'sa attached' && Number(55) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0296 end');
    })

    /**
     * @tc.name   testRadioNetState0297
     * @tc.number SUB_RADIO_NETSTATE_0297
     * @tc.desc   nsaState 56 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0297 begin');
      const result: string = NetworkStateFormatter.formatNsaState(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(56) !== 6));
      expect(result === 'sa attached' && Number(56) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0297 end');
    })

    /**
     * @tc.name   testRadioNetState0298
     * @tc.number SUB_RADIO_NETSTATE_0298
     * @tc.desc   nsaState 57 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0298 begin');
      const result: string = NetworkStateFormatter.formatNsaState(57);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(57) !== 6));
      expect(result === 'sa attached' && Number(57) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0298 end');
    })

    /**
     * @tc.name   testRadioNetState0299
     * @tc.number SUB_RADIO_NETSTATE_0299
     * @tc.desc   nsaState 58 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0299 begin');
      const result: string = NetworkStateFormatter.formatNsaState(58);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(58) !== 6));
      expect(result === 'sa attached' && Number(58) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0299 end');
    })

    /**
     * @tc.name   testRadioNetState0300
     * @tc.number SUB_RADIO_NETSTATE_0300
     * @tc.desc   nsaState 59 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0300 begin');
      const result: string = NetworkStateFormatter.formatNsaState(59);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(59) !== 6));
      expect(result === 'sa attached' && Number(59) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0300 end');
    })

    /**
     * @tc.name   testRadioNetState0301
     * @tc.number SUB_RADIO_NETSTATE_0301
     * @tc.desc   nsaState 60 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0301 begin');
      const result: string = NetworkStateFormatter.formatNsaState(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(60) !== 6));
      expect(result === 'sa attached' && Number(60) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0301 end');
    })

    /**
     * @tc.name   testRadioNetState0302
     * @tc.number SUB_RADIO_NETSTATE_0302
     * @tc.desc   nsaState 61 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0302 begin');
      const result: string = NetworkStateFormatter.formatNsaState(61);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(61) !== 6));
      expect(result === 'sa attached' && Number(61) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0302 end');
    })

    /**
     * @tc.name   testRadioNetState0303
     * @tc.number SUB_RADIO_NETSTATE_0303
     * @tc.desc   nsaState 62 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0303 begin');
      const result: string = NetworkStateFormatter.formatNsaState(62);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(62) !== 6));
      expect(result === 'sa attached' && Number(62) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0303 end');
    })

    /**
     * @tc.name   testRadioNetState0304
     * @tc.number SUB_RADIO_NETSTATE_0304
     * @tc.desc   nsaState 63 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0304 begin');
      const result: string = NetworkStateFormatter.formatNsaState(63);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(63) !== 6));
      expect(result === 'sa attached' && Number(63) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0304 end');
    })

    /**
     * @tc.name   testRadioNetState0305
     * @tc.number SUB_RADIO_NETSTATE_0305
     * @tc.desc   nsaState 64 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0305 begin');
      const result: string = NetworkStateFormatter.formatNsaState(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(64) !== 6));
      expect(result === 'sa attached' && Number(64) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0305 end');
    })

    /**
     * @tc.name   testRadioNetState0306
     * @tc.number SUB_RADIO_NETSTATE_0306
     * @tc.desc   nsaState 65 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0306 begin');
      const result: string = NetworkStateFormatter.formatNsaState(65);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(65) !== 6));
      expect(result === 'sa attached' && Number(65) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0306 end');
    })

    /**
     * @tc.name   testRadioNetState0307
     * @tc.number SUB_RADIO_NETSTATE_0307
     * @tc.desc   nsaState 66 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0307 begin');
      const result: string = NetworkStateFormatter.formatNsaState(66);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(66) !== 6));
      expect(result === 'sa attached' && Number(66) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0307 end');
    })

    /**
     * @tc.name   testRadioNetState0308
     * @tc.number SUB_RADIO_NETSTATE_0308
     * @tc.desc   nsaState 67 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0308 begin');
      const result: string = NetworkStateFormatter.formatNsaState(67);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(67) !== 6));
      expect(result === 'sa attached' && Number(67) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0308 end');
    })

    /**
     * @tc.name   testRadioNetState0309
     * @tc.number SUB_RADIO_NETSTATE_0309
     * @tc.desc   nsaState 68 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0309 begin');
      const result: string = NetworkStateFormatter.formatNsaState(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(68) !== 6));
      expect(result === 'sa attached' && Number(68) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0309 end');
    })

    /**
     * @tc.name   testRadioNetState0310
     * @tc.number SUB_RADIO_NETSTATE_0310
     * @tc.desc   nsaState 69 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0310 begin');
      const result: string = NetworkStateFormatter.formatNsaState(69);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(69) !== 6));
      expect(result === 'sa attached' && Number(69) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0310 end');
    })

    /**
     * @tc.name   testRadioNetState0311
     * @tc.number SUB_RADIO_NETSTATE_0311
     * @tc.desc   nsaState 70 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0311 begin');
      const result: string = NetworkStateFormatter.formatNsaState(70);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(70) !== 6));
      expect(result === 'sa attached' && Number(70) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0311 end');
    })

    /**
     * @tc.name   testRadioNetState0312
     * @tc.number SUB_RADIO_NETSTATE_0312
     * @tc.desc   nsaState -1 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0312 begin');
      const result: string = NetworkStateFormatter.formatNsaState(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(-1) !== 6));
      expect(result === 'sa attached' && Number(-1) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0312 end');
    })

    /**
     * @tc.name   testRadioNetState0313
     * @tc.number SUB_RADIO_NETSTATE_0313
     * @tc.desc   nsaState -3 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0313 begin');
      const result: string = NetworkStateFormatter.formatNsaState(-3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(-3) !== 6));
      expect(result === 'sa attached' && Number(-3) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0313 end');
    })

    /**
     * @tc.name   testRadioNetState0314
     * @tc.number SUB_RADIO_NETSTATE_0314
     * @tc.desc   nsaState -9 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0314', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0314 begin');
      const result: string = NetworkStateFormatter.formatNsaState(-9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(-9) !== 6));
      expect(result === 'sa attached' && Number(-9) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0314 end');
    })

    /**
     * @tc.name   testRadioNetState0315
     * @tc.number SUB_RADIO_NETSTATE_0315
     * @tc.desc   nsaState -30 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0315', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0315 begin');
      const result: string = NetworkStateFormatter.formatNsaState(-30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(-30) !== 6));
      expect(result === 'sa attached' && Number(-30) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0315 end');
    })

    /**
     * @tc.name   testRadioNetState0316
     * @tc.number SUB_RADIO_NETSTATE_0316
     * @tc.desc   nsaState 0.5 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0316', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0316 begin');
      const result: string = NetworkStateFormatter.formatNsaState(0.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(0.5) !== 6));
      expect(result === 'sa attached' && Number(0.5) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0316 end');
    })

    /**
     * @tc.name   testRadioNetState0317
     * @tc.number SUB_RADIO_NETSTATE_0317
     * @tc.desc   nsaState 1.5 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0317', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0317 begin');
      const result: string = NetworkStateFormatter.formatNsaState(1.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(1.5) !== 6));
      expect(result === 'sa attached' && Number(1.5) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0317 end');
    })

    /**
     * @tc.name   testRadioNetState0318
     * @tc.number SUB_RADIO_NETSTATE_0318
     * @tc.desc   nsaState 2.5 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0318', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0318 begin');
      const result: string = NetworkStateFormatter.formatNsaState(2.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(2.5) !== 6));
      expect(result === 'sa attached' && Number(2.5) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0318 end');
    })

    /**
     * @tc.name   testRadioNetState0319
     * @tc.number SUB_RADIO_NETSTATE_0319
     * @tc.desc   nsaState 5.5 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0319', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0319 begin');
      const result: string = NetworkStateFormatter.formatNsaState(5.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'unknown' || result.length > 0));
      expect(result === 'unknown' || result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'sa attached' && Number(5.5) !== 6));
      expect(result === 'sa attached' && Number(5.5) !== 6).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0319 end');
    })

    /**
     * @tc.name   testRadioNetState0320
     * @tc.number SUB_RADIO_NETSTATE_0320
     * @tc.desc   SA 驻网状态映射到固定名称
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0320 begin');
      const anchorResult: string = NetworkStateFormatter.formatNsaState(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(anchorResult));
      expect(anchorResult).assertEqual('sa attached');
      expect(anchorResult.length).assertEqual(11);
      expect(anchorResult.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0320 end');
    })
  })
}
