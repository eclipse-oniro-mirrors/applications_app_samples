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

/** Logic checks for commodityText (58 cases). */
export default function commodityText4Test(): void {
  describe('CommodityText4Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0289
     * @tc.name      PageLoading_CommodityText_0289
     * @tc.desc      commodityText(id=35, title="  ") returns "35    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PageLoading_CommodityText_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CommodityText_0289 begin`);
      const actual: string = commodityText(35, '  ');
      logInfo(`commodityText(id=35, title="  "): actual=${actual}`);
      expect(actual).assertEqual('35    ');
      logInfo(`${BUNDLE}CommodityText_0289 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0290
     * @tc.name      PageLoading_CommodityText_0290
     * @tc.desc      commodityText(id=35, title=" ") returns "35   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0290 begin`);
      const actual: string = commodityText(35, ' ');
      logInfo(`commodityText(id=35, title=" "): actual=${actual}`);
      expect(actual).assertEqual('35   ');
      logInfo(`${BUNDLE}CommodityText_0290 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0291
     * @tc.name      PageLoading_CommodityText_0291
     * @tc.desc      commodityText(id=35, title="  x") returns "35    x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0291 begin`);
      const actual: string = commodityText(35, '  x');
      logInfo(`commodityText(id=35, title="  x"): actual=${actual}`);
      expect(actual).assertEqual('35    x');
      logInfo(`${BUNDLE}CommodityText_0291 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0292
     * @tc.name      PageLoading_CommodityText_0292
     * @tc.desc      commodityText(id=35, title="Hello") returns "35  Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0292 begin`);
      const actual: string = commodityText(35, 'Hello');
      logInfo(`commodityText(id=35, title="Hello"): actual=${actual}`);
      expect(actual).assertEqual('35  Hello');
      logInfo(`${BUNDLE}CommodityText_0292 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0293
     * @tc.name      PageLoading_CommodityText_0293
     * @tc.desc      commodityText(id=35, title="hello world") returns "35  hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0293 begin`);
      const actual: string = commodityText(35, 'hello world');
      logInfo(`commodityText(id=35, title="hello world"): actual=${actual}`);
      expect(actual).assertEqual('35  hello world');
      logInfo(`${BUNDLE}CommodityText_0293 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0294
     * @tc.name      PageLoading_CommodityText_0294
     * @tc.desc      commodityText(id=35, title="") returns "35  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0294 begin`);
      const actual: string = commodityText(35, '');
      logInfo(`commodityText(id=35, title=""): actual=${actual}`);
      expect(actual).assertEqual('35  ');
      logInfo(`${BUNDLE}CommodityText_0294 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0295
     * @tc.name      PageLoading_CommodityText_0295
     * @tc.desc      commodityText(id=35, title="A") returns "35  A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0295 begin`);
      const actual: string = commodityText(35, 'A');
      logInfo(`commodityText(id=35, title="A"): actual=${actual}`);
      expect(actual).assertEqual('35  A');
      logInfo(`${BUNDLE}CommodityText_0295 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0296
     * @tc.name      PageLoading_CommodityText_0296
     * @tc.desc      commodityText(id=35, title="Sample Title 123") returns "35  Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0296 begin`);
      const actual: string = commodityText(35, 'Sample Title 123');
      logInfo(`commodityText(id=35, title="Sample Title ...: actual=${actual}`);
      expect(actual).assertEqual('35  Sample Title 123');
      logInfo(`${BUNDLE}CommodityText_0296 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0297
     * @tc.name      PageLoading_CommodityText_0297
     * @tc.desc      commodityText(id=35, title="??") returns "35  ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0297 begin`);
      const actual: string = commodityText(35, '\u4e2d\u6587');
      logInfo(`commodityText(id=35, title="??"): actual=${actual}`);
      expect(actual).assertEqual('35  \u4e2d\u6587');
      logInfo(`${BUNDLE}CommodityText_0297 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0298
     * @tc.name      PageLoading_CommodityText_0298
     * @tc.desc      commodityText(id=35, title="a") returns "35  a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0298 begin`);
      const actual: string = commodityText(35, 'a');
      logInfo(`commodityText(id=35, title="a"): actual=${actual}`);
      expect(actual).assertEqual('35  a');
      logInfo(`${BUNDLE}CommodityText_0298 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0299
     * @tc.name      PageLoading_CommodityText_0299
     * @tc.desc      commodityText(id=35, title="abc") returns "35  abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0299 begin`);
      const actual: string = commodityText(35, 'abc');
      logInfo(`commodityText(id=35, title="abc"): actual=${actual}`);
      expect(actual).assertEqual('35  abc');
      logInfo(`${BUNDLE}CommodityText_0299 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0300
     * @tc.name      PageLoading_CommodityText_0300
     * @tc.desc      commodityText(id=35, title="Hello World") returns "35  Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0300 begin`);
      const actual: string = commodityText(35, 'Hello World');
      logInfo(`commodityText(id=35, title="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('35  Hello World');
      logInfo(`${BUNDLE}CommodityText_0300 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0301
     * @tc.name      PageLoading_CommodityText_0301
     * @tc.desc      commodityText(id=35, title="123") returns "35  123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0301 begin`);
      const actual: string = commodityText(35, '123');
      logInfo(`commodityText(id=35, title="123"): actual=${actual}`);
      expect(actual).assertEqual('35  123');
      logInfo(`${BUNDLE}CommodityText_0301 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0302
     * @tc.name      PageLoading_CommodityText_0302
     * @tc.desc      commodityText(id=35, title="    ") returns "35      "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0302 begin`);
      const actual: string = commodityText(35, '    ');
      logInfo(`commodityText(id=35, title="    "): actual=${actual}`);
      expect(actual).assertEqual('35      ');
      logInfo(`${BUNDLE}CommodityText_0302 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0303
     * @tc.name      PageLoading_CommodityText_0303
     * @tc.desc      commodityText(id=35, title="  _1") returns "35    _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0303 begin`);
      const actual: string = commodityText(35, '  _1');
      logInfo(`commodityText(id=35, title="  _1"): actual=${actual}`);
      expect(actual).assertEqual('35    _1');
      logInfo(`${BUNDLE}CommodityText_0303 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0304
     * @tc.name      PageLoading_CommodityText_0304
     * @tc.desc      commodityText(id=35, title="x  ") returns "35  x  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0304 begin`);
      const actual: string = commodityText(35, 'x  ');
      logInfo(`commodityText(id=35, title="x  "): actual=${actual}`);
      expect(actual).assertEqual('35  x  ');
      logInfo(`${BUNDLE}CommodityText_0304 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0305
     * @tc.name      PageLoading_CommodityText_0305
     * @tc.desc      commodityText(id=35, title="   ") returns "35     "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0305 begin`);
      const actual: string = commodityText(35, '   ');
      logInfo(`commodityText(id=35, title="   "): actual=${actual}`);
      expect(actual).assertEqual('35     ');
      logInfo(`${BUNDLE}CommodityText_0305 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0306
     * @tc.name      PageLoading_CommodityText_0306
     * @tc.desc      commodityText(id=35, title=" _1") returns "35   _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0306 begin`);
      const actual: string = commodityText(35, ' _1');
      logInfo(`commodityText(id=35, title=" _1"): actual=${actual}`);
      expect(actual).assertEqual('35   _1');
      logInfo(`${BUNDLE}CommodityText_0306 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0307
     * @tc.name      PageLoading_CommodityText_0307
     * @tc.desc      commodityText(id=35, title="x ") returns "35  x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0307 begin`);
      const actual: string = commodityText(35, 'x ');
      logInfo(`commodityText(id=35, title="x "): actual=${actual}`);
      expect(actual).assertEqual('35  x ');
      logInfo(`${BUNDLE}CommodityText_0307 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0308
     * @tc.name      PageLoading_CommodityText_0308
     * @tc.desc      commodityText(id=35, title="   x ") returns "35     x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0308 begin`);
      const actual: string = commodityText(35, '   x ');
      logInfo(`commodityText(id=35, title="   x "): actual=${actual}`);
      expect(actual).assertEqual('35     x ');
      logInfo(`${BUNDLE}CommodityText_0308 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0309
     * @tc.name      PageLoading_CommodityText_0309
     * @tc.desc      commodityText(id=35, title="  x  x") returns "35    x  x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0309 begin`);
      const actual: string = commodityText(35, '  x  x');
      logInfo(`commodityText(id=35, title="  x  x"): actual=${actual}`);
      expect(actual).assertEqual('35    x  x');
      logInfo(`${BUNDLE}CommodityText_0309 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0310
     * @tc.name      PageLoading_CommodityText_0310
     * @tc.desc      commodityText(id=35, title="  x_1") returns "35    x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0310 begin`);
      const actual: string = commodityText(35, '  x_1');
      logInfo(`commodityText(id=35, title="  x_1"): actual=${actual}`);
      expect(actual).assertEqual('35    x_1');
      logInfo(`${BUNDLE}CommodityText_0310 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0311
     * @tc.name      PageLoading_CommodityText_0311
     * @tc.desc      commodityText(id=35, title="x  x") returns "35  x  x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0311 begin`);
      const actual: string = commodityText(35, 'x  x');
      logInfo(`commodityText(id=35, title="x  x"): actual=${actual}`);
      expect(actual).assertEqual('35  x  x');
      logInfo(`${BUNDLE}CommodityText_0311 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0312
     * @tc.name      PageLoading_CommodityText_0312
     * @tc.desc      commodityText(id=35, title=" Hello ") returns "35   Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0312 begin`);
      const actual: string = commodityText(35, ' Hello ');
      logInfo(`commodityText(id=35, title=" Hello "): actual=${actual}`);
      expect(actual).assertEqual('35   Hello ');
      logInfo(`${BUNDLE}CommodityText_0312 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0313
     * @tc.name      PageLoading_CommodityText_0313
     * @tc.desc      commodityText(id=40, title="  ") returns "40    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PageLoading_CommodityText_0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CommodityText_0313 begin`);
      const actual: string = commodityText(40, '  ');
      logInfo(`commodityText(id=40, title="  "): actual=${actual}`);
      expect(actual).assertEqual('40    ');
      logInfo(`${BUNDLE}CommodityText_0313 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0314
     * @tc.name      PageLoading_CommodityText_0314
     * @tc.desc      commodityText(id=40, title=" ") returns "40   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0314 begin`);
      const actual: string = commodityText(40, ' ');
      logInfo(`commodityText(id=40, title=" "): actual=${actual}`);
      expect(actual).assertEqual('40   ');
      logInfo(`${BUNDLE}CommodityText_0314 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0315
     * @tc.name      PageLoading_CommodityText_0315
     * @tc.desc      commodityText(id=40, title="  x") returns "40    x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0315 begin`);
      const actual: string = commodityText(40, '  x');
      logInfo(`commodityText(id=40, title="  x"): actual=${actual}`);
      expect(actual).assertEqual('40    x');
      logInfo(`${BUNDLE}CommodityText_0315 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0316
     * @tc.name      PageLoading_CommodityText_0316
     * @tc.desc      commodityText(id=40, title="Hello") returns "40  Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0316 begin`);
      const actual: string = commodityText(40, 'Hello');
      logInfo(`commodityText(id=40, title="Hello"): actual=${actual}`);
      expect(actual).assertEqual('40  Hello');
      logInfo(`${BUNDLE}CommodityText_0316 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0317
     * @tc.name      PageLoading_CommodityText_0317
     * @tc.desc      commodityText(id=40, title="hello world") returns "40  hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0317 begin`);
      const actual: string = commodityText(40, 'hello world');
      logInfo(`commodityText(id=40, title="hello world"): actual=${actual}`);
      expect(actual).assertEqual('40  hello world');
      logInfo(`${BUNDLE}CommodityText_0317 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0318
     * @tc.name      PageLoading_CommodityText_0318
     * @tc.desc      commodityText(id=40, title="") returns "40  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0318 begin`);
      const actual: string = commodityText(40, '');
      logInfo(`commodityText(id=40, title=""): actual=${actual}`);
      expect(actual).assertEqual('40  ');
      logInfo(`${BUNDLE}CommodityText_0318 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0319
     * @tc.name      PageLoading_CommodityText_0319
     * @tc.desc      commodityText(id=40, title="A") returns "40  A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0319 begin`);
      const actual: string = commodityText(40, 'A');
      logInfo(`commodityText(id=40, title="A"): actual=${actual}`);
      expect(actual).assertEqual('40  A');
      logInfo(`${BUNDLE}CommodityText_0319 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0320
     * @tc.name      PageLoading_CommodityText_0320
     * @tc.desc      commodityText(id=40, title="Sample Title 123") returns "40  Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0320 begin`);
      const actual: string = commodityText(40, 'Sample Title 123');
      logInfo(`commodityText(id=40, title="Sample Title ...: actual=${actual}`);
      expect(actual).assertEqual('40  Sample Title 123');
      logInfo(`${BUNDLE}CommodityText_0320 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0321
     * @tc.name      PageLoading_CommodityText_0321
     * @tc.desc      commodityText(id=40, title="??") returns "40  ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0321 begin`);
      const actual: string = commodityText(40, '\u4e2d\u6587');
      logInfo(`commodityText(id=40, title="??"): actual=${actual}`);
      expect(actual).assertEqual('40  \u4e2d\u6587');
      logInfo(`${BUNDLE}CommodityText_0321 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0322
     * @tc.name      PageLoading_CommodityText_0322
     * @tc.desc      commodityText(id=40, title="a") returns "40  a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0322 begin`);
      const actual: string = commodityText(40, 'a');
      logInfo(`commodityText(id=40, title="a"): actual=${actual}`);
      expect(actual).assertEqual('40  a');
      logInfo(`${BUNDLE}CommodityText_0322 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0323
     * @tc.name      PageLoading_CommodityText_0323
     * @tc.desc      commodityText(id=40, title="abc") returns "40  abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0323 begin`);
      const actual: string = commodityText(40, 'abc');
      logInfo(`commodityText(id=40, title="abc"): actual=${actual}`);
      expect(actual).assertEqual('40  abc');
      logInfo(`${BUNDLE}CommodityText_0323 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0324
     * @tc.name      PageLoading_CommodityText_0324
     * @tc.desc      commodityText(id=40, title="Hello World") returns "40  Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0324 begin`);
      const actual: string = commodityText(40, 'Hello World');
      logInfo(`commodityText(id=40, title="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('40  Hello World');
      logInfo(`${BUNDLE}CommodityText_0324 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0325
     * @tc.name      PageLoading_CommodityText_0325
     * @tc.desc      commodityText(id=40, title="123") returns "40  123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0325 begin`);
      const actual: string = commodityText(40, '123');
      logInfo(`commodityText(id=40, title="123"): actual=${actual}`);
      expect(actual).assertEqual('40  123');
      logInfo(`${BUNDLE}CommodityText_0325 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0326
     * @tc.name      PageLoading_CommodityText_0326
     * @tc.desc      commodityText(id=40, title="    ") returns "40      "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0326 begin`);
      const actual: string = commodityText(40, '    ');
      logInfo(`commodityText(id=40, title="    "): actual=${actual}`);
      expect(actual).assertEqual('40      ');
      logInfo(`${BUNDLE}CommodityText_0326 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0327
     * @tc.name      PageLoading_CommodityText_0327
     * @tc.desc      commodityText(id=40, title="  _1") returns "40    _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0327 begin`);
      const actual: string = commodityText(40, '  _1');
      logInfo(`commodityText(id=40, title="  _1"): actual=${actual}`);
      expect(actual).assertEqual('40    _1');
      logInfo(`${BUNDLE}CommodityText_0327 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0328
     * @tc.name      PageLoading_CommodityText_0328
     * @tc.desc      commodityText(id=40, title="x  ") returns "40  x  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0328 begin`);
      const actual: string = commodityText(40, 'x  ');
      logInfo(`commodityText(id=40, title="x  "): actual=${actual}`);
      expect(actual).assertEqual('40  x  ');
      logInfo(`${BUNDLE}CommodityText_0328 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0329
     * @tc.name      PageLoading_CommodityText_0329
     * @tc.desc      commodityText(id=40, title="   ") returns "40     "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0329 begin`);
      const actual: string = commodityText(40, '   ');
      logInfo(`commodityText(id=40, title="   "): actual=${actual}`);
      expect(actual).assertEqual('40     ');
      logInfo(`${BUNDLE}CommodityText_0329 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0330
     * @tc.name      PageLoading_CommodityText_0330
     * @tc.desc      commodityText(id=40, title=" _1") returns "40   _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0330 begin`);
      const actual: string = commodityText(40, ' _1');
      logInfo(`commodityText(id=40, title=" _1"): actual=${actual}`);
      expect(actual).assertEqual('40   _1');
      logInfo(`${BUNDLE}CommodityText_0330 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0331
     * @tc.name      PageLoading_CommodityText_0331
     * @tc.desc      commodityText(id=40, title="x ") returns "40  x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0331 begin`);
      const actual: string = commodityText(40, 'x ');
      logInfo(`commodityText(id=40, title="x "): actual=${actual}`);
      expect(actual).assertEqual('40  x ');
      logInfo(`${BUNDLE}CommodityText_0331 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0332
     * @tc.name      PageLoading_CommodityText_0332
     * @tc.desc      commodityText(id=40, title="   x ") returns "40     x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0332 begin`);
      const actual: string = commodityText(40, '   x ');
      logInfo(`commodityText(id=40, title="   x "): actual=${actual}`);
      expect(actual).assertEqual('40     x ');
      logInfo(`${BUNDLE}CommodityText_0332 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0333
     * @tc.name      PageLoading_CommodityText_0333
     * @tc.desc      commodityText(id=40, title="  x  x") returns "40    x  x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0333 begin`);
      const actual: string = commodityText(40, '  x  x');
      logInfo(`commodityText(id=40, title="  x  x"): actual=${actual}`);
      expect(actual).assertEqual('40    x  x');
      logInfo(`${BUNDLE}CommodityText_0333 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0334
     * @tc.name      PageLoading_CommodityText_0334
     * @tc.desc      commodityText(id=40, title="  x_1") returns "40    x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0334 begin`);
      const actual: string = commodityText(40, '  x_1');
      logInfo(`commodityText(id=40, title="  x_1"): actual=${actual}`);
      expect(actual).assertEqual('40    x_1');
      logInfo(`${BUNDLE}CommodityText_0334 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0335
     * @tc.name      PageLoading_CommodityText_0335
     * @tc.desc      commodityText(id=40, title="x  x") returns "40  x  x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0335 begin`);
      const actual: string = commodityText(40, 'x  x');
      logInfo(`commodityText(id=40, title="x  x"): actual=${actual}`);
      expect(actual).assertEqual('40  x  x');
      logInfo(`${BUNDLE}CommodityText_0335 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0336
     * @tc.name      PageLoading_CommodityText_0336
     * @tc.desc      commodityText(id=40, title=" Hello ") returns "40   Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0336 begin`);
      const actual: string = commodityText(40, ' Hello ');
      logInfo(`commodityText(id=40, title=" Hello "): actual=${actual}`);
      expect(actual).assertEqual('40   Hello ');
      logInfo(`${BUNDLE}CommodityText_0336 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0337
     * @tc.name      PageLoading_CommodityText_0337
     * @tc.desc      commodityText(id=45, title="  ") returns "45    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PageLoading_CommodityText_0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CommodityText_0337 begin`);
      const actual: string = commodityText(45, '  ');
      logInfo(`commodityText(id=45, title="  "): actual=${actual}`);
      expect(actual).assertEqual('45    ');
      logInfo(`${BUNDLE}CommodityText_0337 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0338
     * @tc.name      PageLoading_CommodityText_0338
     * @tc.desc      commodityText(id=45, title=" ") returns "45   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0338 begin`);
      const actual: string = commodityText(45, ' ');
      logInfo(`commodityText(id=45, title=" "): actual=${actual}`);
      expect(actual).assertEqual('45   ');
      logInfo(`${BUNDLE}CommodityText_0338 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0339
     * @tc.name      PageLoading_CommodityText_0339
     * @tc.desc      commodityText(id=45, title="  x") returns "45    x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0339 begin`);
      const actual: string = commodityText(45, '  x');
      logInfo(`commodityText(id=45, title="  x"): actual=${actual}`);
      expect(actual).assertEqual('45    x');
      logInfo(`${BUNDLE}CommodityText_0339 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0340
     * @tc.name      PageLoading_CommodityText_0340
     * @tc.desc      commodityText(id=45, title="Hello") returns "45  Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0340 begin`);
      const actual: string = commodityText(45, 'Hello');
      logInfo(`commodityText(id=45, title="Hello"): actual=${actual}`);
      expect(actual).assertEqual('45  Hello');
      logInfo(`${BUNDLE}CommodityText_0340 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0341
     * @tc.name      PageLoading_CommodityText_0341
     * @tc.desc      commodityText(id=45, title="hello world") returns "45  hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0341 begin`);
      const actual: string = commodityText(45, 'hello world');
      logInfo(`commodityText(id=45, title="hello world"): actual=${actual}`);
      expect(actual).assertEqual('45  hello world');
      logInfo(`${BUNDLE}CommodityText_0341 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0342
     * @tc.name      PageLoading_CommodityText_0342
     * @tc.desc      commodityText(id=45, title="") returns "45  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0342 begin`);
      const actual: string = commodityText(45, '');
      logInfo(`commodityText(id=45, title=""): actual=${actual}`);
      expect(actual).assertEqual('45  ');
      logInfo(`${BUNDLE}CommodityText_0342 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0343
     * @tc.name      PageLoading_CommodityText_0343
     * @tc.desc      commodityText(id=45, title="A") returns "45  A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0343 begin`);
      const actual: string = commodityText(45, 'A');
      logInfo(`commodityText(id=45, title="A"): actual=${actual}`);
      expect(actual).assertEqual('45  A');
      logInfo(`${BUNDLE}CommodityText_0343 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0344
     * @tc.name      PageLoading_CommodityText_0344
     * @tc.desc      commodityText(id=45, title="Sample Title 123") returns "45  Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0344 begin`);
      const actual: string = commodityText(45, 'Sample Title 123');
      logInfo(`commodityText(id=45, title="Sample Title ...: actual=${actual}`);
      expect(actual).assertEqual('45  Sample Title 123');
      logInfo(`${BUNDLE}CommodityText_0344 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0345
     * @tc.name      PageLoading_CommodityText_0345
     * @tc.desc      commodityText(id=45, title="??") returns "45  ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0345 begin`);
      const actual: string = commodityText(45, '\u4e2d\u6587');
      logInfo(`commodityText(id=45, title="??"): actual=${actual}`);
      expect(actual).assertEqual('45  \u4e2d\u6587');
      logInfo(`${BUNDLE}CommodityText_0345 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0346
     * @tc.name      PageLoading_CommodityText_0346
     * @tc.desc      commodityText(id=45, title="a") returns "45  a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0346 begin`);
      const actual: string = commodityText(45, 'a');
      logInfo(`commodityText(id=45, title="a"): actual=${actual}`);
      expect(actual).assertEqual('45  a');
      logInfo(`${BUNDLE}CommodityText_0346 end`);
    });
  });
}
