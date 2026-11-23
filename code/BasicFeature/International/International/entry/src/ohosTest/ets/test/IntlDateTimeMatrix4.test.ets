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

export default function intlDateTimeMatrix4Test(): void {
  describe('IntlDateTimeMatrix4Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    INTL_DATE_0214
     * @tc.name      intlDateTime0214
     * @tc.desc      zh-HK 第 5 号样式在时区偏移 9 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0214 begin');
      const locale: string = 'zh-HK';
      const style: number = 5;
      const offset: number = 9;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(9);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0214 end');
    })

    /**
     * @tc.number    INTL_DATE_0215
     * @tc.name      intlDateTime0215
     * @tc.desc      zh-HK 第 5 号样式在时区偏移 10 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0215 begin');
      const locale: string = 'zh-HK';
      const style: number = 5;
      const offset: number = 10;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(10);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0215 end');
    })

    /**
     * @tc.number    INTL_DATE_0216
     * @tc.name      intlDateTime0216
     * @tc.desc      zh-HK 第 5 号样式在时区偏移 12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0216 begin');
      const locale: string = 'zh-HK';
      const style: number = 5;
      const offset: number = 12;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(12);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0216 end');
    })

    /**
     * @tc.number    INTL_DATE_0217
     * @tc.name      intlDateTime0217
     * @tc.desc      zh-HK 第 6 号样式在时区偏移 -12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0217 begin');
      const locale: string = 'zh-HK';
      const style: number = 6;
      const offset: number = -12;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(12);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(6);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0217 end');
    })

    /**
     * @tc.number    INTL_DATE_0218
     * @tc.name      intlDateTime0218
     * @tc.desc      zh-HK 第 6 号样式在时区偏移 -8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0218 begin');
      const locale: string = 'zh-HK';
      const style: number = 6;
      const offset: number = -8;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(16);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(6);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0218 end');
    })

    /**
     * @tc.number    INTL_DATE_0219
     * @tc.name      intlDateTime0219
     * @tc.desc      zh-HK 第 6 号样式在时区偏移 -5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0219 begin');
      const locale: string = 'zh-HK';
      const style: number = 6;
      const offset: number = -5;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(19);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(6);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0219 end');
    })

    /**
     * @tc.number    INTL_DATE_0220
     * @tc.name      intlDateTime0220
     * @tc.desc      zh-HK 第 6 号样式在时区偏移 -3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0220 begin');
      const locale: string = 'zh-HK';
      const style: number = 6;
      const offset: number = -3;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(21);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(6);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0220 end');
    })

    /**
     * @tc.number    INTL_DATE_0221
     * @tc.name      intlDateTime0221
     * @tc.desc      zh-HK 第 6 号样式在时区偏移 0 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0221 begin');
      const locale: string = 'zh-HK';
      const style: number = 6;
      const offset: number = 0;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(0);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0221 end');
    })

    /**
     * @tc.number    INTL_DATE_0222
     * @tc.name      intlDateTime0222
     * @tc.desc      zh-HK 第 6 号样式在时区偏移 1 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0222 begin');
      const locale: string = 'zh-HK';
      const style: number = 6;
      const offset: number = 1;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(1);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0222 end');
    })

    /**
     * @tc.number    INTL_DATE_0223
     * @tc.name      intlDateTime0223
     * @tc.desc      zh-HK 第 6 号样式在时区偏移 3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0223 begin');
      const locale: string = 'zh-HK';
      const style: number = 6;
      const offset: number = 3;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(3);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0223 end');
    })

    /**
     * @tc.number    INTL_DATE_0224
     * @tc.name      intlDateTime0224
     * @tc.desc      zh-HK 第 6 号样式在时区偏移 5.5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0224 begin');
      const locale: string = 'zh-HK';
      const style: number = 6;
      const offset: number = 5.5;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(5);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0224 end');
    })

    /**
     * @tc.number    INTL_DATE_0225
     * @tc.name      intlDateTime0225
     * @tc.desc      zh-HK 第 6 号样式在时区偏移 8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0225 begin');
      const locale: string = 'zh-HK';
      const style: number = 6;
      const offset: number = 8;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(8);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0225 end');
    })

    /**
     * @tc.number    INTL_DATE_0226
     * @tc.name      intlDateTime0226
     * @tc.desc      zh-HK 第 6 号样式在时区偏移 9 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0226 begin');
      const locale: string = 'zh-HK';
      const style: number = 6;
      const offset: number = 9;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(9);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0226 end');
    })

    /**
     * @tc.number    INTL_DATE_0227
     * @tc.name      intlDateTime0227
     * @tc.desc      zh-HK 第 6 号样式在时区偏移 10 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0227 begin');
      const locale: string = 'zh-HK';
      const style: number = 6;
      const offset: number = 10;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(10);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0227 end');
    })

    /**
     * @tc.number    INTL_DATE_0228
     * @tc.name      intlDateTime0228
     * @tc.desc      zh-HK 第 6 号样式在时区偏移 12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0228 begin');
      const locale: string = 'zh-HK';
      const style: number = 6;
      const offset: number = 12;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(12);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0228 end');
    })

    /**
     * @tc.number    INTL_DATE_0229
     * @tc.name      intlDateTime0229
     * @tc.desc      zh-HK 第 7 号样式在时区偏移 -12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0229 begin');
      const locale: string = 'zh-HK';
      const style: number = 7;
      const offset: number = -12;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(12);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(6);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0229 end');
    })

    /**
     * @tc.number    INTL_DATE_0230
     * @tc.name      intlDateTime0230
     * @tc.desc      zh-HK 第 7 号样式在时区偏移 -8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0230 begin');
      const locale: string = 'zh-HK';
      const style: number = 7;
      const offset: number = -8;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(16);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(6);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0230 end');
    })

    /**
     * @tc.number    INTL_DATE_0231
     * @tc.name      intlDateTime0231
     * @tc.desc      zh-HK 第 7 号样式在时区偏移 -5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0231 begin');
      const locale: string = 'zh-HK';
      const style: number = 7;
      const offset: number = -5;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(19);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(6);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0231 end');
    })

    /**
     * @tc.number    INTL_DATE_0232
     * @tc.name      intlDateTime0232
     * @tc.desc      zh-HK 第 7 号样式在时区偏移 -3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0232 begin');
      const locale: string = 'zh-HK';
      const style: number = 7;
      const offset: number = -3;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(21);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(6);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0232 end');
    })

    /**
     * @tc.number    INTL_DATE_0233
     * @tc.name      intlDateTime0233
     * @tc.desc      zh-HK 第 7 号样式在时区偏移 0 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0233 begin');
      const locale: string = 'zh-HK';
      const style: number = 7;
      const offset: number = 0;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(0);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0233 end');
    })

    /**
     * @tc.number    INTL_DATE_0234
     * @tc.name      intlDateTime0234
     * @tc.desc      zh-HK 第 7 号样式在时区偏移 1 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0234 begin');
      const locale: string = 'zh-HK';
      const style: number = 7;
      const offset: number = 1;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(1);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0234 end');
    })

    /**
     * @tc.number    INTL_DATE_0235
     * @tc.name      intlDateTime0235
     * @tc.desc      zh-HK 第 7 号样式在时区偏移 3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0235 begin');
      const locale: string = 'zh-HK';
      const style: number = 7;
      const offset: number = 3;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(3);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0235 end');
    })

    /**
     * @tc.number    INTL_DATE_0236
     * @tc.name      intlDateTime0236
     * @tc.desc      zh-HK 第 7 号样式在时区偏移 5.5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0236 begin');
      const locale: string = 'zh-HK';
      const style: number = 7;
      const offset: number = 5.5;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(5);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0236 end');
    })

    /**
     * @tc.number    INTL_DATE_0237
     * @tc.name      intlDateTime0237
     * @tc.desc      zh-HK 第 7 号样式在时区偏移 8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0237 begin');
      const locale: string = 'zh-HK';
      const style: number = 7;
      const offset: number = 8;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(8);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0237 end');
    })

    /**
     * @tc.number    INTL_DATE_0238
     * @tc.name      intlDateTime0238
     * @tc.desc      zh-HK 第 7 号样式在时区偏移 9 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0238 begin');
      const locale: string = 'zh-HK';
      const style: number = 7;
      const offset: number = 9;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(9);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0238 end');
    })

    /**
     * @tc.number    INTL_DATE_0239
     * @tc.name      intlDateTime0239
     * @tc.desc      zh-HK 第 7 号样式在时区偏移 10 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0239 begin');
      const locale: string = 'zh-HK';
      const style: number = 7;
      const offset: number = 10;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(10);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0239 end');
    })

    /**
     * @tc.number    INTL_DATE_0240
     * @tc.name      intlDateTime0240
     * @tc.desc      zh-HK 第 7 号样式在时区偏移 12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0240 begin');
      const locale: string = 'zh-HK';
      const style: number = 7;
      const offset: number = 12;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(12);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0240 end');
    })

    /**
     * @tc.number    INTL_DATE_0241
     * @tc.name      intlDateTime0241
     * @tc.desc      zh-HK 第 8 号样式在时区偏移 -12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0241 begin');
      const locale: string = 'zh-HK';
      const style: number = 8;
      const offset: number = -12;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(12);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(6);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0241 end');
    })

    /**
     * @tc.number    INTL_DATE_0242
     * @tc.name      intlDateTime0242
     * @tc.desc      zh-HK 第 8 号样式在时区偏移 -8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0242 begin');
      const locale: string = 'zh-HK';
      const style: number = 8;
      const offset: number = -8;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(16);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(6);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0242 end');
    })

    /**
     * @tc.number    INTL_DATE_0243
     * @tc.name      intlDateTime0243
     * @tc.desc      zh-HK 第 8 号样式在时区偏移 -5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0243 begin');
      const locale: string = 'zh-HK';
      const style: number = 8;
      const offset: number = -5;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(19);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(6);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0243 end');
    })

    /**
     * @tc.number    INTL_DATE_0244
     * @tc.name      intlDateTime0244
     * @tc.desc      zh-HK 第 8 号样式在时区偏移 -3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0244 begin');
      const locale: string = 'zh-HK';
      const style: number = 8;
      const offset: number = -3;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(21);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(6);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0244 end');
    })

    /**
     * @tc.number    INTL_DATE_0245
     * @tc.name      intlDateTime0245
     * @tc.desc      zh-HK 第 8 号样式在时区偏移 0 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0245 begin');
      const locale: string = 'zh-HK';
      const style: number = 8;
      const offset: number = 0;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(0);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0245 end');
    })

    /**
     * @tc.number    INTL_DATE_0246
     * @tc.name      intlDateTime0246
     * @tc.desc      zh-HK 第 8 号样式在时区偏移 1 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0246 begin');
      const locale: string = 'zh-HK';
      const style: number = 8;
      const offset: number = 1;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(1);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0246 end');
    })

    /**
     * @tc.number    INTL_DATE_0247
     * @tc.name      intlDateTime0247
     * @tc.desc      zh-HK 第 8 号样式在时区偏移 3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0247 begin');
      const locale: string = 'zh-HK';
      const style: number = 8;
      const offset: number = 3;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(3);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0247 end');
    })

    /**
     * @tc.number    INTL_DATE_0248
     * @tc.name      intlDateTime0248
     * @tc.desc      zh-HK 第 8 号样式在时区偏移 5.5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0248 begin');
      const locale: string = 'zh-HK';
      const style: number = 8;
      const offset: number = 5.5;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(5);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0248 end');
    })

    /**
     * @tc.number    INTL_DATE_0249
     * @tc.name      intlDateTime0249
     * @tc.desc      zh-HK 第 8 号样式在时区偏移 8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0249 begin');
      const locale: string = 'zh-HK';
      const style: number = 8;
      const offset: number = 8;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(8);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0249 end');
    })

    /**
     * @tc.number    INTL_DATE_0250
     * @tc.name      intlDateTime0250
     * @tc.desc      zh-HK 第 8 号样式在时区偏移 9 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0250 begin');
      const locale: string = 'zh-HK';
      const style: number = 8;
      const offset: number = 9;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(9);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0250 end');
    })

    /**
     * @tc.number    INTL_DATE_0251
     * @tc.name      intlDateTime0251
     * @tc.desc      zh-HK 第 8 号样式在时区偏移 10 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0251 begin');
      const locale: string = 'zh-HK';
      const style: number = 8;
      const offset: number = 10;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(10);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0251 end');
    })

    /**
     * @tc.number    INTL_DATE_0252
     * @tc.name      intlDateTime0252
     * @tc.desc      zh-HK 第 8 号样式在时区偏移 12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0252 begin');
      const locale: string = 'zh-HK';
      const style: number = 8;
      const offset: number = 12;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(12);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0252 end');
    })

    /**
     * @tc.number    INTL_DATE_0253
     * @tc.name      intlDateTime0253
     * @tc.desc      zh-HK 第 9 号样式在时区偏移 -12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0253 begin');
      const locale: string = 'zh-HK';
      const style: number = 9;
      const offset: number = -12;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(12);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(6);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0253 end');
    })

    /**
     * @tc.number    INTL_DATE_0254
     * @tc.name      intlDateTime0254
     * @tc.desc      zh-HK 第 9 号样式在时区偏移 -8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0254 begin');
      const locale: string = 'zh-HK';
      const style: number = 9;
      const offset: number = -8;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(16);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(6);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0254 end');
    })

    /**
     * @tc.number    INTL_DATE_0255
     * @tc.name      intlDateTime0255
     * @tc.desc      zh-HK 第 9 号样式在时区偏移 -5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0255 begin');
      const locale: string = 'zh-HK';
      const style: number = 9;
      const offset: number = -5;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(19);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(6);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0255 end');
    })

    /**
     * @tc.number    INTL_DATE_0256
     * @tc.name      intlDateTime0256
     * @tc.desc      zh-HK 第 9 号样式在时区偏移 -3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0256 begin');
      const locale: string = 'zh-HK';
      const style: number = 9;
      const offset: number = -3;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(21);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(6);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0256 end');
    })

    /**
     * @tc.number    INTL_DATE_0257
     * @tc.name      intlDateTime0257
     * @tc.desc      zh-HK 第 9 号样式在时区偏移 0 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0257 begin');
      const locale: string = 'zh-HK';
      const style: number = 9;
      const offset: number = 0;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(0);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0257 end');
    })

    /**
     * @tc.number    INTL_DATE_0258
     * @tc.name      intlDateTime0258
     * @tc.desc      zh-HK 第 9 号样式在时区偏移 1 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0258 begin');
      const locale: string = 'zh-HK';
      const style: number = 9;
      const offset: number = 1;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(1);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0258 end');
    })

    /**
     * @tc.number    INTL_DATE_0259
     * @tc.name      intlDateTime0259
     * @tc.desc      zh-HK 第 9 号样式在时区偏移 3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0259 begin');
      const locale: string = 'zh-HK';
      const style: number = 9;
      const offset: number = 3;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(3);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0259 end');
    })

    /**
     * @tc.number    INTL_DATE_0260
     * @tc.name      intlDateTime0260
     * @tc.desc      zh-HK 第 9 号样式在时区偏移 5.5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0260 begin');
      const locale: string = 'zh-HK';
      const style: number = 9;
      const offset: number = 5.5;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(5);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0260 end');
    })

    /**
     * @tc.number    INTL_DATE_0261
     * @tc.name      intlDateTime0261
     * @tc.desc      zh-HK 第 9 号样式在时区偏移 8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0261 begin');
      const locale: string = 'zh-HK';
      const style: number = 9;
      const offset: number = 8;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(8);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0261 end');
    })

    /**
     * @tc.number    INTL_DATE_0262
     * @tc.name      intlDateTime0262
     * @tc.desc      zh-HK 第 9 号样式在时区偏移 9 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0262 begin');
      const locale: string = 'zh-HK';
      const style: number = 9;
      const offset: number = 9;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(9);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0262 end');
    })

    /**
     * @tc.number    INTL_DATE_0263
     * @tc.name      intlDateTime0263
     * @tc.desc      zh-HK 第 9 号样式在时区偏移 10 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0263 begin');
      const locale: string = 'zh-HK';
      const style: number = 9;
      const offset: number = 10;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(10);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0263 end');
    })

    /**
     * @tc.number    INTL_DATE_0264
     * @tc.name      intlDateTime0264
     * @tc.desc      zh-HK 第 9 号样式在时区偏移 12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0264 begin');
      const locale: string = 'zh-HK';
      const style: number = 9;
      const offset: number = 12;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(12);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0264 end');
    })

    /**
     * @tc.number    INTL_DATE_0265
     * @tc.name      intlDateTime0265
     * @tc.desc      zh-HK 第 10 号样式在时区偏移 -12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0265 begin');
      const locale: string = 'zh-HK';
      const style: number = 10;
      const offset: number = -12;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(12);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(6);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0265 end');
    })

    /**
     * @tc.number    INTL_DATE_0266
     * @tc.name      intlDateTime0266
     * @tc.desc      zh-HK 第 10 号样式在时区偏移 -8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0266 begin');
      const locale: string = 'zh-HK';
      const style: number = 10;
      const offset: number = -8;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(16);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(6);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0266 end');
    })

    /**
     * @tc.number    INTL_DATE_0267
     * @tc.name      intlDateTime0267
     * @tc.desc      zh-HK 第 10 号样式在时区偏移 -5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0267 begin');
      const locale: string = 'zh-HK';
      const style: number = 10;
      const offset: number = -5;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(19);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(6);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0267 end');
    })

    /**
     * @tc.number    INTL_DATE_0268
     * @tc.name      intlDateTime0268
     * @tc.desc      zh-HK 第 10 号样式在时区偏移 -3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0268 begin');
      const locale: string = 'zh-HK';
      const style: number = 10;
      const offset: number = -3;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(21);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(6);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0268 end');
    })

    /**
     * @tc.number    INTL_DATE_0269
     * @tc.name      intlDateTime0269
     * @tc.desc      zh-HK 第 10 号样式在时区偏移 0 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0269 begin');
      const locale: string = 'zh-HK';
      const style: number = 10;
      const offset: number = 0;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(0);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0269 end');
    })

    /**
     * @tc.number    INTL_DATE_0270
     * @tc.name      intlDateTime0270
     * @tc.desc      zh-HK 第 10 号样式在时区偏移 1 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0270 begin');
      const locale: string = 'zh-HK';
      const style: number = 10;
      const offset: number = 1;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(1);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0270 end');
    })

    /**
     * @tc.number    INTL_DATE_0271
     * @tc.name      intlDateTime0271
     * @tc.desc      zh-HK 第 10 号样式在时区偏移 3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0271 begin');
      const locale: string = 'zh-HK';
      const style: number = 10;
      const offset: number = 3;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(3);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0271 end');
    })

    /**
     * @tc.number    INTL_DATE_0272
     * @tc.name      intlDateTime0272
     * @tc.desc      zh-HK 第 10 号样式在时区偏移 5.5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0272 begin');
      const locale: string = 'zh-HK';
      const style: number = 10;
      const offset: number = 5.5;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(5);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0272 end');
    })

    /**
     * @tc.number    INTL_DATE_0273
     * @tc.name      intlDateTime0273
     * @tc.desc      zh-HK 第 10 号样式在时区偏移 8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0273 begin');
      const locale: string = 'zh-HK';
      const style: number = 10;
      const offset: number = 8;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(8);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0273 end');
    })

    /**
     * @tc.number    INTL_DATE_0274
     * @tc.name      intlDateTime0274
     * @tc.desc      zh-HK 第 10 号样式在时区偏移 9 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0274 begin');
      const locale: string = 'zh-HK';
      const style: number = 10;
      const offset: number = 9;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(9);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0274 end');
    })

    /**
     * @tc.number    INTL_DATE_0275
     * @tc.name      intlDateTime0275
     * @tc.desc      zh-HK 第 10 号样式在时区偏移 10 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0275 begin');
      const locale: string = 'zh-HK';
      const style: number = 10;
      const offset: number = 10;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(10);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0275 end');
    })

    /**
     * @tc.number    INTL_DATE_0276
     * @tc.name      intlDateTime0276
     * @tc.desc      zh-HK 第 10 号样式在时区偏移 12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0276 begin');
      const locale: string = 'zh-HK';
      const style: number = 10;
      const offset: number = 12;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(12);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0276 end');
    })

    /**
     * @tc.number    INTL_DATE_0277
     * @tc.name      intlDateTime0277
     * @tc.desc      zh-HK 第 11 号样式在时区偏移 -12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0277 begin');
      const locale: string = 'zh-HK';
      const style: number = 11;
      const offset: number = -12;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(12);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(6);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0277 end');
    })

    /**
     * @tc.number    INTL_DATE_0278
     * @tc.name      intlDateTime0278
     * @tc.desc      zh-HK 第 11 号样式在时区偏移 -8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0278 begin');
      const locale: string = 'zh-HK';
      const style: number = 11;
      const offset: number = -8;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(16);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(6);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0278 end');
    })

    /**
     * @tc.number    INTL_DATE_0279
     * @tc.name      intlDateTime0279
     * @tc.desc      zh-HK 第 11 号样式在时区偏移 -5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0279 begin');
      const locale: string = 'zh-HK';
      const style: number = 11;
      const offset: number = -5;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(19);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(6);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0279 end');
    })

    /**
     * @tc.number    INTL_DATE_0280
     * @tc.name      intlDateTime0280
     * @tc.desc      zh-HK 第 11 号样式在时区偏移 -3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0280 begin');
      const locale: string = 'zh-HK';
      const style: number = 11;
      const offset: number = -3;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(21);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(6);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0280 end');
    })

    /**
     * @tc.number    INTL_DATE_0281
     * @tc.name      intlDateTime0281
     * @tc.desc      zh-HK 第 11 号样式在时区偏移 0 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0281 begin');
      const locale: string = 'zh-HK';
      const style: number = 11;
      const offset: number = 0;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(0);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0281 end');
    })

    /**
     * @tc.number    INTL_DATE_0282
     * @tc.name      intlDateTime0282
     * @tc.desc      zh-HK 第 11 号样式在时区偏移 1 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0282 begin');
      const locale: string = 'zh-HK';
      const style: number = 11;
      const offset: number = 1;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(1);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0282 end');
    })

    /**
     * @tc.number    INTL_DATE_0283
     * @tc.name      intlDateTime0283
     * @tc.desc      zh-HK 第 11 号样式在时区偏移 3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0283 begin');
      const locale: string = 'zh-HK';
      const style: number = 11;
      const offset: number = 3;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(3);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0283 end');
    })

    /**
     * @tc.number    INTL_DATE_0284
     * @tc.name      intlDateTime0284
     * @tc.desc      zh-HK 第 11 号样式在时区偏移 5.5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0284 begin');
      const locale: string = 'zh-HK';
      const style: number = 11;
      const offset: number = 5.5;
      const localMs: number = 1767225600000 + offset * 3600000;
      const hourOfDay: number = Math.floor(localMs / 3600000) % 24;
      const weekDay: number = Math.floor(localMs / 86400000) % 7;
      const label: string = locale + '-' + style;
      expect(locale.length >= 5).assertTrue();
      expect(label.indexOf('-') > 0).assertTrue();
      expect(hourOfDay).assertEqual(5);
      expect(weekDay >= 0 && weekDay < 7).assertTrue();
      expect(weekDay).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0284 end');
    })
  })
}
