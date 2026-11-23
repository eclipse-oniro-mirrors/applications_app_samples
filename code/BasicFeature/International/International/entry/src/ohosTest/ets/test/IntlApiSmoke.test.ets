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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { i18n } from '@kit.LocalizationKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_International]';

export default function intlApiSmokeTest(): void {
  describe('IntlApiSmoke', () => {
    /**
     * @tc.number INTL_API_0001
     * @tc.name intl_api_calendar_february
     * @tc.desc 真实 Calendar julian_day 校验普通闰年与世纪闰年二月长度
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('intl_api_calendar_february', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intl_api_calendar_february begin');
      try {
        const years: number[] = [1900, 2000, 2023, 2024];
        const days: number[] = [28, 29, 28, 29];
        const calendar: i18n.Calendar = i18n.getCalendar('en-US', 'gregory');
        calendar.setTimeZone('UTC');
        for (let index: number = 0; index < years.length; index++) {
          calendar.set(years[index], 1, 1, 12, 0, 0);
          const start: number = calendar.get('julian_day');
          calendar.set(years[index], 2, 1, 12, 0, 0);
          const end: number = calendar.get('julian_day');
          hilog.info(DOMAIN, TAG, 'year=%{public}d start=%{public}d end=%{public}d days=%{public}d',
            years[index], start, end, end - start);
          expect(end - start).assertEqual(days[index]);
          expect(calendar.get('year')).assertEqual(years[index]);
          expect(calendar.get('month')).assertEqual(2);
          expect(calendar.get('date')).assertEqual(1);
        }
      } finally {
        hilog.info(DOMAIN, TAG, '%{public}s', 'intl_api_calendar_february end');
      }
    });

    /**
     * @tc.number INTL_API_0002
     * @tc.name intl_api_calendar_year_boundary
     * @tc.desc 真实 Calendar 校验零起始月份及跨年相邻日期，不改系统时间
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('intl_api_calendar_year_boundary', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intl_api_calendar_year_boundary begin');
      try {
        const calendar: i18n.Calendar = i18n.getCalendar('en-US', 'gregory');
        calendar.setTimeZone('UTC');
        calendar.set(2024, 11, 31, 12, 0, 0);
        const december: number = calendar.get('julian_day');
        hilog.info(DOMAIN, TAG, '十二月 month=%{public}d day=%{public}d',
          calendar.get('month'), calendar.get('date'));
        expect(calendar.get('month')).assertEqual(11);
        expect(calendar.get('date')).assertEqual(31);
        calendar.set(2025, 0, 1, 12, 0, 0);
        const january: number = calendar.get('julian_day');
        hilog.info(DOMAIN, TAG, '跨年 year=%{public}d month=%{public}d julian差=%{public}d',
          calendar.get('year'), calendar.get('month'), january - december);
        expect(calendar.get('year')).assertEqual(2025);
        expect(calendar.get('month')).assertEqual(0);
        expect(calendar.get('date')).assertEqual(1);
        expect(january - december).assertEqual(1);
      } finally {
        hilog.info(DOMAIN, TAG, '%{public}s', 'intl_api_calendar_year_boundary end');
      }
    });

    /**
     * @tc.number INTL_API_0003
     * @tc.name intl_api_unicode_categories
     * @tc.desc 真实 Unicode.getType 校验业务字符分类返回值
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('intl_api_unicode_categories', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intl_api_unicode_categories begin');
      try {
        const characters: string[] = ['A', 'a', '9', ' ', '中'];
        const categories: string[] = ['U_UPPERCASE_LETTER', 'U_LOWERCASE_LETTER',
          'U_DECIMAL_DIGIT_NUMBER', 'U_SPACE_SEPARATOR', 'U_OTHER_LETTER'];
        for (let index: number = 0; index < characters.length; index++) {
          const actual: string = i18n.Unicode.getType(characters[index]);
          hilog.info(DOMAIN, TAG, 'character=%{public}s type=%{public}s', characters[index], actual);
          expect(actual).assertEqual(categories[index]);
        }
      } finally {
        hilog.info(DOMAIN, TAG, '%{public}s', 'intl_api_unicode_categories end');
      }
    });

    /**
     * @tc.number INTL_API_0004
     * @tc.name intl_api_line_break_boundaries
     * @tc.desc 真实断行迭代器验证边界递增、文本完整重建及复用后的空文本
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('intl_api_line_break_boundaries', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intl_api_line_break_boundaries begin');
      try {
        const locales: string[] = ['en-US', 'zh-CN'];
        const inputs: string[] = ['Text processing test.\nNext line.', '中文断行测试。\n第二行'];
        for (let index: number = 0; index < locales.length; index++) {
          const iterator: i18n.BreakIterator = i18n.getLineInstance(locales[index]);
          const input: string = inputs[index];
          iterator.setLineBreakText(input);
          let previous: number = iterator.first();
          hilog.info(DOMAIN, TAG, 'locale=%{public}s first=%{public}d', locales[index], previous);
          expect(previous).assertEqual(0);
          let rebuilt: string = '';
          let position: number = iterator.next();
          let count: number = 0;
          while (position !== -1 && count <= input.length) {
            hilog.info(DOMAIN, TAG, '断行 previous=%{public}d next=%{public}d', previous, position);
            expect(position > previous && position <= input.length).assertTrue();
            rebuilt += input.slice(previous, position);
            previous = position;
            count++;
            position = iterator.next();
          }
          hilog.info(DOMAIN, TAG, '重建=%{public}s last=%{public}d terminal=%{public}d',
            rebuilt, previous, position);
          expect(position).assertEqual(-1);
          expect(previous).assertEqual(input.length);
          expect(rebuilt).assertEqual(input);
          iterator.setLineBreakText('');
          const emptyStart: number = iterator.first();
          const emptyNext: number = iterator.next();
          hilog.info(DOMAIN, TAG, '空文本 first=%{public}d next=%{public}d', emptyStart, emptyNext);
          expect(emptyStart).assertEqual(0);
          expect(emptyNext).assertEqual(-1);
        }
      } finally {
        hilog.info(DOMAIN, TAG, '%{public}s', 'intl_api_line_break_boundaries end');
      }
    });
  });
}
