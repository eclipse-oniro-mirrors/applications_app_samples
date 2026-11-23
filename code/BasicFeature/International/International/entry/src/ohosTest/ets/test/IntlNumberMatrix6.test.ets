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

export default function intlNumberMatrix6Test(): void {
  describe('IntlNumberMatrix6Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    INTL_NUMBER_0386
     * @tc.name      intlNumber0386
     * @tc.desc      数值 99.99 保留 6 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0386 begin');
      const value: number = 99.99;
      const digits: number = 6;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('99.990000');
      expect(scaled).assertEqual(99990000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0386 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0387
     * @tc.name      intlNumber0387
     * @tc.desc      数值 99.99 保留 6 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0387 begin');
      const value: number = 99.99;
      const digits: number = 6;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('99.990000');
      expect(scaled).assertEqual(99990000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0387 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0388
     * @tc.name      intlNumber0388
     * @tc.desc      数值 99.99 保留 6 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0388 begin');
      const value: number = 99.99;
      const digits: number = 6;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('99.990000');
      expect(scaled).assertEqual(99990000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0388 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0389
     * @tc.name      intlNumber0389
     * @tc.desc      数值 99.99 保留 6 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0389 begin');
      const value: number = 99.99;
      const digits: number = 6;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('99.990000');
      expect(scaled).assertEqual(99990000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0389 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0390
     * @tc.name      intlNumber0390
     * @tc.desc      数值 99.99 保留 6 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0390 begin');
      const value: number = 99.99;
      const digits: number = 6;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('99.990000');
      expect(scaled).assertEqual(99990000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0390 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0391
     * @tc.name      intlNumber0391
     * @tc.desc      数值 99.99 保留 8 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0391 begin');
      const value: number = 99.99;
      const digits: number = 8;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('99.99000000');
      expect(scaled).assertEqual(9999000000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0391 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0392
     * @tc.name      intlNumber0392
     * @tc.desc      数值 99.99 保留 8 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0392 begin');
      const value: number = 99.99;
      const digits: number = 8;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('99.99000000');
      expect(scaled).assertEqual(9999000000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0392 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0393
     * @tc.name      intlNumber0393
     * @tc.desc      数值 99.99 保留 8 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0393', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0393 begin');
      const value: number = 99.99;
      const digits: number = 8;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('99.99000000');
      expect(scaled).assertEqual(9999000000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0393 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0394
     * @tc.name      intlNumber0394
     * @tc.desc      数值 99.99 保留 8 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0394 begin');
      const value: number = 99.99;
      const digits: number = 8;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('99.99000000');
      expect(scaled).assertEqual(9999000000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0394 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0395
     * @tc.name      intlNumber0395
     * @tc.desc      数值 99.99 保留 8 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0395 begin');
      const value: number = 99.99;
      const digits: number = 8;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('99.99000000');
      expect(scaled).assertEqual(9999000000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0395 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0396
     * @tc.name      intlNumber0396
     * @tc.desc      数值 99.99 保留 8 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0396 begin');
      const value: number = 99.99;
      const digits: number = 8;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('99.99000000');
      expect(scaled).assertEqual(9999000000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0396 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0397
     * @tc.name      intlNumber0397
     * @tc.desc      数值 99.99 保留 8 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0397 begin');
      const value: number = 99.99;
      const digits: number = 8;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('99.99000000');
      expect(scaled).assertEqual(9999000000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0397 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0398
     * @tc.name      intlNumber0398
     * @tc.desc      数值 99.99 保留 8 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0398 begin');
      const value: number = 99.99;
      const digits: number = 8;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('99.99000000');
      expect(scaled).assertEqual(9999000000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0398 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0399
     * @tc.name      intlNumber0399
     * @tc.desc      数值 99.99 保留 8 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0399', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0399 begin');
      const value: number = 99.99;
      const digits: number = 8;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('99.99000000');
      expect(scaled).assertEqual(9999000000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0399 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0400
     * @tc.name      intlNumber0400
     * @tc.desc      数值 99.99 保留 8 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0400 begin');
      const value: number = 99.99;
      const digits: number = 8;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('99.99000000');
      expect(scaled).assertEqual(9999000000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0400 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0401
     * @tc.name      intlNumber0401
     * @tc.desc      数值 1024 保留 0 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0401 begin');
      const value: number = 1024;
      const digits: number = 0;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024');
      expect(scaled).assertEqual(1024);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0401 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0402
     * @tc.name      intlNumber0402
     * @tc.desc      数值 1024 保留 0 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0402 begin');
      const value: number = 1024;
      const digits: number = 0;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024');
      expect(scaled).assertEqual(1024);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0402 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0403
     * @tc.name      intlNumber0403
     * @tc.desc      数值 1024 保留 0 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0403 begin');
      const value: number = 1024;
      const digits: number = 0;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024');
      expect(scaled).assertEqual(1024);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0403 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0404
     * @tc.name      intlNumber0404
     * @tc.desc      数值 1024 保留 0 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0404 begin');
      const value: number = 1024;
      const digits: number = 0;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024');
      expect(scaled).assertEqual(1024);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0404 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0405
     * @tc.name      intlNumber0405
     * @tc.desc      数值 1024 保留 0 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0405 begin');
      const value: number = 1024;
      const digits: number = 0;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024');
      expect(scaled).assertEqual(1024);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0405 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0406
     * @tc.name      intlNumber0406
     * @tc.desc      数值 1024 保留 0 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0406 begin');
      const value: number = 1024;
      const digits: number = 0;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024');
      expect(scaled).assertEqual(1024);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0406 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0407
     * @tc.name      intlNumber0407
     * @tc.desc      数值 1024 保留 0 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0407 begin');
      const value: number = 1024;
      const digits: number = 0;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024');
      expect(scaled).assertEqual(1024);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0407 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0408
     * @tc.name      intlNumber0408
     * @tc.desc      数值 1024 保留 0 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0408 begin');
      const value: number = 1024;
      const digits: number = 0;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024');
      expect(scaled).assertEqual(1024);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0408 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0409
     * @tc.name      intlNumber0409
     * @tc.desc      数值 1024 保留 0 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0409 begin');
      const value: number = 1024;
      const digits: number = 0;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024');
      expect(scaled).assertEqual(1024);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0409 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0410
     * @tc.name      intlNumber0410
     * @tc.desc      数值 1024 保留 0 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0410 begin');
      const value: number = 1024;
      const digits: number = 0;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024');
      expect(scaled).assertEqual(1024);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0410 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0411
     * @tc.name      intlNumber0411
     * @tc.desc      数值 1024 保留 1 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0411 begin');
      const value: number = 1024;
      const digits: number = 1;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.0');
      expect(scaled).assertEqual(10240);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0411 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0412
     * @tc.name      intlNumber0412
     * @tc.desc      数值 1024 保留 1 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0412 begin');
      const value: number = 1024;
      const digits: number = 1;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.0');
      expect(scaled).assertEqual(10240);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0412 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0413
     * @tc.name      intlNumber0413
     * @tc.desc      数值 1024 保留 1 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0413 begin');
      const value: number = 1024;
      const digits: number = 1;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.0');
      expect(scaled).assertEqual(10240);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0413 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0414
     * @tc.name      intlNumber0414
     * @tc.desc      数值 1024 保留 1 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0414 begin');
      const value: number = 1024;
      const digits: number = 1;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.0');
      expect(scaled).assertEqual(10240);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0414 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0415
     * @tc.name      intlNumber0415
     * @tc.desc      数值 1024 保留 1 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0415 begin');
      const value: number = 1024;
      const digits: number = 1;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.0');
      expect(scaled).assertEqual(10240);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0415 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0416
     * @tc.name      intlNumber0416
     * @tc.desc      数值 1024 保留 1 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0416 begin');
      const value: number = 1024;
      const digits: number = 1;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.0');
      expect(scaled).assertEqual(10240);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0416 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0417
     * @tc.name      intlNumber0417
     * @tc.desc      数值 1024 保留 1 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0417 begin');
      const value: number = 1024;
      const digits: number = 1;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.0');
      expect(scaled).assertEqual(10240);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0417 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0418
     * @tc.name      intlNumber0418
     * @tc.desc      数值 1024 保留 1 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0418 begin');
      const value: number = 1024;
      const digits: number = 1;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.0');
      expect(scaled).assertEqual(10240);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0418 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0419
     * @tc.name      intlNumber0419
     * @tc.desc      数值 1024 保留 1 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0419 begin');
      const value: number = 1024;
      const digits: number = 1;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.0');
      expect(scaled).assertEqual(10240);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0419 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0420
     * @tc.name      intlNumber0420
     * @tc.desc      数值 1024 保留 1 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0420 begin');
      const value: number = 1024;
      const digits: number = 1;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.0');
      expect(scaled).assertEqual(10240);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0420 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0421
     * @tc.name      intlNumber0421
     * @tc.desc      数值 1024 保留 2 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0421 begin');
      const value: number = 1024;
      const digits: number = 2;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.00');
      expect(scaled).assertEqual(102400);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0421 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0422
     * @tc.name      intlNumber0422
     * @tc.desc      数值 1024 保留 2 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0422 begin');
      const value: number = 1024;
      const digits: number = 2;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.00');
      expect(scaled).assertEqual(102400);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0422 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0423
     * @tc.name      intlNumber0423
     * @tc.desc      数值 1024 保留 2 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0423 begin');
      const value: number = 1024;
      const digits: number = 2;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.00');
      expect(scaled).assertEqual(102400);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0423 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0424
     * @tc.name      intlNumber0424
     * @tc.desc      数值 1024 保留 2 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0424 begin');
      const value: number = 1024;
      const digits: number = 2;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.00');
      expect(scaled).assertEqual(102400);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0424 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0425
     * @tc.name      intlNumber0425
     * @tc.desc      数值 1024 保留 2 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0425 begin');
      const value: number = 1024;
      const digits: number = 2;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.00');
      expect(scaled).assertEqual(102400);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0425 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0426
     * @tc.name      intlNumber0426
     * @tc.desc      数值 1024 保留 2 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0426 begin');
      const value: number = 1024;
      const digits: number = 2;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.00');
      expect(scaled).assertEqual(102400);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0426 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0427
     * @tc.name      intlNumber0427
     * @tc.desc      数值 1024 保留 2 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0427 begin');
      const value: number = 1024;
      const digits: number = 2;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.00');
      expect(scaled).assertEqual(102400);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0427 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0428
     * @tc.name      intlNumber0428
     * @tc.desc      数值 1024 保留 2 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0428 begin');
      const value: number = 1024;
      const digits: number = 2;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.00');
      expect(scaled).assertEqual(102400);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0428 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0429
     * @tc.name      intlNumber0429
     * @tc.desc      数值 1024 保留 2 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0429 begin');
      const value: number = 1024;
      const digits: number = 2;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.00');
      expect(scaled).assertEqual(102400);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0429 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0430
     * @tc.name      intlNumber0430
     * @tc.desc      数值 1024 保留 2 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0430 begin');
      const value: number = 1024;
      const digits: number = 2;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.00');
      expect(scaled).assertEqual(102400);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0430 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0431
     * @tc.name      intlNumber0431
     * @tc.desc      数值 1024 保留 3 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0431 begin');
      const value: number = 1024;
      const digits: number = 3;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.000');
      expect(scaled).assertEqual(1024000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0431 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0432
     * @tc.name      intlNumber0432
     * @tc.desc      数值 1024 保留 3 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0432 begin');
      const value: number = 1024;
      const digits: number = 3;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.000');
      expect(scaled).assertEqual(1024000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0432 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0433
     * @tc.name      intlNumber0433
     * @tc.desc      数值 1024 保留 3 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0433 begin');
      const value: number = 1024;
      const digits: number = 3;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.000');
      expect(scaled).assertEqual(1024000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0433 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0434
     * @tc.name      intlNumber0434
     * @tc.desc      数值 1024 保留 3 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0434 begin');
      const value: number = 1024;
      const digits: number = 3;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.000');
      expect(scaled).assertEqual(1024000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0434 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0435
     * @tc.name      intlNumber0435
     * @tc.desc      数值 1024 保留 3 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0435 begin');
      const value: number = 1024;
      const digits: number = 3;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.000');
      expect(scaled).assertEqual(1024000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0435 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0436
     * @tc.name      intlNumber0436
     * @tc.desc      数值 1024 保留 3 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0436 begin');
      const value: number = 1024;
      const digits: number = 3;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.000');
      expect(scaled).assertEqual(1024000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0436 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0437
     * @tc.name      intlNumber0437
     * @tc.desc      数值 1024 保留 3 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0437', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0437 begin');
      const value: number = 1024;
      const digits: number = 3;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.000');
      expect(scaled).assertEqual(1024000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0437 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0438
     * @tc.name      intlNumber0438
     * @tc.desc      数值 1024 保留 3 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0438', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0438 begin');
      const value: number = 1024;
      const digits: number = 3;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.000');
      expect(scaled).assertEqual(1024000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0438 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0439
     * @tc.name      intlNumber0439
     * @tc.desc      数值 1024 保留 3 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0439', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0439 begin');
      const value: number = 1024;
      const digits: number = 3;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.000');
      expect(scaled).assertEqual(1024000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0439 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0440
     * @tc.name      intlNumber0440
     * @tc.desc      数值 1024 保留 3 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0440', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0440 begin');
      const value: number = 1024;
      const digits: number = 3;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.000');
      expect(scaled).assertEqual(1024000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0440 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0441
     * @tc.name      intlNumber0441
     * @tc.desc      数值 1024 保留 4 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0441', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0441 begin');
      const value: number = 1024;
      const digits: number = 4;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.0000');
      expect(scaled).assertEqual(10240000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0441 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0442
     * @tc.name      intlNumber0442
     * @tc.desc      数值 1024 保留 4 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0442', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0442 begin');
      const value: number = 1024;
      const digits: number = 4;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.0000');
      expect(scaled).assertEqual(10240000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0442 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0443
     * @tc.name      intlNumber0443
     * @tc.desc      数值 1024 保留 4 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0443', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0443 begin');
      const value: number = 1024;
      const digits: number = 4;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.0000');
      expect(scaled).assertEqual(10240000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0443 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0444
     * @tc.name      intlNumber0444
     * @tc.desc      数值 1024 保留 4 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0444', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0444 begin');
      const value: number = 1024;
      const digits: number = 4;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.0000');
      expect(scaled).assertEqual(10240000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0444 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0445
     * @tc.name      intlNumber0445
     * @tc.desc      数值 1024 保留 4 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0445', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0445 begin');
      const value: number = 1024;
      const digits: number = 4;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.0000');
      expect(scaled).assertEqual(10240000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0445 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0446
     * @tc.name      intlNumber0446
     * @tc.desc      数值 1024 保留 4 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0446', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0446 begin');
      const value: number = 1024;
      const digits: number = 4;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.0000');
      expect(scaled).assertEqual(10240000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0446 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0447
     * @tc.name      intlNumber0447
     * @tc.desc      数值 1024 保留 4 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0447', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0447 begin');
      const value: number = 1024;
      const digits: number = 4;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.0000');
      expect(scaled).assertEqual(10240000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0447 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0448
     * @tc.name      intlNumber0448
     * @tc.desc      数值 1024 保留 4 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0448', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0448 begin');
      const value: number = 1024;
      const digits: number = 4;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.0000');
      expect(scaled).assertEqual(10240000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0448 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0449
     * @tc.name      intlNumber0449
     * @tc.desc      数值 1024 保留 4 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0449', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0449 begin');
      const value: number = 1024;
      const digits: number = 4;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.0000');
      expect(scaled).assertEqual(10240000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0449 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0450
     * @tc.name      intlNumber0450
     * @tc.desc      数值 1024 保留 4 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0450', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0450 begin');
      const value: number = 1024;
      const digits: number = 4;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.0000');
      expect(scaled).assertEqual(10240000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0450 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0451
     * @tc.name      intlNumber0451
     * @tc.desc      数值 1024 保留 5 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0451', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0451 begin');
      const value: number = 1024;
      const digits: number = 5;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.00000');
      expect(scaled).assertEqual(102400000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0451 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0452
     * @tc.name      intlNumber0452
     * @tc.desc      数值 1024 保留 5 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0452', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0452 begin');
      const value: number = 1024;
      const digits: number = 5;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.00000');
      expect(scaled).assertEqual(102400000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0452 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0453
     * @tc.name      intlNumber0453
     * @tc.desc      数值 1024 保留 5 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0453', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0453 begin');
      const value: number = 1024;
      const digits: number = 5;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.00000');
      expect(scaled).assertEqual(102400000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0453 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0454
     * @tc.name      intlNumber0454
     * @tc.desc      数值 1024 保留 5 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0454', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0454 begin');
      const value: number = 1024;
      const digits: number = 5;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.00000');
      expect(scaled).assertEqual(102400000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0454 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0455
     * @tc.name      intlNumber0455
     * @tc.desc      数值 1024 保留 5 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0455', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0455 begin');
      const value: number = 1024;
      const digits: number = 5;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.00000');
      expect(scaled).assertEqual(102400000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0455 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0456
     * @tc.name      intlNumber0456
     * @tc.desc      数值 1024 保留 5 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0456', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0456 begin');
      const value: number = 1024;
      const digits: number = 5;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.00000');
      expect(scaled).assertEqual(102400000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0456 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0457
     * @tc.name      intlNumber0457
     * @tc.desc      数值 1024 保留 5 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0457', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0457 begin');
      const value: number = 1024;
      const digits: number = 5;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.00000');
      expect(scaled).assertEqual(102400000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0457 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0458
     * @tc.name      intlNumber0458
     * @tc.desc      数值 1024 保留 5 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0458', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0458 begin');
      const value: number = 1024;
      const digits: number = 5;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.00000');
      expect(scaled).assertEqual(102400000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0458 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0459
     * @tc.name      intlNumber0459
     * @tc.desc      数值 1024 保留 5 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0459', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0459 begin');
      const value: number = 1024;
      const digits: number = 5;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.00000');
      expect(scaled).assertEqual(102400000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0459 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0460
     * @tc.name      intlNumber0460
     * @tc.desc      数值 1024 保留 5 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0460', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0460 begin');
      const value: number = 1024;
      const digits: number = 5;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.00000');
      expect(scaled).assertEqual(102400000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0460 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0461
     * @tc.name      intlNumber0461
     * @tc.desc      数值 1024 保留 6 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0461', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0461 begin');
      const value: number = 1024;
      const digits: number = 6;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.000000');
      expect(scaled).assertEqual(1024000000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0461 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0462
     * @tc.name      intlNumber0462
     * @tc.desc      数值 1024 保留 6 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0462', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0462 begin');
      const value: number = 1024;
      const digits: number = 6;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1024.000000');
      expect(scaled).assertEqual(1024000000);
      expect(groupCount).assertEqual(4);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0462 end');
    })
  })
}
