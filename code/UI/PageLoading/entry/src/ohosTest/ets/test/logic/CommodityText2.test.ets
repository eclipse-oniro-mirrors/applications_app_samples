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
import { commodityText } from '../model/PageLoadingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PageLoading]';
const BUNDLE: string = 'PageLoading_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for commodityText (96 cases). */
export default function commodityText2Test(): void {
  describe('CommodityText2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0097
     * @tc.name      PageLoading_CommodityText_0097
     * @tc.desc      commodityText(id=2, title="  ") returns "2    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PageLoading_CommodityText_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CommodityText_0097 begin`);
      const actual: string = commodityText(2, '  ');
      logInfo(`commodityText(id=2, title="  "): actual=${actual}`);
      expect(actual).assertEqual('2    ');
      logInfo(`${BUNDLE}CommodityText_0097 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0098
     * @tc.name      PageLoading_CommodityText_0098
     * @tc.desc      commodityText(id=2, title=" ") returns "2   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0098 begin`);
      const actual: string = commodityText(2, ' ');
      logInfo(`commodityText(id=2, title=" "): actual=${actual}`);
      expect(actual).assertEqual('2   ');
      logInfo(`${BUNDLE}CommodityText_0098 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0099
     * @tc.name      PageLoading_CommodityText_0099
     * @tc.desc      commodityText(id=2, title="  x") returns "2    x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0099 begin`);
      const actual: string = commodityText(2, '  x');
      logInfo(`commodityText(id=2, title="  x"): actual=${actual}`);
      expect(actual).assertEqual('2    x');
      logInfo(`${BUNDLE}CommodityText_0099 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0100
     * @tc.name      PageLoading_CommodityText_0100
     * @tc.desc      commodityText(id=2, title="Hello") returns "2  Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0100 begin`);
      const actual: string = commodityText(2, 'Hello');
      logInfo(`commodityText(id=2, title="Hello"): actual=${actual}`);
      expect(actual).assertEqual('2  Hello');
      logInfo(`${BUNDLE}CommodityText_0100 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0101
     * @tc.name      PageLoading_CommodityText_0101
     * @tc.desc      commodityText(id=2, title="hello world") returns "2  hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0101 begin`);
      const actual: string = commodityText(2, 'hello world');
      logInfo(`commodityText(id=2, title="hello world"): actual=${actual}`);
      expect(actual).assertEqual('2  hello world');
      logInfo(`${BUNDLE}CommodityText_0101 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0102
     * @tc.name      PageLoading_CommodityText_0102
     * @tc.desc      commodityText(id=2, title="") returns "2  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0102 begin`);
      const actual: string = commodityText(2, '');
      logInfo(`commodityText(id=2, title=""): actual=${actual}`);
      expect(actual).assertEqual('2  ');
      logInfo(`${BUNDLE}CommodityText_0102 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0103
     * @tc.name      PageLoading_CommodityText_0103
     * @tc.desc      commodityText(id=2, title="A") returns "2  A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0103 begin`);
      const actual: string = commodityText(2, 'A');
      logInfo(`commodityText(id=2, title="A"): actual=${actual}`);
      expect(actual).assertEqual('2  A');
      logInfo(`${BUNDLE}CommodityText_0103 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0104
     * @tc.name      PageLoading_CommodityText_0104
     * @tc.desc      commodityText(id=2, title="Sample Title 123") returns "2  Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0104 begin`);
      const actual: string = commodityText(2, 'Sample Title 123');
      logInfo(`commodityText(id=2, title="Sample Title 1...: actual=${actual}`);
      expect(actual).assertEqual('2  Sample Title 123');
      logInfo(`${BUNDLE}CommodityText_0104 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0105
     * @tc.name      PageLoading_CommodityText_0105
     * @tc.desc      commodityText(id=2, title="??") returns "2  ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0105 begin`);
      const actual: string = commodityText(2, '\u4e2d\u6587');
      logInfo(`commodityText(id=2, title="??"): actual=${actual}`);
      expect(actual).assertEqual('2  \u4e2d\u6587');
      logInfo(`${BUNDLE}CommodityText_0105 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0106
     * @tc.name      PageLoading_CommodityText_0106
     * @tc.desc      commodityText(id=2, title="a") returns "2  a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0106 begin`);
      const actual: string = commodityText(2, 'a');
      logInfo(`commodityText(id=2, title="a"): actual=${actual}`);
      expect(actual).assertEqual('2  a');
      logInfo(`${BUNDLE}CommodityText_0106 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0107
     * @tc.name      PageLoading_CommodityText_0107
     * @tc.desc      commodityText(id=2, title="abc") returns "2  abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0107 begin`);
      const actual: string = commodityText(2, 'abc');
      logInfo(`commodityText(id=2, title="abc"): actual=${actual}`);
      expect(actual).assertEqual('2  abc');
      logInfo(`${BUNDLE}CommodityText_0107 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0108
     * @tc.name      PageLoading_CommodityText_0108
     * @tc.desc      commodityText(id=2, title="Hello World") returns "2  Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0108 begin`);
      const actual: string = commodityText(2, 'Hello World');
      logInfo(`commodityText(id=2, title="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('2  Hello World');
      logInfo(`${BUNDLE}CommodityText_0108 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0109
     * @tc.name      PageLoading_CommodityText_0109
     * @tc.desc      commodityText(id=2, title="123") returns "2  123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0109 begin`);
      const actual: string = commodityText(2, '123');
      logInfo(`commodityText(id=2, title="123"): actual=${actual}`);
      expect(actual).assertEqual('2  123');
      logInfo(`${BUNDLE}CommodityText_0109 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0110
     * @tc.name      PageLoading_CommodityText_0110
     * @tc.desc      commodityText(id=2, title="    ") returns "2      "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0110 begin`);
      const actual: string = commodityText(2, '    ');
      logInfo(`commodityText(id=2, title="    "): actual=${actual}`);
      expect(actual).assertEqual('2      ');
      logInfo(`${BUNDLE}CommodityText_0110 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0111
     * @tc.name      PageLoading_CommodityText_0111
     * @tc.desc      commodityText(id=2, title="  _1") returns "2    _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0111 begin`);
      const actual: string = commodityText(2, '  _1');
      logInfo(`commodityText(id=2, title="  _1"): actual=${actual}`);
      expect(actual).assertEqual('2    _1');
      logInfo(`${BUNDLE}CommodityText_0111 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0112
     * @tc.name      PageLoading_CommodityText_0112
     * @tc.desc      commodityText(id=2, title="x  ") returns "2  x  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0112 begin`);
      const actual: string = commodityText(2, 'x  ');
      logInfo(`commodityText(id=2, title="x  "): actual=${actual}`);
      expect(actual).assertEqual('2  x  ');
      logInfo(`${BUNDLE}CommodityText_0112 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0113
     * @tc.name      PageLoading_CommodityText_0113
     * @tc.desc      commodityText(id=2, title="   ") returns "2     "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0113 begin`);
      const actual: string = commodityText(2, '   ');
      logInfo(`commodityText(id=2, title="   "): actual=${actual}`);
      expect(actual).assertEqual('2     ');
      logInfo(`${BUNDLE}CommodityText_0113 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0114
     * @tc.name      PageLoading_CommodityText_0114
     * @tc.desc      commodityText(id=2, title=" _1") returns "2   _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0114 begin`);
      const actual: string = commodityText(2, ' _1');
      logInfo(`commodityText(id=2, title=" _1"): actual=${actual}`);
      expect(actual).assertEqual('2   _1');
      logInfo(`${BUNDLE}CommodityText_0114 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0115
     * @tc.name      PageLoading_CommodityText_0115
     * @tc.desc      commodityText(id=2, title="x ") returns "2  x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0115 begin`);
      const actual: string = commodityText(2, 'x ');
      logInfo(`commodityText(id=2, title="x "): actual=${actual}`);
      expect(actual).assertEqual('2  x ');
      logInfo(`${BUNDLE}CommodityText_0115 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0116
     * @tc.name      PageLoading_CommodityText_0116
     * @tc.desc      commodityText(id=2, title="   x ") returns "2     x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0116 begin`);
      const actual: string = commodityText(2, '   x ');
      logInfo(`commodityText(id=2, title="   x "): actual=${actual}`);
      expect(actual).assertEqual('2     x ');
      logInfo(`${BUNDLE}CommodityText_0116 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0117
     * @tc.name      PageLoading_CommodityText_0117
     * @tc.desc      commodityText(id=2, title="  x  x") returns "2    x  x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0117 begin`);
      const actual: string = commodityText(2, '  x  x');
      logInfo(`commodityText(id=2, title="  x  x"): actual=${actual}`);
      expect(actual).assertEqual('2    x  x');
      logInfo(`${BUNDLE}CommodityText_0117 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0118
     * @tc.name      PageLoading_CommodityText_0118
     * @tc.desc      commodityText(id=2, title="  x_1") returns "2    x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0118 begin`);
      const actual: string = commodityText(2, '  x_1');
      logInfo(`commodityText(id=2, title="  x_1"): actual=${actual}`);
      expect(actual).assertEqual('2    x_1');
      logInfo(`${BUNDLE}CommodityText_0118 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0119
     * @tc.name      PageLoading_CommodityText_0119
     * @tc.desc      commodityText(id=2, title="x  x") returns "2  x  x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0119 begin`);
      const actual: string = commodityText(2, 'x  x');
      logInfo(`commodityText(id=2, title="x  x"): actual=${actual}`);
      expect(actual).assertEqual('2  x  x');
      logInfo(`${BUNDLE}CommodityText_0119 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0120
     * @tc.name      PageLoading_CommodityText_0120
     * @tc.desc      commodityText(id=2, title=" Hello ") returns "2   Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0120 begin`);
      const actual: string = commodityText(2, ' Hello ');
      logInfo(`commodityText(id=2, title=" Hello "): actual=${actual}`);
      expect(actual).assertEqual('2   Hello ');
      logInfo(`${BUNDLE}CommodityText_0120 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0121
     * @tc.name      PageLoading_CommodityText_0121
     * @tc.desc      commodityText(id=3, title="  ") returns "3    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PageLoading_CommodityText_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CommodityText_0121 begin`);
      const actual: string = commodityText(3, '  ');
      logInfo(`commodityText(id=3, title="  "): actual=${actual}`);
      expect(actual).assertEqual('3    ');
      logInfo(`${BUNDLE}CommodityText_0121 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0122
     * @tc.name      PageLoading_CommodityText_0122
     * @tc.desc      commodityText(id=3, title=" ") returns "3   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0122 begin`);
      const actual: string = commodityText(3, ' ');
      logInfo(`commodityText(id=3, title=" "): actual=${actual}`);
      expect(actual).assertEqual('3   ');
      logInfo(`${BUNDLE}CommodityText_0122 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0123
     * @tc.name      PageLoading_CommodityText_0123
     * @tc.desc      commodityText(id=3, title="  x") returns "3    x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0123 begin`);
      const actual: string = commodityText(3, '  x');
      logInfo(`commodityText(id=3, title="  x"): actual=${actual}`);
      expect(actual).assertEqual('3    x');
      logInfo(`${BUNDLE}CommodityText_0123 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0124
     * @tc.name      PageLoading_CommodityText_0124
     * @tc.desc      commodityText(id=3, title="Hello") returns "3  Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0124 begin`);
      const actual: string = commodityText(3, 'Hello');
      logInfo(`commodityText(id=3, title="Hello"): actual=${actual}`);
      expect(actual).assertEqual('3  Hello');
      logInfo(`${BUNDLE}CommodityText_0124 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0125
     * @tc.name      PageLoading_CommodityText_0125
     * @tc.desc      commodityText(id=3, title="hello world") returns "3  hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0125 begin`);
      const actual: string = commodityText(3, 'hello world');
      logInfo(`commodityText(id=3, title="hello world"): actual=${actual}`);
      expect(actual).assertEqual('3  hello world');
      logInfo(`${BUNDLE}CommodityText_0125 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0126
     * @tc.name      PageLoading_CommodityText_0126
     * @tc.desc      commodityText(id=3, title="") returns "3  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0126 begin`);
      const actual: string = commodityText(3, '');
      logInfo(`commodityText(id=3, title=""): actual=${actual}`);
      expect(actual).assertEqual('3  ');
      logInfo(`${BUNDLE}CommodityText_0126 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0127
     * @tc.name      PageLoading_CommodityText_0127
     * @tc.desc      commodityText(id=3, title="A") returns "3  A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0127 begin`);
      const actual: string = commodityText(3, 'A');
      logInfo(`commodityText(id=3, title="A"): actual=${actual}`);
      expect(actual).assertEqual('3  A');
      logInfo(`${BUNDLE}CommodityText_0127 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0128
     * @tc.name      PageLoading_CommodityText_0128
     * @tc.desc      commodityText(id=3, title="Sample Title 123") returns "3  Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0128 begin`);
      const actual: string = commodityText(3, 'Sample Title 123');
      logInfo(`commodityText(id=3, title="Sample Title 1...: actual=${actual}`);
      expect(actual).assertEqual('3  Sample Title 123');
      logInfo(`${BUNDLE}CommodityText_0128 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0129
     * @tc.name      PageLoading_CommodityText_0129
     * @tc.desc      commodityText(id=3, title="??") returns "3  ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0129 begin`);
      const actual: string = commodityText(3, '\u4e2d\u6587');
      logInfo(`commodityText(id=3, title="??"): actual=${actual}`);
      expect(actual).assertEqual('3  \u4e2d\u6587');
      logInfo(`${BUNDLE}CommodityText_0129 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0130
     * @tc.name      PageLoading_CommodityText_0130
     * @tc.desc      commodityText(id=3, title="a") returns "3  a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0130 begin`);
      const actual: string = commodityText(3, 'a');
      logInfo(`commodityText(id=3, title="a"): actual=${actual}`);
      expect(actual).assertEqual('3  a');
      logInfo(`${BUNDLE}CommodityText_0130 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0131
     * @tc.name      PageLoading_CommodityText_0131
     * @tc.desc      commodityText(id=3, title="abc") returns "3  abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0131 begin`);
      const actual: string = commodityText(3, 'abc');
      logInfo(`commodityText(id=3, title="abc"): actual=${actual}`);
      expect(actual).assertEqual('3  abc');
      logInfo(`${BUNDLE}CommodityText_0131 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0132
     * @tc.name      PageLoading_CommodityText_0132
     * @tc.desc      commodityText(id=3, title="Hello World") returns "3  Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0132 begin`);
      const actual: string = commodityText(3, 'Hello World');
      logInfo(`commodityText(id=3, title="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('3  Hello World');
      logInfo(`${BUNDLE}CommodityText_0132 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0133
     * @tc.name      PageLoading_CommodityText_0133
     * @tc.desc      commodityText(id=3, title="123") returns "3  123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0133 begin`);
      const actual: string = commodityText(3, '123');
      logInfo(`commodityText(id=3, title="123"): actual=${actual}`);
      expect(actual).assertEqual('3  123');
      logInfo(`${BUNDLE}CommodityText_0133 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0134
     * @tc.name      PageLoading_CommodityText_0134
     * @tc.desc      commodityText(id=3, title="    ") returns "3      "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0134 begin`);
      const actual: string = commodityText(3, '    ');
      logInfo(`commodityText(id=3, title="    "): actual=${actual}`);
      expect(actual).assertEqual('3      ');
      logInfo(`${BUNDLE}CommodityText_0134 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0135
     * @tc.name      PageLoading_CommodityText_0135
     * @tc.desc      commodityText(id=3, title="  _1") returns "3    _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0135 begin`);
      const actual: string = commodityText(3, '  _1');
      logInfo(`commodityText(id=3, title="  _1"): actual=${actual}`);
      expect(actual).assertEqual('3    _1');
      logInfo(`${BUNDLE}CommodityText_0135 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0136
     * @tc.name      PageLoading_CommodityText_0136
     * @tc.desc      commodityText(id=3, title="x  ") returns "3  x  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0136 begin`);
      const actual: string = commodityText(3, 'x  ');
      logInfo(`commodityText(id=3, title="x  "): actual=${actual}`);
      expect(actual).assertEqual('3  x  ');
      logInfo(`${BUNDLE}CommodityText_0136 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0137
     * @tc.name      PageLoading_CommodityText_0137
     * @tc.desc      commodityText(id=3, title="   ") returns "3     "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0137 begin`);
      const actual: string = commodityText(3, '   ');
      logInfo(`commodityText(id=3, title="   "): actual=${actual}`);
      expect(actual).assertEqual('3     ');
      logInfo(`${BUNDLE}CommodityText_0137 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0138
     * @tc.name      PageLoading_CommodityText_0138
     * @tc.desc      commodityText(id=3, title=" _1") returns "3   _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0138 begin`);
      const actual: string = commodityText(3, ' _1');
      logInfo(`commodityText(id=3, title=" _1"): actual=${actual}`);
      expect(actual).assertEqual('3   _1');
      logInfo(`${BUNDLE}CommodityText_0138 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0139
     * @tc.name      PageLoading_CommodityText_0139
     * @tc.desc      commodityText(id=3, title="x ") returns "3  x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0139 begin`);
      const actual: string = commodityText(3, 'x ');
      logInfo(`commodityText(id=3, title="x "): actual=${actual}`);
      expect(actual).assertEqual('3  x ');
      logInfo(`${BUNDLE}CommodityText_0139 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0140
     * @tc.name      PageLoading_CommodityText_0140
     * @tc.desc      commodityText(id=3, title="   x ") returns "3     x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0140 begin`);
      const actual: string = commodityText(3, '   x ');
      logInfo(`commodityText(id=3, title="   x "): actual=${actual}`);
      expect(actual).assertEqual('3     x ');
      logInfo(`${BUNDLE}CommodityText_0140 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0141
     * @tc.name      PageLoading_CommodityText_0141
     * @tc.desc      commodityText(id=3, title="  x  x") returns "3    x  x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0141 begin`);
      const actual: string = commodityText(3, '  x  x');
      logInfo(`commodityText(id=3, title="  x  x"): actual=${actual}`);
      expect(actual).assertEqual('3    x  x');
      logInfo(`${BUNDLE}CommodityText_0141 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0142
     * @tc.name      PageLoading_CommodityText_0142
     * @tc.desc      commodityText(id=3, title="  x_1") returns "3    x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0142 begin`);
      const actual: string = commodityText(3, '  x_1');
      logInfo(`commodityText(id=3, title="  x_1"): actual=${actual}`);
      expect(actual).assertEqual('3    x_1');
      logInfo(`${BUNDLE}CommodityText_0142 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0143
     * @tc.name      PageLoading_CommodityText_0143
     * @tc.desc      commodityText(id=3, title="x  x") returns "3  x  x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0143 begin`);
      const actual: string = commodityText(3, 'x  x');
      logInfo(`commodityText(id=3, title="x  x"): actual=${actual}`);
      expect(actual).assertEqual('3  x  x');
      logInfo(`${BUNDLE}CommodityText_0143 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0144
     * @tc.name      PageLoading_CommodityText_0144
     * @tc.desc      commodityText(id=3, title=" Hello ") returns "3   Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0144 begin`);
      const actual: string = commodityText(3, ' Hello ');
      logInfo(`commodityText(id=3, title=" Hello "): actual=${actual}`);
      expect(actual).assertEqual('3   Hello ');
      logInfo(`${BUNDLE}CommodityText_0144 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0145
     * @tc.name      PageLoading_CommodityText_0145
     * @tc.desc      commodityText(id=10, title="  ") returns "10    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PageLoading_CommodityText_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CommodityText_0145 begin`);
      const actual: string = commodityText(10, '  ');
      logInfo(`commodityText(id=10, title="  "): actual=${actual}`);
      expect(actual).assertEqual('10    ');
      logInfo(`${BUNDLE}CommodityText_0145 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0146
     * @tc.name      PageLoading_CommodityText_0146
     * @tc.desc      commodityText(id=10, title=" ") returns "10   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0146 begin`);
      const actual: string = commodityText(10, ' ');
      logInfo(`commodityText(id=10, title=" "): actual=${actual}`);
      expect(actual).assertEqual('10   ');
      logInfo(`${BUNDLE}CommodityText_0146 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0147
     * @tc.name      PageLoading_CommodityText_0147
     * @tc.desc      commodityText(id=10, title="  x") returns "10    x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0147 begin`);
      const actual: string = commodityText(10, '  x');
      logInfo(`commodityText(id=10, title="  x"): actual=${actual}`);
      expect(actual).assertEqual('10    x');
      logInfo(`${BUNDLE}CommodityText_0147 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0148
     * @tc.name      PageLoading_CommodityText_0148
     * @tc.desc      commodityText(id=10, title="Hello") returns "10  Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0148 begin`);
      const actual: string = commodityText(10, 'Hello');
      logInfo(`commodityText(id=10, title="Hello"): actual=${actual}`);
      expect(actual).assertEqual('10  Hello');
      logInfo(`${BUNDLE}CommodityText_0148 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0149
     * @tc.name      PageLoading_CommodityText_0149
     * @tc.desc      commodityText(id=10, title="hello world") returns "10  hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0149 begin`);
      const actual: string = commodityText(10, 'hello world');
      logInfo(`commodityText(id=10, title="hello world"): actual=${actual}`);
      expect(actual).assertEqual('10  hello world');
      logInfo(`${BUNDLE}CommodityText_0149 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0150
     * @tc.name      PageLoading_CommodityText_0150
     * @tc.desc      commodityText(id=10, title="") returns "10  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0150 begin`);
      const actual: string = commodityText(10, '');
      logInfo(`commodityText(id=10, title=""): actual=${actual}`);
      expect(actual).assertEqual('10  ');
      logInfo(`${BUNDLE}CommodityText_0150 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0151
     * @tc.name      PageLoading_CommodityText_0151
     * @tc.desc      commodityText(id=10, title="A") returns "10  A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0151 begin`);
      const actual: string = commodityText(10, 'A');
      logInfo(`commodityText(id=10, title="A"): actual=${actual}`);
      expect(actual).assertEqual('10  A');
      logInfo(`${BUNDLE}CommodityText_0151 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0152
     * @tc.name      PageLoading_CommodityText_0152
     * @tc.desc      commodityText(id=10, title="Sample Title 123") returns "10  Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0152 begin`);
      const actual: string = commodityText(10, 'Sample Title 123');
      logInfo(`commodityText(id=10, title="Sample Title ...: actual=${actual}`);
      expect(actual).assertEqual('10  Sample Title 123');
      logInfo(`${BUNDLE}CommodityText_0152 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0153
     * @tc.name      PageLoading_CommodityText_0153
     * @tc.desc      commodityText(id=10, title="??") returns "10  ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0153 begin`);
      const actual: string = commodityText(10, '\u4e2d\u6587');
      logInfo(`commodityText(id=10, title="??"): actual=${actual}`);
      expect(actual).assertEqual('10  \u4e2d\u6587');
      logInfo(`${BUNDLE}CommodityText_0153 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0154
     * @tc.name      PageLoading_CommodityText_0154
     * @tc.desc      commodityText(id=10, title="a") returns "10  a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0154 begin`);
      const actual: string = commodityText(10, 'a');
      logInfo(`commodityText(id=10, title="a"): actual=${actual}`);
      expect(actual).assertEqual('10  a');
      logInfo(`${BUNDLE}CommodityText_0154 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0155
     * @tc.name      PageLoading_CommodityText_0155
     * @tc.desc      commodityText(id=10, title="abc") returns "10  abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0155 begin`);
      const actual: string = commodityText(10, 'abc');
      logInfo(`commodityText(id=10, title="abc"): actual=${actual}`);
      expect(actual).assertEqual('10  abc');
      logInfo(`${BUNDLE}CommodityText_0155 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0156
     * @tc.name      PageLoading_CommodityText_0156
     * @tc.desc      commodityText(id=10, title="Hello World") returns "10  Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0156 begin`);
      const actual: string = commodityText(10, 'Hello World');
      logInfo(`commodityText(id=10, title="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('10  Hello World');
      logInfo(`${BUNDLE}CommodityText_0156 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0157
     * @tc.name      PageLoading_CommodityText_0157
     * @tc.desc      commodityText(id=10, title="123") returns "10  123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0157 begin`);
      const actual: string = commodityText(10, '123');
      logInfo(`commodityText(id=10, title="123"): actual=${actual}`);
      expect(actual).assertEqual('10  123');
      logInfo(`${BUNDLE}CommodityText_0157 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0158
     * @tc.name      PageLoading_CommodityText_0158
     * @tc.desc      commodityText(id=10, title="    ") returns "10      "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0158 begin`);
      const actual: string = commodityText(10, '    ');
      logInfo(`commodityText(id=10, title="    "): actual=${actual}`);
      expect(actual).assertEqual('10      ');
      logInfo(`${BUNDLE}CommodityText_0158 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0159
     * @tc.name      PageLoading_CommodityText_0159
     * @tc.desc      commodityText(id=10, title="  _1") returns "10    _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0159 begin`);
      const actual: string = commodityText(10, '  _1');
      logInfo(`commodityText(id=10, title="  _1"): actual=${actual}`);
      expect(actual).assertEqual('10    _1');
      logInfo(`${BUNDLE}CommodityText_0159 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0160
     * @tc.name      PageLoading_CommodityText_0160
     * @tc.desc      commodityText(id=10, title="x  ") returns "10  x  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0160 begin`);
      const actual: string = commodityText(10, 'x  ');
      logInfo(`commodityText(id=10, title="x  "): actual=${actual}`);
      expect(actual).assertEqual('10  x  ');
      logInfo(`${BUNDLE}CommodityText_0160 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0161
     * @tc.name      PageLoading_CommodityText_0161
     * @tc.desc      commodityText(id=10, title="   ") returns "10     "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0161 begin`);
      const actual: string = commodityText(10, '   ');
      logInfo(`commodityText(id=10, title="   "): actual=${actual}`);
      expect(actual).assertEqual('10     ');
      logInfo(`${BUNDLE}CommodityText_0161 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0162
     * @tc.name      PageLoading_CommodityText_0162
     * @tc.desc      commodityText(id=10, title=" _1") returns "10   _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0162 begin`);
      const actual: string = commodityText(10, ' _1');
      logInfo(`commodityText(id=10, title=" _1"): actual=${actual}`);
      expect(actual).assertEqual('10   _1');
      logInfo(`${BUNDLE}CommodityText_0162 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0163
     * @tc.name      PageLoading_CommodityText_0163
     * @tc.desc      commodityText(id=10, title="x ") returns "10  x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0163 begin`);
      const actual: string = commodityText(10, 'x ');
      logInfo(`commodityText(id=10, title="x "): actual=${actual}`);
      expect(actual).assertEqual('10  x ');
      logInfo(`${BUNDLE}CommodityText_0163 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0164
     * @tc.name      PageLoading_CommodityText_0164
     * @tc.desc      commodityText(id=10, title="   x ") returns "10     x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0164 begin`);
      const actual: string = commodityText(10, '   x ');
      logInfo(`commodityText(id=10, title="   x "): actual=${actual}`);
      expect(actual).assertEqual('10     x ');
      logInfo(`${BUNDLE}CommodityText_0164 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0165
     * @tc.name      PageLoading_CommodityText_0165
     * @tc.desc      commodityText(id=10, title="  x  x") returns "10    x  x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0165 begin`);
      const actual: string = commodityText(10, '  x  x');
      logInfo(`commodityText(id=10, title="  x  x"): actual=${actual}`);
      expect(actual).assertEqual('10    x  x');
      logInfo(`${BUNDLE}CommodityText_0165 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0166
     * @tc.name      PageLoading_CommodityText_0166
     * @tc.desc      commodityText(id=10, title="  x_1") returns "10    x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0166 begin`);
      const actual: string = commodityText(10, '  x_1');
      logInfo(`commodityText(id=10, title="  x_1"): actual=${actual}`);
      expect(actual).assertEqual('10    x_1');
      logInfo(`${BUNDLE}CommodityText_0166 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0167
     * @tc.name      PageLoading_CommodityText_0167
     * @tc.desc      commodityText(id=10, title="x  x") returns "10  x  x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0167 begin`);
      const actual: string = commodityText(10, 'x  x');
      logInfo(`commodityText(id=10, title="x  x"): actual=${actual}`);
      expect(actual).assertEqual('10  x  x');
      logInfo(`${BUNDLE}CommodityText_0167 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0168
     * @tc.name      PageLoading_CommodityText_0168
     * @tc.desc      commodityText(id=10, title=" Hello ") returns "10   Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0168 begin`);
      const actual: string = commodityText(10, ' Hello ');
      logInfo(`commodityText(id=10, title=" Hello "): actual=${actual}`);
      expect(actual).assertEqual('10   Hello ');
      logInfo(`${BUNDLE}CommodityText_0168 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0169
     * @tc.name      PageLoading_CommodityText_0169
     * @tc.desc      commodityText(id=5, title="  ") returns "5    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PageLoading_CommodityText_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CommodityText_0169 begin`);
      const actual: string = commodityText(5, '  ');
      logInfo(`commodityText(id=5, title="  "): actual=${actual}`);
      expect(actual).assertEqual('5    ');
      logInfo(`${BUNDLE}CommodityText_0169 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0170
     * @tc.name      PageLoading_CommodityText_0170
     * @tc.desc      commodityText(id=5, title=" ") returns "5   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0170 begin`);
      const actual: string = commodityText(5, ' ');
      logInfo(`commodityText(id=5, title=" "): actual=${actual}`);
      expect(actual).assertEqual('5   ');
      logInfo(`${BUNDLE}CommodityText_0170 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0171
     * @tc.name      PageLoading_CommodityText_0171
     * @tc.desc      commodityText(id=5, title="  x") returns "5    x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0171 begin`);
      const actual: string = commodityText(5, '  x');
      logInfo(`commodityText(id=5, title="  x"): actual=${actual}`);
      expect(actual).assertEqual('5    x');
      logInfo(`${BUNDLE}CommodityText_0171 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0172
     * @tc.name      PageLoading_CommodityText_0172
     * @tc.desc      commodityText(id=5, title="Hello") returns "5  Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0172 begin`);
      const actual: string = commodityText(5, 'Hello');
      logInfo(`commodityText(id=5, title="Hello"): actual=${actual}`);
      expect(actual).assertEqual('5  Hello');
      logInfo(`${BUNDLE}CommodityText_0172 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0173
     * @tc.name      PageLoading_CommodityText_0173
     * @tc.desc      commodityText(id=5, title="hello world") returns "5  hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0173 begin`);
      const actual: string = commodityText(5, 'hello world');
      logInfo(`commodityText(id=5, title="hello world"): actual=${actual}`);
      expect(actual).assertEqual('5  hello world');
      logInfo(`${BUNDLE}CommodityText_0173 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0174
     * @tc.name      PageLoading_CommodityText_0174
     * @tc.desc      commodityText(id=5, title="") returns "5  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0174 begin`);
      const actual: string = commodityText(5, '');
      logInfo(`commodityText(id=5, title=""): actual=${actual}`);
      expect(actual).assertEqual('5  ');
      logInfo(`${BUNDLE}CommodityText_0174 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0175
     * @tc.name      PageLoading_CommodityText_0175
     * @tc.desc      commodityText(id=5, title="A") returns "5  A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0175 begin`);
      const actual: string = commodityText(5, 'A');
      logInfo(`commodityText(id=5, title="A"): actual=${actual}`);
      expect(actual).assertEqual('5  A');
      logInfo(`${BUNDLE}CommodityText_0175 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0176
     * @tc.name      PageLoading_CommodityText_0176
     * @tc.desc      commodityText(id=5, title="Sample Title 123") returns "5  Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0176 begin`);
      const actual: string = commodityText(5, 'Sample Title 123');
      logInfo(`commodityText(id=5, title="Sample Title 1...: actual=${actual}`);
      expect(actual).assertEqual('5  Sample Title 123');
      logInfo(`${BUNDLE}CommodityText_0176 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0177
     * @tc.name      PageLoading_CommodityText_0177
     * @tc.desc      commodityText(id=5, title="??") returns "5  ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0177 begin`);
      const actual: string = commodityText(5, '\u4e2d\u6587');
      logInfo(`commodityText(id=5, title="??"): actual=${actual}`);
      expect(actual).assertEqual('5  \u4e2d\u6587');
      logInfo(`${BUNDLE}CommodityText_0177 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0178
     * @tc.name      PageLoading_CommodityText_0178
     * @tc.desc      commodityText(id=5, title="a") returns "5  a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0178 begin`);
      const actual: string = commodityText(5, 'a');
      logInfo(`commodityText(id=5, title="a"): actual=${actual}`);
      expect(actual).assertEqual('5  a');
      logInfo(`${BUNDLE}CommodityText_0178 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0179
     * @tc.name      PageLoading_CommodityText_0179
     * @tc.desc      commodityText(id=5, title="abc") returns "5  abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0179 begin`);
      const actual: string = commodityText(5, 'abc');
      logInfo(`commodityText(id=5, title="abc"): actual=${actual}`);
      expect(actual).assertEqual('5  abc');
      logInfo(`${BUNDLE}CommodityText_0179 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0180
     * @tc.name      PageLoading_CommodityText_0180
     * @tc.desc      commodityText(id=5, title="Hello World") returns "5  Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0180 begin`);
      const actual: string = commodityText(5, 'Hello World');
      logInfo(`commodityText(id=5, title="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('5  Hello World');
      logInfo(`${BUNDLE}CommodityText_0180 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0181
     * @tc.name      PageLoading_CommodityText_0181
     * @tc.desc      commodityText(id=5, title="123") returns "5  123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0181 begin`);
      const actual: string = commodityText(5, '123');
      logInfo(`commodityText(id=5, title="123"): actual=${actual}`);
      expect(actual).assertEqual('5  123');
      logInfo(`${BUNDLE}CommodityText_0181 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0182
     * @tc.name      PageLoading_CommodityText_0182
     * @tc.desc      commodityText(id=5, title="    ") returns "5      "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0182 begin`);
      const actual: string = commodityText(5, '    ');
      logInfo(`commodityText(id=5, title="    "): actual=${actual}`);
      expect(actual).assertEqual('5      ');
      logInfo(`${BUNDLE}CommodityText_0182 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0183
     * @tc.name      PageLoading_CommodityText_0183
     * @tc.desc      commodityText(id=5, title="  _1") returns "5    _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0183 begin`);
      const actual: string = commodityText(5, '  _1');
      logInfo(`commodityText(id=5, title="  _1"): actual=${actual}`);
      expect(actual).assertEqual('5    _1');
      logInfo(`${BUNDLE}CommodityText_0183 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0184
     * @tc.name      PageLoading_CommodityText_0184
     * @tc.desc      commodityText(id=5, title="x  ") returns "5  x  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0184 begin`);
      const actual: string = commodityText(5, 'x  ');
      logInfo(`commodityText(id=5, title="x  "): actual=${actual}`);
      expect(actual).assertEqual('5  x  ');
      logInfo(`${BUNDLE}CommodityText_0184 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0185
     * @tc.name      PageLoading_CommodityText_0185
     * @tc.desc      commodityText(id=5, title="   ") returns "5     "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0185 begin`);
      const actual: string = commodityText(5, '   ');
      logInfo(`commodityText(id=5, title="   "): actual=${actual}`);
      expect(actual).assertEqual('5     ');
      logInfo(`${BUNDLE}CommodityText_0185 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0186
     * @tc.name      PageLoading_CommodityText_0186
     * @tc.desc      commodityText(id=5, title=" _1") returns "5   _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0186 begin`);
      const actual: string = commodityText(5, ' _1');
      logInfo(`commodityText(id=5, title=" _1"): actual=${actual}`);
      expect(actual).assertEqual('5   _1');
      logInfo(`${BUNDLE}CommodityText_0186 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0187
     * @tc.name      PageLoading_CommodityText_0187
     * @tc.desc      commodityText(id=5, title="x ") returns "5  x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0187 begin`);
      const actual: string = commodityText(5, 'x ');
      logInfo(`commodityText(id=5, title="x "): actual=${actual}`);
      expect(actual).assertEqual('5  x ');
      logInfo(`${BUNDLE}CommodityText_0187 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0188
     * @tc.name      PageLoading_CommodityText_0188
     * @tc.desc      commodityText(id=5, title="   x ") returns "5     x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0188 begin`);
      const actual: string = commodityText(5, '   x ');
      logInfo(`commodityText(id=5, title="   x "): actual=${actual}`);
      expect(actual).assertEqual('5     x ');
      logInfo(`${BUNDLE}CommodityText_0188 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0189
     * @tc.name      PageLoading_CommodityText_0189
     * @tc.desc      commodityText(id=5, title="  x  x") returns "5    x  x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0189 begin`);
      const actual: string = commodityText(5, '  x  x');
      logInfo(`commodityText(id=5, title="  x  x"): actual=${actual}`);
      expect(actual).assertEqual('5    x  x');
      logInfo(`${BUNDLE}CommodityText_0189 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0190
     * @tc.name      PageLoading_CommodityText_0190
     * @tc.desc      commodityText(id=5, title="  x_1") returns "5    x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0190 begin`);
      const actual: string = commodityText(5, '  x_1');
      logInfo(`commodityText(id=5, title="  x_1"): actual=${actual}`);
      expect(actual).assertEqual('5    x_1');
      logInfo(`${BUNDLE}CommodityText_0190 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0191
     * @tc.name      PageLoading_CommodityText_0191
     * @tc.desc      commodityText(id=5, title="x  x") returns "5  x  x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0191 begin`);
      const actual: string = commodityText(5, 'x  x');
      logInfo(`commodityText(id=5, title="x  x"): actual=${actual}`);
      expect(actual).assertEqual('5  x  x');
      logInfo(`${BUNDLE}CommodityText_0191 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0192
     * @tc.name      PageLoading_CommodityText_0192
     * @tc.desc      commodityText(id=5, title=" Hello ") returns "5   Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0192 begin`);
      const actual: string = commodityText(5, ' Hello ');
      logInfo(`commodityText(id=5, title=" Hello "): actual=${actual}`);
      expect(actual).assertEqual('5   Hello ');
      logInfo(`${BUNDLE}CommodityText_0192 end`);
    });
  });
}
