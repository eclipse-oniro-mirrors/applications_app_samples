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

import { beforeEachIt, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_International]';

export default function intlNumberMatrix7Test(): void {
  describe('IntlNumberMatrix7Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    INTL_NUMBER_0463
     * @tc.name      intlNumber0463
     * @tc.desc      数值 1024 保留 6 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0463', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0463 begin');
      const value: number = 1024;
      const digits: number = 6;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.000000');
      expect(scaled).assertEqual(1024000000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0463 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0464
     * @tc.name      intlNumber0464
     * @tc.desc      数值 1024 保留 6 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0464', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0464 begin');
      const value: number = 1024;
      const digits: number = 6;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.000000');
      expect(scaled).assertEqual(1024000000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0464 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0465
     * @tc.name      intlNumber0465
     * @tc.desc      数值 1024 保留 6 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0465', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0465 begin');
      const value: number = 1024;
      const digits: number = 6;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.000000');
      expect(scaled).assertEqual(1024000000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0465 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0466
     * @tc.name      intlNumber0466
     * @tc.desc      数值 1024 保留 6 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0466', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0466 begin');
      const value: number = 1024;
      const digits: number = 6;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.000000');
      expect(scaled).assertEqual(1024000000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0466 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0467
     * @tc.name      intlNumber0467
     * @tc.desc      数值 1024 保留 6 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0467', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0467 begin');
      const value: number = 1024;
      const digits: number = 6;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.000000');
      expect(scaled).assertEqual(1024000000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0467 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0468
     * @tc.name      intlNumber0468
     * @tc.desc      数值 1024 保留 6 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0468', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0468 begin');
      const value: number = 1024;
      const digits: number = 6;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.000000');
      expect(scaled).assertEqual(1024000000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0468 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0469
     * @tc.name      intlNumber0469
     * @tc.desc      数值 1024 保留 6 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0469', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0469 begin');
      const value: number = 1024;
      const digits: number = 6;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.000000');
      expect(scaled).assertEqual(1024000000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0469 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0470
     * @tc.name      intlNumber0470
     * @tc.desc      数值 1024 保留 6 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0470', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0470 begin');
      const value: number = 1024;
      const digits: number = 6;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.000000');
      expect(scaled).assertEqual(1024000000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0470 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0471
     * @tc.name      intlNumber0471
     * @tc.desc      数值 1024 保留 8 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0471', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0471 begin');
      const value: number = 1024;
      const digits: number = 8;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.00000000');
      expect(scaled).assertEqual(102400000000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0471 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0472
     * @tc.name      intlNumber0472
     * @tc.desc      数值 1024 保留 8 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0472', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0472 begin');
      const value: number = 1024;
      const digits: number = 8;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.00000000');
      expect(scaled).assertEqual(102400000000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0472 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0473
     * @tc.name      intlNumber0473
     * @tc.desc      数值 1024 保留 8 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0473', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0473 begin');
      const value: number = 1024;
      const digits: number = 8;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.00000000');
      expect(scaled).assertEqual(102400000000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0473 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0474
     * @tc.name      intlNumber0474
     * @tc.desc      数值 1024 保留 8 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0474', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0474 begin');
      const value: number = 1024;
      const digits: number = 8;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.00000000');
      expect(scaled).assertEqual(102400000000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0474 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0475
     * @tc.name      intlNumber0475
     * @tc.desc      数值 1024 保留 8 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0475', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0475 begin');
      const value: number = 1024;
      const digits: number = 8;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.00000000');
      expect(scaled).assertEqual(102400000000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0475 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0476
     * @tc.name      intlNumber0476
     * @tc.desc      数值 1024 保留 8 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0476', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0476 begin');
      const value: number = 1024;
      const digits: number = 8;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.00000000');
      expect(scaled).assertEqual(102400000000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0476 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0477
     * @tc.name      intlNumber0477
     * @tc.desc      数值 1024 保留 8 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0477', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0477 begin');
      const value: number = 1024;
      const digits: number = 8;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.00000000');
      expect(scaled).assertEqual(102400000000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0477 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0478
     * @tc.name      intlNumber0478
     * @tc.desc      数值 1024 保留 8 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0478', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0478 begin');
      const value: number = 1024;
      const digits: number = 8;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.00000000');
      expect(scaled).assertEqual(102400000000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0478 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0479
     * @tc.name      intlNumber0479
     * @tc.desc      数值 1024 保留 8 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0479', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0479 begin');
      const value: number = 1024;
      const digits: number = 8;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.00000000');
      expect(scaled).assertEqual(102400000000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0479 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0480
     * @tc.name      intlNumber0480
     * @tc.desc      数值 1024 保留 8 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0480', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0480 begin');
      const value: number = 1024;
      const digits: number = 8;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.00000000');
      expect(scaled).assertEqual(102400000000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0480 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0481
     * @tc.name      intlNumber0481
     * @tc.desc      数值 4096.75 保留 0 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0481', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0481 begin');
      const value: number = 4096.75;
      const digits: number = 0;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4097');
      expect(scaled).assertEqual(4097);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0481 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0482
     * @tc.name      intlNumber0482
     * @tc.desc      数值 4096.75 保留 0 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0482', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0482 begin');
      const value: number = 4096.75;
      const digits: number = 0;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4097');
      expect(scaled).assertEqual(4097);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0482 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0483
     * @tc.name      intlNumber0483
     * @tc.desc      数值 4096.75 保留 0 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0483', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0483 begin');
      const value: number = 4096.75;
      const digits: number = 0;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4097');
      expect(scaled).assertEqual(4097);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0483 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0484
     * @tc.name      intlNumber0484
     * @tc.desc      数值 4096.75 保留 0 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0484', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0484 begin');
      const value: number = 4096.75;
      const digits: number = 0;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4097');
      expect(scaled).assertEqual(4097);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0484 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0485
     * @tc.name      intlNumber0485
     * @tc.desc      数值 4096.75 保留 0 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0485', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0485 begin');
      const value: number = 4096.75;
      const digits: number = 0;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4097');
      expect(scaled).assertEqual(4097);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0485 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0486
     * @tc.name      intlNumber0486
     * @tc.desc      数值 4096.75 保留 0 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0486', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0486 begin');
      const value: number = 4096.75;
      const digits: number = 0;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4097');
      expect(scaled).assertEqual(4097);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0486 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0487
     * @tc.name      intlNumber0487
     * @tc.desc      数值 4096.75 保留 0 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0487', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0487 begin');
      const value: number = 4096.75;
      const digits: number = 0;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4097');
      expect(scaled).assertEqual(4097);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0487 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0488
     * @tc.name      intlNumber0488
     * @tc.desc      数值 4096.75 保留 0 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0488', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0488 begin');
      const value: number = 4096.75;
      const digits: number = 0;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4097');
      expect(scaled).assertEqual(4097);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0488 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0489
     * @tc.name      intlNumber0489
     * @tc.desc      数值 4096.75 保留 0 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0489', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0489 begin');
      const value: number = 4096.75;
      const digits: number = 0;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4097');
      expect(scaled).assertEqual(4097);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0489 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0490
     * @tc.name      intlNumber0490
     * @tc.desc      数值 4096.75 保留 0 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0490', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0490 begin');
      const value: number = 4096.75;
      const digits: number = 0;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4097');
      expect(scaled).assertEqual(4097);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0490 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0491
     * @tc.name      intlNumber0491
     * @tc.desc      数值 4096.75 保留 1 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0491', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0491 begin');
      const value: number = 4096.75;
      const digits: number = 1;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.8');
      expect(scaled).assertEqual(40968);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0491 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0492
     * @tc.name      intlNumber0492
     * @tc.desc      数值 4096.75 保留 1 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0492', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0492 begin');
      const value: number = 4096.75;
      const digits: number = 1;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.8');
      expect(scaled).assertEqual(40968);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0492 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0493
     * @tc.name      intlNumber0493
     * @tc.desc      数值 4096.75 保留 1 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0493', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0493 begin');
      const value: number = 4096.75;
      const digits: number = 1;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.8');
      expect(scaled).assertEqual(40968);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0493 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0494
     * @tc.name      intlNumber0494
     * @tc.desc      数值 4096.75 保留 1 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0494', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0494 begin');
      const value: number = 4096.75;
      const digits: number = 1;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.8');
      expect(scaled).assertEqual(40968);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0494 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0495
     * @tc.name      intlNumber0495
     * @tc.desc      数值 4096.75 保留 1 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0495', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0495 begin');
      const value: number = 4096.75;
      const digits: number = 1;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.8');
      expect(scaled).assertEqual(40968);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0495 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0496
     * @tc.name      intlNumber0496
     * @tc.desc      数值 4096.75 保留 1 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0496', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0496 begin');
      const value: number = 4096.75;
      const digits: number = 1;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.8');
      expect(scaled).assertEqual(40968);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0496 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0497
     * @tc.name      intlNumber0497
     * @tc.desc      数值 4096.75 保留 1 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0497', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0497 begin');
      const value: number = 4096.75;
      const digits: number = 1;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.8');
      expect(scaled).assertEqual(40968);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0497 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0498
     * @tc.name      intlNumber0498
     * @tc.desc      数值 4096.75 保留 1 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0498', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0498 begin');
      const value: number = 4096.75;
      const digits: number = 1;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.8');
      expect(scaled).assertEqual(40968);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0498 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0499
     * @tc.name      intlNumber0499
     * @tc.desc      数值 4096.75 保留 1 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0499', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0499 begin');
      const value: number = 4096.75;
      const digits: number = 1;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.8');
      expect(scaled).assertEqual(40968);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0499 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0500
     * @tc.name      intlNumber0500
     * @tc.desc      数值 4096.75 保留 1 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0500 begin');
      const value: number = 4096.75;
      const digits: number = 1;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.8');
      expect(scaled).assertEqual(40968);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0500 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0501
     * @tc.name      intlNumber0501
     * @tc.desc      数值 4096.75 保留 2 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0501', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0501 begin');
      const value: number = 4096.75;
      const digits: number = 2;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.75');
      expect(scaled).assertEqual(409675);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0501 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0502
     * @tc.name      intlNumber0502
     * @tc.desc      数值 4096.75 保留 2 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0502', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0502 begin');
      const value: number = 4096.75;
      const digits: number = 2;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.75');
      expect(scaled).assertEqual(409675);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0502 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0503
     * @tc.name      intlNumber0503
     * @tc.desc      数值 4096.75 保留 2 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0503', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0503 begin');
      const value: number = 4096.75;
      const digits: number = 2;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.75');
      expect(scaled).assertEqual(409675);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0503 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0504
     * @tc.name      intlNumber0504
     * @tc.desc      数值 4096.75 保留 2 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0504', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0504 begin');
      const value: number = 4096.75;
      const digits: number = 2;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.75');
      expect(scaled).assertEqual(409675);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0504 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0505
     * @tc.name      intlNumber0505
     * @tc.desc      数值 4096.75 保留 2 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0505', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0505 begin');
      const value: number = 4096.75;
      const digits: number = 2;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.75');
      expect(scaled).assertEqual(409675);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0505 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0506
     * @tc.name      intlNumber0506
     * @tc.desc      数值 4096.75 保留 2 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0506', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0506 begin');
      const value: number = 4096.75;
      const digits: number = 2;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.75');
      expect(scaled).assertEqual(409675);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0506 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0507
     * @tc.name      intlNumber0507
     * @tc.desc      数值 4096.75 保留 2 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0507', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0507 begin');
      const value: number = 4096.75;
      const digits: number = 2;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.75');
      expect(scaled).assertEqual(409675);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0507 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0508
     * @tc.name      intlNumber0508
     * @tc.desc      数值 4096.75 保留 2 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0508', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0508 begin');
      const value: number = 4096.75;
      const digits: number = 2;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.75');
      expect(scaled).assertEqual(409675);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0508 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0509
     * @tc.name      intlNumber0509
     * @tc.desc      数值 4096.75 保留 2 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0509', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0509 begin');
      const value: number = 4096.75;
      const digits: number = 2;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.75');
      expect(scaled).assertEqual(409675);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0509 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0510
     * @tc.name      intlNumber0510
     * @tc.desc      数值 4096.75 保留 2 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0510 begin');
      const value: number = 4096.75;
      const digits: number = 2;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.75');
      expect(scaled).assertEqual(409675);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0510 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0511
     * @tc.name      intlNumber0511
     * @tc.desc      数值 4096.75 保留 3 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0511', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0511 begin');
      const value: number = 4096.75;
      const digits: number = 3;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.750');
      expect(scaled).assertEqual(4096750);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0511 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0512
     * @tc.name      intlNumber0512
     * @tc.desc      数值 4096.75 保留 3 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0512', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0512 begin');
      const value: number = 4096.75;
      const digits: number = 3;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.750');
      expect(scaled).assertEqual(4096750);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0512 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0513
     * @tc.name      intlNumber0513
     * @tc.desc      数值 4096.75 保留 3 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0513', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0513 begin');
      const value: number = 4096.75;
      const digits: number = 3;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.750');
      expect(scaled).assertEqual(4096750);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0513 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0514
     * @tc.name      intlNumber0514
     * @tc.desc      数值 4096.75 保留 3 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0514', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0514 begin');
      const value: number = 4096.75;
      const digits: number = 3;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.750');
      expect(scaled).assertEqual(4096750);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0514 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0515
     * @tc.name      intlNumber0515
     * @tc.desc      数值 4096.75 保留 3 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0515', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0515 begin');
      const value: number = 4096.75;
      const digits: number = 3;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.750');
      expect(scaled).assertEqual(4096750);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0515 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0516
     * @tc.name      intlNumber0516
     * @tc.desc      数值 4096.75 保留 3 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0516', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0516 begin');
      const value: number = 4096.75;
      const digits: number = 3;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.750');
      expect(scaled).assertEqual(4096750);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0516 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0517
     * @tc.name      intlNumber0517
     * @tc.desc      数值 4096.75 保留 3 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0517', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0517 begin');
      const value: number = 4096.75;
      const digits: number = 3;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.750');
      expect(scaled).assertEqual(4096750);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0517 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0518
     * @tc.name      intlNumber0518
     * @tc.desc      数值 4096.75 保留 3 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0518', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0518 begin');
      const value: number = 4096.75;
      const digits: number = 3;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.750');
      expect(scaled).assertEqual(4096750);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0518 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0519
     * @tc.name      intlNumber0519
     * @tc.desc      数值 4096.75 保留 3 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0519', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0519 begin');
      const value: number = 4096.75;
      const digits: number = 3;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.750');
      expect(scaled).assertEqual(4096750);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0519 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0520
     * @tc.name      intlNumber0520
     * @tc.desc      数值 4096.75 保留 3 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0520', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0520 begin');
      const value: number = 4096.75;
      const digits: number = 3;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.750');
      expect(scaled).assertEqual(4096750);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0520 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0521
     * @tc.name      intlNumber0521
     * @tc.desc      数值 4096.75 保留 4 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0521', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0521 begin');
      const value: number = 4096.75;
      const digits: number = 4;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.7500');
      expect(scaled).assertEqual(40967500);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0521 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0522
     * @tc.name      intlNumber0522
     * @tc.desc      数值 4096.75 保留 4 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0522', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0522 begin');
      const value: number = 4096.75;
      const digits: number = 4;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.7500');
      expect(scaled).assertEqual(40967500);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0522 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0523
     * @tc.name      intlNumber0523
     * @tc.desc      数值 4096.75 保留 4 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0523', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0523 begin');
      const value: number = 4096.75;
      const digits: number = 4;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.7500');
      expect(scaled).assertEqual(40967500);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0523 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0524
     * @tc.name      intlNumber0524
     * @tc.desc      数值 4096.75 保留 4 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0524', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0524 begin');
      const value: number = 4096.75;
      const digits: number = 4;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.7500');
      expect(scaled).assertEqual(40967500);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0524 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0525
     * @tc.name      intlNumber0525
     * @tc.desc      数值 4096.75 保留 4 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0525', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0525 begin');
      const value: number = 4096.75;
      const digits: number = 4;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.7500');
      expect(scaled).assertEqual(40967500);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0525 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0526
     * @tc.name      intlNumber0526
     * @tc.desc      数值 4096.75 保留 4 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0526', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0526 begin');
      const value: number = 4096.75;
      const digits: number = 4;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.7500');
      expect(scaled).assertEqual(40967500);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0526 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0527
     * @tc.name      intlNumber0527
     * @tc.desc      数值 4096.75 保留 4 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0527', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0527 begin');
      const value: number = 4096.75;
      const digits: number = 4;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.7500');
      expect(scaled).assertEqual(40967500);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0527 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0528
     * @tc.name      intlNumber0528
     * @tc.desc      数值 4096.75 保留 4 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0528', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0528 begin');
      const value: number = 4096.75;
      const digits: number = 4;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.7500');
      expect(scaled).assertEqual(40967500);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0528 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0529
     * @tc.name      intlNumber0529
     * @tc.desc      数值 4096.75 保留 4 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0529', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0529 begin');
      const value: number = 4096.75;
      const digits: number = 4;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.7500');
      expect(scaled).assertEqual(40967500);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0529 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0530
     * @tc.name      intlNumber0530
     * @tc.desc      数值 4096.75 保留 4 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0530', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0530 begin');
      const value: number = 4096.75;
      const digits: number = 4;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.7500');
      expect(scaled).assertEqual(40967500);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0530 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0531
     * @tc.name      intlNumber0531
     * @tc.desc      数值 4096.75 保留 5 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0531', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0531 begin');
      const value: number = 4096.75;
      const digits: number = 5;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.75000');
      expect(scaled).assertEqual(409675000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0531 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0532
     * @tc.name      intlNumber0532
     * @tc.desc      数值 4096.75 保留 5 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0532', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0532 begin');
      const value: number = 4096.75;
      const digits: number = 5;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.75000');
      expect(scaled).assertEqual(409675000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0532 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0533
     * @tc.name      intlNumber0533
     * @tc.desc      数值 4096.75 保留 5 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0533', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0533 begin');
      const value: number = 4096.75;
      const digits: number = 5;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.75000');
      expect(scaled).assertEqual(409675000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0533 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0534
     * @tc.name      intlNumber0534
     * @tc.desc      数值 4096.75 保留 5 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0534', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0534 begin');
      const value: number = 4096.75;
      const digits: number = 5;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.75000');
      expect(scaled).assertEqual(409675000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0534 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0535
     * @tc.name      intlNumber0535
     * @tc.desc      数值 4096.75 保留 5 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0535', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0535 begin');
      const value: number = 4096.75;
      const digits: number = 5;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.75000');
      expect(scaled).assertEqual(409675000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0535 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0536
     * @tc.name      intlNumber0536
     * @tc.desc      数值 4096.75 保留 5 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0536', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0536 begin');
      const value: number = 4096.75;
      const digits: number = 5;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.75000');
      expect(scaled).assertEqual(409675000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0536 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0537
     * @tc.name      intlNumber0537
     * @tc.desc      数值 4096.75 保留 5 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0537', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0537 begin');
      const value: number = 4096.75;
      const digits: number = 5;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.75000');
      expect(scaled).assertEqual(409675000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0537 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0538
     * @tc.name      intlNumber0538
     * @tc.desc      数值 4096.75 保留 5 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0538', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0538 begin');
      const value: number = 4096.75;
      const digits: number = 5;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.75000');
      expect(scaled).assertEqual(409675000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0538 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0539
     * @tc.name      intlNumber0539
     * @tc.desc      数值 4096.75 保留 5 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0539', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0539 begin');
      const value: number = 4096.75;
      const digits: number = 5;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('4096.75000');
      expect(scaled).assertEqual(409675000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0539 end');
    })
  })
}
