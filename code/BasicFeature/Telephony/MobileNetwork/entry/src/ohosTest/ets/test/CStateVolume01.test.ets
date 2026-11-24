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
import { NetworkMobile } from '../../../../src/main/ets/model/NetworkMobile';
import data from '@ohos.telephony.data';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MobileNetwork_CStateVolume01]';

export default function cstateVolume01Test() {
  describe('CStateVolume01Test', () => {

    /**
     * @tc.name   testCState0001
     * @tc.number SUB_MOBILENETWORK_CSTATE_0001
     * @tc.desc   legal value data.DataConnectState.DATA_STATE_UNKNOWN maps to the frozen unknown resource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0001 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(data.DataConnectState.DATA_STATE_UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0001 end');
    })

    /**
     * @tc.name   testCState0002
     * @tc.number SUB_MOBILENETWORK_CSTATE_0002
     * @tc.desc   legal value data.DataConnectState.DATA_STATE_DISCONNECTED maps to the frozen disconnect resource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0002 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(data.DataConnectState.DATA_STATE_DISCONNECTED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554447));
      expect(result.id).assertEqual(33554447);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554462));
      expect(result.id === 33554462).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0002 end');
    })

    /**
     * @tc.name   testCState0003
     * @tc.number SUB_MOBILENETWORK_CSTATE_0003
     * @tc.desc   legal value data.DataConnectState.DATA_STATE_CONNECTING maps to the frozen connecting resource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0003 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(data.DataConnectState.DATA_STATE_CONNECTING);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554445));
      expect(result.id).assertEqual(33554445);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554462));
      expect(result.id === 33554462).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0003 end');
    })

    /**
     * @tc.name   testCState0004
     * @tc.number SUB_MOBILENETWORK_CSTATE_0004
     * @tc.desc   legal value data.DataConnectState.DATA_STATE_CONNECTED maps to the frozen connect resource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0004 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(data.DataConnectState.DATA_STATE_CONNECTED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554443));
      expect(result.id).assertEqual(33554443);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554462));
      expect(result.id === 33554462).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0004 end');
    })

    /**
     * @tc.name   testCState0005
     * @tc.number SUB_MOBILENETWORK_CSTATE_0005
     * @tc.desc   legal value data.DataConnectState.DATA_STATE_SUSPENDED maps to the frozen suspended resource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0005 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(data.DataConnectState.DATA_STATE_SUSPENDED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554461));
      expect(result.id).assertEqual(33554461);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554462));
      expect(result.id === 33554462).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0005 end');
    })

    /**
     * @tc.name   testCState0006
     * @tc.number SUB_MOBILENETWORK_CSTATE_0006
     * @tc.desc   invalid input -1 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0006 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-1 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0006 end');
    })

    /**
     * @tc.name   testCState0007
     * @tc.number SUB_MOBILENETWORK_CSTATE_0007
     * @tc.desc   invalid input 5 as data.DataConnectState just above the last member falls into the default branch and
     * maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0007 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(5 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0007 end');
    })

    /**
     * @tc.name   testCState0008
     * @tc.number SUB_MOBILENETWORK_CSTATE_0008
     * @tc.desc   invalid input 6 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0008 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(6 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0008 end');
    })

    /**
     * @tc.name   testCState0009
     * @tc.number SUB_MOBILENETWORK_CSTATE_0009
     * @tc.desc   invalid input 7 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0009 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(7 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0009 end');
    })

    /**
     * @tc.name   testCState0010
     * @tc.number SUB_MOBILENETWORK_CSTATE_0010
     * @tc.desc   invalid input 255 as data.DataConnectState on the UINT8_MAX line falls into the default branch and
     * maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0010 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(255 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0010 end');
    })

    /**
     * @tc.name   testCState0011
     * @tc.number SUB_MOBILENETWORK_CSTATE_0011
     * @tc.desc   invalid input 256 as data.DataConnectState just above UINT8_MAX falls into the default branch and maps
     * to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0011 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(256 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0011 end');
    })

    /**
     * @tc.name   testCState0012
     * @tc.number SUB_MOBILENETWORK_CSTATE_0012
     * @tc.desc   invalid input 65535 as data.DataConnectState on the UINT16_MAX line falls into the default branch and
     * maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0012 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(65535 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0012 end');
    })

    /**
     * @tc.name   testCState0013
     * @tc.number SUB_MOBILENETWORK_CSTATE_0013
     * @tc.desc   invalid input 65536 as data.DataConnectState just above UINT16_MAX falls into the default branch and
     * maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0013 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(65536 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0013 end');
    })

    /**
     * @tc.name   testCState0014
     * @tc.number SUB_MOBILENETWORK_CSTATE_0014
     * @tc.desc   invalid input 999 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0014 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(999 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0014 end');
    })

    /**
     * @tc.name   testCState0015
     * @tc.number SUB_MOBILENETWORK_CSTATE_0015
     * @tc.desc   invalid input 1000 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0015 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(1000 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0015 end');
    })

    /**
     * @tc.name   testCState0016
     * @tc.number SUB_MOBILENETWORK_CSTATE_0016
     * @tc.desc   extreme input -2147483648 as data.DataConnectState (INT32_MIN) falls into the default branch and maps
     * to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0016 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-2147483648 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0016 end');
    })

    /**
     * @tc.name   testCState0017
     * @tc.number SUB_MOBILENETWORK_CSTATE_0017
     * @tc.desc   extreme input 2147483647 as data.DataConnectState (INT32_MAX) falls into the default branch and maps
     * to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0017 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(2147483647 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0017 end');
    })

    /**
     * @tc.name   testCState0018
     * @tc.number SUB_MOBILENETWORK_CSTATE_0018
     * @tc.desc   non-integer input 0.5 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0018 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(0.5 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0018 end');
    })

    /**
     * @tc.name   testCState0019
     * @tc.number SUB_MOBILENETWORK_CSTATE_0019
     * @tc.desc   extreme input NaN falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0019 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(Number.NaN as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0019 end');
    })

    /**
     * @tc.name   testCState0020
     * @tc.number SUB_MOBILENETWORK_CSTATE_0020
     * @tc.desc   invalid input -100 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0020 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-100 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0020 end');
    })

    /**
     * @tc.name   testCState0021
     * @tc.number SUB_MOBILENETWORK_CSTATE_0021
     * @tc.desc   invalid input 1000000 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0021 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(1000000 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0021 end');
    })

    /**
     * @tc.name   testCState0022
     * @tc.number SUB_MOBILENETWORK_CSTATE_0022
     * @tc.desc   invalid input 4095 as data.DataConnectState just below the 4Ki line falls into the default branch and
     * maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0022 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(4095 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0022 end');
    })

    /**
     * @tc.name   testCState0023
     * @tc.number SUB_MOBILENETWORK_CSTATE_0023
     * @tc.desc   invalid input 4096 as data.DataConnectState on the 4Ki line falls into the default branch and maps to
     * unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0023 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(4096 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0023 end');
    })

    /**
     * @tc.name   testCState0024
     * @tc.number SUB_MOBILENETWORK_CSTATE_0024
     * @tc.desc   invalid input 99 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0024 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(99 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0024 end');
    })

    /**
     * @tc.name   testCState0025
     * @tc.number SUB_MOBILENETWORK_CSTATE_0025
     * @tc.desc   non-integer input 4.5 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0025 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(4.5 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0025 end');
    })

  })
}
