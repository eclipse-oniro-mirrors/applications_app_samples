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

export default function radioNetStateFormat03Test() {
  describe('RadioNetStateFormat03Test', () => {

    /**
     * @tc.name   testRadioNetState0481
     * @tc.number SUB_RADIO_NETSTATE_0481
     * @tc.desc   network state combination #159 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0481', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0481 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '1234',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0481 end');
    })

    /**
     * @tc.name   testRadioNetState0482
     * @tc.number SUB_RADIO_NETSTATE_0482
     * @tc.desc   network state combination #160 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0482', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0482 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '',
        isRoaming: false,
        regState: 3,
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
      expect(result.split('\n')[4]).assertEqual('regState:power off');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:dual connected');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0482 end');
    })

    /**
     * @tc.name   testRadioNetState0483
     * @tc.number SUB_RADIO_NETSTATE_0483
     * @tc.desc   network state combination #161 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0483', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0483 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0483 end');
    })

    /**
     * @tc.name   testRadioNetState0484
     * @tc.number SUB_RADIO_NETSTATE_0484
     * @tc.desc   network state combination #162 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0484', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0484 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '46001',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0484 end');
    })

    /**
     * @tc.name   testRadioNetState0485
     * @tc.number SUB_RADIO_NETSTATE_0485
     * @tc.desc   network state combination #163 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0485', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0485 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '310260',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0485 end');
    })

    /**
     * @tc.name   testRadioNetState0486
     * @tc.number SUB_RADIO_NETSTATE_0486
     * @tc.desc   network state combination #164 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0486', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0486 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0486 end');
    })

    /**
     * @tc.name   testRadioNetState0487
     * @tc.number SUB_RADIO_NETSTATE_0487
     * @tc.desc   network state combination #165 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0487', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0487 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0487 end');
    })

    /**
     * @tc.name   testRadioNetState0488
     * @tc.number SUB_RADIO_NETSTATE_0488
     * @tc.desc   network state combination #166 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0488', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0488 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '46000',
        isRoaming: false,
        regState: 1,
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
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:in service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:idle detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0488 end');
    })

    /**
     * @tc.name   testRadioNetState0489
     * @tc.number SUB_RADIO_NETSTATE_0489
     * @tc.desc   network state combination #167 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0489', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0489 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0489 end');
    })

    /**
     * @tc.name   testRadioNetState0490
     * @tc.number SUB_RADIO_NETSTATE_0490
     * @tc.desc   network state combination #168 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0490 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '310260',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0490 end');
    })

    /**
     * @tc.name   testRadioNetState0491
     * @tc.number SUB_RADIO_NETSTATE_0491
     * @tc.desc   network state combination #169 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0491', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0491 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '1234',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0491 end');
    })

    /**
     * @tc.name   testRadioNetState0492
     * @tc.number SUB_RADIO_NETSTATE_0492
     * @tc.desc   network state combination #170 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0492', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0492 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0492 end');
    })

    /**
     * @tc.name   testRadioNetState0493
     * @tc.number SUB_RADIO_NETSTATE_0493
     * @tc.desc   network state combination #171 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0493', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0493 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '46000',
        isRoaming: true,
        regState: 2,
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
      expect(result.split('\n')[4]).assertEqual('regState:emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:no detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0493 end');
    })

    /**
     * @tc.name   testRadioNetState0494
     * @tc.number SUB_RADIO_NETSTATE_0494
     * @tc.desc   network state combination #172 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0494', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0494 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '46001',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0494 end');
    })

    /**
     * @tc.name   testRadioNetState0495
     * @tc.number SUB_RADIO_NETSTATE_0495
     * @tc.desc   network state combination #173 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0495', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0495 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0495 end');
    })

    /**
     * @tc.name   testRadioNetState0496
     * @tc.number SUB_RADIO_NETSTATE_0496
     * @tc.desc   network state combination #174 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0496', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0496 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '1234',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0496 end');
    })

    /**
     * @tc.name   testRadioNetState0497
     * @tc.number SUB_RADIO_NETSTATE_0497
     * @tc.desc   network state combination #175 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0497', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0497 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0497 end');
    })

    /**
     * @tc.name   testRadioNetState0498
     * @tc.number SUB_RADIO_NETSTATE_0498
     * @tc.desc   network state combination #176 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0498', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0498 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0498 end');
    })

    /**
     * @tc.name   testRadioNetState0499
     * @tc.number SUB_RADIO_NETSTATE_0499
     * @tc.desc   network state combination #177 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0499', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0499 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '46001',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0499 end');
    })

    /**
     * @tc.name   testRadioNetState0500
     * @tc.number SUB_RADIO_NETSTATE_0500
     * @tc.desc   network state combination #178 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0500 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '310260',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0500 end');
    })

    /**
     * @tc.name   testRadioNetState0501
     * @tc.number SUB_RADIO_NETSTATE_0501
     * @tc.desc   network state combination #179 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0501 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0501 end');
    })

    /**
     * @tc.name   testRadioNetState0502
     * @tc.number SUB_RADIO_NETSTATE_0502
     * @tc.desc   network state combination #180 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0502', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0502 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0502 end');
    })

    /**
     * @tc.name   testRadioNetState0503
     * @tc.number SUB_RADIO_NETSTATE_0503
     * @tc.desc   network state combination #181 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0503', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0503 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '46000',
        isRoaming: true,
        regState: 0,
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
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:no service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:dual connected');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0503 end');
    })

    /**
     * @tc.name   testRadioNetState0504
     * @tc.number SUB_RADIO_NETSTATE_0504
     * @tc.desc   network state combination #182 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0504', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0504 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0504 end');
    })

    /**
     * @tc.name   testRadioNetState0505
     * @tc.number SUB_RADIO_NETSTATE_0505
     * @tc.desc   network state combination #183 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0505', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0505 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '310260',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0505 end');
    })

    /**
     * @tc.name   testRadioNetState0506
     * @tc.number SUB_RADIO_NETSTATE_0506
     * @tc.desc   network state combination #184 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0506', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0506 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '1234',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0506 end');
    })

    /**
     * @tc.name   testRadioNetState0507
     * @tc.number SUB_RADIO_NETSTATE_0507
     * @tc.desc   network state combination #185 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0507', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0507 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0507 end');
    })

    /**
     * @tc.name   testRadioNetState0508
     * @tc.number SUB_RADIO_NETSTATE_0508
     * @tc.desc   network state combination #186 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0508', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0508 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '46000',
        isRoaming: false,
        regState: 1,
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
      expect(result.split('\n')[4]).assertEqual('regState:in service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:connected detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0508 end');
    })

    /**
     * @tc.name   testRadioNetState0509
     * @tc.number SUB_RADIO_NETSTATE_0509
     * @tc.desc   network state combination #187 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0509', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0509 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '46001',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0509 end');
    })

    /**
     * @tc.name   testRadioNetState0510
     * @tc.number SUB_RADIO_NETSTATE_0510
     * @tc.desc   network state combination #188 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0510 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0510 end');
    })

    /**
     * @tc.name   testRadioNetState0511
     * @tc.number SUB_RADIO_NETSTATE_0511
     * @tc.desc   network state combination #189 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0511', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0511 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '1234',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0511 end');
    })

    /**
     * @tc.name   testRadioNetState0512
     * @tc.number SUB_RADIO_NETSTATE_0512
     * @tc.desc   network state combination #190 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0512', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0512 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0512 end');
    })

    /**
     * @tc.name   testRadioNetState0513
     * @tc.number SUB_RADIO_NETSTATE_0513
     * @tc.desc   network state combination #191 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0513', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0513 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0513 end');
    })

    /**
     * @tc.name   testRadioNetState0514
     * @tc.number SUB_RADIO_NETSTATE_0514
     * @tc.desc   network state combination #192 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0514', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0514 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '46001',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0514 end');
    })

    /**
     * @tc.name   testRadioNetState0515
     * @tc.number SUB_RADIO_NETSTATE_0515
     * @tc.desc   network state combination #193 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0515', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0515 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '310260',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0515 end');
    })

    /**
     * @tc.name   testRadioNetState0516
     * @tc.number SUB_RADIO_NETSTATE_0516
     * @tc.desc   network state combination #194 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0516', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0516 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0516 end');
    })

    /**
     * @tc.name   testRadioNetState0517
     * @tc.number SUB_RADIO_NETSTATE_0517
     * @tc.desc   network state combination #195 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0517', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0517 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0517 end');
    })

    /**
     * @tc.name   testRadioNetState0518
     * @tc.number SUB_RADIO_NETSTATE_0518
     * @tc.desc   network state combination #196 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0518', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0518 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '46000',
        isRoaming: false,
        regState: 3,
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
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:power off');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:sa attached');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0518 end');
    })

    /**
     * @tc.name   testRadioNetState0519
     * @tc.number SUB_RADIO_NETSTATE_0519
     * @tc.desc   network state combination #197 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0519', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0519 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0519 end');
    })

    /**
     * @tc.name   testRadioNetState0520
     * @tc.number SUB_RADIO_NETSTATE_0520
     * @tc.desc   network state combination #198 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0520 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '310260',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0520 end');
    })

    /**
     * @tc.name   testRadioNetState0521
     * @tc.number SUB_RADIO_NETSTATE_0521
     * @tc.desc   network state combination #199 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0521', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0521 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '1234',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0521 end');
    })

    /**
     * @tc.name   testRadioNetState0522
     * @tc.number SUB_RADIO_NETSTATE_0522
     * @tc.desc   network state combination #200 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0522', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0522 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0522 end');
    })

    /**
     * @tc.name   testRadioNetState0523
     * @tc.number SUB_RADIO_NETSTATE_0523
     * @tc.desc   network state combination #201 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0523', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0523 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '46000',
        isRoaming: true,
        regState: 0,
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
      expect(result.split('\n')[4]).assertEqual('regState:no service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:idle detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0523 end');
    })

    /**
     * @tc.name   testRadioNetState0524
     * @tc.number SUB_RADIO_NETSTATE_0524
     * @tc.desc   network state combination #202 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0524', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0524 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '46001',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0524 end');
    })

    /**
     * @tc.name   testRadioNetState0525
     * @tc.number SUB_RADIO_NETSTATE_0525
     * @tc.desc   network state combination #203 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0525', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0525 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0525 end');
    })

    /**
     * @tc.name   testRadioNetState0526
     * @tc.number SUB_RADIO_NETSTATE_0526
     * @tc.desc   network state combination #204 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0526', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0526 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '1234',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0526 end');
    })

    /**
     * @tc.name   testRadioNetState0527
     * @tc.number SUB_RADIO_NETSTATE_0527
     * @tc.desc   network state combination #205 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0527', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0527 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0527 end');
    })

    /**
     * @tc.name   testRadioNetState0528
     * @tc.number SUB_RADIO_NETSTATE_0528
     * @tc.desc   network state combination #206 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0528', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0528 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0528 end');
    })

    /**
     * @tc.name   testRadioNetState0529
     * @tc.number SUB_RADIO_NETSTATE_0529
     * @tc.desc   network state combination #207 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0529', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0529 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '46001',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0529 end');
    })

    /**
     * @tc.name   testRadioNetState0530
     * @tc.number SUB_RADIO_NETSTATE_0530
     * @tc.desc   network state combination #208 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0530 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '310260',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0530 end');
    })

    /**
     * @tc.name   testRadioNetState0531
     * @tc.number SUB_RADIO_NETSTATE_0531
     * @tc.desc   network state combination #209 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0531', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0531 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0531 end');
    })

    /**
     * @tc.name   testRadioNetState0532
     * @tc.number SUB_RADIO_NETSTATE_0532
     * @tc.desc   network state combination #210 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0532', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0532 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0532 end');
    })

    /**
     * @tc.name   testRadioNetState0533
     * @tc.number SUB_RADIO_NETSTATE_0533
     * @tc.desc   network state combination #211 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0533', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0533 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '46000',
        isRoaming: true,
        regState: 2,
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
      expect(result.split('\n')[4]).assertEqual('regState:emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0533 end');
    })

    /**
     * @tc.name   testRadioNetState0534
     * @tc.number SUB_RADIO_NETSTATE_0534
     * @tc.desc   network state combination #212 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0534', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0534 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0534 end');
    })

    /**
     * @tc.name   testRadioNetState0535
     * @tc.number SUB_RADIO_NETSTATE_0535
     * @tc.desc   network state combination #213 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0535', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0535 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '310260',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0535 end');
    })

    /**
     * @tc.name   testRadioNetState0536
     * @tc.number SUB_RADIO_NETSTATE_0536
     * @tc.desc   network state combination #214 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0536', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0536 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '1234',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0536 end');
    })

    /**
     * @tc.name   testRadioNetState0537
     * @tc.number SUB_RADIO_NETSTATE_0537
     * @tc.desc   network state combination #215 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0537', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0537 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0537 end');
    })

    /**
     * @tc.name   testRadioNetState0538
     * @tc.number SUB_RADIO_NETSTATE_0538
     * @tc.desc   network state combination #216 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0538', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0538 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '46000',
        isRoaming: false,
        regState: 3,
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
      expect(result.split('\n')[4]).assertEqual('regState:power off');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:dual connected');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0538 end');
    })

    /**
     * @tc.name   testRadioNetState0539
     * @tc.number SUB_RADIO_NETSTATE_0539
     * @tc.desc   network state combination #217 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0539', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0539 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '46001',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0539 end');
    })

    /**
     * @tc.name   testRadioNetState0540
     * @tc.number SUB_RADIO_NETSTATE_0540
     * @tc.desc   network state combination #218 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0540 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0540 end');
    })

    /**
     * @tc.name   testRadioNetState0541
     * @tc.number SUB_RADIO_NETSTATE_0541
     * @tc.desc   network state combination #219 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0541', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0541 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '1234',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0541 end');
    })

    /**
     * @tc.name   testRadioNetState0542
     * @tc.number SUB_RADIO_NETSTATE_0542
     * @tc.desc   network state combination #220 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0542', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0542 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0542 end');
    })

    /**
     * @tc.name   testRadioNetState0543
     * @tc.number SUB_RADIO_NETSTATE_0543
     * @tc.desc   network state combination #221 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0543', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0543 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0543 end');
    })

    /**
     * @tc.name   testRadioNetState0544
     * @tc.number SUB_RADIO_NETSTATE_0544
     * @tc.desc   network state combination #222 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0544', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0544 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '46001',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0544 end');
    })

    /**
     * @tc.name   testRadioNetState0545
     * @tc.number SUB_RADIO_NETSTATE_0545
     * @tc.desc   network state combination #223 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0545', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0545 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '310260',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0545 end');
    })

    /**
     * @tc.name   testRadioNetState0546
     * @tc.number SUB_RADIO_NETSTATE_0546
     * @tc.desc   network state combination #224 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0546', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0546 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0546 end');
    })

    /**
     * @tc.name   testRadioNetState0547
     * @tc.number SUB_RADIO_NETSTATE_0547
     * @tc.desc   network state combination #225 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0547', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0547 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0547 end');
    })

    /**
     * @tc.name   testRadioNetState0548
     * @tc.number SUB_RADIO_NETSTATE_0548
     * @tc.desc   network state combination #226 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0548', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0548 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '46000',
        isRoaming: false,
        regState: 1,
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
      expect(result.split('\n')[4]).assertEqual('regState:in service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:not support');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0548 end');
    })

    /**
     * @tc.name   testRadioNetState0549
     * @tc.number SUB_RADIO_NETSTATE_0549
     * @tc.desc   network state combination #227 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0549', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0549 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0549 end');
    })

    /**
     * @tc.name   testRadioNetState0550
     * @tc.number SUB_RADIO_NETSTATE_0550
     * @tc.desc   network state combination #228 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0550 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '310260',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0550 end');
    })

    /**
     * @tc.name   testRadioNetState0551
     * @tc.number SUB_RADIO_NETSTATE_0551
     * @tc.desc   network state combination #229 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0551', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0551 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '1234',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0551 end');
    })

    /**
     * @tc.name   testRadioNetState0552
     * @tc.number SUB_RADIO_NETSTATE_0552
     * @tc.desc   network state combination #230 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0552', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0552 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0552 end');
    })

    /**
     * @tc.name   testRadioNetState0553
     * @tc.number SUB_RADIO_NETSTATE_0553
     * @tc.desc   network state combination #231 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0553', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0553 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '46000',
        isRoaming: true,
        regState: 2,
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
      expect(result.split('\n')[4]).assertEqual('regState:emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:sa attached');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0553 end');
    })

    /**
     * @tc.name   testRadioNetState0554
     * @tc.number SUB_RADIO_NETSTATE_0554
     * @tc.desc   network state combination #232 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0554', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0554 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '  NTT DOCOMO  ',
        shortOperatorName: 'DCM',
        plmnNumeric: '46001',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0554 end');
    })

    /**
     * @tc.name   testRadioNetState0555
     * @tc.number SUB_RADIO_NETSTATE_0555
     * @tc.desc   network state combination #233 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0555', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0555 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0555 end');
    })

    /**
     * @tc.name   testRadioNetState0556
     * @tc.number SUB_RADIO_NETSTATE_0556
     * @tc.desc   network state combination #234 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0556', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0556 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Operator-Long-Name',
        shortOperatorName: 'Short',
        plmnNumeric: '1234',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0556 end');
    })

    /**
     * @tc.name   testRadioNetState0557
     * @tc.number SUB_RADIO_NETSTATE_0557
     * @tc.desc   network state combination #235 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0557', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0557 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0557 end');
    })

    /**
     * @tc.name   testRadioNetState0558
     * @tc.number SUB_RADIO_NETSTATE_0558
     * @tc.desc   network state combination #236 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0558', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0558 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: 'CU',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0558 end');
    })

    /**
     * @tc.name   testRadioNetState0559
     * @tc.number SUB_RADIO_NETSTATE_0559
     * @tc.desc   network state combination #237 keeps documented line order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0559', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0559 begin');
      const state: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VDF',
        plmnNumeric: '46001',
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0559 end');
    })

    /**
     * @tc.name   testRadioNetState0560
     * @tc.number SUB_RADIO_NETSTATE_0560
     * @tc.desc   注册态完整快照输出 8 行且字段顺序固定
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioNetState0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0560 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioNetState0560 end');
    })
  })
}
