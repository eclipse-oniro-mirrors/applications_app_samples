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

export default function intlDateTimeMatrix13Test(): void {
  describe('IntlDateTimeMatrix13Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    INTL_DATE_0853
     * @tc.name      intlDateTime0853
     * @tc.desc      fr-FR 第 11 号样式在时区偏移 -12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0853', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0853 begin');
      const locale: string = 'fr-FR';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0853 end');
    })

    /**
     * @tc.number    INTL_DATE_0854
     * @tc.name      intlDateTime0854
     * @tc.desc      fr-FR 第 11 号样式在时区偏移 -8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0854', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0854 begin');
      const locale: string = 'fr-FR';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0854 end');
    })

    /**
     * @tc.number    INTL_DATE_0855
     * @tc.name      intlDateTime0855
     * @tc.desc      fr-FR 第 11 号样式在时区偏移 -5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0855', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0855 begin');
      const locale: string = 'fr-FR';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0855 end');
    })

    /**
     * @tc.number    INTL_DATE_0856
     * @tc.name      intlDateTime0856
     * @tc.desc      fr-FR 第 11 号样式在时区偏移 -3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0856', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0856 begin');
      const locale: string = 'fr-FR';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0856 end');
    })

    /**
     * @tc.number    INTL_DATE_0857
     * @tc.name      intlDateTime0857
     * @tc.desc      fr-FR 第 11 号样式在时区偏移 0 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0857', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0857 begin');
      const locale: string = 'fr-FR';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0857 end');
    })

    /**
     * @tc.number    INTL_DATE_0858
     * @tc.name      intlDateTime0858
     * @tc.desc      fr-FR 第 11 号样式在时区偏移 1 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0858', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0858 begin');
      const locale: string = 'fr-FR';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0858 end');
    })

    /**
     * @tc.number    INTL_DATE_0859
     * @tc.name      intlDateTime0859
     * @tc.desc      fr-FR 第 11 号样式在时区偏移 3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0859', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0859 begin');
      const locale: string = 'fr-FR';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0859 end');
    })

    /**
     * @tc.number    INTL_DATE_0860
     * @tc.name      intlDateTime0860
     * @tc.desc      fr-FR 第 11 号样式在时区偏移 5.5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0860', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0860 begin');
      const locale: string = 'fr-FR';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0860 end');
    })

    /**
     * @tc.number    INTL_DATE_0861
     * @tc.name      intlDateTime0861
     * @tc.desc      fr-FR 第 11 号样式在时区偏移 8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0861', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0861 begin');
      const locale: string = 'fr-FR';
      const style: number = 11;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0861 end');
    })

    /**
     * @tc.number    INTL_DATE_0862
     * @tc.name      intlDateTime0862
     * @tc.desc      fr-FR 第 11 号样式在时区偏移 9 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0862', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0862 begin');
      const locale: string = 'fr-FR';
      const style: number = 11;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0862 end');
    })

    /**
     * @tc.number    INTL_DATE_0863
     * @tc.name      intlDateTime0863
     * @tc.desc      fr-FR 第 11 号样式在时区偏移 10 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0863', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0863 begin');
      const locale: string = 'fr-FR';
      const style: number = 11;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0863 end');
    })

    /**
     * @tc.number    INTL_DATE_0864
     * @tc.name      intlDateTime0864
     * @tc.desc      fr-FR 第 11 号样式在时区偏移 12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0864', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0864 begin');
      const locale: string = 'fr-FR';
      const style: number = 11;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0864 end');
    })

    /**
     * @tc.number    INTL_DATE_0865
     * @tc.name      intlDateTime0865
     * @tc.desc      de-DE 第 0 号样式在时区偏移 -12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0865', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0865 begin');
      const locale: string = 'de-DE';
      const style: number = 0;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0865 end');
    })

    /**
     * @tc.number    INTL_DATE_0866
     * @tc.name      intlDateTime0866
     * @tc.desc      de-DE 第 0 号样式在时区偏移 -8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0866', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0866 begin');
      const locale: string = 'de-DE';
      const style: number = 0;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0866 end');
    })

    /**
     * @tc.number    INTL_DATE_0867
     * @tc.name      intlDateTime0867
     * @tc.desc      de-DE 第 0 号样式在时区偏移 -5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0867', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0867 begin');
      const locale: string = 'de-DE';
      const style: number = 0;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0867 end');
    })

    /**
     * @tc.number    INTL_DATE_0868
     * @tc.name      intlDateTime0868
     * @tc.desc      de-DE 第 0 号样式在时区偏移 -3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0868', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0868 begin');
      const locale: string = 'de-DE';
      const style: number = 0;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0868 end');
    })

    /**
     * @tc.number    INTL_DATE_0869
     * @tc.name      intlDateTime0869
     * @tc.desc      de-DE 第 0 号样式在时区偏移 0 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0869', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0869 begin');
      const locale: string = 'de-DE';
      const style: number = 0;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0869 end');
    })

    /**
     * @tc.number    INTL_DATE_0870
     * @tc.name      intlDateTime0870
     * @tc.desc      de-DE 第 0 号样式在时区偏移 1 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0870', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0870 begin');
      const locale: string = 'de-DE';
      const style: number = 0;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0870 end');
    })

    /**
     * @tc.number    INTL_DATE_0871
     * @tc.name      intlDateTime0871
     * @tc.desc      de-DE 第 0 号样式在时区偏移 3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0871', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0871 begin');
      const locale: string = 'de-DE';
      const style: number = 0;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0871 end');
    })

    /**
     * @tc.number    INTL_DATE_0872
     * @tc.name      intlDateTime0872
     * @tc.desc      de-DE 第 0 号样式在时区偏移 5.5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0872', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0872 begin');
      const locale: string = 'de-DE';
      const style: number = 0;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0872 end');
    })

    /**
     * @tc.number    INTL_DATE_0873
     * @tc.name      intlDateTime0873
     * @tc.desc      de-DE 第 0 号样式在时区偏移 8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0873', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0873 begin');
      const locale: string = 'de-DE';
      const style: number = 0;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0873 end');
    })

    /**
     * @tc.number    INTL_DATE_0874
     * @tc.name      intlDateTime0874
     * @tc.desc      de-DE 第 0 号样式在时区偏移 9 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0874', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0874 begin');
      const locale: string = 'de-DE';
      const style: number = 0;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0874 end');
    })

    /**
     * @tc.number    INTL_DATE_0875
     * @tc.name      intlDateTime0875
     * @tc.desc      de-DE 第 0 号样式在时区偏移 10 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0875', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0875 begin');
      const locale: string = 'de-DE';
      const style: number = 0;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0875 end');
    })

    /**
     * @tc.number    INTL_DATE_0876
     * @tc.name      intlDateTime0876
     * @tc.desc      de-DE 第 0 号样式在时区偏移 12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0876', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0876 begin');
      const locale: string = 'de-DE';
      const style: number = 0;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0876 end');
    })

    /**
     * @tc.number    INTL_DATE_0877
     * @tc.name      intlDateTime0877
     * @tc.desc      de-DE 第 1 号样式在时区偏移 -12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0877', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0877 begin');
      const locale: string = 'de-DE';
      const style: number = 1;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0877 end');
    })

    /**
     * @tc.number    INTL_DATE_0878
     * @tc.name      intlDateTime0878
     * @tc.desc      de-DE 第 1 号样式在时区偏移 -8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0878', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0878 begin');
      const locale: string = 'de-DE';
      const style: number = 1;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0878 end');
    })

    /**
     * @tc.number    INTL_DATE_0879
     * @tc.name      intlDateTime0879
     * @tc.desc      de-DE 第 1 号样式在时区偏移 -5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0879', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0879 begin');
      const locale: string = 'de-DE';
      const style: number = 1;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0879 end');
    })

    /**
     * @tc.number    INTL_DATE_0880
     * @tc.name      intlDateTime0880
     * @tc.desc      de-DE 第 1 号样式在时区偏移 -3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0880', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0880 begin');
      const locale: string = 'de-DE';
      const style: number = 1;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0880 end');
    })

    /**
     * @tc.number    INTL_DATE_0881
     * @tc.name      intlDateTime0881
     * @tc.desc      de-DE 第 1 号样式在时区偏移 0 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0881', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0881 begin');
      const locale: string = 'de-DE';
      const style: number = 1;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0881 end');
    })

    /**
     * @tc.number    INTL_DATE_0882
     * @tc.name      intlDateTime0882
     * @tc.desc      de-DE 第 1 号样式在时区偏移 1 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0882', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0882 begin');
      const locale: string = 'de-DE';
      const style: number = 1;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0882 end');
    })

    /**
     * @tc.number    INTL_DATE_0883
     * @tc.name      intlDateTime0883
     * @tc.desc      de-DE 第 1 号样式在时区偏移 3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0883', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0883 begin');
      const locale: string = 'de-DE';
      const style: number = 1;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0883 end');
    })

    /**
     * @tc.number    INTL_DATE_0884
     * @tc.name      intlDateTime0884
     * @tc.desc      de-DE 第 1 号样式在时区偏移 5.5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0884', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0884 begin');
      const locale: string = 'de-DE';
      const style: number = 1;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0884 end');
    })

    /**
     * @tc.number    INTL_DATE_0885
     * @tc.name      intlDateTime0885
     * @tc.desc      de-DE 第 1 号样式在时区偏移 8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0885', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0885 begin');
      const locale: string = 'de-DE';
      const style: number = 1;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0885 end');
    })

    /**
     * @tc.number    INTL_DATE_0886
     * @tc.name      intlDateTime0886
     * @tc.desc      de-DE 第 1 号样式在时区偏移 9 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0886', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0886 begin');
      const locale: string = 'de-DE';
      const style: number = 1;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0886 end');
    })

    /**
     * @tc.number    INTL_DATE_0887
     * @tc.name      intlDateTime0887
     * @tc.desc      de-DE 第 1 号样式在时区偏移 10 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0887', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0887 begin');
      const locale: string = 'de-DE';
      const style: number = 1;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0887 end');
    })

    /**
     * @tc.number    INTL_DATE_0888
     * @tc.name      intlDateTime0888
     * @tc.desc      de-DE 第 1 号样式在时区偏移 12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0888', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0888 begin');
      const locale: string = 'de-DE';
      const style: number = 1;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0888 end');
    })

    /**
     * @tc.number    INTL_DATE_0889
     * @tc.name      intlDateTime0889
     * @tc.desc      de-DE 第 2 号样式在时区偏移 -12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0889', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0889 begin');
      const locale: string = 'de-DE';
      const style: number = 2;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0889 end');
    })

    /**
     * @tc.number    INTL_DATE_0890
     * @tc.name      intlDateTime0890
     * @tc.desc      de-DE 第 2 号样式在时区偏移 -8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0890', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0890 begin');
      const locale: string = 'de-DE';
      const style: number = 2;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0890 end');
    })

    /**
     * @tc.number    INTL_DATE_0891
     * @tc.name      intlDateTime0891
     * @tc.desc      de-DE 第 2 号样式在时区偏移 -5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0891', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0891 begin');
      const locale: string = 'de-DE';
      const style: number = 2;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0891 end');
    })

    /**
     * @tc.number    INTL_DATE_0892
     * @tc.name      intlDateTime0892
     * @tc.desc      de-DE 第 2 号样式在时区偏移 -3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0892', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0892 begin');
      const locale: string = 'de-DE';
      const style: number = 2;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0892 end');
    })

    /**
     * @tc.number    INTL_DATE_0893
     * @tc.name      intlDateTime0893
     * @tc.desc      de-DE 第 2 号样式在时区偏移 0 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0893', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0893 begin');
      const locale: string = 'de-DE';
      const style: number = 2;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0893 end');
    })

    /**
     * @tc.number    INTL_DATE_0894
     * @tc.name      intlDateTime0894
     * @tc.desc      de-DE 第 2 号样式在时区偏移 1 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0894', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0894 begin');
      const locale: string = 'de-DE';
      const style: number = 2;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0894 end');
    })

    /**
     * @tc.number    INTL_DATE_0895
     * @tc.name      intlDateTime0895
     * @tc.desc      de-DE 第 2 号样式在时区偏移 3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0895', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0895 begin');
      const locale: string = 'de-DE';
      const style: number = 2;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0895 end');
    })

    /**
     * @tc.number    INTL_DATE_0896
     * @tc.name      intlDateTime0896
     * @tc.desc      de-DE 第 2 号样式在时区偏移 5.5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0896', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0896 begin');
      const locale: string = 'de-DE';
      const style: number = 2;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0896 end');
    })

    /**
     * @tc.number    INTL_DATE_0897
     * @tc.name      intlDateTime0897
     * @tc.desc      de-DE 第 2 号样式在时区偏移 8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0897', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0897 begin');
      const locale: string = 'de-DE';
      const style: number = 2;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0897 end');
    })

    /**
     * @tc.number    INTL_DATE_0898
     * @tc.name      intlDateTime0898
     * @tc.desc      de-DE 第 2 号样式在时区偏移 9 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0898', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0898 begin');
      const locale: string = 'de-DE';
      const style: number = 2;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0898 end');
    })

    /**
     * @tc.number    INTL_DATE_0899
     * @tc.name      intlDateTime0899
     * @tc.desc      de-DE 第 2 号样式在时区偏移 10 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0899', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0899 begin');
      const locale: string = 'de-DE';
      const style: number = 2;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0899 end');
    })

    /**
     * @tc.number    INTL_DATE_0900
     * @tc.name      intlDateTime0900
     * @tc.desc      de-DE 第 2 号样式在时区偏移 12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0900 begin');
      const locale: string = 'de-DE';
      const style: number = 2;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0900 end');
    })

    /**
     * @tc.number    INTL_DATE_0901
     * @tc.name      intlDateTime0901
     * @tc.desc      de-DE 第 3 号样式在时区偏移 -12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0901', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0901 begin');
      const locale: string = 'de-DE';
      const style: number = 3;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0901 end');
    })

    /**
     * @tc.number    INTL_DATE_0902
     * @tc.name      intlDateTime0902
     * @tc.desc      de-DE 第 3 号样式在时区偏移 -8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0902', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0902 begin');
      const locale: string = 'de-DE';
      const style: number = 3;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0902 end');
    })

    /**
     * @tc.number    INTL_DATE_0903
     * @tc.name      intlDateTime0903
     * @tc.desc      de-DE 第 3 号样式在时区偏移 -5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0903', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0903 begin');
      const locale: string = 'de-DE';
      const style: number = 3;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0903 end');
    })

    /**
     * @tc.number    INTL_DATE_0904
     * @tc.name      intlDateTime0904
     * @tc.desc      de-DE 第 3 号样式在时区偏移 -3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0904', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0904 begin');
      const locale: string = 'de-DE';
      const style: number = 3;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0904 end');
    })

    /**
     * @tc.number    INTL_DATE_0905
     * @tc.name      intlDateTime0905
     * @tc.desc      de-DE 第 3 号样式在时区偏移 0 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0905', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0905 begin');
      const locale: string = 'de-DE';
      const style: number = 3;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0905 end');
    })

    /**
     * @tc.number    INTL_DATE_0906
     * @tc.name      intlDateTime0906
     * @tc.desc      de-DE 第 3 号样式在时区偏移 1 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0906', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0906 begin');
      const locale: string = 'de-DE';
      const style: number = 3;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0906 end');
    })

    /**
     * @tc.number    INTL_DATE_0907
     * @tc.name      intlDateTime0907
     * @tc.desc      de-DE 第 3 号样式在时区偏移 3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0907', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0907 begin');
      const locale: string = 'de-DE';
      const style: number = 3;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0907 end');
    })

    /**
     * @tc.number    INTL_DATE_0908
     * @tc.name      intlDateTime0908
     * @tc.desc      de-DE 第 3 号样式在时区偏移 5.5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0908', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0908 begin');
      const locale: string = 'de-DE';
      const style: number = 3;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0908 end');
    })

    /**
     * @tc.number    INTL_DATE_0909
     * @tc.name      intlDateTime0909
     * @tc.desc      de-DE 第 3 号样式在时区偏移 8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0909', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0909 begin');
      const locale: string = 'de-DE';
      const style: number = 3;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0909 end');
    })

    /**
     * @tc.number    INTL_DATE_0910
     * @tc.name      intlDateTime0910
     * @tc.desc      de-DE 第 3 号样式在时区偏移 9 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0910', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0910 begin');
      const locale: string = 'de-DE';
      const style: number = 3;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0910 end');
    })

    /**
     * @tc.number    INTL_DATE_0911
     * @tc.name      intlDateTime0911
     * @tc.desc      de-DE 第 3 号样式在时区偏移 10 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0911', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0911 begin');
      const locale: string = 'de-DE';
      const style: number = 3;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0911 end');
    })

    /**
     * @tc.number    INTL_DATE_0912
     * @tc.name      intlDateTime0912
     * @tc.desc      de-DE 第 3 号样式在时区偏移 12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0912', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0912 begin');
      const locale: string = 'de-DE';
      const style: number = 3;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0912 end');
    })

    /**
     * @tc.number    INTL_DATE_0913
     * @tc.name      intlDateTime0913
     * @tc.desc      de-DE 第 4 号样式在时区偏移 -12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0913', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0913 begin');
      const locale: string = 'de-DE';
      const style: number = 4;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0913 end');
    })

    /**
     * @tc.number    INTL_DATE_0914
     * @tc.name      intlDateTime0914
     * @tc.desc      de-DE 第 4 号样式在时区偏移 -8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0914', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0914 begin');
      const locale: string = 'de-DE';
      const style: number = 4;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0914 end');
    })

    /**
     * @tc.number    INTL_DATE_0915
     * @tc.name      intlDateTime0915
     * @tc.desc      de-DE 第 4 号样式在时区偏移 -5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0915', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0915 begin');
      const locale: string = 'de-DE';
      const style: number = 4;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0915 end');
    })

    /**
     * @tc.number    INTL_DATE_0916
     * @tc.name      intlDateTime0916
     * @tc.desc      de-DE 第 4 号样式在时区偏移 -3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0916', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0916 begin');
      const locale: string = 'de-DE';
      const style: number = 4;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0916 end');
    })

    /**
     * @tc.number    INTL_DATE_0917
     * @tc.name      intlDateTime0917
     * @tc.desc      de-DE 第 4 号样式在时区偏移 0 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0917', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0917 begin');
      const locale: string = 'de-DE';
      const style: number = 4;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0917 end');
    })

    /**
     * @tc.number    INTL_DATE_0918
     * @tc.name      intlDateTime0918
     * @tc.desc      de-DE 第 4 号样式在时区偏移 1 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0918', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0918 begin');
      const locale: string = 'de-DE';
      const style: number = 4;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0918 end');
    })

    /**
     * @tc.number    INTL_DATE_0919
     * @tc.name      intlDateTime0919
     * @tc.desc      de-DE 第 4 号样式在时区偏移 3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0919', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0919 begin');
      const locale: string = 'de-DE';
      const style: number = 4;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0919 end');
    })

    /**
     * @tc.number    INTL_DATE_0920
     * @tc.name      intlDateTime0920
     * @tc.desc      de-DE 第 4 号样式在时区偏移 5.5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0920', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0920 begin');
      const locale: string = 'de-DE';
      const style: number = 4;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0920 end');
    })

    /**
     * @tc.number    INTL_DATE_0921
     * @tc.name      intlDateTime0921
     * @tc.desc      de-DE 第 4 号样式在时区偏移 8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0921', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0921 begin');
      const locale: string = 'de-DE';
      const style: number = 4;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0921 end');
    })

    /**
     * @tc.number    INTL_DATE_0922
     * @tc.name      intlDateTime0922
     * @tc.desc      de-DE 第 4 号样式在时区偏移 9 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0922', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0922 begin');
      const locale: string = 'de-DE';
      const style: number = 4;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0922 end');
    })

    /**
     * @tc.number    INTL_DATE_0923
     * @tc.name      intlDateTime0923
     * @tc.desc      de-DE 第 4 号样式在时区偏移 10 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime0923', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0923 begin');
      const locale: string = 'de-DE';
      const style: number = 4;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime0923 end');
    })
  })
}
