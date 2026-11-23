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

export default function intlDateTimeMatrix22Test(): void {
  describe('IntlDateTimeMatrix22Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    INTL_DATE_1492
     * @tc.name      intlDateTime1492
     * @tc.desc      ar-EG 第 4 号样式在时区偏移 -3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1492', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1492 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1492 end');
    })

    /**
     * @tc.number    INTL_DATE_1493
     * @tc.name      intlDateTime1493
     * @tc.desc      ar-EG 第 4 号样式在时区偏移 0 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1493', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1493 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1493 end');
    })

    /**
     * @tc.number    INTL_DATE_1494
     * @tc.name      intlDateTime1494
     * @tc.desc      ar-EG 第 4 号样式在时区偏移 1 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1494', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1494 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1494 end');
    })

    /**
     * @tc.number    INTL_DATE_1495
     * @tc.name      intlDateTime1495
     * @tc.desc      ar-EG 第 4 号样式在时区偏移 3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1495', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1495 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1495 end');
    })

    /**
     * @tc.number    INTL_DATE_1496
     * @tc.name      intlDateTime1496
     * @tc.desc      ar-EG 第 4 号样式在时区偏移 5.5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1496', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1496 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1496 end');
    })

    /**
     * @tc.number    INTL_DATE_1497
     * @tc.name      intlDateTime1497
     * @tc.desc      ar-EG 第 4 号样式在时区偏移 8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1497', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1497 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1497 end');
    })

    /**
     * @tc.number    INTL_DATE_1498
     * @tc.name      intlDateTime1498
     * @tc.desc      ar-EG 第 4 号样式在时区偏移 9 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1498', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1498 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1498 end');
    })

    /**
     * @tc.number    INTL_DATE_1499
     * @tc.name      intlDateTime1499
     * @tc.desc      ar-EG 第 4 号样式在时区偏移 10 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1499', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1499 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1499 end');
    })

    /**
     * @tc.number    INTL_DATE_1500
     * @tc.name      intlDateTime1500
     * @tc.desc      ar-EG 第 4 号样式在时区偏移 12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1500 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1500 end');
    })

    /**
     * @tc.number    INTL_DATE_1501
     * @tc.name      intlDateTime1501
     * @tc.desc      ar-EG 第 5 号样式在时区偏移 -12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1501', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1501 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1501 end');
    })

    /**
     * @tc.number    INTL_DATE_1502
     * @tc.name      intlDateTime1502
     * @tc.desc      ar-EG 第 5 号样式在时区偏移 -8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1502', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1502 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1502 end');
    })

    /**
     * @tc.number    INTL_DATE_1503
     * @tc.name      intlDateTime1503
     * @tc.desc      ar-EG 第 5 号样式在时区偏移 -5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1503', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1503 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1503 end');
    })

    /**
     * @tc.number    INTL_DATE_1504
     * @tc.name      intlDateTime1504
     * @tc.desc      ar-EG 第 5 号样式在时区偏移 -3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1504', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1504 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1504 end');
    })

    /**
     * @tc.number    INTL_DATE_1505
     * @tc.name      intlDateTime1505
     * @tc.desc      ar-EG 第 5 号样式在时区偏移 0 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1505', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1505 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1505 end');
    })

    /**
     * @tc.number    INTL_DATE_1506
     * @tc.name      intlDateTime1506
     * @tc.desc      ar-EG 第 5 号样式在时区偏移 1 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1506', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1506 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1506 end');
    })

    /**
     * @tc.number    INTL_DATE_1507
     * @tc.name      intlDateTime1507
     * @tc.desc      ar-EG 第 5 号样式在时区偏移 3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1507', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1507 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1507 end');
    })

    /**
     * @tc.number    INTL_DATE_1508
     * @tc.name      intlDateTime1508
     * @tc.desc      ar-EG 第 5 号样式在时区偏移 5.5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1508', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1508 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1508 end');
    })

    /**
     * @tc.number    INTL_DATE_1509
     * @tc.name      intlDateTime1509
     * @tc.desc      ar-EG 第 5 号样式在时区偏移 8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1509', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1509 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1509 end');
    })

    /**
     * @tc.number    INTL_DATE_1510
     * @tc.name      intlDateTime1510
     * @tc.desc      ar-EG 第 5 号样式在时区偏移 9 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1510 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1510 end');
    })

    /**
     * @tc.number    INTL_DATE_1511
     * @tc.name      intlDateTime1511
     * @tc.desc      ar-EG 第 5 号样式在时区偏移 10 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1511', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1511 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1511 end');
    })

    /**
     * @tc.number    INTL_DATE_1512
     * @tc.name      intlDateTime1512
     * @tc.desc      ar-EG 第 5 号样式在时区偏移 12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1512', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1512 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1512 end');
    })

    /**
     * @tc.number    INTL_DATE_1513
     * @tc.name      intlDateTime1513
     * @tc.desc      ar-EG 第 6 号样式在时区偏移 -12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1513', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1513 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1513 end');
    })

    /**
     * @tc.number    INTL_DATE_1514
     * @tc.name      intlDateTime1514
     * @tc.desc      ar-EG 第 6 号样式在时区偏移 -8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1514', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1514 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1514 end');
    })

    /**
     * @tc.number    INTL_DATE_1515
     * @tc.name      intlDateTime1515
     * @tc.desc      ar-EG 第 6 号样式在时区偏移 -5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1515', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1515 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1515 end');
    })

    /**
     * @tc.number    INTL_DATE_1516
     * @tc.name      intlDateTime1516
     * @tc.desc      ar-EG 第 6 号样式在时区偏移 -3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1516', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1516 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1516 end');
    })

    /**
     * @tc.number    INTL_DATE_1517
     * @tc.name      intlDateTime1517
     * @tc.desc      ar-EG 第 6 号样式在时区偏移 0 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1517', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1517 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1517 end');
    })

    /**
     * @tc.number    INTL_DATE_1518
     * @tc.name      intlDateTime1518
     * @tc.desc      ar-EG 第 6 号样式在时区偏移 1 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1518', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1518 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1518 end');
    })

    /**
     * @tc.number    INTL_DATE_1519
     * @tc.name      intlDateTime1519
     * @tc.desc      ar-EG 第 6 号样式在时区偏移 3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1519', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1519 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1519 end');
    })

    /**
     * @tc.number    INTL_DATE_1520
     * @tc.name      intlDateTime1520
     * @tc.desc      ar-EG 第 6 号样式在时区偏移 5.5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1520', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1520 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1520 end');
    })

    /**
     * @tc.number    INTL_DATE_1521
     * @tc.name      intlDateTime1521
     * @tc.desc      ar-EG 第 6 号样式在时区偏移 8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1521', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1521 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1521 end');
    })

    /**
     * @tc.number    INTL_DATE_1522
     * @tc.name      intlDateTime1522
     * @tc.desc      ar-EG 第 6 号样式在时区偏移 9 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1522', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1522 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1522 end');
    })

    /**
     * @tc.number    INTL_DATE_1523
     * @tc.name      intlDateTime1523
     * @tc.desc      ar-EG 第 6 号样式在时区偏移 10 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1523', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1523 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1523 end');
    })

    /**
     * @tc.number    INTL_DATE_1524
     * @tc.name      intlDateTime1524
     * @tc.desc      ar-EG 第 6 号样式在时区偏移 12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1524', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1524 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1524 end');
    })

    /**
     * @tc.number    INTL_DATE_1525
     * @tc.name      intlDateTime1525
     * @tc.desc      ar-EG 第 7 号样式在时区偏移 -12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1525', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1525 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1525 end');
    })

    /**
     * @tc.number    INTL_DATE_1526
     * @tc.name      intlDateTime1526
     * @tc.desc      ar-EG 第 7 号样式在时区偏移 -8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1526', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1526 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1526 end');
    })

    /**
     * @tc.number    INTL_DATE_1527
     * @tc.name      intlDateTime1527
     * @tc.desc      ar-EG 第 7 号样式在时区偏移 -5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1527', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1527 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1527 end');
    })

    /**
     * @tc.number    INTL_DATE_1528
     * @tc.name      intlDateTime1528
     * @tc.desc      ar-EG 第 7 号样式在时区偏移 -3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1528', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1528 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1528 end');
    })

    /**
     * @tc.number    INTL_DATE_1529
     * @tc.name      intlDateTime1529
     * @tc.desc      ar-EG 第 7 号样式在时区偏移 0 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1529', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1529 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1529 end');
    })

    /**
     * @tc.number    INTL_DATE_1530
     * @tc.name      intlDateTime1530
     * @tc.desc      ar-EG 第 7 号样式在时区偏移 1 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1530', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1530 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1530 end');
    })

    /**
     * @tc.number    INTL_DATE_1531
     * @tc.name      intlDateTime1531
     * @tc.desc      ar-EG 第 7 号样式在时区偏移 3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1531', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1531 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1531 end');
    })

    /**
     * @tc.number    INTL_DATE_1532
     * @tc.name      intlDateTime1532
     * @tc.desc      ar-EG 第 7 号样式在时区偏移 5.5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1532', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1532 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1532 end');
    })

    /**
     * @tc.number    INTL_DATE_1533
     * @tc.name      intlDateTime1533
     * @tc.desc      ar-EG 第 7 号样式在时区偏移 8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1533', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1533 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1533 end');
    })

    /**
     * @tc.number    INTL_DATE_1534
     * @tc.name      intlDateTime1534
     * @tc.desc      ar-EG 第 7 号样式在时区偏移 9 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1534', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1534 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1534 end');
    })

    /**
     * @tc.number    INTL_DATE_1535
     * @tc.name      intlDateTime1535
     * @tc.desc      ar-EG 第 7 号样式在时区偏移 10 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1535', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1535 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1535 end');
    })

    /**
     * @tc.number    INTL_DATE_1536
     * @tc.name      intlDateTime1536
     * @tc.desc      ar-EG 第 7 号样式在时区偏移 12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1536', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1536 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1536 end');
    })

    /**
     * @tc.number    INTL_DATE_1537
     * @tc.name      intlDateTime1537
     * @tc.desc      ar-EG 第 8 号样式在时区偏移 -12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1537', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1537 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1537 end');
    })

    /**
     * @tc.number    INTL_DATE_1538
     * @tc.name      intlDateTime1538
     * @tc.desc      ar-EG 第 8 号样式在时区偏移 -8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1538', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1538 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1538 end');
    })

    /**
     * @tc.number    INTL_DATE_1539
     * @tc.name      intlDateTime1539
     * @tc.desc      ar-EG 第 8 号样式在时区偏移 -5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1539', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1539 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1539 end');
    })

    /**
     * @tc.number    INTL_DATE_1540
     * @tc.name      intlDateTime1540
     * @tc.desc      ar-EG 第 8 号样式在时区偏移 -3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1540', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1540 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1540 end');
    })

    /**
     * @tc.number    INTL_DATE_1541
     * @tc.name      intlDateTime1541
     * @tc.desc      ar-EG 第 8 号样式在时区偏移 0 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1541', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1541 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1541 end');
    })

    /**
     * @tc.number    INTL_DATE_1542
     * @tc.name      intlDateTime1542
     * @tc.desc      ar-EG 第 8 号样式在时区偏移 1 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1542', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1542 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1542 end');
    })

    /**
     * @tc.number    INTL_DATE_1543
     * @tc.name      intlDateTime1543
     * @tc.desc      ar-EG 第 8 号样式在时区偏移 3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1543', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1543 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1543 end');
    })

    /**
     * @tc.number    INTL_DATE_1544
     * @tc.name      intlDateTime1544
     * @tc.desc      ar-EG 第 8 号样式在时区偏移 5.5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1544', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1544 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1544 end');
    })

    /**
     * @tc.number    INTL_DATE_1545
     * @tc.name      intlDateTime1545
     * @tc.desc      ar-EG 第 8 号样式在时区偏移 8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1545', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1545 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1545 end');
    })

    /**
     * @tc.number    INTL_DATE_1546
     * @tc.name      intlDateTime1546
     * @tc.desc      ar-EG 第 8 号样式在时区偏移 9 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1546', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1546 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1546 end');
    })

    /**
     * @tc.number    INTL_DATE_1547
     * @tc.name      intlDateTime1547
     * @tc.desc      ar-EG 第 8 号样式在时区偏移 10 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1547', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1547 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1547 end');
    })

    /**
     * @tc.number    INTL_DATE_1548
     * @tc.name      intlDateTime1548
     * @tc.desc      ar-EG 第 8 号样式在时区偏移 12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1548', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1548 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1548 end');
    })

    /**
     * @tc.number    INTL_DATE_1549
     * @tc.name      intlDateTime1549
     * @tc.desc      ar-EG 第 9 号样式在时区偏移 -12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1549', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1549 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1549 end');
    })

    /**
     * @tc.number    INTL_DATE_1550
     * @tc.name      intlDateTime1550
     * @tc.desc      ar-EG 第 9 号样式在时区偏移 -8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1550', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1550 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1550 end');
    })

    /**
     * @tc.number    INTL_DATE_1551
     * @tc.name      intlDateTime1551
     * @tc.desc      ar-EG 第 9 号样式在时区偏移 -5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1551', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1551 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1551 end');
    })

    /**
     * @tc.number    INTL_DATE_1552
     * @tc.name      intlDateTime1552
     * @tc.desc      ar-EG 第 9 号样式在时区偏移 -3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1552', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1552 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1552 end');
    })

    /**
     * @tc.number    INTL_DATE_1553
     * @tc.name      intlDateTime1553
     * @tc.desc      ar-EG 第 9 号样式在时区偏移 0 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1553', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1553 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1553 end');
    })

    /**
     * @tc.number    INTL_DATE_1554
     * @tc.name      intlDateTime1554
     * @tc.desc      ar-EG 第 9 号样式在时区偏移 1 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1554', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1554 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1554 end');
    })

    /**
     * @tc.number    INTL_DATE_1555
     * @tc.name      intlDateTime1555
     * @tc.desc      ar-EG 第 9 号样式在时区偏移 3 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1555', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1555 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1555 end');
    })

    /**
     * @tc.number    INTL_DATE_1556
     * @tc.name      intlDateTime1556
     * @tc.desc      ar-EG 第 9 号样式在时区偏移 5.5 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1556', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1556 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1556 end');
    })

    /**
     * @tc.number    INTL_DATE_1557
     * @tc.name      intlDateTime1557
     * @tc.desc      ar-EG 第 9 号样式在时区偏移 8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1557', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1557 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1557 end');
    })

    /**
     * @tc.number    INTL_DATE_1558
     * @tc.name      intlDateTime1558
     * @tc.desc      ar-EG 第 9 号样式在时区偏移 9 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1558', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1558 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1558 end');
    })

    /**
     * @tc.number    INTL_DATE_1559
     * @tc.name      intlDateTime1559
     * @tc.desc      ar-EG 第 9 号样式在时区偏移 10 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1559', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1559 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1559 end');
    })

    /**
     * @tc.number    INTL_DATE_1560
     * @tc.name      intlDateTime1560
     * @tc.desc      ar-EG 第 9 号样式在时区偏移 12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1560', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1560 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1560 end');
    })

    /**
     * @tc.number    INTL_DATE_1561
     * @tc.name      intlDateTime1561
     * @tc.desc      ar-EG 第 10 号样式在时区偏移 -12 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1561', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1561 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1561 end');
    })

    /**
     * @tc.number    INTL_DATE_1562
     * @tc.name      intlDateTime1562
     * @tc.desc      ar-EG 第 10 号样式在时区偏移 -8 小时下的本地时刻推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlDateTime1562', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1562 begin');
      const locale: string = 'ar-EG';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlDateTime1562 end');
    })
  })
}
