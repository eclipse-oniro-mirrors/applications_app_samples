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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../../utils/EventLoopYield';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { formatDateFromMonthIndex } from '../model/FilePreviewDlpLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FilePreviewDLP]';
const BUNDLE: string = 'FilePreviewDLP_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for formatDateFromMonthIndex (74 cases). */
export default function formatDateFromMonthIndex3Test(): void {
  describe('FormatDateFromMonthIndex3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0193
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0193
     * @tc.desc      formatDateFromMonthIndex(year=-1, monthIndex=100, day=100) returns "-1-101-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0193 begin`);
      const actual: string = formatDateFromMonthIndex(-1, 100, 100);
      logInfo(`formatDateFromMonthIndex(year=-1, monthIn...: actual=${actual}`);
      expect(actual).assertEqual('-1-101-100');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0193 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0194
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0194
     * @tc.desc      formatDateFromMonthIndex(year=0, monthIndex=100, day=30) returns "0-101-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0194 begin`);
      const actual: string = formatDateFromMonthIndex(0, 100, 30);
      logInfo(`formatDateFromMonthIndex(year=0, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('0-101-30');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0194 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0195
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0195
     * @tc.desc      formatDateFromMonthIndex(year=2, monthIndex=6, day=28) returns "2-07-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0195 begin`);
      const actual: string = formatDateFromMonthIndex(2, 6, 28);
      logInfo(`formatDateFromMonthIndex(year=2, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('2-07-28');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0195 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0196
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0196
     * @tc.desc      formatDateFromMonthIndex(year=1900, monthIndex=1, day=15) returns "1900-02-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0196 begin`);
      const actual: string = formatDateFromMonthIndex(1900, 1, 15);
      logInfo(`formatDateFromMonthIndex(year=1900, month...: actual=${actual}`);
      expect(actual).assertEqual('1900-02-15');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0196 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0197
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0197
     * @tc.desc      formatDateFromMonthIndex(year=2025, monthIndex=10, day=30) returns "2025-11-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0197 begin`);
      const actual: string = formatDateFromMonthIndex(2025, 10, 30);
      logInfo(`formatDateFromMonthIndex(year=2025, month...: actual=${actual}`);
      expect(actual).assertEqual('2025-11-30');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0197 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0198
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0198
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=10, day=15) returns "2024-11-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0198 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 10, 15);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-11-15');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0198 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0199
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0199
     * @tc.desc      formatDateFromMonthIndex(year=3, monthIndex=10, day=3) returns "3-11-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0199 begin`);
      const actual: string = formatDateFromMonthIndex(3, 10, 3);
      logInfo(`formatDateFromMonthIndex(year=3, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('3-11-03');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0199 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0200
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0200
     * @tc.desc      formatDateFromMonthIndex(year=2, monthIndex=0, day=3) returns "2-01-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0200 begin`);
      const actual: string = formatDateFromMonthIndex(2, 0, 3);
      logInfo(`formatDateFromMonthIndex(year=2, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('2-01-03');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0200 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0201
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0201
     * @tc.desc      formatDateFromMonthIndex(year=1900, monthIndex=3, day=29) returns "1900-04-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0201 begin`);
      const actual: string = formatDateFromMonthIndex(1900, 3, 29);
      logInfo(`formatDateFromMonthIndex(year=1900, month...: actual=${actual}`);
      expect(actual).assertEqual('1900-04-29');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0201 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0202
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0202
     * @tc.desc      formatDateFromMonthIndex(year=2025, monthIndex=1, day=28) returns "2025-02-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0202 begin`);
      const actual: string = formatDateFromMonthIndex(2025, 1, 28);
      logInfo(`formatDateFromMonthIndex(year=2025, month...: actual=${actual}`);
      expect(actual).assertEqual('2025-02-28');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0202 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0203
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0203
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=0, day=29) returns "2024-01-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0203 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 0, 29);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-01-29');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0203 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0204
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0204
     * @tc.desc      formatDateFromMonthIndex(year=2023, monthIndex=10, day=1) returns "2023-11-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0204 begin`);
      const actual: string = formatDateFromMonthIndex(2023, 10, 1);
      logInfo(`formatDateFromMonthIndex(year=2023, month...: actual=${actual}`);
      expect(actual).assertEqual('2023-11-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0204 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0205
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0205
     * @tc.desc      formatDateFromMonthIndex(year=2100, monthIndex=100, day=30) returns "2100-101-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0205 begin`);
      const actual: string = formatDateFromMonthIndex(2100, 100, 30);
      logInfo(`formatDateFromMonthIndex(year=2100, month...: actual=${actual}`);
      expect(actual).assertEqual('2100-101-30');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0205 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0206
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0206
     * @tc.desc      formatDateFromMonthIndex(year=1900, monthIndex=5, day=10) returns "1900-06-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0206 begin`);
      const actual: string = formatDateFromMonthIndex(1900, 5, 10);
      logInfo(`formatDateFromMonthIndex(year=1900, month...: actual=${actual}`);
      expect(actual).assertEqual('1900-06-10');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0206 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0207
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0207
     * @tc.desc      formatDateFromMonthIndex(year=-1, monthIndex=3, day=31) returns "-1-04-31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0207 begin`);
      const actual: string = formatDateFromMonthIndex(-1, 3, 31);
      logInfo(`formatDateFromMonthIndex(year=-1, monthIn...: actual=${actual}`);
      expect(actual).assertEqual('-1-04-31');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0207 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0208
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0208
     * @tc.desc      formatDateFromMonthIndex(year=2, monthIndex=2, day=-1) returns "2-03--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0208 begin`);
      const actual: string = formatDateFromMonthIndex(2, 2, -1);
      logInfo(`formatDateFromMonthIndex(year=2, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('2-03--1');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0208 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0209
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0209
     * @tc.desc      formatDateFromMonthIndex(year=1900, monthIndex=10, day=29) returns "1900-11-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0209 begin`);
      const actual: string = formatDateFromMonthIndex(1900, 10, 29);
      logInfo(`formatDateFromMonthIndex(year=1900, month...: actual=${actual}`);
      expect(actual).assertEqual('1900-11-29');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0209 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0210
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0210
     * @tc.desc      formatDateFromMonthIndex(year=1970, monthIndex=2, day=10) returns "1970-03-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0210 begin`);
      const actual: string = formatDateFromMonthIndex(1970, 2, 10);
      logInfo(`formatDateFromMonthIndex(year=1970, month...: actual=${actual}`);
      expect(actual).assertEqual('1970-03-10');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0210 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0211
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0211
     * @tc.desc      formatDateFromMonthIndex(year=0, monthIndex=25.26, day=30) returns "0-26.26-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0211 begin`);
      const actual: string = formatDateFromMonthIndex(0, 25.26, 30);
      logInfo(`formatDateFromMonthIndex(year=0, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('0-26.26-30');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0211 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0212
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0212
     * @tc.desc      formatDateFromMonthIndex(year=-1, monthIndex=12, day=2) returns "-1-13-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0212 begin`);
      const actual: string = formatDateFromMonthIndex(-1, 12, 2);
      logInfo(`formatDateFromMonthIndex(year=-1, monthIn...: actual=${actual}`);
      expect(actual).assertEqual('-1-13-02');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0212 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0213
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0213
     * @tc.desc      formatDateFromMonthIndex(year=2, monthIndex=10, day=15) returns "2-11-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0213 begin`);
      const actual: string = formatDateFromMonthIndex(2, 10, 15);
      logInfo(`formatDateFromMonthIndex(year=2, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('2-11-15');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0213 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0214
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0214
     * @tc.desc      formatDateFromMonthIndex(year=2025, monthIndex=13, day=2) returns "2025-14-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0214 begin`);
      const actual: string = formatDateFromMonthIndex(2025, 13, 2);
      logInfo(`formatDateFromMonthIndex(year=2025, month...: actual=${actual}`);
      expect(actual).assertEqual('2025-14-02');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0214 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0215
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0215
     * @tc.desc      formatDateFromMonthIndex(year=2000, monthIndex=0, day=-1) returns "2000-01--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0215 begin`);
      const actual: string = formatDateFromMonthIndex(2000, 0, -1);
      logInfo(`formatDateFromMonthIndex(year=2000, month...: actual=${actual}`);
      expect(actual).assertEqual('2000-01--1');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0215 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0216
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0216
     * @tc.desc      formatDateFromMonthIndex(year=2, monthIndex=-1, day=-1) returns "2-00--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0216 begin`);
      const actual: string = formatDateFromMonthIndex(2, -1, -1);
      logInfo(`formatDateFromMonthIndex(year=2, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('2-00--1');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0216 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0217
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0217
     * @tc.desc      formatDateFromMonthIndex(year=2023, monthIndex=25.26, day=10) returns "2023-26.26-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0217 begin`);
      const actual: string = formatDateFromMonthIndex(2023, 25.26, 10);
      logInfo(`formatDateFromMonthIndex(year=2023, month...: actual=${actual}`);
      expect(actual).assertEqual('2023-26.26-10');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0217 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0218
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0218
     * @tc.desc      formatDateFromMonthIndex(year=2023, monthIndex=12, day=100) returns "2023-13-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0218 begin`);
      const actual: string = formatDateFromMonthIndex(2023, 12, 100);
      logInfo(`formatDateFromMonthIndex(year=2023, month...: actual=${actual}`);
      expect(actual).assertEqual('2023-13-100');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0218 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0219
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0219
     * @tc.desc      formatDateFromMonthIndex(year=2023, monthIndex=100, day=30) returns "2023-101-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0219 begin`);
      const actual: string = formatDateFromMonthIndex(2023, 100, 30);
      logInfo(`formatDateFromMonthIndex(year=2023, month...: actual=${actual}`);
      expect(actual).assertEqual('2023-101-30');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0219 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0220
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0220
     * @tc.desc      formatDateFromMonthIndex(year=-1, monthIndex=1, day=10) returns "-1-02-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0220 begin`);
      const actual: string = formatDateFromMonthIndex(-1, 1, 10);
      logInfo(`formatDateFromMonthIndex(year=-1, monthIn...: actual=${actual}`);
      expect(actual).assertEqual('-1-02-10');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0220 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0221
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0221
     * @tc.desc      formatDateFromMonthIndex(year=1900, monthIndex=2, day=28) returns "1900-03-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0221 begin`);
      const actual: string = formatDateFromMonthIndex(1900, 2, 28);
      logInfo(`formatDateFromMonthIndex(year=1900, month...: actual=${actual}`);
      expect(actual).assertEqual('1900-03-28');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0221 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0222
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0222
     * @tc.desc      formatDateFromMonthIndex(year=2023, monthIndex=0, day=100) returns "2023-01-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0222 begin`);
      const actual: string = formatDateFromMonthIndex(2023, 0, 100);
      logInfo(`formatDateFromMonthIndex(year=2023, month...: actual=${actual}`);
      expect(actual).assertEqual('2023-01-100');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0222 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0223
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0223
     * @tc.desc      formatDateFromMonthIndex(year=2, monthIndex=13, day=31) returns "2-14-31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0223 begin`);
      const actual: string = formatDateFromMonthIndex(2, 13, 31);
      logInfo(`formatDateFromMonthIndex(year=2, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('2-14-31');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0223 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0224
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0224
     * @tc.desc      formatDateFromMonthIndex(year=2025, monthIndex=10, day=28) returns "2025-11-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0224 begin`);
      const actual: string = formatDateFromMonthIndex(2025, 10, 28);
      logInfo(`formatDateFromMonthIndex(year=2025, month...: actual=${actual}`);
      expect(actual).assertEqual('2025-11-28');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0224 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0225
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0225
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=3, day=15) returns "2024-04-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0225 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 3, 15);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-04-15');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0225 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0226
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0226
     * @tc.desc      formatDateFromMonthIndex(year=0, monthIndex=5, day=3) returns "0-06-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0226 begin`);
      const actual: string = formatDateFromMonthIndex(0, 5, 3);
      logInfo(`formatDateFromMonthIndex(year=0, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('0-06-03');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0226 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0227
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0227
     * @tc.desc      formatDateFromMonthIndex(year=2100, monthIndex=25.26, day=10) returns "2100-26.26-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0227 begin`);
      const actual: string = formatDateFromMonthIndex(2100, 25.26, 10);
      logInfo(`formatDateFromMonthIndex(year=2100, month...: actual=${actual}`);
      expect(actual).assertEqual('2100-26.26-10');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0227 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0228
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0228
     * @tc.desc      formatDateFromMonthIndex(year=2025, monthIndex=5, day=30) returns "2025-06-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0228 begin`);
      const actual: string = formatDateFromMonthIndex(2025, 5, 30);
      logInfo(`formatDateFromMonthIndex(year=2025, month...: actual=${actual}`);
      expect(actual).assertEqual('2025-06-30');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0228 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0229
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0229
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=-1, day=15) returns "2024-00-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0229 begin`);
      const actual: string = formatDateFromMonthIndex(2024, -1, 15);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-00-15');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0229 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0230
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0230
     * @tc.desc      formatDateFromMonthIndex(year=2023, monthIndex=12, day=29) returns "2023-13-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0230 begin`);
      const actual: string = formatDateFromMonthIndex(2023, 12, 29);
      logInfo(`formatDateFromMonthIndex(year=2023, month...: actual=${actual}`);
      expect(actual).assertEqual('2023-13-29');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0230 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0231
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0231
     * @tc.desc      formatDateFromMonthIndex(year=3, monthIndex=12, day=0) returns "3-13-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0231 begin`);
      const actual: string = formatDateFromMonthIndex(3, 12, 0);
      logInfo(`formatDateFromMonthIndex(year=3, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('3-13-00');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0231 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0232
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0232
     * @tc.desc      formatDateFromMonthIndex(year=2100, monthIndex=5, day=-1) returns "2100-06--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0232 begin`);
      const actual: string = formatDateFromMonthIndex(2100, 5, -1);
      logInfo(`formatDateFromMonthIndex(year=2100, month...: actual=${actual}`);
      expect(actual).assertEqual('2100-06--1');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0232 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0233
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0233
     * @tc.desc      formatDateFromMonthIndex(year=-1, monthIndex=3, day=-1) returns "-1-04--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0233 begin`);
      const actual: string = formatDateFromMonthIndex(-1, 3, -1);
      logInfo(`formatDateFromMonthIndex(year=-1, monthIn...: actual=${actual}`);
      expect(actual).assertEqual('-1-04--1');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0233 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0234
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0234
     * @tc.desc      formatDateFromMonthIndex(year=-1, monthIndex=6, day=3) returns "-1-07-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0234 begin`);
      const actual: string = formatDateFromMonthIndex(-1, 6, 3);
      logInfo(`formatDateFromMonthIndex(year=-1, monthIn...: actual=${actual}`);
      expect(actual).assertEqual('-1-07-03');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0234 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0235
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0235
     * @tc.desc      formatDateFromMonthIndex(year=2000, monthIndex=12, day=29) returns "2000-13-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0235 begin`);
      const actual: string = formatDateFromMonthIndex(2000, 12, 29);
      logInfo(`formatDateFromMonthIndex(year=2000, month...: actual=${actual}`);
      expect(actual).assertEqual('2000-13-29');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0235 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0236
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0236
     * @tc.desc      formatDateFromMonthIndex(year=2023, monthIndex=10, day=100) returns "2023-11-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0236 begin`);
      const actual: string = formatDateFromMonthIndex(2023, 10, 100);
      logInfo(`formatDateFromMonthIndex(year=2023, month...: actual=${actual}`);
      expect(actual).assertEqual('2023-11-100');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0236 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0237
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0237
     * @tc.desc      formatDateFromMonthIndex(year=1900, monthIndex=3, day=30) returns "1900-04-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0237 begin`);
      const actual: string = formatDateFromMonthIndex(1900, 3, 30);
      logInfo(`formatDateFromMonthIndex(year=1900, month...: actual=${actual}`);
      expect(actual).assertEqual('1900-04-30');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0237 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0238
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0238
     * @tc.desc      formatDateFromMonthIndex(year=1970, monthIndex=10, day=-1) returns "1970-11--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0238 begin`);
      const actual: string = formatDateFromMonthIndex(1970, 10, -1);
      logInfo(`formatDateFromMonthIndex(year=1970, month...: actual=${actual}`);
      expect(actual).assertEqual('1970-11--1');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0238 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0239
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0239
     * @tc.desc      formatDateFromMonthIndex(year=2000, monthIndex=13, day=3) returns "2000-14-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0239 begin`);
      const actual: string = formatDateFromMonthIndex(2000, 13, 3);
      logInfo(`formatDateFromMonthIndex(year=2000, month...: actual=${actual}`);
      expect(actual).assertEqual('2000-14-03');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0239 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0240
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0240
     * @tc.desc      formatDateFromMonthIndex(year=2000, monthIndex=5, day=31) returns "2000-06-31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0240 begin`);
      const actual: string = formatDateFromMonthIndex(2000, 5, 31);
      logInfo(`formatDateFromMonthIndex(year=2000, month...: actual=${actual}`);
      expect(actual).assertEqual('2000-06-31');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0240 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0241
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0241
     * @tc.desc      formatDateFromMonthIndex(year=2023, monthIndex=100, day=31) returns "2023-101-31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0241 begin`);
      const actual: string = formatDateFromMonthIndex(2023, 100, 31);
      logInfo(`formatDateFromMonthIndex(year=2023, month...: actual=${actual}`);
      expect(actual).assertEqual('2023-101-31');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0241 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0242
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0242
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=6, day=29) returns "2024-07-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0242 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 6, 29);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-07-29');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0242 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0243
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0243
     * @tc.desc      formatDateFromMonthIndex(year=1970, monthIndex=13, day=2) returns "1970-14-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0243 begin`);
      const actual: string = formatDateFromMonthIndex(1970, 13, 2);
      logInfo(`formatDateFromMonthIndex(year=1970, month...: actual=${actual}`);
      expect(actual).assertEqual('1970-14-02');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0243 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0244
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0244
     * @tc.desc      formatDateFromMonthIndex(year=2, monthIndex=3, day=15) returns "2-04-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0244 begin`);
      const actual: string = formatDateFromMonthIndex(2, 3, 15);
      logInfo(`formatDateFromMonthIndex(year=2, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('2-04-15');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0244 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0245
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0245
     * @tc.desc      formatDateFromMonthIndex(year=-1, monthIndex=0, day=1) returns "-1-01-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0245 begin`);
      const actual: string = formatDateFromMonthIndex(-1, 0, 1);
      logInfo(`formatDateFromMonthIndex(year=-1, monthIn...: actual=${actual}`);
      expect(actual).assertEqual('-1-01-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0245 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0246
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0246
     * @tc.desc      formatDateFromMonthIndex(year=2100, monthIndex=5, day=2) returns "2100-06-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0246 begin`);
      const actual: string = formatDateFromMonthIndex(2100, 5, 2);
      logInfo(`formatDateFromMonthIndex(year=2100, month...: actual=${actual}`);
      expect(actual).assertEqual('2100-06-02');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0246 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0247
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0247
     * @tc.desc      formatDateFromMonthIndex(year=2025, monthIndex=12, day=15) returns "2025-13-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0247 begin`);
      const actual: string = formatDateFromMonthIndex(2025, 12, 15);
      logInfo(`formatDateFromMonthIndex(year=2025, month...: actual=${actual}`);
      expect(actual).assertEqual('2025-13-15');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0247 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0248
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0248
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=100, day=28) returns "2024-101-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0248 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 100, 28);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-101-28');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0248 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0249
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0249
     * @tc.desc      formatDateFromMonthIndex(year=0, monthIndex=0, day=28) returns "0-01-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0249 begin`);
      const actual: string = formatDateFromMonthIndex(0, 0, 28);
      logInfo(`formatDateFromMonthIndex(year=0, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('0-01-28');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0249 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0250
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0250
     * @tc.desc      formatDateFromMonthIndex(year=2100, monthIndex=0, day=3) returns "2100-01-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0250 begin`);
      const actual: string = formatDateFromMonthIndex(2100, 0, 3);
      logInfo(`formatDateFromMonthIndex(year=2100, month...: actual=${actual}`);
      expect(actual).assertEqual('2100-01-03');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0250 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0251
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0251
     * @tc.desc      formatDateFromMonthIndex(year=2000, monthIndex=3, day=-1) returns "2000-04--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0251 begin`);
      const actual: string = formatDateFromMonthIndex(2000, 3, -1);
      logInfo(`formatDateFromMonthIndex(year=2000, month...: actual=${actual}`);
      expect(actual).assertEqual('2000-04--1');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0251 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0252
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0252
     * @tc.desc      formatDateFromMonthIndex(year=3, monthIndex=0, day=30) returns "3-01-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0252 begin`);
      const actual: string = formatDateFromMonthIndex(3, 0, 30);
      logInfo(`formatDateFromMonthIndex(year=3, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('3-01-30');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0252 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0253
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0253
     * @tc.desc      formatDateFromMonthIndex(year=1900, monthIndex=10, day=1) returns "1900-11-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0253 begin`);
      const actual: string = formatDateFromMonthIndex(1900, 10, 1);
      logInfo(`formatDateFromMonthIndex(year=1900, month...: actual=${actual}`);
      expect(actual).assertEqual('1900-11-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0253 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0254
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0254
     * @tc.desc      formatDateFromMonthIndex(year=2023, monthIndex=1, day=0) returns "2023-02-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0254 begin`);
      const actual: string = formatDateFromMonthIndex(2023, 1, 0);
      logInfo(`formatDateFromMonthIndex(year=2023, month...: actual=${actual}`);
      expect(actual).assertEqual('2023-02-00');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0254 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0255
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0255
     * @tc.desc      formatDateFromMonthIndex(year=-1, monthIndex=100, day=29) returns "-1-101-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0255 begin`);
      const actual: string = formatDateFromMonthIndex(-1, 100, 29);
      logInfo(`formatDateFromMonthIndex(year=-1, monthIn...: actual=${actual}`);
      expect(actual).assertEqual('-1-101-29');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0255 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0256
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0256
     * @tc.desc      formatDateFromMonthIndex(year=2100, monthIndex=100, day=29) returns "2100-101-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0256 begin`);
      const actual: string = formatDateFromMonthIndex(2100, 100, 29);
      logInfo(`formatDateFromMonthIndex(year=2100, month...: actual=${actual}`);
      expect(actual).assertEqual('2100-101-29');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0256 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0257
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0257
     * @tc.desc      formatDateFromMonthIndex(year=2000, monthIndex=3, day=3) returns "2000-04-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0257 begin`);
      const actual: string = formatDateFromMonthIndex(2000, 3, 3);
      logInfo(`formatDateFromMonthIndex(year=2000, month...: actual=${actual}`);
      expect(actual).assertEqual('2000-04-03');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0257 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0258
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0258
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=10, day=3) returns "2024-11-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0258 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 10, 3);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-11-03');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0258 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0259
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0259
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=-1, day=28) returns "2024-00-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0259 begin`);
      const actual: string = formatDateFromMonthIndex(2024, -1, 28);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-00-28');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0259 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0260
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0260
     * @tc.desc      formatDateFromMonthIndex(year=2100, monthIndex=-1, day=1) returns "2100-00-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0260 begin`);
      const actual: string = formatDateFromMonthIndex(2100, -1, 1);
      logInfo(`formatDateFromMonthIndex(year=2100, month...: actual=${actual}`);
      expect(actual).assertEqual('2100-00-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0260 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0261
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0261
     * @tc.desc      formatDateFromMonthIndex(year=2023, monthIndex=5, day=29) returns "2023-06-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0261 begin`);
      const actual: string = formatDateFromMonthIndex(2023, 5, 29);
      logInfo(`formatDateFromMonthIndex(year=2023, month...: actual=${actual}`);
      expect(actual).assertEqual('2023-06-29');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0261 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0262
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0262
     * @tc.desc      formatDateFromMonthIndex(year=1, monthIndex=5, day=30) returns "1-06-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0262 begin`);
      const actual: string = formatDateFromMonthIndex(1, 5, 30);
      logInfo(`formatDateFromMonthIndex(year=1, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('1-06-30');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0262 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0263
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0263
     * @tc.desc      formatDateFromMonthIndex(year=1, monthIndex=6, day=1) returns "1-07-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0263 begin`);
      const actual: string = formatDateFromMonthIndex(1, 6, 1);
      logInfo(`formatDateFromMonthIndex(year=1, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('1-07-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0263 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0264
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0264
     * @tc.desc      formatDateFromMonthIndex(year=2000, monthIndex=10, day=29) returns "2000-11-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0264 begin`);
      const actual: string = formatDateFromMonthIndex(2000, 10, 29);
      logInfo(`formatDateFromMonthIndex(year=2000, month...: actual=${actual}`);
      expect(actual).assertEqual('2000-11-29');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0264 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0265
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0265
     * @tc.desc      formatDateFromMonthIndex(year=1900, monthIndex=13, day=15) returns "1900-14-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0265 begin`);
      const actual: string = formatDateFromMonthIndex(1900, 13, 15);
      logInfo(`formatDateFromMonthIndex(year=1900, month...: actual=${actual}`);
      expect(actual).assertEqual('1900-14-15');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0265 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0266
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0266
     * @tc.desc      formatDateFromMonthIndex(year=1970, monthIndex=25.26, day=29) returns "1970-26.26-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0266 begin`);
      const actual: string = formatDateFromMonthIndex(1970, 25.26, 29);
      logInfo(`formatDateFromMonthIndex(year=1970, month...: actual=${actual}`);
      expect(actual).assertEqual('1970-26.26-29');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0266 end`);
    });
  });
}
