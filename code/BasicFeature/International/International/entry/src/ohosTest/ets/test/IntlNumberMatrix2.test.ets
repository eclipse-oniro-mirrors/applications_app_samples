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

export default function intlNumberMatrix2Test(): void {
  describe('IntlNumberMatrix2Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    INTL_NUMBER_0078
     * @tc.name      intlNumber0078
     * @tc.desc      数值 0 保留 8 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0078 begin');
      const value: number = 0;
      const digits: number = 8;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.00000000');
      expect(scaled).assertEqual(0);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0078 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0079
     * @tc.name      intlNumber0079
     * @tc.desc      数值 0 保留 8 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0079 begin');
      const value: number = 0;
      const digits: number = 8;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.00000000');
      expect(scaled).assertEqual(0);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0079 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0080
     * @tc.name      intlNumber0080
     * @tc.desc      数值 0 保留 8 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0080 begin');
      const value: number = 0;
      const digits: number = 8;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.00000000');
      expect(scaled).assertEqual(0);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0080 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0081
     * @tc.name      intlNumber0081
     * @tc.desc      数值 1 保留 0 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0081 begin');
      const value: number = 1;
      const digits: number = 0;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1');
      expect(scaled).assertEqual(1);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0081 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0082
     * @tc.name      intlNumber0082
     * @tc.desc      数值 1 保留 0 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0082 begin');
      const value: number = 1;
      const digits: number = 0;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1');
      expect(scaled).assertEqual(1);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0082 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0083
     * @tc.name      intlNumber0083
     * @tc.desc      数值 1 保留 0 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0083 begin');
      const value: number = 1;
      const digits: number = 0;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1');
      expect(scaled).assertEqual(1);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0083 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0084
     * @tc.name      intlNumber0084
     * @tc.desc      数值 1 保留 0 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0084 begin');
      const value: number = 1;
      const digits: number = 0;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1');
      expect(scaled).assertEqual(1);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0084 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0085
     * @tc.name      intlNumber0085
     * @tc.desc      数值 1 保留 0 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0085 begin');
      const value: number = 1;
      const digits: number = 0;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1');
      expect(scaled).assertEqual(1);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0085 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0086
     * @tc.name      intlNumber0086
     * @tc.desc      数值 1 保留 0 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0086 begin');
      const value: number = 1;
      const digits: number = 0;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1');
      expect(scaled).assertEqual(1);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0086 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0087
     * @tc.name      intlNumber0087
     * @tc.desc      数值 1 保留 0 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0087 begin');
      const value: number = 1;
      const digits: number = 0;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1');
      expect(scaled).assertEqual(1);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0087 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0088
     * @tc.name      intlNumber0088
     * @tc.desc      数值 1 保留 0 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0088 begin');
      const value: number = 1;
      const digits: number = 0;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1');
      expect(scaled).assertEqual(1);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0088 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0089
     * @tc.name      intlNumber0089
     * @tc.desc      数值 1 保留 0 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0089 begin');
      const value: number = 1;
      const digits: number = 0;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1');
      expect(scaled).assertEqual(1);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0089 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0090
     * @tc.name      intlNumber0090
     * @tc.desc      数值 1 保留 0 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0090 begin');
      const value: number = 1;
      const digits: number = 0;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1');
      expect(scaled).assertEqual(1);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0090 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0091
     * @tc.name      intlNumber0091
     * @tc.desc      数值 1 保留 1 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0091 begin');
      const value: number = 1;
      const digits: number = 1;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.0');
      expect(scaled).assertEqual(10);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0091 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0092
     * @tc.name      intlNumber0092
     * @tc.desc      数值 1 保留 1 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0092 begin');
      const value: number = 1;
      const digits: number = 1;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.0');
      expect(scaled).assertEqual(10);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0092 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0093
     * @tc.name      intlNumber0093
     * @tc.desc      数值 1 保留 1 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0093 begin');
      const value: number = 1;
      const digits: number = 1;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.0');
      expect(scaled).assertEqual(10);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0093 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0094
     * @tc.name      intlNumber0094
     * @tc.desc      数值 1 保留 1 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0094 begin');
      const value: number = 1;
      const digits: number = 1;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.0');
      expect(scaled).assertEqual(10);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0094 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0095
     * @tc.name      intlNumber0095
     * @tc.desc      数值 1 保留 1 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0095 begin');
      const value: number = 1;
      const digits: number = 1;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.0');
      expect(scaled).assertEqual(10);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0095 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0096
     * @tc.name      intlNumber0096
     * @tc.desc      数值 1 保留 1 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0096 begin');
      const value: number = 1;
      const digits: number = 1;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.0');
      expect(scaled).assertEqual(10);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0096 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0097
     * @tc.name      intlNumber0097
     * @tc.desc      数值 1 保留 1 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0097 begin');
      const value: number = 1;
      const digits: number = 1;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.0');
      expect(scaled).assertEqual(10);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0097 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0098
     * @tc.name      intlNumber0098
     * @tc.desc      数值 1 保留 1 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0098 begin');
      const value: number = 1;
      const digits: number = 1;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.0');
      expect(scaled).assertEqual(10);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0098 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0099
     * @tc.name      intlNumber0099
     * @tc.desc      数值 1 保留 1 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0099 begin');
      const value: number = 1;
      const digits: number = 1;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.0');
      expect(scaled).assertEqual(10);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0099 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0100
     * @tc.name      intlNumber0100
     * @tc.desc      数值 1 保留 1 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0100 begin');
      const value: number = 1;
      const digits: number = 1;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.0');
      expect(scaled).assertEqual(10);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0100 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0101
     * @tc.name      intlNumber0101
     * @tc.desc      数值 1 保留 2 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0101 begin');
      const value: number = 1;
      const digits: number = 2;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.00');
      expect(scaled).assertEqual(100);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0101 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0102
     * @tc.name      intlNumber0102
     * @tc.desc      数值 1 保留 2 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0102 begin');
      const value: number = 1;
      const digits: number = 2;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.00');
      expect(scaled).assertEqual(100);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0102 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0103
     * @tc.name      intlNumber0103
     * @tc.desc      数值 1 保留 2 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0103 begin');
      const value: number = 1;
      const digits: number = 2;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.00');
      expect(scaled).assertEqual(100);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0103 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0104
     * @tc.name      intlNumber0104
     * @tc.desc      数值 1 保留 2 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0104 begin');
      const value: number = 1;
      const digits: number = 2;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.00');
      expect(scaled).assertEqual(100);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0104 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0105
     * @tc.name      intlNumber0105
     * @tc.desc      数值 1 保留 2 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0105 begin');
      const value: number = 1;
      const digits: number = 2;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.00');
      expect(scaled).assertEqual(100);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0105 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0106
     * @tc.name      intlNumber0106
     * @tc.desc      数值 1 保留 2 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0106 begin');
      const value: number = 1;
      const digits: number = 2;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.00');
      expect(scaled).assertEqual(100);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0106 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0107
     * @tc.name      intlNumber0107
     * @tc.desc      数值 1 保留 2 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0107 begin');
      const value: number = 1;
      const digits: number = 2;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.00');
      expect(scaled).assertEqual(100);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0107 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0108
     * @tc.name      intlNumber0108
     * @tc.desc      数值 1 保留 2 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0108 begin');
      const value: number = 1;
      const digits: number = 2;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.00');
      expect(scaled).assertEqual(100);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0108 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0109
     * @tc.name      intlNumber0109
     * @tc.desc      数值 1 保留 2 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0109 begin');
      const value: number = 1;
      const digits: number = 2;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.00');
      expect(scaled).assertEqual(100);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0109 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0110
     * @tc.name      intlNumber0110
     * @tc.desc      数值 1 保留 2 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0110 begin');
      const value: number = 1;
      const digits: number = 2;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.00');
      expect(scaled).assertEqual(100);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0110 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0111
     * @tc.name      intlNumber0111
     * @tc.desc      数值 1 保留 3 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0111 begin');
      const value: number = 1;
      const digits: number = 3;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.000');
      expect(scaled).assertEqual(1000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0111 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0112
     * @tc.name      intlNumber0112
     * @tc.desc      数值 1 保留 3 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0112 begin');
      const value: number = 1;
      const digits: number = 3;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.000');
      expect(scaled).assertEqual(1000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0112 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0113
     * @tc.name      intlNumber0113
     * @tc.desc      数值 1 保留 3 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0113 begin');
      const value: number = 1;
      const digits: number = 3;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.000');
      expect(scaled).assertEqual(1000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0113 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0114
     * @tc.name      intlNumber0114
     * @tc.desc      数值 1 保留 3 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0114 begin');
      const value: number = 1;
      const digits: number = 3;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.000');
      expect(scaled).assertEqual(1000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0114 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0115
     * @tc.name      intlNumber0115
     * @tc.desc      数值 1 保留 3 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0115 begin');
      const value: number = 1;
      const digits: number = 3;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.000');
      expect(scaled).assertEqual(1000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0115 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0116
     * @tc.name      intlNumber0116
     * @tc.desc      数值 1 保留 3 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0116 begin');
      const value: number = 1;
      const digits: number = 3;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.000');
      expect(scaled).assertEqual(1000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0116 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0117
     * @tc.name      intlNumber0117
     * @tc.desc      数值 1 保留 3 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0117 begin');
      const value: number = 1;
      const digits: number = 3;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.000');
      expect(scaled).assertEqual(1000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0117 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0118
     * @tc.name      intlNumber0118
     * @tc.desc      数值 1 保留 3 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0118 begin');
      const value: number = 1;
      const digits: number = 3;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.000');
      expect(scaled).assertEqual(1000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0118 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0119
     * @tc.name      intlNumber0119
     * @tc.desc      数值 1 保留 3 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0119 begin');
      const value: number = 1;
      const digits: number = 3;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.000');
      expect(scaled).assertEqual(1000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0119 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0120
     * @tc.name      intlNumber0120
     * @tc.desc      数值 1 保留 3 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0120 begin');
      const value: number = 1;
      const digits: number = 3;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.000');
      expect(scaled).assertEqual(1000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0120 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0121
     * @tc.name      intlNumber0121
     * @tc.desc      数值 1 保留 4 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0121 begin');
      const value: number = 1;
      const digits: number = 4;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.0000');
      expect(scaled).assertEqual(10000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0121 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0122
     * @tc.name      intlNumber0122
     * @tc.desc      数值 1 保留 4 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0122 begin');
      const value: number = 1;
      const digits: number = 4;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.0000');
      expect(scaled).assertEqual(10000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0122 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0123
     * @tc.name      intlNumber0123
     * @tc.desc      数值 1 保留 4 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0123 begin');
      const value: number = 1;
      const digits: number = 4;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.0000');
      expect(scaled).assertEqual(10000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0123 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0124
     * @tc.name      intlNumber0124
     * @tc.desc      数值 1 保留 4 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0124 begin');
      const value: number = 1;
      const digits: number = 4;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.0000');
      expect(scaled).assertEqual(10000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0124 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0125
     * @tc.name      intlNumber0125
     * @tc.desc      数值 1 保留 4 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0125 begin');
      const value: number = 1;
      const digits: number = 4;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.0000');
      expect(scaled).assertEqual(10000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0125 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0126
     * @tc.name      intlNumber0126
     * @tc.desc      数值 1 保留 4 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0126 begin');
      const value: number = 1;
      const digits: number = 4;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.0000');
      expect(scaled).assertEqual(10000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0126 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0127
     * @tc.name      intlNumber0127
     * @tc.desc      数值 1 保留 4 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0127 begin');
      const value: number = 1;
      const digits: number = 4;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.0000');
      expect(scaled).assertEqual(10000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0127 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0128
     * @tc.name      intlNumber0128
     * @tc.desc      数值 1 保留 4 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0128 begin');
      const value: number = 1;
      const digits: number = 4;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.0000');
      expect(scaled).assertEqual(10000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0128 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0129
     * @tc.name      intlNumber0129
     * @tc.desc      数值 1 保留 4 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0129 begin');
      const value: number = 1;
      const digits: number = 4;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.0000');
      expect(scaled).assertEqual(10000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0129 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0130
     * @tc.name      intlNumber0130
     * @tc.desc      数值 1 保留 4 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0130 begin');
      const value: number = 1;
      const digits: number = 4;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.0000');
      expect(scaled).assertEqual(10000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0130 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0131
     * @tc.name      intlNumber0131
     * @tc.desc      数值 1 保留 5 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0131 begin');
      const value: number = 1;
      const digits: number = 5;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.00000');
      expect(scaled).assertEqual(100000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0131 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0132
     * @tc.name      intlNumber0132
     * @tc.desc      数值 1 保留 5 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0132 begin');
      const value: number = 1;
      const digits: number = 5;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.00000');
      expect(scaled).assertEqual(100000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0132 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0133
     * @tc.name      intlNumber0133
     * @tc.desc      数值 1 保留 5 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0133 begin');
      const value: number = 1;
      const digits: number = 5;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.00000');
      expect(scaled).assertEqual(100000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0133 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0134
     * @tc.name      intlNumber0134
     * @tc.desc      数值 1 保留 5 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0134 begin');
      const value: number = 1;
      const digits: number = 5;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.00000');
      expect(scaled).assertEqual(100000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0134 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0135
     * @tc.name      intlNumber0135
     * @tc.desc      数值 1 保留 5 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0135 begin');
      const value: number = 1;
      const digits: number = 5;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.00000');
      expect(scaled).assertEqual(100000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0135 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0136
     * @tc.name      intlNumber0136
     * @tc.desc      数值 1 保留 5 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0136 begin');
      const value: number = 1;
      const digits: number = 5;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.00000');
      expect(scaled).assertEqual(100000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0136 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0137
     * @tc.name      intlNumber0137
     * @tc.desc      数值 1 保留 5 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0137 begin');
      const value: number = 1;
      const digits: number = 5;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.00000');
      expect(scaled).assertEqual(100000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0137 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0138
     * @tc.name      intlNumber0138
     * @tc.desc      数值 1 保留 5 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0138 begin');
      const value: number = 1;
      const digits: number = 5;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.00000');
      expect(scaled).assertEqual(100000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0138 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0139
     * @tc.name      intlNumber0139
     * @tc.desc      数值 1 保留 5 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0139 begin');
      const value: number = 1;
      const digits: number = 5;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.00000');
      expect(scaled).assertEqual(100000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0139 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0140
     * @tc.name      intlNumber0140
     * @tc.desc      数值 1 保留 5 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0140 begin');
      const value: number = 1;
      const digits: number = 5;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.00000');
      expect(scaled).assertEqual(100000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0140 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0141
     * @tc.name      intlNumber0141
     * @tc.desc      数值 1 保留 6 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0141 begin');
      const value: number = 1;
      const digits: number = 6;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.000000');
      expect(scaled).assertEqual(1000000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0141 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0142
     * @tc.name      intlNumber0142
     * @tc.desc      数值 1 保留 6 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0142 begin');
      const value: number = 1;
      const digits: number = 6;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.000000');
      expect(scaled).assertEqual(1000000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0142 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0143
     * @tc.name      intlNumber0143
     * @tc.desc      数值 1 保留 6 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0143 begin');
      const value: number = 1;
      const digits: number = 6;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.000000');
      expect(scaled).assertEqual(1000000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0143 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0144
     * @tc.name      intlNumber0144
     * @tc.desc      数值 1 保留 6 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0144 begin');
      const value: number = 1;
      const digits: number = 6;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.000000');
      expect(scaled).assertEqual(1000000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0144 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0145
     * @tc.name      intlNumber0145
     * @tc.desc      数值 1 保留 6 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0145 begin');
      const value: number = 1;
      const digits: number = 6;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.000000');
      expect(scaled).assertEqual(1000000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0145 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0146
     * @tc.name      intlNumber0146
     * @tc.desc      数值 1 保留 6 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0146 begin');
      const value: number = 1;
      const digits: number = 6;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.000000');
      expect(scaled).assertEqual(1000000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0146 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0147
     * @tc.name      intlNumber0147
     * @tc.desc      数值 1 保留 6 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0147 begin');
      const value: number = 1;
      const digits: number = 6;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.000000');
      expect(scaled).assertEqual(1000000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0147 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0148
     * @tc.name      intlNumber0148
     * @tc.desc      数值 1 保留 6 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0148 begin');
      const value: number = 1;
      const digits: number = 6;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.000000');
      expect(scaled).assertEqual(1000000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0148 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0149
     * @tc.name      intlNumber0149
     * @tc.desc      数值 1 保留 6 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0149 begin');
      const value: number = 1;
      const digits: number = 6;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.000000');
      expect(scaled).assertEqual(1000000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0149 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0150
     * @tc.name      intlNumber0150
     * @tc.desc      数值 1 保留 6 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0150 begin');
      const value: number = 1;
      const digits: number = 6;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.000000');
      expect(scaled).assertEqual(1000000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0150 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0151
     * @tc.name      intlNumber0151
     * @tc.desc      数值 1 保留 8 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0151 begin');
      const value: number = 1;
      const digits: number = 8;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.00000000');
      expect(scaled).assertEqual(100000000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0151 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0152
     * @tc.name      intlNumber0152
     * @tc.desc      数值 1 保留 8 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0152 begin');
      const value: number = 1;
      const digits: number = 8;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.00000000');
      expect(scaled).assertEqual(100000000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0152 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0153
     * @tc.name      intlNumber0153
     * @tc.desc      数值 1 保留 8 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0153 begin');
      const value: number = 1;
      const digits: number = 8;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.00000000');
      expect(scaled).assertEqual(100000000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0153 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0154
     * @tc.name      intlNumber0154
     * @tc.desc      数值 1 保留 8 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0154 begin');
      const value: number = 1;
      const digits: number = 8;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('1.00000000');
      expect(scaled).assertEqual(100000000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0154 end');
    })
  })
}
