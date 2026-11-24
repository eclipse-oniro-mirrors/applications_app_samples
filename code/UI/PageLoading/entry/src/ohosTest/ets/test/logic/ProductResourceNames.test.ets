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

/** Logic checks for productResourceNames (70 cases). */
export default function productResourceNamesTest(): void {
  describe('ProductResourceNamesTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0001
     * @tc.name      PageLoading_ProductResourceNames_0001
     * @tc.desc      productResourceNames(id=0) returns ["page_loading_commodity_insurance00"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PageLoading_ProductResourceNames_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0001 begin`);
      const actual: string[] = productResourceNames(0);
      logInfo(`productResourceNames(id=0): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=0): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity00"]');
      logInfo(`productResourceNames(id=0): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price00"]');
      logInfo(`productResourceNames(id=0): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance00"]');
      logInfo(`${BUNDLE}ProductResourceNames_0001 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0002
     * @tc.name      PageLoading_ProductResourceNames_0002
     * @tc.desc      productResourceNames(id=1) returns ["page_loading_commodity_insurance01"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PageLoading_ProductResourceNames_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0002 begin`);
      const actual: string[] = productResourceNames(1);
      logInfo(`productResourceNames(id=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=1): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity01"]');
      logInfo(`productResourceNames(id=1): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price01"]');
      logInfo(`productResourceNames(id=1): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance01"]');
      logInfo(`${BUNDLE}ProductResourceNames_0002 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0003
     * @tc.name      PageLoading_ProductResourceNames_0003
     * @tc.desc      productResourceNames(id=100) returns ["page_loading_commodity_insurance100"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0003 begin`);
      const actual: string[] = productResourceNames(100);
      logInfo(`productResourceNames(id=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=100): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity100"]');
      logInfo(`productResourceNames(id=100): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price100"]');
      logInfo(`productResourceNames(id=100): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance100"]');
      logInfo(`${BUNDLE}ProductResourceNames_0003 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0004
     * @tc.name      PageLoading_ProductResourceNames_0004
     * @tc.desc      productResourceNames(id=-1) returns ["page_loading_commodity_insurance0-1"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductResourceNames_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0004 begin`);
      const actual: string[] = productResourceNames(-1);
      logInfo(`productResourceNames(id=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=-1): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity0-1"]');
      logInfo(`productResourceNames(id=-1): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price0-1"]');
      logInfo(`productResourceNames(id=-1): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance0-1"]');
      logInfo(`${BUNDLE}ProductResourceNames_0004 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0005
     * @tc.name      PageLoading_ProductResourceNames_0005
     * @tc.desc      productResourceNames(id=2) returns ["page_loading_commodity_insurance02"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0005 begin`);
      const actual: string[] = productResourceNames(2);
      logInfo(`productResourceNames(id=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=2): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity02"]');
      logInfo(`productResourceNames(id=2): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price02"]');
      logInfo(`productResourceNames(id=2): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance02"]');
      logInfo(`${BUNDLE}ProductResourceNames_0005 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0006
     * @tc.name      PageLoading_ProductResourceNames_0006
     * @tc.desc      productResourceNames(id=3) returns ["page_loading_commodity_insurance03"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0006 begin`);
      const actual: string[] = productResourceNames(3);
      logInfo(`productResourceNames(id=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=3): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity03"]');
      logInfo(`productResourceNames(id=3): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price03"]');
      logInfo(`productResourceNames(id=3): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance03"]');
      logInfo(`${BUNDLE}ProductResourceNames_0006 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0007
     * @tc.name      PageLoading_ProductResourceNames_0007
     * @tc.desc      productResourceNames(id=10) returns ["page_loading_commodity_insurance10"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0007 begin`);
      const actual: string[] = productResourceNames(10);
      logInfo(`productResourceNames(id=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=10): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity10"]');
      logInfo(`productResourceNames(id=10): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price10"]');
      logInfo(`productResourceNames(id=10): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance10"]');
      logInfo(`${BUNDLE}ProductResourceNames_0007 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0008
     * @tc.name      PageLoading_ProductResourceNames_0008
     * @tc.desc      productResourceNames(id=5) returns ["page_loading_commodity_insurance05"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0008 begin`);
      const actual: string[] = productResourceNames(5);
      logInfo(`productResourceNames(id=5): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=5): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity05"]');
      logInfo(`productResourceNames(id=5): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price05"]');
      logInfo(`productResourceNames(id=5): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance05"]');
      logInfo(`${BUNDLE}ProductResourceNames_0008 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0009
     * @tc.name      PageLoading_ProductResourceNames_0009
     * @tc.desc      productResourceNames(id=15) returns ["page_loading_commodity_insurance15"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0009 begin`);
      const actual: string[] = productResourceNames(15);
      logInfo(`productResourceNames(id=15): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=15): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity15"]');
      logInfo(`productResourceNames(id=15): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price15"]');
      logInfo(`productResourceNames(id=15): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance15"]');
      logInfo(`${BUNDLE}ProductResourceNames_0009 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0010
     * @tc.name      PageLoading_ProductResourceNames_0010
     * @tc.desc      productResourceNames(id=20) returns ["page_loading_commodity_insurance20"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0010 begin`);
      const actual: string[] = productResourceNames(20);
      logInfo(`productResourceNames(id=20): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=20): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity20"]');
      logInfo(`productResourceNames(id=20): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price20"]');
      logInfo(`productResourceNames(id=20): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance20"]');
      logInfo(`${BUNDLE}ProductResourceNames_0010 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0011
     * @tc.name      PageLoading_ProductResourceNames_0011
     * @tc.desc      productResourceNames(id=25) returns ["page_loading_commodity_insurance25"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0011 begin`);
      const actual: string[] = productResourceNames(25);
      logInfo(`productResourceNames(id=25): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=25): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity25"]');
      logInfo(`productResourceNames(id=25): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price25"]');
      logInfo(`productResourceNames(id=25): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance25"]');
      logInfo(`${BUNDLE}ProductResourceNames_0011 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0012
     * @tc.name      PageLoading_ProductResourceNames_0012
     * @tc.desc      productResourceNames(id=30) returns ["page_loading_commodity_insurance30"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0012 begin`);
      const actual: string[] = productResourceNames(30);
      logInfo(`productResourceNames(id=30): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=30): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity30"]');
      logInfo(`productResourceNames(id=30): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price30"]');
      logInfo(`productResourceNames(id=30): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance30"]');
      logInfo(`${BUNDLE}ProductResourceNames_0012 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0013
     * @tc.name      PageLoading_ProductResourceNames_0013
     * @tc.desc      productResourceNames(id=35) returns ["page_loading_commodity_insurance35"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0013 begin`);
      const actual: string[] = productResourceNames(35);
      logInfo(`productResourceNames(id=35): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=35): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity35"]');
      logInfo(`productResourceNames(id=35): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price35"]');
      logInfo(`productResourceNames(id=35): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance35"]');
      logInfo(`${BUNDLE}ProductResourceNames_0013 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0014
     * @tc.name      PageLoading_ProductResourceNames_0014
     * @tc.desc      productResourceNames(id=40) returns ["page_loading_commodity_insurance40"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0014 begin`);
      const actual: string[] = productResourceNames(40);
      logInfo(`productResourceNames(id=40): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=40): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity40"]');
      logInfo(`productResourceNames(id=40): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price40"]');
      logInfo(`productResourceNames(id=40): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance40"]');
      logInfo(`${BUNDLE}ProductResourceNames_0014 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0015
     * @tc.name      PageLoading_ProductResourceNames_0015
     * @tc.desc      productResourceNames(id=45) returns ["page_loading_commodity_insurance45"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0015 begin`);
      const actual: string[] = productResourceNames(45);
      logInfo(`productResourceNames(id=45): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=45): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity45"]');
      logInfo(`productResourceNames(id=45): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price45"]');
      logInfo(`productResourceNames(id=45): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance45"]');
      logInfo(`${BUNDLE}ProductResourceNames_0015 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0016
     * @tc.name      PageLoading_ProductResourceNames_0016
     * @tc.desc      productResourceNames(id=50) returns ["page_loading_commodity_insurance50"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0016 begin`);
      const actual: string[] = productResourceNames(50);
      logInfo(`productResourceNames(id=50): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=50): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity50"]');
      logInfo(`productResourceNames(id=50): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price50"]');
      logInfo(`productResourceNames(id=50): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance50"]');
      logInfo(`${BUNDLE}ProductResourceNames_0016 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0017
     * @tc.name      PageLoading_ProductResourceNames_0017
     * @tc.desc      productResourceNames(id=55) returns ["page_loading_commodity_insurance55"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0017 begin`);
      const actual: string[] = productResourceNames(55);
      logInfo(`productResourceNames(id=55): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=55): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity55"]');
      logInfo(`productResourceNames(id=55): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price55"]');
      logInfo(`productResourceNames(id=55): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance55"]');
      logInfo(`${BUNDLE}ProductResourceNames_0017 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0018
     * @tc.name      PageLoading_ProductResourceNames_0018
     * @tc.desc      productResourceNames(id=60) returns ["page_loading_commodity_insurance60"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0018 begin`);
      const actual: string[] = productResourceNames(60);
      logInfo(`productResourceNames(id=60): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=60): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity60"]');
      logInfo(`productResourceNames(id=60): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price60"]');
      logInfo(`productResourceNames(id=60): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance60"]');
      logInfo(`${BUNDLE}ProductResourceNames_0018 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0019
     * @tc.name      PageLoading_ProductResourceNames_0019
     * @tc.desc      productResourceNames(id=65) returns ["page_loading_commodity_insurance65"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0019 begin`);
      const actual: string[] = productResourceNames(65);
      logInfo(`productResourceNames(id=65): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=65): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity65"]');
      logInfo(`productResourceNames(id=65): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price65"]');
      logInfo(`productResourceNames(id=65): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance65"]');
      logInfo(`${BUNDLE}ProductResourceNames_0019 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0020
     * @tc.name      PageLoading_ProductResourceNames_0020
     * @tc.desc      productResourceNames(id=70) returns ["page_loading_commodity_insurance70"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0020 begin`);
      const actual: string[] = productResourceNames(70);
      logInfo(`productResourceNames(id=70): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=70): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity70"]');
      logInfo(`productResourceNames(id=70): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price70"]');
      logInfo(`productResourceNames(id=70): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance70"]');
      logInfo(`${BUNDLE}ProductResourceNames_0020 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0021
     * @tc.name      PageLoading_ProductResourceNames_0021
     * @tc.desc      productResourceNames(id=75) returns ["page_loading_commodity_insurance75"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0021 begin`);
      const actual: string[] = productResourceNames(75);
      logInfo(`productResourceNames(id=75): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=75): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity75"]');
      logInfo(`productResourceNames(id=75): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price75"]');
      logInfo(`productResourceNames(id=75): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance75"]');
      logInfo(`${BUNDLE}ProductResourceNames_0021 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0022
     * @tc.name      PageLoading_ProductResourceNames_0022
     * @tc.desc      productResourceNames(id=80) returns ["page_loading_commodity_insurance80"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0022 begin`);
      const actual: string[] = productResourceNames(80);
      logInfo(`productResourceNames(id=80): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=80): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity80"]');
      logInfo(`productResourceNames(id=80): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price80"]');
      logInfo(`productResourceNames(id=80): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance80"]');
      logInfo(`${BUNDLE}ProductResourceNames_0022 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0023
     * @tc.name      PageLoading_ProductResourceNames_0023
     * @tc.desc      productResourceNames(id=85) returns ["page_loading_commodity_insurance85"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0023 begin`);
      const actual: string[] = productResourceNames(85);
      logInfo(`productResourceNames(id=85): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=85): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity85"]');
      logInfo(`productResourceNames(id=85): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price85"]');
      logInfo(`productResourceNames(id=85): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance85"]');
      logInfo(`${BUNDLE}ProductResourceNames_0023 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0024
     * @tc.name      PageLoading_ProductResourceNames_0024
     * @tc.desc      productResourceNames(id=90) returns ["page_loading_commodity_insurance90"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0024 begin`);
      const actual: string[] = productResourceNames(90);
      logInfo(`productResourceNames(id=90): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=90): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity90"]');
      logInfo(`productResourceNames(id=90): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price90"]');
      logInfo(`productResourceNames(id=90): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance90"]');
      logInfo(`${BUNDLE}ProductResourceNames_0024 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0025
     * @tc.name      PageLoading_ProductResourceNames_0025
     * @tc.desc      productResourceNames(id=95) returns ["page_loading_commodity_insurance95"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0025 begin`);
      const actual: string[] = productResourceNames(95);
      logInfo(`productResourceNames(id=95): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=95): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity95"]');
      logInfo(`productResourceNames(id=95): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price95"]');
      logInfo(`productResourceNames(id=95): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance95"]');
      logInfo(`${BUNDLE}ProductResourceNames_0025 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0026
     * @tc.name      PageLoading_ProductResourceNames_0026
     * @tc.desc      productResourceNames(id=105) returns ["page_loading_commodity_insurance105"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0026 begin`);
      const actual: string[] = productResourceNames(105);
      logInfo(`productResourceNames(id=105): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=105): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity105"]');
      logInfo(`productResourceNames(id=105): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price105"]');
      logInfo(`productResourceNames(id=105): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance105"]');
      logInfo(`${BUNDLE}ProductResourceNames_0026 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0027
     * @tc.name      PageLoading_ProductResourceNames_0027
     * @tc.desc      productResourceNames(id=110) returns ["page_loading_commodity_insurance110"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0027 begin`);
      const actual: string[] = productResourceNames(110);
      logInfo(`productResourceNames(id=110): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=110): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity110"]');
      logInfo(`productResourceNames(id=110): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price110"]');
      logInfo(`productResourceNames(id=110): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance110"]');
      logInfo(`${BUNDLE}ProductResourceNames_0027 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0028
     * @tc.name      PageLoading_ProductResourceNames_0028
     * @tc.desc      productResourceNames(id=115) returns ["page_loading_commodity_insurance115"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0028 begin`);
      const actual: string[] = productResourceNames(115);
      logInfo(`productResourceNames(id=115): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=115): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity115"]');
      logInfo(`productResourceNames(id=115): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price115"]');
      logInfo(`productResourceNames(id=115): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance115"]');
      logInfo(`${BUNDLE}ProductResourceNames_0028 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0029
     * @tc.name      PageLoading_ProductResourceNames_0029
     * @tc.desc      productResourceNames(id=120) returns ["page_loading_commodity_insurance120"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0029 begin`);
      const actual: string[] = productResourceNames(120);
      logInfo(`productResourceNames(id=120): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=120): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity120"]');
      logInfo(`productResourceNames(id=120): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price120"]');
      logInfo(`productResourceNames(id=120): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance120"]');
      logInfo(`${BUNDLE}ProductResourceNames_0029 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0030
     * @tc.name      PageLoading_ProductResourceNames_0030
     * @tc.desc      productResourceNames(id=125) returns ["page_loading_commodity_insurance125"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0030 begin`);
      const actual: string[] = productResourceNames(125);
      logInfo(`productResourceNames(id=125): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=125): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity125"]');
      logInfo(`productResourceNames(id=125): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price125"]');
      logInfo(`productResourceNames(id=125): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance125"]');
      logInfo(`${BUNDLE}ProductResourceNames_0030 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0031
     * @tc.name      PageLoading_ProductResourceNames_0031
     * @tc.desc      productResourceNames(id=130) returns ["page_loading_commodity_insurance130"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0031 begin`);
      const actual: string[] = productResourceNames(130);
      logInfo(`productResourceNames(id=130): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=130): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity130"]');
      logInfo(`productResourceNames(id=130): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price130"]');
      logInfo(`productResourceNames(id=130): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance130"]');
      logInfo(`${BUNDLE}ProductResourceNames_0031 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0032
     * @tc.name      PageLoading_ProductResourceNames_0032
     * @tc.desc      productResourceNames(id=135) returns ["page_loading_commodity_insurance135"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0032 begin`);
      const actual: string[] = productResourceNames(135);
      logInfo(`productResourceNames(id=135): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=135): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity135"]');
      logInfo(`productResourceNames(id=135): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price135"]');
      logInfo(`productResourceNames(id=135): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance135"]');
      logInfo(`${BUNDLE}ProductResourceNames_0032 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0033
     * @tc.name      PageLoading_ProductResourceNames_0033
     * @tc.desc      productResourceNames(id=140) returns ["page_loading_commodity_insurance140"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0033 begin`);
      const actual: string[] = productResourceNames(140);
      logInfo(`productResourceNames(id=140): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=140): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity140"]');
      logInfo(`productResourceNames(id=140): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price140"]');
      logInfo(`productResourceNames(id=140): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance140"]');
      logInfo(`${BUNDLE}ProductResourceNames_0033 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0034
     * @tc.name      PageLoading_ProductResourceNames_0034
     * @tc.desc      productResourceNames(id=145) returns ["page_loading_commodity_insurance145"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0034 begin`);
      const actual: string[] = productResourceNames(145);
      logInfo(`productResourceNames(id=145): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=145): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity145"]');
      logInfo(`productResourceNames(id=145): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price145"]');
      logInfo(`productResourceNames(id=145): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance145"]');
      logInfo(`${BUNDLE}ProductResourceNames_0034 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0035
     * @tc.name      PageLoading_ProductResourceNames_0035
     * @tc.desc      productResourceNames(id=150) returns ["page_loading_commodity_insurance150"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0035 begin`);
      const actual: string[] = productResourceNames(150);
      logInfo(`productResourceNames(id=150): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=150): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity150"]');
      logInfo(`productResourceNames(id=150): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price150"]');
      logInfo(`productResourceNames(id=150): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance150"]');
      logInfo(`${BUNDLE}ProductResourceNames_0035 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0036
     * @tc.name      PageLoading_ProductResourceNames_0036
     * @tc.desc      productResourceNames(id=155) returns ["page_loading_commodity_insurance155"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0036 begin`);
      const actual: string[] = productResourceNames(155);
      logInfo(`productResourceNames(id=155): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=155): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity155"]');
      logInfo(`productResourceNames(id=155): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price155"]');
      logInfo(`productResourceNames(id=155): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance155"]');
      logInfo(`${BUNDLE}ProductResourceNames_0036 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0037
     * @tc.name      PageLoading_ProductResourceNames_0037
     * @tc.desc      productResourceNames(id=160) returns ["page_loading_commodity_insurance160"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0037 begin`);
      const actual: string[] = productResourceNames(160);
      logInfo(`productResourceNames(id=160): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=160): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity160"]');
      logInfo(`productResourceNames(id=160): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price160"]');
      logInfo(`productResourceNames(id=160): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance160"]');
      logInfo(`${BUNDLE}ProductResourceNames_0037 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0038
     * @tc.name      PageLoading_ProductResourceNames_0038
     * @tc.desc      productResourceNames(id=165) returns ["page_loading_commodity_insurance165"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0038 begin`);
      const actual: string[] = productResourceNames(165);
      logInfo(`productResourceNames(id=165): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=165): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity165"]');
      logInfo(`productResourceNames(id=165): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price165"]');
      logInfo(`productResourceNames(id=165): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance165"]');
      logInfo(`${BUNDLE}ProductResourceNames_0038 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0039
     * @tc.name      PageLoading_ProductResourceNames_0039
     * @tc.desc      productResourceNames(id=170) returns ["page_loading_commodity_insurance170"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0039 begin`);
      const actual: string[] = productResourceNames(170);
      logInfo(`productResourceNames(id=170): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=170): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity170"]');
      logInfo(`productResourceNames(id=170): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price170"]');
      logInfo(`productResourceNames(id=170): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance170"]');
      logInfo(`${BUNDLE}ProductResourceNames_0039 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0040
     * @tc.name      PageLoading_ProductResourceNames_0040
     * @tc.desc      productResourceNames(id=175) returns ["page_loading_commodity_insurance175"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0040 begin`);
      const actual: string[] = productResourceNames(175);
      logInfo(`productResourceNames(id=175): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=175): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity175"]');
      logInfo(`productResourceNames(id=175): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price175"]');
      logInfo(`productResourceNames(id=175): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance175"]');
      logInfo(`${BUNDLE}ProductResourceNames_0040 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0041
     * @tc.name      PageLoading_ProductResourceNames_0041
     * @tc.desc      productResourceNames(id=180) returns ["page_loading_commodity_insurance180"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0041 begin`);
      const actual: string[] = productResourceNames(180);
      logInfo(`productResourceNames(id=180): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=180): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity180"]');
      logInfo(`productResourceNames(id=180): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price180"]');
      logInfo(`productResourceNames(id=180): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance180"]');
      logInfo(`${BUNDLE}ProductResourceNames_0041 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0042
     * @tc.name      PageLoading_ProductResourceNames_0042
     * @tc.desc      productResourceNames(id=185) returns ["page_loading_commodity_insurance185"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0042 begin`);
      const actual: string[] = productResourceNames(185);
      logInfo(`productResourceNames(id=185): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=185): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity185"]');
      logInfo(`productResourceNames(id=185): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price185"]');
      logInfo(`productResourceNames(id=185): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance185"]');
      logInfo(`${BUNDLE}ProductResourceNames_0042 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0043
     * @tc.name      PageLoading_ProductResourceNames_0043
     * @tc.desc      productResourceNames(id=190) returns ["page_loading_commodity_insurance190"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0043 begin`);
      const actual: string[] = productResourceNames(190);
      logInfo(`productResourceNames(id=190): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=190): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity190"]');
      logInfo(`productResourceNames(id=190): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price190"]');
      logInfo(`productResourceNames(id=190): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance190"]');
      logInfo(`${BUNDLE}ProductResourceNames_0043 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0044
     * @tc.name      PageLoading_ProductResourceNames_0044
     * @tc.desc      productResourceNames(id=195) returns ["page_loading_commodity_insurance195"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0044 begin`);
      const actual: string[] = productResourceNames(195);
      logInfo(`productResourceNames(id=195): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=195): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity195"]');
      logInfo(`productResourceNames(id=195): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price195"]');
      logInfo(`productResourceNames(id=195): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance195"]');
      logInfo(`${BUNDLE}ProductResourceNames_0044 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0045
     * @tc.name      PageLoading_ProductResourceNames_0045
     * @tc.desc      productResourceNames(id=200) returns ["page_loading_commodity_insurance200"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0045 begin`);
      const actual: string[] = productResourceNames(200);
      logInfo(`productResourceNames(id=200): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=200): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity200"]');
      logInfo(`productResourceNames(id=200): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price200"]');
      logInfo(`productResourceNames(id=200): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance200"]');
      logInfo(`${BUNDLE}ProductResourceNames_0045 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0046
     * @tc.name      PageLoading_ProductResourceNames_0046
     * @tc.desc      productResourceNames(id=98.87) returns ["page_loading_commodity_insurance98.87"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0046 begin`);
      const actual: string[] = productResourceNames(98.87);
      logInfo(`productResourceNames(id=98.87): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=98.87): JSON.stringify(actual.slice(0,...${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity98.87"]');
      logInfo(`productResourceNames(id=98.87): JSON.stringify(actual.slice(2,...${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price98.87"]');
      logInfo(`productResourceNames(id=98.87): JSON.stringify(actual.slice(4,...${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance98.87"]');
      logInfo(`${BUNDLE}ProductResourceNames_0046 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0047
     * @tc.name      PageLoading_ProductResourceNames_0047
     * @tc.desc      productResourceNames(id=117) returns ["page_loading_commodity_insurance117"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0047 begin`);
      const actual: string[] = productResourceNames(117);
      logInfo(`productResourceNames(id=117): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=117): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity117"]');
      logInfo(`productResourceNames(id=117): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price117"]');
      logInfo(`productResourceNames(id=117): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance117"]');
      logInfo(`${BUNDLE}ProductResourceNames_0047 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0048
     * @tc.name      PageLoading_ProductResourceNames_0048
     * @tc.desc      productResourceNames(id=-7) returns ["page_loading_commodity_insurance0-7"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductResourceNames_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0048 begin`);
      const actual: string[] = productResourceNames(-7);
      logInfo(`productResourceNames(id=-7): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=-7): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity0-7"]');
      logInfo(`productResourceNames(id=-7): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price0-7"]');
      logInfo(`productResourceNames(id=-7): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance0-7"]');
      logInfo(`${BUNDLE}ProductResourceNames_0048 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0049
     * @tc.name      PageLoading_ProductResourceNames_0049
     * @tc.desc      productResourceNames(id=-59) returns ["page_loading_commodity_insurance0-59"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductResourceNames_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0049 begin`);
      const actual: string[] = productResourceNames(-59);
      logInfo(`productResourceNames(id=-59): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=-59): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity0-59"]');
      logInfo(`productResourceNames(id=-59): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price0-59"]');
      logInfo(`productResourceNames(id=-59): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance0-59"]');
      logInfo(`${BUNDLE}ProductResourceNames_0049 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0050
     * @tc.name      PageLoading_ProductResourceNames_0050
     * @tc.desc      productResourceNames(id=43) returns ["page_loading_commodity_insurance43"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0050 begin`);
      const actual: string[] = productResourceNames(43);
      logInfo(`productResourceNames(id=43): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=43): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity43"]');
      logInfo(`productResourceNames(id=43): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price43"]');
      logInfo(`productResourceNames(id=43): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance43"]');
      logInfo(`${BUNDLE}ProductResourceNames_0050 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0051
     * @tc.name      PageLoading_ProductResourceNames_0051
     * @tc.desc      productResourceNames(id=-69) returns ["page_loading_commodity_insurance0-69"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductResourceNames_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0051 begin`);
      const actual: string[] = productResourceNames(-69);
      logInfo(`productResourceNames(id=-69): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=-69): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity0-69"]');
      logInfo(`productResourceNames(id=-69): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price0-69"]');
      logInfo(`productResourceNames(id=-69): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance0-69"]');
      logInfo(`${BUNDLE}ProductResourceNames_0051 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0052
     * @tc.name      PageLoading_ProductResourceNames_0052
     * @tc.desc      productResourceNames(id=52.56) returns ["page_loading_commodity_insurance52.56"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0052 begin`);
      const actual: string[] = productResourceNames(52.56);
      logInfo(`productResourceNames(id=52.56): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=52.56): JSON.stringify(actual.slice(0,...${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity52.56"]');
      logInfo(`productResourceNames(id=52.56): JSON.stringify(actual.slice(2,...${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price52.56"]');
      logInfo(`productResourceNames(id=52.56): JSON.stringify(actual.slice(4,...${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance52.56"]');
      logInfo(`${BUNDLE}ProductResourceNames_0052 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0053
     * @tc.name      PageLoading_ProductResourceNames_0053
     * @tc.desc      productResourceNames(id=87) returns ["page_loading_commodity_insurance87"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0053 begin`);
      const actual: string[] = productResourceNames(87);
      logInfo(`productResourceNames(id=87): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=87): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity87"]');
      logInfo(`productResourceNames(id=87): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price87"]');
      logInfo(`productResourceNames(id=87): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance87"]');
      logInfo(`${BUNDLE}ProductResourceNames_0053 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0054
     * @tc.name      PageLoading_ProductResourceNames_0054
     * @tc.desc      productResourceNames(id=-92) returns ["page_loading_commodity_insurance0-92"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductResourceNames_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0054 begin`);
      const actual: string[] = productResourceNames(-92);
      logInfo(`productResourceNames(id=-92): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=-92): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity0-92"]');
      logInfo(`productResourceNames(id=-92): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price0-92"]');
      logInfo(`productResourceNames(id=-92): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance0-92"]');
      logInfo(`${BUNDLE}ProductResourceNames_0054 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0055
     * @tc.name      PageLoading_ProductResourceNames_0055
     * @tc.desc      productResourceNames(id=97) returns ["page_loading_commodity_insurance97"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0055 begin`);
      const actual: string[] = productResourceNames(97);
      logInfo(`productResourceNames(id=97): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=97): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity97"]');
      logInfo(`productResourceNames(id=97): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price97"]');
      logInfo(`productResourceNames(id=97): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance97"]');
      logInfo(`${BUNDLE}ProductResourceNames_0055 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0056
     * @tc.name      PageLoading_ProductResourceNames_0056
     * @tc.desc      productResourceNames(id=-53) returns ["page_loading_commodity_insurance0-53"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductResourceNames_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0056 begin`);
      const actual: string[] = productResourceNames(-53);
      logInfo(`productResourceNames(id=-53): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=-53): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity0-53"]');
      logInfo(`productResourceNames(id=-53): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price0-53"]');
      logInfo(`productResourceNames(id=-53): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance0-53"]');
      logInfo(`${BUNDLE}ProductResourceNames_0056 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0057
     * @tc.name      PageLoading_ProductResourceNames_0057
     * @tc.desc      productResourceNames(id=-67) returns ["page_loading_commodity_insurance0-67"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductResourceNames_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0057 begin`);
      const actual: string[] = productResourceNames(-67);
      logInfo(`productResourceNames(id=-67): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=-67): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity0-67"]');
      logInfo(`productResourceNames(id=-67): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price0-67"]');
      logInfo(`productResourceNames(id=-67): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance0-67"]');
      logInfo(`${BUNDLE}ProductResourceNames_0057 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0058
     * @tc.name      PageLoading_ProductResourceNames_0058
     * @tc.desc      productResourceNames(id=-18) returns ["page_loading_commodity_insurance0-18"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductResourceNames_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0058 begin`);
      const actual: string[] = productResourceNames(-18);
      logInfo(`productResourceNames(id=-18): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=-18): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity0-18"]');
      logInfo(`productResourceNames(id=-18): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price0-18"]');
      logInfo(`productResourceNames(id=-18): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance0-18"]');
      logInfo(`${BUNDLE}ProductResourceNames_0058 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0059
     * @tc.name      PageLoading_ProductResourceNames_0059
     * @tc.desc      productResourceNames(id=85.63) returns ["page_loading_commodity_insurance85.63"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0059 begin`);
      const actual: string[] = productResourceNames(85.63);
      logInfo(`productResourceNames(id=85.63): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=85.63): JSON.stringify(actual.slice(0,...${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity85.63"]');
      logInfo(`productResourceNames(id=85.63): JSON.stringify(actual.slice(2,...${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price85.63"]');
      logInfo(`productResourceNames(id=85.63): JSON.stringify(actual.slice(4,...${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance85.63"]');
      logInfo(`${BUNDLE}ProductResourceNames_0059 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0060
     * @tc.name      PageLoading_ProductResourceNames_0060
     * @tc.desc      productResourceNames(id=19.41) returns ["page_loading_commodity_insurance19.41"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0060 begin`);
      const actual: string[] = productResourceNames(19.41);
      logInfo(`productResourceNames(id=19.41): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=19.41): JSON.stringify(actual.slice(0,...${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity19.41"]');
      logInfo(`productResourceNames(id=19.41): JSON.stringify(actual.slice(2,...${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price19.41"]');
      logInfo(`productResourceNames(id=19.41): JSON.stringify(actual.slice(4,...${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance19.41"]');
      logInfo(`${BUNDLE}ProductResourceNames_0060 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0061
     * @tc.name      PageLoading_ProductResourceNames_0061
     * @tc.desc      productResourceNames(id=-46) returns ["page_loading_commodity_insurance0-46"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductResourceNames_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0061 begin`);
      const actual: string[] = productResourceNames(-46);
      logInfo(`productResourceNames(id=-46): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=-46): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity0-46"]');
      logInfo(`productResourceNames(id=-46): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price0-46"]');
      logInfo(`productResourceNames(id=-46): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance0-46"]');
      logInfo(`${BUNDLE}ProductResourceNames_0061 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0062
     * @tc.name      PageLoading_ProductResourceNames_0062
     * @tc.desc      productResourceNames(id=42.31) returns ["page_loading_commodity_insurance42.31"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0062 begin`);
      const actual: string[] = productResourceNames(42.31);
      logInfo(`productResourceNames(id=42.31): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=42.31): JSON.stringify(actual.slice(0,...${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity42.31"]');
      logInfo(`productResourceNames(id=42.31): JSON.stringify(actual.slice(2,...${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price42.31"]');
      logInfo(`productResourceNames(id=42.31): JSON.stringify(actual.slice(4,...${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance42.31"]');
      logInfo(`${BUNDLE}ProductResourceNames_0062 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0063
     * @tc.name      PageLoading_ProductResourceNames_0063
     * @tc.desc      productResourceNames(id=35.89) returns ["page_loading_commodity_insurance35.89"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0063 begin`);
      const actual: string[] = productResourceNames(35.89);
      logInfo(`productResourceNames(id=35.89): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=35.89): JSON.stringify(actual.slice(0,...${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity35.89"]');
      logInfo(`productResourceNames(id=35.89): JSON.stringify(actual.slice(2,...${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price35.89"]');
      logInfo(`productResourceNames(id=35.89): JSON.stringify(actual.slice(4,...${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance35.89"]');
      logInfo(`${BUNDLE}ProductResourceNames_0063 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0064
     * @tc.name      PageLoading_ProductResourceNames_0064
     * @tc.desc      productResourceNames(id=196) returns ["page_loading_commodity_insurance196"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0064 begin`);
      const actual: string[] = productResourceNames(196);
      logInfo(`productResourceNames(id=196): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=196): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity196"]');
      logInfo(`productResourceNames(id=196): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price196"]');
      logInfo(`productResourceNames(id=196): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance196"]');
      logInfo(`${BUNDLE}ProductResourceNames_0064 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0065
     * @tc.name      PageLoading_ProductResourceNames_0065
     * @tc.desc      productResourceNames(id=26) returns ["page_loading_commodity_insurance26"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0065 begin`);
      const actual: string[] = productResourceNames(26);
      logInfo(`productResourceNames(id=26): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=26): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity26"]');
      logInfo(`productResourceNames(id=26): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price26"]');
      logInfo(`productResourceNames(id=26): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance26"]');
      logInfo(`${BUNDLE}ProductResourceNames_0065 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0066
     * @tc.name      PageLoading_ProductResourceNames_0066
     * @tc.desc      productResourceNames(id=-43) returns ["page_loading_commodity_insurance0-43"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductResourceNames_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0066 begin`);
      const actual: string[] = productResourceNames(-43);
      logInfo(`productResourceNames(id=-43): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=-43): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity0-43"]');
      logInfo(`productResourceNames(id=-43): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price0-43"]');
      logInfo(`productResourceNames(id=-43): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance0-43"]');
      logInfo(`${BUNDLE}ProductResourceNames_0066 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0067
     * @tc.name      PageLoading_ProductResourceNames_0067
     * @tc.desc      productResourceNames(id=33) returns ["page_loading_commodity_insurance33"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0067 begin`);
      const actual: string[] = productResourceNames(33);
      logInfo(`productResourceNames(id=33): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=33): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity33"]');
      logInfo(`productResourceNames(id=33): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price33"]');
      logInfo(`productResourceNames(id=33): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance33"]');
      logInfo(`${BUNDLE}ProductResourceNames_0067 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0068
     * @tc.name      PageLoading_ProductResourceNames_0068
     * @tc.desc      productResourceNames(id=-65) returns ["page_loading_commodity_insurance0-65"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductResourceNames_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0068 begin`);
      const actual: string[] = productResourceNames(-65);
      logInfo(`productResourceNames(id=-65): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=-65): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity0-65"]');
      logInfo(`productResourceNames(id=-65): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price0-65"]');
      logInfo(`productResourceNames(id=-65): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance0-65"]');
      logInfo(`${BUNDLE}ProductResourceNames_0068 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0069
     * @tc.name      PageLoading_ProductResourceNames_0069
     * @tc.desc      productResourceNames(id=106) returns ["page_loading_commodity_insurance106"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0069 begin`);
      const actual: string[] = productResourceNames(106);
      logInfo(`productResourceNames(id=106): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=106): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity106"]');
      logInfo(`productResourceNames(id=106): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price106"]');
      logInfo(`productResourceNames(id=106): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance106"]');
      logInfo(`${BUNDLE}ProductResourceNames_0069 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_RESOURCE_NAMES_0070
     * @tc.name      PageLoading_ProductResourceNames_0070
     * @tc.desc      productResourceNames(id=112) returns ["page_loading_commodity_insurance112"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductResourceNames_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductResourceNames_0070 begin`);
      const actual: string[] = productResourceNames(112);
      logInfo(`productResourceNames(id=112): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`productResourceNames(id=112): JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["page_loading_commodity112"]');
      logInfo(`productResourceNames(id=112): JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["page_loading_commodity_price112"]');
      logInfo(`productResourceNames(id=112): JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["page_loading_commodity_insurance112"]');
      logInfo(`${BUNDLE}ProductResourceNames_0070 end`);
    });
  });
}
