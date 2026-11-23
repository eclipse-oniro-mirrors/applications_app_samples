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

/** Logic checks for CommodityDataSource flow (62 cases). */
export default function commodityDataSourceFlow5Test(): void {
  describe('CommodityDataSourceFlow5Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0251
     * @tc.name      PageLoading_CommodityDataSourceFlow_0251
     * @tc.desc      CommodityDataSource call flow getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0251 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(150);
      logInfo(`step1 getData(150): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(115);
      logInfo(`step2 getData(115): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(75.02);
      logInfo(`step3 getData(75.02): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0251 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0252
     * @tc.name      PageLoading_CommodityDataSourceFlow_0252
     * @tc.desc      CommodityDataSource call flow getData > totalCount > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0252 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(75);
      logInfo(`step1 getData(75): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(77);
      logInfo(`step3 getData(77): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0252 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0253
     * @tc.name      PageLoading_CommodityDataSourceFlow_0253
     * @tc.desc      CommodityDataSource call flow totalCount > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0253 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(53.83);
      logInfo(`step2 getData(53.83): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(144);
      logInfo(`step3 getData(144): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0253 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0254
     * @tc.name      PageLoading_CommodityDataSourceFlow_0254
     * @tc.desc      CommodityDataSource call flow getData > getData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0254 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(-4);
      logInfo(`step1 getData(-4): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(43);
      logInfo(`step2 getData(43): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0254 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0255
     * @tc.name      PageLoading_CommodityDataSourceFlow_0255
     * @tc.desc      CommodityDataSource call flow totalCount > getData > totalCount > getData > getData keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0255 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(67.86);
      logInfo(`step2 getData(67.86): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: CommodityDataModel = subject.getData(45);
      logInfo(`step4 getData(45): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: CommodityDataModel = subject.getData(-1);
      logInfo(`step5 getData(-1): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0255 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0256
     * @tc.name      PageLoading_CommodityDataSourceFlow_0256
     * @tc.desc      CommodityDataSource call flow getData > totalCount > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0256 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(20);
      logInfo(`step1 getData(20): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: CommodityDataModel = subject.getData(135);
      logInfo(`step4 getData(135): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0256 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0257
     * @tc.name      PageLoading_CommodityDataSourceFlow_0257
     * @tc.desc      CommodityDataSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0257 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(56.12);
      logInfo(`step2 getData(56.12): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0257 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0258
     * @tc.name      PageLoading_CommodityDataSourceFlow_0258
     * @tc.desc      CommodityDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0258 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(35);
      logInfo(`step1 getData(35): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0258 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0259
     * @tc.name      PageLoading_CommodityDataSourceFlow_0259
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0259 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(195);
      logInfo(`step3 getData(195): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(157);
      logInfo(`step4 getData(157): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0259 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0260
     * @tc.name      PageLoading_CommodityDataSourceFlow_0260
     * @tc.desc      CommodityDataSource call flow totalCount > getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0260 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(-5);
      logInfo(`step2 getData(-5): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(160);
      logInfo(`step3 getData(160): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(-16);
      logInfo(`step4 getData(-16): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0260 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0261
     * @tc.name      PageLoading_CommodityDataSourceFlow_0261
     * @tc.desc      CommodityDataSource call flow totalCount > getData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0261 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(145);
      logInfo(`step2 getData(145): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(12);
      logInfo(`step3 getData(12): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0261 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0262
     * @tc.name      PageLoading_CommodityDataSourceFlow_0262
     * @tc.desc      CommodityDataSource call flow getData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0262 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(157);
      logInfo(`step1 getData(157): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(85);
      logInfo(`step2 getData(85): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0262 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0263
     * @tc.name      PageLoading_CommodityDataSourceFlow_0263
     * @tc.desc      CommodityDataSource call flow getData > getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0263 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(35);
      logInfo(`step1 getData(35): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(73);
      logInfo(`step2 getData(73): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(-1);
      logInfo(`step3 getData(-1): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(88.03);
      logInfo(`step4 getData(88.03): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0263 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0264
     * @tc.name      PageLoading_CommodityDataSourceFlow_0264
     * @tc.desc      CommodityDataSource call flow getData > getData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0264 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(23.08);
      logInfo(`step1 getData(23.08): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(61.72);
      logInfo(`step2 getData(61.72): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(59.08);
      logInfo(`step3 getData(59.08): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0264 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0265
     * @tc.name      PageLoading_CommodityDataSourceFlow_0265
     * @tc.desc      CommodityDataSource call flow totalCount > getData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0265 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(65);
      logInfo(`step2 getData(65): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(120);
      logInfo(`step3 getData(120): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0265 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0266
     * @tc.name      PageLoading_CommodityDataSourceFlow_0266
     * @tc.desc      CommodityDataSource call flow getData > getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0266 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(-99);
      logInfo(`step1 getData(-99): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(111);
      logInfo(`step2 getData(111): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(172);
      logInfo(`step3 getData(172): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(61.72);
      logInfo(`step4 getData(61.72): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0266 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0267
     * @tc.name      PageLoading_CommodityDataSourceFlow_0267
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0267 begin`);
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
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0267 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0268
     * @tc.name      PageLoading_CommodityDataSourceFlow_0268
     * @tc.desc      CommodityDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0268 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(78.07);
      logInfo(`step1 getData(78.07): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(176);
      logInfo(`step2 getData(176): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0268 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0269
     * @tc.name      PageLoading_CommodityDataSourceFlow_0269
     * @tc.desc      CommodityDataSource call flow getData > getData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0269 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(185);
      logInfo(`step1 getData(185): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(135);
      logInfo(`step2 getData(135): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(74.54);
      logInfo(`step3 getData(74.54): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0269 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0270
     * @tc.name      PageLoading_CommodityDataSourceFlow_0270
     * @tc.desc      CommodityDataSource call flow getData > totalCount > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0270 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(-75);
      logInfo(`step1 getData(-75): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(-92);
      logInfo(`step3 getData(-92): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0270 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0271
     * @tc.name      PageLoading_CommodityDataSourceFlow_0271
     * @tc.desc      CommodityDataSource call flow getData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0271 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(23.08);
      logInfo(`step1 getData(23.08): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0271 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0272
     * @tc.name      PageLoading_CommodityDataSourceFlow_0272
     * @tc.desc      CommodityDataSource call flow totalCount > getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0272 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(56);
      logInfo(`step2 getData(56): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(80.71);
      logInfo(`step3 getData(80.71): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(155);
      logInfo(`step4 getData(155): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0272 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0273
     * @tc.name      PageLoading_CommodityDataSourceFlow_0273
     * @tc.desc      CommodityDataSource call flow getData > getData > totalCount > totalCount > totalCount keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0273 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(5.8);
      logInfo(`step1 getData(5.8): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(59.08);
      logInfo(`step2 getData(59.08): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0273 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0274
     * @tc.name      PageLoading_CommodityDataSourceFlow_0274
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0274 begin`);
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
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0274 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0275
     * @tc.name      PageLoading_CommodityDataSourceFlow_0275
     * @tc.desc      CommodityDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0275 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(5);
      logInfo(`step1 getData(5): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(88);
      logInfo(`step2 getData(88): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0275 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0276
     * @tc.name      PageLoading_CommodityDataSourceFlow_0276
     * @tc.desc      CommodityDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0276 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(55.49);
      logInfo(`step1 getData(55.49): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(90.37);
      logInfo(`step2 getData(90.37): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0276 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0277
     * @tc.name      PageLoading_CommodityDataSourceFlow_0277
     * @tc.desc      CommodityDataSource call flow getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0277 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(35);
      logInfo(`step1 getData(35): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(30);
      logInfo(`step2 getData(30): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(192);
      logInfo(`step3 getData(192): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0277 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0278
     * @tc.name      PageLoading_CommodityDataSourceFlow_0278
     * @tc.desc      CommodityDataSource call flow getData > totalCount > getData > totalCount > getData keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0278 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(90.37);
      logInfo(`step1 getData(90.37): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(74.54);
      logInfo(`step3 getData(74.54): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: CommodityDataModel = subject.getData(55);
      logInfo(`step5 getData(55): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0278 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0279
     * @tc.name      PageLoading_CommodityDataSourceFlow_0279
     * @tc.desc      CommodityDataSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0279 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(74.54);
      logInfo(`step2 getData(74.54): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0279 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0280
     * @tc.name      PageLoading_CommodityDataSourceFlow_0280
     * @tc.desc      CommodityDataSource call flow totalCount > getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0280 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(190);
      logInfo(`step2 getData(190): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(-99);
      logInfo(`step3 getData(-99): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(-25);
      logInfo(`step4 getData(-25): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0280 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0281
     * @tc.name      PageLoading_CommodityDataSourceFlow_0281
     * @tc.desc      CommodityDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0281 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(17.59);
      logInfo(`step1 getData(17.59): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(192);
      logInfo(`step2 getData(192): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0281 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0282
     * @tc.name      PageLoading_CommodityDataSourceFlow_0282
     * @tc.desc      CommodityDataSource call flow totalCount > getData > getData > getData > getData keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0282 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(-79);
      logInfo(`step2 getData(-79): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(172);
      logInfo(`step3 getData(172): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(150);
      logInfo(`step4 getData(150): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: CommodityDataModel = subject.getData(120);
      logInfo(`step5 getData(120): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0282 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0283
     * @tc.name      PageLoading_CommodityDataSourceFlow_0283
     * @tc.desc      CommodityDataSource call flow totalCount > getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0283 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(105);
      logInfo(`step2 getData(105): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(123);
      logInfo(`step3 getData(123): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(170);
      logInfo(`step4 getData(170): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0283 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0284
     * @tc.name      PageLoading_CommodityDataSourceFlow_0284
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0284 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(199);
      logInfo(`step3 getData(199): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(123);
      logInfo(`step4 getData(123): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0284 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0285
     * @tc.name      PageLoading_CommodityDataSourceFlow_0285
     * @tc.desc      CommodityDataSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0285 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(193);
      logInfo(`step2 getData(193): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0285 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0286
     * @tc.name      PageLoading_CommodityDataSourceFlow_0286
     * @tc.desc      CommodityDataSource call flow getData > getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0286 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(90);
      logInfo(`step1 getData(90): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(0);
      logInfo(`step2 getData(0): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(137);
      logInfo(`step3 getData(137): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(77);
      logInfo(`step4 getData(77): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0286 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0287
     * @tc.name      PageLoading_CommodityDataSourceFlow_0287
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > getData > getData > getData keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0287 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(5);
      logInfo(`step3 getData(5): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(-77);
      logInfo(`step4 getData(-77): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: CommodityDataModel = subject.getData(56);
      logInfo(`step5 getData(56): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0287 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0288
     * @tc.name      PageLoading_CommodityDataSourceFlow_0288
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > totalCount > totalCount > totalCount kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0288 begin`);
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
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0288 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0289
     * @tc.name      PageLoading_CommodityDataSourceFlow_0289
     * @tc.desc      CommodityDataSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0289 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(-4);
      logInfo(`step2 getData(-4): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0289 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0290
     * @tc.name      PageLoading_CommodityDataSourceFlow_0290
     * @tc.desc      CommodityDataSource call flow getData > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0290 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(137);
      logInfo(`step1 getData(137): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(165);
      logInfo(`step3 getData(165): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0290 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0291
     * @tc.name      PageLoading_CommodityDataSourceFlow_0291
     * @tc.desc      CommodityDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0291 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(130);
      logInfo(`step1 getData(130): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0291 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0292
     * @tc.name      PageLoading_CommodityDataSourceFlow_0292
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0292 begin`);
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
      const step4: CommodityDataModel = subject.getData(56);
      logInfo(`step4 getData(56): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0292 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0293
     * @tc.name      PageLoading_CommodityDataSourceFlow_0293
     * @tc.desc      CommodityDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0293 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(80);
      logInfo(`step1 getData(80): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(-18);
      logInfo(`step2 getData(-18): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0293 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0294
     * @tc.name      PageLoading_CommodityDataSourceFlow_0294
     * @tc.desc      CommodityDataSource call flow getData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0294 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(109);
      logInfo(`step1 getData(109): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(35);
      logInfo(`step2 getData(35): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0294 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0295
     * @tc.name      PageLoading_CommodityDataSourceFlow_0295
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > totalCount > totalCount > getData keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0295 begin`);
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
      const step5: CommodityDataModel = subject.getData(35);
      logInfo(`step5 getData(35): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0295 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0296
     * @tc.name      PageLoading_CommodityDataSourceFlow_0296
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0296 begin`);
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
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0296 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0297
     * @tc.name      PageLoading_CommodityDataSourceFlow_0297
     * @tc.desc      CommodityDataSource call flow getData > totalCount > totalCount > totalCount > getData keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0297 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(174);
      logInfo(`step1 getData(174): step1=${step1}`);
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
      const step5: CommodityDataModel = subject.getData(20);
      logInfo(`step5 getData(20): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0297 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0298
     * @tc.name      PageLoading_CommodityDataSourceFlow_0298
     * @tc.desc      CommodityDataSource call flow getData > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0298 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(-75);
      logInfo(`step1 getData(-75): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(190);
      logInfo(`step3 getData(190): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0298 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0299
     * @tc.name      PageLoading_CommodityDataSourceFlow_0299
     * @tc.desc      CommodityDataSource call flow totalCount > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0299 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(193);
      logInfo(`step2 getData(193): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0299 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0300
     * @tc.name      PageLoading_CommodityDataSourceFlow_0300
     * @tc.desc      CommodityDataSource call flow getData > totalCount > totalCount > getData > getData keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0300 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(147);
      logInfo(`step1 getData(147): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: CommodityDataModel = subject.getData(17.59);
      logInfo(`step4 getData(17.59): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: CommodityDataModel = subject.getData(-26);
      logInfo(`step5 getData(-26): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0300 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0301
     * @tc.name      PageLoading_CommodityDataSourceFlow_0301
     * @tc.desc      CommodityDataSource call flow getData > getData > getData > getData > getData keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0301 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(-3);
      logInfo(`step1 getData(-3): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(34.6);
      logInfo(`step2 getData(34.6): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(75.02);
      logInfo(`step3 getData(75.02): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(90.37);
      logInfo(`step4 getData(90.37): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: CommodityDataModel = subject.getData(43);
      logInfo(`step5 getData(43): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0301 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0302
     * @tc.name      PageLoading_CommodityDataSourceFlow_0302
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > totalCount > totalCount keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0302 begin`);
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
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0302 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0303
     * @tc.name      PageLoading_CommodityDataSourceFlow_0303
     * @tc.desc      CommodityDataSource call flow getData > getData > getData > totalCount > getData keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0303 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(145);
      logInfo(`step1 getData(145): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(53.83);
      logInfo(`step2 getData(53.83): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(95);
      logInfo(`step3 getData(95): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: CommodityDataModel = subject.getData(150);
      logInfo(`step5 getData(150): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0303 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0304
     * @tc.name      PageLoading_CommodityDataSourceFlow_0304
     * @tc.desc      CommodityDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0304 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(137);
      logInfo(`step1 getData(137): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(175);
      logInfo(`step2 getData(175): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0304 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0305
     * @tc.name      PageLoading_CommodityDataSourceFlow_0305
     * @tc.desc      CommodityDataSource call flow totalCount > getData > getData > getData > totalCount keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0305 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(-55);
      logInfo(`step2 getData(-55): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(-14);
      logInfo(`step3 getData(-14): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(61.72);
      logInfo(`step4 getData(61.72): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0305 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0306
     * @tc.name      PageLoading_CommodityDataSourceFlow_0306
     * @tc.desc      CommodityDataSource call flow getData > getData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0306 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(101);
      logInfo(`step1 getData(101): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(60);
      logInfo(`step2 getData(60): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(111);
      logInfo(`step3 getData(111): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0306 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0307
     * @tc.name      PageLoading_CommodityDataSourceFlow_0307
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0307 begin`);
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
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0307 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0308
     * @tc.name      PageLoading_CommodityDataSourceFlow_0308
     * @tc.desc      CommodityDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0308 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(17.59);
      logInfo(`step1 getData(17.59): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(-86);
      logInfo(`step2 getData(-86): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0308 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0309
     * @tc.name      PageLoading_CommodityDataSourceFlow_0309
     * @tc.desc      CommodityDataSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0309 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(137);
      logInfo(`step2 getData(137): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0309 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0310
     * @tc.name      PageLoading_CommodityDataSourceFlow_0310
     * @tc.desc      CommodityDataSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0310 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(80);
      logInfo(`step2 getData(80): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0310 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0311
     * @tc.name      PageLoading_CommodityDataSourceFlow_0311
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0311 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0311 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0312
     * @tc.name      PageLoading_CommodityDataSourceFlow_0312
     * @tc.desc      CommodityDataSource call flow getData > getData > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0312 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(155);
      logInfo(`step1 getData(155): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(157);
      logInfo(`step2 getData(157): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: CommodityDataModel = subject.getData(109);
      logInfo(`step4 getData(109): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0312 end`);
    });
  });
}
