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
export default function commodityText3Test(): void {
  describe('CommodityText3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0193
     * @tc.name      PageLoading_CommodityText_0193
     * @tc.desc      commodityText(id=15, title="  ") returns "15    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PageLoading_CommodityText_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CommodityText_0193 begin`);
      const actual: string = commodityText(15, '  ');
      logInfo(`commodityText(id=15, title="  "): actual=${actual}`);
      expect(actual).assertEqual('15    ');
      logInfo(`${BUNDLE}CommodityText_0193 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0194
     * @tc.name      PageLoading_CommodityText_0194
     * @tc.desc      commodityText(id=15, title=" ") returns "15   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0194 begin`);
      const actual: string = commodityText(15, ' ');
      logInfo(`commodityText(id=15, title=" "): actual=${actual}`);
      expect(actual).assertEqual('15   ');
      logInfo(`${BUNDLE}CommodityText_0194 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0195
     * @tc.name      PageLoading_CommodityText_0195
     * @tc.desc      commodityText(id=15, title="  x") returns "15    x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0195 begin`);
      const actual: string = commodityText(15, '  x');
      logInfo(`commodityText(id=15, title="  x"): actual=${actual}`);
      expect(actual).assertEqual('15    x');
      logInfo(`${BUNDLE}CommodityText_0195 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0196
     * @tc.name      PageLoading_CommodityText_0196
     * @tc.desc      commodityText(id=15, title="Hello") returns "15  Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0196 begin`);
      const actual: string = commodityText(15, 'Hello');
      logInfo(`commodityText(id=15, title="Hello"): actual=${actual}`);
      expect(actual).assertEqual('15  Hello');
      logInfo(`${BUNDLE}CommodityText_0196 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0197
     * @tc.name      PageLoading_CommodityText_0197
     * @tc.desc      commodityText(id=15, title="hello world") returns "15  hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0197 begin`);
      const actual: string = commodityText(15, 'hello world');
      logInfo(`commodityText(id=15, title="hello world"): actual=${actual}`);
      expect(actual).assertEqual('15  hello world');
      logInfo(`${BUNDLE}CommodityText_0197 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0198
     * @tc.name      PageLoading_CommodityText_0198
     * @tc.desc      commodityText(id=15, title="") returns "15  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0198 begin`);
      const actual: string = commodityText(15, '');
      logInfo(`commodityText(id=15, title=""): actual=${actual}`);
      expect(actual).assertEqual('15  ');
      logInfo(`${BUNDLE}CommodityText_0198 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0199
     * @tc.name      PageLoading_CommodityText_0199
     * @tc.desc      commodityText(id=15, title="A") returns "15  A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0199 begin`);
      const actual: string = commodityText(15, 'A');
      logInfo(`commodityText(id=15, title="A"): actual=${actual}`);
      expect(actual).assertEqual('15  A');
      logInfo(`${BUNDLE}CommodityText_0199 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0200
     * @tc.name      PageLoading_CommodityText_0200
     * @tc.desc      commodityText(id=15, title="Sample Title 123") returns "15  Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0200 begin`);
      const actual: string = commodityText(15, 'Sample Title 123');
      logInfo(`commodityText(id=15, title="Sample Title ...: actual=${actual}`);
      expect(actual).assertEqual('15  Sample Title 123');
      logInfo(`${BUNDLE}CommodityText_0200 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0201
     * @tc.name      PageLoading_CommodityText_0201
     * @tc.desc      commodityText(id=15, title="??") returns "15  ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0201 begin`);
      const actual: string = commodityText(15, '\u4e2d\u6587');
      logInfo(`commodityText(id=15, title="??"): actual=${actual}`);
      expect(actual).assertEqual('15  \u4e2d\u6587');
      logInfo(`${BUNDLE}CommodityText_0201 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0202
     * @tc.name      PageLoading_CommodityText_0202
     * @tc.desc      commodityText(id=15, title="a") returns "15  a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0202 begin`);
      const actual: string = commodityText(15, 'a');
      logInfo(`commodityText(id=15, title="a"): actual=${actual}`);
      expect(actual).assertEqual('15  a');
      logInfo(`${BUNDLE}CommodityText_0202 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0203
     * @tc.name      PageLoading_CommodityText_0203
     * @tc.desc      commodityText(id=15, title="abc") returns "15  abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0203 begin`);
      const actual: string = commodityText(15, 'abc');
      logInfo(`commodityText(id=15, title="abc"): actual=${actual}`);
      expect(actual).assertEqual('15  abc');
      logInfo(`${BUNDLE}CommodityText_0203 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0204
     * @tc.name      PageLoading_CommodityText_0204
     * @tc.desc      commodityText(id=15, title="Hello World") returns "15  Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0204 begin`);
      const actual: string = commodityText(15, 'Hello World');
      logInfo(`commodityText(id=15, title="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('15  Hello World');
      logInfo(`${BUNDLE}CommodityText_0204 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0205
     * @tc.name      PageLoading_CommodityText_0205
     * @tc.desc      commodityText(id=15, title="123") returns "15  123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0205 begin`);
      const actual: string = commodityText(15, '123');
      logInfo(`commodityText(id=15, title="123"): actual=${actual}`);
      expect(actual).assertEqual('15  123');
      logInfo(`${BUNDLE}CommodityText_0205 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0206
     * @tc.name      PageLoading_CommodityText_0206
     * @tc.desc      commodityText(id=15, title="    ") returns "15      "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0206 begin`);
      const actual: string = commodityText(15, '    ');
      logInfo(`commodityText(id=15, title="    "): actual=${actual}`);
      expect(actual).assertEqual('15      ');
      logInfo(`${BUNDLE}CommodityText_0206 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0207
     * @tc.name      PageLoading_CommodityText_0207
     * @tc.desc      commodityText(id=15, title="  _1") returns "15    _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0207 begin`);
      const actual: string = commodityText(15, '  _1');
      logInfo(`commodityText(id=15, title="  _1"): actual=${actual}`);
      expect(actual).assertEqual('15    _1');
      logInfo(`${BUNDLE}CommodityText_0207 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0208
     * @tc.name      PageLoading_CommodityText_0208
     * @tc.desc      commodityText(id=15, title="x  ") returns "15  x  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0208 begin`);
      const actual: string = commodityText(15, 'x  ');
      logInfo(`commodityText(id=15, title="x  "): actual=${actual}`);
      expect(actual).assertEqual('15  x  ');
      logInfo(`${BUNDLE}CommodityText_0208 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0209
     * @tc.name      PageLoading_CommodityText_0209
     * @tc.desc      commodityText(id=15, title="   ") returns "15     "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0209 begin`);
      const actual: string = commodityText(15, '   ');
      logInfo(`commodityText(id=15, title="   "): actual=${actual}`);
      expect(actual).assertEqual('15     ');
      logInfo(`${BUNDLE}CommodityText_0209 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0210
     * @tc.name      PageLoading_CommodityText_0210
     * @tc.desc      commodityText(id=15, title=" _1") returns "15   _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0210 begin`);
      const actual: string = commodityText(15, ' _1');
      logInfo(`commodityText(id=15, title=" _1"): actual=${actual}`);
      expect(actual).assertEqual('15   _1');
      logInfo(`${BUNDLE}CommodityText_0210 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0211
     * @tc.name      PageLoading_CommodityText_0211
     * @tc.desc      commodityText(id=15, title="x ") returns "15  x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0211 begin`);
      const actual: string = commodityText(15, 'x ');
      logInfo(`commodityText(id=15, title="x "): actual=${actual}`);
      expect(actual).assertEqual('15  x ');
      logInfo(`${BUNDLE}CommodityText_0211 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0212
     * @tc.name      PageLoading_CommodityText_0212
     * @tc.desc      commodityText(id=15, title="   x ") returns "15     x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0212 begin`);
      const actual: string = commodityText(15, '   x ');
      logInfo(`commodityText(id=15, title="   x "): actual=${actual}`);
      expect(actual).assertEqual('15     x ');
      logInfo(`${BUNDLE}CommodityText_0212 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0213
     * @tc.name      PageLoading_CommodityText_0213
     * @tc.desc      commodityText(id=15, title="  x  x") returns "15    x  x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0213 begin`);
      const actual: string = commodityText(15, '  x  x');
      logInfo(`commodityText(id=15, title="  x  x"): actual=${actual}`);
      expect(actual).assertEqual('15    x  x');
      logInfo(`${BUNDLE}CommodityText_0213 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0214
     * @tc.name      PageLoading_CommodityText_0214
     * @tc.desc      commodityText(id=15, title="  x_1") returns "15    x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0214 begin`);
      const actual: string = commodityText(15, '  x_1');
      logInfo(`commodityText(id=15, title="  x_1"): actual=${actual}`);
      expect(actual).assertEqual('15    x_1');
      logInfo(`${BUNDLE}CommodityText_0214 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0215
     * @tc.name      PageLoading_CommodityText_0215
     * @tc.desc      commodityText(id=15, title="x  x") returns "15  x  x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0215 begin`);
      const actual: string = commodityText(15, 'x  x');
      logInfo(`commodityText(id=15, title="x  x"): actual=${actual}`);
      expect(actual).assertEqual('15  x  x');
      logInfo(`${BUNDLE}CommodityText_0215 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0216
     * @tc.name      PageLoading_CommodityText_0216
     * @tc.desc      commodityText(id=15, title=" Hello ") returns "15   Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0216 begin`);
      const actual: string = commodityText(15, ' Hello ');
      logInfo(`commodityText(id=15, title=" Hello "): actual=${actual}`);
      expect(actual).assertEqual('15   Hello ');
      logInfo(`${BUNDLE}CommodityText_0216 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0217
     * @tc.name      PageLoading_CommodityText_0217
     * @tc.desc      commodityText(id=20, title="  ") returns "20    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PageLoading_CommodityText_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CommodityText_0217 begin`);
      const actual: string = commodityText(20, '  ');
      logInfo(`commodityText(id=20, title="  "): actual=${actual}`);
      expect(actual).assertEqual('20    ');
      logInfo(`${BUNDLE}CommodityText_0217 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0218
     * @tc.name      PageLoading_CommodityText_0218
     * @tc.desc      commodityText(id=20, title=" ") returns "20   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0218 begin`);
      const actual: string = commodityText(20, ' ');
      logInfo(`commodityText(id=20, title=" "): actual=${actual}`);
      expect(actual).assertEqual('20   ');
      logInfo(`${BUNDLE}CommodityText_0218 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0219
     * @tc.name      PageLoading_CommodityText_0219
     * @tc.desc      commodityText(id=20, title="  x") returns "20    x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0219 begin`);
      const actual: string = commodityText(20, '  x');
      logInfo(`commodityText(id=20, title="  x"): actual=${actual}`);
      expect(actual).assertEqual('20    x');
      logInfo(`${BUNDLE}CommodityText_0219 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0220
     * @tc.name      PageLoading_CommodityText_0220
     * @tc.desc      commodityText(id=20, title="Hello") returns "20  Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0220 begin`);
      const actual: string = commodityText(20, 'Hello');
      logInfo(`commodityText(id=20, title="Hello"): actual=${actual}`);
      expect(actual).assertEqual('20  Hello');
      logInfo(`${BUNDLE}CommodityText_0220 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0221
     * @tc.name      PageLoading_CommodityText_0221
     * @tc.desc      commodityText(id=20, title="hello world") returns "20  hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0221 begin`);
      const actual: string = commodityText(20, 'hello world');
      logInfo(`commodityText(id=20, title="hello world"): actual=${actual}`);
      expect(actual).assertEqual('20  hello world');
      logInfo(`${BUNDLE}CommodityText_0221 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0222
     * @tc.name      PageLoading_CommodityText_0222
     * @tc.desc      commodityText(id=20, title="") returns "20  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0222 begin`);
      const actual: string = commodityText(20, '');
      logInfo(`commodityText(id=20, title=""): actual=${actual}`);
      expect(actual).assertEqual('20  ');
      logInfo(`${BUNDLE}CommodityText_0222 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0223
     * @tc.name      PageLoading_CommodityText_0223
     * @tc.desc      commodityText(id=20, title="A") returns "20  A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0223 begin`);
      const actual: string = commodityText(20, 'A');
      logInfo(`commodityText(id=20, title="A"): actual=${actual}`);
      expect(actual).assertEqual('20  A');
      logInfo(`${BUNDLE}CommodityText_0223 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0224
     * @tc.name      PageLoading_CommodityText_0224
     * @tc.desc      commodityText(id=20, title="Sample Title 123") returns "20  Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0224 begin`);
      const actual: string = commodityText(20, 'Sample Title 123');
      logInfo(`commodityText(id=20, title="Sample Title ...: actual=${actual}`);
      expect(actual).assertEqual('20  Sample Title 123');
      logInfo(`${BUNDLE}CommodityText_0224 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0225
     * @tc.name      PageLoading_CommodityText_0225
     * @tc.desc      commodityText(id=20, title="??") returns "20  ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0225 begin`);
      const actual: string = commodityText(20, '\u4e2d\u6587');
      logInfo(`commodityText(id=20, title="??"): actual=${actual}`);
      expect(actual).assertEqual('20  \u4e2d\u6587');
      logInfo(`${BUNDLE}CommodityText_0225 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0226
     * @tc.name      PageLoading_CommodityText_0226
     * @tc.desc      commodityText(id=20, title="a") returns "20  a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0226 begin`);
      const actual: string = commodityText(20, 'a');
      logInfo(`commodityText(id=20, title="a"): actual=${actual}`);
      expect(actual).assertEqual('20  a');
      logInfo(`${BUNDLE}CommodityText_0226 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0227
     * @tc.name      PageLoading_CommodityText_0227
     * @tc.desc      commodityText(id=20, title="abc") returns "20  abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0227 begin`);
      const actual: string = commodityText(20, 'abc');
      logInfo(`commodityText(id=20, title="abc"): actual=${actual}`);
      expect(actual).assertEqual('20  abc');
      logInfo(`${BUNDLE}CommodityText_0227 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0228
     * @tc.name      PageLoading_CommodityText_0228
     * @tc.desc      commodityText(id=20, title="Hello World") returns "20  Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0228 begin`);
      const actual: string = commodityText(20, 'Hello World');
      logInfo(`commodityText(id=20, title="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('20  Hello World');
      logInfo(`${BUNDLE}CommodityText_0228 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0229
     * @tc.name      PageLoading_CommodityText_0229
     * @tc.desc      commodityText(id=20, title="123") returns "20  123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0229 begin`);
      const actual: string = commodityText(20, '123');
      logInfo(`commodityText(id=20, title="123"): actual=${actual}`);
      expect(actual).assertEqual('20  123');
      logInfo(`${BUNDLE}CommodityText_0229 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0230
     * @tc.name      PageLoading_CommodityText_0230
     * @tc.desc      commodityText(id=20, title="    ") returns "20      "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0230 begin`);
      const actual: string = commodityText(20, '    ');
      logInfo(`commodityText(id=20, title="    "): actual=${actual}`);
      expect(actual).assertEqual('20      ');
      logInfo(`${BUNDLE}CommodityText_0230 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0231
     * @tc.name      PageLoading_CommodityText_0231
     * @tc.desc      commodityText(id=20, title="  _1") returns "20    _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0231 begin`);
      const actual: string = commodityText(20, '  _1');
      logInfo(`commodityText(id=20, title="  _1"): actual=${actual}`);
      expect(actual).assertEqual('20    _1');
      logInfo(`${BUNDLE}CommodityText_0231 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0232
     * @tc.name      PageLoading_CommodityText_0232
     * @tc.desc      commodityText(id=20, title="x  ") returns "20  x  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0232 begin`);
      const actual: string = commodityText(20, 'x  ');
      logInfo(`commodityText(id=20, title="x  "): actual=${actual}`);
      expect(actual).assertEqual('20  x  ');
      logInfo(`${BUNDLE}CommodityText_0232 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0233
     * @tc.name      PageLoading_CommodityText_0233
     * @tc.desc      commodityText(id=20, title="   ") returns "20     "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0233 begin`);
      const actual: string = commodityText(20, '   ');
      logInfo(`commodityText(id=20, title="   "): actual=${actual}`);
      expect(actual).assertEqual('20     ');
      logInfo(`${BUNDLE}CommodityText_0233 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0234
     * @tc.name      PageLoading_CommodityText_0234
     * @tc.desc      commodityText(id=20, title=" _1") returns "20   _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0234 begin`);
      const actual: string = commodityText(20, ' _1');
      logInfo(`commodityText(id=20, title=" _1"): actual=${actual}`);
      expect(actual).assertEqual('20   _1');
      logInfo(`${BUNDLE}CommodityText_0234 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0235
     * @tc.name      PageLoading_CommodityText_0235
     * @tc.desc      commodityText(id=20, title="x ") returns "20  x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0235 begin`);
      const actual: string = commodityText(20, 'x ');
      logInfo(`commodityText(id=20, title="x "): actual=${actual}`);
      expect(actual).assertEqual('20  x ');
      logInfo(`${BUNDLE}CommodityText_0235 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0236
     * @tc.name      PageLoading_CommodityText_0236
     * @tc.desc      commodityText(id=20, title="   x ") returns "20     x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0236 begin`);
      const actual: string = commodityText(20, '   x ');
      logInfo(`commodityText(id=20, title="   x "): actual=${actual}`);
      expect(actual).assertEqual('20     x ');
      logInfo(`${BUNDLE}CommodityText_0236 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0237
     * @tc.name      PageLoading_CommodityText_0237
     * @tc.desc      commodityText(id=20, title="  x  x") returns "20    x  x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0237 begin`);
      const actual: string = commodityText(20, '  x  x');
      logInfo(`commodityText(id=20, title="  x  x"): actual=${actual}`);
      expect(actual).assertEqual('20    x  x');
      logInfo(`${BUNDLE}CommodityText_0237 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0238
     * @tc.name      PageLoading_CommodityText_0238
     * @tc.desc      commodityText(id=20, title="  x_1") returns "20    x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0238 begin`);
      const actual: string = commodityText(20, '  x_1');
      logInfo(`commodityText(id=20, title="  x_1"): actual=${actual}`);
      expect(actual).assertEqual('20    x_1');
      logInfo(`${BUNDLE}CommodityText_0238 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0239
     * @tc.name      PageLoading_CommodityText_0239
     * @tc.desc      commodityText(id=20, title="x  x") returns "20  x  x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0239 begin`);
      const actual: string = commodityText(20, 'x  x');
      logInfo(`commodityText(id=20, title="x  x"): actual=${actual}`);
      expect(actual).assertEqual('20  x  x');
      logInfo(`${BUNDLE}CommodityText_0239 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0240
     * @tc.name      PageLoading_CommodityText_0240
     * @tc.desc      commodityText(id=20, title=" Hello ") returns "20   Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0240 begin`);
      const actual: string = commodityText(20, ' Hello ');
      logInfo(`commodityText(id=20, title=" Hello "): actual=${actual}`);
      expect(actual).assertEqual('20   Hello ');
      logInfo(`${BUNDLE}CommodityText_0240 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0241
     * @tc.name      PageLoading_CommodityText_0241
     * @tc.desc      commodityText(id=25, title="  ") returns "25    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PageLoading_CommodityText_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CommodityText_0241 begin`);
      const actual: string = commodityText(25, '  ');
      logInfo(`commodityText(id=25, title="  "): actual=${actual}`);
      expect(actual).assertEqual('25    ');
      logInfo(`${BUNDLE}CommodityText_0241 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0242
     * @tc.name      PageLoading_CommodityText_0242
     * @tc.desc      commodityText(id=25, title=" ") returns "25   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0242 begin`);
      const actual: string = commodityText(25, ' ');
      logInfo(`commodityText(id=25, title=" "): actual=${actual}`);
      expect(actual).assertEqual('25   ');
      logInfo(`${BUNDLE}CommodityText_0242 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0243
     * @tc.name      PageLoading_CommodityText_0243
     * @tc.desc      commodityText(id=25, title="  x") returns "25    x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0243 begin`);
      const actual: string = commodityText(25, '  x');
      logInfo(`commodityText(id=25, title="  x"): actual=${actual}`);
      expect(actual).assertEqual('25    x');
      logInfo(`${BUNDLE}CommodityText_0243 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0244
     * @tc.name      PageLoading_CommodityText_0244
     * @tc.desc      commodityText(id=25, title="Hello") returns "25  Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0244 begin`);
      const actual: string = commodityText(25, 'Hello');
      logInfo(`commodityText(id=25, title="Hello"): actual=${actual}`);
      expect(actual).assertEqual('25  Hello');
      logInfo(`${BUNDLE}CommodityText_0244 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0245
     * @tc.name      PageLoading_CommodityText_0245
     * @tc.desc      commodityText(id=25, title="hello world") returns "25  hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0245 begin`);
      const actual: string = commodityText(25, 'hello world');
      logInfo(`commodityText(id=25, title="hello world"): actual=${actual}`);
      expect(actual).assertEqual('25  hello world');
      logInfo(`${BUNDLE}CommodityText_0245 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0246
     * @tc.name      PageLoading_CommodityText_0246
     * @tc.desc      commodityText(id=25, title="") returns "25  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0246 begin`);
      const actual: string = commodityText(25, '');
      logInfo(`commodityText(id=25, title=""): actual=${actual}`);
      expect(actual).assertEqual('25  ');
      logInfo(`${BUNDLE}CommodityText_0246 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0247
     * @tc.name      PageLoading_CommodityText_0247
     * @tc.desc      commodityText(id=25, title="A") returns "25  A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0247 begin`);
      const actual: string = commodityText(25, 'A');
      logInfo(`commodityText(id=25, title="A"): actual=${actual}`);
      expect(actual).assertEqual('25  A');
      logInfo(`${BUNDLE}CommodityText_0247 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0248
     * @tc.name      PageLoading_CommodityText_0248
     * @tc.desc      commodityText(id=25, title="Sample Title 123") returns "25  Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0248 begin`);
      const actual: string = commodityText(25, 'Sample Title 123');
      logInfo(`commodityText(id=25, title="Sample Title ...: actual=${actual}`);
      expect(actual).assertEqual('25  Sample Title 123');
      logInfo(`${BUNDLE}CommodityText_0248 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0249
     * @tc.name      PageLoading_CommodityText_0249
     * @tc.desc      commodityText(id=25, title="??") returns "25  ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0249 begin`);
      const actual: string = commodityText(25, '\u4e2d\u6587');
      logInfo(`commodityText(id=25, title="??"): actual=${actual}`);
      expect(actual).assertEqual('25  \u4e2d\u6587');
      logInfo(`${BUNDLE}CommodityText_0249 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0250
     * @tc.name      PageLoading_CommodityText_0250
     * @tc.desc      commodityText(id=25, title="a") returns "25  a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0250 begin`);
      const actual: string = commodityText(25, 'a');
      logInfo(`commodityText(id=25, title="a"): actual=${actual}`);
      expect(actual).assertEqual('25  a');
      logInfo(`${BUNDLE}CommodityText_0250 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0251
     * @tc.name      PageLoading_CommodityText_0251
     * @tc.desc      commodityText(id=25, title="abc") returns "25  abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0251 begin`);
      const actual: string = commodityText(25, 'abc');
      logInfo(`commodityText(id=25, title="abc"): actual=${actual}`);
      expect(actual).assertEqual('25  abc');
      logInfo(`${BUNDLE}CommodityText_0251 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0252
     * @tc.name      PageLoading_CommodityText_0252
     * @tc.desc      commodityText(id=25, title="Hello World") returns "25  Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0252 begin`);
      const actual: string = commodityText(25, 'Hello World');
      logInfo(`commodityText(id=25, title="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('25  Hello World');
      logInfo(`${BUNDLE}CommodityText_0252 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0253
     * @tc.name      PageLoading_CommodityText_0253
     * @tc.desc      commodityText(id=25, title="123") returns "25  123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0253 begin`);
      const actual: string = commodityText(25, '123');
      logInfo(`commodityText(id=25, title="123"): actual=${actual}`);
      expect(actual).assertEqual('25  123');
      logInfo(`${BUNDLE}CommodityText_0253 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0254
     * @tc.name      PageLoading_CommodityText_0254
     * @tc.desc      commodityText(id=25, title="    ") returns "25      "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0254 begin`);
      const actual: string = commodityText(25, '    ');
      logInfo(`commodityText(id=25, title="    "): actual=${actual}`);
      expect(actual).assertEqual('25      ');
      logInfo(`${BUNDLE}CommodityText_0254 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0255
     * @tc.name      PageLoading_CommodityText_0255
     * @tc.desc      commodityText(id=25, title="  _1") returns "25    _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0255 begin`);
      const actual: string = commodityText(25, '  _1');
      logInfo(`commodityText(id=25, title="  _1"): actual=${actual}`);
      expect(actual).assertEqual('25    _1');
      logInfo(`${BUNDLE}CommodityText_0255 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0256
     * @tc.name      PageLoading_CommodityText_0256
     * @tc.desc      commodityText(id=25, title="x  ") returns "25  x  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0256 begin`);
      const actual: string = commodityText(25, 'x  ');
      logInfo(`commodityText(id=25, title="x  "): actual=${actual}`);
      expect(actual).assertEqual('25  x  ');
      logInfo(`${BUNDLE}CommodityText_0256 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0257
     * @tc.name      PageLoading_CommodityText_0257
     * @tc.desc      commodityText(id=25, title="   ") returns "25     "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0257 begin`);
      const actual: string = commodityText(25, '   ');
      logInfo(`commodityText(id=25, title="   "): actual=${actual}`);
      expect(actual).assertEqual('25     ');
      logInfo(`${BUNDLE}CommodityText_0257 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0258
     * @tc.name      PageLoading_CommodityText_0258
     * @tc.desc      commodityText(id=25, title=" _1") returns "25   _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0258 begin`);
      const actual: string = commodityText(25, ' _1');
      logInfo(`commodityText(id=25, title=" _1"): actual=${actual}`);
      expect(actual).assertEqual('25   _1');
      logInfo(`${BUNDLE}CommodityText_0258 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0259
     * @tc.name      PageLoading_CommodityText_0259
     * @tc.desc      commodityText(id=25, title="x ") returns "25  x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0259 begin`);
      const actual: string = commodityText(25, 'x ');
      logInfo(`commodityText(id=25, title="x "): actual=${actual}`);
      expect(actual).assertEqual('25  x ');
      logInfo(`${BUNDLE}CommodityText_0259 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0260
     * @tc.name      PageLoading_CommodityText_0260
     * @tc.desc      commodityText(id=25, title="   x ") returns "25     x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0260 begin`);
      const actual: string = commodityText(25, '   x ');
      logInfo(`commodityText(id=25, title="   x "): actual=${actual}`);
      expect(actual).assertEqual('25     x ');
      logInfo(`${BUNDLE}CommodityText_0260 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0261
     * @tc.name      PageLoading_CommodityText_0261
     * @tc.desc      commodityText(id=25, title="  x  x") returns "25    x  x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0261 begin`);
      const actual: string = commodityText(25, '  x  x');
      logInfo(`commodityText(id=25, title="  x  x"): actual=${actual}`);
      expect(actual).assertEqual('25    x  x');
      logInfo(`${BUNDLE}CommodityText_0261 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0262
     * @tc.name      PageLoading_CommodityText_0262
     * @tc.desc      commodityText(id=25, title="  x_1") returns "25    x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0262 begin`);
      const actual: string = commodityText(25, '  x_1');
      logInfo(`commodityText(id=25, title="  x_1"): actual=${actual}`);
      expect(actual).assertEqual('25    x_1');
      logInfo(`${BUNDLE}CommodityText_0262 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0263
     * @tc.name      PageLoading_CommodityText_0263
     * @tc.desc      commodityText(id=25, title="x  x") returns "25  x  x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0263 begin`);
      const actual: string = commodityText(25, 'x  x');
      logInfo(`commodityText(id=25, title="x  x"): actual=${actual}`);
      expect(actual).assertEqual('25  x  x');
      logInfo(`${BUNDLE}CommodityText_0263 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0264
     * @tc.name      PageLoading_CommodityText_0264
     * @tc.desc      commodityText(id=25, title=" Hello ") returns "25   Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0264 begin`);
      const actual: string = commodityText(25, ' Hello ');
      logInfo(`commodityText(id=25, title=" Hello "): actual=${actual}`);
      expect(actual).assertEqual('25   Hello ');
      logInfo(`${BUNDLE}CommodityText_0264 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0265
     * @tc.name      PageLoading_CommodityText_0265
     * @tc.desc      commodityText(id=30, title="  ") returns "30    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PageLoading_CommodityText_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CommodityText_0265 begin`);
      const actual: string = commodityText(30, '  ');
      logInfo(`commodityText(id=30, title="  "): actual=${actual}`);
      expect(actual).assertEqual('30    ');
      logInfo(`${BUNDLE}CommodityText_0265 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0266
     * @tc.name      PageLoading_CommodityText_0266
     * @tc.desc      commodityText(id=30, title=" ") returns "30   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0266 begin`);
      const actual: string = commodityText(30, ' ');
      logInfo(`commodityText(id=30, title=" "): actual=${actual}`);
      expect(actual).assertEqual('30   ');
      logInfo(`${BUNDLE}CommodityText_0266 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0267
     * @tc.name      PageLoading_CommodityText_0267
     * @tc.desc      commodityText(id=30, title="  x") returns "30    x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0267 begin`);
      const actual: string = commodityText(30, '  x');
      logInfo(`commodityText(id=30, title="  x"): actual=${actual}`);
      expect(actual).assertEqual('30    x');
      logInfo(`${BUNDLE}CommodityText_0267 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0268
     * @tc.name      PageLoading_CommodityText_0268
     * @tc.desc      commodityText(id=30, title="Hello") returns "30  Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0268 begin`);
      const actual: string = commodityText(30, 'Hello');
      logInfo(`commodityText(id=30, title="Hello"): actual=${actual}`);
      expect(actual).assertEqual('30  Hello');
      logInfo(`${BUNDLE}CommodityText_0268 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0269
     * @tc.name      PageLoading_CommodityText_0269
     * @tc.desc      commodityText(id=30, title="hello world") returns "30  hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0269 begin`);
      const actual: string = commodityText(30, 'hello world');
      logInfo(`commodityText(id=30, title="hello world"): actual=${actual}`);
      expect(actual).assertEqual('30  hello world');
      logInfo(`${BUNDLE}CommodityText_0269 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0270
     * @tc.name      PageLoading_CommodityText_0270
     * @tc.desc      commodityText(id=30, title="") returns "30  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0270 begin`);
      const actual: string = commodityText(30, '');
      logInfo(`commodityText(id=30, title=""): actual=${actual}`);
      expect(actual).assertEqual('30  ');
      logInfo(`${BUNDLE}CommodityText_0270 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0271
     * @tc.name      PageLoading_CommodityText_0271
     * @tc.desc      commodityText(id=30, title="A") returns "30  A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0271 begin`);
      const actual: string = commodityText(30, 'A');
      logInfo(`commodityText(id=30, title="A"): actual=${actual}`);
      expect(actual).assertEqual('30  A');
      logInfo(`${BUNDLE}CommodityText_0271 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0272
     * @tc.name      PageLoading_CommodityText_0272
     * @tc.desc      commodityText(id=30, title="Sample Title 123") returns "30  Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0272 begin`);
      const actual: string = commodityText(30, 'Sample Title 123');
      logInfo(`commodityText(id=30, title="Sample Title ...: actual=${actual}`);
      expect(actual).assertEqual('30  Sample Title 123');
      logInfo(`${BUNDLE}CommodityText_0272 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0273
     * @tc.name      PageLoading_CommodityText_0273
     * @tc.desc      commodityText(id=30, title="??") returns "30  ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0273 begin`);
      const actual: string = commodityText(30, '\u4e2d\u6587');
      logInfo(`commodityText(id=30, title="??"): actual=${actual}`);
      expect(actual).assertEqual('30  \u4e2d\u6587');
      logInfo(`${BUNDLE}CommodityText_0273 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0274
     * @tc.name      PageLoading_CommodityText_0274
     * @tc.desc      commodityText(id=30, title="a") returns "30  a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0274 begin`);
      const actual: string = commodityText(30, 'a');
      logInfo(`commodityText(id=30, title="a"): actual=${actual}`);
      expect(actual).assertEqual('30  a');
      logInfo(`${BUNDLE}CommodityText_0274 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0275
     * @tc.name      PageLoading_CommodityText_0275
     * @tc.desc      commodityText(id=30, title="abc") returns "30  abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0275 begin`);
      const actual: string = commodityText(30, 'abc');
      logInfo(`commodityText(id=30, title="abc"): actual=${actual}`);
      expect(actual).assertEqual('30  abc');
      logInfo(`${BUNDLE}CommodityText_0275 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0276
     * @tc.name      PageLoading_CommodityText_0276
     * @tc.desc      commodityText(id=30, title="Hello World") returns "30  Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0276 begin`);
      const actual: string = commodityText(30, 'Hello World');
      logInfo(`commodityText(id=30, title="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('30  Hello World');
      logInfo(`${BUNDLE}CommodityText_0276 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0277
     * @tc.name      PageLoading_CommodityText_0277
     * @tc.desc      commodityText(id=30, title="123") returns "30  123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0277 begin`);
      const actual: string = commodityText(30, '123');
      logInfo(`commodityText(id=30, title="123"): actual=${actual}`);
      expect(actual).assertEqual('30  123');
      logInfo(`${BUNDLE}CommodityText_0277 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0278
     * @tc.name      PageLoading_CommodityText_0278
     * @tc.desc      commodityText(id=30, title="    ") returns "30      "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0278 begin`);
      const actual: string = commodityText(30, '    ');
      logInfo(`commodityText(id=30, title="    "): actual=${actual}`);
      expect(actual).assertEqual('30      ');
      logInfo(`${BUNDLE}CommodityText_0278 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0279
     * @tc.name      PageLoading_CommodityText_0279
     * @tc.desc      commodityText(id=30, title="  _1") returns "30    _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0279 begin`);
      const actual: string = commodityText(30, '  _1');
      logInfo(`commodityText(id=30, title="  _1"): actual=${actual}`);
      expect(actual).assertEqual('30    _1');
      logInfo(`${BUNDLE}CommodityText_0279 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0280
     * @tc.name      PageLoading_CommodityText_0280
     * @tc.desc      commodityText(id=30, title="x  ") returns "30  x  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0280 begin`);
      const actual: string = commodityText(30, 'x  ');
      logInfo(`commodityText(id=30, title="x  "): actual=${actual}`);
      expect(actual).assertEqual('30  x  ');
      logInfo(`${BUNDLE}CommodityText_0280 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0281
     * @tc.name      PageLoading_CommodityText_0281
     * @tc.desc      commodityText(id=30, title="   ") returns "30     "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0281 begin`);
      const actual: string = commodityText(30, '   ');
      logInfo(`commodityText(id=30, title="   "): actual=${actual}`);
      expect(actual).assertEqual('30     ');
      logInfo(`${BUNDLE}CommodityText_0281 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0282
     * @tc.name      PageLoading_CommodityText_0282
     * @tc.desc      commodityText(id=30, title=" _1") returns "30   _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0282 begin`);
      const actual: string = commodityText(30, ' _1');
      logInfo(`commodityText(id=30, title=" _1"): actual=${actual}`);
      expect(actual).assertEqual('30   _1');
      logInfo(`${BUNDLE}CommodityText_0282 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0283
     * @tc.name      PageLoading_CommodityText_0283
     * @tc.desc      commodityText(id=30, title="x ") returns "30  x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0283 begin`);
      const actual: string = commodityText(30, 'x ');
      logInfo(`commodityText(id=30, title="x "): actual=${actual}`);
      expect(actual).assertEqual('30  x ');
      logInfo(`${BUNDLE}CommodityText_0283 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0284
     * @tc.name      PageLoading_CommodityText_0284
     * @tc.desc      commodityText(id=30, title="   x ") returns "30     x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0284 begin`);
      const actual: string = commodityText(30, '   x ');
      logInfo(`commodityText(id=30, title="   x "): actual=${actual}`);
      expect(actual).assertEqual('30     x ');
      logInfo(`${BUNDLE}CommodityText_0284 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0285
     * @tc.name      PageLoading_CommodityText_0285
     * @tc.desc      commodityText(id=30, title="  x  x") returns "30    x  x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0285 begin`);
      const actual: string = commodityText(30, '  x  x');
      logInfo(`commodityText(id=30, title="  x  x"): actual=${actual}`);
      expect(actual).assertEqual('30    x  x');
      logInfo(`${BUNDLE}CommodityText_0285 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0286
     * @tc.name      PageLoading_CommodityText_0286
     * @tc.desc      commodityText(id=30, title="  x_1") returns "30    x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0286 begin`);
      const actual: string = commodityText(30, '  x_1');
      logInfo(`commodityText(id=30, title="  x_1"): actual=${actual}`);
      expect(actual).assertEqual('30    x_1');
      logInfo(`${BUNDLE}CommodityText_0286 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0287
     * @tc.name      PageLoading_CommodityText_0287
     * @tc.desc      commodityText(id=30, title="x  x") returns "30  x  x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0287 begin`);
      const actual: string = commodityText(30, 'x  x');
      logInfo(`commodityText(id=30, title="x  x"): actual=${actual}`);
      expect(actual).assertEqual('30  x  x');
      logInfo(`${BUNDLE}CommodityText_0287 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0288
     * @tc.name      PageLoading_CommodityText_0288
     * @tc.desc      commodityText(id=30, title=" Hello ") returns "30   Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0288 begin`);
      const actual: string = commodityText(30, ' Hello ');
      logInfo(`commodityText(id=30, title=" Hello "): actual=${actual}`);
      expect(actual).assertEqual('30   Hello ');
      logInfo(`${BUNDLE}CommodityText_0288 end`);
    });
  });
}
