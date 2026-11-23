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

export default function intlNumberMatrix12Test(): void {
  describe('IntlNumberMatrix12Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    INTL_NUMBER_0848
     * @tc.name      intlNumber0848
     * @tc.desc      数值 0.001 保留 4 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0848', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0848 begin');
      const value: number = 0.001;
      const digits: number = 4;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.0010');
      expect(scaled).assertEqual(10);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0848 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0849
     * @tc.name      intlNumber0849
     * @tc.desc      数值 0.001 保留 4 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0849', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0849 begin');
      const value: number = 0.001;
      const digits: number = 4;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.0010');
      expect(scaled).assertEqual(10);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0849 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0850
     * @tc.name      intlNumber0850
     * @tc.desc      数值 0.001 保留 4 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0850', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0850 begin');
      const value: number = 0.001;
      const digits: number = 4;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.0010');
      expect(scaled).assertEqual(10);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0850 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0851
     * @tc.name      intlNumber0851
     * @tc.desc      数值 0.001 保留 5 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0851', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0851 begin');
      const value: number = 0.001;
      const digits: number = 5;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.00100');
      expect(scaled).assertEqual(100);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0851 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0852
     * @tc.name      intlNumber0852
     * @tc.desc      数值 0.001 保留 5 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0852', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0852 begin');
      const value: number = 0.001;
      const digits: number = 5;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.00100');
      expect(scaled).assertEqual(100);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0852 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0853
     * @tc.name      intlNumber0853
     * @tc.desc      数值 0.001 保留 5 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0853', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0853 begin');
      const value: number = 0.001;
      const digits: number = 5;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.00100');
      expect(scaled).assertEqual(100);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0853 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0854
     * @tc.name      intlNumber0854
     * @tc.desc      数值 0.001 保留 5 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0854', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0854 begin');
      const value: number = 0.001;
      const digits: number = 5;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.00100');
      expect(scaled).assertEqual(100);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0854 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0855
     * @tc.name      intlNumber0855
     * @tc.desc      数值 0.001 保留 5 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0855', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0855 begin');
      const value: number = 0.001;
      const digits: number = 5;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.00100');
      expect(scaled).assertEqual(100);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0855 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0856
     * @tc.name      intlNumber0856
     * @tc.desc      数值 0.001 保留 5 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0856', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0856 begin');
      const value: number = 0.001;
      const digits: number = 5;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.00100');
      expect(scaled).assertEqual(100);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0856 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0857
     * @tc.name      intlNumber0857
     * @tc.desc      数值 0.001 保留 5 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0857', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0857 begin');
      const value: number = 0.001;
      const digits: number = 5;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.00100');
      expect(scaled).assertEqual(100);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0857 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0858
     * @tc.name      intlNumber0858
     * @tc.desc      数值 0.001 保留 5 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0858', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0858 begin');
      const value: number = 0.001;
      const digits: number = 5;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.00100');
      expect(scaled).assertEqual(100);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0858 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0859
     * @tc.name      intlNumber0859
     * @tc.desc      数值 0.001 保留 5 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0859', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0859 begin');
      const value: number = 0.001;
      const digits: number = 5;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.00100');
      expect(scaled).assertEqual(100);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0859 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0860
     * @tc.name      intlNumber0860
     * @tc.desc      数值 0.001 保留 5 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0860', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0860 begin');
      const value: number = 0.001;
      const digits: number = 5;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.00100');
      expect(scaled).assertEqual(100);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0860 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0861
     * @tc.name      intlNumber0861
     * @tc.desc      数值 0.001 保留 6 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0861', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0861 begin');
      const value: number = 0.001;
      const digits: number = 6;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.001000');
      expect(scaled).assertEqual(1000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0861 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0862
     * @tc.name      intlNumber0862
     * @tc.desc      数值 0.001 保留 6 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0862', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0862 begin');
      const value: number = 0.001;
      const digits: number = 6;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.001000');
      expect(scaled).assertEqual(1000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0862 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0863
     * @tc.name      intlNumber0863
     * @tc.desc      数值 0.001 保留 6 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0863', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0863 begin');
      const value: number = 0.001;
      const digits: number = 6;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.001000');
      expect(scaled).assertEqual(1000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0863 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0864
     * @tc.name      intlNumber0864
     * @tc.desc      数值 0.001 保留 6 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0864', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0864 begin');
      const value: number = 0.001;
      const digits: number = 6;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.001000');
      expect(scaled).assertEqual(1000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0864 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0865
     * @tc.name      intlNumber0865
     * @tc.desc      数值 0.001 保留 6 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0865', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0865 begin');
      const value: number = 0.001;
      const digits: number = 6;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.001000');
      expect(scaled).assertEqual(1000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0865 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0866
     * @tc.name      intlNumber0866
     * @tc.desc      数值 0.001 保留 6 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0866', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0866 begin');
      const value: number = 0.001;
      const digits: number = 6;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.001000');
      expect(scaled).assertEqual(1000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0866 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0867
     * @tc.name      intlNumber0867
     * @tc.desc      数值 0.001 保留 6 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0867', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0867 begin');
      const value: number = 0.001;
      const digits: number = 6;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.001000');
      expect(scaled).assertEqual(1000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0867 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0868
     * @tc.name      intlNumber0868
     * @tc.desc      数值 0.001 保留 6 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0868', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0868 begin');
      const value: number = 0.001;
      const digits: number = 6;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.001000');
      expect(scaled).assertEqual(1000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0868 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0869
     * @tc.name      intlNumber0869
     * @tc.desc      数值 0.001 保留 6 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0869', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0869 begin');
      const value: number = 0.001;
      const digits: number = 6;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.001000');
      expect(scaled).assertEqual(1000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0869 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0870
     * @tc.name      intlNumber0870
     * @tc.desc      数值 0.001 保留 6 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0870', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0870 begin');
      const value: number = 0.001;
      const digits: number = 6;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.001000');
      expect(scaled).assertEqual(1000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0870 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0871
     * @tc.name      intlNumber0871
     * @tc.desc      数值 0.001 保留 8 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0871', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0871 begin');
      const value: number = 0.001;
      const digits: number = 8;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.00100000');
      expect(scaled).assertEqual(100000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0871 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0872
     * @tc.name      intlNumber0872
     * @tc.desc      数值 0.001 保留 8 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0872', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0872 begin');
      const value: number = 0.001;
      const digits: number = 8;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.00100000');
      expect(scaled).assertEqual(100000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0872 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0873
     * @tc.name      intlNumber0873
     * @tc.desc      数值 0.001 保留 8 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0873', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0873 begin');
      const value: number = 0.001;
      const digits: number = 8;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.00100000');
      expect(scaled).assertEqual(100000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0873 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0874
     * @tc.name      intlNumber0874
     * @tc.desc      数值 0.001 保留 8 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0874', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0874 begin');
      const value: number = 0.001;
      const digits: number = 8;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.00100000');
      expect(scaled).assertEqual(100000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0874 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0875
     * @tc.name      intlNumber0875
     * @tc.desc      数值 0.001 保留 8 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0875', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0875 begin');
      const value: number = 0.001;
      const digits: number = 8;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.00100000');
      expect(scaled).assertEqual(100000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0875 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0876
     * @tc.name      intlNumber0876
     * @tc.desc      数值 0.001 保留 8 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0876', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0876 begin');
      const value: number = 0.001;
      const digits: number = 8;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.00100000');
      expect(scaled).assertEqual(100000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0876 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0877
     * @tc.name      intlNumber0877
     * @tc.desc      数值 0.001 保留 8 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0877', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0877 begin');
      const value: number = 0.001;
      const digits: number = 8;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.00100000');
      expect(scaled).assertEqual(100000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0877 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0878
     * @tc.name      intlNumber0878
     * @tc.desc      数值 0.001 保留 8 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0878', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0878 begin');
      const value: number = 0.001;
      const digits: number = 8;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.00100000');
      expect(scaled).assertEqual(100000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0878 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0879
     * @tc.name      intlNumber0879
     * @tc.desc      数值 0.001 保留 8 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0879', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0879 begin');
      const value: number = 0.001;
      const digits: number = 8;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.00100000');
      expect(scaled).assertEqual(100000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0879 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0880
     * @tc.name      intlNumber0880
     * @tc.desc      数值 0.001 保留 8 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0880', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0880 begin');
      const value: number = 0.001;
      const digits: number = 8;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.00100000');
      expect(scaled).assertEqual(100000);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0880 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0881
     * @tc.name      intlNumber0881
     * @tc.desc      数值 0.125 保留 0 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0881', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0881 begin');
      const value: number = 0.125;
      const digits: number = 0;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0');
      expect(scaled).assertEqual(0);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0881 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0882
     * @tc.name      intlNumber0882
     * @tc.desc      数值 0.125 保留 0 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0882', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0882 begin');
      const value: number = 0.125;
      const digits: number = 0;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0');
      expect(scaled).assertEqual(0);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0882 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0883
     * @tc.name      intlNumber0883
     * @tc.desc      数值 0.125 保留 0 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0883', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0883 begin');
      const value: number = 0.125;
      const digits: number = 0;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0');
      expect(scaled).assertEqual(0);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0883 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0884
     * @tc.name      intlNumber0884
     * @tc.desc      数值 0.125 保留 0 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0884', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0884 begin');
      const value: number = 0.125;
      const digits: number = 0;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0');
      expect(scaled).assertEqual(0);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0884 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0885
     * @tc.name      intlNumber0885
     * @tc.desc      数值 0.125 保留 0 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0885', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0885 begin');
      const value: number = 0.125;
      const digits: number = 0;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0');
      expect(scaled).assertEqual(0);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0885 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0886
     * @tc.name      intlNumber0886
     * @tc.desc      数值 0.125 保留 0 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0886', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0886 begin');
      const value: number = 0.125;
      const digits: number = 0;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0');
      expect(scaled).assertEqual(0);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0886 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0887
     * @tc.name      intlNumber0887
     * @tc.desc      数值 0.125 保留 0 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0887', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0887 begin');
      const value: number = 0.125;
      const digits: number = 0;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0');
      expect(scaled).assertEqual(0);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0887 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0888
     * @tc.name      intlNumber0888
     * @tc.desc      数值 0.125 保留 0 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0888', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0888 begin');
      const value: number = 0.125;
      const digits: number = 0;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0');
      expect(scaled).assertEqual(0);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0888 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0889
     * @tc.name      intlNumber0889
     * @tc.desc      数值 0.125 保留 0 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0889', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0889 begin');
      const value: number = 0.125;
      const digits: number = 0;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0');
      expect(scaled).assertEqual(0);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0889 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0890
     * @tc.name      intlNumber0890
     * @tc.desc      数值 0.125 保留 0 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0890', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0890 begin');
      const value: number = 0.125;
      const digits: number = 0;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0');
      expect(scaled).assertEqual(0);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0890 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0891
     * @tc.name      intlNumber0891
     * @tc.desc      数值 0.125 保留 1 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0891', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0891 begin');
      const value: number = 0.125;
      const digits: number = 1;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.1');
      expect(scaled).assertEqual(1);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0891 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0892
     * @tc.name      intlNumber0892
     * @tc.desc      数值 0.125 保留 1 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0892', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0892 begin');
      const value: number = 0.125;
      const digits: number = 1;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.1');
      expect(scaled).assertEqual(1);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0892 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0893
     * @tc.name      intlNumber0893
     * @tc.desc      数值 0.125 保留 1 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0893', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0893 begin');
      const value: number = 0.125;
      const digits: number = 1;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.1');
      expect(scaled).assertEqual(1);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0893 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0894
     * @tc.name      intlNumber0894
     * @tc.desc      数值 0.125 保留 1 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0894', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0894 begin');
      const value: number = 0.125;
      const digits: number = 1;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.1');
      expect(scaled).assertEqual(1);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0894 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0895
     * @tc.name      intlNumber0895
     * @tc.desc      数值 0.125 保留 1 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0895', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0895 begin');
      const value: number = 0.125;
      const digits: number = 1;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.1');
      expect(scaled).assertEqual(1);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0895 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0896
     * @tc.name      intlNumber0896
     * @tc.desc      数值 0.125 保留 1 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0896', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0896 begin');
      const value: number = 0.125;
      const digits: number = 1;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.1');
      expect(scaled).assertEqual(1);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0896 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0897
     * @tc.name      intlNumber0897
     * @tc.desc      数值 0.125 保留 1 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0897', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0897 begin');
      const value: number = 0.125;
      const digits: number = 1;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.1');
      expect(scaled).assertEqual(1);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0897 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0898
     * @tc.name      intlNumber0898
     * @tc.desc      数值 0.125 保留 1 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0898', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0898 begin');
      const value: number = 0.125;
      const digits: number = 1;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.1');
      expect(scaled).assertEqual(1);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0898 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0899
     * @tc.name      intlNumber0899
     * @tc.desc      数值 0.125 保留 1 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0899', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0899 begin');
      const value: number = 0.125;
      const digits: number = 1;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.1');
      expect(scaled).assertEqual(1);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0899 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0900
     * @tc.name      intlNumber0900
     * @tc.desc      数值 0.125 保留 1 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0900 begin');
      const value: number = 0.125;
      const digits: number = 1;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.1');
      expect(scaled).assertEqual(1);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0900 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0901
     * @tc.name      intlNumber0901
     * @tc.desc      数值 0.125 保留 2 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0901', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0901 begin');
      const value: number = 0.125;
      const digits: number = 2;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.13');
      expect(scaled).assertEqual(13);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0901 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0902
     * @tc.name      intlNumber0902
     * @tc.desc      数值 0.125 保留 2 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0902', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0902 begin');
      const value: number = 0.125;
      const digits: number = 2;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.13');
      expect(scaled).assertEqual(13);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0902 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0903
     * @tc.name      intlNumber0903
     * @tc.desc      数值 0.125 保留 2 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0903', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0903 begin');
      const value: number = 0.125;
      const digits: number = 2;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.13');
      expect(scaled).assertEqual(13);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0903 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0904
     * @tc.name      intlNumber0904
     * @tc.desc      数值 0.125 保留 2 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0904', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0904 begin');
      const value: number = 0.125;
      const digits: number = 2;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.13');
      expect(scaled).assertEqual(13);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0904 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0905
     * @tc.name      intlNumber0905
     * @tc.desc      数值 0.125 保留 2 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0905', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0905 begin');
      const value: number = 0.125;
      const digits: number = 2;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.13');
      expect(scaled).assertEqual(13);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0905 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0906
     * @tc.name      intlNumber0906
     * @tc.desc      数值 0.125 保留 2 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0906', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0906 begin');
      const value: number = 0.125;
      const digits: number = 2;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.13');
      expect(scaled).assertEqual(13);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0906 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0907
     * @tc.name      intlNumber0907
     * @tc.desc      数值 0.125 保留 2 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0907', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0907 begin');
      const value: number = 0.125;
      const digits: number = 2;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.13');
      expect(scaled).assertEqual(13);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0907 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0908
     * @tc.name      intlNumber0908
     * @tc.desc      数值 0.125 保留 2 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0908', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0908 begin');
      const value: number = 0.125;
      const digits: number = 2;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.13');
      expect(scaled).assertEqual(13);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0908 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0909
     * @tc.name      intlNumber0909
     * @tc.desc      数值 0.125 保留 2 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0909', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0909 begin');
      const value: number = 0.125;
      const digits: number = 2;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.13');
      expect(scaled).assertEqual(13);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0909 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0910
     * @tc.name      intlNumber0910
     * @tc.desc      数值 0.125 保留 2 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0910', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0910 begin');
      const value: number = 0.125;
      const digits: number = 2;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.13');
      expect(scaled).assertEqual(13);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0910 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0911
     * @tc.name      intlNumber0911
     * @tc.desc      数值 0.125 保留 3 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0911', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0911 begin');
      const value: number = 0.125;
      const digits: number = 3;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.125');
      expect(scaled).assertEqual(125);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0911 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0912
     * @tc.name      intlNumber0912
     * @tc.desc      数值 0.125 保留 3 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0912', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0912 begin');
      const value: number = 0.125;
      const digits: number = 3;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.125');
      expect(scaled).assertEqual(125);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0912 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0913
     * @tc.name      intlNumber0913
     * @tc.desc      数值 0.125 保留 3 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0913', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0913 begin');
      const value: number = 0.125;
      const digits: number = 3;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.125');
      expect(scaled).assertEqual(125);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0913 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0914
     * @tc.name      intlNumber0914
     * @tc.desc      数值 0.125 保留 3 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0914', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0914 begin');
      const value: number = 0.125;
      const digits: number = 3;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.125');
      expect(scaled).assertEqual(125);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0914 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0915
     * @tc.name      intlNumber0915
     * @tc.desc      数值 0.125 保留 3 位小数并映射到第 5 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0915', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0915 begin');
      const value: number = 0.125;
      const digits: number = 3;
      const currencyIdx: number = 5;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.125');
      expect(scaled).assertEqual(125);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0915 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0916
     * @tc.name      intlNumber0916
     * @tc.desc      数值 0.125 保留 3 位小数并映射到第 6 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0916', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0916 begin');
      const value: number = 0.125;
      const digits: number = 3;
      const currencyIdx: number = 6;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.125');
      expect(scaled).assertEqual(125);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0916 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0917
     * @tc.name      intlNumber0917
     * @tc.desc      数值 0.125 保留 3 位小数并映射到第 7 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0917', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0917 begin');
      const value: number = 0.125;
      const digits: number = 3;
      const currencyIdx: number = 7;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.125');
      expect(scaled).assertEqual(125);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0917 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0918
     * @tc.name      intlNumber0918
     * @tc.desc      数值 0.125 保留 3 位小数并映射到第 8 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0918', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0918 begin');
      const value: number = 0.125;
      const digits: number = 3;
      const currencyIdx: number = 8;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.125');
      expect(scaled).assertEqual(125);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0918 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0919
     * @tc.name      intlNumber0919
     * @tc.desc      数值 0.125 保留 3 位小数并映射到第 9 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0919', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0919 begin');
      const value: number = 0.125;
      const digits: number = 3;
      const currencyIdx: number = 9;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.125');
      expect(scaled).assertEqual(125);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0919 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0920
     * @tc.name      intlNumber0920
     * @tc.desc      数值 0.125 保留 3 位小数并映射到第 10 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0920', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0920 begin');
      const value: number = 0.125;
      const digits: number = 3;
      const currencyIdx: number = 10;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.125');
      expect(scaled).assertEqual(125);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0920 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0921
     * @tc.name      intlNumber0921
     * @tc.desc      数值 0.125 保留 4 位小数并映射到第 1 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0921', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0921 begin');
      const value: number = 0.125;
      const digits: number = 4;
      const currencyIdx: number = 1;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.1250');
      expect(scaled).assertEqual(1250);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0921 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0922
     * @tc.name      intlNumber0922
     * @tc.desc      数值 0.125 保留 4 位小数并映射到第 2 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0922', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0922 begin');
      const value: number = 0.125;
      const digits: number = 4;
      const currencyIdx: number = 2;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.1250');
      expect(scaled).assertEqual(1250);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0922 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0923
     * @tc.name      intlNumber0923
     * @tc.desc      数值 0.125 保留 4 位小数并映射到第 3 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0923', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0923 begin');
      const value: number = 0.125;
      const digits: number = 4;
      const currencyIdx: number = 3;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.1250');
      expect(scaled).assertEqual(1250);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0923 end');
    })

    /**
     * @tc.number    INTL_NUMBER_0924
     * @tc.name      intlNumber0924
     * @tc.desc      数值 0.125 保留 4 位小数并映射到第 4 个币种符号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlNumber0924', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0924 begin');
      const value: number = 0.125;
      const digits: number = 4;
      const currencyIdx: number = 4;
      const fixed: string = value.toFixed(digits);
      const scaled: number = Math.round(value * Math.pow(10, digits));
      const groupCount: number = fixed.split('.')[0].replace('-', '').length;
      expect(fixed).assertEqual('0.1250');
      expect(scaled).assertEqual(1250);
      expect(groupCount).assertEqual(1);
      expect(currencyIdx >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlNumber0924 end');
    })
  })
}
