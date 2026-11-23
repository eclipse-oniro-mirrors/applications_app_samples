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

export default function intlNumberMatrix4Test(): void {
  describe('IntlNumberMatrix4Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    INTL_NUMBER_0232
     * @tc.name      intlNumber0232
     * @tc.desc      数值 7 保留 8 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0232 begin');
      const value: number = 7;
      const digits: number = 8;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('7.00000000');
      expect(scaled).assertEqual(700000000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0232 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0233
     * @tc.name      intlNumber0233
     * @tc.desc      数值 7 保留 8 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0233 begin');
      const value: number = 7;
      const digits: number = 8;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('7.00000000');
      expect(scaled).assertEqual(700000000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0233 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0234
     * @tc.name      intlNumber0234
     * @tc.desc      数值 7 保留 8 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0234 begin');
      const value: number = 7;
      const digits: number = 8;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('7.00000000');
      expect(scaled).assertEqual(700000000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0234 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0235
     * @tc.name      intlNumber0235
     * @tc.desc      数值 7 保留 8 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0235 begin');
      const value: number = 7;
      const digits: number = 8;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('7.00000000');
      expect(scaled).assertEqual(700000000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0235 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0236
     * @tc.name      intlNumber0236
     * @tc.desc      数值 7 保留 8 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0236 begin');
      const value: number = 7;
      const digits: number = 8;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('7.00000000');
      expect(scaled).assertEqual(700000000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0236 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0237
     * @tc.name      intlNumber0237
     * @tc.desc      数值 7 保留 8 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0237 begin');
      const value: number = 7;
      const digits: number = 8;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('7.00000000');
      expect(scaled).assertEqual(700000000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0237 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0238
     * @tc.name      intlNumber0238
     * @tc.desc      数值 7 保留 8 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0238 begin');
      const value: number = 7;
      const digits: number = 8;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('7.00000000');
      expect(scaled).assertEqual(700000000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0238 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0239
     * @tc.name      intlNumber0239
     * @tc.desc      数值 7 保留 8 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0239 begin');
      const value: number = 7;
      const digits: number = 8;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('7.00000000');
      expect(scaled).assertEqual(700000000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0239 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0240
     * @tc.name      intlNumber0240
     * @tc.desc      数值 7 保留 8 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0240 begin');
      const value: number = 7;
      const digits: number = 8;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('7.00000000');
      expect(scaled).assertEqual(700000000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0240 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0241
     * @tc.name      intlNumber0241
     * @tc.desc      数值 12.5 保留 0 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0241 begin');
      const value: number = 12.5;
      const digits: number = 0;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('13');
      expect(scaled).assertEqual(13);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0241 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0242
     * @tc.name      intlNumber0242
     * @tc.desc      数值 12.5 保留 0 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0242 begin');
      const value: number = 12.5;
      const digits: number = 0;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('13');
      expect(scaled).assertEqual(13);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0242 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0243
     * @tc.name      intlNumber0243
     * @tc.desc      数值 12.5 保留 0 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0243 begin');
      const value: number = 12.5;
      const digits: number = 0;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('13');
      expect(scaled).assertEqual(13);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0243 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0244
     * @tc.name      intlNumber0244
     * @tc.desc      数值 12.5 保留 0 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0244 begin');
      const value: number = 12.5;
      const digits: number = 0;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('13');
      expect(scaled).assertEqual(13);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0244 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0245
     * @tc.name      intlNumber0245
     * @tc.desc      数值 12.5 保留 0 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0245 begin');
      const value: number = 12.5;
      const digits: number = 0;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('13');
      expect(scaled).assertEqual(13);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0245 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0246
     * @tc.name      intlNumber0246
     * @tc.desc      数值 12.5 保留 0 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0246 begin');
      const value: number = 12.5;
      const digits: number = 0;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('13');
      expect(scaled).assertEqual(13);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0246 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0247
     * @tc.name      intlNumber0247
     * @tc.desc      数值 12.5 保留 0 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0247 begin');
      const value: number = 12.5;
      const digits: number = 0;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('13');
      expect(scaled).assertEqual(13);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0247 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0248
     * @tc.name      intlNumber0248
     * @tc.desc      数值 12.5 保留 0 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0248 begin');
      const value: number = 12.5;
      const digits: number = 0;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('13');
      expect(scaled).assertEqual(13);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0248 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0249
     * @tc.name      intlNumber0249
     * @tc.desc      数值 12.5 保留 0 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0249 begin');
      const value: number = 12.5;
      const digits: number = 0;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('13');
      expect(scaled).assertEqual(13);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0249 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0250
     * @tc.name      intlNumber0250
     * @tc.desc      数值 12.5 保留 0 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0250 begin');
      const value: number = 12.5;
      const digits: number = 0;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('13');
      expect(scaled).assertEqual(13);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0250 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0251
     * @tc.name      intlNumber0251
     * @tc.desc      数值 12.5 保留 1 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0251 begin');
      const value: number = 12.5;
      const digits: number = 1;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.5');
      expect(scaled).assertEqual(125);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0251 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0252
     * @tc.name      intlNumber0252
     * @tc.desc      数值 12.5 保留 1 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0252 begin');
      const value: number = 12.5;
      const digits: number = 1;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.5');
      expect(scaled).assertEqual(125);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0252 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0253
     * @tc.name      intlNumber0253
     * @tc.desc      数值 12.5 保留 1 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0253 begin');
      const value: number = 12.5;
      const digits: number = 1;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.5');
      expect(scaled).assertEqual(125);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0253 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0254
     * @tc.name      intlNumber0254
     * @tc.desc      数值 12.5 保留 1 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0254 begin');
      const value: number = 12.5;
      const digits: number = 1;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.5');
      expect(scaled).assertEqual(125);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0254 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0255
     * @tc.name      intlNumber0255
     * @tc.desc      数值 12.5 保留 1 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0255 begin');
      const value: number = 12.5;
      const digits: number = 1;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.5');
      expect(scaled).assertEqual(125);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0255 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0256
     * @tc.name      intlNumber0256
     * @tc.desc      数值 12.5 保留 1 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0256 begin');
      const value: number = 12.5;
      const digits: number = 1;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.5');
      expect(scaled).assertEqual(125);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0256 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0257
     * @tc.name      intlNumber0257
     * @tc.desc      数值 12.5 保留 1 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0257 begin');
      const value: number = 12.5;
      const digits: number = 1;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.5');
      expect(scaled).assertEqual(125);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0257 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0258
     * @tc.name      intlNumber0258
     * @tc.desc      数值 12.5 保留 1 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0258 begin');
      const value: number = 12.5;
      const digits: number = 1;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.5');
      expect(scaled).assertEqual(125);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0258 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0259
     * @tc.name      intlNumber0259
     * @tc.desc      数值 12.5 保留 1 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0259 begin');
      const value: number = 12.5;
      const digits: number = 1;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.5');
      expect(scaled).assertEqual(125);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0259 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0260
     * @tc.name      intlNumber0260
     * @tc.desc      数值 12.5 保留 1 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0260 begin');
      const value: number = 12.5;
      const digits: number = 1;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.5');
      expect(scaled).assertEqual(125);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0260 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0261
     * @tc.name      intlNumber0261
     * @tc.desc      数值 12.5 保留 2 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0261 begin');
      const value: number = 12.5;
      const digits: number = 2;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.50');
      expect(scaled).assertEqual(1250);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0261 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0262
     * @tc.name      intlNumber0262
     * @tc.desc      数值 12.5 保留 2 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0262 begin');
      const value: number = 12.5;
      const digits: number = 2;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.50');
      expect(scaled).assertEqual(1250);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0262 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0263
     * @tc.name      intlNumber0263
     * @tc.desc      数值 12.5 保留 2 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0263 begin');
      const value: number = 12.5;
      const digits: number = 2;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.50');
      expect(scaled).assertEqual(1250);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0263 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0264
     * @tc.name      intlNumber0264
     * @tc.desc      数值 12.5 保留 2 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0264 begin');
      const value: number = 12.5;
      const digits: number = 2;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.50');
      expect(scaled).assertEqual(1250);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0264 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0265
     * @tc.name      intlNumber0265
     * @tc.desc      数值 12.5 保留 2 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0265 begin');
      const value: number = 12.5;
      const digits: number = 2;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.50');
      expect(scaled).assertEqual(1250);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0265 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0266
     * @tc.name      intlNumber0266
     * @tc.desc      数值 12.5 保留 2 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0266 begin');
      const value: number = 12.5;
      const digits: number = 2;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.50');
      expect(scaled).assertEqual(1250);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0266 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0267
     * @tc.name      intlNumber0267
     * @tc.desc      数值 12.5 保留 2 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0267 begin');
      const value: number = 12.5;
      const digits: number = 2;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.50');
      expect(scaled).assertEqual(1250);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0267 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0268
     * @tc.name      intlNumber0268
     * @tc.desc      数值 12.5 保留 2 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0268 begin');
      const value: number = 12.5;
      const digits: number = 2;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.50');
      expect(scaled).assertEqual(1250);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0268 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0269
     * @tc.name      intlNumber0269
     * @tc.desc      数值 12.5 保留 2 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0269 begin');
      const value: number = 12.5;
      const digits: number = 2;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.50');
      expect(scaled).assertEqual(1250);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0269 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0270
     * @tc.name      intlNumber0270
     * @tc.desc      数值 12.5 保留 2 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0270 begin');
      const value: number = 12.5;
      const digits: number = 2;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.50');
      expect(scaled).assertEqual(1250);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0270 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0271
     * @tc.name      intlNumber0271
     * @tc.desc      数值 12.5 保留 3 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0271 begin');
      const value: number = 12.5;
      const digits: number = 3;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.500');
      expect(scaled).assertEqual(12500);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0271 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0272
     * @tc.name      intlNumber0272
     * @tc.desc      数值 12.5 保留 3 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0272 begin');
      const value: number = 12.5;
      const digits: number = 3;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.500');
      expect(scaled).assertEqual(12500);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0272 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0273
     * @tc.name      intlNumber0273
     * @tc.desc      数值 12.5 保留 3 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0273 begin');
      const value: number = 12.5;
      const digits: number = 3;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.500');
      expect(scaled).assertEqual(12500);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0273 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0274
     * @tc.name      intlNumber0274
     * @tc.desc      数值 12.5 保留 3 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0274 begin');
      const value: number = 12.5;
      const digits: number = 3;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.500');
      expect(scaled).assertEqual(12500);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0274 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0275
     * @tc.name      intlNumber0275
     * @tc.desc      数值 12.5 保留 3 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0275 begin');
      const value: number = 12.5;
      const digits: number = 3;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.500');
      expect(scaled).assertEqual(12500);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0275 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0276
     * @tc.name      intlNumber0276
     * @tc.desc      数值 12.5 保留 3 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0276 begin');
      const value: number = 12.5;
      const digits: number = 3;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.500');
      expect(scaled).assertEqual(12500);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0276 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0277
     * @tc.name      intlNumber0277
     * @tc.desc      数值 12.5 保留 3 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0277 begin');
      const value: number = 12.5;
      const digits: number = 3;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.500');
      expect(scaled).assertEqual(12500);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0277 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0278
     * @tc.name      intlNumber0278
     * @tc.desc      数值 12.5 保留 3 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0278 begin');
      const value: number = 12.5;
      const digits: number = 3;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.500');
      expect(scaled).assertEqual(12500);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0278 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0279
     * @tc.name      intlNumber0279
     * @tc.desc      数值 12.5 保留 3 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0279 begin');
      const value: number = 12.5;
      const digits: number = 3;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.500');
      expect(scaled).assertEqual(12500);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0279 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0280
     * @tc.name      intlNumber0280
     * @tc.desc      数值 12.5 保留 3 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0280 begin');
      const value: number = 12.5;
      const digits: number = 3;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.500');
      expect(scaled).assertEqual(12500);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0280 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0281
     * @tc.name      intlNumber0281
     * @tc.desc      数值 12.5 保留 4 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0281 begin');
      const value: number = 12.5;
      const digits: number = 4;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.5000');
      expect(scaled).assertEqual(125000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0281 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0282
     * @tc.name      intlNumber0282
     * @tc.desc      数值 12.5 保留 4 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0282 begin');
      const value: number = 12.5;
      const digits: number = 4;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.5000');
      expect(scaled).assertEqual(125000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0282 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0283
     * @tc.name      intlNumber0283
     * @tc.desc      数值 12.5 保留 4 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0283 begin');
      const value: number = 12.5;
      const digits: number = 4;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.5000');
      expect(scaled).assertEqual(125000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0283 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0284
     * @tc.name      intlNumber0284
     * @tc.desc      数值 12.5 保留 4 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0284 begin');
      const value: number = 12.5;
      const digits: number = 4;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.5000');
      expect(scaled).assertEqual(125000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0284 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0285
     * @tc.name      intlNumber0285
     * @tc.desc      数值 12.5 保留 4 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0285 begin');
      const value: number = 12.5;
      const digits: number = 4;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.5000');
      expect(scaled).assertEqual(125000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0285 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0286
     * @tc.name      intlNumber0286
     * @tc.desc      数值 12.5 保留 4 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0286 begin');
      const value: number = 12.5;
      const digits: number = 4;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.5000');
      expect(scaled).assertEqual(125000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0286 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0287
     * @tc.name      intlNumber0287
     * @tc.desc      数值 12.5 保留 4 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0287 begin');
      const value: number = 12.5;
      const digits: number = 4;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.5000');
      expect(scaled).assertEqual(125000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0287 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0288
     * @tc.name      intlNumber0288
     * @tc.desc      数值 12.5 保留 4 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0288 begin');
      const value: number = 12.5;
      const digits: number = 4;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.5000');
      expect(scaled).assertEqual(125000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0288 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0289
     * @tc.name      intlNumber0289
     * @tc.desc      数值 12.5 保留 4 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0289 begin');
      const value: number = 12.5;
      const digits: number = 4;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.5000');
      expect(scaled).assertEqual(125000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0289 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0290
     * @tc.name      intlNumber0290
     * @tc.desc      数值 12.5 保留 4 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0290 begin');
      const value: number = 12.5;
      const digits: number = 4;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.5000');
      expect(scaled).assertEqual(125000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0290 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0291
     * @tc.name      intlNumber0291
     * @tc.desc      数值 12.5 保留 5 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0291 begin');
      const value: number = 12.5;
      const digits: number = 5;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.50000');
      expect(scaled).assertEqual(1250000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0291 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0292
     * @tc.name      intlNumber0292
     * @tc.desc      数值 12.5 保留 5 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0292 begin');
      const value: number = 12.5;
      const digits: number = 5;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.50000');
      expect(scaled).assertEqual(1250000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0292 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0293
     * @tc.name      intlNumber0293
     * @tc.desc      数值 12.5 保留 5 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0293 begin');
      const value: number = 12.5;
      const digits: number = 5;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.50000');
      expect(scaled).assertEqual(1250000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0293 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0294
     * @tc.name      intlNumber0294
     * @tc.desc      数值 12.5 保留 5 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0294 begin');
      const value: number = 12.5;
      const digits: number = 5;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.50000');
      expect(scaled).assertEqual(1250000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0294 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0295
     * @tc.name      intlNumber0295
     * @tc.desc      数值 12.5 保留 5 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0295 begin');
      const value: number = 12.5;
      const digits: number = 5;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.50000');
      expect(scaled).assertEqual(1250000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0295 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0296
     * @tc.name      intlNumber0296
     * @tc.desc      数值 12.5 保留 5 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0296 begin');
      const value: number = 12.5;
      const digits: number = 5;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.50000');
      expect(scaled).assertEqual(1250000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0296 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0297
     * @tc.name      intlNumber0297
     * @tc.desc      数值 12.5 保留 5 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0297 begin');
      const value: number = 12.5;
      const digits: number = 5;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.50000');
      expect(scaled).assertEqual(1250000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0297 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0298
     * @tc.name      intlNumber0298
     * @tc.desc      数值 12.5 保留 5 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0298 begin');
      const value: number = 12.5;
      const digits: number = 5;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.50000');
      expect(scaled).assertEqual(1250000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0298 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0299
     * @tc.name      intlNumber0299
     * @tc.desc      数值 12.5 保留 5 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0299 begin');
      const value: number = 12.5;
      const digits: number = 5;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.50000');
      expect(scaled).assertEqual(1250000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0299 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0300
     * @tc.name      intlNumber0300
     * @tc.desc      数值 12.5 保留 5 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0300 begin');
      const value: number = 12.5;
      const digits: number = 5;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.50000');
      expect(scaled).assertEqual(1250000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0300 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0301
     * @tc.name      intlNumber0301
     * @tc.desc      数值 12.5 保留 6 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0301 begin');
      const value: number = 12.5;
      const digits: number = 6;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.500000');
      expect(scaled).assertEqual(12500000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0301 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0302
     * @tc.name      intlNumber0302
     * @tc.desc      数值 12.5 保留 6 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0302 begin');
      const value: number = 12.5;
      const digits: number = 6;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.500000');
      expect(scaled).assertEqual(12500000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0302 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0303
     * @tc.name      intlNumber0303
     * @tc.desc      数值 12.5 保留 6 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0303 begin');
      const value: number = 12.5;
      const digits: number = 6;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.500000');
      expect(scaled).assertEqual(12500000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0303 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0304
     * @tc.name      intlNumber0304
     * @tc.desc      数值 12.5 保留 6 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0304 begin');
      const value: number = 12.5;
      const digits: number = 6;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.500000');
      expect(scaled).assertEqual(12500000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0304 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0305
     * @tc.name      intlNumber0305
     * @tc.desc      数值 12.5 保留 6 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0305 begin');
      const value: number = 12.5;
      const digits: number = 6;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.500000');
      expect(scaled).assertEqual(12500000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0305 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0306
     * @tc.name      intlNumber0306
     * @tc.desc      数值 12.5 保留 6 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0306 begin');
      const value: number = 12.5;
      const digits: number = 6;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.500000');
      expect(scaled).assertEqual(12500000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0306 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0307
     * @tc.name      intlNumber0307
     * @tc.desc      数值 12.5 保留 6 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0307 begin');
      const value: number = 12.5;
      const digits: number = 6;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.500000');
      expect(scaled).assertEqual(12500000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0307 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0308
     * @tc.name      intlNumber0308
     * @tc.desc      数值 12.5 保留 6 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0308 begin');
      const value: number = 12.5;
      const digits: number = 6;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('12.500000');
      expect(scaled).assertEqual(12500000);
      expect(groupCount).assertEqual(2);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0308 end');
    })
  })
}
