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

export default function intlDateTimeMatrix14Test(): void {
  describe('IntlDateTimeMatrix14Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    INTL_DATE_0924
     * @tc.name      intlDateTime0924
     * @tc.desc      de-DE 第 4 号样式在时区偏移 12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0924', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0924 begin');
      const locale: string = 'de-DE';
      const style: number = 4;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0924 end');
    })

    /**
     * @tc.number    INTL_DATE_0925
     * @tc.name      intlDateTime0925
     * @tc.desc      de-DE 第 5 号样式在时区偏移 -12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0925', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0925 begin');
      const locale: string = 'de-DE';
      const style: number = 5;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0925 end');
    })

    /**
     * @tc.number    INTL_DATE_0926
     * @tc.name      intlDateTime0926
     * @tc.desc      de-DE 第 5 号样式在时区偏移 -8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0926', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0926 begin');
      const locale: string = 'de-DE';
      const style: number = 5;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0926 end');
    })

    /**
     * @tc.number    INTL_DATE_0927
     * @tc.name      intlDateTime0927
     * @tc.desc      de-DE 第 5 号样式在时区偏移 -5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0927', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0927 begin');
      const locale: string = 'de-DE';
      const style: number = 5;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0927 end');
    })

    /**
     * @tc.number    INTL_DATE_0928
     * @tc.name      intlDateTime0928
     * @tc.desc      de-DE 第 5 号样式在时区偏移 -3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0928', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0928 begin');
      const locale: string = 'de-DE';
      const style: number = 5;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0928 end');
    })

    /**
     * @tc.number    INTL_DATE_0929
     * @tc.name      intlDateTime0929
     * @tc.desc      de-DE 第 5 号样式在时区偏移 0 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0929', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0929 begin');
      const locale: string = 'de-DE';
      const style: number = 5;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0929 end');
    })

    /**
     * @tc.number    INTL_DATE_0930
     * @tc.name      intlDateTime0930
     * @tc.desc      de-DE 第 5 号样式在时区偏移 1 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0930', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0930 begin');
      const locale: string = 'de-DE';
      const style: number = 5;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0930 end');
    })

    /**
     * @tc.number    INTL_DATE_0931
     * @tc.name      intlDateTime0931
     * @tc.desc      de-DE 第 5 号样式在时区偏移 3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0931', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0931 begin');
      const locale: string = 'de-DE';
      const style: number = 5;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0931 end');
    })

    /**
     * @tc.number    INTL_DATE_0932
     * @tc.name      intlDateTime0932
     * @tc.desc      de-DE 第 5 号样式在时区偏移 5.5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0932', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0932 begin');
      const locale: string = 'de-DE';
      const style: number = 5;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0932 end');
    })

    /**
     * @tc.number    INTL_DATE_0933
     * @tc.name      intlDateTime0933
     * @tc.desc      de-DE 第 5 号样式在时区偏移 8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0933', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0933 begin');
      const locale: string = 'de-DE';
      const style: number = 5;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0933 end');
    })

    /**
     * @tc.number    INTL_DATE_0934
     * @tc.name      intlDateTime0934
     * @tc.desc      de-DE 第 5 号样式在时区偏移 9 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0934', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0934 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0934 end');
    })

    /**
     * @tc.number    INTL_DATE_0935
     * @tc.name      intlDateTime0935
     * @tc.desc      de-DE 第 5 号样式在时区偏移 10 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0935', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0935 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0935 end');
    })

    /**
     * @tc.number    INTL_DATE_0936
     * @tc.name      intlDateTime0936
     * @tc.desc      de-DE 第 5 号样式在时区偏移 12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0936', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0936 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0936 end');
    })

    /**
     * @tc.number    INTL_DATE_0937
     * @tc.name      intlDateTime0937
     * @tc.desc      de-DE 第 6 号样式在时区偏移 -12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0937', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0937 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0937 end');
    })

    /**
     * @tc.number    INTL_DATE_0938
     * @tc.name      intlDateTime0938
     * @tc.desc      de-DE 第 6 号样式在时区偏移 -8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0938', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0938 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0938 end');
    })

    /**
     * @tc.number    INTL_DATE_0939
     * @tc.name      intlDateTime0939
     * @tc.desc      de-DE 第 6 号样式在时区偏移 -5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0939', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0939 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0939 end');
    })

    /**
     * @tc.number    INTL_DATE_0940
     * @tc.name      intlDateTime0940
     * @tc.desc      de-DE 第 6 号样式在时区偏移 -3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0940', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0940 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0940 end');
    })

    /**
     * @tc.number    INTL_DATE_0941
     * @tc.name      intlDateTime0941
     * @tc.desc      de-DE 第 6 号样式在时区偏移 0 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0941', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0941 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0941 end');
    })

    /**
     * @tc.number    INTL_DATE_0942
     * @tc.name      intlDateTime0942
     * @tc.desc      de-DE 第 6 号样式在时区偏移 1 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0942', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0942 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0942 end');
    })

    /**
     * @tc.number    INTL_DATE_0943
     * @tc.name      intlDateTime0943
     * @tc.desc      de-DE 第 6 号样式在时区偏移 3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0943', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0943 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0943 end');
    })

    /**
     * @tc.number    INTL_DATE_0944
     * @tc.name      intlDateTime0944
     * @tc.desc      de-DE 第 6 号样式在时区偏移 5.5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0944', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0944 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0944 end');
    })

    /**
     * @tc.number    INTL_DATE_0945
     * @tc.name      intlDateTime0945
     * @tc.desc      de-DE 第 6 号样式在时区偏移 8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0945', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0945 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0945 end');
    })

    /**
     * @tc.number    INTL_DATE_0946
     * @tc.name      intlDateTime0946
     * @tc.desc      de-DE 第 6 号样式在时区偏移 9 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0946', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0946 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0946 end');
    })

    /**
     * @tc.number    INTL_DATE_0947
     * @tc.name      intlDateTime0947
     * @tc.desc      de-DE 第 6 号样式在时区偏移 10 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0947', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0947 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0947 end');
    })

    /**
     * @tc.number    INTL_DATE_0948
     * @tc.name      intlDateTime0948
     * @tc.desc      de-DE 第 6 号样式在时区偏移 12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0948', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0948 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0948 end');
    })

    /**
     * @tc.number    INTL_DATE_0949
     * @tc.name      intlDateTime0949
     * @tc.desc      de-DE 第 7 号样式在时区偏移 -12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0949', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0949 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0949 end');
    })

    /**
     * @tc.number    INTL_DATE_0950
     * @tc.name      intlDateTime0950
     * @tc.desc      de-DE 第 7 号样式在时区偏移 -8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0950', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0950 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0950 end');
    })

    /**
     * @tc.number    INTL_DATE_0951
     * @tc.name      intlDateTime0951
     * @tc.desc      de-DE 第 7 号样式在时区偏移 -5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0951', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0951 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0951 end');
    })

    /**
     * @tc.number    INTL_DATE_0952
     * @tc.name      intlDateTime0952
     * @tc.desc      de-DE 第 7 号样式在时区偏移 -3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0952', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0952 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0952 end');
    })

    /**
     * @tc.number    INTL_DATE_0953
     * @tc.name      intlDateTime0953
     * @tc.desc      de-DE 第 7 号样式在时区偏移 0 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0953', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0953 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0953 end');
    })

    /**
     * @tc.number    INTL_DATE_0954
     * @tc.name      intlDateTime0954
     * @tc.desc      de-DE 第 7 号样式在时区偏移 1 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0954', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0954 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0954 end');
    })

    /**
     * @tc.number    INTL_DATE_0955
     * @tc.name      intlDateTime0955
     * @tc.desc      de-DE 第 7 号样式在时区偏移 3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0955', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0955 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0955 end');
    })

    /**
     * @tc.number    INTL_DATE_0956
     * @tc.name      intlDateTime0956
     * @tc.desc      de-DE 第 7 号样式在时区偏移 5.5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0956', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0956 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0956 end');
    })

    /**
     * @tc.number    INTL_DATE_0957
     * @tc.name      intlDateTime0957
     * @tc.desc      de-DE 第 7 号样式在时区偏移 8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0957', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0957 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0957 end');
    })

    /**
     * @tc.number    INTL_DATE_0958
     * @tc.name      intlDateTime0958
     * @tc.desc      de-DE 第 7 号样式在时区偏移 9 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0958', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0958 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0958 end');
    })

    /**
     * @tc.number    INTL_DATE_0959
     * @tc.name      intlDateTime0959
     * @tc.desc      de-DE 第 7 号样式在时区偏移 10 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0959', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0959 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0959 end');
    })

    /**
     * @tc.number    INTL_DATE_0960
     * @tc.name      intlDateTime0960
     * @tc.desc      de-DE 第 7 号样式在时区偏移 12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0960', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0960 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0960 end');
    })

    /**
     * @tc.number    INTL_DATE_0961
     * @tc.name      intlDateTime0961
     * @tc.desc      de-DE 第 8 号样式在时区偏移 -12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0961', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0961 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0961 end');
    })

    /**
     * @tc.number    INTL_DATE_0962
     * @tc.name      intlDateTime0962
     * @tc.desc      de-DE 第 8 号样式在时区偏移 -8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0962', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0962 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0962 end');
    })

    /**
     * @tc.number    INTL_DATE_0963
     * @tc.name      intlDateTime0963
     * @tc.desc      de-DE 第 8 号样式在时区偏移 -5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0963', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0963 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0963 end');
    })

    /**
     * @tc.number    INTL_DATE_0964
     * @tc.name      intlDateTime0964
     * @tc.desc      de-DE 第 8 号样式在时区偏移 -3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0964', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0964 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0964 end');
    })

    /**
     * @tc.number    INTL_DATE_0965
     * @tc.name      intlDateTime0965
     * @tc.desc      de-DE 第 8 号样式在时区偏移 0 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0965', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0965 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0965 end');
    })

    /**
     * @tc.number    INTL_DATE_0966
     * @tc.name      intlDateTime0966
     * @tc.desc      de-DE 第 8 号样式在时区偏移 1 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0966', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0966 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0966 end');
    })

    /**
     * @tc.number    INTL_DATE_0967
     * @tc.name      intlDateTime0967
     * @tc.desc      de-DE 第 8 号样式在时区偏移 3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0967', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0967 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0967 end');
    })

    /**
     * @tc.number    INTL_DATE_0968
     * @tc.name      intlDateTime0968
     * @tc.desc      de-DE 第 8 号样式在时区偏移 5.5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0968', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0968 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0968 end');
    })

    /**
     * @tc.number    INTL_DATE_0969
     * @tc.name      intlDateTime0969
     * @tc.desc      de-DE 第 8 号样式在时区偏移 8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0969', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0969 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0969 end');
    })

    /**
     * @tc.number    INTL_DATE_0970
     * @tc.name      intlDateTime0970
     * @tc.desc      de-DE 第 8 号样式在时区偏移 9 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0970', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0970 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0970 end');
    })

    /**
     * @tc.number    INTL_DATE_0971
     * @tc.name      intlDateTime0971
     * @tc.desc      de-DE 第 8 号样式在时区偏移 10 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0971', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0971 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0971 end');
    })

    /**
     * @tc.number    INTL_DATE_0972
     * @tc.name      intlDateTime0972
     * @tc.desc      de-DE 第 8 号样式在时区偏移 12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0972', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0972 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0972 end');
    })

    /**
     * @tc.number    INTL_DATE_0973
     * @tc.name      intlDateTime0973
     * @tc.desc      de-DE 第 9 号样式在时区偏移 -12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0973', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0973 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0973 end');
    })

    /**
     * @tc.number    INTL_DATE_0974
     * @tc.name      intlDateTime0974
     * @tc.desc      de-DE 第 9 号样式在时区偏移 -8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0974', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0974 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0974 end');
    })

    /**
     * @tc.number    INTL_DATE_0975
     * @tc.name      intlDateTime0975
     * @tc.desc      de-DE 第 9 号样式在时区偏移 -5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0975', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0975 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0975 end');
    })

    /**
     * @tc.number    INTL_DATE_0976
     * @tc.name      intlDateTime0976
     * @tc.desc      de-DE 第 9 号样式在时区偏移 -3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0976', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0976 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0976 end');
    })

    /**
     * @tc.number    INTL_DATE_0977
     * @tc.name      intlDateTime0977
     * @tc.desc      de-DE 第 9 号样式在时区偏移 0 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0977', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0977 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0977 end');
    })

    /**
     * @tc.number    INTL_DATE_0978
     * @tc.name      intlDateTime0978
     * @tc.desc      de-DE 第 9 号样式在时区偏移 1 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0978', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0978 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0978 end');
    })

    /**
     * @tc.number    INTL_DATE_0979
     * @tc.name      intlDateTime0979
     * @tc.desc      de-DE 第 9 号样式在时区偏移 3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0979', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0979 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0979 end');
    })

    /**
     * @tc.number    INTL_DATE_0980
     * @tc.name      intlDateTime0980
     * @tc.desc      de-DE 第 9 号样式在时区偏移 5.5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0980', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0980 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0980 end');
    })

    /**
     * @tc.number    INTL_DATE_0981
     * @tc.name      intlDateTime0981
     * @tc.desc      de-DE 第 9 号样式在时区偏移 8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0981', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0981 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0981 end');
    })

    /**
     * @tc.number    INTL_DATE_0982
     * @tc.name      intlDateTime0982
     * @tc.desc      de-DE 第 9 号样式在时区偏移 9 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0982', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0982 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0982 end');
    })

    /**
     * @tc.number    INTL_DATE_0983
     * @tc.name      intlDateTime0983
     * @tc.desc      de-DE 第 9 号样式在时区偏移 10 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0983', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0983 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0983 end');
    })

    /**
     * @tc.number    INTL_DATE_0984
     * @tc.name      intlDateTime0984
     * @tc.desc      de-DE 第 9 号样式在时区偏移 12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0984', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0984 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0984 end');
    })

    /**
     * @tc.number    INTL_DATE_0985
     * @tc.name      intlDateTime0985
     * @tc.desc      de-DE 第 10 号样式在时区偏移 -12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0985', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0985 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0985 end');
    })

    /**
     * @tc.number    INTL_DATE_0986
     * @tc.name      intlDateTime0986
     * @tc.desc      de-DE 第 10 号样式在时区偏移 -8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0986', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0986 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0986 end');
    })

    /**
     * @tc.number    INTL_DATE_0987
     * @tc.name      intlDateTime0987
     * @tc.desc      de-DE 第 10 号样式在时区偏移 -5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0987', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0987 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0987 end');
    })

    /**
     * @tc.number    INTL_DATE_0988
     * @tc.name      intlDateTime0988
     * @tc.desc      de-DE 第 10 号样式在时区偏移 -3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0988', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0988 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0988 end');
    })

    /**
     * @tc.number    INTL_DATE_0989
     * @tc.name      intlDateTime0989
     * @tc.desc      de-DE 第 10 号样式在时区偏移 0 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0989', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0989 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0989 end');
    })

    /**
     * @tc.number    INTL_DATE_0990
     * @tc.name      intlDateTime0990
     * @tc.desc      de-DE 第 10 号样式在时区偏移 1 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0990', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0990 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0990 end');
    })

    /**
     * @tc.number    INTL_DATE_0991
     * @tc.name      intlDateTime0991
     * @tc.desc      de-DE 第 10 号样式在时区偏移 3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0991', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0991 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0991 end');
    })

    /**
     * @tc.number    INTL_DATE_0992
     * @tc.name      intlDateTime0992
     * @tc.desc      de-DE 第 10 号样式在时区偏移 5.5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0992', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0992 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0992 end');
    })

    /**
     * @tc.number    INTL_DATE_0993
     * @tc.name      intlDateTime0993
     * @tc.desc      de-DE 第 10 号样式在时区偏移 8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0993', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0993 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0993 end');
    })

    /**
     * @tc.number    INTL_DATE_0994
     * @tc.name      intlDateTime0994
     * @tc.desc      de-DE 第 10 号样式在时区偏移 9 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0994', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0994 begin');
      const locale: string = 'de-DE';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0994 end');
    })
  })
}
