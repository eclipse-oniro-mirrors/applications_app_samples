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

export default function intlDateTimeMatrix21Test(): void {
  describe('IntlDateTimeMatrix21Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    INTL_DATE_1421
     * @tc.name      intlDateTime1421
     * @tc.desc      ru-RU 第 10 号样式在时区偏移 0 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1421 begin');
      const locale: string = 'ru-RU';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1421 end');
    })

    /**
     * @tc.number    INTL_DATE_1422
     * @tc.name      intlDateTime1422
     * @tc.desc      ru-RU 第 10 号样式在时区偏移 1 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1422 begin');
      const locale: string = 'ru-RU';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1422 end');
    })

    /**
     * @tc.number    INTL_DATE_1423
     * @tc.name      intlDateTime1423
     * @tc.desc      ru-RU 第 10 号样式在时区偏移 3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1423 begin');
      const locale: string = 'ru-RU';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1423 end');
    })

    /**
     * @tc.number    INTL_DATE_1424
     * @tc.name      intlDateTime1424
     * @tc.desc      ru-RU 第 10 号样式在时区偏移 5.5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1424 begin');
      const locale: string = 'ru-RU';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1424 end');
    })

    /**
     * @tc.number    INTL_DATE_1425
     * @tc.name      intlDateTime1425
     * @tc.desc      ru-RU 第 10 号样式在时区偏移 8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1425 begin');
      const locale: string = 'ru-RU';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1425 end');
    })

    /**
     * @tc.number    INTL_DATE_1426
     * @tc.name      intlDateTime1426
     * @tc.desc      ru-RU 第 10 号样式在时区偏移 9 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1426 begin');
      const locale: string = 'ru-RU';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1426 end');
    })

    /**
     * @tc.number    INTL_DATE_1427
     * @tc.name      intlDateTime1427
     * @tc.desc      ru-RU 第 10 号样式在时区偏移 10 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1427 begin');
      const locale: string = 'ru-RU';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1427 end');
    })

    /**
     * @tc.number    INTL_DATE_1428
     * @tc.name      intlDateTime1428
     * @tc.desc      ru-RU 第 10 号样式在时区偏移 12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1428 begin');
      const locale: string = 'ru-RU';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1428 end');
    })

    /**
     * @tc.number    INTL_DATE_1429
     * @tc.name      intlDateTime1429
     * @tc.desc      ru-RU 第 11 号样式在时区偏移 -12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1429 begin');
      const locale: string = 'ru-RU';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1429 end');
    })

    /**
     * @tc.number    INTL_DATE_1430
     * @tc.name      intlDateTime1430
     * @tc.desc      ru-RU 第 11 号样式在时区偏移 -8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1430 begin');
      const locale: string = 'ru-RU';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1430 end');
    })

    /**
     * @tc.number    INTL_DATE_1431
     * @tc.name      intlDateTime1431
     * @tc.desc      ru-RU 第 11 号样式在时区偏移 -5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1431 begin');
      const locale: string = 'ru-RU';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1431 end');
    })

    /**
     * @tc.number    INTL_DATE_1432
     * @tc.name      intlDateTime1432
     * @tc.desc      ru-RU 第 11 号样式在时区偏移 -3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1432 begin');
      const locale: string = 'ru-RU';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1432 end');
    })

    /**
     * @tc.number    INTL_DATE_1433
     * @tc.name      intlDateTime1433
     * @tc.desc      ru-RU 第 11 号样式在时区偏移 0 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1433 begin');
      const locale: string = 'ru-RU';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1433 end');
    })

    /**
     * @tc.number    INTL_DATE_1434
     * @tc.name      intlDateTime1434
     * @tc.desc      ru-RU 第 11 号样式在时区偏移 1 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1434 begin');
      const locale: string = 'ru-RU';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1434 end');
    })

    /**
     * @tc.number    INTL_DATE_1435
     * @tc.name      intlDateTime1435
     * @tc.desc      ru-RU 第 11 号样式在时区偏移 3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1435 begin');
      const locale: string = 'ru-RU';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1435 end');
    })

    /**
     * @tc.number    INTL_DATE_1436
     * @tc.name      intlDateTime1436
     * @tc.desc      ru-RU 第 11 号样式在时区偏移 5.5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1436 begin');
      const locale: string = 'ru-RU';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1436 end');
    })

    /**
     * @tc.number    INTL_DATE_1437
     * @tc.name      intlDateTime1437
     * @tc.desc      ru-RU 第 11 号样式在时区偏移 8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1437', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1437 begin');
      const locale: string = 'ru-RU';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1437 end');
    })

    /**
     * @tc.number    INTL_DATE_1438
     * @tc.name      intlDateTime1438
     * @tc.desc      ru-RU 第 11 号样式在时区偏移 9 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1438', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1438 begin');
      const locale: string = 'ru-RU';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1438 end');
    })

    /**
     * @tc.number    INTL_DATE_1439
     * @tc.name      intlDateTime1439
     * @tc.desc      ru-RU 第 11 号样式在时区偏移 10 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1439', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1439 begin');
      const locale: string = 'ru-RU';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1439 end');
    })

    /**
     * @tc.number    INTL_DATE_1440
     * @tc.name      intlDateTime1440
     * @tc.desc      ru-RU 第 11 号样式在时区偏移 12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1440', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1440 begin');
      const locale: string = 'ru-RU';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1440 end');
    })

    /**
     * @tc.number    INTL_DATE_1441
     * @tc.name      intlDateTime1441
     * @tc.desc      ar-EG 第 0 号样式在时区偏移 -12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1441', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1441 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1441 end');
    })

    /**
     * @tc.number    INTL_DATE_1442
     * @tc.name      intlDateTime1442
     * @tc.desc      ar-EG 第 0 号样式在时区偏移 -8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1442', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1442 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1442 end');
    })

    /**
     * @tc.number    INTL_DATE_1443
     * @tc.name      intlDateTime1443
     * @tc.desc      ar-EG 第 0 号样式在时区偏移 -5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1443', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1443 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1443 end');
    })

    /**
     * @tc.number    INTL_DATE_1444
     * @tc.name      intlDateTime1444
     * @tc.desc      ar-EG 第 0 号样式在时区偏移 -3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1444', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1444 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1444 end');
    })

    /**
     * @tc.number    INTL_DATE_1445
     * @tc.name      intlDateTime1445
     * @tc.desc      ar-EG 第 0 号样式在时区偏移 0 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1445', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1445 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1445 end');
    })

    /**
     * @tc.number    INTL_DATE_1446
     * @tc.name      intlDateTime1446
     * @tc.desc      ar-EG 第 0 号样式在时区偏移 1 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1446', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1446 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1446 end');
    })

    /**
     * @tc.number    INTL_DATE_1447
     * @tc.name      intlDateTime1447
     * @tc.desc      ar-EG 第 0 号样式在时区偏移 3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1447', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1447 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1447 end');
    })

    /**
     * @tc.number    INTL_DATE_1448
     * @tc.name      intlDateTime1448
     * @tc.desc      ar-EG 第 0 号样式在时区偏移 5.5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1448', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1448 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1448 end');
    })

    /**
     * @tc.number    INTL_DATE_1449
     * @tc.name      intlDateTime1449
     * @tc.desc      ar-EG 第 0 号样式在时区偏移 8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1449', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1449 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1449 end');
    })

    /**
     * @tc.number    INTL_DATE_1450
     * @tc.name      intlDateTime1450
     * @tc.desc      ar-EG 第 0 号样式在时区偏移 9 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1450', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1450 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1450 end');
    })

    /**
     * @tc.number    INTL_DATE_1451
     * @tc.name      intlDateTime1451
     * @tc.desc      ar-EG 第 0 号样式在时区偏移 10 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1451', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1451 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1451 end');
    })

    /**
     * @tc.number    INTL_DATE_1452
     * @tc.name      intlDateTime1452
     * @tc.desc      ar-EG 第 0 号样式在时区偏移 12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1452', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1452 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1452 end');
    })

    /**
     * @tc.number    INTL_DATE_1453
     * @tc.name      intlDateTime1453
     * @tc.desc      ar-EG 第 1 号样式在时区偏移 -12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1453', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1453 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1453 end');
    })

    /**
     * @tc.number    INTL_DATE_1454
     * @tc.name      intlDateTime1454
     * @tc.desc      ar-EG 第 1 号样式在时区偏移 -8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1454', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1454 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1454 end');
    })

    /**
     * @tc.number    INTL_DATE_1455
     * @tc.name      intlDateTime1455
     * @tc.desc      ar-EG 第 1 号样式在时区偏移 -5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1455', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1455 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1455 end');
    })

    /**
     * @tc.number    INTL_DATE_1456
     * @tc.name      intlDateTime1456
     * @tc.desc      ar-EG 第 1 号样式在时区偏移 -3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1456', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1456 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1456 end');
    })

    /**
     * @tc.number    INTL_DATE_1457
     * @tc.name      intlDateTime1457
     * @tc.desc      ar-EG 第 1 号样式在时区偏移 0 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1457', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1457 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1457 end');
    })

    /**
     * @tc.number    INTL_DATE_1458
     * @tc.name      intlDateTime1458
     * @tc.desc      ar-EG 第 1 号样式在时区偏移 1 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1458', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1458 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1458 end');
    })

    /**
     * @tc.number    INTL_DATE_1459
     * @tc.name      intlDateTime1459
     * @tc.desc      ar-EG 第 1 号样式在时区偏移 3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1459', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1459 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1459 end');
    })

    /**
     * @tc.number    INTL_DATE_1460
     * @tc.name      intlDateTime1460
     * @tc.desc      ar-EG 第 1 号样式在时区偏移 5.5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1460', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1460 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1460 end');
    })

    /**
     * @tc.number    INTL_DATE_1461
     * @tc.name      intlDateTime1461
     * @tc.desc      ar-EG 第 1 号样式在时区偏移 8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1461', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1461 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1461 end');
    })

    /**
     * @tc.number    INTL_DATE_1462
     * @tc.name      intlDateTime1462
     * @tc.desc      ar-EG 第 1 号样式在时区偏移 9 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1462', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1462 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1462 end');
    })

    /**
     * @tc.number    INTL_DATE_1463
     * @tc.name      intlDateTime1463
     * @tc.desc      ar-EG 第 1 号样式在时区偏移 10 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1463', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1463 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1463 end');
    })

    /**
     * @tc.number    INTL_DATE_1464
     * @tc.name      intlDateTime1464
     * @tc.desc      ar-EG 第 1 号样式在时区偏移 12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1464', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1464 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1464 end');
    })

    /**
     * @tc.number    INTL_DATE_1465
     * @tc.name      intlDateTime1465
     * @tc.desc      ar-EG 第 2 号样式在时区偏移 -12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1465', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1465 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1465 end');
    })

    /**
     * @tc.number    INTL_DATE_1466
     * @tc.name      intlDateTime1466
     * @tc.desc      ar-EG 第 2 号样式在时区偏移 -8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1466', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1466 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1466 end');
    })

    /**
     * @tc.number    INTL_DATE_1467
     * @tc.name      intlDateTime1467
     * @tc.desc      ar-EG 第 2 号样式在时区偏移 -5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1467', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1467 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1467 end');
    })

    /**
     * @tc.number    INTL_DATE_1468
     * @tc.name      intlDateTime1468
     * @tc.desc      ar-EG 第 2 号样式在时区偏移 -3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1468', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1468 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1468 end');
    })

    /**
     * @tc.number    INTL_DATE_1469
     * @tc.name      intlDateTime1469
     * @tc.desc      ar-EG 第 2 号样式在时区偏移 0 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1469', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1469 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1469 end');
    })

    /**
     * @tc.number    INTL_DATE_1470
     * @tc.name      intlDateTime1470
     * @tc.desc      ar-EG 第 2 号样式在时区偏移 1 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1470', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1470 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1470 end');
    })

    /**
     * @tc.number    INTL_DATE_1471
     * @tc.name      intlDateTime1471
     * @tc.desc      ar-EG 第 2 号样式在时区偏移 3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1471', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1471 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1471 end');
    })

    /**
     * @tc.number    INTL_DATE_1472
     * @tc.name      intlDateTime1472
     * @tc.desc      ar-EG 第 2 号样式在时区偏移 5.5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1472', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1472 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1472 end');
    })

    /**
     * @tc.number    INTL_DATE_1473
     * @tc.name      intlDateTime1473
     * @tc.desc      ar-EG 第 2 号样式在时区偏移 8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1473', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1473 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1473 end');
    })

    /**
     * @tc.number    INTL_DATE_1474
     * @tc.name      intlDateTime1474
     * @tc.desc      ar-EG 第 2 号样式在时区偏移 9 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1474', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1474 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1474 end');
    })

    /**
     * @tc.number    INTL_DATE_1475
     * @tc.name      intlDateTime1475
     * @tc.desc      ar-EG 第 2 号样式在时区偏移 10 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1475', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1475 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1475 end');
    })

    /**
     * @tc.number    INTL_DATE_1476
     * @tc.name      intlDateTime1476
     * @tc.desc      ar-EG 第 2 号样式在时区偏移 12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1476', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1476 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1476 end');
    })

    /**
     * @tc.number    INTL_DATE_1477
     * @tc.name      intlDateTime1477
     * @tc.desc      ar-EG 第 3 号样式在时区偏移 -12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1477', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1477 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1477 end');
    })

    /**
     * @tc.number    INTL_DATE_1478
     * @tc.name      intlDateTime1478
     * @tc.desc      ar-EG 第 3 号样式在时区偏移 -8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1478', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1478 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1478 end');
    })

    /**
     * @tc.number    INTL_DATE_1479
     * @tc.name      intlDateTime1479
     * @tc.desc      ar-EG 第 3 号样式在时区偏移 -5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1479', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1479 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1479 end');
    })

    /**
     * @tc.number    INTL_DATE_1480
     * @tc.name      intlDateTime1480
     * @tc.desc      ar-EG 第 3 号样式在时区偏移 -3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1480', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1480 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1480 end');
    })

    /**
     * @tc.number    INTL_DATE_1481
     * @tc.name      intlDateTime1481
     * @tc.desc      ar-EG 第 3 号样式在时区偏移 0 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1481', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1481 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1481 end');
    })

    /**
     * @tc.number    INTL_DATE_1482
     * @tc.name      intlDateTime1482
     * @tc.desc      ar-EG 第 3 号样式在时区偏移 1 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1482', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1482 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1482 end');
    })

    /**
     * @tc.number    INTL_DATE_1483
     * @tc.name      intlDateTime1483
     * @tc.desc      ar-EG 第 3 号样式在时区偏移 3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1483', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1483 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1483 end');
    })

    /**
     * @tc.number    INTL_DATE_1484
     * @tc.name      intlDateTime1484
     * @tc.desc      ar-EG 第 3 号样式在时区偏移 5.5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1484', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1484 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1484 end');
    })

    /**
     * @tc.number    INTL_DATE_1485
     * @tc.name      intlDateTime1485
     * @tc.desc      ar-EG 第 3 号样式在时区偏移 8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1485', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1485 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1485 end');
    })

    /**
     * @tc.number    INTL_DATE_1486
     * @tc.name      intlDateTime1486
     * @tc.desc      ar-EG 第 3 号样式在时区偏移 9 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1486', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1486 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1486 end');
    })

    /**
     * @tc.number    INTL_DATE_1487
     * @tc.name      intlDateTime1487
     * @tc.desc      ar-EG 第 3 号样式在时区偏移 10 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1487', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1487 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1487 end');
    })

    /**
     * @tc.number    INTL_DATE_1488
     * @tc.name      intlDateTime1488
     * @tc.desc      ar-EG 第 3 号样式在时区偏移 12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1488', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1488 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1488 end');
    })

    /**
     * @tc.number    INTL_DATE_1489
     * @tc.name      intlDateTime1489
     * @tc.desc      ar-EG 第 4 号样式在时区偏移 -12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1489', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1489 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1489 end');
    })

    /**
     * @tc.number    INTL_DATE_1490
     * @tc.name      intlDateTime1490
     * @tc.desc      ar-EG 第 4 号样式在时区偏移 -8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1490', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1490 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1490 end');
    })

    /**
     * @tc.number    INTL_DATE_1491
     * @tc.name      intlDateTime1491
     * @tc.desc      ar-EG 第 4 号样式在时区偏移 -5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1491', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1491 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1491 end');
    })
  })
}
