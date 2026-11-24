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
const LOG_TAG: string = '[Sample_MobileNetwork_FlowVolume05]';

export default function flowVolume05Test() {
  describe('FlowVolume05Test', () => {

    /**
     * @tc.name   testFlow0257
     * @tc.number SUB_MOBILENETWORK_FLOW_0257
     * @tc.desc   invalid input -150 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0257 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-150 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0257 end');
    })

    /**
     * @tc.name   testFlow0258
     * @tc.number SUB_MOBILENETWORK_FLOW_0258
     * @tc.desc   invalid input -149 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0258 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-149 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0258 end');
    })

    /**
     * @tc.name   testFlow0259
     * @tc.number SUB_MOBILENETWORK_FLOW_0259
     * @tc.desc   invalid input -148 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0259 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-148 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0259 end');
    })

    /**
     * @tc.name   testFlow0260
     * @tc.number SUB_MOBILENETWORK_FLOW_0260
     * @tc.desc   invalid input -147 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0260 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-147 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0260 end');
    })

    /**
     * @tc.name   testFlow0261
     * @tc.number SUB_MOBILENETWORK_FLOW_0261
     * @tc.desc   invalid input -146 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0261 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-146 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0261 end');
    })

    /**
     * @tc.name   testFlow0262
     * @tc.number SUB_MOBILENETWORK_FLOW_0262
     * @tc.desc   invalid input -145 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0262 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-145 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0262 end');
    })

    /**
     * @tc.name   testFlow0263
     * @tc.number SUB_MOBILENETWORK_FLOW_0263
     * @tc.desc   invalid input -144 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0263 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-144 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0263 end');
    })

    /**
     * @tc.name   testFlow0264
     * @tc.number SUB_MOBILENETWORK_FLOW_0264
     * @tc.desc   invalid input -143 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0264 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-143 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0264 end');
    })

    /**
     * @tc.name   testFlow0265
     * @tc.number SUB_MOBILENETWORK_FLOW_0265
     * @tc.desc   invalid input -142 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0265 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-142 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0265 end');
    })

    /**
     * @tc.name   testFlow0266
     * @tc.number SUB_MOBILENETWORK_FLOW_0266
     * @tc.desc   invalid input -141 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0266 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-141 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0266 end');
    })

    /**
     * @tc.name   testFlow0267
     * @tc.number SUB_MOBILENETWORK_FLOW_0267
     * @tc.desc   invalid input -140 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0267 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-140 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0267 end');
    })

    /**
     * @tc.name   testFlow0268
     * @tc.number SUB_MOBILENETWORK_FLOW_0268
     * @tc.desc   invalid input -139 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0268 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-139 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0268 end');
    })

    /**
     * @tc.name   testFlow0269
     * @tc.number SUB_MOBILENETWORK_FLOW_0269
     * @tc.desc   invalid input -138 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0269 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-138 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0269 end');
    })

    /**
     * @tc.name   testFlow0270
     * @tc.number SUB_MOBILENETWORK_FLOW_0270
     * @tc.desc   invalid input -137 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0270 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-137 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0270 end');
    })

    /**
     * @tc.name   testFlow0271
     * @tc.number SUB_MOBILENETWORK_FLOW_0271
     * @tc.desc   invalid input -136 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0271 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-136 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0271 end');
    })

    /**
     * @tc.name   testFlow0272
     * @tc.number SUB_MOBILENETWORK_FLOW_0272
     * @tc.desc   invalid input -135 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0272 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-135 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0272 end');
    })

    /**
     * @tc.name   testFlow0273
     * @tc.number SUB_MOBILENETWORK_FLOW_0273
     * @tc.desc   invalid input -134 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0273 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-134 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0273 end');
    })

    /**
     * @tc.name   testFlow0274
     * @tc.number SUB_MOBILENETWORK_FLOW_0274
     * @tc.desc   invalid input -133 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0274 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-133 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0274 end');
    })

    /**
     * @tc.name   testFlow0275
     * @tc.number SUB_MOBILENETWORK_FLOW_0275
     * @tc.desc   invalid input -132 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0275 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-132 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0275 end');
    })

    /**
     * @tc.name   testFlow0276
     * @tc.number SUB_MOBILENETWORK_FLOW_0276
     * @tc.desc   invalid input -131 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0276 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-131 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0276 end');
    })

    /**
     * @tc.name   testFlow0277
     * @tc.number SUB_MOBILENETWORK_FLOW_0277
     * @tc.desc   invalid input -130 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0277 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-130 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0277 end');
    })

    /**
     * @tc.name   testFlow0278
     * @tc.number SUB_MOBILENETWORK_FLOW_0278
     * @tc.desc   invalid input -129 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0278 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-129 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0278 end');
    })

    /**
     * @tc.name   testFlow0279
     * @tc.number SUB_MOBILENETWORK_FLOW_0279
     * @tc.desc   invalid input -128 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0279 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-128 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0279 end');
    })

    /**
     * @tc.name   testFlow0280
     * @tc.number SUB_MOBILENETWORK_FLOW_0280
     * @tc.desc   invalid input -127 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0280 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-127 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0280 end');
    })

    /**
     * @tc.name   testFlow0281
     * @tc.number SUB_MOBILENETWORK_FLOW_0281
     * @tc.desc   invalid input -126 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0281 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-126 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0281 end');
    })

    /**
     * @tc.name   testFlow0282
     * @tc.number SUB_MOBILENETWORK_FLOW_0282
     * @tc.desc   invalid input -125 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0282 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-125 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0282 end');
    })

    /**
     * @tc.name   testFlow0283
     * @tc.number SUB_MOBILENETWORK_FLOW_0283
     * @tc.desc   invalid input -124 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0283 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-124 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0283 end');
    })

    /**
     * @tc.name   testFlow0284
     * @tc.number SUB_MOBILENETWORK_FLOW_0284
     * @tc.desc   invalid input -123 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0284 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-123 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0284 end');
    })

    /**
     * @tc.name   testFlow0285
     * @tc.number SUB_MOBILENETWORK_FLOW_0285
     * @tc.desc   invalid input -122 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0285 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-122 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0285 end');
    })

    /**
     * @tc.name   testFlow0286
     * @tc.number SUB_MOBILENETWORK_FLOW_0286
     * @tc.desc   invalid input -121 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0286 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-121 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0286 end');
    })

    /**
     * @tc.name   testFlow0287
     * @tc.number SUB_MOBILENETWORK_FLOW_0287
     * @tc.desc   invalid input -120 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0287 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-120 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0287 end');
    })

    /**
     * @tc.name   testFlow0288
     * @tc.number SUB_MOBILENETWORK_FLOW_0288
     * @tc.desc   invalid input -119 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0288 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-119 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0288 end');
    })

    /**
     * @tc.name   testFlow0289
     * @tc.number SUB_MOBILENETWORK_FLOW_0289
     * @tc.desc   invalid input -118 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0289 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-118 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0289 end');
    })

    /**
     * @tc.name   testFlow0290
     * @tc.number SUB_MOBILENETWORK_FLOW_0290
     * @tc.desc   invalid input -117 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0290 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-117 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0290 end');
    })

    /**
     * @tc.name   testFlow0291
     * @tc.number SUB_MOBILENETWORK_FLOW_0291
     * @tc.desc   invalid input -116 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0291 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-116 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0291 end');
    })

    /**
     * @tc.name   testFlow0292
     * @tc.number SUB_MOBILENETWORK_FLOW_0292
     * @tc.desc   invalid input -115 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0292 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-115 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0292 end');
    })

    /**
     * @tc.name   testFlow0293
     * @tc.number SUB_MOBILENETWORK_FLOW_0293
     * @tc.desc   invalid input -114 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0293 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-114 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0293 end');
    })

    /**
     * @tc.name   testFlow0294
     * @tc.number SUB_MOBILENETWORK_FLOW_0294
     * @tc.desc   invalid input -113 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0294 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-113 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0294 end');
    })

    /**
     * @tc.name   testFlow0295
     * @tc.number SUB_MOBILENETWORK_FLOW_0295
     * @tc.desc   invalid input -112 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0295 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-112 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0295 end');
    })

    /**
     * @tc.name   testFlow0296
     * @tc.number SUB_MOBILENETWORK_FLOW_0296
     * @tc.desc   invalid input -111 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0296 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-111 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0296 end');
    })

    /**
     * @tc.name   testFlow0297
     * @tc.number SUB_MOBILENETWORK_FLOW_0297
     * @tc.desc   invalid input -110 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0297 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-110 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0297 end');
    })

    /**
     * @tc.name   testFlow0298
     * @tc.number SUB_MOBILENETWORK_FLOW_0298
     * @tc.desc   invalid input -109 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0298 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-109 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0298 end');
    })

    /**
     * @tc.name   testFlow0299
     * @tc.number SUB_MOBILENETWORK_FLOW_0299
     * @tc.desc   invalid input -108 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0299 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-108 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0299 end');
    })

    /**
     * @tc.name   testFlow0300
     * @tc.number SUB_MOBILENETWORK_FLOW_0300
     * @tc.desc   invalid input -107 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0300 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-107 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0300 end');
    })

    /**
     * @tc.name   testFlow0301
     * @tc.number SUB_MOBILENETWORK_FLOW_0301
     * @tc.desc   invalid input -106 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0301 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-106 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0301 end');
    })

    /**
     * @tc.name   testFlow0302
     * @tc.number SUB_MOBILENETWORK_FLOW_0302
     * @tc.desc   invalid input -105 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0302 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-105 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0302 end');
    })

    /**
     * @tc.name   testFlow0303
     * @tc.number SUB_MOBILENETWORK_FLOW_0303
     * @tc.desc   invalid input -104 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0303 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-104 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0303 end');
    })

    /**
     * @tc.name   testFlow0304
     * @tc.number SUB_MOBILENETWORK_FLOW_0304
     * @tc.desc   invalid input -103 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0304 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-103 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0304 end');
    })

    /**
     * @tc.name   testFlow0305
     * @tc.number SUB_MOBILENETWORK_FLOW_0305
     * @tc.desc   invalid input -102 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0305 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-102 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0305 end');
    })

    /**
     * @tc.name   testFlow0306
     * @tc.number SUB_MOBILENETWORK_FLOW_0306
     * @tc.desc   invalid input -101 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0306 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-101 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0306 end');
    })

    /**
     * @tc.name   testFlow0307
     * @tc.number SUB_MOBILENETWORK_FLOW_0307
     * @tc.desc   invalid input -100 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0307 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-100 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0307 end');
    })

    /**
     * @tc.name   testFlow0308
     * @tc.number SUB_MOBILENETWORK_FLOW_0308
     * @tc.desc   invalid input -99 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0308 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-99 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0308 end');
    })

    /**
     * @tc.name   testFlow0309
     * @tc.number SUB_MOBILENETWORK_FLOW_0309
     * @tc.desc   invalid input -98 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0309 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-98 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0309 end');
    })

    /**
     * @tc.name   testFlow0310
     * @tc.number SUB_MOBILENETWORK_FLOW_0310
     * @tc.desc   invalid input -97 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0310 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-97 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0310 end');
    })

    /**
     * @tc.name   testFlow0311
     * @tc.number SUB_MOBILENETWORK_FLOW_0311
     * @tc.desc   invalid input -96 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0311 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-96 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0311 end');
    })

    /**
     * @tc.name   testFlow0312
     * @tc.number SUB_MOBILENETWORK_FLOW_0312
     * @tc.desc   invalid input -95 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0312 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-95 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0312 end');
    })

    /**
     * @tc.name   testFlow0313
     * @tc.number SUB_MOBILENETWORK_FLOW_0313
     * @tc.desc   invalid input -94 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0313 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-94 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0313 end');
    })

    /**
     * @tc.name   testFlow0314
     * @tc.number SUB_MOBILENETWORK_FLOW_0314
     * @tc.desc   invalid input -93 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0314', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0314 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-93 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0314 end');
    })

    /**
     * @tc.name   testFlow0315
     * @tc.number SUB_MOBILENETWORK_FLOW_0315
     * @tc.desc   invalid input -92 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0315', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0315 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-92 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0315 end');
    })

    /**
     * @tc.name   testFlow0316
     * @tc.number SUB_MOBILENETWORK_FLOW_0316
     * @tc.desc   invalid input -91 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0316', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0316 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-91 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0316 end');
    })

    /**
     * @tc.name   testFlow0317
     * @tc.number SUB_MOBILENETWORK_FLOW_0317
     * @tc.desc   invalid input -90 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0317', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0317 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-90 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0317 end');
    })

    /**
     * @tc.name   testFlow0318
     * @tc.number SUB_MOBILENETWORK_FLOW_0318
     * @tc.desc   invalid input -89 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0318', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0318 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-89 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0318 end');
    })

    /**
     * @tc.name   testFlow0319
     * @tc.number SUB_MOBILENETWORK_FLOW_0319
     * @tc.desc   invalid input -88 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0319', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0319 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-88 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0319 end');
    })

    /**
     * @tc.name   testFlow0320
     * @tc.number SUB_MOBILENETWORK_FLOW_0320
     * @tc.desc   invalid input -87 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0320 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-87 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0320 end');
    })

    /**
     * @tc.name   testFlow0321
     * @tc.number SUB_MOBILENETWORK_FLOW_0321
     * @tc.desc   invalid input -86 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0321', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0321 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-86 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0321 end');
    })

    /**
     * @tc.name   testFlow0322
     * @tc.number SUB_MOBILENETWORK_FLOW_0322
     * @tc.desc   invalid input -85 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0322', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0322 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-85 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0322 end');
    })

    /**
     * @tc.name   testFlow0323
     * @tc.number SUB_MOBILENETWORK_FLOW_0323
     * @tc.desc   invalid input -84 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0323', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0323 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-84 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0323 end');
    })

    /**
     * @tc.name   testFlow0324
     * @tc.number SUB_MOBILENETWORK_FLOW_0324
     * @tc.desc   invalid input -83 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0324', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0324 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-83 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0324 end');
    })

    /**
     * @tc.name   testFlow0325
     * @tc.number SUB_MOBILENETWORK_FLOW_0325
     * @tc.desc   invalid input -82 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0325', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0325 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-82 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0325 end');
    })

    /**
     * @tc.name   testFlow0326
     * @tc.number SUB_MOBILENETWORK_FLOW_0326
     * @tc.desc   invalid input -81 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0326', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0326 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-81 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0326 end');
    })

    /**
     * @tc.name   testFlow0327
     * @tc.number SUB_MOBILENETWORK_FLOW_0327
     * @tc.desc   invalid input -80 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0327', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0327 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-80 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0327 end');
    })

    /**
     * @tc.name   testFlow0328
     * @tc.number SUB_MOBILENETWORK_FLOW_0328
     * @tc.desc   invalid input -79 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0328', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0328 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-79 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0328 end');
    })

    /**
     * @tc.name   testFlow0329
     * @tc.number SUB_MOBILENETWORK_FLOW_0329
     * @tc.desc   invalid input -78 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0329', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0329 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-78 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0329 end');
    })

    /**
     * @tc.name   testFlow0330
     * @tc.number SUB_MOBILENETWORK_FLOW_0330
     * @tc.desc   invalid input -77 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0330 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-77 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0330 end');
    })

    /**
     * @tc.name   testFlow0331
     * @tc.number SUB_MOBILENETWORK_FLOW_0331
     * @tc.desc   invalid input -76 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0331', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0331 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-76 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0331 end');
    })

  })
}
