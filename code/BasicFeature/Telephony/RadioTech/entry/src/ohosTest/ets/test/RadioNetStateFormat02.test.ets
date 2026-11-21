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

export default function radioNetStateFormat02Test() {
  describe('RadioNetStateFormat02Test', () => {

    /**
     * @tc.name   testRadioNetState0401
     * @tc.number SUB_RADIO_NETSTATE_0401
     * @tc.desc   network state combination #80 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0401 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
        plmnNumeric: '',
        isRoaming: false,
        regState: 3,
        nsaState: 2,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:power off');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:no detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0401 end');
    })

    /**
     * @tc.name   testRadioNetState0402
     * @tc.number SUB_RADIO_NETSTATE_0402
     * @tc.desc   network state combination #81 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0402 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '46000',
        isRoaming: true,
        regState: 0,
        nsaState: 3,
        isCaActive: false,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:no service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:connected detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0402 end');
    })

    /**
     * @tc.name   testRadioNetState0403
     * @tc.number SUB_RADIO_NETSTATE_0403
     * @tc.desc   network state combination #82 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0403 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '46001',
        isRoaming: false,
        regState: 1,
        nsaState: 4,
        isCaActive: true,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:in service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:idle detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0403 end');
    })

    /**
     * @tc.name   testRadioNetState0404
     * @tc.number SUB_RADIO_NETSTATE_0404
     * @tc.desc   network state combination #83 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0404', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0404 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
        plmnNumeric: '310260',
        isRoaming: true,
        regState: 2,
        nsaState: 5,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:dual connected');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0404 end');
    })

    /**
     * @tc.name   testRadioNetState0405
     * @tc.number SUB_RADIO_NETSTATE_0405
     * @tc.desc   network state combination #84 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0405 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '1234',
        isRoaming: false,
        regState: 3,
        nsaState: 6,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:power off');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:sa attached');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0405 end');
    })

    /**
     * @tc.name   testRadioNetState0406
     * @tc.number SUB_RADIO_NETSTATE_0406
     * @tc.desc   network state combination #85 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0406', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0406 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '',
        isRoaming: true,
        regState: 0,
        nsaState: 0,
        isCaActive: true,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:no service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0406 end');
    })

    /**
     * @tc.name   testRadioNetState0407
     * @tc.number SUB_RADIO_NETSTATE_0407
     * @tc.desc   network state combination #86 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0407', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0407 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
        plmnNumeric: '46000',
        isRoaming: false,
        regState: 1,
        nsaState: 1,
        isCaActive: false,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:in service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:not support');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0407 end');
    })

    /**
     * @tc.name   testRadioNetState0408
     * @tc.number SUB_RADIO_NETSTATE_0408
     * @tc.desc   network state combination #87 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0408', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0408 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '46001',
        isRoaming: true,
        regState: 2,
        nsaState: 2,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:no detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0408 end');
    })

    /**
     * @tc.name   testRadioNetState0409
     * @tc.number SUB_RADIO_NETSTATE_0409
     * @tc.desc   network state combination #88 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0409', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0409 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '310260',
        isRoaming: false,
        regState: 3,
        nsaState: 3,
        isCaActive: true,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:power off');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:connected detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0409 end');
    })

    /**
     * @tc.name   testRadioNetState0410
     * @tc.number SUB_RADIO_NETSTATE_0410
     * @tc.desc   network state combination #89 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0410 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
        plmnNumeric: '1234',
        isRoaming: true,
        regState: 0,
        nsaState: 4,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:no service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:idle detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0410 end');
    })

    /**
     * @tc.name   testRadioNetState0411
     * @tc.number SUB_RADIO_NETSTATE_0411
     * @tc.desc   network state combination #90 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0411', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0411 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '',
        isRoaming: false,
        regState: 1,
        nsaState: 5,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:in service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:dual connected');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0411 end');
    })

    /**
     * @tc.name   testRadioNetState0412
     * @tc.number SUB_RADIO_NETSTATE_0412
     * @tc.desc   network state combination #91 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0412', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0412 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '46000',
        isRoaming: true,
        regState: 2,
        nsaState: 6,
        isCaActive: true,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:sa attached');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0412 end');
    })

    /**
     * @tc.name   testRadioNetState0413
     * @tc.number SUB_RADIO_NETSTATE_0413
     * @tc.desc   network state combination #92 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0413', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0413 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
        plmnNumeric: '46001',
        isRoaming: false,
        regState: 3,
        nsaState: 0,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:power off');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0413 end');
    })

    /**
     * @tc.name   testRadioNetState0414
     * @tc.number SUB_RADIO_NETSTATE_0414
     * @tc.desc   network state combination #93 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0414', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0414 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '310260',
        isRoaming: true,
        regState: 0,
        nsaState: 1,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:no service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:not support');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0414 end');
    })

    /**
     * @tc.name   testRadioNetState0415
     * @tc.number SUB_RADIO_NETSTATE_0415
     * @tc.desc   network state combination #94 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0415', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0415 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '1234',
        isRoaming: false,
        regState: 1,
        nsaState: 2,
        isCaActive: true,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:in service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:no detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0415 end');
    })

    /**
     * @tc.name   testRadioNetState0416
     * @tc.number SUB_RADIO_NETSTATE_0416
     * @tc.desc   network state combination #95 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0416', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0416 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
        plmnNumeric: '',
        isRoaming: true,
        regState: 2,
        nsaState: 3,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:connected detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0416 end');
    })

    /**
     * @tc.name   testRadioNetState0417
     * @tc.number SUB_RADIO_NETSTATE_0417
     * @tc.desc   network state combination #96 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0417', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0417 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '46000',
        isRoaming: false,
        regState: 3,
        nsaState: 4,
        isCaActive: false,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:power off');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:idle detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0417 end');
    })

    /**
     * @tc.name   testRadioNetState0418
     * @tc.number SUB_RADIO_NETSTATE_0418
     * @tc.desc   network state combination #97 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0418', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0418 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '46001',
        isRoaming: true,
        regState: 0,
        nsaState: 5,
        isCaActive: true,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:no service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:dual connected');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0418 end');
    })

    /**
     * @tc.name   testRadioNetState0419
     * @tc.number SUB_RADIO_NETSTATE_0419
     * @tc.desc   network state combination #98 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0419', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0419 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
        plmnNumeric: '310260',
        isRoaming: false,
        regState: 1,
        nsaState: 6,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:in service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:sa attached');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0419 end');
    })

    /**
     * @tc.name   testRadioNetState0420
     * @tc.number SUB_RADIO_NETSTATE_0420
     * @tc.desc   network state combination #99 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0420 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '1234',
        isRoaming: true,
        regState: 2,
        nsaState: 0,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0420 end');
    })

    /**
     * @tc.name   testRadioNetState0421
     * @tc.number SUB_RADIO_NETSTATE_0421
     * @tc.desc   network state combination #100 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0421', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0421 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '',
        isRoaming: false,
        regState: 3,
        nsaState: 1,
        isCaActive: true,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:power off');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:not support');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0421 end');
    })

    /**
     * @tc.name   testRadioNetState0422
     * @tc.number SUB_RADIO_NETSTATE_0422
     * @tc.desc   network state combination #101 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0422', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0422 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
        plmnNumeric: '46000',
        isRoaming: true,
        regState: 0,
        nsaState: 2,
        isCaActive: false,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:no service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:no detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0422 end');
    })

    /**
     * @tc.name   testRadioNetState0423
     * @tc.number SUB_RADIO_NETSTATE_0423
     * @tc.desc   network state combination #102 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0423', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0423 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '46001',
        isRoaming: false,
        regState: 1,
        nsaState: 3,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:in service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:connected detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0423 end');
    })

    /**
     * @tc.name   testRadioNetState0424
     * @tc.number SUB_RADIO_NETSTATE_0424
     * @tc.desc   network state combination #103 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0424', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0424 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '310260',
        isRoaming: true,
        regState: 2,
        nsaState: 4,
        isCaActive: true,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:idle detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0424 end');
    })

    /**
     * @tc.name   testRadioNetState0425
     * @tc.number SUB_RADIO_NETSTATE_0425
     * @tc.desc   network state combination #104 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0425', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0425 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
        plmnNumeric: '1234',
        isRoaming: false,
        regState: 3,
        nsaState: 5,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:power off');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:dual connected');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0425 end');
    })

    /**
     * @tc.name   testRadioNetState0426
     * @tc.number SUB_RADIO_NETSTATE_0426
     * @tc.desc   network state combination #105 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0426', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0426 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '',
        isRoaming: true,
        regState: 0,
        nsaState: 6,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:no service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:sa attached');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0426 end');
    })

    /**
     * @tc.name   testRadioNetState0427
     * @tc.number SUB_RADIO_NETSTATE_0427
     * @tc.desc   network state combination #106 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0427', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0427 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '46000',
        isRoaming: false,
        regState: 1,
        nsaState: 0,
        isCaActive: true,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:in service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0427 end');
    })

    /**
     * @tc.name   testRadioNetState0428
     * @tc.number SUB_RADIO_NETSTATE_0428
     * @tc.desc   network state combination #107 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0428', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0428 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
        plmnNumeric: '46001',
        isRoaming: true,
        regState: 2,
        nsaState: 1,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:not support');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0428 end');
    })

    /**
     * @tc.name   testRadioNetState0429
     * @tc.number SUB_RADIO_NETSTATE_0429
     * @tc.desc   network state combination #108 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0429', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0429 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '310260',
        isRoaming: false,
        regState: 3,
        nsaState: 2,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:power off');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:no detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0429 end');
    })

    /**
     * @tc.name   testRadioNetState0430
     * @tc.number SUB_RADIO_NETSTATE_0430
     * @tc.desc   network state combination #109 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0430 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '1234',
        isRoaming: true,
        regState: 0,
        nsaState: 3,
        isCaActive: true,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:no service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:connected detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0430 end');
    })

    /**
     * @tc.name   testRadioNetState0431
     * @tc.number SUB_RADIO_NETSTATE_0431
     * @tc.desc   network state combination #110 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0431', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0431 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
        plmnNumeric: '',
        isRoaming: false,
        regState: 1,
        nsaState: 4,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:in service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:idle detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0431 end');
    })

    /**
     * @tc.name   testRadioNetState0432
     * @tc.number SUB_RADIO_NETSTATE_0432
     * @tc.desc   network state combination #111 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0432', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0432 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '46000',
        isRoaming: true,
        regState: 2,
        nsaState: 5,
        isCaActive: false,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:dual connected');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0432 end');
    })

    /**
     * @tc.name   testRadioNetState0433
     * @tc.number SUB_RADIO_NETSTATE_0433
     * @tc.desc   network state combination #112 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0433', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0433 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '46001',
        isRoaming: false,
        regState: 3,
        nsaState: 6,
        isCaActive: true,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:power off');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:sa attached');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0433 end');
    })

    /**
     * @tc.name   testRadioNetState0434
     * @tc.number SUB_RADIO_NETSTATE_0434
     * @tc.desc   network state combination #113 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0434', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0434 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
        plmnNumeric: '310260',
        isRoaming: true,
        regState: 0,
        nsaState: 0,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:no service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0434 end');
    })

    /**
     * @tc.name   testRadioNetState0435
     * @tc.number SUB_RADIO_NETSTATE_0435
     * @tc.desc   network state combination #114 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0435', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0435 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '1234',
        isRoaming: false,
        regState: 1,
        nsaState: 1,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:in service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:not support');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0435 end');
    })

    /**
     * @tc.name   testRadioNetState0436
     * @tc.number SUB_RADIO_NETSTATE_0436
     * @tc.desc   network state combination #115 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0436', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0436 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '',
        isRoaming: true,
        regState: 2,
        nsaState: 2,
        isCaActive: true,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:no detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0436 end');
    })

    /**
     * @tc.name   testRadioNetState0437
     * @tc.number SUB_RADIO_NETSTATE_0437
     * @tc.desc   network state combination #116 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0437', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0437 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
        plmnNumeric: '46000',
        isRoaming: false,
        regState: 3,
        nsaState: 3,
        isCaActive: false,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:power off');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:connected detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0437 end');
    })

    /**
     * @tc.name   testRadioNetState0438
     * @tc.number SUB_RADIO_NETSTATE_0438
     * @tc.desc   network state combination #117 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0438', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0438 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '46001',
        isRoaming: true,
        regState: 0,
        nsaState: 4,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:no service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:idle detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0438 end');
    })

    /**
     * @tc.name   testRadioNetState0439
     * @tc.number SUB_RADIO_NETSTATE_0439
     * @tc.desc   network state combination #118 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0439', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0439 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '310260',
        isRoaming: false,
        regState: 1,
        nsaState: 5,
        isCaActive: true,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:in service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:dual connected');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0439 end');
    })

    /**
     * @tc.name   testRadioNetState0440
     * @tc.number SUB_RADIO_NETSTATE_0440
     * @tc.desc   network state combination #119 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0440 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
        plmnNumeric: '1234',
        isRoaming: true,
        regState: 2,
        nsaState: 6,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:sa attached');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0440 end');
    })

    /**
     * @tc.name   testRadioNetState0441
     * @tc.number SUB_RADIO_NETSTATE_0441
     * @tc.desc   network state combination #120 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0441', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0441 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '',
        isRoaming: false,
        regState: 3,
        nsaState: 0,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:power off');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0441 end');
    })

    /**
     * @tc.name   testRadioNetState0442
     * @tc.number SUB_RADIO_NETSTATE_0442
     * @tc.desc   network state combination #121 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0442', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0442 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '46000',
        isRoaming: true,
        regState: 0,
        nsaState: 1,
        isCaActive: true,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:no service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:not support');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0442 end');
    })

    /**
     * @tc.name   testRadioNetState0443
     * @tc.number SUB_RADIO_NETSTATE_0443
     * @tc.desc   network state combination #122 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0443', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0443 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
        plmnNumeric: '46001',
        isRoaming: false,
        regState: 1,
        nsaState: 2,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:in service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:no detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0443 end');
    })

    /**
     * @tc.name   testRadioNetState0444
     * @tc.number SUB_RADIO_NETSTATE_0444
     * @tc.desc   network state combination #123 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0444', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0444 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '310260',
        isRoaming: true,
        regState: 2,
        nsaState: 3,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:connected detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0444 end');
    })

    /**
     * @tc.name   testRadioNetState0445
     * @tc.number SUB_RADIO_NETSTATE_0445
     * @tc.desc   network state combination #124 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0445', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0445 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '1234',
        isRoaming: false,
        regState: 3,
        nsaState: 4,
        isCaActive: true,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:power off');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:idle detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0445 end');
    })

    /**
     * @tc.name   testRadioNetState0446
     * @tc.number SUB_RADIO_NETSTATE_0446
     * @tc.desc   network state combination #125 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0446', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0446 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
        plmnNumeric: '',
        isRoaming: true,
        regState: 0,
        nsaState: 5,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:no service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:dual connected');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0446 end');
    })

    /**
     * @tc.name   testRadioNetState0447
     * @tc.number SUB_RADIO_NETSTATE_0447
     * @tc.desc   network state combination #126 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0447', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0447 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '46000',
        isRoaming: false,
        regState: 1,
        nsaState: 6,
        isCaActive: false,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:in service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:sa attached');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0447 end');
    })

    /**
     * @tc.name   testRadioNetState0448
     * @tc.number SUB_RADIO_NETSTATE_0448
     * @tc.desc   network state combination #127 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0448', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0448 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '46001',
        isRoaming: true,
        regState: 2,
        nsaState: 0,
        isCaActive: true,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0448 end');
    })

    /**
     * @tc.name   testRadioNetState0449
     * @tc.number SUB_RADIO_NETSTATE_0449
     * @tc.desc   network state combination #128 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0449', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0449 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
        plmnNumeric: '310260',
        isRoaming: false,
        regState: 3,
        nsaState: 1,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:power off');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:not support');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0449 end');
    })

    /**
     * @tc.name   testRadioNetState0450
     * @tc.number SUB_RADIO_NETSTATE_0450
     * @tc.desc   network state combination #129 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0450 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '1234',
        isRoaming: true,
        regState: 0,
        nsaState: 2,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:no service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:no detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0450 end');
    })

    /**
     * @tc.name   testRadioNetState0451
     * @tc.number SUB_RADIO_NETSTATE_0451
     * @tc.desc   network state combination #130 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0451', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0451 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '',
        isRoaming: false,
        regState: 1,
        nsaState: 3,
        isCaActive: true,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:in service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:connected detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0451 end');
    })

    /**
     * @tc.name   testRadioNetState0452
     * @tc.number SUB_RADIO_NETSTATE_0452
     * @tc.desc   network state combination #131 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0452', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0452 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
        plmnNumeric: '46000',
        isRoaming: true,
        regState: 2,
        nsaState: 4,
        isCaActive: false,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:idle detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0452 end');
    })

    /**
     * @tc.name   testRadioNetState0453
     * @tc.number SUB_RADIO_NETSTATE_0453
     * @tc.desc   network state combination #132 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0453', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0453 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '46001',
        isRoaming: false,
        regState: 3,
        nsaState: 5,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:power off');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:dual connected');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0453 end');
    })

    /**
     * @tc.name   testRadioNetState0454
     * @tc.number SUB_RADIO_NETSTATE_0454
     * @tc.desc   network state combination #133 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0454', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0454 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '310260',
        isRoaming: true,
        regState: 0,
        nsaState: 6,
        isCaActive: true,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:no service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:sa attached');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0454 end');
    })

    /**
     * @tc.name   testRadioNetState0455
     * @tc.number SUB_RADIO_NETSTATE_0455
     * @tc.desc   network state combination #134 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0455', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0455 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
        plmnNumeric: '1234',
        isRoaming: false,
        regState: 1,
        nsaState: 0,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:in service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0455 end');
    })

    /**
     * @tc.name   testRadioNetState0456
     * @tc.number SUB_RADIO_NETSTATE_0456
     * @tc.desc   network state combination #135 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0456', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0456 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '',
        isRoaming: true,
        regState: 2,
        nsaState: 1,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:not support');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0456 end');
    })

    /**
     * @tc.name   testRadioNetState0457
     * @tc.number SUB_RADIO_NETSTATE_0457
     * @tc.desc   network state combination #136 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0457', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0457 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '46000',
        isRoaming: false,
        regState: 3,
        nsaState: 2,
        isCaActive: true,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:power off');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:no detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0457 end');
    })

    /**
     * @tc.name   testRadioNetState0458
     * @tc.number SUB_RADIO_NETSTATE_0458
     * @tc.desc   network state combination #137 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0458', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0458 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
        plmnNumeric: '46001',
        isRoaming: true,
        regState: 0,
        nsaState: 3,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:no service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:connected detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0458 end');
    })

    /**
     * @tc.name   testRadioNetState0459
     * @tc.number SUB_RADIO_NETSTATE_0459
     * @tc.desc   network state combination #138 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0459', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0459 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '310260',
        isRoaming: false,
        regState: 1,
        nsaState: 4,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:in service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:idle detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0459 end');
    })

    /**
     * @tc.name   testRadioNetState0460
     * @tc.number SUB_RADIO_NETSTATE_0460
     * @tc.desc   network state combination #139 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0460 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '1234',
        isRoaming: true,
        regState: 2,
        nsaState: 5,
        isCaActive: true,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:dual connected');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0460 end');
    })

    /**
     * @tc.name   testRadioNetState0461
     * @tc.number SUB_RADIO_NETSTATE_0461
     * @tc.desc   network state combination #140 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0461', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0461 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
        plmnNumeric: '',
        isRoaming: false,
        regState: 3,
        nsaState: 6,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:power off');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:sa attached');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0461 end');
    })

    /**
     * @tc.name   testRadioNetState0462
     * @tc.number SUB_RADIO_NETSTATE_0462
     * @tc.desc   network state combination #141 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0462', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0462 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '46000',
        isRoaming: true,
        regState: 0,
        nsaState: 0,
        isCaActive: false,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:no service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0462 end');
    })

    /**
     * @tc.name   testRadioNetState0463
     * @tc.number SUB_RADIO_NETSTATE_0463
     * @tc.desc   network state combination #142 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0463', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0463 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '46001',
        isRoaming: false,
        regState: 1,
        nsaState: 1,
        isCaActive: true,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:in service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:not support');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0463 end');
    })

    /**
     * @tc.name   testRadioNetState0464
     * @tc.number SUB_RADIO_NETSTATE_0464
     * @tc.desc   network state combination #143 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0464', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0464 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
        plmnNumeric: '310260',
        isRoaming: true,
        regState: 2,
        nsaState: 2,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:no detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0464 end');
    })

    /**
     * @tc.name   testRadioNetState0465
     * @tc.number SUB_RADIO_NETSTATE_0465
     * @tc.desc   network state combination #144 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0465', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0465 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '1234',
        isRoaming: false,
        regState: 3,
        nsaState: 3,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:power off');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:connected detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0465 end');
    })

    /**
     * @tc.name   testRadioNetState0466
     * @tc.number SUB_RADIO_NETSTATE_0466
     * @tc.desc   network state combination #145 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0466', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0466 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '',
        isRoaming: true,
        regState: 0,
        nsaState: 4,
        isCaActive: true,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:no service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:idle detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0466 end');
    })

    /**
     * @tc.name   testRadioNetState0467
     * @tc.number SUB_RADIO_NETSTATE_0467
     * @tc.desc   network state combination #146 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0467', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0467 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
        plmnNumeric: '46000',
        isRoaming: false,
        regState: 1,
        nsaState: 5,
        isCaActive: false,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:in service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:dual connected');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0467 end');
    })

    /**
     * @tc.name   testRadioNetState0468
     * @tc.number SUB_RADIO_NETSTATE_0468
     * @tc.desc   network state combination #147 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0468', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0468 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '46001',
        isRoaming: true,
        regState: 2,
        nsaState: 6,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:sa attached');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0468 end');
    })

    /**
     * @tc.name   testRadioNetState0469
     * @tc.number SUB_RADIO_NETSTATE_0469
     * @tc.desc   network state combination #148 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0469', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0469 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '310260',
        isRoaming: false,
        regState: 3,
        nsaState: 0,
        isCaActive: true,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:power off');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0469 end');
    })

    /**
     * @tc.name   testRadioNetState0470
     * @tc.number SUB_RADIO_NETSTATE_0470
     * @tc.desc   network state combination #149 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0470 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
        plmnNumeric: '1234',
        isRoaming: true,
        regState: 0,
        nsaState: 1,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:no service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:not support');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0470 end');
    })

    /**
     * @tc.name   testRadioNetState0471
     * @tc.number SUB_RADIO_NETSTATE_0471
     * @tc.desc   network state combination #150 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0471', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0471 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '',
        isRoaming: false,
        regState: 1,
        nsaState: 2,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:in service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:no detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0471 end');
    })

    /**
     * @tc.name   testRadioNetState0472
     * @tc.number SUB_RADIO_NETSTATE_0472
     * @tc.desc   network state combination #151 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0472', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0472 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '46000',
        isRoaming: true,
        regState: 2,
        nsaState: 3,
        isCaActive: true,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:connected detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0472 end');
    })

    /**
     * @tc.name   testRadioNetState0473
     * @tc.number SUB_RADIO_NETSTATE_0473
     * @tc.desc   network state combination #152 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0473', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0473 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
        plmnNumeric: '46001',
        isRoaming: false,
        regState: 3,
        nsaState: 4,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:power off');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:idle detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0473 end');
    })

    /**
     * @tc.name   testRadioNetState0474
     * @tc.number SUB_RADIO_NETSTATE_0474
     * @tc.desc   network state combination #153 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0474', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0474 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '310260',
        isRoaming: true,
        regState: 0,
        nsaState: 5,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:no service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:dual connected');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0474 end');
    })

    /**
     * @tc.name   testRadioNetState0475
     * @tc.number SUB_RADIO_NETSTATE_0475
     * @tc.desc   network state combination #154 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0475', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0475 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '1234',
        isRoaming: false,
        regState: 1,
        nsaState: 6,
        isCaActive: true,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:in service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:sa attached');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0475 end');
    })

    /**
     * @tc.name   testRadioNetState0476
     * @tc.number SUB_RADIO_NETSTATE_0476
     * @tc.desc   network state combination #155 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0476', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0476 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
        plmnNumeric: '',
        isRoaming: true,
        regState: 2,
        nsaState: 0,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0476 end');
    })

    /**
     * @tc.name   testRadioNetState0477
     * @tc.number SUB_RADIO_NETSTATE_0477
     * @tc.desc   network state combination #156 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0477', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0477 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '46000',
        isRoaming: false,
        regState: 3,
        nsaState: 1,
        isCaActive: false,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:power off');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:not support');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0477 end');
    })

    /**
     * @tc.name   testRadioNetState0478
     * @tc.number SUB_RADIO_NETSTATE_0478
     * @tc.desc   network state combination #157 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0478', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0478 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '46001',
        isRoaming: true,
        regState: 0,
        nsaState: 2,
        isCaActive: true,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:no service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:no detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0478 end');
    })

    /**
     * @tc.name   testRadioNetState0479
     * @tc.number SUB_RADIO_NETSTATE_0479
     * @tc.desc   network state combination #158 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0479', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0479 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
        plmnNumeric: '310260',
        isRoaming: false,
        regState: 1,
        nsaState: 3,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:in service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:connected detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0479 end');
    })

    /**
     * @tc.name   testRadioNetState0480
     * @tc.number SUB_RADIO_NETSTATE_0480
     * @tc.desc   注册态完整快照输出 8 行且字段顺序固定
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0480 begin');
      const anchorResult: string =
        NetworkStateFormatter.format(
          {
            longOperatorName: 'China Mobile',
            shortOperatorName: 'CMCC',
            plmnNumeric: '46000',
            isRoaming: false,
            regState: 1,
            nsaState: 3,
            isCaActive: true,
            isEmergency: false
          });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(anchorResult));
      expect(anchorResult)
        .assertEqual(
          'longOperatorName:China Mobile\nshortOperatorName:CMCC\nplmnNumeric:46000\nisRoaming:false\nregState:in s' +
          'ervice\nnsaState:connected detect\nisCaActive:true\nisEmergency:false');
      expect(anchorResult.split('\n').length).assertEqual(8);
      expect(anchorResult.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0480 end');
    })
  })
}
