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
import { commodityKey } from '../model/PageLoadingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PageLoading]';
const BUNDLE: string = 'PageLoading_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for commodityKey (24 cases). */
export default function commodityKey2Test(): void {
  describe('CommodityKey2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0097
     * @tc.name      PageLoading_CommodityKey_0097
     * @tc.desc      commodityKey(id=79) returns "79"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0097 begin`);
      const actual: string = commodityKey(79);
      logInfo(`commodityKey(id=79): actual=${actual}`);
      expect(actual).assertEqual('79');
      logInfo(`${BUNDLE}CommodityKey_0097 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0098
     * @tc.name      PageLoading_CommodityKey_0098
     * @tc.desc      commodityKey(id=91.89) returns "91.89"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0098 begin`);
      const actual: string = commodityKey(91.89);
      logInfo(`commodityKey(id=91.89): actual=${actual}`);
      expect(actual).assertEqual('91.89');
      logInfo(`${BUNDLE}CommodityKey_0098 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0099
     * @tc.name      PageLoading_CommodityKey_0099
     * @tc.desc      commodityKey(id=178) returns "178"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0099 begin`);
      const actual: string = commodityKey(178);
      logInfo(`commodityKey(id=178): actual=${actual}`);
      expect(actual).assertEqual('178');
      logInfo(`${BUNDLE}CommodityKey_0099 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0100
     * @tc.name      PageLoading_CommodityKey_0100
     * @tc.desc      commodityKey(id=171) returns "171"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0100 begin`);
      const actual: string = commodityKey(171);
      logInfo(`commodityKey(id=171): actual=${actual}`);
      expect(actual).assertEqual('171');
      logInfo(`${BUNDLE}CommodityKey_0100 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0101
     * @tc.name      PageLoading_CommodityKey_0101
     * @tc.desc      commodityKey(id=127) returns "127"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0101 begin`);
      const actual: string = commodityKey(127);
      logInfo(`commodityKey(id=127): actual=${actual}`);
      expect(actual).assertEqual('127');
      logInfo(`${BUNDLE}CommodityKey_0101 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0102
     * @tc.name      PageLoading_CommodityKey_0102
     * @tc.desc      commodityKey(id=88.88) returns "88.88"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0102 begin`);
      const actual: string = commodityKey(88.88);
      logInfo(`commodityKey(id=88.88): actual=${actual}`);
      expect(actual).assertEqual('88.88');
      logInfo(`${BUNDLE}CommodityKey_0102 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0103
     * @tc.name      PageLoading_CommodityKey_0103
     * @tc.desc      commodityKey(id=158) returns "158"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0103 begin`);
      const actual: string = commodityKey(158);
      logInfo(`commodityKey(id=158): actual=${actual}`);
      expect(actual).assertEqual('158');
      logInfo(`${BUNDLE}CommodityKey_0103 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0104
     * @tc.name      PageLoading_CommodityKey_0104
     * @tc.desc      commodityKey(id=23) returns "23"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0104 begin`);
      const actual: string = commodityKey(23);
      logInfo(`commodityKey(id=23): actual=${actual}`);
      expect(actual).assertEqual('23');
      logInfo(`${BUNDLE}CommodityKey_0104 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0105
     * @tc.name      PageLoading_CommodityKey_0105
     * @tc.desc      commodityKey(id=83.48) returns "83.48"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0105 begin`);
      const actual: string = commodityKey(83.48);
      logInfo(`commodityKey(id=83.48): actual=${actual}`);
      expect(actual).assertEqual('83.48');
      logInfo(`${BUNDLE}CommodityKey_0105 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0106
     * @tc.name      PageLoading_CommodityKey_0106
     * @tc.desc      commodityKey(id=40.52) returns "40.52"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0106 begin`);
      const actual: string = commodityKey(40.52);
      logInfo(`commodityKey(id=40.52): actual=${actual}`);
      expect(actual).assertEqual('40.52');
      logInfo(`${BUNDLE}CommodityKey_0106 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0107
     * @tc.name      PageLoading_CommodityKey_0107
     * @tc.desc      commodityKey(id=98) returns "98"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0107 begin`);
      const actual: string = commodityKey(98);
      logInfo(`commodityKey(id=98): actual=${actual}`);
      expect(actual).assertEqual('98');
      logInfo(`${BUNDLE}CommodityKey_0107 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0108
     * @tc.name      PageLoading_CommodityKey_0108
     * @tc.desc      commodityKey(id=-15) returns "-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityKey_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityKey_0108 begin`);
      const actual: string = commodityKey(-15);
      logInfo(`commodityKey(id=-15): actual=${actual}`);
      expect(actual).assertEqual('-15');
      logInfo(`${BUNDLE}CommodityKey_0108 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0109
     * @tc.name      PageLoading_CommodityKey_0109
     * @tc.desc      commodityKey(id=42.17) returns "42.17"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0109 begin`);
      const actual: string = commodityKey(42.17);
      logInfo(`commodityKey(id=42.17): actual=${actual}`);
      expect(actual).assertEqual('42.17');
      logInfo(`${BUNDLE}CommodityKey_0109 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0110
     * @tc.name      PageLoading_CommodityKey_0110
     * @tc.desc      commodityKey(id=74.23) returns "74.23"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0110 begin`);
      const actual: string = commodityKey(74.23);
      logInfo(`commodityKey(id=74.23): actual=${actual}`);
      expect(actual).assertEqual('74.23');
      logInfo(`${BUNDLE}CommodityKey_0110 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0111
     * @tc.name      PageLoading_CommodityKey_0111
     * @tc.desc      commodityKey(id=-19) returns "-19"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityKey_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityKey_0111 begin`);
      const actual: string = commodityKey(-19);
      logInfo(`commodityKey(id=-19): actual=${actual}`);
      expect(actual).assertEqual('-19');
      logInfo(`${BUNDLE}CommodityKey_0111 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0112
     * @tc.name      PageLoading_CommodityKey_0112
     * @tc.desc      commodityKey(id=74) returns "74"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0112 begin`);
      const actual: string = commodityKey(74);
      logInfo(`commodityKey(id=74): actual=${actual}`);
      expect(actual).assertEqual('74');
      logInfo(`${BUNDLE}CommodityKey_0112 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0113
     * @tc.name      PageLoading_CommodityKey_0113
     * @tc.desc      commodityKey(id=4) returns "4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0113 begin`);
      const actual: string = commodityKey(4);
      logInfo(`commodityKey(id=4): actual=${actual}`);
      expect(actual).assertEqual('4');
      logInfo(`${BUNDLE}CommodityKey_0113 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0114
     * @tc.name      PageLoading_CommodityKey_0114
     * @tc.desc      commodityKey(id=39) returns "39"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0114 begin`);
      const actual: string = commodityKey(39);
      logInfo(`commodityKey(id=39): actual=${actual}`);
      expect(actual).assertEqual('39');
      logInfo(`${BUNDLE}CommodityKey_0114 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0115
     * @tc.name      PageLoading_CommodityKey_0115
     * @tc.desc      commodityKey(id=87) returns "87"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0115 begin`);
      const actual: string = commodityKey(87);
      logInfo(`commodityKey(id=87): actual=${actual}`);
      expect(actual).assertEqual('87');
      logInfo(`${BUNDLE}CommodityKey_0115 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0116
     * @tc.name      PageLoading_CommodityKey_0116
     * @tc.desc      commodityKey(id=-33) returns "-33"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityKey_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityKey_0116 begin`);
      const actual: string = commodityKey(-33);
      logInfo(`commodityKey(id=-33): actual=${actual}`);
      expect(actual).assertEqual('-33');
      logInfo(`${BUNDLE}CommodityKey_0116 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0117
     * @tc.name      PageLoading_CommodityKey_0117
     * @tc.desc      commodityKey(id=29) returns "29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0117 begin`);
      const actual: string = commodityKey(29);
      logInfo(`commodityKey(id=29): actual=${actual}`);
      expect(actual).assertEqual('29');
      logInfo(`${BUNDLE}CommodityKey_0117 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0118
     * @tc.name      PageLoading_CommodityKey_0118
     * @tc.desc      commodityKey(id=154) returns "154"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0118 begin`);
      const actual: string = commodityKey(154);
      logInfo(`commodityKey(id=154): actual=${actual}`);
      expect(actual).assertEqual('154');
      logInfo(`${BUNDLE}CommodityKey_0118 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0119
     * @tc.name      PageLoading_CommodityKey_0119
     * @tc.desc      commodityKey(id=56) returns "56"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0119 begin`);
      const actual: string = commodityKey(56);
      logInfo(`commodityKey(id=56): actual=${actual}`);
      expect(actual).assertEqual('56');
      logInfo(`${BUNDLE}CommodityKey_0119 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_KEY_0120
     * @tc.name      PageLoading_CommodityKey_0120
     * @tc.desc      commodityKey(id=17) returns "17"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityKey_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityKey_0120 begin`);
      const actual: string = commodityKey(17);
      logInfo(`commodityKey(id=17): actual=${actual}`);
      expect(actual).assertEqual('17');
      logInfo(`${BUNDLE}CommodityKey_0120 end`);
    });
  });
}
