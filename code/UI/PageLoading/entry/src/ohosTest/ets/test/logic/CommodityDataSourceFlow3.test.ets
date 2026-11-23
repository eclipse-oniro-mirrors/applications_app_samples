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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../../utils/YieldHook';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CommodityDataModel, CommodityDataSource } from '../../../../main/ets/bridge/PageLoadingBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PageLoading]';
const BUNDLE: string = 'PageLoading_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for CommodityDataSource flow (64 cases). */
export default function commodityDataSourceFlow3Test(): void {
  describe('CommodityDataSourceFlow3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0123
     * @tc.name      PageLoading_CommodityDataSourceFlow_0123
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0123 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: CommodityDataModel = subject.getData(-26);
      logInfo(`step4 getData(-26): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0123 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0124
     * @tc.name      PageLoading_CommodityDataSourceFlow_0124
     * @tc.desc      CommodityDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0124 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(23.08);
      logInfo(`step1 getData(23.08): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0124 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0125
     * @tc.name      PageLoading_CommodityDataSourceFlow_0125
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0125 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0125 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0126
     * @tc.name      PageLoading_CommodityDataSourceFlow_0126
     * @tc.desc      CommodityDataSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0126 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(34.6);
      logInfo(`step2 getData(34.6): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0126 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0127
     * @tc.name      PageLoading_CommodityDataSourceFlow_0127
     * @tc.desc      CommodityDataSource call flow getData > getData > getData > totalCount > getData keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0127 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(55.49);
      logInfo(`step1 getData(55.49): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(78.07);
      logInfo(`step2 getData(78.07): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(-92);
      logInfo(`step3 getData(-92): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: CommodityDataModel = subject.getData(53.83);
      logInfo(`step5 getData(53.83): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0127 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0128
     * @tc.name      PageLoading_CommodityDataSourceFlow_0128
     * @tc.desc      CommodityDataSource call flow getData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0128 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(165);
      logInfo(`step1 getData(165): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0128 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0129
     * @tc.name      PageLoading_CommodityDataSourceFlow_0129
     * @tc.desc      CommodityDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0129 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(27.56);
      logInfo(`step1 getData(27.56): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(-68);
      logInfo(`step2 getData(-68): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0129 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0130
     * @tc.name      PageLoading_CommodityDataSourceFlow_0130
     * @tc.desc      CommodityDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0130 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(64);
      logInfo(`step1 getData(64): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(-77);
      logInfo(`step2 getData(-77): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0130 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0131
     * @tc.name      PageLoading_CommodityDataSourceFlow_0131
     * @tc.desc      CommodityDataSource call flow totalCount > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0131 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(23.59);
      logInfo(`step2 getData(23.59): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(56);
      logInfo(`step3 getData(56): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0131 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0132
     * @tc.name      PageLoading_CommodityDataSourceFlow_0132
     * @tc.desc      CommodityDataSource call flow getData > totalCount > totalCount > totalCount > totalCount keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0132 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(-75);
      logInfo(`step1 getData(-75): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0132 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0133
     * @tc.name      PageLoading_CommodityDataSourceFlow_0133
     * @tc.desc      CommodityDataSource call flow getData > getData > totalCount > getData > getData keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0133 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(155);
      logInfo(`step1 getData(155): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(180);
      logInfo(`step2 getData(180): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: CommodityDataModel = subject.getData(130);
      logInfo(`step4 getData(130): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: CommodityDataModel = subject.getData(-77);
      logInfo(`step5 getData(-77): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0133 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0134
     * @tc.name      PageLoading_CommodityDataSourceFlow_0134
     * @tc.desc      CommodityDataSource call flow totalCount > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0134 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(-68);
      logInfo(`step2 getData(-68): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0134 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0135
     * @tc.name      PageLoading_CommodityDataSourceFlow_0135
     * @tc.desc      CommodityDataSource call flow getData > getData > totalCount > getData > getData keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0135 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(165);
      logInfo(`step1 getData(165): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(53.83);
      logInfo(`step2 getData(53.83): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: CommodityDataModel = subject.getData(89.21);
      logInfo(`step4 getData(89.21): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: CommodityDataModel = subject.getData(43);
      logInfo(`step5 getData(43): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0135 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0136
     * @tc.name      PageLoading_CommodityDataSourceFlow_0136
     * @tc.desc      CommodityDataSource call flow getData > totalCount > totalCount > totalCount > getData keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0136 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(1);
      logInfo(`step1 getData(1): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: CommodityDataModel = subject.getData(80);
      logInfo(`step5 getData(80): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0136 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0137
     * @tc.name      PageLoading_CommodityDataSourceFlow_0137
     * @tc.desc      CommodityDataSource call flow totalCount > getData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0137 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(-92);
      logInfo(`step2 getData(-92): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0137 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0138
     * @tc.name      PageLoading_CommodityDataSourceFlow_0138
     * @tc.desc      CommodityDataSource call flow getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0138 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(-99);
      logInfo(`step1 getData(-99): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(5.8);
      logInfo(`step2 getData(5.8): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(27.56);
      logInfo(`step3 getData(27.56): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0138 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0139
     * @tc.name      PageLoading_CommodityDataSourceFlow_0139
     * @tc.desc      CommodityDataSource call flow getData > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0139 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(28);
      logInfo(`step1 getData(28): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(145);
      logInfo(`step3 getData(145): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0139 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0140
     * @tc.name      PageLoading_CommodityDataSourceFlow_0140
     * @tc.desc      CommodityDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0140 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(1);
      logInfo(`step1 getData(1): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0140 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0141
     * @tc.name      PageLoading_CommodityDataSourceFlow_0141
     * @tc.desc      CommodityDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0141 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(70);
      logInfo(`step1 getData(70): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(-5);
      logInfo(`step2 getData(-5): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0141 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0142
     * @tc.name      PageLoading_CommodityDataSourceFlow_0142
     * @tc.desc      CommodityDataSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0142 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(199);
      logInfo(`step2 getData(199): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0142 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0143
     * @tc.name      PageLoading_CommodityDataSourceFlow_0143
     * @tc.desc      CommodityDataSource call flow getData > getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0143 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(180);
      logInfo(`step1 getData(180): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(45);
      logInfo(`step2 getData(45): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(-86);
      logInfo(`step3 getData(-86): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(112);
      logInfo(`step4 getData(112): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0143 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0144
     * @tc.name      PageLoading_CommodityDataSourceFlow_0144
     * @tc.desc      CommodityDataSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0144 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(-4);
      logInfo(`step2 getData(-4): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0144 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0145
     * @tc.name      PageLoading_CommodityDataSourceFlow_0145
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0145 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0145 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0146
     * @tc.name      PageLoading_CommodityDataSourceFlow_0146
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0146 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(-84);
      logInfo(`step3 getData(-84): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(120);
      logInfo(`step4 getData(120): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0146 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0147
     * @tc.name      PageLoading_CommodityDataSourceFlow_0147
     * @tc.desc      CommodityDataSource call flow totalCount > getData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0147 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(135);
      logInfo(`step2 getData(135): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0147 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0148
     * @tc.name      PageLoading_CommodityDataSourceFlow_0148
     * @tc.desc      CommodityDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0148 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(137);
      logInfo(`step1 getData(137): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(110);
      logInfo(`step2 getData(110): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0148 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0149
     * @tc.name      PageLoading_CommodityDataSourceFlow_0149
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0149 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(3);
      logInfo(`step3 getData(3): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0149 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0150
     * @tc.name      PageLoading_CommodityDataSourceFlow_0150
     * @tc.desc      CommodityDataSource call flow totalCount > getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0150 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(-15);
      logInfo(`step2 getData(-15): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(190);
      logInfo(`step3 getData(190): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(-77);
      logInfo(`step4 getData(-77): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0150 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0151
     * @tc.name      PageLoading_CommodityDataSourceFlow_0151
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0151 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0151 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0152
     * @tc.name      PageLoading_CommodityDataSourceFlow_0152
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0152 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0152 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0153
     * @tc.name      PageLoading_CommodityDataSourceFlow_0153
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0153 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0153 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0154
     * @tc.name      PageLoading_CommodityDataSourceFlow_0154
     * @tc.desc      CommodityDataSource call flow totalCount > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0154 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(176);
      logInfo(`step2 getData(176): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0154 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0155
     * @tc.name      PageLoading_CommodityDataSourceFlow_0155
     * @tc.desc      CommodityDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0155 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(174);
      logInfo(`step1 getData(174): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0155 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0156
     * @tc.name      PageLoading_CommodityDataSourceFlow_0156
     * @tc.desc      CommodityDataSource call flow getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0156 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(39);
      logInfo(`step1 getData(39): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(23.59);
      logInfo(`step2 getData(23.59): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(80.71);
      logInfo(`step3 getData(80.71): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0156 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0157
     * @tc.name      PageLoading_CommodityDataSourceFlow_0157
     * @tc.desc      CommodityDataSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0157 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(64);
      logInfo(`step2 getData(64): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0157 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0158
     * @tc.name      PageLoading_CommodityDataSourceFlow_0158
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0158 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(185);
      logInfo(`step3 getData(185): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0158 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0159
     * @tc.name      PageLoading_CommodityDataSourceFlow_0159
     * @tc.desc      CommodityDataSource call flow totalCount > getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0159 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(70);
      logInfo(`step2 getData(70): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(190);
      logInfo(`step3 getData(190): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(165);
      logInfo(`step4 getData(165): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0159 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0160
     * @tc.name      PageLoading_CommodityDataSourceFlow_0160
     * @tc.desc      CommodityDataSource call flow totalCount > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0160 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(160);
      logInfo(`step2 getData(160): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0160 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0161
     * @tc.name      PageLoading_CommodityDataSourceFlow_0161
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > totalCount > getData > getData keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0161 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: CommodityDataModel = subject.getData(50);
      logInfo(`step4 getData(50): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: CommodityDataModel = subject.getData(93);
      logInfo(`step5 getData(93): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0161 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0162
     * @tc.name      PageLoading_CommodityDataSourceFlow_0162
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > totalCount > totalCount keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0162 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0162 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0163
     * @tc.name      PageLoading_CommodityDataSourceFlow_0163
     * @tc.desc      CommodityDataSource call flow getData > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0163 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(-26);
      logInfo(`step1 getData(-26): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(25);
      logInfo(`step3 getData(25): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0163 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0164
     * @tc.name      PageLoading_CommodityDataSourceFlow_0164
     * @tc.desc      CommodityDataSource call flow getData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0164 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(-75);
      logInfo(`step1 getData(-75): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(112);
      logInfo(`step2 getData(112): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0164 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0165
     * @tc.name      PageLoading_CommodityDataSourceFlow_0165
     * @tc.desc      CommodityDataSource call flow getData > totalCount > getData > getData > getData keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0165 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(136);
      logInfo(`step1 getData(136): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(30);
      logInfo(`step3 getData(30): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(78.07);
      logInfo(`step4 getData(78.07): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: CommodityDataModel = subject.getData(59.08);
      logInfo(`step5 getData(59.08): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0165 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0166
     * @tc.name      PageLoading_CommodityDataSourceFlow_0166
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0166 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(145);
      logInfo(`step3 getData(145): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0166 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0167
     * @tc.name      PageLoading_CommodityDataSourceFlow_0167
     * @tc.desc      CommodityDataSource call flow totalCount > getData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0167 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(-55);
      logInfo(`step2 getData(-55): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0167 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0168
     * @tc.name      PageLoading_CommodityDataSourceFlow_0168
     * @tc.desc      CommodityDataSource call flow getData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0168 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(-3);
      logInfo(`step1 getData(-3): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(-12);
      logInfo(`step2 getData(-12): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0168 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0169
     * @tc.name      PageLoading_CommodityDataSourceFlow_0169
     * @tc.desc      CommodityDataSource call flow totalCount > getData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0169 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(175);
      logInfo(`step2 getData(175): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(34.6);
      logInfo(`step3 getData(34.6): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0169 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0170
     * @tc.name      PageLoading_CommodityDataSourceFlow_0170
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0170 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(165);
      logInfo(`step3 getData(165): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0170 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0171
     * @tc.name      PageLoading_CommodityDataSourceFlow_0171
     * @tc.desc      CommodityDataSource call flow getData > totalCount > totalCount > totalCount > getData keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0171 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(176);
      logInfo(`step1 getData(176): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: CommodityDataModel = subject.getData(109);
      logInfo(`step5 getData(109): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0171 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0172
     * @tc.name      PageLoading_CommodityDataSourceFlow_0172
     * @tc.desc      CommodityDataSource call flow getData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0172 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(55);
      logInfo(`step1 getData(55): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(59.08);
      logInfo(`step2 getData(59.08): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0172 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0173
     * @tc.name      PageLoading_CommodityDataSourceFlow_0173
     * @tc.desc      CommodityDataSource call flow totalCount > getData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0173 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(28);
      logInfo(`step2 getData(28): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0173 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0174
     * @tc.name      PageLoading_CommodityDataSourceFlow_0174
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0174 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0174 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0175
     * @tc.name      PageLoading_CommodityDataSourceFlow_0175
     * @tc.desc      CommodityDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0175 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(140);
      logInfo(`step1 getData(140): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(-99);
      logInfo(`step2 getData(-99): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0175 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0176
     * @tc.name      PageLoading_CommodityDataSourceFlow_0176
     * @tc.desc      CommodityDataSource call flow getData > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0176 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(80.71);
      logInfo(`step1 getData(80.71): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(80);
      logInfo(`step3 getData(80): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0176 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0177
     * @tc.name      PageLoading_CommodityDataSourceFlow_0177
     * @tc.desc      CommodityDataSource call flow getData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0177 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(135);
      logInfo(`step1 getData(135): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0177 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0178
     * @tc.name      PageLoading_CommodityDataSourceFlow_0178
     * @tc.desc      CommodityDataSource call flow totalCount > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0178 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(30);
      logInfo(`step2 getData(30): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0178 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0179
     * @tc.name      PageLoading_CommodityDataSourceFlow_0179
     * @tc.desc      CommodityDataSource call flow totalCount > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0179 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(109);
      logInfo(`step2 getData(109): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0179 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0180
     * @tc.name      PageLoading_CommodityDataSourceFlow_0180
     * @tc.desc      CommodityDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0180 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(109);
      logInfo(`step1 getData(109): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0180 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0181
     * @tc.name      PageLoading_CommodityDataSourceFlow_0181
     * @tc.desc      CommodityDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0181 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(160);
      logInfo(`step1 getData(160): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(125);
      logInfo(`step2 getData(125): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0181 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0182
     * @tc.name      PageLoading_CommodityDataSourceFlow_0182
     * @tc.desc      CommodityDataSource call flow getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0182 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(101);
      logInfo(`step1 getData(101): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(-1);
      logInfo(`step2 getData(-1): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(176);
      logInfo(`step3 getData(176): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0182 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0183
     * @tc.name      PageLoading_CommodityDataSourceFlow_0183
     * @tc.desc      CommodityDataSource call flow getData > totalCount > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0183 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(88.03);
      logInfo(`step1 getData(88.03): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(34.6);
      logInfo(`step3 getData(34.6): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0183 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0184
     * @tc.name      PageLoading_CommodityDataSourceFlow_0184
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > getData > getData > getData keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0184 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(53.83);
      logInfo(`step3 getData(53.83): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(-55);
      logInfo(`step4 getData(-55): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: CommodityDataModel = subject.getData(-75);
      logInfo(`step5 getData(-75): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0184 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0185
     * @tc.name      PageLoading_CommodityDataSourceFlow_0185
     * @tc.desc      CommodityDataSource call flow getData > getData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0185 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(185);
      logInfo(`step1 getData(185): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(-3);
      logInfo(`step2 getData(-3): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0185 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0186
     * @tc.name      PageLoading_CommodityDataSourceFlow_0186
     * @tc.desc      CommodityDataSource call flow getData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0186 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(-59);
      logInfo(`step1 getData(-59): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(112);
      logInfo(`step2 getData(112): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0186 end`);
    });
  });
}
