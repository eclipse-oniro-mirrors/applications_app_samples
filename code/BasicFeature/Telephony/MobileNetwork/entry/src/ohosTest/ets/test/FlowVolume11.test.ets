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
const LOG_TAG: string = '[Sample_MobileNetwork_FlowVolume11]';

export default function flowVolume11Test() {
  describe('FlowVolume11Test', () => {

    /**
     * @tc.name   testFlow0707
     * @tc.number SUB_MOBILENETWORK_FLOW_0707
     * @tc.desc   invalid input 305 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0707', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0707 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(305 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0707 end');
    })

    /**
     * @tc.name   testFlow0708
     * @tc.number SUB_MOBILENETWORK_FLOW_0708
     * @tc.desc   invalid input 306 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0708', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0708 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(306 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0708 end');
    })

    /**
     * @tc.name   testFlow0709
     * @tc.number SUB_MOBILENETWORK_FLOW_0709
     * @tc.desc   invalid input 307 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0709', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0709 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(307 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0709 end');
    })

    /**
     * @tc.name   testFlow0710
     * @tc.number SUB_MOBILENETWORK_FLOW_0710
     * @tc.desc   invalid input 308 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0710 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(308 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0710 end');
    })

    /**
     * @tc.name   testFlow0711
     * @tc.number SUB_MOBILENETWORK_FLOW_0711
     * @tc.desc   invalid input 309 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0711', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0711 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(309 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0711 end');
    })

    /**
     * @tc.name   testFlow0712
     * @tc.number SUB_MOBILENETWORK_FLOW_0712
     * @tc.desc   invalid input 310 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0712', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0712 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(310 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0712 end');
    })

    /**
     * @tc.name   testFlow0713
     * @tc.number SUB_MOBILENETWORK_FLOW_0713
     * @tc.desc   invalid input 311 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0713', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0713 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(311 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0713 end');
    })

    /**
     * @tc.name   testFlow0714
     * @tc.number SUB_MOBILENETWORK_FLOW_0714
     * @tc.desc   invalid input 312 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0714', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0714 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(312 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0714 end');
    })

    /**
     * @tc.name   testFlow0715
     * @tc.number SUB_MOBILENETWORK_FLOW_0715
     * @tc.desc   invalid input 313 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0715', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0715 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(313 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0715 end');
    })

    /**
     * @tc.name   testFlow0716
     * @tc.number SUB_MOBILENETWORK_FLOW_0716
     * @tc.desc   invalid input 314 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0716', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0716 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(314 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0716 end');
    })

    /**
     * @tc.name   testFlow0717
     * @tc.number SUB_MOBILENETWORK_FLOW_0717
     * @tc.desc   invalid input 315 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0717', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0717 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(315 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0717 end');
    })

    /**
     * @tc.name   testFlow0718
     * @tc.number SUB_MOBILENETWORK_FLOW_0718
     * @tc.desc   invalid input 316 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0718', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0718 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(316 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0718 end');
    })

    /**
     * @tc.name   testFlow0719
     * @tc.number SUB_MOBILENETWORK_FLOW_0719
     * @tc.desc   invalid input 317 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0719', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0719 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(317 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0719 end');
    })

    /**
     * @tc.name   testFlow0720
     * @tc.number SUB_MOBILENETWORK_FLOW_0720
     * @tc.desc   invalid input 318 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0720 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(318 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0720 end');
    })

    /**
     * @tc.name   testFlow0721
     * @tc.number SUB_MOBILENETWORK_FLOW_0721
     * @tc.desc   invalid input 319 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0721', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0721 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(319 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0721 end');
    })

    /**
     * @tc.name   testFlow0722
     * @tc.number SUB_MOBILENETWORK_FLOW_0722
     * @tc.desc   invalid input 320 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0722', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0722 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(320 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0722 end');
    })

    /**
     * @tc.name   testFlow0723
     * @tc.number SUB_MOBILENETWORK_FLOW_0723
     * @tc.desc   invalid input 321 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0723', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0723 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(321 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0723 end');
    })

    /**
     * @tc.name   testFlow0724
     * @tc.number SUB_MOBILENETWORK_FLOW_0724
     * @tc.desc   invalid input 322 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0724', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0724 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(322 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0724 end');
    })

    /**
     * @tc.name   testFlow0725
     * @tc.number SUB_MOBILENETWORK_FLOW_0725
     * @tc.desc   invalid input 323 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0725', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0725 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(323 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0725 end');
    })

    /**
     * @tc.name   testFlow0726
     * @tc.number SUB_MOBILENETWORK_FLOW_0726
     * @tc.desc   invalid input 324 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0726', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0726 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(324 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0726 end');
    })

    /**
     * @tc.name   testFlow0727
     * @tc.number SUB_MOBILENETWORK_FLOW_0727
     * @tc.desc   invalid input 325 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0727', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0727 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(325 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0727 end');
    })

    /**
     * @tc.name   testFlow0728
     * @tc.number SUB_MOBILENETWORK_FLOW_0728
     * @tc.desc   invalid input 326 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0728', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0728 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(326 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0728 end');
    })

    /**
     * @tc.name   testFlow0729
     * @tc.number SUB_MOBILENETWORK_FLOW_0729
     * @tc.desc   invalid input 327 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0729', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0729 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(327 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0729 end');
    })

    /**
     * @tc.name   testFlow0730
     * @tc.number SUB_MOBILENETWORK_FLOW_0730
     * @tc.desc   invalid input 328 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0730 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(328 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0730 end');
    })

    /**
     * @tc.name   testFlow0731
     * @tc.number SUB_MOBILENETWORK_FLOW_0731
     * @tc.desc   invalid input 329 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0731', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0731 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(329 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0731 end');
    })

    /**
     * @tc.name   testFlow0732
     * @tc.number SUB_MOBILENETWORK_FLOW_0732
     * @tc.desc   invalid input 330 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0732', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0732 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(330 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0732 end');
    })

    /**
     * @tc.name   testFlow0733
     * @tc.number SUB_MOBILENETWORK_FLOW_0733
     * @tc.desc   invalid input 331 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0733', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0733 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(331 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0733 end');
    })

    /**
     * @tc.name   testFlow0734
     * @tc.number SUB_MOBILENETWORK_FLOW_0734
     * @tc.desc   invalid input 332 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0734', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0734 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(332 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0734 end');
    })

    /**
     * @tc.name   testFlow0735
     * @tc.number SUB_MOBILENETWORK_FLOW_0735
     * @tc.desc   invalid input 333 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0735', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0735 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(333 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0735 end');
    })

    /**
     * @tc.name   testFlow0736
     * @tc.number SUB_MOBILENETWORK_FLOW_0736
     * @tc.desc   invalid input 334 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0736', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0736 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(334 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0736 end');
    })

    /**
     * @tc.name   testFlow0737
     * @tc.number SUB_MOBILENETWORK_FLOW_0737
     * @tc.desc   invalid input 335 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0737', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0737 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(335 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0737 end');
    })

    /**
     * @tc.name   testFlow0738
     * @tc.number SUB_MOBILENETWORK_FLOW_0738
     * @tc.desc   invalid input 336 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0738', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0738 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(336 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0738 end');
    })

    /**
     * @tc.name   testFlow0739
     * @tc.number SUB_MOBILENETWORK_FLOW_0739
     * @tc.desc   invalid input 337 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0739', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0739 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(337 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0739 end');
    })

    /**
     * @tc.name   testFlow0740
     * @tc.number SUB_MOBILENETWORK_FLOW_0740
     * @tc.desc   invalid input 338 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0740 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(338 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0740 end');
    })

    /**
     * @tc.name   testFlow0741
     * @tc.number SUB_MOBILENETWORK_FLOW_0741
     * @tc.desc   invalid input 339 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0741', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0741 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(339 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0741 end');
    })

    /**
     * @tc.name   testFlow0742
     * @tc.number SUB_MOBILENETWORK_FLOW_0742
     * @tc.desc   invalid input 340 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0742', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0742 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(340 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0742 end');
    })

    /**
     * @tc.name   testFlow0743
     * @tc.number SUB_MOBILENETWORK_FLOW_0743
     * @tc.desc   invalid input 341 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0743', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0743 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(341 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0743 end');
    })

    /**
     * @tc.name   testFlow0744
     * @tc.number SUB_MOBILENETWORK_FLOW_0744
     * @tc.desc   invalid input 342 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0744', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0744 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(342 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0744 end');
    })

    /**
     * @tc.name   testFlow0745
     * @tc.number SUB_MOBILENETWORK_FLOW_0745
     * @tc.desc   invalid input 343 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0745', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0745 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(343 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0745 end');
    })

    /**
     * @tc.name   testFlow0746
     * @tc.number SUB_MOBILENETWORK_FLOW_0746
     * @tc.desc   invalid input 344 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0746', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0746 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(344 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0746 end');
    })

    /**
     * @tc.name   testFlow0747
     * @tc.number SUB_MOBILENETWORK_FLOW_0747
     * @tc.desc   invalid input 345 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0747', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0747 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(345 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0747 end');
    })

    /**
     * @tc.name   testFlow0748
     * @tc.number SUB_MOBILENETWORK_FLOW_0748
     * @tc.desc   invalid input 346 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0748', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0748 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(346 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0748 end');
    })

    /**
     * @tc.name   testFlow0749
     * @tc.number SUB_MOBILENETWORK_FLOW_0749
     * @tc.desc   invalid input 347 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0749', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0749 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(347 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0749 end');
    })

    /**
     * @tc.name   testFlow0750
     * @tc.number SUB_MOBILENETWORK_FLOW_0750
     * @tc.desc   invalid input 348 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0750 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(348 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0750 end');
    })

    /**
     * @tc.name   testFlow0751
     * @tc.number SUB_MOBILENETWORK_FLOW_0751
     * @tc.desc   invalid input 349 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0751', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0751 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(349 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0751 end');
    })

    /**
     * @tc.name   testFlow0752
     * @tc.number SUB_MOBILENETWORK_FLOW_0752
     * @tc.desc   invalid input 350 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0752', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0752 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(350 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0752 end');
    })

    /**
     * @tc.name   testFlow0753
     * @tc.number SUB_MOBILENETWORK_FLOW_0753
     * @tc.desc   invalid input 351 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0753', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0753 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(351 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0753 end');
    })

    /**
     * @tc.name   testFlow0754
     * @tc.number SUB_MOBILENETWORK_FLOW_0754
     * @tc.desc   invalid input 352 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0754', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0754 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(352 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0754 end');
    })

    /**
     * @tc.name   testFlow0755
     * @tc.number SUB_MOBILENETWORK_FLOW_0755
     * @tc.desc   invalid input 353 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0755', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0755 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(353 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0755 end');
    })

    /**
     * @tc.name   testFlow0756
     * @tc.number SUB_MOBILENETWORK_FLOW_0756
     * @tc.desc   invalid input 354 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0756', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0756 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(354 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0756 end');
    })

    /**
     * @tc.name   testFlow0757
     * @tc.number SUB_MOBILENETWORK_FLOW_0757
     * @tc.desc   invalid input 355 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0757', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0757 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(355 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0757 end');
    })

    /**
     * @tc.name   testFlow0758
     * @tc.number SUB_MOBILENETWORK_FLOW_0758
     * @tc.desc   invalid input 356 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0758', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0758 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(356 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0758 end');
    })

    /**
     * @tc.name   testFlow0759
     * @tc.number SUB_MOBILENETWORK_FLOW_0759
     * @tc.desc   invalid input 357 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0759', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0759 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(357 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0759 end');
    })

    /**
     * @tc.name   testFlow0760
     * @tc.number SUB_MOBILENETWORK_FLOW_0760
     * @tc.desc   invalid input 358 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0760 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(358 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0760 end');
    })

    /**
     * @tc.name   testFlow0761
     * @tc.number SUB_MOBILENETWORK_FLOW_0761
     * @tc.desc   invalid input 359 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0761', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0761 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(359 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0761 end');
    })

    /**
     * @tc.name   testFlow0762
     * @tc.number SUB_MOBILENETWORK_FLOW_0762
     * @tc.desc   invalid input 360 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0762', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0762 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(360 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0762 end');
    })

    /**
     * @tc.name   testFlow0763
     * @tc.number SUB_MOBILENETWORK_FLOW_0763
     * @tc.desc   invalid input 361 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0763', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0763 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(361 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0763 end');
    })

    /**
     * @tc.name   testFlow0764
     * @tc.number SUB_MOBILENETWORK_FLOW_0764
     * @tc.desc   invalid input 362 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0764', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0764 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(362 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0764 end');
    })

    /**
     * @tc.name   testFlow0765
     * @tc.number SUB_MOBILENETWORK_FLOW_0765
     * @tc.desc   invalid input 363 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0765', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0765 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(363 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0765 end');
    })

    /**
     * @tc.name   testFlow0766
     * @tc.number SUB_MOBILENETWORK_FLOW_0766
     * @tc.desc   invalid input 364 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0766', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0766 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(364 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0766 end');
    })

    /**
     * @tc.name   testFlow0767
     * @tc.number SUB_MOBILENETWORK_FLOW_0767
     * @tc.desc   invalid input 365 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0767', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0767 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(365 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0767 end');
    })

    /**
     * @tc.name   testFlow0768
     * @tc.number SUB_MOBILENETWORK_FLOW_0768
     * @tc.desc   invalid input 366 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0768', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0768 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(366 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0768 end');
    })

    /**
     * @tc.name   testFlow0769
     * @tc.number SUB_MOBILENETWORK_FLOW_0769
     * @tc.desc   invalid input 367 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0769', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0769 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(367 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0769 end');
    })

    /**
     * @tc.name   testFlow0770
     * @tc.number SUB_MOBILENETWORK_FLOW_0770
     * @tc.desc   invalid input 368 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0770 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(368 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0770 end');
    })

    /**
     * @tc.name   testFlow0771
     * @tc.number SUB_MOBILENETWORK_FLOW_0771
     * @tc.desc   invalid input 369 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0771', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0771 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(369 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0771 end');
    })

    /**
     * @tc.name   testFlow0772
     * @tc.number SUB_MOBILENETWORK_FLOW_0772
     * @tc.desc   invalid input 370 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0772', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0772 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(370 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0772 end');
    })

    /**
     * @tc.name   testFlow0773
     * @tc.number SUB_MOBILENETWORK_FLOW_0773
     * @tc.desc   invalid input 371 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0773', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0773 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(371 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0773 end');
    })

    /**
     * @tc.name   testFlow0774
     * @tc.number SUB_MOBILENETWORK_FLOW_0774
     * @tc.desc   invalid input 372 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0774', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0774 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(372 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0774 end');
    })

    /**
     * @tc.name   testFlow0775
     * @tc.number SUB_MOBILENETWORK_FLOW_0775
     * @tc.desc   invalid input 373 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0775', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0775 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(373 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0775 end');
    })

    /**
     * @tc.name   testFlow0776
     * @tc.number SUB_MOBILENETWORK_FLOW_0776
     * @tc.desc   invalid input 374 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0776', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0776 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(374 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0776 end');
    })

    /**
     * @tc.name   testFlow0777
     * @tc.number SUB_MOBILENETWORK_FLOW_0777
     * @tc.desc   invalid input 375 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0777', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0777 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(375 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0777 end');
    })

    /**
     * @tc.name   testFlow0778
     * @tc.number SUB_MOBILENETWORK_FLOW_0778
     * @tc.desc   invalid input 376 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0778', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0778 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(376 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0778 end');
    })

    /**
     * @tc.name   testFlow0779
     * @tc.number SUB_MOBILENETWORK_FLOW_0779
     * @tc.desc   invalid input 377 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0779', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0779 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(377 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0779 end');
    })

    /**
     * @tc.name   testFlow0780
     * @tc.number SUB_MOBILENETWORK_FLOW_0780
     * @tc.desc   invalid input 378 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0780 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(378 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0780 end');
    })

    /**
     * @tc.name   testFlow0781
     * @tc.number SUB_MOBILENETWORK_FLOW_0781
     * @tc.desc   invalid input 379 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0781', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0781 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(379 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0781 end');
    })

  })
}
