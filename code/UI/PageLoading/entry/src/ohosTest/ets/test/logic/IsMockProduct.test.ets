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
import { isMockProduct } from '../model/PageLoadingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PageLoading]';
const BUNDLE: string = 'PageLoading_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for isMockProduct (50 cases). */
export default function isMockProductTest(): void {
  describe('IsMockProductTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0001
     * @tc.name      PageLoading_IsMockProduct_0001
     * @tc.desc      isMockProduct(id=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PageLoading_IsMockProduct_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsMockProduct_0001 begin`);
      const actual: boolean = isMockProduct(0);
      logInfo(`isMockProduct(id=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsMockProduct_0001 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0002
     * @tc.name      PageLoading_IsMockProduct_0002
     * @tc.desc      isMockProduct(id=-1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PageLoading_IsMockProduct_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsMockProduct_0002 begin`);
      const actual: boolean = isMockProduct(-1);
      logInfo(`isMockProduct(id=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0002 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0003
     * @tc.name      PageLoading_IsMockProduct_0003
     * @tc.desc      isMockProduct(id=1) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0003 begin`);
      const actual: boolean = isMockProduct(1);
      logInfo(`isMockProduct(id=1): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsMockProduct_0003 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0004
     * @tc.name      PageLoading_IsMockProduct_0004
     * @tc.desc      isMockProduct(id=100) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0004 begin`);
      const actual: boolean = isMockProduct(100);
      logInfo(`isMockProduct(id=100): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0004 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0005
     * @tc.name      PageLoading_IsMockProduct_0005
     * @tc.desc      isMockProduct(id=2) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0005 begin`);
      const actual: boolean = isMockProduct(2);
      logInfo(`isMockProduct(id=2): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsMockProduct_0005 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0006
     * @tc.name      PageLoading_IsMockProduct_0006
     * @tc.desc      isMockProduct(id=3) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0006 begin`);
      const actual: boolean = isMockProduct(3);
      logInfo(`isMockProduct(id=3): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsMockProduct_0006 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0007
     * @tc.name      PageLoading_IsMockProduct_0007
     * @tc.desc      isMockProduct(id=10) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0007 begin`);
      const actual: boolean = isMockProduct(10);
      logInfo(`isMockProduct(id=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0007 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0008
     * @tc.name      PageLoading_IsMockProduct_0008
     * @tc.desc      isMockProduct(id=5) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0008 begin`);
      const actual: boolean = isMockProduct(5);
      logInfo(`isMockProduct(id=5): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsMockProduct_0008 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0009
     * @tc.name      PageLoading_IsMockProduct_0009
     * @tc.desc      isMockProduct(id=15) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0009 begin`);
      const actual: boolean = isMockProduct(15);
      logInfo(`isMockProduct(id=15): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0009 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0010
     * @tc.name      PageLoading_IsMockProduct_0010
     * @tc.desc      isMockProduct(id=20) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0010 begin`);
      const actual: boolean = isMockProduct(20);
      logInfo(`isMockProduct(id=20): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0010 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0011
     * @tc.name      PageLoading_IsMockProduct_0011
     * @tc.desc      isMockProduct(id=25) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0011 begin`);
      const actual: boolean = isMockProduct(25);
      logInfo(`isMockProduct(id=25): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0011 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0012
     * @tc.name      PageLoading_IsMockProduct_0012
     * @tc.desc      isMockProduct(id=30) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0012 begin`);
      const actual: boolean = isMockProduct(30);
      logInfo(`isMockProduct(id=30): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0012 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0013
     * @tc.name      PageLoading_IsMockProduct_0013
     * @tc.desc      isMockProduct(id=35) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0013 begin`);
      const actual: boolean = isMockProduct(35);
      logInfo(`isMockProduct(id=35): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0013 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0014
     * @tc.name      PageLoading_IsMockProduct_0014
     * @tc.desc      isMockProduct(id=40) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0014 begin`);
      const actual: boolean = isMockProduct(40);
      logInfo(`isMockProduct(id=40): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0014 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0015
     * @tc.name      PageLoading_IsMockProduct_0015
     * @tc.desc      isMockProduct(id=45) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0015 begin`);
      const actual: boolean = isMockProduct(45);
      logInfo(`isMockProduct(id=45): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0015 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0016
     * @tc.name      PageLoading_IsMockProduct_0016
     * @tc.desc      isMockProduct(id=50) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0016 begin`);
      const actual: boolean = isMockProduct(50);
      logInfo(`isMockProduct(id=50): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0016 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0017
     * @tc.name      PageLoading_IsMockProduct_0017
     * @tc.desc      isMockProduct(id=55) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0017 begin`);
      const actual: boolean = isMockProduct(55);
      logInfo(`isMockProduct(id=55): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0017 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0018
     * @tc.name      PageLoading_IsMockProduct_0018
     * @tc.desc      isMockProduct(id=60) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0018 begin`);
      const actual: boolean = isMockProduct(60);
      logInfo(`isMockProduct(id=60): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0018 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0019
     * @tc.name      PageLoading_IsMockProduct_0019
     * @tc.desc      isMockProduct(id=65) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0019 begin`);
      const actual: boolean = isMockProduct(65);
      logInfo(`isMockProduct(id=65): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0019 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0020
     * @tc.name      PageLoading_IsMockProduct_0020
     * @tc.desc      isMockProduct(id=70) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0020 begin`);
      const actual: boolean = isMockProduct(70);
      logInfo(`isMockProduct(id=70): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0020 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0021
     * @tc.name      PageLoading_IsMockProduct_0021
     * @tc.desc      isMockProduct(id=75) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0021 begin`);
      const actual: boolean = isMockProduct(75);
      logInfo(`isMockProduct(id=75): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0021 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0022
     * @tc.name      PageLoading_IsMockProduct_0022
     * @tc.desc      isMockProduct(id=80) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0022 begin`);
      const actual: boolean = isMockProduct(80);
      logInfo(`isMockProduct(id=80): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0022 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0023
     * @tc.name      PageLoading_IsMockProduct_0023
     * @tc.desc      isMockProduct(id=85) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0023 begin`);
      const actual: boolean = isMockProduct(85);
      logInfo(`isMockProduct(id=85): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0023 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0024
     * @tc.name      PageLoading_IsMockProduct_0024
     * @tc.desc      isMockProduct(id=90) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0024 begin`);
      const actual: boolean = isMockProduct(90);
      logInfo(`isMockProduct(id=90): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0024 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0025
     * @tc.name      PageLoading_IsMockProduct_0025
     * @tc.desc      isMockProduct(id=95) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0025 begin`);
      const actual: boolean = isMockProduct(95);
      logInfo(`isMockProduct(id=95): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0025 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0026
     * @tc.name      PageLoading_IsMockProduct_0026
     * @tc.desc      isMockProduct(id=105) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0026 begin`);
      const actual: boolean = isMockProduct(105);
      logInfo(`isMockProduct(id=105): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0026 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0027
     * @tc.name      PageLoading_IsMockProduct_0027
     * @tc.desc      isMockProduct(id=110) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0027 begin`);
      const actual: boolean = isMockProduct(110);
      logInfo(`isMockProduct(id=110): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0027 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0028
     * @tc.name      PageLoading_IsMockProduct_0028
     * @tc.desc      isMockProduct(id=115) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0028 begin`);
      const actual: boolean = isMockProduct(115);
      logInfo(`isMockProduct(id=115): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0028 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0029
     * @tc.name      PageLoading_IsMockProduct_0029
     * @tc.desc      isMockProduct(id=120) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0029 begin`);
      const actual: boolean = isMockProduct(120);
      logInfo(`isMockProduct(id=120): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0029 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0030
     * @tc.name      PageLoading_IsMockProduct_0030
     * @tc.desc      isMockProduct(id=125) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0030 begin`);
      const actual: boolean = isMockProduct(125);
      logInfo(`isMockProduct(id=125): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0030 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0031
     * @tc.name      PageLoading_IsMockProduct_0031
     * @tc.desc      isMockProduct(id=130) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0031 begin`);
      const actual: boolean = isMockProduct(130);
      logInfo(`isMockProduct(id=130): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0031 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0032
     * @tc.name      PageLoading_IsMockProduct_0032
     * @tc.desc      isMockProduct(id=135) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0032 begin`);
      const actual: boolean = isMockProduct(135);
      logInfo(`isMockProduct(id=135): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0032 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0033
     * @tc.name      PageLoading_IsMockProduct_0033
     * @tc.desc      isMockProduct(id=140) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0033 begin`);
      const actual: boolean = isMockProduct(140);
      logInfo(`isMockProduct(id=140): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0033 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0034
     * @tc.name      PageLoading_IsMockProduct_0034
     * @tc.desc      isMockProduct(id=145) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0034 begin`);
      const actual: boolean = isMockProduct(145);
      logInfo(`isMockProduct(id=145): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0034 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0035
     * @tc.name      PageLoading_IsMockProduct_0035
     * @tc.desc      isMockProduct(id=150) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0035 begin`);
      const actual: boolean = isMockProduct(150);
      logInfo(`isMockProduct(id=150): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0035 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0036
     * @tc.name      PageLoading_IsMockProduct_0036
     * @tc.desc      isMockProduct(id=155) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0036 begin`);
      const actual: boolean = isMockProduct(155);
      logInfo(`isMockProduct(id=155): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0036 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0037
     * @tc.name      PageLoading_IsMockProduct_0037
     * @tc.desc      isMockProduct(id=160) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0037 begin`);
      const actual: boolean = isMockProduct(160);
      logInfo(`isMockProduct(id=160): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0037 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0038
     * @tc.name      PageLoading_IsMockProduct_0038
     * @tc.desc      isMockProduct(id=165) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0038 begin`);
      const actual: boolean = isMockProduct(165);
      logInfo(`isMockProduct(id=165): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0038 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0039
     * @tc.name      PageLoading_IsMockProduct_0039
     * @tc.desc      isMockProduct(id=170) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0039 begin`);
      const actual: boolean = isMockProduct(170);
      logInfo(`isMockProduct(id=170): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0039 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0040
     * @tc.name      PageLoading_IsMockProduct_0040
     * @tc.desc      isMockProduct(id=175) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0040 begin`);
      const actual: boolean = isMockProduct(175);
      logInfo(`isMockProduct(id=175): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0040 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0041
     * @tc.name      PageLoading_IsMockProduct_0041
     * @tc.desc      isMockProduct(id=180) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0041 begin`);
      const actual: boolean = isMockProduct(180);
      logInfo(`isMockProduct(id=180): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0041 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0042
     * @tc.name      PageLoading_IsMockProduct_0042
     * @tc.desc      isMockProduct(id=185) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0042 begin`);
      const actual: boolean = isMockProduct(185);
      logInfo(`isMockProduct(id=185): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0042 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0043
     * @tc.name      PageLoading_IsMockProduct_0043
     * @tc.desc      isMockProduct(id=190) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0043 begin`);
      const actual: boolean = isMockProduct(190);
      logInfo(`isMockProduct(id=190): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0043 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0044
     * @tc.name      PageLoading_IsMockProduct_0044
     * @tc.desc      isMockProduct(id=195) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0044 begin`);
      const actual: boolean = isMockProduct(195);
      logInfo(`isMockProduct(id=195): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0044 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0045
     * @tc.name      PageLoading_IsMockProduct_0045
     * @tc.desc      isMockProduct(id=200) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0045 begin`);
      const actual: boolean = isMockProduct(200);
      logInfo(`isMockProduct(id=200): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0045 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0046
     * @tc.name      PageLoading_IsMockProduct_0046
     * @tc.desc      isMockProduct(id=148) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0046 begin`);
      const actual: boolean = isMockProduct(148);
      logInfo(`isMockProduct(id=148): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0046 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0047
     * @tc.name      PageLoading_IsMockProduct_0047
     * @tc.desc      isMockProduct(id=121) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0047 begin`);
      const actual: boolean = isMockProduct(121);
      logInfo(`isMockProduct(id=121): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0047 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0048
     * @tc.name      PageLoading_IsMockProduct_0048
     * @tc.desc      isMockProduct(id=-46) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_IsMockProduct_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsMockProduct_0048 begin`);
      const actual: boolean = isMockProduct(-46);
      logInfo(`isMockProduct(id=-46): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0048 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0049
     * @tc.name      PageLoading_IsMockProduct_0049
     * @tc.desc      isMockProduct(id=93) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0049 begin`);
      const actual: boolean = isMockProduct(93);
      logInfo(`isMockProduct(id=93): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0049 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_MOCK_PRODUCT_0050
     * @tc.name      PageLoading_IsMockProduct_0050
     * @tc.desc      isMockProduct(id=64.82) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsMockProduct_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsMockProduct_0050 begin`);
      const actual: boolean = isMockProduct(64.82);
      logInfo(`isMockProduct(id=64.82): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsMockProduct_0050 end`);
    });
  });
}
