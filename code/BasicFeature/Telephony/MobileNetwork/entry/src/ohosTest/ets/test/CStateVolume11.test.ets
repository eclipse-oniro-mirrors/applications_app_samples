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
const LOG_TAG: string = '[Sample_MobileNetwork_CStateVolume11]';

export default function cstateVolume11Test() {
  describe('CStateVolume11Test', () => {

    /**
     * @tc.name   testCState0707
     * @tc.number SUB_MOBILENETWORK_CSTATE_0707
     * @tc.desc   invalid input 305 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0707', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0707 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(305 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0707 end');
    })

    /**
     * @tc.name   testCState0708
     * @tc.number SUB_MOBILENETWORK_CSTATE_0708
     * @tc.desc   invalid input 306 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0708', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0708 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(306 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0708 end');
    })

    /**
     * @tc.name   testCState0709
     * @tc.number SUB_MOBILENETWORK_CSTATE_0709
     * @tc.desc   invalid input 307 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0709', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0709 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(307 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0709 end');
    })

    /**
     * @tc.name   testCState0710
     * @tc.number SUB_MOBILENETWORK_CSTATE_0710
     * @tc.desc   invalid input 308 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0710 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(308 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0710 end');
    })

    /**
     * @tc.name   testCState0711
     * @tc.number SUB_MOBILENETWORK_CSTATE_0711
     * @tc.desc   invalid input 309 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0711', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0711 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(309 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0711 end');
    })

    /**
     * @tc.name   testCState0712
     * @tc.number SUB_MOBILENETWORK_CSTATE_0712
     * @tc.desc   invalid input 310 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0712', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0712 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(310 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0712 end');
    })

    /**
     * @tc.name   testCState0713
     * @tc.number SUB_MOBILENETWORK_CSTATE_0713
     * @tc.desc   invalid input 311 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0713', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0713 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(311 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0713 end');
    })

    /**
     * @tc.name   testCState0714
     * @tc.number SUB_MOBILENETWORK_CSTATE_0714
     * @tc.desc   invalid input 312 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0714', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0714 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(312 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0714 end');
    })

    /**
     * @tc.name   testCState0715
     * @tc.number SUB_MOBILENETWORK_CSTATE_0715
     * @tc.desc   invalid input 313 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0715', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0715 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(313 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0715 end');
    })

    /**
     * @tc.name   testCState0716
     * @tc.number SUB_MOBILENETWORK_CSTATE_0716
     * @tc.desc   invalid input 314 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0716', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0716 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(314 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0716 end');
    })

    /**
     * @tc.name   testCState0717
     * @tc.number SUB_MOBILENETWORK_CSTATE_0717
     * @tc.desc   invalid input 315 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0717', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0717 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(315 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0717 end');
    })

    /**
     * @tc.name   testCState0718
     * @tc.number SUB_MOBILENETWORK_CSTATE_0718
     * @tc.desc   invalid input 316 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0718', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0718 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(316 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0718 end');
    })

    /**
     * @tc.name   testCState0719
     * @tc.number SUB_MOBILENETWORK_CSTATE_0719
     * @tc.desc   invalid input 317 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0719', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0719 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(317 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0719 end');
    })

    /**
     * @tc.name   testCState0720
     * @tc.number SUB_MOBILENETWORK_CSTATE_0720
     * @tc.desc   invalid input 318 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0720 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(318 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0720 end');
    })

    /**
     * @tc.name   testCState0721
     * @tc.number SUB_MOBILENETWORK_CSTATE_0721
     * @tc.desc   invalid input 319 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0721', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0721 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(319 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0721 end');
    })

    /**
     * @tc.name   testCState0722
     * @tc.number SUB_MOBILENETWORK_CSTATE_0722
     * @tc.desc   invalid input 320 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0722', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0722 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(320 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0722 end');
    })

    /**
     * @tc.name   testCState0723
     * @tc.number SUB_MOBILENETWORK_CSTATE_0723
     * @tc.desc   invalid input 321 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0723', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0723 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(321 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0723 end');
    })

    /**
     * @tc.name   testCState0724
     * @tc.number SUB_MOBILENETWORK_CSTATE_0724
     * @tc.desc   invalid input 322 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0724', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0724 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(322 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0724 end');
    })

    /**
     * @tc.name   testCState0725
     * @tc.number SUB_MOBILENETWORK_CSTATE_0725
     * @tc.desc   invalid input 323 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0725', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0725 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(323 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0725 end');
    })

    /**
     * @tc.name   testCState0726
     * @tc.number SUB_MOBILENETWORK_CSTATE_0726
     * @tc.desc   invalid input 324 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0726', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0726 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(324 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0726 end');
    })

    /**
     * @tc.name   testCState0727
     * @tc.number SUB_MOBILENETWORK_CSTATE_0727
     * @tc.desc   invalid input 325 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0727', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0727 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(325 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0727 end');
    })

    /**
     * @tc.name   testCState0728
     * @tc.number SUB_MOBILENETWORK_CSTATE_0728
     * @tc.desc   invalid input 326 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0728', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0728 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(326 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0728 end');
    })

    /**
     * @tc.name   testCState0729
     * @tc.number SUB_MOBILENETWORK_CSTATE_0729
     * @tc.desc   invalid input 327 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0729', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0729 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(327 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0729 end');
    })

    /**
     * @tc.name   testCState0730
     * @tc.number SUB_MOBILENETWORK_CSTATE_0730
     * @tc.desc   invalid input 328 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0730 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(328 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0730 end');
    })

    /**
     * @tc.name   testCState0731
     * @tc.number SUB_MOBILENETWORK_CSTATE_0731
     * @tc.desc   invalid input 329 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0731', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0731 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(329 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0731 end');
    })

    /**
     * @tc.name   testCState0732
     * @tc.number SUB_MOBILENETWORK_CSTATE_0732
     * @tc.desc   invalid input 330 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0732', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0732 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(330 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0732 end');
    })

    /**
     * @tc.name   testCState0733
     * @tc.number SUB_MOBILENETWORK_CSTATE_0733
     * @tc.desc   invalid input 331 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0733', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0733 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(331 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0733 end');
    })

    /**
     * @tc.name   testCState0734
     * @tc.number SUB_MOBILENETWORK_CSTATE_0734
     * @tc.desc   invalid input 332 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0734', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0734 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(332 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0734 end');
    })

    /**
     * @tc.name   testCState0735
     * @tc.number SUB_MOBILENETWORK_CSTATE_0735
     * @tc.desc   invalid input 333 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0735', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0735 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(333 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0735 end');
    })

    /**
     * @tc.name   testCState0736
     * @tc.number SUB_MOBILENETWORK_CSTATE_0736
     * @tc.desc   invalid input 334 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0736', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0736 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(334 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0736 end');
    })

    /**
     * @tc.name   testCState0737
     * @tc.number SUB_MOBILENETWORK_CSTATE_0737
     * @tc.desc   invalid input 335 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0737', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0737 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(335 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0737 end');
    })

    /**
     * @tc.name   testCState0738
     * @tc.number SUB_MOBILENETWORK_CSTATE_0738
     * @tc.desc   invalid input 336 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0738', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0738 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(336 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0738 end');
    })

    /**
     * @tc.name   testCState0739
     * @tc.number SUB_MOBILENETWORK_CSTATE_0739
     * @tc.desc   invalid input 337 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0739', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0739 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(337 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0739 end');
    })

    /**
     * @tc.name   testCState0740
     * @tc.number SUB_MOBILENETWORK_CSTATE_0740
     * @tc.desc   invalid input 338 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0740 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(338 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0740 end');
    })

    /**
     * @tc.name   testCState0741
     * @tc.number SUB_MOBILENETWORK_CSTATE_0741
     * @tc.desc   invalid input 339 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0741', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0741 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(339 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0741 end');
    })

    /**
     * @tc.name   testCState0742
     * @tc.number SUB_MOBILENETWORK_CSTATE_0742
     * @tc.desc   invalid input 340 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0742', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0742 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(340 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0742 end');
    })

    /**
     * @tc.name   testCState0743
     * @tc.number SUB_MOBILENETWORK_CSTATE_0743
     * @tc.desc   invalid input 341 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0743', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0743 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(341 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0743 end');
    })

    /**
     * @tc.name   testCState0744
     * @tc.number SUB_MOBILENETWORK_CSTATE_0744
     * @tc.desc   invalid input 342 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0744', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0744 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(342 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0744 end');
    })

    /**
     * @tc.name   testCState0745
     * @tc.number SUB_MOBILENETWORK_CSTATE_0745
     * @tc.desc   invalid input 343 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0745', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0745 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(343 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0745 end');
    })

    /**
     * @tc.name   testCState0746
     * @tc.number SUB_MOBILENETWORK_CSTATE_0746
     * @tc.desc   invalid input 344 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0746', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0746 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(344 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0746 end');
    })

    /**
     * @tc.name   testCState0747
     * @tc.number SUB_MOBILENETWORK_CSTATE_0747
     * @tc.desc   invalid input 345 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0747', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0747 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(345 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0747 end');
    })

    /**
     * @tc.name   testCState0748
     * @tc.number SUB_MOBILENETWORK_CSTATE_0748
     * @tc.desc   invalid input 346 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0748', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0748 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(346 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0748 end');
    })

    /**
     * @tc.name   testCState0749
     * @tc.number SUB_MOBILENETWORK_CSTATE_0749
     * @tc.desc   invalid input 347 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0749', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0749 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(347 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0749 end');
    })

    /**
     * @tc.name   testCState0750
     * @tc.number SUB_MOBILENETWORK_CSTATE_0750
     * @tc.desc   invalid input 348 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0750 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(348 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0750 end');
    })

    /**
     * @tc.name   testCState0751
     * @tc.number SUB_MOBILENETWORK_CSTATE_0751
     * @tc.desc   invalid input 349 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0751', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0751 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(349 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0751 end');
    })

    /**
     * @tc.name   testCState0752
     * @tc.number SUB_MOBILENETWORK_CSTATE_0752
     * @tc.desc   invalid input 350 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0752', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0752 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(350 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0752 end');
    })

    /**
     * @tc.name   testCState0753
     * @tc.number SUB_MOBILENETWORK_CSTATE_0753
     * @tc.desc   invalid input 351 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0753', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0753 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(351 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0753 end');
    })

    /**
     * @tc.name   testCState0754
     * @tc.number SUB_MOBILENETWORK_CSTATE_0754
     * @tc.desc   invalid input 352 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0754', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0754 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(352 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0754 end');
    })

    /**
     * @tc.name   testCState0755
     * @tc.number SUB_MOBILENETWORK_CSTATE_0755
     * @tc.desc   invalid input 353 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0755', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0755 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(353 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0755 end');
    })

    /**
     * @tc.name   testCState0756
     * @tc.number SUB_MOBILENETWORK_CSTATE_0756
     * @tc.desc   invalid input 354 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0756', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0756 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(354 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0756 end');
    })

    /**
     * @tc.name   testCState0757
     * @tc.number SUB_MOBILENETWORK_CSTATE_0757
     * @tc.desc   invalid input 355 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0757', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0757 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(355 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0757 end');
    })

    /**
     * @tc.name   testCState0758
     * @tc.number SUB_MOBILENETWORK_CSTATE_0758
     * @tc.desc   invalid input 356 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0758', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0758 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(356 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0758 end');
    })

    /**
     * @tc.name   testCState0759
     * @tc.number SUB_MOBILENETWORK_CSTATE_0759
     * @tc.desc   invalid input 357 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0759', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0759 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(357 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0759 end');
    })

    /**
     * @tc.name   testCState0760
     * @tc.number SUB_MOBILENETWORK_CSTATE_0760
     * @tc.desc   invalid input 358 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0760 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(358 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0760 end');
    })

    /**
     * @tc.name   testCState0761
     * @tc.number SUB_MOBILENETWORK_CSTATE_0761
     * @tc.desc   invalid input 359 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0761', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0761 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(359 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0761 end');
    })

    /**
     * @tc.name   testCState0762
     * @tc.number SUB_MOBILENETWORK_CSTATE_0762
     * @tc.desc   invalid input 360 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0762', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0762 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(360 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0762 end');
    })

    /**
     * @tc.name   testCState0763
     * @tc.number SUB_MOBILENETWORK_CSTATE_0763
     * @tc.desc   invalid input 361 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0763', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0763 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(361 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0763 end');
    })

    /**
     * @tc.name   testCState0764
     * @tc.number SUB_MOBILENETWORK_CSTATE_0764
     * @tc.desc   invalid input 362 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0764', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0764 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(362 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0764 end');
    })

    /**
     * @tc.name   testCState0765
     * @tc.number SUB_MOBILENETWORK_CSTATE_0765
     * @tc.desc   invalid input 363 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0765', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0765 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(363 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0765 end');
    })

    /**
     * @tc.name   testCState0766
     * @tc.number SUB_MOBILENETWORK_CSTATE_0766
     * @tc.desc   invalid input 364 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0766', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0766 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(364 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0766 end');
    })

    /**
     * @tc.name   testCState0767
     * @tc.number SUB_MOBILENETWORK_CSTATE_0767
     * @tc.desc   invalid input 365 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0767', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0767 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(365 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0767 end');
    })

    /**
     * @tc.name   testCState0768
     * @tc.number SUB_MOBILENETWORK_CSTATE_0768
     * @tc.desc   invalid input 366 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0768', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0768 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(366 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0768 end');
    })

    /**
     * @tc.name   testCState0769
     * @tc.number SUB_MOBILENETWORK_CSTATE_0769
     * @tc.desc   invalid input 367 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0769', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0769 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(367 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0769 end');
    })

    /**
     * @tc.name   testCState0770
     * @tc.number SUB_MOBILENETWORK_CSTATE_0770
     * @tc.desc   invalid input 368 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0770 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(368 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0770 end');
    })

    /**
     * @tc.name   testCState0771
     * @tc.number SUB_MOBILENETWORK_CSTATE_0771
     * @tc.desc   invalid input 369 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0771', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0771 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(369 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0771 end');
    })

    /**
     * @tc.name   testCState0772
     * @tc.number SUB_MOBILENETWORK_CSTATE_0772
     * @tc.desc   invalid input 370 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0772', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0772 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(370 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0772 end');
    })

    /**
     * @tc.name   testCState0773
     * @tc.number SUB_MOBILENETWORK_CSTATE_0773
     * @tc.desc   invalid input 371 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0773', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0773 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(371 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0773 end');
    })

    /**
     * @tc.name   testCState0774
     * @tc.number SUB_MOBILENETWORK_CSTATE_0774
     * @tc.desc   invalid input 372 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0774', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0774 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(372 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0774 end');
    })

    /**
     * @tc.name   testCState0775
     * @tc.number SUB_MOBILENETWORK_CSTATE_0775
     * @tc.desc   invalid input 373 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0775', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0775 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(373 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0775 end');
    })

    /**
     * @tc.name   testCState0776
     * @tc.number SUB_MOBILENETWORK_CSTATE_0776
     * @tc.desc   invalid input 374 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0776', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0776 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(374 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0776 end');
    })

    /**
     * @tc.name   testCState0777
     * @tc.number SUB_MOBILENETWORK_CSTATE_0777
     * @tc.desc   invalid input 375 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0777', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0777 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(375 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0777 end');
    })

    /**
     * @tc.name   testCState0778
     * @tc.number SUB_MOBILENETWORK_CSTATE_0778
     * @tc.desc   invalid input 376 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0778', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0778 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(376 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0778 end');
    })

    /**
     * @tc.name   testCState0779
     * @tc.number SUB_MOBILENETWORK_CSTATE_0779
     * @tc.desc   invalid input 377 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0779', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0779 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(377 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0779 end');
    })

    /**
     * @tc.name   testCState0780
     * @tc.number SUB_MOBILENETWORK_CSTATE_0780
     * @tc.desc   invalid input 378 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0780 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(378 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0780 end');
    })

    /**
     * @tc.name   testCState0781
     * @tc.number SUB_MOBILENETWORK_CSTATE_0781
     * @tc.desc   invalid input 379 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0781', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0781 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(379 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0781 end');
    })

  })
}
