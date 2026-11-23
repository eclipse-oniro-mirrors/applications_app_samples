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
const LOG_TAG: string = '[Sample_MobileNetwork_CStateVolume08]';

export default function cstateVolume08Test() {
  describe('CStateVolume08Test', () => {

    /**
     * @tc.name   testCState0482
     * @tc.number SUB_MOBILENETWORK_CSTATE_0482
     * @tc.desc   invalid input 80 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0482', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0482 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(80 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0482 end');
    })

    /**
     * @tc.name   testCState0483
     * @tc.number SUB_MOBILENETWORK_CSTATE_0483
     * @tc.desc   invalid input 81 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0483', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0483 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(81 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0483 end');
    })

    /**
     * @tc.name   testCState0484
     * @tc.number SUB_MOBILENETWORK_CSTATE_0484
     * @tc.desc   invalid input 82 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0484', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0484 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(82 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0484 end');
    })

    /**
     * @tc.name   testCState0485
     * @tc.number SUB_MOBILENETWORK_CSTATE_0485
     * @tc.desc   invalid input 83 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0485', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0485 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(83 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0485 end');
    })

    /**
     * @tc.name   testCState0486
     * @tc.number SUB_MOBILENETWORK_CSTATE_0486
     * @tc.desc   invalid input 84 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0486', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0486 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(84 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0486 end');
    })

    /**
     * @tc.name   testCState0487
     * @tc.number SUB_MOBILENETWORK_CSTATE_0487
     * @tc.desc   invalid input 85 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0487', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0487 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(85 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0487 end');
    })

    /**
     * @tc.name   testCState0488
     * @tc.number SUB_MOBILENETWORK_CSTATE_0488
     * @tc.desc   invalid input 86 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0488', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0488 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(86 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0488 end');
    })

    /**
     * @tc.name   testCState0489
     * @tc.number SUB_MOBILENETWORK_CSTATE_0489
     * @tc.desc   invalid input 87 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0489', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0489 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(87 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0489 end');
    })

    /**
     * @tc.name   testCState0490
     * @tc.number SUB_MOBILENETWORK_CSTATE_0490
     * @tc.desc   invalid input 88 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0490 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(88 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0490 end');
    })

    /**
     * @tc.name   testCState0491
     * @tc.number SUB_MOBILENETWORK_CSTATE_0491
     * @tc.desc   invalid input 89 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0491', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0491 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(89 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0491 end');
    })

    /**
     * @tc.name   testCState0492
     * @tc.number SUB_MOBILENETWORK_CSTATE_0492
     * @tc.desc   invalid input 90 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0492', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0492 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(90 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0492 end');
    })

    /**
     * @tc.name   testCState0493
     * @tc.number SUB_MOBILENETWORK_CSTATE_0493
     * @tc.desc   invalid input 91 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0493', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0493 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(91 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0493 end');
    })

    /**
     * @tc.name   testCState0494
     * @tc.number SUB_MOBILENETWORK_CSTATE_0494
     * @tc.desc   invalid input 92 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0494', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0494 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(92 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0494 end');
    })

    /**
     * @tc.name   testCState0495
     * @tc.number SUB_MOBILENETWORK_CSTATE_0495
     * @tc.desc   invalid input 93 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0495', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0495 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(93 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0495 end');
    })

    /**
     * @tc.name   testCState0496
     * @tc.number SUB_MOBILENETWORK_CSTATE_0496
     * @tc.desc   invalid input 94 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0496', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0496 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(94 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0496 end');
    })

    /**
     * @tc.name   testCState0497
     * @tc.number SUB_MOBILENETWORK_CSTATE_0497
     * @tc.desc   invalid input 95 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0497', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0497 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(95 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0497 end');
    })

    /**
     * @tc.name   testCState0498
     * @tc.number SUB_MOBILENETWORK_CSTATE_0498
     * @tc.desc   invalid input 96 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0498', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0498 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(96 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0498 end');
    })

    /**
     * @tc.name   testCState0499
     * @tc.number SUB_MOBILENETWORK_CSTATE_0499
     * @tc.desc   invalid input 97 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0499', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0499 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(97 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0499 end');
    })

    /**
     * @tc.name   testCState0500
     * @tc.number SUB_MOBILENETWORK_CSTATE_0500
     * @tc.desc   invalid input 98 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0500 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(98 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0500 end');
    })

    /**
     * @tc.name   testCState0501
     * @tc.number SUB_MOBILENETWORK_CSTATE_0501
     * @tc.desc   invalid input 99 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0501 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(99 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0501 end');
    })

    /**
     * @tc.name   testCState0502
     * @tc.number SUB_MOBILENETWORK_CSTATE_0502
     * @tc.desc   invalid input 100 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0502', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0502 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(100 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0502 end');
    })

    /**
     * @tc.name   testCState0503
     * @tc.number SUB_MOBILENETWORK_CSTATE_0503
     * @tc.desc   invalid input 101 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0503', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0503 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(101 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0503 end');
    })

    /**
     * @tc.name   testCState0504
     * @tc.number SUB_MOBILENETWORK_CSTATE_0504
     * @tc.desc   invalid input 102 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0504', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0504 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(102 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0504 end');
    })

    /**
     * @tc.name   testCState0505
     * @tc.number SUB_MOBILENETWORK_CSTATE_0505
     * @tc.desc   invalid input 103 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0505', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0505 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(103 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0505 end');
    })

    /**
     * @tc.name   testCState0506
     * @tc.number SUB_MOBILENETWORK_CSTATE_0506
     * @tc.desc   invalid input 104 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0506', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0506 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(104 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0506 end');
    })

    /**
     * @tc.name   testCState0507
     * @tc.number SUB_MOBILENETWORK_CSTATE_0507
     * @tc.desc   invalid input 105 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0507', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0507 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(105 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0507 end');
    })

    /**
     * @tc.name   testCState0508
     * @tc.number SUB_MOBILENETWORK_CSTATE_0508
     * @tc.desc   invalid input 106 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0508', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0508 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(106 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0508 end');
    })

    /**
     * @tc.name   testCState0509
     * @tc.number SUB_MOBILENETWORK_CSTATE_0509
     * @tc.desc   invalid input 107 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0509', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0509 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(107 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0509 end');
    })

    /**
     * @tc.name   testCState0510
     * @tc.number SUB_MOBILENETWORK_CSTATE_0510
     * @tc.desc   invalid input 108 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0510 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(108 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0510 end');
    })

    /**
     * @tc.name   testCState0511
     * @tc.number SUB_MOBILENETWORK_CSTATE_0511
     * @tc.desc   invalid input 109 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0511', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0511 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(109 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0511 end');
    })

    /**
     * @tc.name   testCState0512
     * @tc.number SUB_MOBILENETWORK_CSTATE_0512
     * @tc.desc   invalid input 110 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0512', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0512 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(110 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0512 end');
    })

    /**
     * @tc.name   testCState0513
     * @tc.number SUB_MOBILENETWORK_CSTATE_0513
     * @tc.desc   invalid input 111 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0513', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0513 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(111 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0513 end');
    })

    /**
     * @tc.name   testCState0514
     * @tc.number SUB_MOBILENETWORK_CSTATE_0514
     * @tc.desc   invalid input 112 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0514', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0514 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(112 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0514 end');
    })

    /**
     * @tc.name   testCState0515
     * @tc.number SUB_MOBILENETWORK_CSTATE_0515
     * @tc.desc   invalid input 113 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0515', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0515 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(113 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0515 end');
    })

    /**
     * @tc.name   testCState0516
     * @tc.number SUB_MOBILENETWORK_CSTATE_0516
     * @tc.desc   invalid input 114 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0516', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0516 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(114 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0516 end');
    })

    /**
     * @tc.name   testCState0517
     * @tc.number SUB_MOBILENETWORK_CSTATE_0517
     * @tc.desc   invalid input 115 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0517', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0517 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(115 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0517 end');
    })

    /**
     * @tc.name   testCState0518
     * @tc.number SUB_MOBILENETWORK_CSTATE_0518
     * @tc.desc   invalid input 116 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0518', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0518 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(116 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0518 end');
    })

    /**
     * @tc.name   testCState0519
     * @tc.number SUB_MOBILENETWORK_CSTATE_0519
     * @tc.desc   invalid input 117 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0519', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0519 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(117 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0519 end');
    })

    /**
     * @tc.name   testCState0520
     * @tc.number SUB_MOBILENETWORK_CSTATE_0520
     * @tc.desc   invalid input 118 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0520 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(118 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0520 end');
    })

    /**
     * @tc.name   testCState0521
     * @tc.number SUB_MOBILENETWORK_CSTATE_0521
     * @tc.desc   invalid input 119 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0521', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0521 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(119 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0521 end');
    })

    /**
     * @tc.name   testCState0522
     * @tc.number SUB_MOBILENETWORK_CSTATE_0522
     * @tc.desc   invalid input 120 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0522', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0522 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(120 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0522 end');
    })

    /**
     * @tc.name   testCState0523
     * @tc.number SUB_MOBILENETWORK_CSTATE_0523
     * @tc.desc   invalid input 121 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0523', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0523 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(121 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0523 end');
    })

    /**
     * @tc.name   testCState0524
     * @tc.number SUB_MOBILENETWORK_CSTATE_0524
     * @tc.desc   invalid input 122 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0524', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0524 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(122 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0524 end');
    })

    /**
     * @tc.name   testCState0525
     * @tc.number SUB_MOBILENETWORK_CSTATE_0525
     * @tc.desc   invalid input 123 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0525', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0525 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(123 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0525 end');
    })

    /**
     * @tc.name   testCState0526
     * @tc.number SUB_MOBILENETWORK_CSTATE_0526
     * @tc.desc   invalid input 124 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0526', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0526 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(124 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0526 end');
    })

    /**
     * @tc.name   testCState0527
     * @tc.number SUB_MOBILENETWORK_CSTATE_0527
     * @tc.desc   invalid input 125 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0527', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0527 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(125 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0527 end');
    })

    /**
     * @tc.name   testCState0528
     * @tc.number SUB_MOBILENETWORK_CSTATE_0528
     * @tc.desc   invalid input 126 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0528', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0528 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(126 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0528 end');
    })

    /**
     * @tc.name   testCState0529
     * @tc.number SUB_MOBILENETWORK_CSTATE_0529
     * @tc.desc   invalid input 127 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0529', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0529 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(127 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0529 end');
    })

    /**
     * @tc.name   testCState0530
     * @tc.number SUB_MOBILENETWORK_CSTATE_0530
     * @tc.desc   invalid input 128 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0530 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(128 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0530 end');
    })

    /**
     * @tc.name   testCState0531
     * @tc.number SUB_MOBILENETWORK_CSTATE_0531
     * @tc.desc   invalid input 129 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0531', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0531 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(129 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0531 end');
    })

    /**
     * @tc.name   testCState0532
     * @tc.number SUB_MOBILENETWORK_CSTATE_0532
     * @tc.desc   invalid input 130 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0532', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0532 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(130 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0532 end');
    })

    /**
     * @tc.name   testCState0533
     * @tc.number SUB_MOBILENETWORK_CSTATE_0533
     * @tc.desc   invalid input 131 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0533', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0533 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(131 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0533 end');
    })

    /**
     * @tc.name   testCState0534
     * @tc.number SUB_MOBILENETWORK_CSTATE_0534
     * @tc.desc   invalid input 132 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0534', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0534 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(132 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0534 end');
    })

    /**
     * @tc.name   testCState0535
     * @tc.number SUB_MOBILENETWORK_CSTATE_0535
     * @tc.desc   invalid input 133 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0535', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0535 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(133 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0535 end');
    })

    /**
     * @tc.name   testCState0536
     * @tc.number SUB_MOBILENETWORK_CSTATE_0536
     * @tc.desc   invalid input 134 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0536', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0536 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(134 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0536 end');
    })

    /**
     * @tc.name   testCState0537
     * @tc.number SUB_MOBILENETWORK_CSTATE_0537
     * @tc.desc   invalid input 135 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0537', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0537 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(135 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0537 end');
    })

    /**
     * @tc.name   testCState0538
     * @tc.number SUB_MOBILENETWORK_CSTATE_0538
     * @tc.desc   invalid input 136 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0538', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0538 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(136 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0538 end');
    })

    /**
     * @tc.name   testCState0539
     * @tc.number SUB_MOBILENETWORK_CSTATE_0539
     * @tc.desc   invalid input 137 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0539', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0539 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(137 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0539 end');
    })

    /**
     * @tc.name   testCState0540
     * @tc.number SUB_MOBILENETWORK_CSTATE_0540
     * @tc.desc   invalid input 138 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0540 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(138 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0540 end');
    })

    /**
     * @tc.name   testCState0541
     * @tc.number SUB_MOBILENETWORK_CSTATE_0541
     * @tc.desc   invalid input 139 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0541', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0541 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(139 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0541 end');
    })

    /**
     * @tc.name   testCState0542
     * @tc.number SUB_MOBILENETWORK_CSTATE_0542
     * @tc.desc   invalid input 140 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0542', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0542 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(140 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0542 end');
    })

    /**
     * @tc.name   testCState0543
     * @tc.number SUB_MOBILENETWORK_CSTATE_0543
     * @tc.desc   invalid input 141 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0543', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0543 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(141 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0543 end');
    })

    /**
     * @tc.name   testCState0544
     * @tc.number SUB_MOBILENETWORK_CSTATE_0544
     * @tc.desc   invalid input 142 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0544', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0544 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(142 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0544 end');
    })

    /**
     * @tc.name   testCState0545
     * @tc.number SUB_MOBILENETWORK_CSTATE_0545
     * @tc.desc   invalid input 143 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0545', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0545 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(143 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0545 end');
    })

    /**
     * @tc.name   testCState0546
     * @tc.number SUB_MOBILENETWORK_CSTATE_0546
     * @tc.desc   invalid input 144 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0546', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0546 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(144 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0546 end');
    })

    /**
     * @tc.name   testCState0547
     * @tc.number SUB_MOBILENETWORK_CSTATE_0547
     * @tc.desc   invalid input 145 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0547', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0547 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(145 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0547 end');
    })

    /**
     * @tc.name   testCState0548
     * @tc.number SUB_MOBILENETWORK_CSTATE_0548
     * @tc.desc   invalid input 146 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0548', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0548 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(146 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0548 end');
    })

    /**
     * @tc.name   testCState0549
     * @tc.number SUB_MOBILENETWORK_CSTATE_0549
     * @tc.desc   invalid input 147 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0549', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0549 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(147 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0549 end');
    })

    /**
     * @tc.name   testCState0550
     * @tc.number SUB_MOBILENETWORK_CSTATE_0550
     * @tc.desc   invalid input 148 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0550 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(148 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0550 end');
    })

    /**
     * @tc.name   testCState0551
     * @tc.number SUB_MOBILENETWORK_CSTATE_0551
     * @tc.desc   invalid input 149 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0551', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0551 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(149 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0551 end');
    })

    /**
     * @tc.name   testCState0552
     * @tc.number SUB_MOBILENETWORK_CSTATE_0552
     * @tc.desc   invalid input 150 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0552', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0552 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(150 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0552 end');
    })

    /**
     * @tc.name   testCState0553
     * @tc.number SUB_MOBILENETWORK_CSTATE_0553
     * @tc.desc   invalid input 151 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0553', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0553 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(151 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0553 end');
    })

    /**
     * @tc.name   testCState0554
     * @tc.number SUB_MOBILENETWORK_CSTATE_0554
     * @tc.desc   invalid input 152 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0554', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0554 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(152 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0554 end');
    })

    /**
     * @tc.name   testCState0555
     * @tc.number SUB_MOBILENETWORK_CSTATE_0555
     * @tc.desc   invalid input 153 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0555', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0555 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(153 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0555 end');
    })

    /**
     * @tc.name   testCState0556
     * @tc.number SUB_MOBILENETWORK_CSTATE_0556
     * @tc.desc   invalid input 154 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0556', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0556 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(154 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0556 end');
    })

  })
}
