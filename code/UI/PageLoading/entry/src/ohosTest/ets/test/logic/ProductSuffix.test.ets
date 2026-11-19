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
import { productSuffix } from '../model/PageLoadingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PageLoading]';
const BUNDLE: string = 'PageLoading_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for productSuffix (96 cases). */
export default function productSuffixTest(): void {
  describe('ProductSuffixTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0001
     * @tc.name      PageLoading_ProductSuffix_0001
     * @tc.desc      productSuffix(id=0) returns "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PageLoading_ProductSuffix_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProductSuffix_0001 begin`);
      const actual: string = productSuffix(0);
      logInfo(`productSuffix(id=0): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`${BUNDLE}ProductSuffix_0001 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0002
     * @tc.name      PageLoading_ProductSuffix_0002
     * @tc.desc      productSuffix(id=1) returns "01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PageLoading_ProductSuffix_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProductSuffix_0002 begin`);
      const actual: string = productSuffix(1);
      logInfo(`productSuffix(id=1): actual=${actual}`);
      expect(actual).assertEqual('01');
      logInfo(`${BUNDLE}ProductSuffix_0002 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0003
     * @tc.name      PageLoading_ProductSuffix_0003
     * @tc.desc      productSuffix(id=10) returns "10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PageLoading_ProductSuffix_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ProductSuffix_0003 begin`);
      const actual: string = productSuffix(10);
      logInfo(`productSuffix(id=10): actual=${actual}`);
      expect(actual).assertEqual('10');
      logInfo(`${BUNDLE}ProductSuffix_0003 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0004
     * @tc.name      PageLoading_ProductSuffix_0004
     * @tc.desc      productSuffix(id=9) returns "09"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PageLoading_ProductSuffix_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ProductSuffix_0004 begin`);
      const actual: string = productSuffix(9);
      logInfo(`productSuffix(id=9): actual=${actual}`);
      expect(actual).assertEqual('09');
      logInfo(`${BUNDLE}ProductSuffix_0004 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0005
     * @tc.name      PageLoading_ProductSuffix_0005
     * @tc.desc      productSuffix(id=11) returns "11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PageLoading_ProductSuffix_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ProductSuffix_0005 begin`);
      const actual: string = productSuffix(11);
      logInfo(`productSuffix(id=11): actual=${actual}`);
      expect(actual).assertEqual('11');
      logInfo(`${BUNDLE}ProductSuffix_0005 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0006
     * @tc.name      PageLoading_ProductSuffix_0006
     * @tc.desc      productSuffix(id=20) returns "20"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0006 begin`);
      const actual: string = productSuffix(20);
      logInfo(`productSuffix(id=20): actual=${actual}`);
      expect(actual).assertEqual('20');
      logInfo(`${BUNDLE}ProductSuffix_0006 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0007
     * @tc.name      PageLoading_ProductSuffix_0007
     * @tc.desc      productSuffix(id=5) returns "05"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0007 begin`);
      const actual: string = productSuffix(5);
      logInfo(`productSuffix(id=5): actual=${actual}`);
      expect(actual).assertEqual('05');
      logInfo(`${BUNDLE}ProductSuffix_0007 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0008
     * @tc.name      PageLoading_ProductSuffix_0008
     * @tc.desc      productSuffix(id=100) returns "100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0008 begin`);
      const actual: string = productSuffix(100);
      logInfo(`productSuffix(id=100): actual=${actual}`);
      expect(actual).assertEqual('100');
      logInfo(`${BUNDLE}ProductSuffix_0008 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0009
     * @tc.name      PageLoading_ProductSuffix_0009
     * @tc.desc      productSuffix(id=-1) returns "0-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductSuffix_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductSuffix_0009 begin`);
      const actual: string = productSuffix(-1);
      logInfo(`productSuffix(id=-1): actual=${actual}`);
      expect(actual).assertEqual('0-1');
      logInfo(`${BUNDLE}ProductSuffix_0009 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0010
     * @tc.name      PageLoading_ProductSuffix_0010
     * @tc.desc      productSuffix(id=2) returns "02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0010 begin`);
      const actual: string = productSuffix(2);
      logInfo(`productSuffix(id=2): actual=${actual}`);
      expect(actual).assertEqual('02');
      logInfo(`${BUNDLE}ProductSuffix_0010 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0011
     * @tc.name      PageLoading_ProductSuffix_0011
     * @tc.desc      productSuffix(id=3) returns "03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0011 begin`);
      const actual: string = productSuffix(3);
      logInfo(`productSuffix(id=3): actual=${actual}`);
      expect(actual).assertEqual('03');
      logInfo(`${BUNDLE}ProductSuffix_0011 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0012
     * @tc.name      PageLoading_ProductSuffix_0012
     * @tc.desc      productSuffix(id=15) returns "15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0012 begin`);
      const actual: string = productSuffix(15);
      logInfo(`productSuffix(id=15): actual=${actual}`);
      expect(actual).assertEqual('15');
      logInfo(`${BUNDLE}ProductSuffix_0012 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0013
     * @tc.name      PageLoading_ProductSuffix_0013
     * @tc.desc      productSuffix(id=25) returns "25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0013 begin`);
      const actual: string = productSuffix(25);
      logInfo(`productSuffix(id=25): actual=${actual}`);
      expect(actual).assertEqual('25');
      logInfo(`${BUNDLE}ProductSuffix_0013 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0014
     * @tc.name      PageLoading_ProductSuffix_0014
     * @tc.desc      productSuffix(id=30) returns "30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0014 begin`);
      const actual: string = productSuffix(30);
      logInfo(`productSuffix(id=30): actual=${actual}`);
      expect(actual).assertEqual('30');
      logInfo(`${BUNDLE}ProductSuffix_0014 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0015
     * @tc.name      PageLoading_ProductSuffix_0015
     * @tc.desc      productSuffix(id=35) returns "35"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0015 begin`);
      const actual: string = productSuffix(35);
      logInfo(`productSuffix(id=35): actual=${actual}`);
      expect(actual).assertEqual('35');
      logInfo(`${BUNDLE}ProductSuffix_0015 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0016
     * @tc.name      PageLoading_ProductSuffix_0016
     * @tc.desc      productSuffix(id=40) returns "40"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0016 begin`);
      const actual: string = productSuffix(40);
      logInfo(`productSuffix(id=40): actual=${actual}`);
      expect(actual).assertEqual('40');
      logInfo(`${BUNDLE}ProductSuffix_0016 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0017
     * @tc.name      PageLoading_ProductSuffix_0017
     * @tc.desc      productSuffix(id=45) returns "45"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0017 begin`);
      const actual: string = productSuffix(45);
      logInfo(`productSuffix(id=45): actual=${actual}`);
      expect(actual).assertEqual('45');
      logInfo(`${BUNDLE}ProductSuffix_0017 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0018
     * @tc.name      PageLoading_ProductSuffix_0018
     * @tc.desc      productSuffix(id=50) returns "50"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0018 begin`);
      const actual: string = productSuffix(50);
      logInfo(`productSuffix(id=50): actual=${actual}`);
      expect(actual).assertEqual('50');
      logInfo(`${BUNDLE}ProductSuffix_0018 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0019
     * @tc.name      PageLoading_ProductSuffix_0019
     * @tc.desc      productSuffix(id=55) returns "55"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0019 begin`);
      const actual: string = productSuffix(55);
      logInfo(`productSuffix(id=55): actual=${actual}`);
      expect(actual).assertEqual('55');
      logInfo(`${BUNDLE}ProductSuffix_0019 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0020
     * @tc.name      PageLoading_ProductSuffix_0020
     * @tc.desc      productSuffix(id=60) returns "60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0020 begin`);
      const actual: string = productSuffix(60);
      logInfo(`productSuffix(id=60): actual=${actual}`);
      expect(actual).assertEqual('60');
      logInfo(`${BUNDLE}ProductSuffix_0020 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0021
     * @tc.name      PageLoading_ProductSuffix_0021
     * @tc.desc      productSuffix(id=65) returns "65"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0021 begin`);
      const actual: string = productSuffix(65);
      logInfo(`productSuffix(id=65): actual=${actual}`);
      expect(actual).assertEqual('65');
      logInfo(`${BUNDLE}ProductSuffix_0021 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0022
     * @tc.name      PageLoading_ProductSuffix_0022
     * @tc.desc      productSuffix(id=70) returns "70"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0022 begin`);
      const actual: string = productSuffix(70);
      logInfo(`productSuffix(id=70): actual=${actual}`);
      expect(actual).assertEqual('70');
      logInfo(`${BUNDLE}ProductSuffix_0022 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0023
     * @tc.name      PageLoading_ProductSuffix_0023
     * @tc.desc      productSuffix(id=75) returns "75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0023 begin`);
      const actual: string = productSuffix(75);
      logInfo(`productSuffix(id=75): actual=${actual}`);
      expect(actual).assertEqual('75');
      logInfo(`${BUNDLE}ProductSuffix_0023 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0024
     * @tc.name      PageLoading_ProductSuffix_0024
     * @tc.desc      productSuffix(id=80) returns "80"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0024 begin`);
      const actual: string = productSuffix(80);
      logInfo(`productSuffix(id=80): actual=${actual}`);
      expect(actual).assertEqual('80');
      logInfo(`${BUNDLE}ProductSuffix_0024 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0025
     * @tc.name      PageLoading_ProductSuffix_0025
     * @tc.desc      productSuffix(id=85) returns "85"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0025 begin`);
      const actual: string = productSuffix(85);
      logInfo(`productSuffix(id=85): actual=${actual}`);
      expect(actual).assertEqual('85');
      logInfo(`${BUNDLE}ProductSuffix_0025 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0026
     * @tc.name      PageLoading_ProductSuffix_0026
     * @tc.desc      productSuffix(id=90) returns "90"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0026 begin`);
      const actual: string = productSuffix(90);
      logInfo(`productSuffix(id=90): actual=${actual}`);
      expect(actual).assertEqual('90');
      logInfo(`${BUNDLE}ProductSuffix_0026 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0027
     * @tc.name      PageLoading_ProductSuffix_0027
     * @tc.desc      productSuffix(id=95) returns "95"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0027 begin`);
      const actual: string = productSuffix(95);
      logInfo(`productSuffix(id=95): actual=${actual}`);
      expect(actual).assertEqual('95');
      logInfo(`${BUNDLE}ProductSuffix_0027 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0028
     * @tc.name      PageLoading_ProductSuffix_0028
     * @tc.desc      productSuffix(id=105) returns "105"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0028 begin`);
      const actual: string = productSuffix(105);
      logInfo(`productSuffix(id=105): actual=${actual}`);
      expect(actual).assertEqual('105');
      logInfo(`${BUNDLE}ProductSuffix_0028 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0029
     * @tc.name      PageLoading_ProductSuffix_0029
     * @tc.desc      productSuffix(id=110) returns "110"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0029 begin`);
      const actual: string = productSuffix(110);
      logInfo(`productSuffix(id=110): actual=${actual}`);
      expect(actual).assertEqual('110');
      logInfo(`${BUNDLE}ProductSuffix_0029 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0030
     * @tc.name      PageLoading_ProductSuffix_0030
     * @tc.desc      productSuffix(id=115) returns "115"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0030 begin`);
      const actual: string = productSuffix(115);
      logInfo(`productSuffix(id=115): actual=${actual}`);
      expect(actual).assertEqual('115');
      logInfo(`${BUNDLE}ProductSuffix_0030 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0031
     * @tc.name      PageLoading_ProductSuffix_0031
     * @tc.desc      productSuffix(id=120) returns "120"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0031 begin`);
      const actual: string = productSuffix(120);
      logInfo(`productSuffix(id=120): actual=${actual}`);
      expect(actual).assertEqual('120');
      logInfo(`${BUNDLE}ProductSuffix_0031 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0032
     * @tc.name      PageLoading_ProductSuffix_0032
     * @tc.desc      productSuffix(id=125) returns "125"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0032 begin`);
      const actual: string = productSuffix(125);
      logInfo(`productSuffix(id=125): actual=${actual}`);
      expect(actual).assertEqual('125');
      logInfo(`${BUNDLE}ProductSuffix_0032 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0033
     * @tc.name      PageLoading_ProductSuffix_0033
     * @tc.desc      productSuffix(id=130) returns "130"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0033 begin`);
      const actual: string = productSuffix(130);
      logInfo(`productSuffix(id=130): actual=${actual}`);
      expect(actual).assertEqual('130');
      logInfo(`${BUNDLE}ProductSuffix_0033 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0034
     * @tc.name      PageLoading_ProductSuffix_0034
     * @tc.desc      productSuffix(id=135) returns "135"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0034 begin`);
      const actual: string = productSuffix(135);
      logInfo(`productSuffix(id=135): actual=${actual}`);
      expect(actual).assertEqual('135');
      logInfo(`${BUNDLE}ProductSuffix_0034 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0035
     * @tc.name      PageLoading_ProductSuffix_0035
     * @tc.desc      productSuffix(id=140) returns "140"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0035 begin`);
      const actual: string = productSuffix(140);
      logInfo(`productSuffix(id=140): actual=${actual}`);
      expect(actual).assertEqual('140');
      logInfo(`${BUNDLE}ProductSuffix_0035 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0036
     * @tc.name      PageLoading_ProductSuffix_0036
     * @tc.desc      productSuffix(id=145) returns "145"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0036 begin`);
      const actual: string = productSuffix(145);
      logInfo(`productSuffix(id=145): actual=${actual}`);
      expect(actual).assertEqual('145');
      logInfo(`${BUNDLE}ProductSuffix_0036 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0037
     * @tc.name      PageLoading_ProductSuffix_0037
     * @tc.desc      productSuffix(id=150) returns "150"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0037 begin`);
      const actual: string = productSuffix(150);
      logInfo(`productSuffix(id=150): actual=${actual}`);
      expect(actual).assertEqual('150');
      logInfo(`${BUNDLE}ProductSuffix_0037 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0038
     * @tc.name      PageLoading_ProductSuffix_0038
     * @tc.desc      productSuffix(id=155) returns "155"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0038 begin`);
      const actual: string = productSuffix(155);
      logInfo(`productSuffix(id=155): actual=${actual}`);
      expect(actual).assertEqual('155');
      logInfo(`${BUNDLE}ProductSuffix_0038 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0039
     * @tc.name      PageLoading_ProductSuffix_0039
     * @tc.desc      productSuffix(id=160) returns "160"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0039 begin`);
      const actual: string = productSuffix(160);
      logInfo(`productSuffix(id=160): actual=${actual}`);
      expect(actual).assertEqual('160');
      logInfo(`${BUNDLE}ProductSuffix_0039 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0040
     * @tc.name      PageLoading_ProductSuffix_0040
     * @tc.desc      productSuffix(id=165) returns "165"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0040 begin`);
      const actual: string = productSuffix(165);
      logInfo(`productSuffix(id=165): actual=${actual}`);
      expect(actual).assertEqual('165');
      logInfo(`${BUNDLE}ProductSuffix_0040 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0041
     * @tc.name      PageLoading_ProductSuffix_0041
     * @tc.desc      productSuffix(id=170) returns "170"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0041 begin`);
      const actual: string = productSuffix(170);
      logInfo(`productSuffix(id=170): actual=${actual}`);
      expect(actual).assertEqual('170');
      logInfo(`${BUNDLE}ProductSuffix_0041 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0042
     * @tc.name      PageLoading_ProductSuffix_0042
     * @tc.desc      productSuffix(id=175) returns "175"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0042 begin`);
      const actual: string = productSuffix(175);
      logInfo(`productSuffix(id=175): actual=${actual}`);
      expect(actual).assertEqual('175');
      logInfo(`${BUNDLE}ProductSuffix_0042 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0043
     * @tc.name      PageLoading_ProductSuffix_0043
     * @tc.desc      productSuffix(id=180) returns "180"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0043 begin`);
      const actual: string = productSuffix(180);
      logInfo(`productSuffix(id=180): actual=${actual}`);
      expect(actual).assertEqual('180');
      logInfo(`${BUNDLE}ProductSuffix_0043 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0044
     * @tc.name      PageLoading_ProductSuffix_0044
     * @tc.desc      productSuffix(id=185) returns "185"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0044 begin`);
      const actual: string = productSuffix(185);
      logInfo(`productSuffix(id=185): actual=${actual}`);
      expect(actual).assertEqual('185');
      logInfo(`${BUNDLE}ProductSuffix_0044 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0045
     * @tc.name      PageLoading_ProductSuffix_0045
     * @tc.desc      productSuffix(id=190) returns "190"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0045 begin`);
      const actual: string = productSuffix(190);
      logInfo(`productSuffix(id=190): actual=${actual}`);
      expect(actual).assertEqual('190');
      logInfo(`${BUNDLE}ProductSuffix_0045 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0046
     * @tc.name      PageLoading_ProductSuffix_0046
     * @tc.desc      productSuffix(id=195) returns "195"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0046 begin`);
      const actual: string = productSuffix(195);
      logInfo(`productSuffix(id=195): actual=${actual}`);
      expect(actual).assertEqual('195');
      logInfo(`${BUNDLE}ProductSuffix_0046 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0047
     * @tc.name      PageLoading_ProductSuffix_0047
     * @tc.desc      productSuffix(id=200) returns "200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0047 begin`);
      const actual: string = productSuffix(200);
      logInfo(`productSuffix(id=200): actual=${actual}`);
      expect(actual).assertEqual('200');
      logInfo(`${BUNDLE}ProductSuffix_0047 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0048
     * @tc.name      PageLoading_ProductSuffix_0048
     * @tc.desc      productSuffix(id=26) returns "26"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0048 begin`);
      const actual: string = productSuffix(26);
      logInfo(`productSuffix(id=26): actual=${actual}`);
      expect(actual).assertEqual('26');
      logInfo(`${BUNDLE}ProductSuffix_0048 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0049
     * @tc.name      PageLoading_ProductSuffix_0049
     * @tc.desc      productSuffix(id=-23) returns "0-23"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductSuffix_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductSuffix_0049 begin`);
      const actual: string = productSuffix(-23);
      logInfo(`productSuffix(id=-23): actual=${actual}`);
      expect(actual).assertEqual('0-23');
      logInfo(`${BUNDLE}ProductSuffix_0049 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0050
     * @tc.name      PageLoading_ProductSuffix_0050
     * @tc.desc      productSuffix(id=92) returns "92"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0050 begin`);
      const actual: string = productSuffix(92);
      logInfo(`productSuffix(id=92): actual=${actual}`);
      expect(actual).assertEqual('92');
      logInfo(`${BUNDLE}ProductSuffix_0050 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0051
     * @tc.name      PageLoading_ProductSuffix_0051
     * @tc.desc      productSuffix(id=72.41) returns "72.41"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0051 begin`);
      const actual: string = productSuffix(72.41);
      logInfo(`productSuffix(id=72.41): actual=${actual}`);
      expect(actual).assertEqual('72.41');
      logInfo(`${BUNDLE}ProductSuffix_0051 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0052
     * @tc.name      PageLoading_ProductSuffix_0052
     * @tc.desc      productSuffix(id=52) returns "52"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0052 begin`);
      const actual: string = productSuffix(52);
      logInfo(`productSuffix(id=52): actual=${actual}`);
      expect(actual).assertEqual('52');
      logInfo(`${BUNDLE}ProductSuffix_0052 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0053
     * @tc.name      PageLoading_ProductSuffix_0053
     * @tc.desc      productSuffix(id=23) returns "23"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0053 begin`);
      const actual: string = productSuffix(23);
      logInfo(`productSuffix(id=23): actual=${actual}`);
      expect(actual).assertEqual('23');
      logInfo(`${BUNDLE}ProductSuffix_0053 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0054
     * @tc.name      PageLoading_ProductSuffix_0054
     * @tc.desc      productSuffix(id=-12) returns "0-12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductSuffix_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductSuffix_0054 begin`);
      const actual: string = productSuffix(-12);
      logInfo(`productSuffix(id=-12): actual=${actual}`);
      expect(actual).assertEqual('0-12');
      logInfo(`${BUNDLE}ProductSuffix_0054 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0055
     * @tc.name      PageLoading_ProductSuffix_0055
     * @tc.desc      productSuffix(id=186) returns "186"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0055 begin`);
      const actual: string = productSuffix(186);
      logInfo(`productSuffix(id=186): actual=${actual}`);
      expect(actual).assertEqual('186');
      logInfo(`${BUNDLE}ProductSuffix_0055 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0056
     * @tc.name      PageLoading_ProductSuffix_0056
     * @tc.desc      productSuffix(id=171) returns "171"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0056 begin`);
      const actual: string = productSuffix(171);
      logInfo(`productSuffix(id=171): actual=${actual}`);
      expect(actual).assertEqual('171');
      logInfo(`${BUNDLE}ProductSuffix_0056 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0057
     * @tc.name      PageLoading_ProductSuffix_0057
     * @tc.desc      productSuffix(id=68) returns "68"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0057 begin`);
      const actual: string = productSuffix(68);
      logInfo(`productSuffix(id=68): actual=${actual}`);
      expect(actual).assertEqual('68');
      logInfo(`${BUNDLE}ProductSuffix_0057 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0058
     * @tc.name      PageLoading_ProductSuffix_0058
     * @tc.desc      productSuffix(id=87.27) returns "87.27"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0058 begin`);
      const actual: string = productSuffix(87.27);
      logInfo(`productSuffix(id=87.27): actual=${actual}`);
      expect(actual).assertEqual('87.27');
      logInfo(`${BUNDLE}ProductSuffix_0058 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0059
     * @tc.name      PageLoading_ProductSuffix_0059
     * @tc.desc      productSuffix(id=11.98) returns "11.98"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0059 begin`);
      const actual: string = productSuffix(11.98);
      logInfo(`productSuffix(id=11.98): actual=${actual}`);
      expect(actual).assertEqual('11.98');
      logInfo(`${BUNDLE}ProductSuffix_0059 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0060
     * @tc.name      PageLoading_ProductSuffix_0060
     * @tc.desc      productSuffix(id=76) returns "76"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0060 begin`);
      const actual: string = productSuffix(76);
      logInfo(`productSuffix(id=76): actual=${actual}`);
      expect(actual).assertEqual('76');
      logInfo(`${BUNDLE}ProductSuffix_0060 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0061
     * @tc.name      PageLoading_ProductSuffix_0061
     * @tc.desc      productSuffix(id=-35) returns "0-35"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductSuffix_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductSuffix_0061 begin`);
      const actual: string = productSuffix(-35);
      logInfo(`productSuffix(id=-35): actual=${actual}`);
      expect(actual).assertEqual('0-35');
      logInfo(`${BUNDLE}ProductSuffix_0061 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0062
     * @tc.name      PageLoading_ProductSuffix_0062
     * @tc.desc      productSuffix(id=28.22) returns "28.22"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0062 begin`);
      const actual: string = productSuffix(28.22);
      logInfo(`productSuffix(id=28.22): actual=${actual}`);
      expect(actual).assertEqual('28.22');
      logInfo(`${BUNDLE}ProductSuffix_0062 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0063
     * @tc.name      PageLoading_ProductSuffix_0063
     * @tc.desc      productSuffix(id=36.93) returns "36.93"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0063 begin`);
      const actual: string = productSuffix(36.93);
      logInfo(`productSuffix(id=36.93): actual=${actual}`);
      expect(actual).assertEqual('36.93');
      logInfo(`${BUNDLE}ProductSuffix_0063 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0064
     * @tc.name      PageLoading_ProductSuffix_0064
     * @tc.desc      productSuffix(id=-97) returns "0-97"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductSuffix_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductSuffix_0064 begin`);
      const actual: string = productSuffix(-97);
      logInfo(`productSuffix(id=-97): actual=${actual}`);
      expect(actual).assertEqual('0-97');
      logInfo(`${BUNDLE}ProductSuffix_0064 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0065
     * @tc.name      PageLoading_ProductSuffix_0065
     * @tc.desc      productSuffix(id=-83) returns "0-83"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductSuffix_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductSuffix_0065 begin`);
      const actual: string = productSuffix(-83);
      logInfo(`productSuffix(id=-83): actual=${actual}`);
      expect(actual).assertEqual('0-83');
      logInfo(`${BUNDLE}ProductSuffix_0065 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0066
     * @tc.name      PageLoading_ProductSuffix_0066
     * @tc.desc      productSuffix(id=53.64) returns "53.64"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0066 begin`);
      const actual: string = productSuffix(53.64);
      logInfo(`productSuffix(id=53.64): actual=${actual}`);
      expect(actual).assertEqual('53.64');
      logInfo(`${BUNDLE}ProductSuffix_0066 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0067
     * @tc.name      PageLoading_ProductSuffix_0067
     * @tc.desc      productSuffix(id=116) returns "116"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0067 begin`);
      const actual: string = productSuffix(116);
      logInfo(`productSuffix(id=116): actual=${actual}`);
      expect(actual).assertEqual('116');
      logInfo(`${BUNDLE}ProductSuffix_0067 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0068
     * @tc.name      PageLoading_ProductSuffix_0068
     * @tc.desc      productSuffix(id=144) returns "144"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0068 begin`);
      const actual: string = productSuffix(144);
      logInfo(`productSuffix(id=144): actual=${actual}`);
      expect(actual).assertEqual('144');
      logInfo(`${BUNDLE}ProductSuffix_0068 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0069
     * @tc.name      PageLoading_ProductSuffix_0069
     * @tc.desc      productSuffix(id=96.11) returns "96.11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0069 begin`);
      const actual: string = productSuffix(96.11);
      logInfo(`productSuffix(id=96.11): actual=${actual}`);
      expect(actual).assertEqual('96.11');
      logInfo(`${BUNDLE}ProductSuffix_0069 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0070
     * @tc.name      PageLoading_ProductSuffix_0070
     * @tc.desc      productSuffix(id=-49) returns "0-49"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductSuffix_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductSuffix_0070 begin`);
      const actual: string = productSuffix(-49);
      logInfo(`productSuffix(id=-49): actual=${actual}`);
      expect(actual).assertEqual('0-49');
      logInfo(`${BUNDLE}ProductSuffix_0070 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0071
     * @tc.name      PageLoading_ProductSuffix_0071
     * @tc.desc      productSuffix(id=34) returns "34"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0071 begin`);
      const actual: string = productSuffix(34);
      logInfo(`productSuffix(id=34): actual=${actual}`);
      expect(actual).assertEqual('34');
      logInfo(`${BUNDLE}ProductSuffix_0071 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0072
     * @tc.name      PageLoading_ProductSuffix_0072
     * @tc.desc      productSuffix(id=-14) returns "0-14"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductSuffix_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductSuffix_0072 begin`);
      const actual: string = productSuffix(-14);
      logInfo(`productSuffix(id=-14): actual=${actual}`);
      expect(actual).assertEqual('0-14');
      logInfo(`${BUNDLE}ProductSuffix_0072 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0073
     * @tc.name      PageLoading_ProductSuffix_0073
     * @tc.desc      productSuffix(id=-80) returns "0-80"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductSuffix_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductSuffix_0073 begin`);
      const actual: string = productSuffix(-80);
      logInfo(`productSuffix(id=-80): actual=${actual}`);
      expect(actual).assertEqual('0-80');
      logInfo(`${BUNDLE}ProductSuffix_0073 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0074
     * @tc.name      PageLoading_ProductSuffix_0074
     * @tc.desc      productSuffix(id=32.13) returns "32.13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0074 begin`);
      const actual: string = productSuffix(32.13);
      logInfo(`productSuffix(id=32.13): actual=${actual}`);
      expect(actual).assertEqual('32.13');
      logInfo(`${BUNDLE}ProductSuffix_0074 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0075
     * @tc.name      PageLoading_ProductSuffix_0075
     * @tc.desc      productSuffix(id=139) returns "139"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0075 begin`);
      const actual: string = productSuffix(139);
      logInfo(`productSuffix(id=139): actual=${actual}`);
      expect(actual).assertEqual('139');
      logInfo(`${BUNDLE}ProductSuffix_0075 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0076
     * @tc.name      PageLoading_ProductSuffix_0076
     * @tc.desc      productSuffix(id=75.42) returns "75.42"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0076 begin`);
      const actual: string = productSuffix(75.42);
      logInfo(`productSuffix(id=75.42): actual=${actual}`);
      expect(actual).assertEqual('75.42');
      logInfo(`${BUNDLE}ProductSuffix_0076 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0077
     * @tc.name      PageLoading_ProductSuffix_0077
     * @tc.desc      productSuffix(id=82.35) returns "82.35"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0077 begin`);
      const actual: string = productSuffix(82.35);
      logInfo(`productSuffix(id=82.35): actual=${actual}`);
      expect(actual).assertEqual('82.35');
      logInfo(`${BUNDLE}ProductSuffix_0077 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0078
     * @tc.name      PageLoading_ProductSuffix_0078
     * @tc.desc      productSuffix(id=71) returns "71"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0078 begin`);
      const actual: string = productSuffix(71);
      logInfo(`productSuffix(id=71): actual=${actual}`);
      expect(actual).assertEqual('71');
      logInfo(`${BUNDLE}ProductSuffix_0078 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0079
     * @tc.name      PageLoading_ProductSuffix_0079
     * @tc.desc      productSuffix(id=51.57) returns "51.57"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0079 begin`);
      const actual: string = productSuffix(51.57);
      logInfo(`productSuffix(id=51.57): actual=${actual}`);
      expect(actual).assertEqual('51.57');
      logInfo(`${BUNDLE}ProductSuffix_0079 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0080
     * @tc.name      PageLoading_ProductSuffix_0080
     * @tc.desc      productSuffix(id=156) returns "156"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0080 begin`);
      const actual: string = productSuffix(156);
      logInfo(`productSuffix(id=156): actual=${actual}`);
      expect(actual).assertEqual('156');
      logInfo(`${BUNDLE}ProductSuffix_0080 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0081
     * @tc.name      PageLoading_ProductSuffix_0081
     * @tc.desc      productSuffix(id=63.23) returns "63.23"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0081 begin`);
      const actual: string = productSuffix(63.23);
      logInfo(`productSuffix(id=63.23): actual=${actual}`);
      expect(actual).assertEqual('63.23');
      logInfo(`${BUNDLE}ProductSuffix_0081 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0082
     * @tc.name      PageLoading_ProductSuffix_0082
     * @tc.desc      productSuffix(id=111) returns "111"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0082 begin`);
      const actual: string = productSuffix(111);
      logInfo(`productSuffix(id=111): actual=${actual}`);
      expect(actual).assertEqual('111');
      logInfo(`${BUNDLE}ProductSuffix_0082 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0083
     * @tc.name      PageLoading_ProductSuffix_0083
     * @tc.desc      productSuffix(id=92.81) returns "92.81"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0083 begin`);
      const actual: string = productSuffix(92.81);
      logInfo(`productSuffix(id=92.81): actual=${actual}`);
      expect(actual).assertEqual('92.81');
      logInfo(`${BUNDLE}ProductSuffix_0083 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0084
     * @tc.name      PageLoading_ProductSuffix_0084
     * @tc.desc      productSuffix(id=34.44) returns "34.44"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0084 begin`);
      const actual: string = productSuffix(34.44);
      logInfo(`productSuffix(id=34.44): actual=${actual}`);
      expect(actual).assertEqual('34.44');
      logInfo(`${BUNDLE}ProductSuffix_0084 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0085
     * @tc.name      PageLoading_ProductSuffix_0085
     * @tc.desc      productSuffix(id=82) returns "82"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0085 begin`);
      const actual: string = productSuffix(82);
      logInfo(`productSuffix(id=82): actual=${actual}`);
      expect(actual).assertEqual('82');
      logInfo(`${BUNDLE}ProductSuffix_0085 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0086
     * @tc.name      PageLoading_ProductSuffix_0086
     * @tc.desc      productSuffix(id=-8) returns "0-8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductSuffix_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductSuffix_0086 begin`);
      const actual: string = productSuffix(-8);
      logInfo(`productSuffix(id=-8): actual=${actual}`);
      expect(actual).assertEqual('0-8');
      logInfo(`${BUNDLE}ProductSuffix_0086 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0087
     * @tc.name      PageLoading_ProductSuffix_0087
     * @tc.desc      productSuffix(id=61) returns "61"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0087 begin`);
      const actual: string = productSuffix(61);
      logInfo(`productSuffix(id=61): actual=${actual}`);
      expect(actual).assertEqual('61');
      logInfo(`${BUNDLE}ProductSuffix_0087 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0088
     * @tc.name      PageLoading_ProductSuffix_0088
     * @tc.desc      productSuffix(id=87.53) returns "87.53"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0088 begin`);
      const actual: string = productSuffix(87.53);
      logInfo(`productSuffix(id=87.53): actual=${actual}`);
      expect(actual).assertEqual('87.53');
      logInfo(`${BUNDLE}ProductSuffix_0088 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0089
     * @tc.name      PageLoading_ProductSuffix_0089
     * @tc.desc      productSuffix(id=-53) returns "0-53"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductSuffix_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductSuffix_0089 begin`);
      const actual: string = productSuffix(-53);
      logInfo(`productSuffix(id=-53): actual=${actual}`);
      expect(actual).assertEqual('0-53');
      logInfo(`${BUNDLE}ProductSuffix_0089 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0090
     * @tc.name      PageLoading_ProductSuffix_0090
     * @tc.desc      productSuffix(id=18) returns "18"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0090 begin`);
      const actual: string = productSuffix(18);
      logInfo(`productSuffix(id=18): actual=${actual}`);
      expect(actual).assertEqual('18');
      logInfo(`${BUNDLE}ProductSuffix_0090 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0091
     * @tc.name      PageLoading_ProductSuffix_0091
     * @tc.desc      productSuffix(id=118) returns "118"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0091 begin`);
      const actual: string = productSuffix(118);
      logInfo(`productSuffix(id=118): actual=${actual}`);
      expect(actual).assertEqual('118');
      logInfo(`${BUNDLE}ProductSuffix_0091 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0092
     * @tc.name      PageLoading_ProductSuffix_0092
     * @tc.desc      productSuffix(id=58) returns "58"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0092 begin`);
      const actual: string = productSuffix(58);
      logInfo(`productSuffix(id=58): actual=${actual}`);
      expect(actual).assertEqual('58');
      logInfo(`${BUNDLE}ProductSuffix_0092 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0093
     * @tc.name      PageLoading_ProductSuffix_0093
     * @tc.desc      productSuffix(id=147) returns "147"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0093 begin`);
      const actual: string = productSuffix(147);
      logInfo(`productSuffix(id=147): actual=${actual}`);
      expect(actual).assertEqual('147');
      logInfo(`${BUNDLE}ProductSuffix_0093 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0094
     * @tc.name      PageLoading_ProductSuffix_0094
     * @tc.desc      productSuffix(id=73.45) returns "73.45"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0094 begin`);
      const actual: string = productSuffix(73.45);
      logInfo(`productSuffix(id=73.45): actual=${actual}`);
      expect(actual).assertEqual('73.45');
      logInfo(`${BUNDLE}ProductSuffix_0094 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0095
     * @tc.name      PageLoading_ProductSuffix_0095
     * @tc.desc      productSuffix(id=-95) returns "0-95"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductSuffix_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductSuffix_0095 begin`);
      const actual: string = productSuffix(-95);
      logInfo(`productSuffix(id=-95): actual=${actual}`);
      expect(actual).assertEqual('0-95');
      logInfo(`${BUNDLE}ProductSuffix_0095 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0096
     * @tc.name      PageLoading_ProductSuffix_0096
     * @tc.desc      productSuffix(id=16.48) returns "16.48"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0096 begin`);
      const actual: string = productSuffix(16.48);
      logInfo(`productSuffix(id=16.48): actual=${actual}`);
      expect(actual).assertEqual('16.48');
      logInfo(`${BUNDLE}ProductSuffix_0096 end`);
    });
  });
}
