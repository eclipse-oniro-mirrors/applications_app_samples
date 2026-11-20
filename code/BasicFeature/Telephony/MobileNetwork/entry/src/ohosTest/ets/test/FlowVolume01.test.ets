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
const LOG_TAG: string = '[Sample_MobileNetwork_FlowVolume01]';

export default function flowVolume01Test() {
  describe('FlowVolume01Test', () => {

    /**
     * @tc.name   testFlow0001
     * @tc.number SUB_MOBILENETWORK_FLOW_0001
     * @tc.desc   legal value data.DataFlowType.DATA_FLOW_TYPE_NONE maps to the frozen none resource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0001 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(data.DataFlowType.DATA_FLOW_TYPE_NONE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0001 end');
    })

    /**
     * @tc.name   testFlow0002
     * @tc.number SUB_MOBILENETWORK_FLOW_0002
     * @tc.desc   legal value data.DataFlowType.DATA_FLOW_TYPE_DOWN maps to the frozen down resource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0002 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(data.DataFlowType.DATA_FLOW_TYPE_DOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554449));
      expect(result.id).assertEqual(33554449);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554455));
      expect(result.id === 33554455).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0002 end');
    })

    /**
     * @tc.name   testFlow0003
     * @tc.number SUB_MOBILENETWORK_FLOW_0003
     * @tc.desc   legal value data.DataFlowType.DATA_FLOW_TYPE_UP maps to the frozen up resource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0003 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(data.DataFlowType.DATA_FLOW_TYPE_UP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554463));
      expect(result.id).assertEqual(33554463);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554455));
      expect(result.id === 33554455).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0003 end');
    })

    /**
     * @tc.name   testFlow0004
     * @tc.number SUB_MOBILENETWORK_FLOW_0004
     * @tc.desc   legal value data.DataFlowType.DATA_FLOW_TYPE_UP_DOWN maps to the frozen upDown resource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0004 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(data.DataFlowType.DATA_FLOW_TYPE_UP_DOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554464));
      expect(result.id).assertEqual(33554464);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554455));
      expect(result.id === 33554455).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0004 end');
    })

    /**
     * @tc.name   testFlow0005
     * @tc.number SUB_MOBILENETWORK_FLOW_0005
     * @tc.desc   legal value data.DataFlowType.DATA_FLOW_TYPE_DORMANT maps to the frozen dormant resource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0005 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(data.DataFlowType.DATA_FLOW_TYPE_DORMANT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554448));
      expect(result.id).assertEqual(33554448);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554455));
      expect(result.id === 33554455).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0005 end');
    })

    /**
     * @tc.name   testFlow0006
     * @tc.number SUB_MOBILENETWORK_FLOW_0006
     * @tc.desc   invalid input -1 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0006 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-1 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0006 end');
    })

    /**
     * @tc.name   testFlow0007
     * @tc.number SUB_MOBILENETWORK_FLOW_0007
     * @tc.desc   invalid input 5 as data.DataFlowType just above the last member falls into the default branch and maps
     * to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0007 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(5 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0007 end');
    })

    /**
     * @tc.name   testFlow0008
     * @tc.number SUB_MOBILENETWORK_FLOW_0008
     * @tc.desc   invalid input 6 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0008 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(6 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0008 end');
    })

    /**
     * @tc.name   testFlow0009
     * @tc.number SUB_MOBILENETWORK_FLOW_0009
     * @tc.desc   invalid input 7 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0009 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(7 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0009 end');
    })

    /**
     * @tc.name   testFlow0010
     * @tc.number SUB_MOBILENETWORK_FLOW_0010
     * @tc.desc   invalid input 255 as data.DataFlowType on the UINT8_MAX line falls into the default branch and maps to
     * none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0010 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(255 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0010 end');
    })

    /**
     * @tc.name   testFlow0011
     * @tc.number SUB_MOBILENETWORK_FLOW_0011
     * @tc.desc   invalid input 256 as data.DataFlowType just above UINT8_MAX falls into the default branch and maps to
     * none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0011 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(256 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0011 end');
    })

    /**
     * @tc.name   testFlow0012
     * @tc.number SUB_MOBILENETWORK_FLOW_0012
     * @tc.desc   invalid input 65535 as data.DataFlowType on the UINT16_MAX line falls into the default branch and maps
     * to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0012 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(65535 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0012 end');
    })

    /**
     * @tc.name   testFlow0013
     * @tc.number SUB_MOBILENETWORK_FLOW_0013
     * @tc.desc   invalid input 65536 as data.DataFlowType just above UINT16_MAX falls into the default branch and maps
     * to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0013 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(65536 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0013 end');
    })

    /**
     * @tc.name   testFlow0014
     * @tc.number SUB_MOBILENETWORK_FLOW_0014
     * @tc.desc   invalid input 999 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0014 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(999 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0014 end');
    })

    /**
     * @tc.name   testFlow0015
     * @tc.number SUB_MOBILENETWORK_FLOW_0015
     * @tc.desc   invalid input 1000 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0015 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(1000 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0015 end');
    })

    /**
     * @tc.name   testFlow0016
     * @tc.number SUB_MOBILENETWORK_FLOW_0016
     * @tc.desc   extreme input -2147483648 as data.DataFlowType (INT32_MIN) falls into the default branch and maps to
     * none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0016 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-2147483648 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0016 end');
    })

    /**
     * @tc.name   testFlow0017
     * @tc.number SUB_MOBILENETWORK_FLOW_0017
     * @tc.desc   extreme input 2147483647 as data.DataFlowType (INT32_MAX) falls into the default branch and maps to
     * none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0017 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(2147483647 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0017 end');
    })

    /**
     * @tc.name   testFlow0018
     * @tc.number SUB_MOBILENETWORK_FLOW_0018
     * @tc.desc   non-integer input 0.5 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0018 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(0.5 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0018 end');
    })

    /**
     * @tc.name   testFlow0019
     * @tc.number SUB_MOBILENETWORK_FLOW_0019
     * @tc.desc   extreme input NaN falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0019 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(Number.NaN as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0019 end');
    })

    /**
     * @tc.name   testFlow0020
     * @tc.number SUB_MOBILENETWORK_FLOW_0020
     * @tc.desc   invalid input -100 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0020 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-100 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0020 end');
    })

    /**
     * @tc.name   testFlow0021
     * @tc.number SUB_MOBILENETWORK_FLOW_0021
     * @tc.desc   invalid input 1000000 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0021 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(1000000 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0021 end');
    })

    /**
     * @tc.name   testFlow0022
     * @tc.number SUB_MOBILENETWORK_FLOW_0022
     * @tc.desc   invalid input 4095 as data.DataFlowType just below the 4Ki line falls into the default branch and maps
     * to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0022 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(4095 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0022 end');
    })

    /**
     * @tc.name   testFlow0023
     * @tc.number SUB_MOBILENETWORK_FLOW_0023
     * @tc.desc   invalid input 4096 as data.DataFlowType on the 4Ki line falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0023 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(4096 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0023 end');
    })

    /**
     * @tc.name   testFlow0024
     * @tc.number SUB_MOBILENETWORK_FLOW_0024
     * @tc.desc   invalid input 99 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0024 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(99 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0024 end');
    })

    /**
     * @tc.name   testFlow0025
     * @tc.number SUB_MOBILENETWORK_FLOW_0025
     * @tc.desc   non-integer input 4.5 as data.DataFlowType falls into the default branch and maps to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0025 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(4.5 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554455));
      expect(result.id).assertEqual(33554455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554449));
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0025 end');
    })

  })
}
