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
const LOG_TAG: string = '[Sample_MobileNetwork_CStateVolume06]';

export default function cstateVolume06Test() {
  describe('CStateVolume06Test', () => {

    /**
     * @tc.name   testCState0332
     * @tc.number SUB_MOBILENETWORK_CSTATE_0332
     * @tc.desc   invalid input -75 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0332', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0332 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-75 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0332 end');
    })

    /**
     * @tc.name   testCState0333
     * @tc.number SUB_MOBILENETWORK_CSTATE_0333
     * @tc.desc   invalid input -74 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0333', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0333 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-74 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0333 end');
    })

    /**
     * @tc.name   testCState0334
     * @tc.number SUB_MOBILENETWORK_CSTATE_0334
     * @tc.desc   invalid input -73 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0334', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0334 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-73 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0334 end');
    })

    /**
     * @tc.name   testCState0335
     * @tc.number SUB_MOBILENETWORK_CSTATE_0335
     * @tc.desc   invalid input -72 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0335', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0335 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-72 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0335 end');
    })

    /**
     * @tc.name   testCState0336
     * @tc.number SUB_MOBILENETWORK_CSTATE_0336
     * @tc.desc   invalid input -71 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0336', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0336 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-71 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0336 end');
    })

    /**
     * @tc.name   testCState0337
     * @tc.number SUB_MOBILENETWORK_CSTATE_0337
     * @tc.desc   invalid input -70 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0337', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0337 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-70 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0337 end');
    })

    /**
     * @tc.name   testCState0338
     * @tc.number SUB_MOBILENETWORK_CSTATE_0338
     * @tc.desc   invalid input -69 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0338', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0338 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-69 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0338 end');
    })

    /**
     * @tc.name   testCState0339
     * @tc.number SUB_MOBILENETWORK_CSTATE_0339
     * @tc.desc   invalid input -68 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0339', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0339 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-68 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0339 end');
    })

    /**
     * @tc.name   testCState0340
     * @tc.number SUB_MOBILENETWORK_CSTATE_0340
     * @tc.desc   invalid input -67 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0340 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-67 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0340 end');
    })

    /**
     * @tc.name   testCState0341
     * @tc.number SUB_MOBILENETWORK_CSTATE_0341
     * @tc.desc   invalid input -66 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0341', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0341 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-66 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0341 end');
    })

    /**
     * @tc.name   testCState0342
     * @tc.number SUB_MOBILENETWORK_CSTATE_0342
     * @tc.desc   invalid input -65 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0342', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0342 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-65 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0342 end');
    })

    /**
     * @tc.name   testCState0343
     * @tc.number SUB_MOBILENETWORK_CSTATE_0343
     * @tc.desc   invalid input -64 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0343', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0343 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-64 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0343 end');
    })

    /**
     * @tc.name   testCState0344
     * @tc.number SUB_MOBILENETWORK_CSTATE_0344
     * @tc.desc   invalid input -63 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0344', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0344 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-63 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0344 end');
    })

    /**
     * @tc.name   testCState0345
     * @tc.number SUB_MOBILENETWORK_CSTATE_0345
     * @tc.desc   invalid input -62 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0345', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0345 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-62 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0345 end');
    })

    /**
     * @tc.name   testCState0346
     * @tc.number SUB_MOBILENETWORK_CSTATE_0346
     * @tc.desc   invalid input -61 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0346', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0346 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-61 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0346 end');
    })

    /**
     * @tc.name   testCState0347
     * @tc.number SUB_MOBILENETWORK_CSTATE_0347
     * @tc.desc   invalid input -60 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0347', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0347 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-60 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0347 end');
    })

    /**
     * @tc.name   testCState0348
     * @tc.number SUB_MOBILENETWORK_CSTATE_0348
     * @tc.desc   invalid input -59 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0348', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0348 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-59 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0348 end');
    })

    /**
     * @tc.name   testCState0349
     * @tc.number SUB_MOBILENETWORK_CSTATE_0349
     * @tc.desc   invalid input -58 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0349', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0349 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-58 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0349 end');
    })

    /**
     * @tc.name   testCState0350
     * @tc.number SUB_MOBILENETWORK_CSTATE_0350
     * @tc.desc   invalid input -57 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0350 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-57 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0350 end');
    })

    /**
     * @tc.name   testCState0351
     * @tc.number SUB_MOBILENETWORK_CSTATE_0351
     * @tc.desc   invalid input -56 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0351', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0351 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-56 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0351 end');
    })

    /**
     * @tc.name   testCState0352
     * @tc.number SUB_MOBILENETWORK_CSTATE_0352
     * @tc.desc   invalid input -55 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0352', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0352 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-55 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0352 end');
    })

    /**
     * @tc.name   testCState0353
     * @tc.number SUB_MOBILENETWORK_CSTATE_0353
     * @tc.desc   invalid input -54 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0353', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0353 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-54 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0353 end');
    })

    /**
     * @tc.name   testCState0354
     * @tc.number SUB_MOBILENETWORK_CSTATE_0354
     * @tc.desc   invalid input -53 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0354', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0354 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-53 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0354 end');
    })

    /**
     * @tc.name   testCState0355
     * @tc.number SUB_MOBILENETWORK_CSTATE_0355
     * @tc.desc   invalid input -52 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0355', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0355 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-52 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0355 end');
    })

    /**
     * @tc.name   testCState0356
     * @tc.number SUB_MOBILENETWORK_CSTATE_0356
     * @tc.desc   invalid input -51 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0356', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0356 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-51 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0356 end');
    })

    /**
     * @tc.name   testCState0357
     * @tc.number SUB_MOBILENETWORK_CSTATE_0357
     * @tc.desc   invalid input -50 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0357', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0357 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-50 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0357 end');
    })

    /**
     * @tc.name   testCState0358
     * @tc.number SUB_MOBILENETWORK_CSTATE_0358
     * @tc.desc   invalid input -49 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0358', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0358 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-49 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0358 end');
    })

    /**
     * @tc.name   testCState0359
     * @tc.number SUB_MOBILENETWORK_CSTATE_0359
     * @tc.desc   invalid input -48 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0359', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0359 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-48 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0359 end');
    })

    /**
     * @tc.name   testCState0360
     * @tc.number SUB_MOBILENETWORK_CSTATE_0360
     * @tc.desc   invalid input -47 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0360 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-47 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0360 end');
    })

    /**
     * @tc.name   testCState0361
     * @tc.number SUB_MOBILENETWORK_CSTATE_0361
     * @tc.desc   invalid input -46 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0361', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0361 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-46 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0361 end');
    })

    /**
     * @tc.name   testCState0362
     * @tc.number SUB_MOBILENETWORK_CSTATE_0362
     * @tc.desc   invalid input -45 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0362', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0362 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-45 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0362 end');
    })

    /**
     * @tc.name   testCState0363
     * @tc.number SUB_MOBILENETWORK_CSTATE_0363
     * @tc.desc   invalid input -44 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0363', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0363 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-44 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0363 end');
    })

    /**
     * @tc.name   testCState0364
     * @tc.number SUB_MOBILENETWORK_CSTATE_0364
     * @tc.desc   invalid input -43 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0364', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0364 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-43 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0364 end');
    })

    /**
     * @tc.name   testCState0365
     * @tc.number SUB_MOBILENETWORK_CSTATE_0365
     * @tc.desc   invalid input -42 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0365', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0365 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-42 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0365 end');
    })

    /**
     * @tc.name   testCState0366
     * @tc.number SUB_MOBILENETWORK_CSTATE_0366
     * @tc.desc   invalid input -41 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0366', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0366 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-41 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0366 end');
    })

    /**
     * @tc.name   testCState0367
     * @tc.number SUB_MOBILENETWORK_CSTATE_0367
     * @tc.desc   invalid input -40 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0367', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0367 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-40 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0367 end');
    })

    /**
     * @tc.name   testCState0368
     * @tc.number SUB_MOBILENETWORK_CSTATE_0368
     * @tc.desc   invalid input -39 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0368', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0368 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-39 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0368 end');
    })

    /**
     * @tc.name   testCState0369
     * @tc.number SUB_MOBILENETWORK_CSTATE_0369
     * @tc.desc   invalid input -38 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0369', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0369 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-38 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0369 end');
    })

    /**
     * @tc.name   testCState0370
     * @tc.number SUB_MOBILENETWORK_CSTATE_0370
     * @tc.desc   invalid input -37 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0370 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-37 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0370 end');
    })

    /**
     * @tc.name   testCState0371
     * @tc.number SUB_MOBILENETWORK_CSTATE_0371
     * @tc.desc   invalid input -36 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0371', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0371 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-36 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0371 end');
    })

    /**
     * @tc.name   testCState0372
     * @tc.number SUB_MOBILENETWORK_CSTATE_0372
     * @tc.desc   invalid input -35 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0372', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0372 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-35 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0372 end');
    })

    /**
     * @tc.name   testCState0373
     * @tc.number SUB_MOBILENETWORK_CSTATE_0373
     * @tc.desc   invalid input -34 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0373', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0373 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-34 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0373 end');
    })

    /**
     * @tc.name   testCState0374
     * @tc.number SUB_MOBILENETWORK_CSTATE_0374
     * @tc.desc   invalid input -33 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0374', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0374 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-33 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0374 end');
    })

    /**
     * @tc.name   testCState0375
     * @tc.number SUB_MOBILENETWORK_CSTATE_0375
     * @tc.desc   invalid input -32 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0375', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0375 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-32 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0375 end');
    })

    /**
     * @tc.name   testCState0376
     * @tc.number SUB_MOBILENETWORK_CSTATE_0376
     * @tc.desc   invalid input -31 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0376', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0376 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-31 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0376 end');
    })

    /**
     * @tc.name   testCState0377
     * @tc.number SUB_MOBILENETWORK_CSTATE_0377
     * @tc.desc   invalid input -30 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0377', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0377 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-30 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0377 end');
    })

    /**
     * @tc.name   testCState0378
     * @tc.number SUB_MOBILENETWORK_CSTATE_0378
     * @tc.desc   invalid input -29 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0378', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0378 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-29 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0378 end');
    })

    /**
     * @tc.name   testCState0379
     * @tc.number SUB_MOBILENETWORK_CSTATE_0379
     * @tc.desc   invalid input -28 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0379', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0379 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-28 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0379 end');
    })

    /**
     * @tc.name   testCState0380
     * @tc.number SUB_MOBILENETWORK_CSTATE_0380
     * @tc.desc   invalid input -27 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0380 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-27 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0380 end');
    })

    /**
     * @tc.name   testCState0381
     * @tc.number SUB_MOBILENETWORK_CSTATE_0381
     * @tc.desc   invalid input -26 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0381', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0381 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-26 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0381 end');
    })

    /**
     * @tc.name   testCState0382
     * @tc.number SUB_MOBILENETWORK_CSTATE_0382
     * @tc.desc   invalid input -25 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0382', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0382 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-25 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0382 end');
    })

    /**
     * @tc.name   testCState0383
     * @tc.number SUB_MOBILENETWORK_CSTATE_0383
     * @tc.desc   invalid input -24 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0383', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0383 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-24 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0383 end');
    })

    /**
     * @tc.name   testCState0384
     * @tc.number SUB_MOBILENETWORK_CSTATE_0384
     * @tc.desc   invalid input -23 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0384', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0384 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-23 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0384 end');
    })

    /**
     * @tc.name   testCState0385
     * @tc.number SUB_MOBILENETWORK_CSTATE_0385
     * @tc.desc   invalid input -22 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0385', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0385 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-22 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0385 end');
    })

    /**
     * @tc.name   testCState0386
     * @tc.number SUB_MOBILENETWORK_CSTATE_0386
     * @tc.desc   invalid input -21 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0386', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0386 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-21 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0386 end');
    })

    /**
     * @tc.name   testCState0387
     * @tc.number SUB_MOBILENETWORK_CSTATE_0387
     * @tc.desc   invalid input -20 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0387', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0387 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-20 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0387 end');
    })

    /**
     * @tc.name   testCState0388
     * @tc.number SUB_MOBILENETWORK_CSTATE_0388
     * @tc.desc   invalid input -19 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0388', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0388 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-19 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0388 end');
    })

    /**
     * @tc.name   testCState0389
     * @tc.number SUB_MOBILENETWORK_CSTATE_0389
     * @tc.desc   invalid input -18 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0389', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0389 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-18 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0389 end');
    })

    /**
     * @tc.name   testCState0390
     * @tc.number SUB_MOBILENETWORK_CSTATE_0390
     * @tc.desc   invalid input -17 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0390 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-17 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0390 end');
    })

    /**
     * @tc.name   testCState0391
     * @tc.number SUB_MOBILENETWORK_CSTATE_0391
     * @tc.desc   invalid input -16 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0391', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0391 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-16 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0391 end');
    })

    /**
     * @tc.name   testCState0392
     * @tc.number SUB_MOBILENETWORK_CSTATE_0392
     * @tc.desc   invalid input -15 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0392', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0392 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-15 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0392 end');
    })

    /**
     * @tc.name   testCState0393
     * @tc.number SUB_MOBILENETWORK_CSTATE_0393
     * @tc.desc   invalid input -14 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0393', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0393 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-14 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0393 end');
    })

    /**
     * @tc.name   testCState0394
     * @tc.number SUB_MOBILENETWORK_CSTATE_0394
     * @tc.desc   invalid input -13 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0394', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0394 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-13 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0394 end');
    })

    /**
     * @tc.name   testCState0395
     * @tc.number SUB_MOBILENETWORK_CSTATE_0395
     * @tc.desc   invalid input -12 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0395', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0395 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-12 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0395 end');
    })

    /**
     * @tc.name   testCState0396
     * @tc.number SUB_MOBILENETWORK_CSTATE_0396
     * @tc.desc   invalid input -11 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0396', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0396 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-11 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0396 end');
    })

    /**
     * @tc.name   testCState0397
     * @tc.number SUB_MOBILENETWORK_CSTATE_0397
     * @tc.desc   invalid input -10 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0397', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0397 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-10 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0397 end');
    })

    /**
     * @tc.name   testCState0398
     * @tc.number SUB_MOBILENETWORK_CSTATE_0398
     * @tc.desc   invalid input -9 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0398', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0398 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-9 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0398 end');
    })

    /**
     * @tc.name   testCState0399
     * @tc.number SUB_MOBILENETWORK_CSTATE_0399
     * @tc.desc   invalid input -8 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0399', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0399 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-8 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0399 end');
    })

    /**
     * @tc.name   testCState0400
     * @tc.number SUB_MOBILENETWORK_CSTATE_0400
     * @tc.desc   invalid input -7 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0400 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-7 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0400 end');
    })

    /**
     * @tc.name   testCState0401
     * @tc.number SUB_MOBILENETWORK_CSTATE_0401
     * @tc.desc   invalid input -6 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0401 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-6 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0401 end');
    })

    /**
     * @tc.name   testCState0402
     * @tc.number SUB_MOBILENETWORK_CSTATE_0402
     * @tc.desc   invalid input -5 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0402 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-5 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0402 end');
    })

    /**
     * @tc.name   testCState0403
     * @tc.number SUB_MOBILENETWORK_CSTATE_0403
     * @tc.desc   invalid input -4 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0403 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-4 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0403 end');
    })

    /**
     * @tc.name   testCState0404
     * @tc.number SUB_MOBILENETWORK_CSTATE_0404
     * @tc.desc   invalid input -3 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0404', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0404 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-3 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0404 end');
    })

    /**
     * @tc.name   testCState0405
     * @tc.number SUB_MOBILENETWORK_CSTATE_0405
     * @tc.desc   invalid input -2 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0405 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-2 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0405 end');
    })

    /**
     * @tc.name   testCState0406
     * @tc.number SUB_MOBILENETWORK_CSTATE_0406
     * @tc.desc   invalid input -1 as data.DataConnectState falls into the default branch and maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCState0406', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0406 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-1 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.id), String(33554462));
      expect(result.id).assertEqual(33554462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isInteger(result.id) && result.id > 0));
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.id === 33554447));
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0406 end');
    })

  })
}
