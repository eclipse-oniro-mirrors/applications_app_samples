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
import { productResourceNames } from '../model/PageLoadingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PageLoading]';
const BUNDLE: string = 'PageLoading_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for productResourceNames (50 cases). */
export default function productResourceNames2Test(): void {
  describe('ProductResourceNames2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0071
     * @tc.name      PageLoading_ProductResourceNames_0071
     * @tc.desc      productResourceNames(id=137) returns ["page_loading_commodity_insurance137"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0071 begin`);
      const actual: string[] = productResourceNames(137);
      logInfo(`productResourceNames(id=137): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=137): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity137"]');
      logInfo(`productResourceNames(id=137): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price137"]');
      logInfo(`productResourceNames(id=137): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance137"]');
      logInfo(`${BUNDLE}ProductResourceNames_0071 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0072
     * @tc.name      PageLoading_ProductResourceNames_0072
     * @tc.desc      productResourceNames(id=149) returns ["page_loading_commodity_insurance149"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0072 begin`);
      const actual: string[] = productResourceNames(149);
      logInfo(`productResourceNames(id=149): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=149): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity149"]');
      logInfo(`productResourceNames(id=149): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price149"]');
      logInfo(`productResourceNames(id=149): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance149"]');
      logInfo(`${BUNDLE}ProductResourceNames_0072 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0073
     * @tc.name      PageLoading_ProductResourceNames_0073
     * @tc.desc      productResourceNames(id=-10) returns ["page_loading_commodity_insurance0-10"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductResourceNames_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0073 begin`);
      const actual: string[] = productResourceNames(-10);
      logInfo(`productResourceNames(id=-10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=-10): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity0-10"]');
      logInfo(`productResourceNames(id=-10): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price0-10"]');
      logInfo(`productResourceNames(id=-10): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance0-10"]');
      logInfo(`${BUNDLE}ProductResourceNames_0073 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0074
     * @tc.name      PageLoading_ProductResourceNames_0074
     * @tc.desc      productResourceNames(id=41) returns ["page_loading_commodity_insurance41"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0074 begin`);
      const actual: string[] = productResourceNames(41);
      logInfo(`productResourceNames(id=41): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=41): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity41"]');
      logInfo(`productResourceNames(id=41): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price41"]');
      logInfo(`productResourceNames(id=41): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance41"]');
      logInfo(`${BUNDLE}ProductResourceNames_0074 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0075
     * @tc.name      PageLoading_ProductResourceNames_0075
     * @tc.desc      productResourceNames(id=0.32) returns ["page_loading_commodity_insurance00.32"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0075 begin`);
      const actual: string[] = productResourceNames(0.32);
      logInfo(`productResourceNames(id=0.32): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=0.32): JSON.stringify(actual.slice(0, ...${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity00.32"]');
      logInfo(`productResourceNames(id=0.32): JSON.stringify(actual.slice(2, ...${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price00.32"]');
      logInfo(`productResourceNames(id=0.32): JSON.stringify(actual.slice(4, ...${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance00.32"]');
      logInfo(`${BUNDLE}ProductResourceNames_0075 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0076
     * @tc.name      PageLoading_ProductResourceNames_0076
     * @tc.desc      productResourceNames(id=-50) returns ["page_loading_commodity_insurance0-50"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductResourceNames_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0076 begin`);
      const actual: string[] = productResourceNames(-50);
      logInfo(`productResourceNames(id=-50): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=-50): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity0-50"]');
      logInfo(`productResourceNames(id=-50): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price0-50"]');
      logInfo(`productResourceNames(id=-50): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance0-50"]');
      logInfo(`${BUNDLE}ProductResourceNames_0076 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0077
     * @tc.name      PageLoading_ProductResourceNames_0077
     * @tc.desc      productResourceNames(id=-23) returns ["page_loading_commodity_insurance0-23"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductResourceNames_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0077 begin`);
      const actual: string[] = productResourceNames(-23);
      logInfo(`productResourceNames(id=-23): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=-23): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity0-23"]');
      logInfo(`productResourceNames(id=-23): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price0-23"]');
      logInfo(`productResourceNames(id=-23): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance0-23"]');
      logInfo(`${BUNDLE}ProductResourceNames_0077 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0078
     * @tc.name      PageLoading_ProductResourceNames_0078
     * @tc.desc      productResourceNames(id=122) returns ["page_loading_commodity_insurance122"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0078 begin`);
      const actual: string[] = productResourceNames(122);
      logInfo(`productResourceNames(id=122): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=122): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity122"]');
      logInfo(`productResourceNames(id=122): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price122"]');
      logInfo(`productResourceNames(id=122): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance122"]');
      logInfo(`${BUNDLE}ProductResourceNames_0078 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0079
     * @tc.name      PageLoading_ProductResourceNames_0079
     * @tc.desc      productResourceNames(id=-84) returns ["page_loading_commodity_insurance0-84"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductResourceNames_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0079 begin`);
      const actual: string[] = productResourceNames(-84);
      logInfo(`productResourceNames(id=-84): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=-84): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity0-84"]');
      logInfo(`productResourceNames(id=-84): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price0-84"]');
      logInfo(`productResourceNames(id=-84): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance0-84"]');
      logInfo(`${BUNDLE}ProductResourceNames_0079 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0080
     * @tc.name      PageLoading_ProductResourceNames_0080
     * @tc.desc      productResourceNames(id=-9) returns ["page_loading_commodity_insurance0-9"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductResourceNames_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0080 begin`);
      const actual: string[] = productResourceNames(-9);
      logInfo(`productResourceNames(id=-9): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=-9): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity0-9"]');
      logInfo(`productResourceNames(id=-9): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price0-9"]');
      logInfo(`productResourceNames(id=-9): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance0-9"]');
      logInfo(`${BUNDLE}ProductResourceNames_0080 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0081
     * @tc.name      PageLoading_ProductResourceNames_0081
     * @tc.desc      productResourceNames(id=53) returns ["page_loading_commodity_insurance53"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0081 begin`);
      const actual: string[] = productResourceNames(53);
      logInfo(`productResourceNames(id=53): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=53): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity53"]');
      logInfo(`productResourceNames(id=53): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price53"]');
      logInfo(`productResourceNames(id=53): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance53"]');
      logInfo(`${BUNDLE}ProductResourceNames_0081 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0082
     * @tc.name      PageLoading_ProductResourceNames_0082
     * @tc.desc      productResourceNames(id=168) returns ["page_loading_commodity_insurance168"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0082 begin`);
      const actual: string[] = productResourceNames(168);
      logInfo(`productResourceNames(id=168): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=168): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity168"]');
      logInfo(`productResourceNames(id=168): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price168"]');
      logInfo(`productResourceNames(id=168): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance168"]');
      logInfo(`${BUNDLE}ProductResourceNames_0082 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0083
     * @tc.name      PageLoading_ProductResourceNames_0083
     * @tc.desc      productResourceNames(id=147) returns ["page_loading_commodity_insurance147"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0083 begin`);
      const actual: string[] = productResourceNames(147);
      logInfo(`productResourceNames(id=147): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=147): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity147"]');
      logInfo(`productResourceNames(id=147): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price147"]');
      logInfo(`productResourceNames(id=147): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance147"]');
      logInfo(`${BUNDLE}ProductResourceNames_0083 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0084
     * @tc.name      PageLoading_ProductResourceNames_0084
     * @tc.desc      productResourceNames(id=39.76) returns ["page_loading_commodity_insurance39.76"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0084 begin`);
      const actual: string[] = productResourceNames(39.76);
      logInfo(`productResourceNames(id=39.76): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=39.76): JSON.stringify(actual.slice(0,...${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity39.76"]');
      logInfo(`productResourceNames(id=39.76): JSON.stringify(actual.slice(2,...${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price39.76"]');
      logInfo(`productResourceNames(id=39.76): JSON.stringify(actual.slice(4,...${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance39.76"]');
      logInfo(`${BUNDLE}ProductResourceNames_0084 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0085
     * @tc.name      PageLoading_ProductResourceNames_0085
     * @tc.desc      productResourceNames(id=59.86) returns ["page_loading_commodity_insurance59.86"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0085 begin`);
      const actual: string[] = productResourceNames(59.86);
      logInfo(`productResourceNames(id=59.86): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=59.86): JSON.stringify(actual.slice(0,...${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity59.86"]');
      logInfo(`productResourceNames(id=59.86): JSON.stringify(actual.slice(2,...${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price59.86"]');
      logInfo(`productResourceNames(id=59.86): JSON.stringify(actual.slice(4,...${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance59.86"]');
      logInfo(`${BUNDLE}ProductResourceNames_0085 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0086
     * @tc.name      PageLoading_ProductResourceNames_0086
     * @tc.desc      productResourceNames(id=-60) returns ["page_loading_commodity_insurance0-60"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductResourceNames_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0086 begin`);
      const actual: string[] = productResourceNames(-60);
      logInfo(`productResourceNames(id=-60): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=-60): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity0-60"]');
      logInfo(`productResourceNames(id=-60): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price0-60"]');
      logInfo(`productResourceNames(id=-60): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance0-60"]');
      logInfo(`${BUNDLE}ProductResourceNames_0086 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0087
     * @tc.name      PageLoading_ProductResourceNames_0087
     * @tc.desc      productResourceNames(id=81) returns ["page_loading_commodity_insurance81"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0087 begin`);
      const actual: string[] = productResourceNames(81);
      logInfo(`productResourceNames(id=81): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=81): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity81"]');
      logInfo(`productResourceNames(id=81): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price81"]');
      logInfo(`productResourceNames(id=81): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance81"]');
      logInfo(`${BUNDLE}ProductResourceNames_0087 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0088
     * @tc.name      PageLoading_ProductResourceNames_0088
     * @tc.desc      productResourceNames(id=-95) returns ["page_loading_commodity_insurance0-95"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductResourceNames_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0088 begin`);
      const actual: string[] = productResourceNames(-95);
      logInfo(`productResourceNames(id=-95): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=-95): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity0-95"]');
      logInfo(`productResourceNames(id=-95): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price0-95"]');
      logInfo(`productResourceNames(id=-95): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance0-95"]');
      logInfo(`${BUNDLE}ProductResourceNames_0088 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0089
     * @tc.name      PageLoading_ProductResourceNames_0089
     * @tc.desc      productResourceNames(id=32) returns ["page_loading_commodity_insurance32"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0089 begin`);
      const actual: string[] = productResourceNames(32);
      logInfo(`productResourceNames(id=32): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=32): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity32"]');
      logInfo(`productResourceNames(id=32): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price32"]');
      logInfo(`productResourceNames(id=32): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance32"]');
      logInfo(`${BUNDLE}ProductResourceNames_0089 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0090
     * @tc.name      PageLoading_ProductResourceNames_0090
     * @tc.desc      productResourceNames(id=3.39) returns ["page_loading_commodity_insurance03.39"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0090 begin`);
      const actual: string[] = productResourceNames(3.39);
      logInfo(`productResourceNames(id=3.39): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=3.39): JSON.stringify(actual.slice(0, ...${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity03.39"]');
      logInfo(`productResourceNames(id=3.39): JSON.stringify(actual.slice(2, ...${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price03.39"]');
      logInfo(`productResourceNames(id=3.39): JSON.stringify(actual.slice(4, ...${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance03.39"]');
      logInfo(`${BUNDLE}ProductResourceNames_0090 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0091
     * @tc.name      PageLoading_ProductResourceNames_0091
     * @tc.desc      productResourceNames(id=-20) returns ["page_loading_commodity_insurance0-20"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductResourceNames_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0091 begin`);
      const actual: string[] = productResourceNames(-20);
      logInfo(`productResourceNames(id=-20): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=-20): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity0-20"]');
      logInfo(`productResourceNames(id=-20): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price0-20"]');
      logInfo(`productResourceNames(id=-20): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance0-20"]');
      logInfo(`${BUNDLE}ProductResourceNames_0091 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0092
     * @tc.name      PageLoading_ProductResourceNames_0092
     * @tc.desc      productResourceNames(id=69) returns ["page_loading_commodity_insurance69"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0092 begin`);
      const actual: string[] = productResourceNames(69);
      logInfo(`productResourceNames(id=69): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=69): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity69"]');
      logInfo(`productResourceNames(id=69): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price69"]');
      logInfo(`productResourceNames(id=69): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance69"]');
      logInfo(`${BUNDLE}ProductResourceNames_0092 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0093
     * @tc.name      PageLoading_ProductResourceNames_0093
     * @tc.desc      productResourceNames(id=-83) returns ["page_loading_commodity_insurance0-83"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductResourceNames_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0093 begin`);
      const actual: string[] = productResourceNames(-83);
      logInfo(`productResourceNames(id=-83): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=-83): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity0-83"]');
      logInfo(`productResourceNames(id=-83): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price0-83"]');
      logInfo(`productResourceNames(id=-83): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance0-83"]');
      logInfo(`${BUNDLE}ProductResourceNames_0093 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0094
     * @tc.name      PageLoading_ProductResourceNames_0094
     * @tc.desc      productResourceNames(id=14) returns ["page_loading_commodity_insurance14"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0094 begin`);
      const actual: string[] = productResourceNames(14);
      logInfo(`productResourceNames(id=14): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=14): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity14"]');
      logInfo(`productResourceNames(id=14): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price14"]');
      logInfo(`productResourceNames(id=14): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance14"]');
      logInfo(`${BUNDLE}ProductResourceNames_0094 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0095
     * @tc.name      PageLoading_ProductResourceNames_0095
     * @tc.desc      productResourceNames(id=102) returns ["page_loading_commodity_insurance102"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0095 begin`);
      const actual: string[] = productResourceNames(102);
      logInfo(`productResourceNames(id=102): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=102): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity102"]');
      logInfo(`productResourceNames(id=102): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price102"]');
      logInfo(`productResourceNames(id=102): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance102"]');
      logInfo(`${BUNDLE}ProductResourceNames_0095 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0096
     * @tc.name      PageLoading_ProductResourceNames_0096
     * @tc.desc      productResourceNames(id=191) returns ["page_loading_commodity_insurance191"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0096 begin`);
      const actual: string[] = productResourceNames(191);
      logInfo(`productResourceNames(id=191): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=191): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity191"]');
      logInfo(`productResourceNames(id=191): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price191"]');
      logInfo(`productResourceNames(id=191): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance191"]');
      logInfo(`${BUNDLE}ProductResourceNames_0096 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0097
     * @tc.name      PageLoading_ProductResourceNames_0097
     * @tc.desc      productResourceNames(id=92.1) returns ["page_loading_commodity_insurance92.1"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0097 begin`);
      const actual: string[] = productResourceNames(92.1);
      logInfo(`productResourceNames(id=92.1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=92.1): JSON.stringify(actual.slice(0, ...${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity92.1"]');
      logInfo(`productResourceNames(id=92.1): JSON.stringify(actual.slice(2, ...${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price92.1"]');
      logInfo(`productResourceNames(id=92.1): JSON.stringify(actual.slice(4, ...${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance92.1"]');
      logInfo(`${BUNDLE}ProductResourceNames_0097 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0098
     * @tc.name      PageLoading_ProductResourceNames_0098
     * @tc.desc      productResourceNames(id=-68) returns ["page_loading_commodity_insurance0-68"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductResourceNames_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0098 begin`);
      const actual: string[] = productResourceNames(-68);
      logInfo(`productResourceNames(id=-68): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=-68): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity0-68"]');
      logInfo(`productResourceNames(id=-68): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price0-68"]');
      logInfo(`productResourceNames(id=-68): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance0-68"]');
      logInfo(`${BUNDLE}ProductResourceNames_0098 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0099
     * @tc.name      PageLoading_ProductResourceNames_0099
     * @tc.desc      productResourceNames(id=45.56) returns ["page_loading_commodity_insurance45.56"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0099 begin`);
      const actual: string[] = productResourceNames(45.56);
      logInfo(`productResourceNames(id=45.56): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=45.56): JSON.stringify(actual.slice(0,...${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity45.56"]');
      logInfo(`productResourceNames(id=45.56): JSON.stringify(actual.slice(2,...${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price45.56"]');
      logInfo(`productResourceNames(id=45.56): JSON.stringify(actual.slice(4,...${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance45.56"]');
      logInfo(`${BUNDLE}ProductResourceNames_0099 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0100
     * @tc.name      PageLoading_ProductResourceNames_0100
     * @tc.desc      productResourceNames(id=1.73) returns ["page_loading_commodity_insurance01.73"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0100 begin`);
      const actual: string[] = productResourceNames(1.73);
      logInfo(`productResourceNames(id=1.73): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=1.73): JSON.stringify(actual.slice(0, ...${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity01.73"]');
      logInfo(`productResourceNames(id=1.73): JSON.stringify(actual.slice(2, ...${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price01.73"]');
      logInfo(`productResourceNames(id=1.73): JSON.stringify(actual.slice(4, ...${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance01.73"]');
      logInfo(`${BUNDLE}ProductResourceNames_0100 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0101
     * @tc.name      PageLoading_ProductResourceNames_0101
     * @tc.desc      productResourceNames(id=156) returns ["page_loading_commodity_insurance156"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0101 begin`);
      const actual: string[] = productResourceNames(156);
      logInfo(`productResourceNames(id=156): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=156): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity156"]');
      logInfo(`productResourceNames(id=156): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price156"]');
      logInfo(`productResourceNames(id=156): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance156"]');
      logInfo(`${BUNDLE}ProductResourceNames_0101 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0102
     * @tc.name      PageLoading_ProductResourceNames_0102
     * @tc.desc      productResourceNames(id=198) returns ["page_loading_commodity_insurance198"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0102 begin`);
      const actual: string[] = productResourceNames(198);
      logInfo(`productResourceNames(id=198): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=198): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity198"]');
      logInfo(`productResourceNames(id=198): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price198"]');
      logInfo(`productResourceNames(id=198): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance198"]');
      logInfo(`${BUNDLE}ProductResourceNames_0102 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0103
     * @tc.name      PageLoading_ProductResourceNames_0103
     * @tc.desc      productResourceNames(id=109) returns ["page_loading_commodity_insurance109"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0103 begin`);
      const actual: string[] = productResourceNames(109);
      logInfo(`productResourceNames(id=109): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=109): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity109"]');
      logInfo(`productResourceNames(id=109): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price109"]');
      logInfo(`productResourceNames(id=109): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance109"]');
      logInfo(`${BUNDLE}ProductResourceNames_0103 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0104
     * @tc.name      PageLoading_ProductResourceNames_0104
     * @tc.desc      productResourceNames(id=113) returns ["page_loading_commodity_insurance113"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0104 begin`);
      const actual: string[] = productResourceNames(113);
      logInfo(`productResourceNames(id=113): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=113): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity113"]');
      logInfo(`productResourceNames(id=113): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price113"]');
      logInfo(`productResourceNames(id=113): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance113"]');
      logInfo(`${BUNDLE}ProductResourceNames_0104 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0105
     * @tc.name      PageLoading_ProductResourceNames_0105
     * @tc.desc      productResourceNames(id=93.81) returns ["page_loading_commodity_insurance93.81"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0105 begin`);
      const actual: string[] = productResourceNames(93.81);
      logInfo(`productResourceNames(id=93.81): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=93.81): JSON.stringify(actual.slice(0,...${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity93.81"]');
      logInfo(`productResourceNames(id=93.81): JSON.stringify(actual.slice(2,...${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price93.81"]');
      logInfo(`productResourceNames(id=93.81): JSON.stringify(actual.slice(4,...${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance93.81"]');
      logInfo(`${BUNDLE}ProductResourceNames_0105 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0106
     * @tc.name      PageLoading_ProductResourceNames_0106
     * @tc.desc      productResourceNames(id=107) returns ["page_loading_commodity_insurance107"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0106 begin`);
      const actual: string[] = productResourceNames(107);
      logInfo(`productResourceNames(id=107): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=107): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity107"]');
      logInfo(`productResourceNames(id=107): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price107"]');
      logInfo(`productResourceNames(id=107): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance107"]');
      logInfo(`${BUNDLE}ProductResourceNames_0106 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0107
     * @tc.name      PageLoading_ProductResourceNames_0107
     * @tc.desc      productResourceNames(id=67.9) returns ["page_loading_commodity_insurance67.9"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0107 begin`);
      const actual: string[] = productResourceNames(67.9);
      logInfo(`productResourceNames(id=67.9): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=67.9): JSON.stringify(actual.slice(0, ...${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity67.9"]');
      logInfo(`productResourceNames(id=67.9): JSON.stringify(actual.slice(2, ...${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price67.9"]');
      logInfo(`productResourceNames(id=67.9): JSON.stringify(actual.slice(4, ...${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance67.9"]');
      logInfo(`${BUNDLE}ProductResourceNames_0107 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0108
     * @tc.name      PageLoading_ProductResourceNames_0108
     * @tc.desc      productResourceNames(id=163) returns ["page_loading_commodity_insurance163"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0108 begin`);
      const actual: string[] = productResourceNames(163);
      logInfo(`productResourceNames(id=163): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=163): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity163"]');
      logInfo(`productResourceNames(id=163): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price163"]');
      logInfo(`productResourceNames(id=163): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance163"]');
      logInfo(`${BUNDLE}ProductResourceNames_0108 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0109
     * @tc.name      PageLoading_ProductResourceNames_0109
     * @tc.desc      productResourceNames(id=62.22) returns ["page_loading_commodity_insurance62.22"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0109 begin`);
      const actual: string[] = productResourceNames(62.22);
      logInfo(`productResourceNames(id=62.22): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=62.22): JSON.stringify(actual.slice(0,...${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity62.22"]');
      logInfo(`productResourceNames(id=62.22): JSON.stringify(actual.slice(2,...${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price62.22"]');
      logInfo(`productResourceNames(id=62.22): JSON.stringify(actual.slice(4,...${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance62.22"]');
      logInfo(`${BUNDLE}ProductResourceNames_0109 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0110
     * @tc.name      PageLoading_ProductResourceNames_0110
     * @tc.desc      productResourceNames(id=55.85) returns ["page_loading_commodity_insurance55.85"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0110 begin`);
      const actual: string[] = productResourceNames(55.85);
      logInfo(`productResourceNames(id=55.85): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=55.85): JSON.stringify(actual.slice(0,...${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity55.85"]');
      logInfo(`productResourceNames(id=55.85): JSON.stringify(actual.slice(2,...${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price55.85"]');
      logInfo(`productResourceNames(id=55.85): JSON.stringify(actual.slice(4,...${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance55.85"]');
      logInfo(`${BUNDLE}ProductResourceNames_0110 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0111
     * @tc.name      PageLoading_ProductResourceNames_0111
     * @tc.desc      productResourceNames(id=-6) returns ["page_loading_commodity_insurance0-6"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductResourceNames_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0111 begin`);
      const actual: string[] = productResourceNames(-6);
      logInfo(`productResourceNames(id=-6): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=-6): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity0-6"]');
      logInfo(`productResourceNames(id=-6): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price0-6"]');
      logInfo(`productResourceNames(id=-6): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance0-6"]');
      logInfo(`${BUNDLE}ProductResourceNames_0111 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0112
     * @tc.name      PageLoading_ProductResourceNames_0112
     * @tc.desc      productResourceNames(id=143) returns ["page_loading_commodity_insurance143"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0112 begin`);
      const actual: string[] = productResourceNames(143);
      logInfo(`productResourceNames(id=143): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=143): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity143"]');
      logInfo(`productResourceNames(id=143): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price143"]');
      logInfo(`productResourceNames(id=143): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance143"]');
      logInfo(`${BUNDLE}ProductResourceNames_0112 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0113
     * @tc.name      PageLoading_ProductResourceNames_0113
     * @tc.desc      productResourceNames(id=23) returns ["page_loading_commodity_insurance23"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0113 begin`);
      const actual: string[] = productResourceNames(23);
      logInfo(`productResourceNames(id=23): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=23): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity23"]');
      logInfo(`productResourceNames(id=23): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price23"]');
      logInfo(`productResourceNames(id=23): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance23"]');
      logInfo(`${BUNDLE}ProductResourceNames_0113 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0114
     * @tc.name      PageLoading_ProductResourceNames_0114
     * @tc.desc      productResourceNames(id=74) returns ["page_loading_commodity_insurance74"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0114 begin`);
      const actual: string[] = productResourceNames(74);
      logInfo(`productResourceNames(id=74): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=74): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity74"]');
      logInfo(`productResourceNames(id=74): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price74"]');
      logInfo(`productResourceNames(id=74): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance74"]');
      logInfo(`${BUNDLE}ProductResourceNames_0114 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0115
     * @tc.name      PageLoading_ProductResourceNames_0115
     * @tc.desc      productResourceNames(id=97.46) returns ["page_loading_commodity_insurance97.46"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0115 begin`);
      const actual: string[] = productResourceNames(97.46);
      logInfo(`productResourceNames(id=97.46): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=97.46): JSON.stringify(actual.slice(0,...${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity97.46"]');
      logInfo(`productResourceNames(id=97.46): JSON.stringify(actual.slice(2,...${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price97.46"]');
      logInfo(`productResourceNames(id=97.46): JSON.stringify(actual.slice(4,...${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance97.46"]');
      logInfo(`${BUNDLE}ProductResourceNames_0115 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0116
     * @tc.name      PageLoading_ProductResourceNames_0116
     * @tc.desc      productResourceNames(id=3.37) returns ["page_loading_commodity_insurance03.37"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0116 begin`);
      const actual: string[] = productResourceNames(3.37);
      logInfo(`productResourceNames(id=3.37): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=3.37): JSON.stringify(actual.slice(0, ...${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity03.37"]');
      logInfo(`productResourceNames(id=3.37): JSON.stringify(actual.slice(2, ...${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price03.37"]');
      logInfo(`productResourceNames(id=3.37): JSON.stringify(actual.slice(4, ...${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance03.37"]');
      logInfo(`${BUNDLE}ProductResourceNames_0116 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0117
     * @tc.name      PageLoading_ProductResourceNames_0117
     * @tc.desc      productResourceNames(id=94.35) returns ["page_loading_commodity_insurance94.35"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0117 begin`);
      const actual: string[] = productResourceNames(94.35);
      logInfo(`productResourceNames(id=94.35): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=94.35): JSON.stringify(actual.slice(0,...${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity94.35"]');
      logInfo(`productResourceNames(id=94.35): JSON.stringify(actual.slice(2,...${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price94.35"]');
      logInfo(`productResourceNames(id=94.35): JSON.stringify(actual.slice(4,...${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance94.35"]');
      logInfo(`${BUNDLE}ProductResourceNames_0117 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0118
     * @tc.name      PageLoading_ProductResourceNames_0118
     * @tc.desc      productResourceNames(id=2.86) returns ["page_loading_commodity_insurance02.86"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0118 begin`);
      const actual: string[] = productResourceNames(2.86);
      logInfo(`productResourceNames(id=2.86): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=2.86): JSON.stringify(actual.slice(0, ...${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity02.86"]');
      logInfo(`productResourceNames(id=2.86): JSON.stringify(actual.slice(2, ...${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price02.86"]');
      logInfo(`productResourceNames(id=2.86): JSON.stringify(actual.slice(4, ...${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance02.86"]');
      logInfo(`${BUNDLE}ProductResourceNames_0118 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0119
     * @tc.name      PageLoading_ProductResourceNames_0119
     * @tc.desc      productResourceNames(id=-39) returns ["page_loading_commodity_insurance0-39"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductResourceNames_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0119 begin`);
      const actual: string[] = productResourceNames(-39);
      logInfo(`productResourceNames(id=-39): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=-39): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity0-39"]');
      logInfo(`productResourceNames(id=-39): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price0-39"]');
      logInfo(`productResourceNames(id=-39): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance0-39"]');
      logInfo(`${BUNDLE}ProductResourceNames_0119 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0120
     * @tc.name      PageLoading_ProductResourceNames_0120
     * @tc.desc      productResourceNames(id=-99) returns ["page_loading_commodity_insurance0-99"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductResourceNames_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0120 begin`);
      const actual: string[] = productResourceNames(-99);
      logInfo(`productResourceNames(id=-99): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=-99): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity0-99"]');
      logInfo(`productResourceNames(id=-99): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price0-99"]');
      logInfo(`productResourceNames(id=-99): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance0-99"]');
      logInfo(`${BUNDLE}ProductResourceNames_0120 end`);
    });
  });
}
