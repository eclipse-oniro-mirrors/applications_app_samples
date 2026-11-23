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
import { formatDate } from '../model/FilePreviewDlpLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FilePreviewDLP]';
const BUNDLE: string = 'FilePreviewDLP_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for formatDate (96 cases). */
export default function formatDate2Test(): void {
  describe('FormatDate2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0097
     * @tc.name      FilePreviewDLP_FormatDate_0097
     * @tc.desc      formatDate(year=1, month=0, day=10) returns "1-00-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0097 begin`);
      const actual: string = formatDate(1, 0, 10);
      logInfo(`formatDate(year=1, month=0, day=10): actual=${actual}`);
      expect(actual).assertEqual('1-00-10');
      logInfo(`${BUNDLE}FormatDate_0097 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0098
     * @tc.name      FilePreviewDLP_FormatDate_0098
     * @tc.desc      formatDate(year=2025, month=0, day=3) returns "2025-00-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0098 begin`);
      const actual: string = formatDate(2025, 0, 3);
      logInfo(`formatDate(year=2025, month=0, day=3): actual=${actual}`);
      expect(actual).assertEqual('2025-00-03');
      logInfo(`${BUNDLE}FormatDate_0098 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0099
     * @tc.name      FilePreviewDLP_FormatDate_0099
     * @tc.desc      formatDate(year=2, month=3, day=29) returns "2-03-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0099 begin`);
      const actual: string = formatDate(2, 3, 29);
      logInfo(`formatDate(year=2, month=3, day=29): actual=${actual}`);
      expect(actual).assertEqual('2-03-29');
      logInfo(`${BUNDLE}FormatDate_0099 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0100
     * @tc.name      FilePreviewDLP_FormatDate_0100
     * @tc.desc      formatDate(year=1900, month=10, day=0) returns "1900-10-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0100 begin`);
      const actual: string = formatDate(1900, 10, 0);
      logInfo(`formatDate(year=1900, month=10, day=0): actual=${actual}`);
      expect(actual).assertEqual('1900-10-00');
      logInfo(`${BUNDLE}FormatDate_0100 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0101
     * @tc.name      FilePreviewDLP_FormatDate_0101
     * @tc.desc      formatDate(year=1, month=5, day=0) returns "1-05-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0101 begin`);
      const actual: string = formatDate(1, 5, 0);
      logInfo(`formatDate(year=1, month=5, day=0): actual=${actual}`);
      expect(actual).assertEqual('1-05-00');
      logInfo(`${BUNDLE}FormatDate_0101 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0102
     * @tc.name      FilePreviewDLP_FormatDate_0102
     * @tc.desc      formatDate(year=0, month=-1, day=3) returns "0--1-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0102 begin`);
      const actual: string = formatDate(0, -1, 3);
      logInfo(`formatDate(year=0, month=-1, day=3): actual=${actual}`);
      expect(actual).assertEqual('0--1-03');
      logInfo(`${BUNDLE}FormatDate_0102 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0103
     * @tc.name      FilePreviewDLP_FormatDate_0103
     * @tc.desc      formatDate(year=3, month=12, day=3) returns "3-12-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0103 begin`);
      const actual: string = formatDate(3, 12, 3);
      logInfo(`formatDate(year=3, month=12, day=3): actual=${actual}`);
      expect(actual).assertEqual('3-12-03');
      logInfo(`${BUNDLE}FormatDate_0103 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0104
     * @tc.name      FilePreviewDLP_FormatDate_0104
     * @tc.desc      formatDate(year=2023, month=0, day=0) returns "2023-00-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0104 begin`);
      const actual: string = formatDate(2023, 0, 0);
      logInfo(`formatDate(year=2023, month=0, day=0): actual=${actual}`);
      expect(actual).assertEqual('2023-00-00');
      logInfo(`${BUNDLE}FormatDate_0104 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0105
     * @tc.name      FilePreviewDLP_FormatDate_0105
     * @tc.desc      formatDate(year=2000, month=12, day=31) returns "2000-12-31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0105 begin`);
      const actual: string = formatDate(2000, 12, 31);
      logInfo(`formatDate(year=2000, month=12, day=31): actual=${actual}`);
      expect(actual).assertEqual('2000-12-31');
      logInfo(`${BUNDLE}FormatDate_0105 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0106
     * @tc.name      FilePreviewDLP_FormatDate_0106
     * @tc.desc      formatDate(year=2100, month=0, day=15) returns "2100-00-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0106 begin`);
      const actual: string = formatDate(2100, 0, 15);
      logInfo(`formatDate(year=2100, month=0, day=15): actual=${actual}`);
      expect(actual).assertEqual('2100-00-15');
      logInfo(`${BUNDLE}FormatDate_0106 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0107
     * @tc.name      FilePreviewDLP_FormatDate_0107
     * @tc.desc      formatDate(year=2100, month=2, day=28) returns "2100-02-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0107 begin`);
      const actual: string = formatDate(2100, 2, 28);
      logInfo(`formatDate(year=2100, month=2, day=28): actual=${actual}`);
      expect(actual).assertEqual('2100-02-28');
      logInfo(`${BUNDLE}FormatDate_0107 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0108
     * @tc.name      FilePreviewDLP_FormatDate_0108
     * @tc.desc      formatDate(year=2025, month=2, day=2) returns "2025-02-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0108 begin`);
      const actual: string = formatDate(2025, 2, 2);
      logInfo(`formatDate(year=2025, month=2, day=2): actual=${actual}`);
      expect(actual).assertEqual('2025-02-02');
      logInfo(`${BUNDLE}FormatDate_0108 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0109
     * @tc.name      FilePreviewDLP_FormatDate_0109
     * @tc.desc      formatDate(year=2, month=13, day=29) returns "2-13-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0109 begin`);
      const actual: string = formatDate(2, 13, 29);
      logInfo(`formatDate(year=2, month=13, day=29): actual=${actual}`);
      expect(actual).assertEqual('2-13-29');
      logInfo(`${BUNDLE}FormatDate_0109 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0110
     * @tc.name      FilePreviewDLP_FormatDate_0110
     * @tc.desc      formatDate(year=1900, month=0, day=0) returns "1900-00-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0110 begin`);
      const actual: string = formatDate(1900, 0, 0);
      logInfo(`formatDate(year=1900, month=0, day=0): actual=${actual}`);
      expect(actual).assertEqual('1900-00-00');
      logInfo(`${BUNDLE}FormatDate_0110 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0111
     * @tc.name      FilePreviewDLP_FormatDate_0111
     * @tc.desc      formatDate(year=2000, month=3, day=30) returns "2000-03-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0111 begin`);
      const actual: string = formatDate(2000, 3, 30);
      logInfo(`formatDate(year=2000, month=3, day=30): actual=${actual}`);
      expect(actual).assertEqual('2000-03-30');
      logInfo(`${BUNDLE}FormatDate_0111 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0112
     * @tc.name      FilePreviewDLP_FormatDate_0112
     * @tc.desc      formatDate(year=2025, month=3, day=0) returns "2025-03-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0112 begin`);
      const actual: string = formatDate(2025, 3, 0);
      logInfo(`formatDate(year=2025, month=3, day=0): actual=${actual}`);
      expect(actual).assertEqual('2025-03-00');
      logInfo(`${BUNDLE}FormatDate_0112 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0113
     * @tc.name      FilePreviewDLP_FormatDate_0113
     * @tc.desc      formatDate(year=2000, month=78, day=100) returns "2000-78-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0113 begin`);
      const actual: string = formatDate(2000, 78, 100);
      logInfo(`formatDate(year=2000, month=78, day=100): actual=${actual}`);
      expect(actual).assertEqual('2000-78-100');
      logInfo(`${BUNDLE}FormatDate_0113 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0114
     * @tc.name      FilePreviewDLP_FormatDate_0114
     * @tc.desc      formatDate(year=2024, month=13, day=2) returns "2024-13-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0114 begin`);
      const actual: string = formatDate(2024, 13, 2);
      logInfo(`formatDate(year=2024, month=13, day=2): actual=${actual}`);
      expect(actual).assertEqual('2024-13-02');
      logInfo(`${BUNDLE}FormatDate_0114 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0115
     * @tc.name      FilePreviewDLP_FormatDate_0115
     * @tc.desc      formatDate(year=2023, month=13, day=15) returns "2023-13-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0115 begin`);
      const actual: string = formatDate(2023, 13, 15);
      logInfo(`formatDate(year=2023, month=13, day=15): actual=${actual}`);
      expect(actual).assertEqual('2023-13-15');
      logInfo(`${BUNDLE}FormatDate_0115 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0116
     * @tc.name      FilePreviewDLP_FormatDate_0116
     * @tc.desc      formatDate(year=2100, month=6, day=28) returns "2100-06-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0116 begin`);
      const actual: string = formatDate(2100, 6, 28);
      logInfo(`formatDate(year=2100, month=6, day=28): actual=${actual}`);
      expect(actual).assertEqual('2100-06-28');
      logInfo(`${BUNDLE}FormatDate_0116 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0117
     * @tc.name      FilePreviewDLP_FormatDate_0117
     * @tc.desc      formatDate(year=1, month=100, day=10) returns "1-100-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0117 begin`);
      const actual: string = formatDate(1, 100, 10);
      logInfo(`formatDate(year=1, month=100, day=10): actual=${actual}`);
      expect(actual).assertEqual('1-100-10');
      logInfo(`${BUNDLE}FormatDate_0117 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0118
     * @tc.name      FilePreviewDLP_FormatDate_0118
     * @tc.desc      formatDate(year=2025, month=100, day=3) returns "2025-100-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0118 begin`);
      const actual: string = formatDate(2025, 100, 3);
      logInfo(`formatDate(year=2025, month=100, day=3): actual=${actual}`);
      expect(actual).assertEqual('2025-100-03');
      logInfo(`${BUNDLE}FormatDate_0118 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0119
     * @tc.name      FilePreviewDLP_FormatDate_0119
     * @tc.desc      formatDate(year=1970, month=0, day=31) returns "1970-00-31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0119 begin`);
      const actual: string = formatDate(1970, 0, 31);
      logInfo(`formatDate(year=1970, month=0, day=31): actual=${actual}`);
      expect(actual).assertEqual('1970-00-31');
      logInfo(`${BUNDLE}FormatDate_0119 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0120
     * @tc.name      FilePreviewDLP_FormatDate_0120
     * @tc.desc      formatDate(year=2, month=100, day=0) returns "2-100-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0120 begin`);
      const actual: string = formatDate(2, 100, 0);
      logInfo(`formatDate(year=2, month=100, day=0): actual=${actual}`);
      expect(actual).assertEqual('2-100-00');
      logInfo(`${BUNDLE}FormatDate_0120 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0121
     * @tc.name      FilePreviewDLP_FormatDate_0121
     * @tc.desc      formatDate(year=2023, month=3, day=30) returns "2023-03-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0121 begin`);
      const actual: string = formatDate(2023, 3, 30);
      logInfo(`formatDate(year=2023, month=3, day=30): actual=${actual}`);
      expect(actual).assertEqual('2023-03-30');
      logInfo(`${BUNDLE}FormatDate_0121 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0122
     * @tc.name      FilePreviewDLP_FormatDate_0122
     * @tc.desc      formatDate(year=1900, month=6, day=2) returns "1900-06-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0122 begin`);
      const actual: string = formatDate(1900, 6, 2);
      logInfo(`formatDate(year=1900, month=6, day=2): actual=${actual}`);
      expect(actual).assertEqual('1900-06-02');
      logInfo(`${BUNDLE}FormatDate_0122 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0123
     * @tc.name      FilePreviewDLP_FormatDate_0123
     * @tc.desc      formatDate(year=2023, month=-1, day=30) returns "2023--1-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0123 begin`);
      const actual: string = formatDate(2023, -1, 30);
      logInfo(`formatDate(year=2023, month=-1, day=30): actual=${actual}`);
      expect(actual).assertEqual('2023--1-30');
      logInfo(`${BUNDLE}FormatDate_0123 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0124
     * @tc.name      FilePreviewDLP_FormatDate_0124
     * @tc.desc      formatDate(year=3, month=10, day=1) returns "3-10-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0124 begin`);
      const actual: string = formatDate(3, 10, 1);
      logInfo(`formatDate(year=3, month=10, day=1): actual=${actual}`);
      expect(actual).assertEqual('3-10-01');
      logInfo(`${BUNDLE}FormatDate_0124 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0125
     * @tc.name      FilePreviewDLP_FormatDate_0125
     * @tc.desc      formatDate(year=2025, month=1, day=29) returns "2025-01-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0125 begin`);
      const actual: string = formatDate(2025, 1, 29);
      logInfo(`formatDate(year=2025, month=1, day=29): actual=${actual}`);
      expect(actual).assertEqual('2025-01-29');
      logInfo(`${BUNDLE}FormatDate_0125 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0126
     * @tc.name      FilePreviewDLP_FormatDate_0126
     * @tc.desc      formatDate(year=2000, month=12, day=28) returns "2000-12-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0126 begin`);
      const actual: string = formatDate(2000, 12, 28);
      logInfo(`formatDate(year=2000, month=12, day=28): actual=${actual}`);
      expect(actual).assertEqual('2000-12-28');
      logInfo(`${BUNDLE}FormatDate_0126 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0127
     * @tc.name      FilePreviewDLP_FormatDate_0127
     * @tc.desc      formatDate(year=2024, month=10, day=2) returns "2024-10-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0127 begin`);
      const actual: string = formatDate(2024, 10, 2);
      logInfo(`formatDate(year=2024, month=10, day=2): actual=${actual}`);
      expect(actual).assertEqual('2024-10-02');
      logInfo(`${BUNDLE}FormatDate_0127 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0128
     * @tc.name      FilePreviewDLP_FormatDate_0128
     * @tc.desc      formatDate(year=3, month=0, day=30) returns "3-00-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0128 begin`);
      const actual: string = formatDate(3, 0, 30);
      logInfo(`formatDate(year=3, month=0, day=30): actual=${actual}`);
      expect(actual).assertEqual('3-00-30');
      logInfo(`${BUNDLE}FormatDate_0128 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0129
     * @tc.name      FilePreviewDLP_FormatDate_0129
     * @tc.desc      formatDate(year=1, month=13, day=28) returns "1-13-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0129 begin`);
      const actual: string = formatDate(1, 13, 28);
      logInfo(`formatDate(year=1, month=13, day=28): actual=${actual}`);
      expect(actual).assertEqual('1-13-28');
      logInfo(`${BUNDLE}FormatDate_0129 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0130
     * @tc.name      FilePreviewDLP_FormatDate_0130
     * @tc.desc      formatDate(year=2024, month=6, day=15) returns "2024-06-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0130 begin`);
      const actual: string = formatDate(2024, 6, 15);
      logInfo(`formatDate(year=2024, month=6, day=15): actual=${actual}`);
      expect(actual).assertEqual('2024-06-15');
      logInfo(`${BUNDLE}FormatDate_0130 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0131
     * @tc.name      FilePreviewDLP_FormatDate_0131
     * @tc.desc      formatDate(year=1, month=100, day=100) returns "1-100-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0131 begin`);
      const actual: string = formatDate(1, 100, 100);
      logInfo(`formatDate(year=1, month=100, day=100): actual=${actual}`);
      expect(actual).assertEqual('1-100-100');
      logInfo(`${BUNDLE}FormatDate_0131 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0132
     * @tc.name      FilePreviewDLP_FormatDate_0132
     * @tc.desc      formatDate(year=2024, month=5, day=10) returns "2024-05-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0132 begin`);
      const actual: string = formatDate(2024, 5, 10);
      logInfo(`formatDate(year=2024, month=5, day=10): actual=${actual}`);
      expect(actual).assertEqual('2024-05-10');
      logInfo(`${BUNDLE}FormatDate_0132 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0133
     * @tc.name      FilePreviewDLP_FormatDate_0133
     * @tc.desc      formatDate(year=2, month=0, day=10) returns "2-00-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0133 begin`);
      const actual: string = formatDate(2, 0, 10);
      logInfo(`formatDate(year=2, month=0, day=10): actual=${actual}`);
      expect(actual).assertEqual('2-00-10');
      logInfo(`${BUNDLE}FormatDate_0133 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0134
     * @tc.name      FilePreviewDLP_FormatDate_0134
     * @tc.desc      formatDate(year=1970, month=5, day=0) returns "1970-05-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0134 begin`);
      const actual: string = formatDate(1970, 5, 0);
      logInfo(`formatDate(year=1970, month=5, day=0): actual=${actual}`);
      expect(actual).assertEqual('1970-05-00');
      logInfo(`${BUNDLE}FormatDate_0134 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0135
     * @tc.name      FilePreviewDLP_FormatDate_0135
     * @tc.desc      formatDate(year=1900, month=1, day=0) returns "1900-01-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0135 begin`);
      const actual: string = formatDate(1900, 1, 0);
      logInfo(`formatDate(year=1900, month=1, day=0): actual=${actual}`);
      expect(actual).assertEqual('1900-01-00');
      logInfo(`${BUNDLE}FormatDate_0135 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0136
     * @tc.name      FilePreviewDLP_FormatDate_0136
     * @tc.desc      formatDate(year=3, month=5, day=100) returns "3-05-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0136 begin`);
      const actual: string = formatDate(3, 5, 100);
      logInfo(`formatDate(year=3, month=5, day=100): actual=${actual}`);
      expect(actual).assertEqual('3-05-100');
      logInfo(`${BUNDLE}FormatDate_0136 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0137
     * @tc.name      FilePreviewDLP_FormatDate_0137
     * @tc.desc      formatDate(year=-1, month=6, day=2) returns "-1-06-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0137 begin`);
      const actual: string = formatDate(-1, 6, 2);
      logInfo(`formatDate(year=-1, month=6, day=2): actual=${actual}`);
      expect(actual).assertEqual('-1-06-02');
      logInfo(`${BUNDLE}FormatDate_0137 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0138
     * @tc.name      FilePreviewDLP_FormatDate_0138
     * @tc.desc      formatDate(year=1, month=5, day=10) returns "1-05-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0138 begin`);
      const actual: string = formatDate(1, 5, 10);
      logInfo(`formatDate(year=1, month=5, day=10): actual=${actual}`);
      expect(actual).assertEqual('1-05-10');
      logInfo(`${BUNDLE}FormatDate_0138 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0139
     * @tc.name      FilePreviewDLP_FormatDate_0139
     * @tc.desc      formatDate(year=1, month=13, day=3) returns "1-13-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0139 begin`);
      const actual: string = formatDate(1, 13, 3);
      logInfo(`formatDate(year=1, month=13, day=3): actual=${actual}`);
      expect(actual).assertEqual('1-13-03');
      logInfo(`${BUNDLE}FormatDate_0139 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0140
     * @tc.name      FilePreviewDLP_FormatDate_0140
     * @tc.desc      formatDate(year=3, month=12, day=-1) returns "3-12--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0140 begin`);
      const actual: string = formatDate(3, 12, -1);
      logInfo(`formatDate(year=3, month=12, day=-1): actual=${actual}`);
      expect(actual).assertEqual('3-12--1');
      logInfo(`${BUNDLE}FormatDate_0140 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0141
     * @tc.name      FilePreviewDLP_FormatDate_0141
     * @tc.desc      formatDate(year=1, month=10, day=0) returns "1-10-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0141 begin`);
      const actual: string = formatDate(1, 10, 0);
      logInfo(`formatDate(year=1, month=10, day=0): actual=${actual}`);
      expect(actual).assertEqual('1-10-00');
      logInfo(`${BUNDLE}FormatDate_0141 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0142
     * @tc.name      FilePreviewDLP_FormatDate_0142
     * @tc.desc      formatDate(year=1900, month=12, day=29) returns "1900-12-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0142 begin`);
      const actual: string = formatDate(1900, 12, 29);
      logInfo(`formatDate(year=1900, month=12, day=29): actual=${actual}`);
      expect(actual).assertEqual('1900-12-29');
      logInfo(`${BUNDLE}FormatDate_0142 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0143
     * @tc.name      FilePreviewDLP_FormatDate_0143
     * @tc.desc      formatDate(year=1900, month=1, day=100) returns "1900-01-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0143 begin`);
      const actual: string = formatDate(1900, 1, 100);
      logInfo(`formatDate(year=1900, month=1, day=100): actual=${actual}`);
      expect(actual).assertEqual('1900-01-100');
      logInfo(`${BUNDLE}FormatDate_0143 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0144
     * @tc.name      FilePreviewDLP_FormatDate_0144
     * @tc.desc      formatDate(year=3, month=6, day=2) returns "3-06-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0144 begin`);
      const actual: string = formatDate(3, 6, 2);
      logInfo(`formatDate(year=3, month=6, day=2): actual=${actual}`);
      expect(actual).assertEqual('3-06-02');
      logInfo(`${BUNDLE}FormatDate_0144 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0145
     * @tc.name      FilePreviewDLP_FormatDate_0145
     * @tc.desc      formatDate(year=2023, month=6, day=29) returns "2023-06-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0145 begin`);
      const actual: string = formatDate(2023, 6, 29);
      logInfo(`formatDate(year=2023, month=6, day=29): actual=${actual}`);
      expect(actual).assertEqual('2023-06-29');
      logInfo(`${BUNDLE}FormatDate_0145 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0146
     * @tc.name      FilePreviewDLP_FormatDate_0146
     * @tc.desc      formatDate(year=1970, month=2, day=0) returns "1970-02-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0146 begin`);
      const actual: string = formatDate(1970, 2, 0);
      logInfo(`formatDate(year=1970, month=2, day=0): actual=${actual}`);
      expect(actual).assertEqual('1970-02-00');
      logInfo(`${BUNDLE}FormatDate_0146 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0147
     * @tc.name      FilePreviewDLP_FormatDate_0147
     * @tc.desc      formatDate(year=2000, month=10, day=3) returns "2000-10-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0147 begin`);
      const actual: string = formatDate(2000, 10, 3);
      logInfo(`formatDate(year=2000, month=10, day=3): actual=${actual}`);
      expect(actual).assertEqual('2000-10-03');
      logInfo(`${BUNDLE}FormatDate_0147 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0148
     * @tc.name      FilePreviewDLP_FormatDate_0148
     * @tc.desc      formatDate(year=-1, month=5, day=1) returns "-1-05-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0148 begin`);
      const actual: string = formatDate(-1, 5, 1);
      logInfo(`formatDate(year=-1, month=5, day=1): actual=${actual}`);
      expect(actual).assertEqual('-1-05-01');
      logInfo(`${BUNDLE}FormatDate_0148 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0149
     * @tc.name      FilePreviewDLP_FormatDate_0149
     * @tc.desc      formatDate(year=2100, month=1, day=-1) returns "2100-01--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0149 begin`);
      const actual: string = formatDate(2100, 1, -1);
      logInfo(`formatDate(year=2100, month=1, day=-1): actual=${actual}`);
      expect(actual).assertEqual('2100-01--1');
      logInfo(`${BUNDLE}FormatDate_0149 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0150
     * @tc.name      FilePreviewDLP_FormatDate_0150
     * @tc.desc      formatDate(year=3, month=1, day=2) returns "3-01-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0150 begin`);
      const actual: string = formatDate(3, 1, 2);
      logInfo(`formatDate(year=3, month=1, day=2): actual=${actual}`);
      expect(actual).assertEqual('3-01-02');
      logInfo(`${BUNDLE}FormatDate_0150 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0151
     * @tc.name      FilePreviewDLP_FormatDate_0151
     * @tc.desc      formatDate(year=1900, month=100, day=100) returns "1900-100-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0151 begin`);
      const actual: string = formatDate(1900, 100, 100);
      logInfo(`formatDate(year=1900, month=100, day=100): actual=${actual}`);
      expect(actual).assertEqual('1900-100-100');
      logInfo(`${BUNDLE}FormatDate_0151 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0152
     * @tc.name      FilePreviewDLP_FormatDate_0152
     * @tc.desc      formatDate(year=1, month=3, day=10) returns "1-03-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0152 begin`);
      const actual: string = formatDate(1, 3, 10);
      logInfo(`formatDate(year=1, month=3, day=10): actual=${actual}`);
      expect(actual).assertEqual('1-03-10');
      logInfo(`${BUNDLE}FormatDate_0152 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0153
     * @tc.name      FilePreviewDLP_FormatDate_0153
     * @tc.desc      formatDate(year=2, month=13, day=1) returns "2-13-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0153 begin`);
      const actual: string = formatDate(2, 13, 1);
      logInfo(`formatDate(year=2, month=13, day=1): actual=${actual}`);
      expect(actual).assertEqual('2-13-01');
      logInfo(`${BUNDLE}FormatDate_0153 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0154
     * @tc.name      FilePreviewDLP_FormatDate_0154
     * @tc.desc      formatDate(year=0, month=2, day=29) returns "0-02-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0154 begin`);
      const actual: string = formatDate(0, 2, 29);
      logInfo(`formatDate(year=0, month=2, day=29): actual=${actual}`);
      expect(actual).assertEqual('0-02-29');
      logInfo(`${BUNDLE}FormatDate_0154 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0155
     * @tc.name      FilePreviewDLP_FormatDate_0155
     * @tc.desc      formatDate(year=3, month=3, day=-1) returns "3-03--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0155 begin`);
      const actual: string = formatDate(3, 3, -1);
      logInfo(`formatDate(year=3, month=3, day=-1): actual=${actual}`);
      expect(actual).assertEqual('3-03--1');
      logInfo(`${BUNDLE}FormatDate_0155 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0156
     * @tc.name      FilePreviewDLP_FormatDate_0156
     * @tc.desc      formatDate(year=1900, month=100, day=15) returns "1900-100-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0156 begin`);
      const actual: string = formatDate(1900, 100, 15);
      logInfo(`formatDate(year=1900, month=100, day=15): actual=${actual}`);
      expect(actual).assertEqual('1900-100-15');
      logInfo(`${BUNDLE}FormatDate_0156 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0157
     * @tc.name      FilePreviewDLP_FormatDate_0157
     * @tc.desc      formatDate(year=2023, month=10, day=2) returns "2023-10-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0157 begin`);
      const actual: string = formatDate(2023, 10, 2);
      logInfo(`formatDate(year=2023, month=10, day=2): actual=${actual}`);
      expect(actual).assertEqual('2023-10-02');
      logInfo(`${BUNDLE}FormatDate_0157 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0158
     * @tc.name      FilePreviewDLP_FormatDate_0158
     * @tc.desc      formatDate(year=2, month=13, day=10) returns "2-13-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0158 begin`);
      const actual: string = formatDate(2, 13, 10);
      logInfo(`formatDate(year=2, month=13, day=10): actual=${actual}`);
      expect(actual).assertEqual('2-13-10');
      logInfo(`${BUNDLE}FormatDate_0158 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0159
     * @tc.name      FilePreviewDLP_FormatDate_0159
     * @tc.desc      formatDate(year=2025, month=6, day=30) returns "2025-06-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0159 begin`);
      const actual: string = formatDate(2025, 6, 30);
      logInfo(`formatDate(year=2025, month=6, day=30): actual=${actual}`);
      expect(actual).assertEqual('2025-06-30');
      logInfo(`${BUNDLE}FormatDate_0159 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0160
     * @tc.name      FilePreviewDLP_FormatDate_0160
     * @tc.desc      formatDate(year=-1, month=12, day=2) returns "-1-12-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0160 begin`);
      const actual: string = formatDate(-1, 12, 2);
      logInfo(`formatDate(year=-1, month=12, day=2): actual=${actual}`);
      expect(actual).assertEqual('-1-12-02');
      logInfo(`${BUNDLE}FormatDate_0160 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0161
     * @tc.name      FilePreviewDLP_FormatDate_0161
     * @tc.desc      formatDate(year=2025, month=2, day=1) returns "2025-02-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0161 begin`);
      const actual: string = formatDate(2025, 2, 1);
      logInfo(`formatDate(year=2025, month=2, day=1): actual=${actual}`);
      expect(actual).assertEqual('2025-02-01');
      logInfo(`${BUNDLE}FormatDate_0161 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0162
     * @tc.name      FilePreviewDLP_FormatDate_0162
     * @tc.desc      formatDate(year=1, month=5, day=31) returns "1-05-31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0162 begin`);
      const actual: string = formatDate(1, 5, 31);
      logInfo(`formatDate(year=1, month=5, day=31): actual=${actual}`);
      expect(actual).assertEqual('1-05-31');
      logInfo(`${BUNDLE}FormatDate_0162 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0163
     * @tc.name      FilePreviewDLP_FormatDate_0163
     * @tc.desc      formatDate(year=1900, month=3, day=100) returns "1900-03-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0163 begin`);
      const actual: string = formatDate(1900, 3, 100);
      logInfo(`formatDate(year=1900, month=3, day=100): actual=${actual}`);
      expect(actual).assertEqual('1900-03-100');
      logInfo(`${BUNDLE}FormatDate_0163 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0164
     * @tc.name      FilePreviewDLP_FormatDate_0164
     * @tc.desc      formatDate(year=1970, month=3, day=28) returns "1970-03-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0164 begin`);
      const actual: string = formatDate(1970, 3, 28);
      logInfo(`formatDate(year=1970, month=3, day=28): actual=${actual}`);
      expect(actual).assertEqual('1970-03-28');
      logInfo(`${BUNDLE}FormatDate_0164 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0165
     * @tc.name      FilePreviewDLP_FormatDate_0165
     * @tc.desc      formatDate(year=2100, month=0, day=30) returns "2100-00-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0165 begin`);
      const actual: string = formatDate(2100, 0, 30);
      logInfo(`formatDate(year=2100, month=0, day=30): actual=${actual}`);
      expect(actual).assertEqual('2100-00-30');
      logInfo(`${BUNDLE}FormatDate_0165 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0166
     * @tc.name      FilePreviewDLP_FormatDate_0166
     * @tc.desc      formatDate(year=0, month=13, day=30) returns "0-13-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0166 begin`);
      const actual: string = formatDate(0, 13, 30);
      logInfo(`formatDate(year=0, month=13, day=30): actual=${actual}`);
      expect(actual).assertEqual('0-13-30');
      logInfo(`${BUNDLE}FormatDate_0166 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0167
     * @tc.name      FilePreviewDLP_FormatDate_0167
     * @tc.desc      formatDate(year=-1, month=0, day=31) returns "-1-00-31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0167 begin`);
      const actual: string = formatDate(-1, 0, 31);
      logInfo(`formatDate(year=-1, month=0, day=31): actual=${actual}`);
      expect(actual).assertEqual('-1-00-31');
      logInfo(`${BUNDLE}FormatDate_0167 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0168
     * @tc.name      FilePreviewDLP_FormatDate_0168
     * @tc.desc      formatDate(year=2023, month=1, day=30) returns "2023-01-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0168 begin`);
      const actual: string = formatDate(2023, 1, 30);
      logInfo(`formatDate(year=2023, month=1, day=30): actual=${actual}`);
      expect(actual).assertEqual('2023-01-30');
      logInfo(`${BUNDLE}FormatDate_0168 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0169
     * @tc.name      FilePreviewDLP_FormatDate_0169
     * @tc.desc      formatDate(year=2, month=13, day=2) returns "2-13-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0169 begin`);
      const actual: string = formatDate(2, 13, 2);
      logInfo(`formatDate(year=2, month=13, day=2): actual=${actual}`);
      expect(actual).assertEqual('2-13-02');
      logInfo(`${BUNDLE}FormatDate_0169 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0170
     * @tc.name      FilePreviewDLP_FormatDate_0170
     * @tc.desc      formatDate(year=2100, month=1, day=30) returns "2100-01-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0170 begin`);
      const actual: string = formatDate(2100, 1, 30);
      logInfo(`formatDate(year=2100, month=1, day=30): actual=${actual}`);
      expect(actual).assertEqual('2100-01-30');
      logInfo(`${BUNDLE}FormatDate_0170 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0171
     * @tc.name      FilePreviewDLP_FormatDate_0171
     * @tc.desc      formatDate(year=2, month=12, day=10) returns "2-12-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0171 begin`);
      const actual: string = formatDate(2, 12, 10);
      logInfo(`formatDate(year=2, month=12, day=10): actual=${actual}`);
      expect(actual).assertEqual('2-12-10');
      logInfo(`${BUNDLE}FormatDate_0171 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0172
     * @tc.name      FilePreviewDLP_FormatDate_0172
     * @tc.desc      formatDate(year=1, month=1, day=10) returns "1-01-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0172 begin`);
      const actual: string = formatDate(1, 1, 10);
      logInfo(`formatDate(year=1, month=1, day=10): actual=${actual}`);
      expect(actual).assertEqual('1-01-10');
      logInfo(`${BUNDLE}FormatDate_0172 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0173
     * @tc.name      FilePreviewDLP_FormatDate_0173
     * @tc.desc      formatDate(year=2025, month=0, day=29) returns "2025-00-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0173 begin`);
      const actual: string = formatDate(2025, 0, 29);
      logInfo(`formatDate(year=2025, month=0, day=29): actual=${actual}`);
      expect(actual).assertEqual('2025-00-29');
      logInfo(`${BUNDLE}FormatDate_0173 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0174
     * @tc.name      FilePreviewDLP_FormatDate_0174
     * @tc.desc      formatDate(year=-1, month=1, day=0) returns "-1-01-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0174 begin`);
      const actual: string = formatDate(-1, 1, 0);
      logInfo(`formatDate(year=-1, month=1, day=0): actual=${actual}`);
      expect(actual).assertEqual('-1-01-00');
      logInfo(`${BUNDLE}FormatDate_0174 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0175
     * @tc.name      FilePreviewDLP_FormatDate_0175
     * @tc.desc      formatDate(year=1900, month=2, day=2) returns "1900-02-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0175 begin`);
      const actual: string = formatDate(1900, 2, 2);
      logInfo(`formatDate(year=1900, month=2, day=2): actual=${actual}`);
      expect(actual).assertEqual('1900-02-02');
      logInfo(`${BUNDLE}FormatDate_0175 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0176
     * @tc.name      FilePreviewDLP_FormatDate_0176
     * @tc.desc      formatDate(year=2023, month=6, day=15) returns "2023-06-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0176 begin`);
      const actual: string = formatDate(2023, 6, 15);
      logInfo(`formatDate(year=2023, month=6, day=15): actual=${actual}`);
      expect(actual).assertEqual('2023-06-15');
      logInfo(`${BUNDLE}FormatDate_0176 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0177
     * @tc.name      FilePreviewDLP_FormatDate_0177
     * @tc.desc      formatDate(year=-1, month=3, day=30) returns "-1-03-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0177 begin`);
      const actual: string = formatDate(-1, 3, 30);
      logInfo(`formatDate(year=-1, month=3, day=30): actual=${actual}`);
      expect(actual).assertEqual('-1-03-30');
      logInfo(`${BUNDLE}FormatDate_0177 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0178
     * @tc.name      FilePreviewDLP_FormatDate_0178
     * @tc.desc      formatDate(year=-1, month=100, day=10) returns "-1-100-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0178 begin`);
      const actual: string = formatDate(-1, 100, 10);
      logInfo(`formatDate(year=-1, month=100, day=10): actual=${actual}`);
      expect(actual).assertEqual('-1-100-10');
      logInfo(`${BUNDLE}FormatDate_0178 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0179
     * @tc.name      FilePreviewDLP_FormatDate_0179
     * @tc.desc      formatDate(year=1900, month=13, day=100) returns "1900-13-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0179 begin`);
      const actual: string = formatDate(1900, 13, 100);
      logInfo(`formatDate(year=1900, month=13, day=100): actual=${actual}`);
      expect(actual).assertEqual('1900-13-100');
      logInfo(`${BUNDLE}FormatDate_0179 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0180
     * @tc.name      FilePreviewDLP_FormatDate_0180
     * @tc.desc      formatDate(year=2000, month=3, day=31) returns "2000-03-31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0180 begin`);
      const actual: string = formatDate(2000, 3, 31);
      logInfo(`formatDate(year=2000, month=3, day=31): actual=${actual}`);
      expect(actual).assertEqual('2000-03-31');
      logInfo(`${BUNDLE}FormatDate_0180 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0181
     * @tc.name      FilePreviewDLP_FormatDate_0181
     * @tc.desc      formatDate(year=1900, month=-1, day=100) returns "1900--1-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0181 begin`);
      const actual: string = formatDate(1900, -1, 100);
      logInfo(`formatDate(year=1900, month=-1, day=100): actual=${actual}`);
      expect(actual).assertEqual('1900--1-100');
      logInfo(`${BUNDLE}FormatDate_0181 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0182
     * @tc.name      FilePreviewDLP_FormatDate_0182
     * @tc.desc      formatDate(year=2, month=78, day=0) returns "2-78-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0182 begin`);
      const actual: string = formatDate(2, 78, 0);
      logInfo(`formatDate(year=2, month=78, day=0): actual=${actual}`);
      expect(actual).assertEqual('2-78-00');
      logInfo(`${BUNDLE}FormatDate_0182 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0183
     * @tc.name      FilePreviewDLP_FormatDate_0183
     * @tc.desc      formatDate(year=1, month=1, day=100) returns "1-01-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0183 begin`);
      const actual: string = formatDate(1, 1, 100);
      logInfo(`formatDate(year=1, month=1, day=100): actual=${actual}`);
      expect(actual).assertEqual('1-01-100');
      logInfo(`${BUNDLE}FormatDate_0183 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0184
     * @tc.name      FilePreviewDLP_FormatDate_0184
     * @tc.desc      formatDate(year=2023, month=1, day=29) returns "2023-01-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0184 begin`);
      const actual: string = formatDate(2023, 1, 29);
      logInfo(`formatDate(year=2023, month=1, day=29): actual=${actual}`);
      expect(actual).assertEqual('2023-01-29');
      logInfo(`${BUNDLE}FormatDate_0184 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0185
     * @tc.name      FilePreviewDLP_FormatDate_0185
     * @tc.desc      formatDate(year=2023, month=2, day=2) returns "2023-02-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0185 begin`);
      const actual: string = formatDate(2023, 2, 2);
      logInfo(`formatDate(year=2023, month=2, day=2): actual=${actual}`);
      expect(actual).assertEqual('2023-02-02');
      logInfo(`${BUNDLE}FormatDate_0185 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0186
     * @tc.name      FilePreviewDLP_FormatDate_0186
     * @tc.desc      formatDate(year=2000, month=78, day=3) returns "2000-78-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0186 begin`);
      const actual: string = formatDate(2000, 78, 3);
      logInfo(`formatDate(year=2000, month=78, day=3): actual=${actual}`);
      expect(actual).assertEqual('2000-78-03');
      logInfo(`${BUNDLE}FormatDate_0186 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0187
     * @tc.name      FilePreviewDLP_FormatDate_0187
     * @tc.desc      formatDate(year=2023, month=-1, day=29) returns "2023--1-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0187 begin`);
      const actual: string = formatDate(2023, -1, 29);
      logInfo(`formatDate(year=2023, month=-1, day=29): actual=${actual}`);
      expect(actual).assertEqual('2023--1-29');
      logInfo(`${BUNDLE}FormatDate_0187 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0188
     * @tc.name      FilePreviewDLP_FormatDate_0188
     * @tc.desc      formatDate(year=1970, month=13, day=2) returns "1970-13-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0188 begin`);
      const actual: string = formatDate(1970, 13, 2);
      logInfo(`formatDate(year=1970, month=13, day=2): actual=${actual}`);
      expect(actual).assertEqual('1970-13-02');
      logInfo(`${BUNDLE}FormatDate_0188 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0189
     * @tc.name      FilePreviewDLP_FormatDate_0189
     * @tc.desc      formatDate(year=1, month=-1, day=0) returns "1--1-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0189 begin`);
      const actual: string = formatDate(1, -1, 0);
      logInfo(`formatDate(year=1, month=-1, day=0): actual=${actual}`);
      expect(actual).assertEqual('1--1-00');
      logInfo(`${BUNDLE}FormatDate_0189 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0190
     * @tc.name      FilePreviewDLP_FormatDate_0190
     * @tc.desc      formatDate(year=3, month=100, day=3) returns "3-100-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0190 begin`);
      const actual: string = formatDate(3, 100, 3);
      logInfo(`formatDate(year=3, month=100, day=3): actual=${actual}`);
      expect(actual).assertEqual('3-100-03');
      logInfo(`${BUNDLE}FormatDate_0190 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0191
     * @tc.name      FilePreviewDLP_FormatDate_0191
     * @tc.desc      formatDate(year=-1, month=12, day=3) returns "-1-12-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0191 begin`);
      const actual: string = formatDate(-1, 12, 3);
      logInfo(`formatDate(year=-1, month=12, day=3): actual=${actual}`);
      expect(actual).assertEqual('-1-12-03');
      logInfo(`${BUNDLE}FormatDate_0191 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0192
     * @tc.name      FilePreviewDLP_FormatDate_0192
     * @tc.desc      formatDate(year=2023, month=13, day=1) returns "2023-13-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0192 begin`);
      const actual: string = formatDate(2023, 13, 1);
      logInfo(`formatDate(year=2023, month=13, day=1): actual=${actual}`);
      expect(actual).assertEqual('2023-13-01');
      logInfo(`${BUNDLE}FormatDate_0192 end`);
    });
  });
}
