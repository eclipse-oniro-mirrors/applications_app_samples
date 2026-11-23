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

/** Logic checks for productSuffix (24 cases). */
export default function productSuffix2Test(): void {
  describe('ProductSuffix2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0097
     * @tc.name      PageLoading_ProductSuffix_0097
     * @tc.desc      productSuffix(id=21) returns "21"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0097 begin`);
      const actual: string = productSuffix(21);
      logInfo(`productSuffix(id=21): actual=${actual}`);
      expect(actual).assertEqual('21');
      logInfo(`${BUNDLE}ProductSuffix_0097 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0098
     * @tc.name      PageLoading_ProductSuffix_0098
     * @tc.desc      productSuffix(id=4.14) returns "04.14"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0098 begin`);
      const actual: string = productSuffix(4.14);
      logInfo(`productSuffix(id=4.14): actual=${actual}`);
      expect(actual).assertEqual('04.14');
      logInfo(`${BUNDLE}ProductSuffix_0098 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0099
     * @tc.name      PageLoading_ProductSuffix_0099
     * @tc.desc      productSuffix(id=28.96) returns "28.96"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0099 begin`);
      const actual: string = productSuffix(28.96);
      logInfo(`productSuffix(id=28.96): actual=${actual}`);
      expect(actual).assertEqual('28.96');
      logInfo(`${BUNDLE}ProductSuffix_0099 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0100
     * @tc.name      PageLoading_ProductSuffix_0100
     * @tc.desc      productSuffix(id=41.53) returns "41.53"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0100 begin`);
      const actual: string = productSuffix(41.53);
      logInfo(`productSuffix(id=41.53): actual=${actual}`);
      expect(actual).assertEqual('41.53');
      logInfo(`${BUNDLE}ProductSuffix_0100 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0101
     * @tc.name      PageLoading_ProductSuffix_0101
     * @tc.desc      productSuffix(id=37.74) returns "37.74"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0101 begin`);
      const actual: string = productSuffix(37.74);
      logInfo(`productSuffix(id=37.74): actual=${actual}`);
      expect(actual).assertEqual('37.74');
      logInfo(`${BUNDLE}ProductSuffix_0101 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0102
     * @tc.name      PageLoading_ProductSuffix_0102
     * @tc.desc      productSuffix(id=109) returns "109"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0102 begin`);
      const actual: string = productSuffix(109);
      logInfo(`productSuffix(id=109): actual=${actual}`);
      expect(actual).assertEqual('109');
      logInfo(`${BUNDLE}ProductSuffix_0102 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0103
     * @tc.name      PageLoading_ProductSuffix_0103
     * @tc.desc      productSuffix(id=182) returns "182"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0103 begin`);
      const actual: string = productSuffix(182);
      logInfo(`productSuffix(id=182): actual=${actual}`);
      expect(actual).assertEqual('182');
      logInfo(`${BUNDLE}ProductSuffix_0103 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0104
     * @tc.name      PageLoading_ProductSuffix_0104
     * @tc.desc      productSuffix(id=86) returns "86"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0104 begin`);
      const actual: string = productSuffix(86);
      logInfo(`productSuffix(id=86): actual=${actual}`);
      expect(actual).assertEqual('86');
      logInfo(`${BUNDLE}ProductSuffix_0104 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0105
     * @tc.name      PageLoading_ProductSuffix_0105
     * @tc.desc      productSuffix(id=3.04) returns "03.04"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0105 begin`);
      const actual: string = productSuffix(3.04);
      logInfo(`productSuffix(id=3.04): actual=${actual}`);
      expect(actual).assertEqual('03.04');
      logInfo(`${BUNDLE}ProductSuffix_0105 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0106
     * @tc.name      PageLoading_ProductSuffix_0106
     * @tc.desc      productSuffix(id=28.1) returns "28.1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0106 begin`);
      const actual: string = productSuffix(28.1);
      logInfo(`productSuffix(id=28.1): actual=${actual}`);
      expect(actual).assertEqual('28.1');
      logInfo(`${BUNDLE}ProductSuffix_0106 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0107
     * @tc.name      PageLoading_ProductSuffix_0107
     * @tc.desc      productSuffix(id=-91) returns "0-91"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductSuffix_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductSuffix_0107 begin`);
      const actual: string = productSuffix(-91);
      logInfo(`productSuffix(id=-91): actual=${actual}`);
      expect(actual).assertEqual('0-91');
      logInfo(`${BUNDLE}ProductSuffix_0107 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0108
     * @tc.name      PageLoading_ProductSuffix_0108
     * @tc.desc      productSuffix(id=102) returns "102"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0108 begin`);
      const actual: string = productSuffix(102);
      logInfo(`productSuffix(id=102): actual=${actual}`);
      expect(actual).assertEqual('102');
      logInfo(`${BUNDLE}ProductSuffix_0108 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0109
     * @tc.name      PageLoading_ProductSuffix_0109
     * @tc.desc      productSuffix(id=87) returns "87"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0109 begin`);
      const actual: string = productSuffix(87);
      logInfo(`productSuffix(id=87): actual=${actual}`);
      expect(actual).assertEqual('87');
      logInfo(`${BUNDLE}ProductSuffix_0109 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0110
     * @tc.name      PageLoading_ProductSuffix_0110
     * @tc.desc      productSuffix(id=41.38) returns "41.38"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0110 begin`);
      const actual: string = productSuffix(41.38);
      logInfo(`productSuffix(id=41.38): actual=${actual}`);
      expect(actual).assertEqual('41.38');
      logInfo(`${BUNDLE}ProductSuffix_0110 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0111
     * @tc.name      PageLoading_ProductSuffix_0111
     * @tc.desc      productSuffix(id=58.85) returns "58.85"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0111 begin`);
      const actual: string = productSuffix(58.85);
      logInfo(`productSuffix(id=58.85): actual=${actual}`);
      expect(actual).assertEqual('58.85');
      logInfo(`${BUNDLE}ProductSuffix_0111 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0112
     * @tc.name      PageLoading_ProductSuffix_0112
     * @tc.desc      productSuffix(id=168) returns "168"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0112 begin`);
      const actual: string = productSuffix(168);
      logInfo(`productSuffix(id=168): actual=${actual}`);
      expect(actual).assertEqual('168');
      logInfo(`${BUNDLE}ProductSuffix_0112 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0113
     * @tc.name      PageLoading_ProductSuffix_0113
     * @tc.desc      productSuffix(id=27.74) returns "27.74"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0113 begin`);
      const actual: string = productSuffix(27.74);
      logInfo(`productSuffix(id=27.74): actual=${actual}`);
      expect(actual).assertEqual('27.74');
      logInfo(`${BUNDLE}ProductSuffix_0113 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0114
     * @tc.name      PageLoading_ProductSuffix_0114
     * @tc.desc      productSuffix(id=31) returns "31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0114 begin`);
      const actual: string = productSuffix(31);
      logInfo(`productSuffix(id=31): actual=${actual}`);
      expect(actual).assertEqual('31');
      logInfo(`${BUNDLE}ProductSuffix_0114 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0115
     * @tc.name      PageLoading_ProductSuffix_0115
     * @tc.desc      productSuffix(id=49) returns "49"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0115 begin`);
      const actual: string = productSuffix(49);
      logInfo(`productSuffix(id=49): actual=${actual}`);
      expect(actual).assertEqual('49');
      logInfo(`${BUNDLE}ProductSuffix_0115 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0116
     * @tc.name      PageLoading_ProductSuffix_0116
     * @tc.desc      productSuffix(id=23.84) returns "23.84"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0116 begin`);
      const actual: string = productSuffix(23.84);
      logInfo(`productSuffix(id=23.84): actual=${actual}`);
      expect(actual).assertEqual('23.84');
      logInfo(`${BUNDLE}ProductSuffix_0116 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0117
     * @tc.name      PageLoading_ProductSuffix_0117
     * @tc.desc      productSuffix(id=189) returns "189"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0117 begin`);
      const actual: string = productSuffix(189);
      logInfo(`productSuffix(id=189): actual=${actual}`);
      expect(actual).assertEqual('189');
      logInfo(`${BUNDLE}ProductSuffix_0117 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0118
     * @tc.name      PageLoading_ProductSuffix_0118
     * @tc.desc      productSuffix(id=-77) returns "0-77"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProductSuffix_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProductSuffix_0118 begin`);
      const actual: string = productSuffix(-77);
      logInfo(`productSuffix(id=-77): actual=${actual}`);
      expect(actual).assertEqual('0-77');
      logInfo(`${BUNDLE}ProductSuffix_0118 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0119
     * @tc.name      PageLoading_ProductSuffix_0119
     * @tc.desc      productSuffix(id=95.83) returns "95.83"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0119 begin`);
      const actual: string = productSuffix(95.83);
      logInfo(`productSuffix(id=95.83): actual=${actual}`);
      expect(actual).assertEqual('95.83');
      logInfo(`${BUNDLE}ProductSuffix_0119 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PRODUCT_SUFFIX_0120
     * @tc.name      PageLoading_ProductSuffix_0120
     * @tc.desc      productSuffix(id=47) returns "47"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProductSuffix_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProductSuffix_0120 begin`);
      const actual: string = productSuffix(47);
      logInfo(`productSuffix(id=47): actual=${actual}`);
      expect(actual).assertEqual('47');
      logInfo(`${BUNDLE}ProductSuffix_0120 end`);
    });
  });
}
