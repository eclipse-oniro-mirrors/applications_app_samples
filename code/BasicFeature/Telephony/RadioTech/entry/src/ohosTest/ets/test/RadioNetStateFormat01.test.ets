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

export default function radioNetStateFormat01Test() {
  describe('RadioNetStateFormat01Test', () => {

    /**
     * @tc.name   testRadioNetState0321
     * @tc.number SUB_RADIO_NETSTATE_0321
     * @tc.desc   network state combination #1 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0321', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0321 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '46000',
        isRoaming: true,
        regState: 0,
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
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:no service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0321 end');
    })

    /**
     * @tc.name   testRadioNetState0322
     * @tc.number SUB_RADIO_NETSTATE_0322
     * @tc.desc   network state combination #2 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0322', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0322 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
        plmnNumeric: '46001',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0322 end');
    })

    /**
     * @tc.name   testRadioNetState0323
     * @tc.number SUB_RADIO_NETSTATE_0323
     * @tc.desc   network state combination #3 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0323', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0323 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0323 end');
    })

    /**
     * @tc.name   testRadioNetState0324
     * @tc.number SUB_RADIO_NETSTATE_0324
     * @tc.desc   network state combination #4 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0324', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0324 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '1234',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0324 end');
    })

    /**
     * @tc.name   testRadioNetState0325
     * @tc.number SUB_RADIO_NETSTATE_0325
     * @tc.desc   network state combination #5 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0325', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0325 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
        plmnNumeric: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0325 end');
    })

    /**
     * @tc.name   testRadioNetState0326
     * @tc.number SUB_RADIO_NETSTATE_0326
     * @tc.desc   network state combination #6 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0326', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0326 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0326 end');
    })

    /**
     * @tc.name   testRadioNetState0327
     * @tc.number SUB_RADIO_NETSTATE_0327
     * @tc.desc   network state combination #7 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0327', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0327 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '46001',
        isRoaming: true,
        regState: 2,
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
      expect(result.split('\n')[4]).assertEqual('regState:emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:sa attached');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0327 end');
    })

    /**
     * @tc.name   testRadioNetState0328
     * @tc.number SUB_RADIO_NETSTATE_0328
     * @tc.desc   network state combination #8 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0328', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0328 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
        plmnNumeric: '310260',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0328 end');
    })

    /**
     * @tc.name   testRadioNetState0329
     * @tc.number SUB_RADIO_NETSTATE_0329
     * @tc.desc   network state combination #9 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0329', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0329 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0329 end');
    })

    /**
     * @tc.name   testRadioNetState0330
     * @tc.number SUB_RADIO_NETSTATE_0330
     * @tc.desc   network state combination #10 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0330 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0330 end');
    })

    /**
     * @tc.name   testRadioNetState0331
     * @tc.number SUB_RADIO_NETSTATE_0331
     * @tc.desc   network state combination #11 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0331', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0331 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
        plmnNumeric: '46000',
        isRoaming: true,
        regState: 2,
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
      expect(result.split('\n')[4]).assertEqual('regState:emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:connected detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0331 end');
    })

    /**
     * @tc.name   testRadioNetState0332
     * @tc.number SUB_RADIO_NETSTATE_0332
     * @tc.desc   network state combination #12 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0332', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0332 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0332 end');
    })

    /**
     * @tc.name   testRadioNetState0333
     * @tc.number SUB_RADIO_NETSTATE_0333
     * @tc.desc   network state combination #13 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0333', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0333 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '310260',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0333 end');
    })

    /**
     * @tc.name   testRadioNetState0334
     * @tc.number SUB_RADIO_NETSTATE_0334
     * @tc.desc   network state combination #14 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0334', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0334 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
        plmnNumeric: '1234',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0334 end');
    })

    /**
     * @tc.name   testRadioNetState0335
     * @tc.number SUB_RADIO_NETSTATE_0335
     * @tc.desc   network state combination #15 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0335', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0335 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0335 end');
    })

    /**
     * @tc.name   testRadioNetState0336
     * @tc.number SUB_RADIO_NETSTATE_0336
     * @tc.desc   network state combination #16 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0336', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0336 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '46000',
        isRoaming: false,
        regState: 3,
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
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:power off');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:not support');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0336 end');
    })

    /**
     * @tc.name   testRadioNetState0337
     * @tc.number SUB_RADIO_NETSTATE_0337
     * @tc.desc   network state combination #17 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0337', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0337 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
        plmnNumeric: '46001',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0337 end');
    })

    /**
     * @tc.name   testRadioNetState0338
     * @tc.number SUB_RADIO_NETSTATE_0338
     * @tc.desc   network state combination #18 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0338', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0338 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0338 end');
    })

    /**
     * @tc.name   testRadioNetState0339
     * @tc.number SUB_RADIO_NETSTATE_0339
     * @tc.desc   network state combination #19 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0339', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0339 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '1234',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0339 end');
    })

    /**
     * @tc.name   testRadioNetState0340
     * @tc.number SUB_RADIO_NETSTATE_0340
     * @tc.desc   network state combination #20 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0340 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
        plmnNumeric: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0340 end');
    })

    /**
     * @tc.name   testRadioNetState0341
     * @tc.number SUB_RADIO_NETSTATE_0341
     * @tc.desc   network state combination #21 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0341', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0341 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '46000',
        isRoaming: true,
        regState: 0,
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
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:no service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:sa attached');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0341 end');
    })

    /**
     * @tc.name   testRadioNetState0342
     * @tc.number SUB_RADIO_NETSTATE_0342
     * @tc.desc   network state combination #22 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0342', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0342 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '46001',
        isRoaming: false,
        regState: 1,
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
      expect(result.split('\n')[4]).assertEqual('regState:in service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0342 end');
    })

    /**
     * @tc.name   testRadioNetState0343
     * @tc.number SUB_RADIO_NETSTATE_0343
     * @tc.desc   network state combination #23 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0343', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0343 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
        plmnNumeric: '310260',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0343 end');
    })

    /**
     * @tc.name   testRadioNetState0344
     * @tc.number SUB_RADIO_NETSTATE_0344
     * @tc.desc   network state combination #24 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0344', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0344 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '1234',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0344 end');
    })

    /**
     * @tc.name   testRadioNetState0345
     * @tc.number SUB_RADIO_NETSTATE_0345
     * @tc.desc   network state combination #25 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0345', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0345 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0345 end');
    })

    /**
     * @tc.name   testRadioNetState0346
     * @tc.number SUB_RADIO_NETSTATE_0346
     * @tc.desc   network state combination #26 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0346', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0346 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
        plmnNumeric: '46000',
        isRoaming: false,
        regState: 1,
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
      expect(result.split('\n')[4]).assertEqual('regState:in service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:idle detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0346 end');
    })

    /**
     * @tc.name   testRadioNetState0347
     * @tc.number SUB_RADIO_NETSTATE_0347
     * @tc.desc   network state combination #27 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0347', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0347 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '46001',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0347 end');
    })

    /**
     * @tc.name   testRadioNetState0348
     * @tc.number SUB_RADIO_NETSTATE_0348
     * @tc.desc   network state combination #28 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0348', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0348 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '310260',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0348 end');
    })

    /**
     * @tc.name   testRadioNetState0349
     * @tc.number SUB_RADIO_NETSTATE_0349
     * @tc.desc   network state combination #29 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0349', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0349 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
        plmnNumeric: '1234',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0349 end');
    })

    /**
     * @tc.name   testRadioNetState0350
     * @tc.number SUB_RADIO_NETSTATE_0350
     * @tc.desc   network state combination #30 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0350 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0350 end');
    })

    /**
     * @tc.name   testRadioNetState0351
     * @tc.number SUB_RADIO_NETSTATE_0351
     * @tc.desc   network state combination #31 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0351', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0351 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '46000',
        isRoaming: true,
        regState: 2,
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
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:no detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0351 end');
    })

    /**
     * @tc.name   testRadioNetState0352
     * @tc.number SUB_RADIO_NETSTATE_0352
     * @tc.desc   network state combination #32 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0352', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0352 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
        plmnNumeric: '46001',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0352 end');
    })

    /**
     * @tc.name   testRadioNetState0353
     * @tc.number SUB_RADIO_NETSTATE_0353
     * @tc.desc   network state combination #33 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0353', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0353 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '310260',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0353 end');
    })

    /**
     * @tc.name   testRadioNetState0354
     * @tc.number SUB_RADIO_NETSTATE_0354
     * @tc.desc   network state combination #34 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0354', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0354 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '1234',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0354 end');
    })

    /**
     * @tc.name   testRadioNetState0355
     * @tc.number SUB_RADIO_NETSTATE_0355
     * @tc.desc   network state combination #35 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0355', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0355 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
        plmnNumeric: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0355 end');
    })

    /**
     * @tc.name   testRadioNetState0356
     * @tc.number SUB_RADIO_NETSTATE_0356
     * @tc.desc   network state combination #36 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0356', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0356 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '46000',
        isRoaming: false,
        regState: 3,
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
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:power off');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0356 end');
    })

    /**
     * @tc.name   testRadioNetState0357
     * @tc.number SUB_RADIO_NETSTATE_0357
     * @tc.desc   network state combination #37 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0357', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0357 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '46001',
        isRoaming: true,
        regState: 0,
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
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:no service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:not support');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0357 end');
    })

    /**
     * @tc.name   testRadioNetState0358
     * @tc.number SUB_RADIO_NETSTATE_0358
     * @tc.desc   network state combination #38 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0358', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0358 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
        plmnNumeric: '310260',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0358 end');
    })

    /**
     * @tc.name   testRadioNetState0359
     * @tc.number SUB_RADIO_NETSTATE_0359
     * @tc.desc   network state combination #39 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0359', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0359 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '1234',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0359 end');
    })

    /**
     * @tc.name   testRadioNetState0360
     * @tc.number SUB_RADIO_NETSTATE_0360
     * @tc.desc   network state combination #40 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0360 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0360 end');
    })

    /**
     * @tc.name   testRadioNetState0361
     * @tc.number SUB_RADIO_NETSTATE_0361
     * @tc.desc   network state combination #41 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0361', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0361 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
        plmnNumeric: '46000',
        isRoaming: true,
        regState: 0,
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
      expect(result.split('\n')[4]).assertEqual('regState:no service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:dual connected');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0361 end');
    })

    /**
     * @tc.name   testRadioNetState0362
     * @tc.number SUB_RADIO_NETSTATE_0362
     * @tc.desc   network state combination #42 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0362', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0362 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '46001',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0362 end');
    })

    /**
     * @tc.name   testRadioNetState0363
     * @tc.number SUB_RADIO_NETSTATE_0363
     * @tc.desc   network state combination #43 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0363', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0363 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '310260',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0363 end');
    })

    /**
     * @tc.name   testRadioNetState0364
     * @tc.number SUB_RADIO_NETSTATE_0364
     * @tc.desc   network state combination #44 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0364', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0364 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
        plmnNumeric: '1234',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0364 end');
    })

    /**
     * @tc.name   testRadioNetState0365
     * @tc.number SUB_RADIO_NETSTATE_0365
     * @tc.desc   network state combination #45 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0365', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0365 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0365 end');
    })

    /**
     * @tc.name   testRadioNetState0366
     * @tc.number SUB_RADIO_NETSTATE_0366
     * @tc.desc   network state combination #46 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0366', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0366 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '46000',
        isRoaming: false,
        regState: 1,
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
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:in service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:connected detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0366 end');
    })

    /**
     * @tc.name   testRadioNetState0367
     * @tc.number SUB_RADIO_NETSTATE_0367
     * @tc.desc   network state combination #47 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0367', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0367 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
        plmnNumeric: '46001',
        isRoaming: true,
        regState: 2,
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
      expect(result.split('\n')[4]).assertEqual('regState:emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:idle detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0367 end');
    })

    /**
     * @tc.name   testRadioNetState0368
     * @tc.number SUB_RADIO_NETSTATE_0368
     * @tc.desc   network state combination #48 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0368', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0368 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '310260',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0368 end');
    })

    /**
     * @tc.name   testRadioNetState0369
     * @tc.number SUB_RADIO_NETSTATE_0369
     * @tc.desc   network state combination #49 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0369', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0369 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '1234',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0369 end');
    })

    /**
     * @tc.name   testRadioNetState0370
     * @tc.number SUB_RADIO_NETSTATE_0370
     * @tc.desc   network state combination #50 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0370 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
        plmnNumeric: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0370 end');
    })

    /**
     * @tc.name   testRadioNetState0371
     * @tc.number SUB_RADIO_NETSTATE_0371
     * @tc.desc   network state combination #51 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0371', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0371 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '46000',
        isRoaming: true,
        regState: 2,
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
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:not support');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0371 end');
    })

    /**
     * @tc.name   testRadioNetState0372
     * @tc.number SUB_RADIO_NETSTATE_0372
     * @tc.desc   network state combination #52 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0372', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0372 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '46001',
        isRoaming: false,
        regState: 3,
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
      expect(result.split('\n')[4]).assertEqual('regState:power off');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:no detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0372 end');
    })

    /**
     * @tc.name   testRadioNetState0373
     * @tc.number SUB_RADIO_NETSTATE_0373
     * @tc.desc   network state combination #53 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0373', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0373 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
        plmnNumeric: '310260',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0373 end');
    })

    /**
     * @tc.name   testRadioNetState0374
     * @tc.number SUB_RADIO_NETSTATE_0374
     * @tc.desc   network state combination #54 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0374', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0374 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '1234',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0374 end');
    })

    /**
     * @tc.name   testRadioNetState0375
     * @tc.number SUB_RADIO_NETSTATE_0375
     * @tc.desc   network state combination #55 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0375', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0375 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0375 end');
    })

    /**
     * @tc.name   testRadioNetState0376
     * @tc.number SUB_RADIO_NETSTATE_0376
     * @tc.desc   network state combination #56 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0376', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0376 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
        plmnNumeric: '46000',
        isRoaming: false,
        regState: 3,
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
      expect(result.split('\n')[4]).assertEqual('regState:power off');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:sa attached');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0376 end');
    })

    /**
     * @tc.name   testRadioNetState0377
     * @tc.number SUB_RADIO_NETSTATE_0377
     * @tc.desc   network state combination #57 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0377', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0377 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '46001',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0377 end');
    })

    /**
     * @tc.name   testRadioNetState0378
     * @tc.number SUB_RADIO_NETSTATE_0378
     * @tc.desc   network state combination #58 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0378', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0378 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '310260',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0378 end');
    })

    /**
     * @tc.name   testRadioNetState0379
     * @tc.number SUB_RADIO_NETSTATE_0379
     * @tc.desc   network state combination #59 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0379', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0379 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
        plmnNumeric: '1234',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0379 end');
    })

    /**
     * @tc.name   testRadioNetState0380
     * @tc.number SUB_RADIO_NETSTATE_0380
     * @tc.desc   network state combination #60 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0380 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0380 end');
    })

    /**
     * @tc.name   testRadioNetState0381
     * @tc.number SUB_RADIO_NETSTATE_0381
     * @tc.desc   network state combination #61 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0381', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0381 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '46000',
        isRoaming: true,
        regState: 0,
        nsaState: 4,
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
      expect(result.split('\n')[5]).assertEqual('nsaState:idle detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0381 end');
    })

    /**
     * @tc.name   testRadioNetState0382
     * @tc.number SUB_RADIO_NETSTATE_0382
     * @tc.desc   network state combination #62 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0382', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0382 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
        plmnNumeric: '46001',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0382 end');
    })

    /**
     * @tc.name   testRadioNetState0383
     * @tc.number SUB_RADIO_NETSTATE_0383
     * @tc.desc   network state combination #63 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0383', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0383 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '310260',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0383 end');
    })

    /**
     * @tc.name   testRadioNetState0384
     * @tc.number SUB_RADIO_NETSTATE_0384
     * @tc.desc   network state combination #64 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0384', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0384 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '1234',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0384 end');
    })

    /**
     * @tc.name   testRadioNetState0385
     * @tc.number SUB_RADIO_NETSTATE_0385
     * @tc.desc   network state combination #65 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0385', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0385 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
        plmnNumeric: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0385 end');
    })

    /**
     * @tc.name   testRadioNetState0386
     * @tc.number SUB_RADIO_NETSTATE_0386
     * @tc.desc   network state combination #66 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0386', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0386 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '46000',
        isRoaming: false,
        regState: 1,
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
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:in service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:no detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0386 end');
    })

    /**
     * @tc.name   testRadioNetState0387
     * @tc.number SUB_RADIO_NETSTATE_0387
     * @tc.desc   network state combination #67 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0387', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0387 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '46001',
        isRoaming: true,
        regState: 2,
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
      expect(result.split('\n')[4]).assertEqual('regState:emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:connected detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0387 end');
    })

    /**
     * @tc.name   testRadioNetState0388
     * @tc.number SUB_RADIO_NETSTATE_0388
     * @tc.desc   network state combination #68 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0388', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0388 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
        plmnNumeric: '310260',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0388 end');
    })

    /**
     * @tc.name   testRadioNetState0389
     * @tc.number SUB_RADIO_NETSTATE_0389
     * @tc.desc   network state combination #69 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0389', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0389 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '1234',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0389 end');
    })

    /**
     * @tc.name   testRadioNetState0390
     * @tc.number SUB_RADIO_NETSTATE_0390
     * @tc.desc   network state combination #70 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0390 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0390 end');
    })

    /**
     * @tc.name   testRadioNetState0391
     * @tc.number SUB_RADIO_NETSTATE_0391
     * @tc.desc   network state combination #71 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0391', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0391 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
        plmnNumeric: '46000',
        isRoaming: true,
        regState: 2,
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
      expect(result.split('\n')[4]).assertEqual('regState:emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0391 end');
    })

    /**
     * @tc.name   testRadioNetState0392
     * @tc.number SUB_RADIO_NETSTATE_0392
     * @tc.desc   network state combination #72 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0392', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0392 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '46001',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0392 end');
    })

    /**
     * @tc.name   testRadioNetState0393
     * @tc.number SUB_RADIO_NETSTATE_0393
     * @tc.desc   network state combination #73 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0393', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0393 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '310260',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0393 end');
    })

    /**
     * @tc.name   testRadioNetState0394
     * @tc.number SUB_RADIO_NETSTATE_0394
     * @tc.desc   network state combination #74 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0394', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0394 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
        plmnNumeric: '1234',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0394 end');
    })

    /**
     * @tc.name   testRadioNetState0395
     * @tc.number SUB_RADIO_NETSTATE_0395
     * @tc.desc   network state combination #75 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0395', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0395 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '',
        isRoaming: true,
        regState: 2,
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
      expect(result.split('\n')[4]).assertEqual('regState:emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:idle detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0395 end');
    })

    /**
     * @tc.name   testRadioNetState0396
     * @tc.number SUB_RADIO_NETSTATE_0396
     * @tc.desc   network state combination #76 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0396', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0396 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '46000',
        isRoaming: false,
        regState: 3,
        nsaState: 5,
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
      expect(result.split('\n')[5]).assertEqual('nsaState:dual connected');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0396 end');
    })

    /**
     * @tc.name   testRadioNetState0397
     * @tc.number SUB_RADIO_NETSTATE_0397
     * @tc.desc   network state combination #77 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0397', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0397 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
        plmnNumeric: '46001',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0397 end');
    })

    /**
     * @tc.name   testRadioNetState0398
     * @tc.number SUB_RADIO_NETSTATE_0398
     * @tc.desc   network state combination #78 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0398', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0398 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '310260',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0398 end');
    })

    /**
     * @tc.name   testRadioNetState0399
     * @tc.number SUB_RADIO_NETSTATE_0399
     * @tc.desc   network state combination #79 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0399', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0399 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '1234',
        isRoaming: true,
        regState: 2,
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
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:not support');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0399 end');
    })

    /**
     * @tc.name   testRadioNetState0400
     * @tc.number SUB_RADIO_NETSTATE_0400
     * @tc.desc   注册态完整快照输出 8 行且字段顺序固定
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0400 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0400 end');
    })
  })
}
