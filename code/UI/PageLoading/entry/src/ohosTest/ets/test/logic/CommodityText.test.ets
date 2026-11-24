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
export default function commodityTextTest(): void {
  describe('CommodityTextTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0001
     * @tc.name      PageLoading_CommodityText_0001
     * @tc.desc      commodityText(id=0, title="  ") returns "0    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PageLoading_CommodityText_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CommodityText_0001 begin`);
      const actual: string = commodityText(0, '  ');
      logInfo(`commodityText(id=0, title="  "): actual=${actual}`);
      expect(actual).assertEqual('0    ');
      logInfo(`${BUNDLE}CommodityText_0001 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0002
     * @tc.name      PageLoading_CommodityText_0002
     * @tc.desc      commodityText(id=0, title=" ") returns "0   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PageLoading_CommodityText_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CommodityText_0002 begin`);
      const actual: string = commodityText(0, ' ');
      logInfo(`commodityText(id=0, title=" "): actual=${actual}`);
      expect(actual).assertEqual('0   ');
      logInfo(`${BUNDLE}CommodityText_0002 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0003
     * @tc.name      PageLoading_CommodityText_0003
     * @tc.desc      commodityText(id=0, title="  x") returns "0    x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0003 begin`);
      const actual: string = commodityText(0, '  x');
      logInfo(`commodityText(id=0, title="  x"): actual=${actual}`);
      expect(actual).assertEqual('0    x');
      logInfo(`${BUNDLE}CommodityText_0003 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0004
     * @tc.name      PageLoading_CommodityText_0004
     * @tc.desc      commodityText(id=0, title="Hello") returns "0  Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0004 begin`);
      const actual: string = commodityText(0, 'Hello');
      logInfo(`commodityText(id=0, title="Hello"): actual=${actual}`);
      expect(actual).assertEqual('0  Hello');
      logInfo(`${BUNDLE}CommodityText_0004 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0005
     * @tc.name      PageLoading_CommodityText_0005
     * @tc.desc      commodityText(id=0, title="hello world") returns "0  hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0005 begin`);
      const actual: string = commodityText(0, 'hello world');
      logInfo(`commodityText(id=0, title="hello world"): actual=${actual}`);
      expect(actual).assertEqual('0  hello world');
      logInfo(`${BUNDLE}CommodityText_0005 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0006
     * @tc.name      PageLoading_CommodityText_0006
     * @tc.desc      commodityText(id=0, title="") returns "0  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0006 begin`);
      const actual: string = commodityText(0, '');
      logInfo(`commodityText(id=0, title=""): actual=${actual}`);
      expect(actual).assertEqual('0  ');
      logInfo(`${BUNDLE}CommodityText_0006 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0007
     * @tc.name      PageLoading_CommodityText_0007
     * @tc.desc      commodityText(id=0, title="A") returns "0  A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0007 begin`);
      const actual: string = commodityText(0, 'A');
      logInfo(`commodityText(id=0, title="A"): actual=${actual}`);
      expect(actual).assertEqual('0  A');
      logInfo(`${BUNDLE}CommodityText_0007 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0008
     * @tc.name      PageLoading_CommodityText_0008
     * @tc.desc      commodityText(id=0, title="Sample Title 123") returns "0  Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0008 begin`);
      const actual: string = commodityText(0, 'Sample Title 123');
      logInfo(`commodityText(id=0, title="Sample Title 1...: actual=${actual}`);
      expect(actual).assertEqual('0  Sample Title 123');
      logInfo(`${BUNDLE}CommodityText_0008 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0009
     * @tc.name      PageLoading_CommodityText_0009
     * @tc.desc      commodityText(id=0, title="??") returns "0  ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0009 begin`);
      const actual: string = commodityText(0, '\u4e2d\u6587');
      logInfo(`commodityText(id=0, title="??"): actual=${actual}`);
      expect(actual).assertEqual('0  \u4e2d\u6587');
      logInfo(`${BUNDLE}CommodityText_0009 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0010
     * @tc.name      PageLoading_CommodityText_0010
     * @tc.desc      commodityText(id=0, title="a") returns "0  a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0010 begin`);
      const actual: string = commodityText(0, 'a');
      logInfo(`commodityText(id=0, title="a"): actual=${actual}`);
      expect(actual).assertEqual('0  a');
      logInfo(`${BUNDLE}CommodityText_0010 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0011
     * @tc.name      PageLoading_CommodityText_0011
     * @tc.desc      commodityText(id=0, title="abc") returns "0  abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0011 begin`);
      const actual: string = commodityText(0, 'abc');
      logInfo(`commodityText(id=0, title="abc"): actual=${actual}`);
      expect(actual).assertEqual('0  abc');
      logInfo(`${BUNDLE}CommodityText_0011 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0012
     * @tc.name      PageLoading_CommodityText_0012
     * @tc.desc      commodityText(id=0, title="Hello World") returns "0  Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0012 begin`);
      const actual: string = commodityText(0, 'Hello World');
      logInfo(`commodityText(id=0, title="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('0  Hello World');
      logInfo(`${BUNDLE}CommodityText_0012 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0013
     * @tc.name      PageLoading_CommodityText_0013
     * @tc.desc      commodityText(id=0, title="123") returns "0  123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0013 begin`);
      const actual: string = commodityText(0, '123');
      logInfo(`commodityText(id=0, title="123"): actual=${actual}`);
      expect(actual).assertEqual('0  123');
      logInfo(`${BUNDLE}CommodityText_0013 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0014
     * @tc.name      PageLoading_CommodityText_0014
     * @tc.desc      commodityText(id=0, title="    ") returns "0      "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0014 begin`);
      const actual: string = commodityText(0, '    ');
      logInfo(`commodityText(id=0, title="    "): actual=${actual}`);
      expect(actual).assertEqual('0      ');
      logInfo(`${BUNDLE}CommodityText_0014 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0015
     * @tc.name      PageLoading_CommodityText_0015
     * @tc.desc      commodityText(id=0, title="  _1") returns "0    _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0015 begin`);
      const actual: string = commodityText(0, '  _1');
      logInfo(`commodityText(id=0, title="  _1"): actual=${actual}`);
      expect(actual).assertEqual('0    _1');
      logInfo(`${BUNDLE}CommodityText_0015 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0016
     * @tc.name      PageLoading_CommodityText_0016
     * @tc.desc      commodityText(id=0, title="x  ") returns "0  x  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0016 begin`);
      const actual: string = commodityText(0, 'x  ');
      logInfo(`commodityText(id=0, title="x  "): actual=${actual}`);
      expect(actual).assertEqual('0  x  ');
      logInfo(`${BUNDLE}CommodityText_0016 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0017
     * @tc.name      PageLoading_CommodityText_0017
     * @tc.desc      commodityText(id=0, title="   ") returns "0     "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0017 begin`);
      const actual: string = commodityText(0, '   ');
      logInfo(`commodityText(id=0, title="   "): actual=${actual}`);
      expect(actual).assertEqual('0     ');
      logInfo(`${BUNDLE}CommodityText_0017 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0018
     * @tc.name      PageLoading_CommodityText_0018
     * @tc.desc      commodityText(id=0, title=" _1") returns "0   _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0018 begin`);
      const actual: string = commodityText(0, ' _1');
      logInfo(`commodityText(id=0, title=" _1"): actual=${actual}`);
      expect(actual).assertEqual('0   _1');
      logInfo(`${BUNDLE}CommodityText_0018 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0019
     * @tc.name      PageLoading_CommodityText_0019
     * @tc.desc      commodityText(id=0, title="x ") returns "0  x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0019 begin`);
      const actual: string = commodityText(0, 'x ');
      logInfo(`commodityText(id=0, title="x "): actual=${actual}`);
      expect(actual).assertEqual('0  x ');
      logInfo(`${BUNDLE}CommodityText_0019 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0020
     * @tc.name      PageLoading_CommodityText_0020
     * @tc.desc      commodityText(id=0, title="   x ") returns "0     x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0020 begin`);
      const actual: string = commodityText(0, '   x ');
      logInfo(`commodityText(id=0, title="   x "): actual=${actual}`);
      expect(actual).assertEqual('0     x ');
      logInfo(`${BUNDLE}CommodityText_0020 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0021
     * @tc.name      PageLoading_CommodityText_0021
     * @tc.desc      commodityText(id=0, title="  x  x") returns "0    x  x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0021 begin`);
      const actual: string = commodityText(0, '  x  x');
      logInfo(`commodityText(id=0, title="  x  x"): actual=${actual}`);
      expect(actual).assertEqual('0    x  x');
      logInfo(`${BUNDLE}CommodityText_0021 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0022
     * @tc.name      PageLoading_CommodityText_0022
     * @tc.desc      commodityText(id=0, title="  x_1") returns "0    x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0022 begin`);
      const actual: string = commodityText(0, '  x_1');
      logInfo(`commodityText(id=0, title="  x_1"): actual=${actual}`);
      expect(actual).assertEqual('0    x_1');
      logInfo(`${BUNDLE}CommodityText_0022 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0023
     * @tc.name      PageLoading_CommodityText_0023
     * @tc.desc      commodityText(id=0, title="x  x") returns "0  x  x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0023 begin`);
      const actual: string = commodityText(0, 'x  x');
      logInfo(`commodityText(id=0, title="x  x"): actual=${actual}`);
      expect(actual).assertEqual('0  x  x');
      logInfo(`${BUNDLE}CommodityText_0023 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0024
     * @tc.name      PageLoading_CommodityText_0024
     * @tc.desc      commodityText(id=0, title=" Hello ") returns "0   Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0024 begin`);
      const actual: string = commodityText(0, ' Hello ');
      logInfo(`commodityText(id=0, title=" Hello "): actual=${actual}`);
      expect(actual).assertEqual('0   Hello ');
      logInfo(`${BUNDLE}CommodityText_0024 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0025
     * @tc.name      PageLoading_CommodityText_0025
     * @tc.desc      commodityText(id=1, title="  ") returns "1    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PageLoading_CommodityText_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CommodityText_0025 begin`);
      const actual: string = commodityText(1, '  ');
      logInfo(`commodityText(id=1, title="  "): actual=${actual}`);
      expect(actual).assertEqual('1    ');
      logInfo(`${BUNDLE}CommodityText_0025 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0026
     * @tc.name      PageLoading_CommodityText_0026
     * @tc.desc      commodityText(id=1, title=" ") returns "1   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0026 begin`);
      const actual: string = commodityText(1, ' ');
      logInfo(`commodityText(id=1, title=" "): actual=${actual}`);
      expect(actual).assertEqual('1   ');
      logInfo(`${BUNDLE}CommodityText_0026 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0027
     * @tc.name      PageLoading_CommodityText_0027
     * @tc.desc      commodityText(id=1, title="  x") returns "1    x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0027 begin`);
      const actual: string = commodityText(1, '  x');
      logInfo(`commodityText(id=1, title="  x"): actual=${actual}`);
      expect(actual).assertEqual('1    x');
      logInfo(`${BUNDLE}CommodityText_0027 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0028
     * @tc.name      PageLoading_CommodityText_0028
     * @tc.desc      commodityText(id=1, title="Hello") returns "1  Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0028 begin`);
      const actual: string = commodityText(1, 'Hello');
      logInfo(`commodityText(id=1, title="Hello"): actual=${actual}`);
      expect(actual).assertEqual('1  Hello');
      logInfo(`${BUNDLE}CommodityText_0028 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0029
     * @tc.name      PageLoading_CommodityText_0029
     * @tc.desc      commodityText(id=1, title="hello world") returns "1  hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0029 begin`);
      const actual: string = commodityText(1, 'hello world');
      logInfo(`commodityText(id=1, title="hello world"): actual=${actual}`);
      expect(actual).assertEqual('1  hello world');
      logInfo(`${BUNDLE}CommodityText_0029 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0030
     * @tc.name      PageLoading_CommodityText_0030
     * @tc.desc      commodityText(id=1, title="") returns "1  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0030 begin`);
      const actual: string = commodityText(1, '');
      logInfo(`commodityText(id=1, title=""): actual=${actual}`);
      expect(actual).assertEqual('1  ');
      logInfo(`${BUNDLE}CommodityText_0030 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0031
     * @tc.name      PageLoading_CommodityText_0031
     * @tc.desc      commodityText(id=1, title="A") returns "1  A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0031 begin`);
      const actual: string = commodityText(1, 'A');
      logInfo(`commodityText(id=1, title="A"): actual=${actual}`);
      expect(actual).assertEqual('1  A');
      logInfo(`${BUNDLE}CommodityText_0031 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0032
     * @tc.name      PageLoading_CommodityText_0032
     * @tc.desc      commodityText(id=1, title="Sample Title 123") returns "1  Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0032 begin`);
      const actual: string = commodityText(1, 'Sample Title 123');
      logInfo(`commodityText(id=1, title="Sample Title 1...: actual=${actual}`);
      expect(actual).assertEqual('1  Sample Title 123');
      logInfo(`${BUNDLE}CommodityText_0032 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0033
     * @tc.name      PageLoading_CommodityText_0033
     * @tc.desc      commodityText(id=1, title="??") returns "1  ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0033 begin`);
      const actual: string = commodityText(1, '\u4e2d\u6587');
      logInfo(`commodityText(id=1, title="??"): actual=${actual}`);
      expect(actual).assertEqual('1  \u4e2d\u6587');
      logInfo(`${BUNDLE}CommodityText_0033 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0034
     * @tc.name      PageLoading_CommodityText_0034
     * @tc.desc      commodityText(id=1, title="a") returns "1  a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0034 begin`);
      const actual: string = commodityText(1, 'a');
      logInfo(`commodityText(id=1, title="a"): actual=${actual}`);
      expect(actual).assertEqual('1  a');
      logInfo(`${BUNDLE}CommodityText_0034 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0035
     * @tc.name      PageLoading_CommodityText_0035
     * @tc.desc      commodityText(id=1, title="abc") returns "1  abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0035 begin`);
      const actual: string = commodityText(1, 'abc');
      logInfo(`commodityText(id=1, title="abc"): actual=${actual}`);
      expect(actual).assertEqual('1  abc');
      logInfo(`${BUNDLE}CommodityText_0035 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0036
     * @tc.name      PageLoading_CommodityText_0036
     * @tc.desc      commodityText(id=1, title="Hello World") returns "1  Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0036 begin`);
      const actual: string = commodityText(1, 'Hello World');
      logInfo(`commodityText(id=1, title="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('1  Hello World');
      logInfo(`${BUNDLE}CommodityText_0036 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0037
     * @tc.name      PageLoading_CommodityText_0037
     * @tc.desc      commodityText(id=1, title="123") returns "1  123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0037 begin`);
      const actual: string = commodityText(1, '123');
      logInfo(`commodityText(id=1, title="123"): actual=${actual}`);
      expect(actual).assertEqual('1  123');
      logInfo(`${BUNDLE}CommodityText_0037 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0038
     * @tc.name      PageLoading_CommodityText_0038
     * @tc.desc      commodityText(id=1, title="    ") returns "1      "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0038 begin`);
      const actual: string = commodityText(1, '    ');
      logInfo(`commodityText(id=1, title="    "): actual=${actual}`);
      expect(actual).assertEqual('1      ');
      logInfo(`${BUNDLE}CommodityText_0038 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0039
     * @tc.name      PageLoading_CommodityText_0039
     * @tc.desc      commodityText(id=1, title="  _1") returns "1    _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0039 begin`);
      const actual: string = commodityText(1, '  _1');
      logInfo(`commodityText(id=1, title="  _1"): actual=${actual}`);
      expect(actual).assertEqual('1    _1');
      logInfo(`${BUNDLE}CommodityText_0039 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0040
     * @tc.name      PageLoading_CommodityText_0040
     * @tc.desc      commodityText(id=1, title="x  ") returns "1  x  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0040 begin`);
      const actual: string = commodityText(1, 'x  ');
      logInfo(`commodityText(id=1, title="x  "): actual=${actual}`);
      expect(actual).assertEqual('1  x  ');
      logInfo(`${BUNDLE}CommodityText_0040 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0041
     * @tc.name      PageLoading_CommodityText_0041
     * @tc.desc      commodityText(id=1, title="   ") returns "1     "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0041 begin`);
      const actual: string = commodityText(1, '   ');
      logInfo(`commodityText(id=1, title="   "): actual=${actual}`);
      expect(actual).assertEqual('1     ');
      logInfo(`${BUNDLE}CommodityText_0041 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0042
     * @tc.name      PageLoading_CommodityText_0042
     * @tc.desc      commodityText(id=1, title=" _1") returns "1   _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0042 begin`);
      const actual: string = commodityText(1, ' _1');
      logInfo(`commodityText(id=1, title=" _1"): actual=${actual}`);
      expect(actual).assertEqual('1   _1');
      logInfo(`${BUNDLE}CommodityText_0042 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0043
     * @tc.name      PageLoading_CommodityText_0043
     * @tc.desc      commodityText(id=1, title="x ") returns "1  x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0043 begin`);
      const actual: string = commodityText(1, 'x ');
      logInfo(`commodityText(id=1, title="x "): actual=${actual}`);
      expect(actual).assertEqual('1  x ');
      logInfo(`${BUNDLE}CommodityText_0043 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0044
     * @tc.name      PageLoading_CommodityText_0044
     * @tc.desc      commodityText(id=1, title="   x ") returns "1     x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0044 begin`);
      const actual: string = commodityText(1, '   x ');
      logInfo(`commodityText(id=1, title="   x "): actual=${actual}`);
      expect(actual).assertEqual('1     x ');
      logInfo(`${BUNDLE}CommodityText_0044 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0045
     * @tc.name      PageLoading_CommodityText_0045
     * @tc.desc      commodityText(id=1, title="  x  x") returns "1    x  x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0045 begin`);
      const actual: string = commodityText(1, '  x  x');
      logInfo(`commodityText(id=1, title="  x  x"): actual=${actual}`);
      expect(actual).assertEqual('1    x  x');
      logInfo(`${BUNDLE}CommodityText_0045 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0046
     * @tc.name      PageLoading_CommodityText_0046
     * @tc.desc      commodityText(id=1, title="  x_1") returns "1    x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0046 begin`);
      const actual: string = commodityText(1, '  x_1');
      logInfo(`commodityText(id=1, title="  x_1"): actual=${actual}`);
      expect(actual).assertEqual('1    x_1');
      logInfo(`${BUNDLE}CommodityText_0046 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0047
     * @tc.name      PageLoading_CommodityText_0047
     * @tc.desc      commodityText(id=1, title="x  x") returns "1  x  x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0047 begin`);
      const actual: string = commodityText(1, 'x  x');
      logInfo(`commodityText(id=1, title="x  x"): actual=${actual}`);
      expect(actual).assertEqual('1  x  x');
      logInfo(`${BUNDLE}CommodityText_0047 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0048
     * @tc.name      PageLoading_CommodityText_0048
     * @tc.desc      commodityText(id=1, title=" Hello ") returns "1   Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0048 begin`);
      const actual: string = commodityText(1, ' Hello ');
      logInfo(`commodityText(id=1, title=" Hello "): actual=${actual}`);
      expect(actual).assertEqual('1   Hello ');
      logInfo(`${BUNDLE}CommodityText_0048 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0049
     * @tc.name      PageLoading_CommodityText_0049
     * @tc.desc      commodityText(id=100, title="  ") returns "100    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PageLoading_CommodityText_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CommodityText_0049 begin`);
      const actual: string = commodityText(100, '  ');
      logInfo(`commodityText(id=100, title="  "): actual=${actual}`);
      expect(actual).assertEqual('100    ');
      logInfo(`${BUNDLE}CommodityText_0049 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0050
     * @tc.name      PageLoading_CommodityText_0050
     * @tc.desc      commodityText(id=100, title=" ") returns "100   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0050 begin`);
      const actual: string = commodityText(100, ' ');
      logInfo(`commodityText(id=100, title=" "): actual=${actual}`);
      expect(actual).assertEqual('100   ');
      logInfo(`${BUNDLE}CommodityText_0050 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0051
     * @tc.name      PageLoading_CommodityText_0051
     * @tc.desc      commodityText(id=100, title="  x") returns "100    x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0051 begin`);
      const actual: string = commodityText(100, '  x');
      logInfo(`commodityText(id=100, title="  x"): actual=${actual}`);
      expect(actual).assertEqual('100    x');
      logInfo(`${BUNDLE}CommodityText_0051 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0052
     * @tc.name      PageLoading_CommodityText_0052
     * @tc.desc      commodityText(id=100, title="Hello") returns "100  Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0052 begin`);
      const actual: string = commodityText(100, 'Hello');
      logInfo(`commodityText(id=100, title="Hello"): actual=${actual}`);
      expect(actual).assertEqual('100  Hello');
      logInfo(`${BUNDLE}CommodityText_0052 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0053
     * @tc.name      PageLoading_CommodityText_0053
     * @tc.desc      commodityText(id=100, title="hello world") returns "100  hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0053 begin`);
      const actual: string = commodityText(100, 'hello world');
      logInfo(`commodityText(id=100, title="hello world"): actual=${actual}`);
      expect(actual).assertEqual('100  hello world');
      logInfo(`${BUNDLE}CommodityText_0053 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0054
     * @tc.name      PageLoading_CommodityText_0054
     * @tc.desc      commodityText(id=100, title="") returns "100  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0054 begin`);
      const actual: string = commodityText(100, '');
      logInfo(`commodityText(id=100, title=""): actual=${actual}`);
      expect(actual).assertEqual('100  ');
      logInfo(`${BUNDLE}CommodityText_0054 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0055
     * @tc.name      PageLoading_CommodityText_0055
     * @tc.desc      commodityText(id=100, title="A") returns "100  A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0055 begin`);
      const actual: string = commodityText(100, 'A');
      logInfo(`commodityText(id=100, title="A"): actual=${actual}`);
      expect(actual).assertEqual('100  A');
      logInfo(`${BUNDLE}CommodityText_0055 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0056
     * @tc.name      PageLoading_CommodityText_0056
     * @tc.desc      commodityText(id=100, title="Sample Title 123") returns "100  Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0056 begin`);
      const actual: string = commodityText(100, 'Sample Title 123');
      logInfo(`commodityText(id=100, title="Sample Title...: actual=${actual}`);
      expect(actual).assertEqual('100  Sample Title 123');
      logInfo(`${BUNDLE}CommodityText_0056 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0057
     * @tc.name      PageLoading_CommodityText_0057
     * @tc.desc      commodityText(id=100, title="??") returns "100  ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0057 begin`);
      const actual: string = commodityText(100, '\u4e2d\u6587');
      logInfo(`commodityText(id=100, title="??"): actual=${actual}`);
      expect(actual).assertEqual('100  \u4e2d\u6587');
      logInfo(`${BUNDLE}CommodityText_0057 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0058
     * @tc.name      PageLoading_CommodityText_0058
     * @tc.desc      commodityText(id=100, title="a") returns "100  a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0058 begin`);
      const actual: string = commodityText(100, 'a');
      logInfo(`commodityText(id=100, title="a"): actual=${actual}`);
      expect(actual).assertEqual('100  a');
      logInfo(`${BUNDLE}CommodityText_0058 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0059
     * @tc.name      PageLoading_CommodityText_0059
     * @tc.desc      commodityText(id=100, title="abc") returns "100  abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0059 begin`);
      const actual: string = commodityText(100, 'abc');
      logInfo(`commodityText(id=100, title="abc"): actual=${actual}`);
      expect(actual).assertEqual('100  abc');
      logInfo(`${BUNDLE}CommodityText_0059 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0060
     * @tc.name      PageLoading_CommodityText_0060
     * @tc.desc      commodityText(id=100, title="Hello World") returns "100  Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0060 begin`);
      const actual: string = commodityText(100, 'Hello World');
      logInfo(`commodityText(id=100, title="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('100  Hello World');
      logInfo(`${BUNDLE}CommodityText_0060 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0061
     * @tc.name      PageLoading_CommodityText_0061
     * @tc.desc      commodityText(id=100, title="123") returns "100  123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0061 begin`);
      const actual: string = commodityText(100, '123');
      logInfo(`commodityText(id=100, title="123"): actual=${actual}`);
      expect(actual).assertEqual('100  123');
      logInfo(`${BUNDLE}CommodityText_0061 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0062
     * @tc.name      PageLoading_CommodityText_0062
     * @tc.desc      commodityText(id=100, title="    ") returns "100      "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0062 begin`);
      const actual: string = commodityText(100, '    ');
      logInfo(`commodityText(id=100, title="    "): actual=${actual}`);
      expect(actual).assertEqual('100      ');
      logInfo(`${BUNDLE}CommodityText_0062 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0063
     * @tc.name      PageLoading_CommodityText_0063
     * @tc.desc      commodityText(id=100, title="  _1") returns "100    _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0063 begin`);
      const actual: string = commodityText(100, '  _1');
      logInfo(`commodityText(id=100, title="  _1"): actual=${actual}`);
      expect(actual).assertEqual('100    _1');
      logInfo(`${BUNDLE}CommodityText_0063 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0064
     * @tc.name      PageLoading_CommodityText_0064
     * @tc.desc      commodityText(id=100, title="x  ") returns "100  x  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0064 begin`);
      const actual: string = commodityText(100, 'x  ');
      logInfo(`commodityText(id=100, title="x  "): actual=${actual}`);
      expect(actual).assertEqual('100  x  ');
      logInfo(`${BUNDLE}CommodityText_0064 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0065
     * @tc.name      PageLoading_CommodityText_0065
     * @tc.desc      commodityText(id=100, title="   ") returns "100     "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0065 begin`);
      const actual: string = commodityText(100, '   ');
      logInfo(`commodityText(id=100, title="   "): actual=${actual}`);
      expect(actual).assertEqual('100     ');
      logInfo(`${BUNDLE}CommodityText_0065 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0066
     * @tc.name      PageLoading_CommodityText_0066
     * @tc.desc      commodityText(id=100, title=" _1") returns "100   _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0066 begin`);
      const actual: string = commodityText(100, ' _1');
      logInfo(`commodityText(id=100, title=" _1"): actual=${actual}`);
      expect(actual).assertEqual('100   _1');
      logInfo(`${BUNDLE}CommodityText_0066 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0067
     * @tc.name      PageLoading_CommodityText_0067
     * @tc.desc      commodityText(id=100, title="x ") returns "100  x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0067 begin`);
      const actual: string = commodityText(100, 'x ');
      logInfo(`commodityText(id=100, title="x "): actual=${actual}`);
      expect(actual).assertEqual('100  x ');
      logInfo(`${BUNDLE}CommodityText_0067 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0068
     * @tc.name      PageLoading_CommodityText_0068
     * @tc.desc      commodityText(id=100, title="   x ") returns "100     x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0068 begin`);
      const actual: string = commodityText(100, '   x ');
      logInfo(`commodityText(id=100, title="   x "): actual=${actual}`);
      expect(actual).assertEqual('100     x ');
      logInfo(`${BUNDLE}CommodityText_0068 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0069
     * @tc.name      PageLoading_CommodityText_0069
     * @tc.desc      commodityText(id=100, title="  x  x") returns "100    x  x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0069 begin`);
      const actual: string = commodityText(100, '  x  x');
      logInfo(`commodityText(id=100, title="  x  x"): actual=${actual}`);
      expect(actual).assertEqual('100    x  x');
      logInfo(`${BUNDLE}CommodityText_0069 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0070
     * @tc.name      PageLoading_CommodityText_0070
     * @tc.desc      commodityText(id=100, title="  x_1") returns "100    x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_CommodityText_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommodityText_0070 begin`);
      const actual: string = commodityText(100, '  x_1');
      logInfo(`commodityText(id=100, title="  x_1"): actual=${actual}`);
      expect(actual).assertEqual('100    x_1');
      logInfo(`${BUNDLE}CommodityText_0070 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0071
     * @tc.name      PageLoading_CommodityText_0071
     * @tc.desc      commodityText(id=100, title="x  x") returns "100  x  x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0071 begin`);
      const actual: string = commodityText(100, 'x  x');
      logInfo(`commodityText(id=100, title="x  x"): actual=${actual}`);
      expect(actual).assertEqual('100  x  x');
      logInfo(`${BUNDLE}CommodityText_0071 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0072
     * @tc.name      PageLoading_CommodityText_0072
     * @tc.desc      commodityText(id=100, title=" Hello ") returns "100   Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0072 begin`);
      const actual: string = commodityText(100, ' Hello ');
      logInfo(`commodityText(id=100, title=" Hello "): actual=${actual}`);
      expect(actual).assertEqual('100   Hello ');
      logInfo(`${BUNDLE}CommodityText_0072 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0073
     * @tc.name      PageLoading_CommodityText_0073
     * @tc.desc      commodityText(id=-1, title="  ") returns "-1    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0073 begin`);
      const actual: string = commodityText(-1, '  ');
      logInfo(`commodityText(id=-1, title="  "): actual=${actual}`);
      expect(actual).assertEqual('-1    ');
      logInfo(`${BUNDLE}CommodityText_0073 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0074
     * @tc.name      PageLoading_CommodityText_0074
     * @tc.desc      commodityText(id=-1, title=" ") returns "-1   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0074 begin`);
      const actual: string = commodityText(-1, ' ');
      logInfo(`commodityText(id=-1, title=" "): actual=${actual}`);
      expect(actual).assertEqual('-1   ');
      logInfo(`${BUNDLE}CommodityText_0074 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0075
     * @tc.name      PageLoading_CommodityText_0075
     * @tc.desc      commodityText(id=-1, title="  x") returns "-1    x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0075 begin`);
      const actual: string = commodityText(-1, '  x');
      logInfo(`commodityText(id=-1, title="  x"): actual=${actual}`);
      expect(actual).assertEqual('-1    x');
      logInfo(`${BUNDLE}CommodityText_0075 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0076
     * @tc.name      PageLoading_CommodityText_0076
     * @tc.desc      commodityText(id=-1, title="Hello") returns "-1  Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0076 begin`);
      const actual: string = commodityText(-1, 'Hello');
      logInfo(`commodityText(id=-1, title="Hello"): actual=${actual}`);
      expect(actual).assertEqual('-1  Hello');
      logInfo(`${BUNDLE}CommodityText_0076 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0077
     * @tc.name      PageLoading_CommodityText_0077
     * @tc.desc      commodityText(id=-1, title="hello world") returns "-1  hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0077 begin`);
      const actual: string = commodityText(-1, 'hello world');
      logInfo(`commodityText(id=-1, title="hello world"): actual=${actual}`);
      expect(actual).assertEqual('-1  hello world');
      logInfo(`${BUNDLE}CommodityText_0077 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0078
     * @tc.name      PageLoading_CommodityText_0078
     * @tc.desc      commodityText(id=-1, title="") returns "-1  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0078 begin`);
      const actual: string = commodityText(-1, '');
      logInfo(`commodityText(id=-1, title=""): actual=${actual}`);
      expect(actual).assertEqual('-1  ');
      logInfo(`${BUNDLE}CommodityText_0078 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0079
     * @tc.name      PageLoading_CommodityText_0079
     * @tc.desc      commodityText(id=-1, title="A") returns "-1  A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0079 begin`);
      const actual: string = commodityText(-1, 'A');
      logInfo(`commodityText(id=-1, title="A"): actual=${actual}`);
      expect(actual).assertEqual('-1  A');
      logInfo(`${BUNDLE}CommodityText_0079 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0080
     * @tc.name      PageLoading_CommodityText_0080
     * @tc.desc      commodityText(id=-1, title="Sample Title 123") returns "-1  Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0080 begin`);
      const actual: string = commodityText(-1, 'Sample Title 123');
      logInfo(`commodityText(id=-1, title="Sample Title ...: actual=${actual}`);
      expect(actual).assertEqual('-1  Sample Title 123');
      logInfo(`${BUNDLE}CommodityText_0080 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0081
     * @tc.name      PageLoading_CommodityText_0081
     * @tc.desc      commodityText(id=-1, title="??") returns "-1  ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0081 begin`);
      const actual: string = commodityText(-1, '\u4e2d\u6587');
      logInfo(`commodityText(id=-1, title="??"): actual=${actual}`);
      expect(actual).assertEqual('-1  \u4e2d\u6587');
      logInfo(`${BUNDLE}CommodityText_0081 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0082
     * @tc.name      PageLoading_CommodityText_0082
     * @tc.desc      commodityText(id=-1, title="a") returns "-1  a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0082 begin`);
      const actual: string = commodityText(-1, 'a');
      logInfo(`commodityText(id=-1, title="a"): actual=${actual}`);
      expect(actual).assertEqual('-1  a');
      logInfo(`${BUNDLE}CommodityText_0082 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0083
     * @tc.name      PageLoading_CommodityText_0083
     * @tc.desc      commodityText(id=-1, title="abc") returns "-1  abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0083 begin`);
      const actual: string = commodityText(-1, 'abc');
      logInfo(`commodityText(id=-1, title="abc"): actual=${actual}`);
      expect(actual).assertEqual('-1  abc');
      logInfo(`${BUNDLE}CommodityText_0083 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0084
     * @tc.name      PageLoading_CommodityText_0084
     * @tc.desc      commodityText(id=-1, title="Hello World") returns "-1  Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0084 begin`);
      const actual: string = commodityText(-1, 'Hello World');
      logInfo(`commodityText(id=-1, title="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('-1  Hello World');
      logInfo(`${BUNDLE}CommodityText_0084 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0085
     * @tc.name      PageLoading_CommodityText_0085
     * @tc.desc      commodityText(id=-1, title="123") returns "-1  123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0085 begin`);
      const actual: string = commodityText(-1, '123');
      logInfo(`commodityText(id=-1, title="123"): actual=${actual}`);
      expect(actual).assertEqual('-1  123');
      logInfo(`${BUNDLE}CommodityText_0085 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0086
     * @tc.name      PageLoading_CommodityText_0086
     * @tc.desc      commodityText(id=-1, title="    ") returns "-1      "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0086 begin`);
      const actual: string = commodityText(-1, '    ');
      logInfo(`commodityText(id=-1, title="    "): actual=${actual}`);
      expect(actual).assertEqual('-1      ');
      logInfo(`${BUNDLE}CommodityText_0086 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0087
     * @tc.name      PageLoading_CommodityText_0087
     * @tc.desc      commodityText(id=-1, title="  _1") returns "-1    _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0087 begin`);
      const actual: string = commodityText(-1, '  _1');
      logInfo(`commodityText(id=-1, title="  _1"): actual=${actual}`);
      expect(actual).assertEqual('-1    _1');
      logInfo(`${BUNDLE}CommodityText_0087 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0088
     * @tc.name      PageLoading_CommodityText_0088
     * @tc.desc      commodityText(id=-1, title="x  ") returns "-1  x  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0088 begin`);
      const actual: string = commodityText(-1, 'x  ');
      logInfo(`commodityText(id=-1, title="x  "): actual=${actual}`);
      expect(actual).assertEqual('-1  x  ');
      logInfo(`${BUNDLE}CommodityText_0088 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0089
     * @tc.name      PageLoading_CommodityText_0089
     * @tc.desc      commodityText(id=-1, title="   ") returns "-1     "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0089 begin`);
      const actual: string = commodityText(-1, '   ');
      logInfo(`commodityText(id=-1, title="   "): actual=${actual}`);
      expect(actual).assertEqual('-1     ');
      logInfo(`${BUNDLE}CommodityText_0089 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0090
     * @tc.name      PageLoading_CommodityText_0090
     * @tc.desc      commodityText(id=-1, title=" _1") returns "-1   _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0090 begin`);
      const actual: string = commodityText(-1, ' _1');
      logInfo(`commodityText(id=-1, title=" _1"): actual=${actual}`);
      expect(actual).assertEqual('-1   _1');
      logInfo(`${BUNDLE}CommodityText_0090 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0091
     * @tc.name      PageLoading_CommodityText_0091
     * @tc.desc      commodityText(id=-1, title="x ") returns "-1  x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0091 begin`);
      const actual: string = commodityText(-1, 'x ');
      logInfo(`commodityText(id=-1, title="x "): actual=${actual}`);
      expect(actual).assertEqual('-1  x ');
      logInfo(`${BUNDLE}CommodityText_0091 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0092
     * @tc.name      PageLoading_CommodityText_0092
     * @tc.desc      commodityText(id=-1, title="   x ") returns "-1     x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0092 begin`);
      const actual: string = commodityText(-1, '   x ');
      logInfo(`commodityText(id=-1, title="   x "): actual=${actual}`);
      expect(actual).assertEqual('-1     x ');
      logInfo(`${BUNDLE}CommodityText_0092 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0093
     * @tc.name      PageLoading_CommodityText_0093
     * @tc.desc      commodityText(id=-1, title="  x  x") returns "-1    x  x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0093 begin`);
      const actual: string = commodityText(-1, '  x  x');
      logInfo(`commodityText(id=-1, title="  x  x"): actual=${actual}`);
      expect(actual).assertEqual('-1    x  x');
      logInfo(`${BUNDLE}CommodityText_0093 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0094
     * @tc.name      PageLoading_CommodityText_0094
     * @tc.desc      commodityText(id=-1, title="  x_1") returns "-1    x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0094 begin`);
      const actual: string = commodityText(-1, '  x_1');
      logInfo(`commodityText(id=-1, title="  x_1"): actual=${actual}`);
      expect(actual).assertEqual('-1    x_1');
      logInfo(`${BUNDLE}CommodityText_0094 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0095
     * @tc.name      PageLoading_CommodityText_0095
     * @tc.desc      commodityText(id=-1, title="x  x") returns "-1  x  x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0095 begin`);
      const actual: string = commodityText(-1, 'x  x');
      logInfo(`commodityText(id=-1, title="x  x"): actual=${actual}`);
      expect(actual).assertEqual('-1  x  x');
      logInfo(`${BUNDLE}CommodityText_0095 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITY_TEXT_0096
     * @tc.name      PageLoading_CommodityText_0096
     * @tc.desc      commodityText(id=-1, title=" Hello ") returns "-1   Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_CommodityText_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CommodityText_0096 begin`);
      const actual: string = commodityText(-1, ' Hello ');
      logInfo(`commodityText(id=-1, title=" Hello "): actual=${actual}`);
      expect(actual).assertEqual('-1   Hello ');
      logInfo(`${BUNDLE}CommodityText_0096 end`);
    });
  });
}
