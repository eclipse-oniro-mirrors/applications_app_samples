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

export default function radioNetStateReal01Test() {
  describe('RadioNetStateReal01Test', () => {

    /**
     * @tc.name   testNetStateReal0001
     * @tc.number SUB_RADIO_NSREAL_0001
     * @tc.desc   network state snapshot #1 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0001 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: 'China Mobile',
        shortOperatorName: 'CMCC',
        plmnNumeric: '46000',
        isRoaming: true,
        regState: 0,
        nsaState: 0,
        isCaActive: true,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result)
        .assertEqual(
          'longOperatorName:China Mobile\nshortOperatorName:CMCC\nplmnNumeric:46000\nisRoaming:true\nregState:no se' +
          'rvice\nnsaState:unknown\nisCaActive:true\nisEmergency:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.startsWith('longOperatorName:')));
      expect(result.startsWith('longOperatorName:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0001 end');
    })

    /**
     * @tc.name   testNetStateReal0002
     * @tc.number SUB_RADIO_NSREAL_0002
     * @tc.desc   network state snapshot #2 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0002 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: '中国移动',
        shortOperatorName: '中国移动',
        plmnNumeric: '46001',
        isRoaming: false,
        regState: 1,
        nsaState: 5,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[1]));
      expect(result.split('\n')[1]).assertEqual('shortOperatorName:中国移动');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('plmnNumeric:')));
      expect(result.includes('plmnNumeric:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[7]));
      expect(result.split('\n')[7]).assertEqual('isEmergency:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0002 end');
    })

    /**
     * @tc.name   testNetStateReal0003
     * @tc.number SUB_RADIO_NSREAL_0003
     * @tc.desc   network state snapshot #3 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0003 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: '  China Unicom  ',
        shortOperatorName: 'CU',
        plmnNumeric: '46006',
        isRoaming: true,
        regState: 2,
        nsaState: 2,
        isCaActive: true,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:no detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[6]));
      expect(result.split('\n')[6]).assertEqual('isCaActive:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0003 end');
    })

    /**
     * @tc.name   testNetStateReal0004
     * @tc.number SUB_RADIO_NSREAL_0004
     * @tc.desc   network state snapshot #4 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0004 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: 'Vodafone',
        shortOperatorName: 'VF',
        plmnNumeric: '23415',
        isRoaming: false,
        regState: 3,
        nsaState: 6,
        isCaActive: false,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[0]));
      expect(result.split('\n')[0]).assertEqual('longOperatorName:Vodafone');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[2]));
      expect(result.split('\n')[2]).assertEqual('plmnNumeric:23415');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(154));
      expect(result.length).assertEqual(154);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0004 end');
    })

    /**
     * @tc.name   testNetStateReal0005
     * @tc.number SUB_RADIO_NSREAL_0005
     * @tc.desc   network state snapshot #5 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0005 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
        plmnNumeric: '',
        isRoaming: false,
        regState: 0,
        nsaState: 1,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result)
        .assertEqual(
          'longOperatorName:not available\nshortOperatorName:not available\nplmnNumeric:not available\nisRoaming:fa' +
          'lse\nregState:no service\nnsaState:not support\nisCaActive:false\nisEmergency:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('isEmergency:')));
      expect(result.includes('isEmergency:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[1]));
      expect(result.split('\n')[1]).assertEqual('shortOperatorName:not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0005 end');
    })

    /**
     * @tc.name   testNetStateReal0006
     * @tc.number SUB_RADIO_NSREAL_0006
     * @tc.desc   network state snapshot #6 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0006 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: '   ',
        shortOperatorName: '  ',
        plmnNumeric: ' 46000 ',
        isRoaming: true,
        regState: 1,
        nsaState: 0,
        isCaActive: true,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result)
        .assertEqual(
          'longOperatorName:not available\nshortOperatorName:not available\nplmnNumeric:46000\nisRoaming:true\nregS' +
          'tate:in service\nnsaState:unknown\nisCaActive:true\nisEmergency:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.startsWith('longOperatorName:')));
      expect(result.startsWith('longOperatorName:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0006 end');
    })

    /**
     * @tc.name   testNetStateReal0007
     * @tc.number SUB_RADIO_NSREAL_0007
     * @tc.desc   network state snapshot #7 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0007 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: 'A\tB',
        shortOperatorName: 'A\tB',
        plmnNumeric: '4600',
        isRoaming: false,
        regState: 1,
        nsaState: 3,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[1]));
      expect(result.split('\n')[1]).assertEqual('shortOperatorName:A\tB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('plmnNumeric:')));
      expect(result.includes('plmnNumeric:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[7]));
      expect(result.split('\n')[7]).assertEqual('isEmergency:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0007 end');
    })

    /**
     * @tc.name   testNetStateReal0008
     * @tc.number SUB_RADIO_NSREAL_0008
     * @tc.desc   network state snapshot #8 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0008 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: 'Line-Break',
        shortOperatorName: 'LB',
        plmnNumeric: '460000',
        isRoaming: true,
        regState: 2,
        nsaState: 4,
        isCaActive: true,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:idle detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[6]));
      expect(result.split('\n')[6]).assertEqual('isCaActive:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0008 end');
    })

    /**
     * @tc.name   testNetStateReal0009
     * @tc.number SUB_RADIO_NSREAL_0009
     * @tc.desc   network state snapshot #9 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0009 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: 'Docomo',
        shortOperatorName: 'DCM',
        plmnNumeric: '44010',
        isRoaming: false,
        regState: 3,
        nsaState: 5,
        isCaActive: false,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[0]));
      expect(result.split('\n')[0]).assertEqual('longOperatorName:Docomo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[2]));
      expect(result.split('\n')[2]).assertEqual('plmnNumeric:44010');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(156));
      expect(result.length).assertEqual(156);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0009 end');
    })

    /**
     * @tc.name   testNetStateReal0010
     * @tc.number SUB_RADIO_NSREAL_0010
     * @tc.desc   network state snapshot #10 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0010 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: 'Airtel',
        shortOperatorName: 'AT',
        plmnNumeric: '40410',
        isRoaming: true,
        regState: 0,
        nsaState: 6,
        isCaActive: true,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result)
        .assertEqual(
          'longOperatorName:Airtel\nshortOperatorName:AT\nplmnNumeric:40410\nisRoaming:true\nregState:no service\nn' +
          'saState:sa attached\nisCaActive:true\nisEmergency:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('isEmergency:')));
      expect(result.includes('isEmergency:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[1]));
      expect(result.split('\n')[1]).assertEqual('shortOperatorName:AT');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0010 end');
    })

    /**
     * @tc.name   testNetStateReal0011
     * @tc.number SUB_RADIO_NSREAL_0011
     * @tc.desc   network state snapshot #11 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0011 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: 'Telstra',
        shortOperatorName: 'TLS',
        plmnNumeric: '50501',
        isRoaming: false,
        regState: 1,
        nsaState: 0,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result)
        .assertEqual(
          'longOperatorName:Telstra\nshortOperatorName:TLS\nplmnNumeric:50501\nisRoaming:false\nregState:in service' +
          '\nnsaState:unknown\nisCaActive:false\nisEmergency:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.startsWith('longOperatorName:')));
      expect(result.startsWith('longOperatorName:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0011 end');
    })

    /**
     * @tc.name   testNetStateReal0012
     * @tc.number SUB_RADIO_NSREAL_0012
     * @tc.desc   network state snapshot #12 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0012 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: 'Orange',
        shortOperatorName: 'OR',
        plmnNumeric: '20801',
        isRoaming: true,
        regState: 2,
        nsaState: 1,
        isCaActive: true,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[1]));
      expect(result.split('\n')[1]).assertEqual('shortOperatorName:OR');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('plmnNumeric:')));
      expect(result.includes('plmnNumeric:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[7]));
      expect(result.split('\n')[7]).assertEqual('isEmergency:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0012 end');
    })

    /**
     * @tc.name   testNetStateReal0013
     * @tc.number SUB_RADIO_NSREAL_0013
     * @tc.desc   network state snapshot #13 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0013 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: 'Telefonica',
        shortOperatorName: 'TEF',
        plmnNumeric: '21407',
        isRoaming: false,
        regState: 3,
        nsaState: 2,
        isCaActive: false,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:power off');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:no detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[6]));
      expect(result.split('\n')[6]).assertEqual('isCaActive:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0013 end');
    })

    /**
     * @tc.name   testNetStateReal0014
     * @tc.number SUB_RADIO_NSREAL_0014
     * @tc.desc   network state snapshot #14 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0014 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: 'TIM',
        shortOperatorName: 'TIM',
        plmnNumeric: '22201',
        isRoaming: true,
        regState: -1,
        nsaState: 3,
        isCaActive: true,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[0]));
      expect(result.split('\n')[0]).assertEqual('longOperatorName:TIM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[2]));
      expect(result.split('\n')[2]).assertEqual('plmnNumeric:22201');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(152));
      expect(result.length).assertEqual(152);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0014 end');
    })

    /**
     * @tc.name   testNetStateReal0015
     * @tc.number SUB_RADIO_NSREAL_0015
     * @tc.desc   network state snapshot #15 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0015 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: 'KPN',
        shortOperatorName: 'KPN',
        plmnNumeric: '20408',
        isRoaming: false,
        regState: 4,
        nsaState: 4,
        isCaActive: false,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result)
        .assertEqual(
          'longOperatorName:KPN\nshortOperatorName:KPN\nplmnNumeric:20408\nisRoaming:false\nregState:unknown\nnsaSt' +
          'ate:idle detect\nisCaActive:false\nisEmergency:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('isEmergency:')));
      expect(result.includes('isEmergency:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[1]));
      expect(result.split('\n')[1]).assertEqual('shortOperatorName:KPN');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0015 end');
    })

    /**
     * @tc.name   testNetStateReal0016
     * @tc.number SUB_RADIO_NSREAL_0016
     * @tc.desc   network state snapshot #16 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0016 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: 'Swisscom',
        shortOperatorName: 'SC',
        plmnNumeric: '22801',
        isRoaming: true,
        regState: 1.5,
        nsaState: 5,
        isCaActive: true,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result)
        .assertEqual(
          'longOperatorName:Swisscom\nshortOperatorName:SC\nplmnNumeric:22801\nisRoaming:true\nregState:unknown\nns' +
          'aState:dual connected\nisCaActive:true\nisEmergency:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.startsWith('longOperatorName:')));
      expect(result.startsWith('longOperatorName:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0016 end');
    })

    /**
     * @tc.name   testNetStateReal0017
     * @tc.number SUB_RADIO_NSREAL_0017
     * @tc.desc   network state snapshot #17 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0017 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: 'Zain',
        shortOperatorName: 'ZN',
        plmnNumeric: '42001',
        isRoaming: false,
        regState: Number.NaN,
        nsaState: 6,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[1]));
      expect(result.split('\n')[1]).assertEqual('shortOperatorName:ZN');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('plmnNumeric:')));
      expect(result.includes('plmnNumeric:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[7]));
      expect(result.split('\n')[7]).assertEqual('isEmergency:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0017 end');
    })

    /**
     * @tc.name   testNetStateReal0018
     * @tc.number SUB_RADIO_NSREAL_0018
     * @tc.desc   network state snapshot #18 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0018 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: 'Safaricom',
        shortOperatorName: 'SAF',
        plmnNumeric: '63902',
        isRoaming: true,
        regState: 2,
        nsaState: -1,
        isCaActive: true,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[6]));
      expect(result.split('\n')[6]).assertEqual('isCaActive:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0018 end');
    })

    /**
     * @tc.name   testNetStateReal0019
     * @tc.number SUB_RADIO_NSREAL_0019
     * @tc.desc   network state snapshot #19 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0019 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: 'MTN',
        shortOperatorName: 'MTN',
        plmnNumeric: '65501',
        isRoaming: false,
        regState: 3,
        nsaState: 7,
        isCaActive: false,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[0]));
      expect(result.split('\n')[0]).assertEqual('longOperatorName:MTN');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[2]));
      expect(result.split('\n')[2]).assertEqual('plmnNumeric:65501');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(146));
      expect(result.length).assertEqual(146);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0019 end');
    })

    /**
     * @tc.name   testNetStateReal0020
     * @tc.number SUB_RADIO_NSREAL_0020
     * @tc.desc   network state snapshot #20 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0020 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: 'Vivo',
        shortOperatorName: 'VIV',
        plmnNumeric: '72406',
        isRoaming: true,
        regState: 0,
        nsaState: 1.5,
        isCaActive: true,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result)
        .assertEqual(
          'longOperatorName:Vivo\nshortOperatorName:VIV\nplmnNumeric:72406\nisRoaming:true\nregState:no service\nns' +
          'aState:unknown\nisCaActive:true\nisEmergency:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('isEmergency:')));
      expect(result.includes('isEmergency:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[1]));
      expect(result.split('\n')[1]).assertEqual('shortOperatorName:VIV');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0020 end');
    })

    /**
     * @tc.name   testNetStateReal0021
     * @tc.number SUB_RADIO_NSREAL_0021
     * @tc.desc   network state snapshot #21 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0021 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: 'Claro',
        shortOperatorName: 'CL',
        plmnNumeric: '73001',
        isRoaming: false,
        regState: 1,
        nsaState: Number.NaN,
        isCaActive: false,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result)
        .assertEqual(
          'longOperatorName:Claro\nshortOperatorName:CL\nplmnNumeric:73001\nisRoaming:false\nregState:in service\nn' +
          'saState:unknown\nisCaActive:false\nisEmergency:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.startsWith('longOperatorName:')));
      expect(result.startsWith('longOperatorName:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0021 end');
    })

    /**
     * @tc.name   testNetStateReal0022
     * @tc.number SUB_RADIO_NSREAL_0022
     * @tc.desc   network state snapshot #22 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0022 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: 'Entel',
        shortOperatorName: 'ENT',
        plmnNumeric: '73601',
        isRoaming: true,
        regState: 2,
        nsaState: 6,
        isCaActive: true,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[1]));
      expect(result.split('\n')[1]).assertEqual('shortOperatorName:ENT');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('plmnNumeric:')));
      expect(result.includes('plmnNumeric:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[7]));
      expect(result.split('\n')[7]).assertEqual('isEmergency:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0022 end');
    })

    /**
     * @tc.name   testNetStateReal0023
     * @tc.number SUB_RADIO_NSREAL_0023
     * @tc.desc   network state snapshot #23 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0023 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: 'Movistar',
        shortOperatorName: 'MOV',
        plmnNumeric: '722310',
        isRoaming: false,
        regState: 3,
        nsaState: 0,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:power off');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[6]));
      expect(result.split('\n')[6]).assertEqual('isCaActive:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0023 end');
    })

    /**
     * @tc.name   testNetStateReal0024
     * @tc.number SUB_RADIO_NSREAL_0024
     * @tc.desc   network state snapshot #24 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0024 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: 'Oi',
        shortOperatorName: 'OI',
        plmnNumeric: '72431',
        isRoaming: true,
        regState: 0,
        nsaState: 5,
        isCaActive: true,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[0]));
      expect(result.split('\n')[0]).assertEqual('longOperatorName:Oi');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[2]));
      expect(result.split('\n')[2]).assertEqual('plmnNumeric:72431');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(151));
      expect(result.length).assertEqual(151);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0024 end');
    })

    /**
     * @tc.name   testNetStateReal0025
     * @tc.number SUB_RADIO_NSREAL_0025
     * @tc.desc   network state snapshot #25 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0025 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: 'Nextel',
        shortOperatorName: 'NX',
        plmnNumeric: '722070',
        isRoaming: false,
        regState: 1,
        nsaState: 4,
        isCaActive: false,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result)
        .assertEqual(
          'longOperatorName:Nextel\nshortOperatorName:NX\nplmnNumeric:722070\nisRoaming:false\nregState:in service' +
          '\nnsaState:idle detect\nisCaActive:false\nisEmergency:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('isEmergency:')));
      expect(result.includes('isEmergency:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[1]));
      expect(result.split('\n')[1]).assertEqual('shortOperatorName:NX');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0025 end');
    })

    /**
     * @tc.name   testNetStateReal0026
     * @tc.number SUB_RADIO_NSREAL_0026
     * @tc.desc   network state snapshot #26 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0026 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: '  \t ',
        shortOperatorName: '\n',
        plmnNumeric: ' 12345 ',
        isRoaming: true,
        regState: 2,
        nsaState: 3,
        isCaActive: true,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result)
        .assertEqual(
          'longOperatorName:not available\nshortOperatorName:not available\nplmnNumeric:12345\nisRoaming:true\nregS' +
          'tate:emergency call only\nnsaState:connected detect\nisCaActive:true\nisEmergency:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.startsWith('longOperatorName:')));
      expect(result.startsWith('longOperatorName:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0026 end');
    })

    /**
     * @tc.name   testNetStateReal0027
     * @tc.number SUB_RADIO_NSREAL_0027
     * @tc.desc   network state snapshot #27 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0027 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: 'A',
        shortOperatorName: 'B',
        plmnNumeric: '012345',
        isRoaming: false,
        regState: 3,
        nsaState: 6,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[1]));
      expect(result.split('\n')[1]).assertEqual('shortOperatorName:B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('plmnNumeric:')));
      expect(result.includes('plmnNumeric:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[7]));
      expect(result.split('\n')[7]).assertEqual('isEmergency:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0027 end');
    })

    /**
     * @tc.name   testNetStateReal0028
     * @tc.number SUB_RADIO_NSREAL_0028
     * @tc.desc   network state snapshot #28 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0028 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: 'A B',
        shortOperatorName: 'A  B',
        plmnNumeric: '1234567',
        isRoaming: true,
        regState: 0,
        nsaState: 0,
        isCaActive: true,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:no service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[6]));
      expect(result.split('\n')[6]).assertEqual('isCaActive:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0028 end');
    })

    /**
     * @tc.name   testNetStateReal0029
     * @tc.number SUB_RADIO_NSREAL_0029
     * @tc.desc   network state snapshot #29 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0029 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: 'Operador',
        shortOperatorName: 'OP',
        plmnNumeric: '12a45',
        isRoaming: false,
        regState: 1,
        nsaState: 1,
        isCaActive: false,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[0]));
      expect(result.split('\n')[0]).assertEqual('longOperatorName:Operador');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[2]));
      expect(result.split('\n')[2]).assertEqual('plmnNumeric:not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(163));
      expect(result.length).assertEqual(163);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0029 end');
    })

    /**
     * @tc.name   testNetStateReal0030
     * @tc.number SUB_RADIO_NSREAL_0030
     * @tc.desc   network state snapshot #30 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0030 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: 'Long Name With Spaces',
        shortOperatorName: 'LNWS',
        plmnNumeric: '',
        isRoaming: true,
        regState: 2,
        nsaState: 2,
        isCaActive: true,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result)
        .assertEqual(
          'longOperatorName:Long Name With Spaces\nshortOperatorName:LNWS\nplmnNumeric:not available\nisRoaming:tru' +
          'e\nregState:emergency call only\nnsaState:no detect\nisCaActive:true\nisEmergency:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('isEmergency:')));
      expect(result.includes('isEmergency:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[1]));
      expect(result.split('\n')[1]).assertEqual('shortOperatorName:LNWS');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0030 end');
    })

    /**
     * @tc.name   testNetStateReal0031
     * @tc.number SUB_RADIO_NSREAL_0031
     * @tc.desc   network state snapshot #31 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0031 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: ' 双空格 ',
        shortOperatorName: 'DS',
        plmnNumeric: '00000',
        isRoaming: false,
        regState: 3,
        nsaState: 5,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result)
        .assertEqual(
          'longOperatorName:双空格\nshortOperatorName:DS\nplmnNumeric:00000\nisRoaming:false\nregState:power off\nnsaS' +
          'tate:dual connected\nisCaActive:false\nisEmergency:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.startsWith('longOperatorName:')));
      expect(result.startsWith('longOperatorName:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0031 end');
    })

    /**
     * @tc.name   testNetStateReal0032
     * @tc.number SUB_RADIO_NSREAL_0032
     * @tc.desc   network state snapshot #32 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0032 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: 'Plus+',
        shortOperatorName: 'P+',
        plmnNumeric: '+46000',
        isRoaming: true,
        regState: 0,
        nsaState: 4,
        isCaActive: true,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[1]));
      expect(result.split('\n')[1]).assertEqual('shortOperatorName:P+');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('plmnNumeric:')));
      expect(result.includes('plmnNumeric:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[7]));
      expect(result.split('\n')[7]).assertEqual('isEmergency:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0032 end');
    })

    /**
     * @tc.name   testNetStateReal0033
     * @tc.number SUB_RADIO_NSREAL_0033
     * @tc.desc   network state snapshot #33 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0033 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: 'Amp&',
        shortOperatorName: 'A&',
        plmnNumeric: '4600O',
        isRoaming: false,
        regState: 1,
        nsaState: 3,
        isCaActive: false,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:in service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:connected detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[6]));
      expect(result.split('\n')[6]).assertEqual('isCaActive:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0033 end');
    })

    /**
     * @tc.name   testNetStateReal0034
     * @tc.number SUB_RADIO_NSREAL_0034
     * @tc.desc   network state snapshot #34 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0034 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: 'Dash-',
        shortOperatorName: 'D-',
        plmnNumeric: '-46000',
        isRoaming: true,
        regState: 2,
        nsaState: 2,
        isCaActive: true,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[0]));
      expect(result.split('\n')[0]).assertEqual('longOperatorName:Dash-');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[2]));
      expect(result.split('\n')[2]).assertEqual('plmnNumeric:not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(165));
      expect(result.length).assertEqual(165);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0034 end');
    })

    /**
     * @tc.name   testNetStateReal0035
     * @tc.number SUB_RADIO_NSREAL_0035
     * @tc.desc   network state snapshot #35 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0035 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: 'Dot.',
        shortOperatorName: 'D.',
        plmnNumeric: '46000.0',
        isRoaming: false,
        regState: 3,
        nsaState: 1,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result)
        .assertEqual(
          'longOperatorName:Dot.\nshortOperatorName:D.\nplmnNumeric:not available\nisRoaming:false\nregState:power ' +
          'off\nnsaState:not support\nisCaActive:false\nisEmergency:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('isEmergency:')));
      expect(result.includes('isEmergency:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[1]));
      expect(result.split('\n')[1]).assertEqual('shortOperatorName:D.');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0035 end');
    })

    /**
     * @tc.name   testNetStateReal0036
     * @tc.number SUB_RADIO_NSREAL_0036
     * @tc.desc   network state snapshot #36 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0036 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: '中国 联通',
        shortOperatorName: '联通',
        plmnNumeric: '46001 ',
        isRoaming: true,
        regState: -0,
        nsaState: 6,
        isCaActive: true,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result)
        .assertEqual(
          'longOperatorName:中国 联通\nshortOperatorName:联通\nplmnNumeric:46001\nisRoaming:true\nregState:no service\nns' +
          'aState:sa attached\nisCaActive:true\nisEmergency:false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.startsWith('longOperatorName:')));
      expect(result.startsWith('longOperatorName:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0036 end');
    })

    /**
     * @tc.name   testNetStateReal0037
     * @tc.number SUB_RADIO_NSREAL_0037
     * @tc.desc   network state snapshot #37 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0037 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: 'Tab\tOnly',
        shortOperatorName: 'TO',
        plmnNumeric: '\t46000',
        isRoaming: false,
        regState: 0,
        nsaState: 0,
        isCaActive: false,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[1]));
      expect(result.split('\n')[1]).assertEqual('shortOperatorName:TO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('plmnNumeric:')));
      expect(result.includes('plmnNumeric:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[7]));
      expect(result.split('\n')[7]).assertEqual('isEmergency:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0037 end');
    })

    /**
     * @tc.name   testNetStateReal0038
     * @tc.number SUB_RADIO_NSREAL_0038
     * @tc.desc   network state snapshot #38 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0038 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: 'New-Line',
        shortOperatorName: 'NL',
        plmnNumeric: '46000\n',
        isRoaming: true,
        regState: 1,
        nsaState: 1,
        isCaActive: true,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[4]));
      expect(result.split('\n')[4]).assertEqual('regState:in service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[5]));
      expect(result.split('\n')[5]).assertEqual('nsaState:not support');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[6]));
      expect(result.split('\n')[6]).assertEqual('isCaActive:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[3]));
      expect(result.split('\n')[3]).assertEqual('isRoaming:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0038 end');
    })

    /**
     * @tc.name   testNetStateReal0039
     * @tc.number SUB_RADIO_NSREAL_0039
     * @tc.desc   network state snapshot #39 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0039 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: 'Zero',
        shortOperatorName: 'Z0',
        plmnNumeric: '000000',
        isRoaming: false,
        regState: 2,
        nsaState: 5,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[0]));
      expect(result.split('\n')[0]).assertEqual('longOperatorName:Zero');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[2]));
      expect(result.split('\n')[2]).assertEqual('plmnNumeric:000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(165));
      expect(result.length).assertEqual(165);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0039 end');
    })

    /**
     * @tc.name   testNetStateReal0040
     * @tc.number SUB_RADIO_NSREAL_0040
     * @tc.desc   network state snapshot #40 formats all eight documented lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStateReal0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0040 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: 'Max',
        shortOperatorName: 'MAX',
        plmnNumeric: '999999',
        isRoaming: true,
        regState: 3,
        nsaState: 6,
        isCaActive: true,
        isEmergency: true
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result)
        .assertEqual(
          'longOperatorName:Max\nshortOperatorName:MAX\nplmnNumeric:999999\nisRoaming:true\nregState:power off\nnsa' +
          'State:sa attached\nisCaActive:true\nisEmergency:true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('isEmergency:')));
      expect(result.includes('isEmergency:')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n')[1]));
      expect(result.split('\n')[1]).assertEqual('shortOperatorName:MAX');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNetStateReal0040 end');
    })

  })
}
