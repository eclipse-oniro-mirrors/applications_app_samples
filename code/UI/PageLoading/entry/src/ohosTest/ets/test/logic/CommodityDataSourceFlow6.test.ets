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

/** Logic checks for CommodityDataSource flow (34 cases). */
export default function commodityDataSourceFlow6Test(): void {
  describe('CommodityDataSourceFlow6Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0313
     * @tc.name      PageLoading_CommodityDataSourceFlow_0313
     * @tc.desc      CommodityDataSource call flow getData > getData > getData > totalCount > getData keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0313 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(59.08);
      logInfo(`step1 getData(59.08): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(34.6);
      logInfo(`step2 getData(34.6): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(-10);
      logInfo(`step3 getData(-10): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: CommodityDataModel = subject.getData(30);
      logInfo(`step5 getData(30): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0313 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0314
     * @tc.name      PageLoading_CommodityDataSourceFlow_0314
     * @tc.desc      CommodityDataSource call flow totalCount > getData > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0314 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(112);
      logInfo(`step2 getData(112): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: CommodityDataModel = subject.getData(100);
      logInfo(`step4 getData(100): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0314 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0315
     * @tc.name      PageLoading_CommodityDataSourceFlow_0315
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0315 begin`);
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
      const step4: CommodityDataModel = subject.getData(15);
      logInfo(`step4 getData(15): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0315 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0316
     * @tc.name      PageLoading_CommodityDataSourceFlow_0316
     * @tc.desc      CommodityDataSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0316 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(-92);
      logInfo(`step2 getData(-92): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0316 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0317
     * @tc.name      PageLoading_CommodityDataSourceFlow_0317
     * @tc.desc      CommodityDataSource call flow totalCount > getData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0317 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(80.71);
      logInfo(`step2 getData(80.71): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(43);
      logInfo(`step3 getData(43): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0317 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0318
     * @tc.name      PageLoading_CommodityDataSourceFlow_0318
     * @tc.desc      CommodityDataSource call flow totalCount > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0318 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(83.87);
      logInfo(`step2 getData(83.87): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0318 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0319
     * @tc.name      PageLoading_CommodityDataSourceFlow_0319
     * @tc.desc      CommodityDataSource call flow totalCount > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0319 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(17.93);
      logInfo(`step2 getData(17.93): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(109);
      logInfo(`step3 getData(109): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0319 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0320
     * @tc.name      PageLoading_CommodityDataSourceFlow_0320
     * @tc.desc      CommodityDataSource call flow totalCount > getData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0320 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(59.08);
      logInfo(`step2 getData(59.08): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(-92);
      logInfo(`step3 getData(-92): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0320 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0321
     * @tc.name      PageLoading_CommodityDataSourceFlow_0321
     * @tc.desc      CommodityDataSource call flow totalCount > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0321 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(45);
      logInfo(`step2 getData(45): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(17.93);
      logInfo(`step3 getData(17.93): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0321 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0322
     * @tc.name      PageLoading_CommodityDataSourceFlow_0322
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > totalCount > totalCount > getData keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0322 begin`);
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
      const step5: CommodityDataModel = subject.getData(27.56);
      logInfo(`step5 getData(27.56): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0322 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0323
     * @tc.name      PageLoading_CommodityDataSourceFlow_0323
     * @tc.desc      CommodityDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0323 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(120);
      logInfo(`step1 getData(120): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0323 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0324
     * @tc.name      PageLoading_CommodityDataSourceFlow_0324
     * @tc.desc      CommodityDataSource call flow totalCount > getData > getData > getData > totalCount keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0324 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(-59);
      logInfo(`step2 getData(-59): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(147);
      logInfo(`step3 getData(147): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(-16);
      logInfo(`step4 getData(-16): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0324 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0325
     * @tc.name      PageLoading_CommodityDataSourceFlow_0325
     * @tc.desc      CommodityDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0325 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(-5);
      logInfo(`step1 getData(-5): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0325 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0326
     * @tc.name      PageLoading_CommodityDataSourceFlow_0326
     * @tc.desc      CommodityDataSource call flow getData > getData > totalCount > getData > totalCount keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0326 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(65);
      logInfo(`step1 getData(65): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(-92);
      logInfo(`step2 getData(-92): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: CommodityDataModel = subject.getData(137);
      logInfo(`step4 getData(137): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0326 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0327
     * @tc.name      PageLoading_CommodityDataSourceFlow_0327
     * @tc.desc      CommodityDataSource call flow getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0327 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(192);
      logInfo(`step1 getData(192): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(28);
      logInfo(`step2 getData(28): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(140);
      logInfo(`step3 getData(140): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0327 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0328
     * @tc.name      PageLoading_CommodityDataSourceFlow_0328
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0328 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0328 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0329
     * @tc.name      PageLoading_CommodityDataSourceFlow_0329
     * @tc.desc      CommodityDataSource call flow getData > getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0329 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(34.6);
      logInfo(`step1 getData(34.6): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(190);
      logInfo(`step2 getData(190): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(70);
      logInfo(`step3 getData(70): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(80);
      logInfo(`step4 getData(80): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0329 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0330
     * @tc.name      PageLoading_CommodityDataSourceFlow_0330
     * @tc.desc      CommodityDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0330 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(-75);
      logInfo(`step1 getData(-75): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0330 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0331
     * @tc.name      PageLoading_CommodityDataSourceFlow_0331
     * @tc.desc      CommodityDataSource call flow getData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0331 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(111);
      logInfo(`step1 getData(111): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(17.59);
      logInfo(`step2 getData(17.59): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0331 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0332
     * @tc.name      PageLoading_CommodityDataSourceFlow_0332
     * @tc.desc      CommodityDataSource call flow getData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0332 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(110);
      logInfo(`step1 getData(110): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(5);
      logInfo(`step2 getData(5): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0332 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0333
     * @tc.name      PageLoading_CommodityDataSourceFlow_0333
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > totalCount > getData > getData keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0333 begin`);
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
      const step4: CommodityDataModel = subject.getData(1);
      logInfo(`step4 getData(1): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: CommodityDataModel = subject.getData(-67);
      logInfo(`step5 getData(-67): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0333 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0334
     * @tc.name      PageLoading_CommodityDataSourceFlow_0334
     * @tc.desc      CommodityDataSource call flow getData > totalCount > totalCount > totalCount > totalCount keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0334 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(193);
      logInfo(`step1 getData(193): step1=${step1}`);
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
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0334 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0335
     * @tc.name      PageLoading_CommodityDataSourceFlow_0335
     * @tc.desc      CommodityDataSource call flow getData > getData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0335 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(15);
      logInfo(`step1 getData(15): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(155);
      logInfo(`step2 getData(155): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0335 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0336
     * @tc.name      PageLoading_CommodityDataSourceFlow_0336
     * @tc.desc      CommodityDataSource call flow getData > totalCount > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0336 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(193);
      logInfo(`step1 getData(193): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(34.6);
      logInfo(`step3 getData(34.6): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(56);
      logInfo(`step4 getData(56): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0336 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0337
     * @tc.name      PageLoading_CommodityDataSourceFlow_0337
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0337 begin`);
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
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0337 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0338
     * @tc.name      PageLoading_CommodityDataSourceFlow_0338
     * @tc.desc      CommodityDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0338 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(190);
      logInfo(`step1 getData(190): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(0);
      logInfo(`step2 getData(0): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0338 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0339
     * @tc.name      PageLoading_CommodityDataSourceFlow_0339
     * @tc.desc      CommodityDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0339 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(-68);
      logInfo(`step1 getData(-68): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0339 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0340
     * @tc.name      PageLoading_CommodityDataSourceFlow_0340
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0340 begin`);
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
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0340 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0341
     * @tc.name      PageLoading_CommodityDataSourceFlow_0341
     * @tc.desc      CommodityDataSource call flow getData > getData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0341 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(23.08);
      logInfo(`step1 getData(23.08): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(56);
      logInfo(`step2 getData(56): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0341 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0342
     * @tc.name      PageLoading_CommodityDataSourceFlow_0342
     * @tc.desc      CommodityDataSource call flow totalCount > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0342 begin`);
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
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0342 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0343
     * @tc.name      PageLoading_CommodityDataSourceFlow_0343
     * @tc.desc      CommodityDataSource call flow totalCount > getData > totalCount > getData > getData keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0343 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(83.87);
      logInfo(`step2 getData(83.87): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: CommodityDataModel = subject.getData(-79);
      logInfo(`step4 getData(-79): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: CommodityDataModel = subject.getData(195);
      logInfo(`step5 getData(195): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0343 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0344
     * @tc.name      PageLoading_CommodityDataSourceFlow_0344
     * @tc.desc      CommodityDataSource call flow totalCount > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0344 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(-79);
      logInfo(`step2 getData(-79): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(0);
      logInfo(`step3 getData(0): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0344 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0345
     * @tc.name      PageLoading_CommodityDataSourceFlow_0345
     * @tc.desc      CommodityDataSource call flow totalCount > getData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0345 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(1);
      logInfo(`step2 getData(1): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(83.87);
      logInfo(`step3 getData(83.87): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0345 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0346
     * @tc.name      PageLoading_CommodityDataSourceFlow_0346
     * @tc.desc      CommodityDataSource call flow totalCount > getData > getData > totalCount > getData keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0346 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(80);
      logInfo(`step2 getData(80): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(70);
      logInfo(`step3 getData(70): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: CommodityDataModel = subject.getData(34.6);
      logInfo(`step5 getData(34.6): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0346 end`);
    });
  });
}
