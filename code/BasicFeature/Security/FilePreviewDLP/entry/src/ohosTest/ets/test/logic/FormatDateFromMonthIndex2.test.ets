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

/** Logic checks for formatDateFromMonthIndex (96 cases). */
export default function formatDateFromMonthIndex2Test(): void {
  describe('FormatDateFromMonthIndex2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0097
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0097
     * @tc.desc      formatDateFromMonthIndex(year=2000, monthIndex=6, day=2) returns "2000-07-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0097 begin`);
      const actual: string = formatDateFromMonthIndex(2000, 6, 2);
      logInfo(`formatDateFromMonthIndex(year=2000, month...: actual=${actual}`);
      expect(actual).assertEqual('2000-07-02');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0097 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0098
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0098
     * @tc.desc      formatDateFromMonthIndex(year=2000, monthIndex=-1, day=31) returns "2000-00-31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0098 begin`);
      const actual: string = formatDateFromMonthIndex(2000, -1, 31);
      logInfo(`formatDateFromMonthIndex(year=2000, month...: actual=${actual}`);
      expect(actual).assertEqual('2000-00-31');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0098 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0099
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0099
     * @tc.desc      formatDateFromMonthIndex(year=2023, monthIndex=6, day=100) returns "2023-07-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0099 begin`);
      const actual: string = formatDateFromMonthIndex(2023, 6, 100);
      logInfo(`formatDateFromMonthIndex(year=2023, month...: actual=${actual}`);
      expect(actual).assertEqual('2023-07-100');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0099 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0100
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0100
     * @tc.desc      formatDateFromMonthIndex(year=3, monthIndex=-1, day=29) returns "3-00-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0100 begin`);
      const actual: string = formatDateFromMonthIndex(3, -1, 29);
      logInfo(`formatDateFromMonthIndex(year=3, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('3-00-29');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0100 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0101
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0101
     * @tc.desc      formatDateFromMonthIndex(year=3, monthIndex=25.26, day=1) returns "3-26.26-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0101 begin`);
      const actual: string = formatDateFromMonthIndex(3, 25.26, 1);
      logInfo(`formatDateFromMonthIndex(year=3, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('3-26.26-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0101 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0102
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0102
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=2, day=-1) returns "2024-03--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0102 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 2, -1);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-03--1');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0102 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0103
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0103
     * @tc.desc      formatDateFromMonthIndex(year=1900, monthIndex=10, day=15) returns "1900-11-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0103 begin`);
      const actual: string = formatDateFromMonthIndex(1900, 10, 15);
      logInfo(`formatDateFromMonthIndex(year=1900, month...: actual=${actual}`);
      expect(actual).assertEqual('1900-11-15');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0103 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0104
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0104
     * @tc.desc      formatDateFromMonthIndex(year=1970, monthIndex=-1, day=10) returns "1970-00-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0104 begin`);
      const actual: string = formatDateFromMonthIndex(1970, -1, 10);
      logInfo(`formatDateFromMonthIndex(year=1970, month...: actual=${actual}`);
      expect(actual).assertEqual('1970-00-10');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0104 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0105
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0105
     * @tc.desc      formatDateFromMonthIndex(year=2025, monthIndex=-1, day=28) returns "2025-00-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0105 begin`);
      const actual: string = formatDateFromMonthIndex(2025, -1, 28);
      logInfo(`formatDateFromMonthIndex(year=2025, month...: actual=${actual}`);
      expect(actual).assertEqual('2025-00-28');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0105 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0106
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0106
     * @tc.desc      formatDateFromMonthIndex(year=2000, monthIndex=10, day=30) returns "2000-11-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0106 begin`);
      const actual: string = formatDateFromMonthIndex(2000, 10, 30);
      logInfo(`formatDateFromMonthIndex(year=2000, month...: actual=${actual}`);
      expect(actual).assertEqual('2000-11-30');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0106 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0107
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0107
     * @tc.desc      formatDateFromMonthIndex(year=1, monthIndex=25.26, day=30) returns "1-26.26-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0107 begin`);
      const actual: string = formatDateFromMonthIndex(1, 25.26, 30);
      logInfo(`formatDateFromMonthIndex(year=1, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('1-26.26-30');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0107 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0108
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0108
     * @tc.desc      formatDateFromMonthIndex(year=0, monthIndex=1, day=0) returns "0-02-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0108 begin`);
      const actual: string = formatDateFromMonthIndex(0, 1, 0);
      logInfo(`formatDateFromMonthIndex(year=0, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('0-02-00');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0108 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0109
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0109
     * @tc.desc      formatDateFromMonthIndex(year=1970, monthIndex=10, day=0) returns "1970-11-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0109 begin`);
      const actual: string = formatDateFromMonthIndex(1970, 10, 0);
      logInfo(`formatDateFromMonthIndex(year=1970, month...: actual=${actual}`);
      expect(actual).assertEqual('1970-11-00');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0109 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0110
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0110
     * @tc.desc      formatDateFromMonthIndex(year=2023, monthIndex=12, day=30) returns "2023-13-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0110 begin`);
      const actual: string = formatDateFromMonthIndex(2023, 12, 30);
      logInfo(`formatDateFromMonthIndex(year=2023, month...: actual=${actual}`);
      expect(actual).assertEqual('2023-13-30');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0110 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0111
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0111
     * @tc.desc      formatDateFromMonthIndex(year=2, monthIndex=12, day=10) returns "2-13-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0111 begin`);
      const actual: string = formatDateFromMonthIndex(2, 12, 10);
      logInfo(`formatDateFromMonthIndex(year=2, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('2-13-10');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0111 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0112
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0112
     * @tc.desc      formatDateFromMonthIndex(year=1, monthIndex=13, day=2) returns "1-14-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0112 begin`);
      const actual: string = formatDateFromMonthIndex(1, 13, 2);
      logInfo(`formatDateFromMonthIndex(year=1, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('1-14-02');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0112 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0113
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0113
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=-1, day=31) returns "2024-00-31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0113 begin`);
      const actual: string = formatDateFromMonthIndex(2024, -1, 31);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-00-31');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0113 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0114
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0114
     * @tc.desc      formatDateFromMonthIndex(year=1900, monthIndex=6, day=31) returns "1900-07-31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0114 begin`);
      const actual: string = formatDateFromMonthIndex(1900, 6, 31);
      logInfo(`formatDateFromMonthIndex(year=1900, month...: actual=${actual}`);
      expect(actual).assertEqual('1900-07-31');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0114 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0115
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0115
     * @tc.desc      formatDateFromMonthIndex(year=2, monthIndex=5, day=100) returns "2-06-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0115 begin`);
      const actual: string = formatDateFromMonthIndex(2, 5, 100);
      logInfo(`formatDateFromMonthIndex(year=2, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('2-06-100');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0115 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0116
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0116
     * @tc.desc      formatDateFromMonthIndex(year=2025, monthIndex=-1, day=100) returns "2025-00-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0116 begin`);
      const actual: string = formatDateFromMonthIndex(2025, -1, 100);
      logInfo(`formatDateFromMonthIndex(year=2025, month...: actual=${actual}`);
      expect(actual).assertEqual('2025-00-100');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0116 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0117
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0117
     * @tc.desc      formatDateFromMonthIndex(year=2, monthIndex=3, day=30) returns "2-04-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0117 begin`);
      const actual: string = formatDateFromMonthIndex(2, 3, 30);
      logInfo(`formatDateFromMonthIndex(year=2, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('2-04-30');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0117 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0118
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0118
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=12, day=28) returns "2024-13-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0118 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 12, 28);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-13-28');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0118 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0119
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0119
     * @tc.desc      formatDateFromMonthIndex(year=2000, monthIndex=6, day=100) returns "2000-07-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0119 begin`);
      const actual: string = formatDateFromMonthIndex(2000, 6, 100);
      logInfo(`formatDateFromMonthIndex(year=2000, month...: actual=${actual}`);
      expect(actual).assertEqual('2000-07-100');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0119 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0120
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0120
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=0, day=30) returns "2024-01-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0120 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 0, 30);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-01-30');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0120 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0121
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0121
     * @tc.desc      formatDateFromMonthIndex(year=1970, monthIndex=2, day=2) returns "1970-03-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0121 begin`);
      const actual: string = formatDateFromMonthIndex(1970, 2, 2);
      logInfo(`formatDateFromMonthIndex(year=1970, month...: actual=${actual}`);
      expect(actual).assertEqual('1970-03-02');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0121 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0122
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0122
     * @tc.desc      formatDateFromMonthIndex(year=1, monthIndex=-1, day=1) returns "1-00-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0122 begin`);
      const actual: string = formatDateFromMonthIndex(1, -1, 1);
      logInfo(`formatDateFromMonthIndex(year=1, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('1-00-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0122 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0123
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0123
     * @tc.desc      formatDateFromMonthIndex(year=2, monthIndex=1, day=15) returns "2-02-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0123 begin`);
      const actual: string = formatDateFromMonthIndex(2, 1, 15);
      logInfo(`formatDateFromMonthIndex(year=2, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('2-02-15');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0123 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0124
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0124
     * @tc.desc      formatDateFromMonthIndex(year=-1, monthIndex=12, day=-1) returns "-1-13--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0124 begin`);
      const actual: string = formatDateFromMonthIndex(-1, 12, -1);
      logInfo(`formatDateFromMonthIndex(year=-1, monthIn...: actual=${actual}`);
      expect(actual).assertEqual('-1-13--1');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0124 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0125
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0125
     * @tc.desc      formatDateFromMonthIndex(year=1, monthIndex=25.26, day=2) returns "1-26.26-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0125 begin`);
      const actual: string = formatDateFromMonthIndex(1, 25.26, 2);
      logInfo(`formatDateFromMonthIndex(year=1, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('1-26.26-02');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0125 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0126
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0126
     * @tc.desc      formatDateFromMonthIndex(year=2100, monthIndex=2, day=3) returns "2100-03-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0126 begin`);
      const actual: string = formatDateFromMonthIndex(2100, 2, 3);
      logInfo(`formatDateFromMonthIndex(year=2100, month...: actual=${actual}`);
      expect(actual).assertEqual('2100-03-03');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0126 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0127
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0127
     * @tc.desc      formatDateFromMonthIndex(year=1970, monthIndex=100, day=2) returns "1970-101-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0127 begin`);
      const actual: string = formatDateFromMonthIndex(1970, 100, 2);
      logInfo(`formatDateFromMonthIndex(year=1970, month...: actual=${actual}`);
      expect(actual).assertEqual('1970-101-02');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0127 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0128
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0128
     * @tc.desc      formatDateFromMonthIndex(year=2000, monthIndex=0, day=28) returns "2000-01-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0128 begin`);
      const actual: string = formatDateFromMonthIndex(2000, 0, 28);
      logInfo(`formatDateFromMonthIndex(year=2000, month...: actual=${actual}`);
      expect(actual).assertEqual('2000-01-28');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0128 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0129
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0129
     * @tc.desc      formatDateFromMonthIndex(year=2023, monthIndex=3, day=31) returns "2023-04-31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0129 begin`);
      const actual: string = formatDateFromMonthIndex(2023, 3, 31);
      logInfo(`formatDateFromMonthIndex(year=2023, month...: actual=${actual}`);
      expect(actual).assertEqual('2023-04-31');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0129 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0130
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0130
     * @tc.desc      formatDateFromMonthIndex(year=1900, monthIndex=3, day=10) returns "1900-04-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0130 begin`);
      const actual: string = formatDateFromMonthIndex(1900, 3, 10);
      logInfo(`formatDateFromMonthIndex(year=1900, month...: actual=${actual}`);
      expect(actual).assertEqual('1900-04-10');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0130 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0131
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0131
     * @tc.desc      formatDateFromMonthIndex(year=3, monthIndex=2, day=0) returns "3-03-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0131 begin`);
      const actual: string = formatDateFromMonthIndex(3, 2, 0);
      logInfo(`formatDateFromMonthIndex(year=3, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('3-03-00');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0131 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0132
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0132
     * @tc.desc      formatDateFromMonthIndex(year=1, monthIndex=13, day=10) returns "1-14-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0132 begin`);
      const actual: string = formatDateFromMonthIndex(1, 13, 10);
      logInfo(`formatDateFromMonthIndex(year=1, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('1-14-10');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0132 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0133
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0133
     * @tc.desc      formatDateFromMonthIndex(year=2100, monthIndex=0, day=0) returns "2100-01-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0133 begin`);
      const actual: string = formatDateFromMonthIndex(2100, 0, 0);
      logInfo(`formatDateFromMonthIndex(year=2100, month...: actual=${actual}`);
      expect(actual).assertEqual('2100-01-00');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0133 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0134
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0134
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=6, day=28) returns "2024-07-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0134 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 6, 28);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-07-28');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0134 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0135
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0135
     * @tc.desc      formatDateFromMonthIndex(year=2000, monthIndex=2, day=28) returns "2000-03-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0135 begin`);
      const actual: string = formatDateFromMonthIndex(2000, 2, 28);
      logInfo(`formatDateFromMonthIndex(year=2000, month...: actual=${actual}`);
      expect(actual).assertEqual('2000-03-28');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0135 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0136
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0136
     * @tc.desc      formatDateFromMonthIndex(year=1, monthIndex=12, day=-1) returns "1-13--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0136 begin`);
      const actual: string = formatDateFromMonthIndex(1, 12, -1);
      logInfo(`formatDateFromMonthIndex(year=1, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('1-13--1');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0136 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0137
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0137
     * @tc.desc      formatDateFromMonthIndex(year=3, monthIndex=25.26, day=2) returns "3-26.26-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0137 begin`);
      const actual: string = formatDateFromMonthIndex(3, 25.26, 2);
      logInfo(`formatDateFromMonthIndex(year=3, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('3-26.26-02');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0137 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0138
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0138
     * @tc.desc      formatDateFromMonthIndex(year=-1, monthIndex=-1, day=31) returns "-1-00-31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0138 begin`);
      const actual: string = formatDateFromMonthIndex(-1, -1, 31);
      logInfo(`formatDateFromMonthIndex(year=-1, monthIn...: actual=${actual}`);
      expect(actual).assertEqual('-1-00-31');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0138 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0139
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0139
     * @tc.desc      formatDateFromMonthIndex(year=-1, monthIndex=2, day=15) returns "-1-03-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0139 begin`);
      const actual: string = formatDateFromMonthIndex(-1, 2, 15);
      logInfo(`formatDateFromMonthIndex(year=-1, monthIn...: actual=${actual}`);
      expect(actual).assertEqual('-1-03-15');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0139 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0140
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0140
     * @tc.desc      formatDateFromMonthIndex(year=3, monthIndex=12, day=-1) returns "3-13--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0140 begin`);
      const actual: string = formatDateFromMonthIndex(3, 12, -1);
      logInfo(`formatDateFromMonthIndex(year=3, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('3-13--1');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0140 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0141
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0141
     * @tc.desc      formatDateFromMonthIndex(year=-1, monthIndex=5, day=1) returns "-1-06-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0141 begin`);
      const actual: string = formatDateFromMonthIndex(-1, 5, 1);
      logInfo(`formatDateFromMonthIndex(year=-1, monthIn...: actual=${actual}`);
      expect(actual).assertEqual('-1-06-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0141 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0142
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0142
     * @tc.desc      formatDateFromMonthIndex(year=3, monthIndex=6, day=2) returns "3-07-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0142 begin`);
      const actual: string = formatDateFromMonthIndex(3, 6, 2);
      logInfo(`formatDateFromMonthIndex(year=3, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('3-07-02');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0142 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0143
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0143
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=0, day=0) returns "2024-01-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0143 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 0, 0);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-01-00');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0143 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0144
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0144
     * @tc.desc      formatDateFromMonthIndex(year=1900, monthIndex=2, day=1) returns "1900-03-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0144 begin`);
      const actual: string = formatDateFromMonthIndex(1900, 2, 1);
      logInfo(`formatDateFromMonthIndex(year=1900, month...: actual=${actual}`);
      expect(actual).assertEqual('1900-03-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0144 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0145
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0145
     * @tc.desc      formatDateFromMonthIndex(year=1, monthIndex=-1, day=-1) returns "1-00--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0145 begin`);
      const actual: string = formatDateFromMonthIndex(1, -1, -1);
      logInfo(`formatDateFromMonthIndex(year=1, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('1-00--1');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0145 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0146
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0146
     * @tc.desc      formatDateFromMonthIndex(year=2000, monthIndex=13, day=2) returns "2000-14-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0146 begin`);
      const actual: string = formatDateFromMonthIndex(2000, 13, 2);
      logInfo(`formatDateFromMonthIndex(year=2000, month...: actual=${actual}`);
      expect(actual).assertEqual('2000-14-02');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0146 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0147
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0147
     * @tc.desc      formatDateFromMonthIndex(year=-1, monthIndex=10, day=1) returns "-1-11-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0147 begin`);
      const actual: string = formatDateFromMonthIndex(-1, 10, 1);
      logInfo(`formatDateFromMonthIndex(year=-1, monthIn...: actual=${actual}`);
      expect(actual).assertEqual('-1-11-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0147 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0148
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0148
     * @tc.desc      formatDateFromMonthIndex(year=2023, monthIndex=1, day=3) returns "2023-02-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0148 begin`);
      const actual: string = formatDateFromMonthIndex(2023, 1, 3);
      logInfo(`formatDateFromMonthIndex(year=2023, month...: actual=${actual}`);
      expect(actual).assertEqual('2023-02-03');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0148 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0149
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0149
     * @tc.desc      formatDateFromMonthIndex(year=1970, monthIndex=-1, day=2) returns "1970-00-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0149 begin`);
      const actual: string = formatDateFromMonthIndex(1970, -1, 2);
      logInfo(`formatDateFromMonthIndex(year=1970, month...: actual=${actual}`);
      expect(actual).assertEqual('1970-00-02');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0149 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0150
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0150
     * @tc.desc      formatDateFromMonthIndex(year=1970, monthIndex=-1, day=31) returns "1970-00-31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0150 begin`);
      const actual: string = formatDateFromMonthIndex(1970, -1, 31);
      logInfo(`formatDateFromMonthIndex(year=1970, month...: actual=${actual}`);
      expect(actual).assertEqual('1970-00-31');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0150 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0151
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0151
     * @tc.desc      formatDateFromMonthIndex(year=1900, monthIndex=100, day=29) returns "1900-101-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0151 begin`);
      const actual: string = formatDateFromMonthIndex(1900, 100, 29);
      logInfo(`formatDateFromMonthIndex(year=1900, month...: actual=${actual}`);
      expect(actual).assertEqual('1900-101-29');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0151 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0152
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0152
     * @tc.desc      formatDateFromMonthIndex(year=2023, monthIndex=25.26, day=15) returns "2023-26.26-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0152 begin`);
      const actual: string = formatDateFromMonthIndex(2023, 25.26, 15);
      logInfo(`formatDateFromMonthIndex(year=2023, month...: actual=${actual}`);
      expect(actual).assertEqual('2023-26.26-15');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0152 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0153
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0153
     * @tc.desc      formatDateFromMonthIndex(year=2100, monthIndex=1, day=28) returns "2100-02-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0153 begin`);
      const actual: string = formatDateFromMonthIndex(2100, 1, 28);
      logInfo(`formatDateFromMonthIndex(year=2100, month...: actual=${actual}`);
      expect(actual).assertEqual('2100-02-28');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0153 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0154
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0154
     * @tc.desc      formatDateFromMonthIndex(year=2023, monthIndex=5, day=-1) returns "2023-06--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0154 begin`);
      const actual: string = formatDateFromMonthIndex(2023, 5, -1);
      logInfo(`formatDateFromMonthIndex(year=2023, month...: actual=${actual}`);
      expect(actual).assertEqual('2023-06--1');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0154 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0155
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0155
     * @tc.desc      formatDateFromMonthIndex(year=3, monthIndex=13, day=0) returns "3-14-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0155 begin`);
      const actual: string = formatDateFromMonthIndex(3, 13, 0);
      logInfo(`formatDateFromMonthIndex(year=3, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('3-14-00');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0155 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0156
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0156
     * @tc.desc      formatDateFromMonthIndex(year=2023, monthIndex=-1, day=10) returns "2023-00-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0156 begin`);
      const actual: string = formatDateFromMonthIndex(2023, -1, 10);
      logInfo(`formatDateFromMonthIndex(year=2023, month...: actual=${actual}`);
      expect(actual).assertEqual('2023-00-10');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0156 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0157
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0157
     * @tc.desc      formatDateFromMonthIndex(year=3, monthIndex=1, day=0) returns "3-02-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0157 begin`);
      const actual: string = formatDateFromMonthIndex(3, 1, 0);
      logInfo(`formatDateFromMonthIndex(year=3, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('3-02-00');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0157 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0158
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0158
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=100, day=29) returns "2024-101-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0158 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 100, 29);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-101-29');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0158 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0159
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0159
     * @tc.desc      formatDateFromMonthIndex(year=1900, monthIndex=13, day=100) returns "1900-14-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0159 begin`);
      const actual: string = formatDateFromMonthIndex(1900, 13, 100);
      logInfo(`formatDateFromMonthIndex(year=1900, month...: actual=${actual}`);
      expect(actual).assertEqual('1900-14-100');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0159 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0160
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0160
     * @tc.desc      formatDateFromMonthIndex(year=0, monthIndex=5, day=30) returns "0-06-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0160 begin`);
      const actual: string = formatDateFromMonthIndex(0, 5, 30);
      logInfo(`formatDateFromMonthIndex(year=0, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('0-06-30');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0160 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0161
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0161
     * @tc.desc      formatDateFromMonthIndex(year=1970, monthIndex=10, day=29) returns "1970-11-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0161 begin`);
      const actual: string = formatDateFromMonthIndex(1970, 10, 29);
      logInfo(`formatDateFromMonthIndex(year=1970, month...: actual=${actual}`);
      expect(actual).assertEqual('1970-11-29');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0161 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0162
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0162
     * @tc.desc      formatDateFromMonthIndex(year=2023, monthIndex=-1, day=2) returns "2023-00-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0162 begin`);
      const actual: string = formatDateFromMonthIndex(2023, -1, 2);
      logInfo(`formatDateFromMonthIndex(year=2023, month...: actual=${actual}`);
      expect(actual).assertEqual('2023-00-02');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0162 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0163
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0163
     * @tc.desc      formatDateFromMonthIndex(year=0, monthIndex=12, day=15) returns "0-13-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0163 begin`);
      const actual: string = formatDateFromMonthIndex(0, 12, 15);
      logInfo(`formatDateFromMonthIndex(year=0, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('0-13-15');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0163 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0164
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0164
     * @tc.desc      formatDateFromMonthIndex(year=2100, monthIndex=2, day=15) returns "2100-03-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0164 begin`);
      const actual: string = formatDateFromMonthIndex(2100, 2, 15);
      logInfo(`formatDateFromMonthIndex(year=2100, month...: actual=${actual}`);
      expect(actual).assertEqual('2100-03-15');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0164 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0165
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0165
     * @tc.desc      formatDateFromMonthIndex(year=2025, monthIndex=10, day=29) returns "2025-11-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0165 begin`);
      const actual: string = formatDateFromMonthIndex(2025, 10, 29);
      logInfo(`formatDateFromMonthIndex(year=2025, month...: actual=${actual}`);
      expect(actual).assertEqual('2025-11-29');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0165 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0166
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0166
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=100, day=31) returns "2024-101-31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0166 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 100, 31);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-101-31');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0166 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0167
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0167
     * @tc.desc      formatDateFromMonthIndex(year=0, monthIndex=5, day=15) returns "0-06-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0167 begin`);
      const actual: string = formatDateFromMonthIndex(0, 5, 15);
      logInfo(`formatDateFromMonthIndex(year=0, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('0-06-15');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0167 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0168
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0168
     * @tc.desc      formatDateFromMonthIndex(year=2023, monthIndex=6, day=1) returns "2023-07-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0168 begin`);
      const actual: string = formatDateFromMonthIndex(2023, 6, 1);
      logInfo(`formatDateFromMonthIndex(year=2023, month...: actual=${actual}`);
      expect(actual).assertEqual('2023-07-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0168 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0169
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0169
     * @tc.desc      formatDateFromMonthIndex(year=2023, monthIndex=5, day=10) returns "2023-06-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0169 begin`);
      const actual: string = formatDateFromMonthIndex(2023, 5, 10);
      logInfo(`formatDateFromMonthIndex(year=2023, month...: actual=${actual}`);
      expect(actual).assertEqual('2023-06-10');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0169 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0170
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0170
     * @tc.desc      formatDateFromMonthIndex(year=3, monthIndex=1, day=100) returns "3-02-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0170 begin`);
      const actual: string = formatDateFromMonthIndex(3, 1, 100);
      logInfo(`formatDateFromMonthIndex(year=3, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('3-02-100');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0170 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0171
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0171
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=3, day=28) returns "2024-04-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0171 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 3, 28);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-04-28');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0171 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0172
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0172
     * @tc.desc      formatDateFromMonthIndex(year=2025, monthIndex=12, day=1) returns "2025-13-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0172 begin`);
      const actual: string = formatDateFromMonthIndex(2025, 12, 1);
      logInfo(`formatDateFromMonthIndex(year=2025, month...: actual=${actual}`);
      expect(actual).assertEqual('2025-13-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0172 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0173
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0173
     * @tc.desc      formatDateFromMonthIndex(year=1, monthIndex=6, day=15) returns "1-07-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0173 begin`);
      const actual: string = formatDateFromMonthIndex(1, 6, 15);
      logInfo(`formatDateFromMonthIndex(year=1, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('1-07-15');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0173 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0174
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0174
     * @tc.desc      formatDateFromMonthIndex(year=2023, monthIndex=-1, day=3) returns "2023-00-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0174 begin`);
      const actual: string = formatDateFromMonthIndex(2023, -1, 3);
      logInfo(`formatDateFromMonthIndex(year=2023, month...: actual=${actual}`);
      expect(actual).assertEqual('2023-00-03');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0174 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0175
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0175
     * @tc.desc      formatDateFromMonthIndex(year=1970, monthIndex=0, day=10) returns "1970-01-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0175 begin`);
      const actual: string = formatDateFromMonthIndex(1970, 0, 10);
      logInfo(`formatDateFromMonthIndex(year=1970, month...: actual=${actual}`);
      expect(actual).assertEqual('1970-01-10');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0175 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0176
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0176
     * @tc.desc      formatDateFromMonthIndex(year=2023, monthIndex=2, day=31) returns "2023-03-31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0176 begin`);
      const actual: string = formatDateFromMonthIndex(2023, 2, 31);
      logInfo(`formatDateFromMonthIndex(year=2023, month...: actual=${actual}`);
      expect(actual).assertEqual('2023-03-31');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0176 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0177
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0177
     * @tc.desc      formatDateFromMonthIndex(year=2023, monthIndex=5, day=15) returns "2023-06-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0177 begin`);
      const actual: string = formatDateFromMonthIndex(2023, 5, 15);
      logInfo(`formatDateFromMonthIndex(year=2023, month...: actual=${actual}`);
      expect(actual).assertEqual('2023-06-15');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0177 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0178
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0178
     * @tc.desc      formatDateFromMonthIndex(year=2023, monthIndex=13, day=30) returns "2023-14-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0178 begin`);
      const actual: string = formatDateFromMonthIndex(2023, 13, 30);
      logInfo(`formatDateFromMonthIndex(year=2023, month...: actual=${actual}`);
      expect(actual).assertEqual('2023-14-30');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0178 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0179
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0179
     * @tc.desc      formatDateFromMonthIndex(year=2100, monthIndex=12, day=10) returns "2100-13-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0179 begin`);
      const actual: string = formatDateFromMonthIndex(2100, 12, 10);
      logInfo(`formatDateFromMonthIndex(year=2100, month...: actual=${actual}`);
      expect(actual).assertEqual('2100-13-10');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0179 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0180
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0180
     * @tc.desc      formatDateFromMonthIndex(year=0, monthIndex=13, day=100) returns "0-14-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0180 begin`);
      const actual: string = formatDateFromMonthIndex(0, 13, 100);
      logInfo(`formatDateFromMonthIndex(year=0, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('0-14-100');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0180 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0181
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0181
     * @tc.desc      formatDateFromMonthIndex(year=-1, monthIndex=0, day=100) returns "-1-01-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0181 begin`);
      const actual: string = formatDateFromMonthIndex(-1, 0, 100);
      logInfo(`formatDateFromMonthIndex(year=-1, monthIn...: actual=${actual}`);
      expect(actual).assertEqual('-1-01-100');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0181 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0182
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0182
     * @tc.desc      formatDateFromMonthIndex(year=2100, monthIndex=0, day=100) returns "2100-01-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0182 begin`);
      const actual: string = formatDateFromMonthIndex(2100, 0, 100);
      logInfo(`formatDateFromMonthIndex(year=2100, month...: actual=${actual}`);
      expect(actual).assertEqual('2100-01-100');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0182 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0183
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0183
     * @tc.desc      formatDateFromMonthIndex(year=1, monthIndex=10, day=15) returns "1-11-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0183 begin`);
      const actual: string = formatDateFromMonthIndex(1, 10, 15);
      logInfo(`formatDateFromMonthIndex(year=1, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('1-11-15');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0183 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0184
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0184
     * @tc.desc      formatDateFromMonthIndex(year=-1, monthIndex=5, day=-1) returns "-1-06--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0184 begin`);
      const actual: string = formatDateFromMonthIndex(-1, 5, -1);
      logInfo(`formatDateFromMonthIndex(year=-1, monthIn...: actual=${actual}`);
      expect(actual).assertEqual('-1-06--1');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0184 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0185
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0185
     * @tc.desc      formatDateFromMonthIndex(year=1970, monthIndex=25.26, day=10) returns "1970-26.26-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0185 begin`);
      const actual: string = formatDateFromMonthIndex(1970, 25.26, 10);
      logInfo(`formatDateFromMonthIndex(year=1970, month...: actual=${actual}`);
      expect(actual).assertEqual('1970-26.26-10');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0185 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0186
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0186
     * @tc.desc      formatDateFromMonthIndex(year=-1, monthIndex=0, day=10) returns "-1-01-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0186 begin`);
      const actual: string = formatDateFromMonthIndex(-1, 0, 10);
      logInfo(`formatDateFromMonthIndex(year=-1, monthIn...: actual=${actual}`);
      expect(actual).assertEqual('-1-01-10');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0186 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0187
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0187
     * @tc.desc      formatDateFromMonthIndex(year=1, monthIndex=6, day=-1) returns "1-07--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0187 begin`);
      const actual: string = formatDateFromMonthIndex(1, 6, -1);
      logInfo(`formatDateFromMonthIndex(year=1, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('1-07--1');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0187 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0188
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0188
     * @tc.desc      formatDateFromMonthIndex(year=1, monthIndex=-1, day=3) returns "1-00-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0188 begin`);
      const actual: string = formatDateFromMonthIndex(1, -1, 3);
      logInfo(`formatDateFromMonthIndex(year=1, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('1-00-03');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0188 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0189
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0189
     * @tc.desc      formatDateFromMonthIndex(year=1900, monthIndex=12, day=3) returns "1900-13-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0189 begin`);
      const actual: string = formatDateFromMonthIndex(1900, 12, 3);
      logInfo(`formatDateFromMonthIndex(year=1900, month...: actual=${actual}`);
      expect(actual).assertEqual('1900-13-03');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0189 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0190
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0190
     * @tc.desc      formatDateFromMonthIndex(year=2, monthIndex=25.26, day=2) returns "2-26.26-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0190 begin`);
      const actual: string = formatDateFromMonthIndex(2, 25.26, 2);
      logInfo(`formatDateFromMonthIndex(year=2, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('2-26.26-02');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0190 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0191
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0191
     * @tc.desc      formatDateFromMonthIndex(year=2025, monthIndex=-1, day=3) returns "2025-00-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0191 begin`);
      const actual: string = formatDateFromMonthIndex(2025, -1, 3);
      logInfo(`formatDateFromMonthIndex(year=2025, month...: actual=${actual}`);
      expect(actual).assertEqual('2025-00-03');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0191 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0192
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0192
     * @tc.desc      formatDateFromMonthIndex(year=2, monthIndex=5, day=15) returns "2-06-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0192 begin`);
      const actual: string = formatDateFromMonthIndex(2, 5, 15);
      logInfo(`formatDateFromMonthIndex(year=2, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('2-06-15');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0192 end`);
    });
  });
}
