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
export default function commodityDataSourceFlow4Test(): void {
  describe('CommodityDataSourceFlow4Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0187
     * @tc.name      PageLoading_CommodityDataSourceFlow_0187
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0187 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0187 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0188
     * @tc.name      PageLoading_CommodityDataSourceFlow_0188
     * @tc.desc      CommodityDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0188 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(3);
      logInfo(`step1 getData(3): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0188 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0189
     * @tc.name      PageLoading_CommodityDataSourceFlow_0189
     * @tc.desc      CommodityDataSource call flow getData > getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0189 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(-18);
      logInfo(`step1 getData(-18): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(23.08);
      logInfo(`step2 getData(23.08): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(193);
      logInfo(`step3 getData(193): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(180);
      logInfo(`step4 getData(180): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0189 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0190
     * @tc.name      PageLoading_CommodityDataSourceFlow_0190
     * @tc.desc      CommodityDataSource call flow getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0190 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(-1);
      logInfo(`step1 getData(-1): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(-99);
      logInfo(`step2 getData(-99): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(160);
      logInfo(`step3 getData(160): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0190 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0191
     * @tc.name      PageLoading_CommodityDataSourceFlow_0191
     * @tc.desc      CommodityDataSource call flow getData > getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0191 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(175);
      logInfo(`step1 getData(175): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(5);
      logInfo(`step2 getData(5): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(170);
      logInfo(`step3 getData(170): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(192);
      logInfo(`step4 getData(192): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0191 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0192
     * @tc.name      PageLoading_CommodityDataSourceFlow_0192
     * @tc.desc      CommodityDataSource call flow getData > totalCount > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0192 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(90.37);
      logInfo(`step1 getData(90.37): step1=${step1}`);
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
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0192 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0193
     * @tc.name      PageLoading_CommodityDataSourceFlow_0193
     * @tc.desc      CommodityDataSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0193 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(77);
      logInfo(`step2 getData(77): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0193 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0194
     * @tc.name      PageLoading_CommodityDataSourceFlow_0194
     * @tc.desc      CommodityDataSource call flow totalCount > getData > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0194 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(-16);
      logInfo(`step2 getData(-16): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: CommodityDataModel = subject.getData(5);
      logInfo(`step4 getData(5): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0194 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0195
     * @tc.name      PageLoading_CommodityDataSourceFlow_0195
     * @tc.desc      CommodityDataSource call flow getData > getData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0195 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(140);
      logInfo(`step1 getData(140): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(83.87);
      logInfo(`step2 getData(83.87): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(74.54);
      logInfo(`step3 getData(74.54): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0195 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0196
     * @tc.name      PageLoading_CommodityDataSourceFlow_0196
     * @tc.desc      CommodityDataSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0196 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(12);
      logInfo(`step2 getData(12): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0196 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0197
     * @tc.name      PageLoading_CommodityDataSourceFlow_0197
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > getData > getData > totalCount keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0197 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(-75);
      logInfo(`step3 getData(-75): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(101);
      logInfo(`step4 getData(101): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0197 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0198
     * @tc.name      PageLoading_CommodityDataSourceFlow_0198
     * @tc.desc      CommodityDataSource call flow getData > totalCount > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0198 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(199);
      logInfo(`step1 getData(199): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: CommodityDataModel = subject.getData(174);
      logInfo(`step4 getData(174): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0198 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0199
     * @tc.name      PageLoading_CommodityDataSourceFlow_0199
     * @tc.desc      CommodityDataSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0199 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(67.86);
      logInfo(`step2 getData(67.86): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0199 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0200
     * @tc.name      PageLoading_CommodityDataSourceFlow_0200
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > totalCount > totalCount > getData keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0200 begin`);
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
      const step5: CommodityDataModel = subject.getData(75);
      logInfo(`step5 getData(75): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0200 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0201
     * @tc.name      PageLoading_CommodityDataSourceFlow_0201
     * @tc.desc      CommodityDataSource call flow totalCount > getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0201 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(78.07);
      logInfo(`step2 getData(78.07): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(157);
      logInfo(`step3 getData(157): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(56.12);
      logInfo(`step4 getData(56.12): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0201 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0202
     * @tc.name      PageLoading_CommodityDataSourceFlow_0202
     * @tc.desc      CommodityDataSource call flow getData > getData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0202 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(-15);
      logInfo(`step1 getData(-15): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(185);
      logInfo(`step2 getData(185): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(67.86);
      logInfo(`step3 getData(67.86): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0202 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0203
     * @tc.name      PageLoading_CommodityDataSourceFlow_0203
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > getData > getData > getData keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0203 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(-26);
      logInfo(`step3 getData(-26): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(75);
      logInfo(`step4 getData(75): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: CommodityDataModel = subject.getData(-55);
      logInfo(`step5 getData(-55): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0203 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0204
     * @tc.name      PageLoading_CommodityDataSourceFlow_0204
     * @tc.desc      CommodityDataSource call flow totalCount > getData > getData > totalCount > getData keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0204 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(147);
      logInfo(`step2 getData(147): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(-59);
      logInfo(`step3 getData(-59): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: CommodityDataModel = subject.getData(40);
      logInfo(`step5 getData(40): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0204 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0205
     * @tc.name      PageLoading_CommodityDataSourceFlow_0205
     * @tc.desc      CommodityDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0205 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(-5);
      logInfo(`step1 getData(-5): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0205 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0206
     * @tc.name      PageLoading_CommodityDataSourceFlow_0206
     * @tc.desc      CommodityDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0206 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(28);
      logInfo(`step1 getData(28): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0206 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0207
     * @tc.name      PageLoading_CommodityDataSourceFlow_0207
     * @tc.desc      CommodityDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0207 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(80);
      logInfo(`step1 getData(80): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(53);
      logInfo(`step2 getData(53): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0207 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0208
     * @tc.name      PageLoading_CommodityDataSourceFlow_0208
     * @tc.desc      CommodityDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0208 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(1);
      logInfo(`step1 getData(1): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(61.72);
      logInfo(`step2 getData(61.72): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0208 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0209
     * @tc.name      PageLoading_CommodityDataSourceFlow_0209
     * @tc.desc      CommodityDataSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0209 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(64);
      logInfo(`step2 getData(64): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0209 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0210
     * @tc.name      PageLoading_CommodityDataSourceFlow_0210
     * @tc.desc      CommodityDataSource call flow getData > totalCount > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0210 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(-13);
      logInfo(`step1 getData(-13): step1=${step1}`);
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
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0210 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0211
     * @tc.name      PageLoading_CommodityDataSourceFlow_0211
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0211 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0211 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0212
     * @tc.name      PageLoading_CommodityDataSourceFlow_0212
     * @tc.desc      CommodityDataSource call flow getData > totalCount > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0212 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(30);
      logInfo(`step1 getData(30): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(185);
      logInfo(`step3 getData(185): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(192);
      logInfo(`step4 getData(192): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0212 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0213
     * @tc.name      PageLoading_CommodityDataSourceFlow_0213
     * @tc.desc      CommodityDataSource call flow totalCount > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0213 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(130);
      logInfo(`step2 getData(130): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(-14);
      logInfo(`step3 getData(-14): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0213 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0214
     * @tc.name      PageLoading_CommodityDataSourceFlow_0214
     * @tc.desc      CommodityDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0214 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(175);
      logInfo(`step1 getData(175): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(137);
      logInfo(`step2 getData(137): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0214 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0215
     * @tc.name      PageLoading_CommodityDataSourceFlow_0215
     * @tc.desc      CommodityDataSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0215 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(-12);
      logInfo(`step2 getData(-12): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0215 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0216
     * @tc.name      PageLoading_CommodityDataSourceFlow_0216
     * @tc.desc      CommodityDataSource call flow getData > getData > getData > getData > getData keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0216 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(35);
      logInfo(`step1 getData(35): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(185);
      logInfo(`step2 getData(185): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(-13);
      logInfo(`step3 getData(-13): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(112);
      logInfo(`step4 getData(112): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: CommodityDataModel = subject.getData(65);
      logInfo(`step5 getData(65): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0216 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0217
     * @tc.name      PageLoading_CommodityDataSourceFlow_0217
     * @tc.desc      CommodityDataSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0217 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(180);
      logInfo(`step2 getData(180): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0217 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0218
     * @tc.name      PageLoading_CommodityDataSourceFlow_0218
     * @tc.desc      CommodityDataSource call flow totalCount > getData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0218 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(5.8);
      logInfo(`step2 getData(5.8): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(115);
      logInfo(`step3 getData(115): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0218 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0219
     * @tc.name      PageLoading_CommodityDataSourceFlow_0219
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0219 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(-12);
      logInfo(`step3 getData(-12): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(34.6);
      logInfo(`step4 getData(34.6): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0219 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0220
     * @tc.name      PageLoading_CommodityDataSourceFlow_0220
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0220 begin`);
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
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0220 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0221
     * @tc.name      PageLoading_CommodityDataSourceFlow_0221
     * @tc.desc      CommodityDataSource call flow getData > getData > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0221 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(-1);
      logInfo(`step1 getData(-1): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(-1);
      logInfo(`step2 getData(-1): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: CommodityDataModel = subject.getData(88.03);
      logInfo(`step4 getData(88.03): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0221 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0222
     * @tc.name      PageLoading_CommodityDataSourceFlow_0222
     * @tc.desc      CommodityDataSource call flow getData > totalCount > getData > totalCount > getData keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0222 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(74.54);
      logInfo(`step1 getData(74.54): step1=${step1}`);
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
      const step5: CommodityDataModel = subject.getData(100);
      logInfo(`step5 getData(100): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0222 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0223
     * @tc.name      PageLoading_CommodityDataSourceFlow_0223
     * @tc.desc      CommodityDataSource call flow totalCount > getData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0223 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(140);
      logInfo(`step2 getData(140): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(-13);
      logInfo(`step3 getData(-13): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0223 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0224
     * @tc.name      PageLoading_CommodityDataSourceFlow_0224
     * @tc.desc      CommodityDataSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0224 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(0);
      logInfo(`step2 getData(0): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0224 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0225
     * @tc.name      PageLoading_CommodityDataSourceFlow_0225
     * @tc.desc      CommodityDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0225 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(70);
      logInfo(`step1 getData(70): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0225 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0226
     * @tc.name      PageLoading_CommodityDataSourceFlow_0226
     * @tc.desc      CommodityDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0226 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(73);
      logInfo(`step1 getData(73): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(35);
      logInfo(`step2 getData(35): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0226 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0227
     * @tc.name      PageLoading_CommodityDataSourceFlow_0227
     * @tc.desc      CommodityDataSource call flow totalCount > getData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0227 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(23.08);
      logInfo(`step2 getData(23.08): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(160);
      logInfo(`step3 getData(160): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0227 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0228
     * @tc.name      PageLoading_CommodityDataSourceFlow_0228
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > totalCount > getData > getData keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0228 begin`);
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
      const step4: CommodityDataModel = subject.getData(88);
      logInfo(`step4 getData(88): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: CommodityDataModel = subject.getData(85);
      logInfo(`step5 getData(85): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0228 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0229
     * @tc.name      PageLoading_CommodityDataSourceFlow_0229
     * @tc.desc      CommodityDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0229 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(70);
      logInfo(`step1 getData(70): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0229 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0230
     * @tc.name      PageLoading_CommodityDataSourceFlow_0230
     * @tc.desc      CommodityDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0230 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(144);
      logInfo(`step1 getData(144): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0230 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0231
     * @tc.name      PageLoading_CommodityDataSourceFlow_0231
     * @tc.desc      CommodityDataSource call flow getData > totalCount > getData > getData > getData keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0231 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(185);
      logInfo(`step1 getData(185): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(-3);
      logInfo(`step3 getData(-3): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(-10);
      logInfo(`step4 getData(-10): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: CommodityDataModel = subject.getData(17.59);
      logInfo(`step5 getData(17.59): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0231 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0232
     * @tc.name      PageLoading_CommodityDataSourceFlow_0232
     * @tc.desc      CommodityDataSource call flow getData > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0232 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(155);
      logInfo(`step1 getData(155): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(35);
      logInfo(`step3 getData(35): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0232 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0233
     * @tc.name      PageLoading_CommodityDataSourceFlow_0233
     * @tc.desc      CommodityDataSource call flow getData > totalCount > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0233 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(109);
      logInfo(`step1 getData(109): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(28);
      logInfo(`step3 getData(28): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0233 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0234
     * @tc.name      PageLoading_CommodityDataSourceFlow_0234
     * @tc.desc      CommodityDataSource call flow totalCount > getData > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0234 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(174);
      logInfo(`step2 getData(174): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: CommodityDataModel = subject.getData(77);
      logInfo(`step4 getData(77): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0234 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0235
     * @tc.name      PageLoading_CommodityDataSourceFlow_0235
     * @tc.desc      CommodityDataSource call flow totalCount > getData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0235 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(61.72);
      logInfo(`step2 getData(61.72): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0235 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0236
     * @tc.name      PageLoading_CommodityDataSourceFlow_0236
     * @tc.desc      CommodityDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0236 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(20);
      logInfo(`step1 getData(20): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(88);
      logInfo(`step2 getData(88): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0236 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0237
     * @tc.name      PageLoading_CommodityDataSourceFlow_0237
     * @tc.desc      CommodityDataSource call flow totalCount > getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0237 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(64);
      logInfo(`step2 getData(64): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(90);
      logInfo(`step3 getData(90): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(-97);
      logInfo(`step4 getData(-97): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0237 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0238
     * @tc.name      PageLoading_CommodityDataSourceFlow_0238
     * @tc.desc      CommodityDataSource call flow getData > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0238 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(85);
      logInfo(`step1 getData(85): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(5);
      logInfo(`step3 getData(5): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0238 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0239
     * @tc.name      PageLoading_CommodityDataSourceFlow_0239
     * @tc.desc      CommodityDataSource call flow getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0239 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(30);
      logInfo(`step1 getData(30): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(74.54);
      logInfo(`step2 getData(74.54): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(20);
      logInfo(`step3 getData(20): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0239 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0240
     * @tc.name      PageLoading_CommodityDataSourceFlow_0240
     * @tc.desc      CommodityDataSource call flow getData > totalCount > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0240 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(157);
      logInfo(`step1 getData(157): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(39);
      logInfo(`step3 getData(39): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0240 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0241
     * @tc.name      PageLoading_CommodityDataSourceFlow_0241
     * @tc.desc      CommodityDataSource call flow totalCount > getData > getData > getData > getData keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0241 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: CommodityDataModel = subject.getData(-14);
      logInfo(`step2 getData(-14): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(55);
      logInfo(`step3 getData(55): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: CommodityDataModel = subject.getData(78.07);
      logInfo(`step4 getData(78.07): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: CommodityDataModel = subject.getData(145);
      logInfo(`step5 getData(145): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0241 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0242
     * @tc.name      PageLoading_CommodityDataSourceFlow_0242
     * @tc.desc      CommodityDataSource call flow getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0242 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(35);
      logInfo(`step1 getData(35): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(67.86);
      logInfo(`step2 getData(67.86): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: CommodityDataModel = subject.getData(75.02);
      logInfo(`step3 getData(75.02): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0242 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0243
     * @tc.name      PageLoading_CommodityDataSourceFlow_0243
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > totalCount > totalCount > totalCount kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0243 begin`);
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
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0243 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0244
     * @tc.name      PageLoading_CommodityDataSourceFlow_0244
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0244 begin`);
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
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0244 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0245
     * @tc.name      PageLoading_CommodityDataSourceFlow_0245
     * @tc.desc      CommodityDataSource call flow getData > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0245 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(189);
      logInfo(`step1 getData(189): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: CommodityDataModel = subject.getData(109);
      logInfo(`step3 getData(109): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0245 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0246
     * @tc.name      PageLoading_CommodityDataSourceFlow_0246
     * @tc.desc      CommodityDataSource call flow getData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0246 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(-55);
      logInfo(`step1 getData(-55): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0246 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0247
     * @tc.name      PageLoading_CommodityDataSourceFlow_0247
     * @tc.desc      CommodityDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0247 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(65);
      logInfo(`step1 getData(65): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0247 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0248
     * @tc.name      PageLoading_CommodityDataSourceFlow_0248
     * @tc.desc      CommodityDataSource call flow getData > getData > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0248 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: CommodityDataModel = subject.getData(53);
      logInfo(`step1 getData(53): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: CommodityDataModel = subject.getData(-79);
      logInfo(`step2 getData(-79): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: CommodityDataModel = subject.getData(50);
      logInfo(`step4 getData(50): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0248 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0249
     * @tc.name      PageLoading_CommodityDataSourceFlow_0249
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0249 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0249 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_DATA_SOURCE_FLOW_0250
     * @tc.name      PageLoading_CommodityDataSourceFlow_0250
     * @tc.desc      CommodityDataSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityDataSourceFlow_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0250 begin`);
      const subject: CommodityDataSource = new CommodityDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommodityDataSourceFlow_0250 end`);
    });
  });
}
