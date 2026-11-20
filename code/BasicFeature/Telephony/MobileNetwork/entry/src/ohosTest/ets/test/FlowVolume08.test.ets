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
const LOG_TAG: string = '[Sample_MobileNetwork_FlowVolume08]';

export default function flowVolume08Test() {
  describe('FlowVolume08Test', () => {

    /**
     * @tc.name   testFlow0482
     * @tc.number SUB_MOBILENETWORK_FLOW_0482
     * @tc.desc   invalid input 80 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0482', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0482 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(80 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0482 end');
    })

    /**
     * @tc.name   testFlow0483
     * @tc.number SUB_MOBILENETWORK_FLOW_0483
     * @tc.desc   invalid input 81 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0483', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0483 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(81 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0483 end');
    })

    /**
     * @tc.name   testFlow0484
     * @tc.number SUB_MOBILENETWORK_FLOW_0484
     * @tc.desc   invalid input 82 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0484', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0484 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(82 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0484 end');
    })

    /**
     * @tc.name   testFlow0485
     * @tc.number SUB_MOBILENETWORK_FLOW_0485
     * @tc.desc   invalid input 83 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0485', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0485 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(83 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0485 end');
    })

    /**
     * @tc.name   testFlow0486
     * @tc.number SUB_MOBILENETWORK_FLOW_0486
     * @tc.desc   invalid input 84 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0486', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0486 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(84 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0486 end');
    })

    /**
     * @tc.name   testFlow0487
     * @tc.number SUB_MOBILENETWORK_FLOW_0487
     * @tc.desc   invalid input 85 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0487', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0487 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(85 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0487 end');
    })

    /**
     * @tc.name   testFlow0488
     * @tc.number SUB_MOBILENETWORK_FLOW_0488
     * @tc.desc   invalid input 86 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0488', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0488 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(86 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0488 end');
    })

    /**
     * @tc.name   testFlow0489
     * @tc.number SUB_MOBILENETWORK_FLOW_0489
     * @tc.desc   invalid input 87 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0489', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0489 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(87 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0489 end');
    })

    /**
     * @tc.name   testFlow0490
     * @tc.number SUB_MOBILENETWORK_FLOW_0490
     * @tc.desc   invalid input 88 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0490 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(88 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0490 end');
    })

    /**
     * @tc.name   testFlow0491
     * @tc.number SUB_MOBILENETWORK_FLOW_0491
     * @tc.desc   invalid input 89 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0491', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0491 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(89 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0491 end');
    })

    /**
     * @tc.name   testFlow0492
     * @tc.number SUB_MOBILENETWORK_FLOW_0492
     * @tc.desc   invalid input 90 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0492', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0492 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(90 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0492 end');
    })

    /**
     * @tc.name   testFlow0493
     * @tc.number SUB_MOBILENETWORK_FLOW_0493
     * @tc.desc   invalid input 91 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0493', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0493 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(91 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0493 end');
    })

    /**
     * @tc.name   testFlow0494
     * @tc.number SUB_MOBILENETWORK_FLOW_0494
     * @tc.desc   invalid input 92 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0494', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0494 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(92 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0494 end');
    })

    /**
     * @tc.name   testFlow0495
     * @tc.number SUB_MOBILENETWORK_FLOW_0495
     * @tc.desc   invalid input 93 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0495', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0495 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(93 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0495 end');
    })

    /**
     * @tc.name   testFlow0496
     * @tc.number SUB_MOBILENETWORK_FLOW_0496
     * @tc.desc   invalid input 94 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0496', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0496 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(94 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0496 end');
    })

    /**
     * @tc.name   testFlow0497
     * @tc.number SUB_MOBILENETWORK_FLOW_0497
     * @tc.desc   invalid input 95 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0497', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0497 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(95 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0497 end');
    })

    /**
     * @tc.name   testFlow0498
     * @tc.number SUB_MOBILENETWORK_FLOW_0498
     * @tc.desc   invalid input 96 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0498', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0498 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(96 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0498 end');
    })

    /**
     * @tc.name   testFlow0499
     * @tc.number SUB_MOBILENETWORK_FLOW_0499
     * @tc.desc   invalid input 97 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0499', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0499 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(97 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0499 end');
    })

    /**
     * @tc.name   testFlow0500
     * @tc.number SUB_MOBILENETWORK_FLOW_0500
     * @tc.desc   invalid input 98 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0500 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(98 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0500 end');
    })

    /**
     * @tc.name   testFlow0501
     * @tc.number SUB_MOBILENETWORK_FLOW_0501
     * @tc.desc   invalid input 99 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0501 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(99 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0501 end');
    })

    /**
     * @tc.name   testFlow0502
     * @tc.number SUB_MOBILENETWORK_FLOW_0502
     * @tc.desc   invalid input 100 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0502', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0502 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(100 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0502 end');
    })

    /**
     * @tc.name   testFlow0503
     * @tc.number SUB_MOBILENETWORK_FLOW_0503
     * @tc.desc   invalid input 101 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0503', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0503 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(101 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0503 end');
    })

    /**
     * @tc.name   testFlow0504
     * @tc.number SUB_MOBILENETWORK_FLOW_0504
     * @tc.desc   invalid input 102 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0504', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0504 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(102 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0504 end');
    })

    /**
     * @tc.name   testFlow0505
     * @tc.number SUB_MOBILENETWORK_FLOW_0505
     * @tc.desc   invalid input 103 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0505', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0505 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(103 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0505 end');
    })

    /**
     * @tc.name   testFlow0506
     * @tc.number SUB_MOBILENETWORK_FLOW_0506
     * @tc.desc   invalid input 104 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0506', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0506 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(104 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0506 end');
    })

    /**
     * @tc.name   testFlow0507
     * @tc.number SUB_MOBILENETWORK_FLOW_0507
     * @tc.desc   invalid input 105 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0507', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0507 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(105 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0507 end');
    })

    /**
     * @tc.name   testFlow0508
     * @tc.number SUB_MOBILENETWORK_FLOW_0508
     * @tc.desc   invalid input 106 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0508', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0508 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(106 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0508 end');
    })

    /**
     * @tc.name   testFlow0509
     * @tc.number SUB_MOBILENETWORK_FLOW_0509
     * @tc.desc   invalid input 107 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0509', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0509 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(107 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0509 end');
    })

    /**
     * @tc.name   testFlow0510
     * @tc.number SUB_MOBILENETWORK_FLOW_0510
     * @tc.desc   invalid input 108 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0510 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(108 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0510 end');
    })

    /**
     * @tc.name   testFlow0511
     * @tc.number SUB_MOBILENETWORK_FLOW_0511
     * @tc.desc   invalid input 109 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0511', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0511 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(109 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0511 end');
    })

    /**
     * @tc.name   testFlow0512
     * @tc.number SUB_MOBILENETWORK_FLOW_0512
     * @tc.desc   invalid input 110 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0512', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0512 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(110 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0512 end');
    })

    /**
     * @tc.name   testFlow0513
     * @tc.number SUB_MOBILENETWORK_FLOW_0513
     * @tc.desc   invalid input 111 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0513', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0513 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(111 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0513 end');
    })

    /**
     * @tc.name   testFlow0514
     * @tc.number SUB_MOBILENETWORK_FLOW_0514
     * @tc.desc   invalid input 112 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0514', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0514 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(112 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0514 end');
    })

    /**
     * @tc.name   testFlow0515
     * @tc.number SUB_MOBILENETWORK_FLOW_0515
     * @tc.desc   invalid input 113 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0515', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0515 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(113 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0515 end');
    })

    /**
     * @tc.name   testFlow0516
     * @tc.number SUB_MOBILENETWORK_FLOW_0516
     * @tc.desc   invalid input 114 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0516', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0516 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(114 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0516 end');
    })

    /**
     * @tc.name   testFlow0517
     * @tc.number SUB_MOBILENETWORK_FLOW_0517
     * @tc.desc   invalid input 115 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0517', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0517 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(115 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0517 end');
    })

    /**
     * @tc.name   testFlow0518
     * @tc.number SUB_MOBILENETWORK_FLOW_0518
     * @tc.desc   invalid input 116 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0518', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0518 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(116 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0518 end');
    })

    /**
     * @tc.name   testFlow0519
     * @tc.number SUB_MOBILENETWORK_FLOW_0519
     * @tc.desc   invalid input 117 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0519', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0519 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(117 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0519 end');
    })

    /**
     * @tc.name   testFlow0520
     * @tc.number SUB_MOBILENETWORK_FLOW_0520
     * @tc.desc   invalid input 118 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0520 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(118 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0520 end');
    })

    /**
     * @tc.name   testFlow0521
     * @tc.number SUB_MOBILENETWORK_FLOW_0521
     * @tc.desc   invalid input 119 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0521', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0521 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(119 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0521 end');
    })

    /**
     * @tc.name   testFlow0522
     * @tc.number SUB_MOBILENETWORK_FLOW_0522
     * @tc.desc   invalid input 120 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0522', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0522 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(120 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0522 end');
    })

    /**
     * @tc.name   testFlow0523
     * @tc.number SUB_MOBILENETWORK_FLOW_0523
     * @tc.desc   invalid input 121 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0523', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0523 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(121 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0523 end');
    })

    /**
     * @tc.name   testFlow0524
     * @tc.number SUB_MOBILENETWORK_FLOW_0524
     * @tc.desc   invalid input 122 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0524', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0524 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(122 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0524 end');
    })

    /**
     * @tc.name   testFlow0525
     * @tc.number SUB_MOBILENETWORK_FLOW_0525
     * @tc.desc   invalid input 123 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0525', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0525 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(123 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0525 end');
    })

    /**
     * @tc.name   testFlow0526
     * @tc.number SUB_MOBILENETWORK_FLOW_0526
     * @tc.desc   invalid input 124 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0526', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0526 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(124 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0526 end');
    })

    /**
     * @tc.name   testFlow0527
     * @tc.number SUB_MOBILENETWORK_FLOW_0527
     * @tc.desc   invalid input 125 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0527', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0527 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(125 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0527 end');
    })

    /**
     * @tc.name   testFlow0528
     * @tc.number SUB_MOBILENETWORK_FLOW_0528
     * @tc.desc   invalid input 126 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0528', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0528 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(126 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0528 end');
    })

    /**
     * @tc.name   testFlow0529
     * @tc.number SUB_MOBILENETWORK_FLOW_0529
     * @tc.desc   invalid input 127 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0529', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0529 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(127 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0529 end');
    })

    /**
     * @tc.name   testFlow0530
     * @tc.number SUB_MOBILENETWORK_FLOW_0530
     * @tc.desc   invalid input 128 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0530 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(128 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0530 end');
    })

    /**
     * @tc.name   testFlow0531
     * @tc.number SUB_MOBILENETWORK_FLOW_0531
     * @tc.desc   invalid input 129 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0531', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0531 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(129 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0531 end');
    })

    /**
     * @tc.name   testFlow0532
     * @tc.number SUB_MOBILENETWORK_FLOW_0532
     * @tc.desc   invalid input 130 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0532', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0532 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(130 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0532 end');
    })

    /**
     * @tc.name   testFlow0533
     * @tc.number SUB_MOBILENETWORK_FLOW_0533
     * @tc.desc   invalid input 131 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0533', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0533 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(131 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0533 end');
    })

    /**
     * @tc.name   testFlow0534
     * @tc.number SUB_MOBILENETWORK_FLOW_0534
     * @tc.desc   invalid input 132 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0534', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0534 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(132 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0534 end');
    })

    /**
     * @tc.name   testFlow0535
     * @tc.number SUB_MOBILENETWORK_FLOW_0535
     * @tc.desc   invalid input 133 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0535', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0535 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(133 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0535 end');
    })

    /**
     * @tc.name   testFlow0536
     * @tc.number SUB_MOBILENETWORK_FLOW_0536
     * @tc.desc   invalid input 134 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0536', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0536 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(134 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0536 end');
    })

    /**
     * @tc.name   testFlow0537
     * @tc.number SUB_MOBILENETWORK_FLOW_0537
     * @tc.desc   invalid input 135 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0537', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0537 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(135 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0537 end');
    })

    /**
     * @tc.name   testFlow0538
     * @tc.number SUB_MOBILENETWORK_FLOW_0538
     * @tc.desc   invalid input 136 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0538', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0538 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(136 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0538 end');
    })

    /**
     * @tc.name   testFlow0539
     * @tc.number SUB_MOBILENETWORK_FLOW_0539
     * @tc.desc   invalid input 137 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0539', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0539 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(137 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0539 end');
    })

    /**
     * @tc.name   testFlow0540
     * @tc.number SUB_MOBILENETWORK_FLOW_0540
     * @tc.desc   invalid input 138 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0540 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(138 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0540 end');
    })

    /**
     * @tc.name   testFlow0541
     * @tc.number SUB_MOBILENETWORK_FLOW_0541
     * @tc.desc   invalid input 139 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0541', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0541 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(139 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0541 end');
    })

    /**
     * @tc.name   testFlow0542
     * @tc.number SUB_MOBILENETWORK_FLOW_0542
     * @tc.desc   invalid input 140 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0542', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0542 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(140 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0542 end');
    })

    /**
     * @tc.name   testFlow0543
     * @tc.number SUB_MOBILENETWORK_FLOW_0543
     * @tc.desc   invalid input 141 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0543', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0543 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(141 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0543 end');
    })

    /**
     * @tc.name   testFlow0544
     * @tc.number SUB_MOBILENETWORK_FLOW_0544
     * @tc.desc   invalid input 142 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0544', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0544 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(142 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0544 end');
    })

    /**
     * @tc.name   testFlow0545
     * @tc.number SUB_MOBILENETWORK_FLOW_0545
     * @tc.desc   invalid input 143 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0545', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0545 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(143 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0545 end');
    })

    /**
     * @tc.name   testFlow0546
     * @tc.number SUB_MOBILENETWORK_FLOW_0546
     * @tc.desc   invalid input 144 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0546', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0546 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(144 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0546 end');
    })

    /**
     * @tc.name   testFlow0547
     * @tc.number SUB_MOBILENETWORK_FLOW_0547
     * @tc.desc   invalid input 145 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0547', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0547 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(145 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0547 end');
    })

    /**
     * @tc.name   testFlow0548
     * @tc.number SUB_MOBILENETWORK_FLOW_0548
     * @tc.desc   invalid input 146 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0548', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0548 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(146 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0548 end');
    })

    /**
     * @tc.name   testFlow0549
     * @tc.number SUB_MOBILENETWORK_FLOW_0549
     * @tc.desc   invalid input 147 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0549', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0549 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(147 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0549 end');
    })

    /**
     * @tc.name   testFlow0550
     * @tc.number SUB_MOBILENETWORK_FLOW_0550
     * @tc.desc   invalid input 148 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0550 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(148 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0550 end');
    })

    /**
     * @tc.name   testFlow0551
     * @tc.number SUB_MOBILENETWORK_FLOW_0551
     * @tc.desc   invalid input 149 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0551', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0551 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(149 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0551 end');
    })

    /**
     * @tc.name   testFlow0552
     * @tc.number SUB_MOBILENETWORK_FLOW_0552
     * @tc.desc   invalid input 150 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0552', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0552 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(150 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0552 end');
    })

    /**
     * @tc.name   testFlow0553
     * @tc.number SUB_MOBILENETWORK_FLOW_0553
     * @tc.desc   invalid input 151 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0553', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0553 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(151 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0553 end');
    })

    /**
     * @tc.name   testFlow0554
     * @tc.number SUB_MOBILENETWORK_FLOW_0554
     * @tc.desc   invalid input 152 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0554', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0554 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(152 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0554 end');
    })

    /**
     * @tc.name   testFlow0555
     * @tc.number SUB_MOBILENETWORK_FLOW_0555
     * @tc.desc   invalid input 153 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0555', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0555 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(153 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0555 end');
    })

    /**
     * @tc.name   testFlow0556
     * @tc.number SUB_MOBILENETWORK_FLOW_0556
     * @tc.desc   invalid input 154 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0556', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0556 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(154 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0556 end');
    })

  })
}
