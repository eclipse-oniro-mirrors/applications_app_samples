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

/** Logic checks for CommodityDataSource flow (65 cases). */
export default function commodityDataSourceFlow2Test(): void {
  describe('CommodityDataSourceFlow2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0058
     * @tc.name      PageLoading_CommodityDataSourceFlow_0058
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > totalCount > getData > totalCount keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0058 begin`);
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
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0059
     * @tc.name      PageLoading_CommodityDataSourceFlow_0059
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > getData > totalCount > getData keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0059 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(23.59);
      logInfo(`step3 getData(23.59): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: CommodityDataModel = subject.getData(17.59);
      logInfo(`step5 getData(17.59): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0059 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0060
     * @tc.name      PageLoading_CommodityDataSourceFlow_0060
     * @tc.desc      CommodityDataSource call flow getData > totalCount > getData > getData > totalCount keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0060 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(-10);
      logInfo(`step1 getData(-10): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(73);
      logInfo(`step3 getData(73): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(34.6);
      logInfo(`step4 getData(34.6): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0060 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0061
     * @tc.name      PageLoading_CommodityDataSourceFlow_0061
     * @tc.desc      CommodityDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0061 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(27.56);
      logInfo(`step1 getData(27.56): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0061 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0062
     * @tc.name      PageLoading_CommodityDataSourceFlow_0062
     * @tc.desc      CommodityDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0062 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(-26);
      logInfo(`step1 getData(-26): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0062 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0063
     * @tc.name      PageLoading_CommodityDataSourceFlow_0063
     * @tc.desc      CommodityDataSource call flow getData > getData > getData > totalCount > totalCount keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0063 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(56);
      logInfo(`step1 getData(56): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(53);
      logInfo(`step2 getData(53): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(172);
      logInfo(`step3 getData(172): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0063 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0064
     * @tc.name      PageLoading_CommodityDataSourceFlow_0064
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0064 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0064 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0065
     * @tc.name      PageLoading_CommodityDataSourceFlow_0065
     * @tc.desc      CommodityDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0065 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(35);
      logInfo(`step1 getData(35): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0065 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0066
     * @tc.name      PageLoading_CommodityDataSourceFlow_0066
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0066 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(-3);
      logInfo(`step3 getData(-3): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(160);
      logInfo(`step4 getData(160): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0066 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0067
     * @tc.name      PageLoading_CommodityDataSourceFlow_0067
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0067 begin`);
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
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0067 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0068
     * @tc.name      PageLoading_CommodityDataSourceFlow_0068
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0068 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0068 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0069
     * @tc.name      PageLoading_CommodityDataSourceFlow_0069
     * @tc.desc      CommodityDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0069 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(136);
      logInfo(`step1 getData(136): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(144);
      logInfo(`step2 getData(144): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0069 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0070
     * @tc.name      PageLoading_CommodityDataSourceFlow_0070
     * @tc.desc      CommodityDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0070 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(147);
      logInfo(`step1 getData(147): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(123);
      logInfo(`step2 getData(123): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0070 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0071
     * @tc.name      PageLoading_CommodityDataSourceFlow_0071
     * @tc.desc      CommodityDataSource call flow totalCount > getData > getData > getData > totalCount keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0071 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(-92);
      logInfo(`step2 getData(-92): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(73);
      logInfo(`step3 getData(73): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(-99);
      logInfo(`step4 getData(-99): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0071 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0072
     * @tc.name      PageLoading_CommodityDataSourceFlow_0072
     * @tc.desc      CommodityDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0072 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(0);
      logInfo(`step1 getData(0): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0072 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0073
     * @tc.name      PageLoading_CommodityDataSourceFlow_0073
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0073 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0073 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0074
     * @tc.name      PageLoading_CommodityDataSourceFlow_0074
     * @tc.desc      CommodityDataSource call flow getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0074 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(60);
      logInfo(`step1 getData(60): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(123);
      logInfo(`step2 getData(123): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(-99);
      logInfo(`step3 getData(-99): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0074 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0075
     * @tc.name      PageLoading_CommodityDataSourceFlow_0075
     * @tc.desc      CommodityDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0075 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(111);
      logInfo(`step1 getData(111): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(20);
      logInfo(`step2 getData(20): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0075 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0076
     * @tc.name      PageLoading_CommodityDataSourceFlow_0076
     * @tc.desc      CommodityDataSource call flow getData > totalCount > totalCount > totalCount > totalCount keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0076 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(30);
      logInfo(`step1 getData(30): step1=${step1}`);
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
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0076 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0077
     * @tc.name      PageLoading_CommodityDataSourceFlow_0077
     * @tc.desc      CommodityDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0077 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(185);
      logInfo(`step1 getData(185): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(55.49);
      logInfo(`step2 getData(55.49): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0077 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0078
     * @tc.name      PageLoading_CommodityDataSourceFlow_0078
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0078 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(101);
      logInfo(`step3 getData(101): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(85);
      logInfo(`step4 getData(85): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0078 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0079
     * @tc.name      PageLoading_CommodityDataSourceFlow_0079
     * @tc.desc      CommodityDataSource call flow getData > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0079 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(-79);
      logInfo(`step1 getData(-79): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(45);
      logInfo(`step3 getData(45): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0079 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0080
     * @tc.name      PageLoading_CommodityDataSourceFlow_0080
     * @tc.desc      CommodityDataSource call flow getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0080 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(65);
      logInfo(`step1 getData(65): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(101);
      logInfo(`step2 getData(101): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(140);
      logInfo(`step3 getData(140): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0080 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0081
     * @tc.name      PageLoading_CommodityDataSourceFlow_0081
     * @tc.desc      CommodityDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0081 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(170);
      logInfo(`step1 getData(170): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(110);
      logInfo(`step2 getData(110): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0081 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0082
     * @tc.name      PageLoading_CommodityDataSourceFlow_0082
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0082 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0082 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0083
     * @tc.name      PageLoading_CommodityDataSourceFlow_0083
     * @tc.desc      CommodityDataSource call flow getData > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0083 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(155);
      logInfo(`step1 getData(155): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(170);
      logInfo(`step3 getData(170): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0083 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0084
     * @tc.name      PageLoading_CommodityDataSourceFlow_0084
     * @tc.desc      CommodityDataSource call flow getData > getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0084 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(60);
      logInfo(`step1 getData(60): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(80.71);
      logInfo(`step2 getData(80.71): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(192);
      logInfo(`step3 getData(192): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(109);
      logInfo(`step4 getData(109): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0084 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0085
     * @tc.name      PageLoading_CommodityDataSourceFlow_0085
     * @tc.desc      CommodityDataSource call flow totalCount > getData > getData > totalCount > getData keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0085 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(53);
      logInfo(`step2 getData(53): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(174);
      logInfo(`step3 getData(174): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: CommodityDataModel = subject.getData(83.87);
      logInfo(`step5 getData(83.87): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0085 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0086
     * @tc.name      PageLoading_CommodityDataSourceFlow_0086
     * @tc.desc      CommodityDataSource call flow getData > totalCount > totalCount > totalCount > getData keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0086 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(-99);
      logInfo(`step1 getData(-99): step1=${step1}`);
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
      const step5: CommodityDataModel = subject.getData(193);
      logInfo(`step5 getData(193): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0086 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0087
     * @tc.name      PageLoading_CommodityDataSourceFlow_0087
     * @tc.desc      CommodityDataSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0087 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(-86);
      logInfo(`step2 getData(-86): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0087 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0088
     * @tc.name      PageLoading_CommodityDataSourceFlow_0088
     * @tc.desc      CommodityDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0088 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(23.08);
      logInfo(`step1 getData(23.08): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0088 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0089
     * @tc.name      PageLoading_CommodityDataSourceFlow_0089
     * @tc.desc      CommodityDataSource call flow getData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0089 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(38.2);
      logInfo(`step1 getData(38.2): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0089 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0090
     * @tc.name      PageLoading_CommodityDataSourceFlow_0090
     * @tc.desc      CommodityDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0090 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(1);
      logInfo(`step1 getData(1): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0090 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0091
     * @tc.name      PageLoading_CommodityDataSourceFlow_0091
     * @tc.desc      CommodityDataSource call flow getData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0091 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(30);
      logInfo(`step1 getData(30): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0091 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0092
     * @tc.name      PageLoading_CommodityDataSourceFlow_0092
     * @tc.desc      CommodityDataSource call flow getData > getData > totalCount > getData > totalCount keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0092 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(27.56);
      logInfo(`step1 getData(27.56): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(-12);
      logInfo(`step2 getData(-12): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: CommodityDataModel = subject.getData(30);
      logInfo(`step4 getData(30): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0092 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0093
     * @tc.name      PageLoading_CommodityDataSourceFlow_0093
     * @tc.desc      CommodityDataSource call flow getData > totalCount > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0093 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(39);
      logInfo(`step1 getData(39): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(145);
      logInfo(`step3 getData(145): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0093 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0094
     * @tc.name      PageLoading_CommodityDataSourceFlow_0094
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0094 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0094 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0095
     * @tc.name      PageLoading_CommodityDataSourceFlow_0095
     * @tc.desc      CommodityDataSource call flow getData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0095 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(55.49);
      logInfo(`step1 getData(55.49): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0095 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0096
     * @tc.name      PageLoading_CommodityDataSourceFlow_0096
     * @tc.desc      CommodityDataSource call flow getData > getData > getData > totalCount > totalCount keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0096 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(123);
      logInfo(`step1 getData(123): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(-60);
      logInfo(`step2 getData(-60): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(-26);
      logInfo(`step3 getData(-26): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0096 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0097
     * @tc.name      PageLoading_CommodityDataSourceFlow_0097
     * @tc.desc      CommodityDataSource call flow getData > getData > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0097 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(67.86);
      logInfo(`step1 getData(67.86): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(93);
      logInfo(`step2 getData(93): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: CommodityDataModel = subject.getData(60);
      logInfo(`step4 getData(60): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0097 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0098
     * @tc.name      PageLoading_CommodityDataSourceFlow_0098
     * @tc.desc      CommodityDataSource call flow totalCount > getData > getData > getData > getData keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0098 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(27.56);
      logInfo(`step2 getData(27.56): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(75);
      logInfo(`step3 getData(75): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(111);
      logInfo(`step4 getData(111): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: CommodityDataModel = subject.getData(5.8);
      logInfo(`step5 getData(5.8): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0098 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0099
     * @tc.name      PageLoading_CommodityDataSourceFlow_0099
     * @tc.desc      CommodityDataSource call flow getData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0099 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(-4);
      logInfo(`step1 getData(-4): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(112);
      logInfo(`step2 getData(112): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0099 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0100
     * @tc.name      PageLoading_CommodityDataSourceFlow_0100
     * @tc.desc      CommodityDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0100 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(75.02);
      logInfo(`step1 getData(75.02): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(-25);
      logInfo(`step2 getData(-25): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0100 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0101
     * @tc.name      PageLoading_CommodityDataSourceFlow_0101
     * @tc.desc      CommodityDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0101 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(75.02);
      logInfo(`step1 getData(75.02): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0101 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0102
     * @tc.name      PageLoading_CommodityDataSourceFlow_0102
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0102 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0102 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0103
     * @tc.name      PageLoading_CommodityDataSourceFlow_0103
     * @tc.desc      CommodityDataSource call flow getData > getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0103 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(-84);
      logInfo(`step1 getData(-84): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(140);
      logInfo(`step2 getData(140): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(125);
      logInfo(`step3 getData(125): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(176);
      logInfo(`step4 getData(176): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0103 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0104
     * @tc.name      PageLoading_CommodityDataSourceFlow_0104
     * @tc.desc      CommodityDataSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0104 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(150);
      logInfo(`step2 getData(150): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0104 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0105
     * @tc.name      PageLoading_CommodityDataSourceFlow_0105
     * @tc.desc      CommodityDataSource call flow getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0105 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(39);
      logInfo(`step1 getData(39): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(3);
      logInfo(`step2 getData(3): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(30);
      logInfo(`step3 getData(30): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0105 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0106
     * @tc.name      PageLoading_CommodityDataSourceFlow_0106
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > totalCount > totalCount keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0106 begin`);
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
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0106 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0107
     * @tc.name      PageLoading_CommodityDataSourceFlow_0107
     * @tc.desc      CommodityDataSource call flow getData > getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0107 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(88);
      logInfo(`step1 getData(88): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(20);
      logInfo(`step2 getData(20): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(200);
      logInfo(`step3 getData(200): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(115);
      logInfo(`step4 getData(115): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0107 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0108
     * @tc.name      PageLoading_CommodityDataSourceFlow_0108
     * @tc.desc      CommodityDataSource call flow getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0108 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(120);
      logInfo(`step1 getData(120): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(120);
      logInfo(`step2 getData(120): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(20);
      logInfo(`step3 getData(20): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0108 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0109
     * @tc.name      PageLoading_CommodityDataSourceFlow_0109
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0109 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0109 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0110
     * @tc.name      PageLoading_CommodityDataSourceFlow_0110
     * @tc.desc      CommodityDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0110 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(170);
      logInfo(`step1 getData(170): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(38.2);
      logInfo(`step2 getData(38.2): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0110 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0111
     * @tc.name      PageLoading_CommodityDataSourceFlow_0111
     * @tc.desc      CommodityDataSource call flow getData > getData > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0111 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(56);
      logInfo(`step1 getData(56): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(17.59);
      logInfo(`step2 getData(17.59): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: CommodityDataModel = subject.getData(59.08);
      logInfo(`step4 getData(59.08): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0111 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0112
     * @tc.name      PageLoading_CommodityDataSourceFlow_0112
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0112 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0112 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0113
     * @tc.name      PageLoading_CommodityDataSourceFlow_0113
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0113 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(189);
      logInfo(`step3 getData(189): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(-13);
      logInfo(`step4 getData(-13): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0113 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0114
     * @tc.name      PageLoading_CommodityDataSourceFlow_0114
     * @tc.desc      CommodityDataSource call flow getData > getData > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0114 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(-14);
      logInfo(`step1 getData(-14): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(-97);
      logInfo(`step2 getData(-97): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: CommodityDataModel = subject.getData(12);
      logInfo(`step4 getData(12): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0114 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0115
     * @tc.name      PageLoading_CommodityDataSourceFlow_0115
     * @tc.desc      CommodityDataSource call flow getData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0115 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(-79);
      logInfo(`step1 getData(-79): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0115 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0116
     * @tc.name      PageLoading_CommodityDataSourceFlow_0116
     * @tc.desc      CommodityDataSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0116 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(-5);
      logInfo(`step2 getData(-5): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0116 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0117
     * @tc.name      PageLoading_CommodityDataSourceFlow_0117
     * @tc.desc      CommodityDataSource call flow getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0117 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(135);
      logInfo(`step1 getData(135): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(74.54);
      logInfo(`step2 getData(74.54): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(115);
      logInfo(`step3 getData(115): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0117 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0118
     * @tc.name      PageLoading_CommodityDataSourceFlow_0118
     * @tc.desc      CommodityDataSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0118 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(77);
      logInfo(`step2 getData(77): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0118 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0119
     * @tc.name      PageLoading_CommodityDataSourceFlow_0119
     * @tc.desc      CommodityDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0119 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(53.83);
      logInfo(`step1 getData(53.83): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(175);
      logInfo(`step2 getData(175): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0119 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0120
     * @tc.name      PageLoading_CommodityDataSourceFlow_0120
     * @tc.desc      CommodityDataSource call flow getData > totalCount > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0120 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(0);
      logInfo(`step1 getData(0): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(111);
      logInfo(`step3 getData(111): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(17.93);
      logInfo(`step4 getData(17.93): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0120 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0121
     * @tc.name      PageLoading_CommodityDataSourceFlow_0121
     * @tc.desc      CommodityDataSource call flow totalCount > getData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0121 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(56);
      logInfo(`step2 getData(56): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0121 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0122
     * @tc.name      PageLoading_CommodityDataSourceFlow_0122
     * @tc.desc      CommodityDataSource call flow getData > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0122 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(23.08);
      logInfo(`step1 getData(23.08): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(3);
      logInfo(`step3 getData(3): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0122 end`);
    });
  });
}
