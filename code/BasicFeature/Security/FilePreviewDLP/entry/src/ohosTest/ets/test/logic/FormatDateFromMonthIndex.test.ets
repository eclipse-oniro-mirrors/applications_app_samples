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
export default function formatDateFromMonthIndexTest(): void {
  describe('FormatDateFromMonthIndexTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0001
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0001
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=1, day=1) returns "2024-02-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0001 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 1, 1);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-02-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0001 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0002
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0002
     * @tc.desc      formatDateFromMonthIndex(year=2023, monthIndex=1, day=1) returns "2023-02-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0002 begin`);
      const actual: string = formatDateFromMonthIndex(2023, 1, 1);
      logInfo(`formatDateFromMonthIndex(year=2023, month...: actual=${actual}`);
      expect(actual).assertEqual('2023-02-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0002 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0003
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0003
     * @tc.desc      formatDateFromMonthIndex(year=1, monthIndex=1, day=1) returns "1-02-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0003 begin`);
      const actual: string = formatDateFromMonthIndex(1, 1, 1);
      logInfo(`formatDateFromMonthIndex(year=1, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('1-02-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0003 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0004
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0004
     * @tc.desc      formatDateFromMonthIndex(year=0, monthIndex=1, day=1) returns "0-02-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0004 begin`);
      const actual: string = formatDateFromMonthIndex(0, 1, 1);
      logInfo(`formatDateFromMonthIndex(year=0, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('0-02-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0004 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0005
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0005
     * @tc.desc      formatDateFromMonthIndex(year=2, monthIndex=1, day=1) returns "2-02-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0005 begin`);
      const actual: string = formatDateFromMonthIndex(2, 1, 1);
      logInfo(`formatDateFromMonthIndex(year=2, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('2-02-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0005 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0006
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0006
     * @tc.desc      formatDateFromMonthIndex(year=2000, monthIndex=1, day=1) returns "2000-02-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0006 begin`);
      const actual: string = formatDateFromMonthIndex(2000, 1, 1);
      logInfo(`formatDateFromMonthIndex(year=2000, month...: actual=${actual}`);
      expect(actual).assertEqual('2000-02-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0006 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0007
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0007
     * @tc.desc      formatDateFromMonthIndex(year=1900, monthIndex=1, day=1) returns "1900-02-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0007 begin`);
      const actual: string = formatDateFromMonthIndex(1900, 1, 1);
      logInfo(`formatDateFromMonthIndex(year=1900, month...: actual=${actual}`);
      expect(actual).assertEqual('1900-02-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0007 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0008
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0008
     * @tc.desc      formatDateFromMonthIndex(year=2100, monthIndex=1, day=1) returns "2100-02-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0008 begin`);
      const actual: string = formatDateFromMonthIndex(2100, 1, 1);
      logInfo(`formatDateFromMonthIndex(year=2100, month...: actual=${actual}`);
      expect(actual).assertEqual('2100-02-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0008 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0009
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0009
     * @tc.desc      formatDateFromMonthIndex(year=1970, monthIndex=1, day=1) returns "1970-02-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0009 begin`);
      const actual: string = formatDateFromMonthIndex(1970, 1, 1);
      logInfo(`formatDateFromMonthIndex(year=1970, month...: actual=${actual}`);
      expect(actual).assertEqual('1970-02-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0009 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0010
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0010
     * @tc.desc      formatDateFromMonthIndex(year=2025, monthIndex=1, day=1) returns "2025-02-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0010 begin`);
      const actual: string = formatDateFromMonthIndex(2025, 1, 1);
      logInfo(`formatDateFromMonthIndex(year=2025, month...: actual=${actual}`);
      expect(actual).assertEqual('2025-02-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0010 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0011
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0011
     * @tc.desc      formatDateFromMonthIndex(year=-1, monthIndex=1, day=1) returns "-1-02-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0011 begin`);
      const actual: string = formatDateFromMonthIndex(-1, 1, 1);
      logInfo(`formatDateFromMonthIndex(year=-1, monthIn...: actual=${actual}`);
      expect(actual).assertEqual('-1-02-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0011 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0012
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0012
     * @tc.desc      formatDateFromMonthIndex(year=3, monthIndex=1, day=1) returns "3-02-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0012 begin`);
      const actual: string = formatDateFromMonthIndex(3, 1, 1);
      logInfo(`formatDateFromMonthIndex(year=3, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('3-02-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0012 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0013
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0013
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=2, day=1) returns "2024-03-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0013 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 2, 1);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-03-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0013 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0014
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0014
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=0, day=1) returns "2024-01-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0014 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 0, 1);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-01-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0014 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0015
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0015
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=6, day=1) returns "2024-07-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0015 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 6, 1);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-07-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0015 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0016
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0016
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=12, day=1) returns "2024-13-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0016 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 12, 1);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-13-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0016 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0017
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0017
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=13, day=1) returns "2024-14-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0017 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 13, 1);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-14-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0017 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0018
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0018
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=-1, day=1) returns "2024-00-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0018 begin`);
      const actual: string = formatDateFromMonthIndex(2024, -1, 1);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-00-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0018 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0019
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0019
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=3, day=1) returns "2024-04-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0019 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 3, 1);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-04-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0019 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0020
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0020
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=10, day=1) returns "2024-11-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0020 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 10, 1);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-11-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0020 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0021
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0021
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=100, day=1) returns "2024-101-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0021 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 100, 1);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-101-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0021 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0022
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0022
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=5, day=1) returns "2024-06-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0022 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 5, 1);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-06-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0022 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0023
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0023
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=25.26, day=1) returns "2024-26.26-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0023 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 25.26, 1);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-26.26-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0023 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0024
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0024
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=1, day=15) returns "2024-02-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0024 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 1, 15);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-02-15');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0024 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0025
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0025
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=1, day=0) returns "2024-02-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0025 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 1, 0);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-02-00');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0025 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0026
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0026
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=1, day=2) returns "2024-02-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0026 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 1, 2);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-02-02');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0026 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0027
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0027
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=1, day=28) returns "2024-02-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0027 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 1, 28);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-02-28');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0027 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0028
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0028
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=1, day=29) returns "2024-02-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0028 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 1, 29);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0028 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0029
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0029
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=1, day=30) returns "2024-02-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0029 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 1, 30);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-02-30');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0029 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0030
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0030
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=1, day=31) returns "2024-02-31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0030 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 1, 31);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-02-31');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0030 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0031
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0031
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=1, day=-1) returns "2024-02--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0031 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 1, -1);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-02--1');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0031 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0032
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0032
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=1, day=3) returns "2024-02-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0032 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 1, 3);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-02-03');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0032 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0033
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0033
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=1, day=10) returns "2024-02-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0033 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 1, 10);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-02-10');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0033 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0034
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0034
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=1, day=100) returns "2024-02-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0034 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 1, 100);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-02-100');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0034 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0035
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0035
     * @tc.desc      formatDateFromMonthIndex(year=-1, monthIndex=13, day=3) returns "-1-14-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0035 begin`);
      const actual: string = formatDateFromMonthIndex(-1, 13, 3);
      logInfo(`formatDateFromMonthIndex(year=-1, monthIn...: actual=${actual}`);
      expect(actual).assertEqual('-1-14-03');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0035 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0036
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0036
     * @tc.desc      formatDateFromMonthIndex(year=2100, monthIndex=6, day=2) returns "2100-07-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0036 begin`);
      const actual: string = formatDateFromMonthIndex(2100, 6, 2);
      logInfo(`formatDateFromMonthIndex(year=2100, month...: actual=${actual}`);
      expect(actual).assertEqual('2100-07-02');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0036 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0037
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0037
     * @tc.desc      formatDateFromMonthIndex(year=2100, monthIndex=-1, day=100) returns "2100-00-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0037 begin`);
      const actual: string = formatDateFromMonthIndex(2100, -1, 100);
      logInfo(`formatDateFromMonthIndex(year=2100, month...: actual=${actual}`);
      expect(actual).assertEqual('2100-00-100');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0037 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0038
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0038
     * @tc.desc      formatDateFromMonthIndex(year=1900, monthIndex=0, day=15) returns "1900-01-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0038 begin`);
      const actual: string = formatDateFromMonthIndex(1900, 0, 15);
      logInfo(`formatDateFromMonthIndex(year=1900, month...: actual=${actual}`);
      expect(actual).assertEqual('1900-01-15');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0038 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0039
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0039
     * @tc.desc      formatDateFromMonthIndex(year=3, monthIndex=100, day=29) returns "3-101-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0039 begin`);
      const actual: string = formatDateFromMonthIndex(3, 100, 29);
      logInfo(`formatDateFromMonthIndex(year=3, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('3-101-29');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0039 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0040
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0040
     * @tc.desc      formatDateFromMonthIndex(year=2100, monthIndex=100, day=31) returns "2100-101-31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0040 begin`);
      const actual: string = formatDateFromMonthIndex(2100, 100, 31);
      logInfo(`formatDateFromMonthIndex(year=2100, month...: actual=${actual}`);
      expect(actual).assertEqual('2100-101-31');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0040 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0041
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0041
     * @tc.desc      formatDateFromMonthIndex(year=2023, monthIndex=2, day=29) returns "2023-03-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0041 begin`);
      const actual: string = formatDateFromMonthIndex(2023, 2, 29);
      logInfo(`formatDateFromMonthIndex(year=2023, month...: actual=${actual}`);
      expect(actual).assertEqual('2023-03-29');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0041 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0042
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0042
     * @tc.desc      formatDateFromMonthIndex(year=0, monthIndex=6, day=3) returns "0-07-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0042 begin`);
      const actual: string = formatDateFromMonthIndex(0, 6, 3);
      logInfo(`formatDateFromMonthIndex(year=0, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('0-07-03');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0042 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0043
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0043
     * @tc.desc      formatDateFromMonthIndex(year=-1, monthIndex=3, day=1) returns "-1-04-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0043 begin`);
      const actual: string = formatDateFromMonthIndex(-1, 3, 1);
      logInfo(`formatDateFromMonthIndex(year=-1, monthIn...: actual=${actual}`);
      expect(actual).assertEqual('-1-04-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0043 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0044
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0044
     * @tc.desc      formatDateFromMonthIndex(year=3, monthIndex=100, day=10) returns "3-101-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0044 begin`);
      const actual: string = formatDateFromMonthIndex(3, 100, 10);
      logInfo(`formatDateFromMonthIndex(year=3, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('3-101-10');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0044 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0045
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0045
     * @tc.desc      formatDateFromMonthIndex(year=2000, monthIndex=6, day=1) returns "2000-07-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0045 begin`);
      const actual: string = formatDateFromMonthIndex(2000, 6, 1);
      logInfo(`formatDateFromMonthIndex(year=2000, month...: actual=${actual}`);
      expect(actual).assertEqual('2000-07-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0045 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0046
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0046
     * @tc.desc      formatDateFromMonthIndex(year=1970, monthIndex=5, day=15) returns "1970-06-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0046 begin`);
      const actual: string = formatDateFromMonthIndex(1970, 5, 15);
      logInfo(`formatDateFromMonthIndex(year=1970, month...: actual=${actual}`);
      expect(actual).assertEqual('1970-06-15');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0046 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0047
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0047
     * @tc.desc      formatDateFromMonthIndex(year=1, monthIndex=12, day=2) returns "1-13-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0047 begin`);
      const actual: string = formatDateFromMonthIndex(1, 12, 2);
      logInfo(`formatDateFromMonthIndex(year=1, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('1-13-02');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0047 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0048
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0048
     * @tc.desc      formatDateFromMonthIndex(year=2000, monthIndex=-1, day=-1) returns "2000-00--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0048 begin`);
      const actual: string = formatDateFromMonthIndex(2000, -1, -1);
      logInfo(`formatDateFromMonthIndex(year=2000, month...: actual=${actual}`);
      expect(actual).assertEqual('2000-00--1');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0048 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0049
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0049
     * @tc.desc      formatDateFromMonthIndex(year=1970, monthIndex=6, day=1) returns "1970-07-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0049 begin`);
      const actual: string = formatDateFromMonthIndex(1970, 6, 1);
      logInfo(`formatDateFromMonthIndex(year=1970, month...: actual=${actual}`);
      expect(actual).assertEqual('1970-07-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0049 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0050
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0050
     * @tc.desc      formatDateFromMonthIndex(year=1970, monthIndex=3, day=31) returns "1970-04-31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0050 begin`);
      const actual: string = formatDateFromMonthIndex(1970, 3, 31);
      logInfo(`formatDateFromMonthIndex(year=1970, month...: actual=${actual}`);
      expect(actual).assertEqual('1970-04-31');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0050 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0051
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0051
     * @tc.desc      formatDateFromMonthIndex(year=0, monthIndex=12, day=100) returns "0-13-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0051 begin`);
      const actual: string = formatDateFromMonthIndex(0, 12, 100);
      logInfo(`formatDateFromMonthIndex(year=0, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('0-13-100');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0051 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0052
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0052
     * @tc.desc      formatDateFromMonthIndex(year=1970, monthIndex=100, day=28) returns "1970-101-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0052 begin`);
      const actual: string = formatDateFromMonthIndex(1970, 100, 28);
      logInfo(`formatDateFromMonthIndex(year=1970, month...: actual=${actual}`);
      expect(actual).assertEqual('1970-101-28');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0052 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0053
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0053
     * @tc.desc      formatDateFromMonthIndex(year=2025, monthIndex=6, day=31) returns "2025-07-31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0053 begin`);
      const actual: string = formatDateFromMonthIndex(2025, 6, 31);
      logInfo(`formatDateFromMonthIndex(year=2025, month...: actual=${actual}`);
      expect(actual).assertEqual('2025-07-31');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0053 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0054
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0054
     * @tc.desc      formatDateFromMonthIndex(year=2023, monthIndex=10, day=3) returns "2023-11-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0054 begin`);
      const actual: string = formatDateFromMonthIndex(2023, 10, 3);
      logInfo(`formatDateFromMonthIndex(year=2023, month...: actual=${actual}`);
      expect(actual).assertEqual('2023-11-03');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0054 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0055
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0055
     * @tc.desc      formatDateFromMonthIndex(year=0, monthIndex=25.26, day=29) returns "0-26.26-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0055 begin`);
      const actual: string = formatDateFromMonthIndex(0, 25.26, 29);
      logInfo(`formatDateFromMonthIndex(year=0, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('0-26.26-29');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0055 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0056
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0056
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=12, day=31) returns "2024-13-31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0056 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 12, 31);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-13-31');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0056 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0057
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0057
     * @tc.desc      formatDateFromMonthIndex(year=2100, monthIndex=100, day=28) returns "2100-101-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0057 begin`);
      const actual: string = formatDateFromMonthIndex(2100, 100, 28);
      logInfo(`formatDateFromMonthIndex(year=2100, month...: actual=${actual}`);
      expect(actual).assertEqual('2100-101-28');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0057 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0058
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0058
     * @tc.desc      formatDateFromMonthIndex(year=-1, monthIndex=6, day=28) returns "-1-07-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0058 begin`);
      const actual: string = formatDateFromMonthIndex(-1, 6, 28);
      logInfo(`formatDateFromMonthIndex(year=-1, monthIn...: actual=${actual}`);
      expect(actual).assertEqual('-1-07-28');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0058 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0059
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0059
     * @tc.desc      formatDateFromMonthIndex(year=2, monthIndex=5, day=28) returns "2-06-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0059 begin`);
      const actual: string = formatDateFromMonthIndex(2, 5, 28);
      logInfo(`formatDateFromMonthIndex(year=2, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('2-06-28');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0059 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0060
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0060
     * @tc.desc      formatDateFromMonthIndex(year=0, monthIndex=3, day=30) returns "0-04-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0060 begin`);
      const actual: string = formatDateFromMonthIndex(0, 3, 30);
      logInfo(`formatDateFromMonthIndex(year=0, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('0-04-30');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0060 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0061
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0061
     * @tc.desc      formatDateFromMonthIndex(year=2, monthIndex=3, day=100) returns "2-04-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0061 begin`);
      const actual: string = formatDateFromMonthIndex(2, 3, 100);
      logInfo(`formatDateFromMonthIndex(year=2, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('2-04-100');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0061 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0062
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0062
     * @tc.desc      formatDateFromMonthIndex(year=1, monthIndex=1, day=3) returns "1-02-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0062 begin`);
      const actual: string = formatDateFromMonthIndex(1, 1, 3);
      logInfo(`formatDateFromMonthIndex(year=1, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('1-02-03');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0062 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0063
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0063
     * @tc.desc      formatDateFromMonthIndex(year=-1, monthIndex=6, day=-1) returns "-1-07--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0063 begin`);
      const actual: string = formatDateFromMonthIndex(-1, 6, -1);
      logInfo(`formatDateFromMonthIndex(year=-1, monthIn...: actual=${actual}`);
      expect(actual).assertEqual('-1-07--1');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0063 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0064
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0064
     * @tc.desc      formatDateFromMonthIndex(year=2, monthIndex=2, day=31) returns "2-03-31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0064 begin`);
      const actual: string = formatDateFromMonthIndex(2, 2, 31);
      logInfo(`formatDateFromMonthIndex(year=2, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('2-03-31');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0064 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0065
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0065
     * @tc.desc      formatDateFromMonthIndex(year=2025, monthIndex=6, day=2) returns "2025-07-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0065 begin`);
      const actual: string = formatDateFromMonthIndex(2025, 6, 2);
      logInfo(`formatDateFromMonthIndex(year=2025, month...: actual=${actual}`);
      expect(actual).assertEqual('2025-07-02');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0065 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0066
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0066
     * @tc.desc      formatDateFromMonthIndex(year=2025, monthIndex=13, day=100) returns "2025-14-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0066 begin`);
      const actual: string = formatDateFromMonthIndex(2025, 13, 100);
      logInfo(`formatDateFromMonthIndex(year=2025, month...: actual=${actual}`);
      expect(actual).assertEqual('2025-14-100');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0066 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0067
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0067
     * @tc.desc      formatDateFromMonthIndex(year=0, monthIndex=3, day=15) returns "0-04-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0067 begin`);
      const actual: string = formatDateFromMonthIndex(0, 3, 15);
      logInfo(`formatDateFromMonthIndex(year=0, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('0-04-15');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0067 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0068
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0068
     * @tc.desc      formatDateFromMonthIndex(year=2, monthIndex=10, day=30) returns "2-11-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0068 begin`);
      const actual: string = formatDateFromMonthIndex(2, 10, 30);
      logInfo(`formatDateFromMonthIndex(year=2, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('2-11-30');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0068 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0069
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0069
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=12, day=3) returns "2024-13-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0069 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 12, 3);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-13-03');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0069 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0070
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0070
     * @tc.desc      formatDateFromMonthIndex(year=-1, monthIndex=1, day=29) returns "-1-02-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0070 begin`);
      const actual: string = formatDateFromMonthIndex(-1, 1, 29);
      logInfo(`formatDateFromMonthIndex(year=-1, monthIn...: actual=${actual}`);
      expect(actual).assertEqual('-1-02-29');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0070 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0071
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0071
     * @tc.desc      formatDateFromMonthIndex(year=0, monthIndex=12, day=28) returns "0-13-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0071 begin`);
      const actual: string = formatDateFromMonthIndex(0, 12, 28);
      logInfo(`formatDateFromMonthIndex(year=0, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('0-13-28');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0071 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0072
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0072
     * @tc.desc      formatDateFromMonthIndex(year=2023, monthIndex=2, day=0) returns "2023-03-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0072 begin`);
      const actual: string = formatDateFromMonthIndex(2023, 2, 0);
      logInfo(`formatDateFromMonthIndex(year=2023, month...: actual=${actual}`);
      expect(actual).assertEqual('2023-03-00');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0072 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0073
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0073
     * @tc.desc      formatDateFromMonthIndex(year=1970, monthIndex=2, day=31) returns "1970-03-31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0073 begin`);
      const actual: string = formatDateFromMonthIndex(1970, 2, 31);
      logInfo(`formatDateFromMonthIndex(year=1970, month...: actual=${actual}`);
      expect(actual).assertEqual('1970-03-31');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0073 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0074
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0074
     * @tc.desc      formatDateFromMonthIndex(year=2, monthIndex=25.26, day=30) returns "2-26.26-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0074 begin`);
      const actual: string = formatDateFromMonthIndex(2, 25.26, 30);
      logInfo(`formatDateFromMonthIndex(year=2, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('2-26.26-30');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0074 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0075
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0075
     * @tc.desc      formatDateFromMonthIndex(year=1, monthIndex=100, day=100) returns "1-101-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0075 begin`);
      const actual: string = formatDateFromMonthIndex(1, 100, 100);
      logInfo(`formatDateFromMonthIndex(year=1, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('1-101-100');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0075 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0076
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0076
     * @tc.desc      formatDateFromMonthIndex(year=2025, monthIndex=3, day=10) returns "2025-04-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0076 begin`);
      const actual: string = formatDateFromMonthIndex(2025, 3, 10);
      logInfo(`formatDateFromMonthIndex(year=2025, month...: actual=${actual}`);
      expect(actual).assertEqual('2025-04-10');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0076 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0077
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0077
     * @tc.desc      formatDateFromMonthIndex(year=-1, monthIndex=3, day=100) returns "-1-04-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0077 begin`);
      const actual: string = formatDateFromMonthIndex(-1, 3, 100);
      logInfo(`formatDateFromMonthIndex(year=-1, monthIn...: actual=${actual}`);
      expect(actual).assertEqual('-1-04-100');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0077 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0078
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0078
     * @tc.desc      formatDateFromMonthIndex(year=2025, monthIndex=13, day=29) returns "2025-14-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0078 begin`);
      const actual: string = formatDateFromMonthIndex(2025, 13, 29);
      logInfo(`formatDateFromMonthIndex(year=2025, month...: actual=${actual}`);
      expect(actual).assertEqual('2025-14-29');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0078 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0079
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0079
     * @tc.desc      formatDateFromMonthIndex(year=2000, monthIndex=10, day=2) returns "2000-11-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0079 begin`);
      const actual: string = formatDateFromMonthIndex(2000, 10, 2);
      logInfo(`formatDateFromMonthIndex(year=2000, month...: actual=${actual}`);
      expect(actual).assertEqual('2000-11-02');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0079 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0080
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0080
     * @tc.desc      formatDateFromMonthIndex(year=1970, monthIndex=0, day=30) returns "1970-01-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0080 begin`);
      const actual: string = formatDateFromMonthIndex(1970, 0, 30);
      logInfo(`formatDateFromMonthIndex(year=1970, month...: actual=${actual}`);
      expect(actual).assertEqual('1970-01-30');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0080 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0081
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0081
     * @tc.desc      formatDateFromMonthIndex(year=2024, monthIndex=10, day=100) returns "2024-11-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0081 begin`);
      const actual: string = formatDateFromMonthIndex(2024, 10, 100);
      logInfo(`formatDateFromMonthIndex(year=2024, month...: actual=${actual}`);
      expect(actual).assertEqual('2024-11-100');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0081 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0082
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0082
     * @tc.desc      formatDateFromMonthIndex(year=3, monthIndex=13, day=29) returns "3-14-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0082 begin`);
      const actual: string = formatDateFromMonthIndex(3, 13, 29);
      logInfo(`formatDateFromMonthIndex(year=3, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('3-14-29');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0082 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0083
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0083
     * @tc.desc      formatDateFromMonthIndex(year=1900, monthIndex=2, day=100) returns "1900-03-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0083 begin`);
      const actual: string = formatDateFromMonthIndex(1900, 2, 100);
      logInfo(`formatDateFromMonthIndex(year=1900, month...: actual=${actual}`);
      expect(actual).assertEqual('1900-03-100');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0083 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0084
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0084
     * @tc.desc      formatDateFromMonthIndex(year=2023, monthIndex=100, day=2) returns "2023-101-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0084 begin`);
      const actual: string = formatDateFromMonthIndex(2023, 100, 2);
      logInfo(`formatDateFromMonthIndex(year=2023, month...: actual=${actual}`);
      expect(actual).assertEqual('2023-101-02');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0084 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0085
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0085
     * @tc.desc      formatDateFromMonthIndex(year=1970, monthIndex=25.26, day=1) returns "1970-26.26-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0085 begin`);
      const actual: string = formatDateFromMonthIndex(1970, 25.26, 1);
      logInfo(`formatDateFromMonthIndex(year=1970, month...: actual=${actual}`);
      expect(actual).assertEqual('1970-26.26-01');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0085 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0086
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0086
     * @tc.desc      formatDateFromMonthIndex(year=-1, monthIndex=2, day=0) returns "-1-03-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0086 begin`);
      const actual: string = formatDateFromMonthIndex(-1, 2, 0);
      logInfo(`formatDateFromMonthIndex(year=-1, monthIn...: actual=${actual}`);
      expect(actual).assertEqual('-1-03-00');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0086 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0087
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0087
     * @tc.desc      formatDateFromMonthIndex(year=1900, monthIndex=13, day=30) returns "1900-14-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0087 begin`);
      const actual: string = formatDateFromMonthIndex(1900, 13, 30);
      logInfo(`formatDateFromMonthIndex(year=1900, month...: actual=${actual}`);
      expect(actual).assertEqual('1900-14-30');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0087 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0088
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0088
     * @tc.desc      formatDateFromMonthIndex(year=2023, monthIndex=2, day=2) returns "2023-03-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0088 begin`);
      const actual: string = formatDateFromMonthIndex(2023, 2, 2);
      logInfo(`formatDateFromMonthIndex(year=2023, month...: actual=${actual}`);
      expect(actual).assertEqual('2023-03-02');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0088 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0089
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0089
     * @tc.desc      formatDateFromMonthIndex(year=2, monthIndex=12, day=100) returns "2-13-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0089 begin`);
      const actual: string = formatDateFromMonthIndex(2, 12, 100);
      logInfo(`formatDateFromMonthIndex(year=2, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('2-13-100');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0089 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0090
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0090
     * @tc.desc      formatDateFromMonthIndex(year=1, monthIndex=100, day=-1) returns "1-101--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0090 begin`);
      const actual: string = formatDateFromMonthIndex(1, 100, -1);
      logInfo(`formatDateFromMonthIndex(year=1, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('1-101--1');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0090 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0091
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0091
     * @tc.desc      formatDateFromMonthIndex(year=2100, monthIndex=2, day=28) returns "2100-03-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0091 begin`);
      const actual: string = formatDateFromMonthIndex(2100, 2, 28);
      logInfo(`formatDateFromMonthIndex(year=2100, month...: actual=${actual}`);
      expect(actual).assertEqual('2100-03-28');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0091 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0092
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0092
     * @tc.desc      formatDateFromMonthIndex(year=3, monthIndex=3, day=10) returns "3-04-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0092 begin`);
      const actual: string = formatDateFromMonthIndex(3, 3, 10);
      logInfo(`formatDateFromMonthIndex(year=3, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('3-04-10');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0092 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0093
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0093
     * @tc.desc      formatDateFromMonthIndex(year=2, monthIndex=13, day=3) returns "2-14-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0093 begin`);
      const actual: string = formatDateFromMonthIndex(2, 13, 3);
      logInfo(`formatDateFromMonthIndex(year=2, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('2-14-03');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0093 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0094
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0094
     * @tc.desc      formatDateFromMonthIndex(year=1970, monthIndex=1, day=3) returns "1970-02-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0094 begin`);
      const actual: string = formatDateFromMonthIndex(1970, 1, 3);
      logInfo(`formatDateFromMonthIndex(year=1970, month...: actual=${actual}`);
      expect(actual).assertEqual('1970-02-03');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0094 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0095
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0095
     * @tc.desc      formatDateFromMonthIndex(year=2, monthIndex=100, day=29) returns "2-101-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0095 begin`);
      const actual: string = formatDateFromMonthIndex(2, 100, 29);
      logInfo(`formatDateFromMonthIndex(year=2, monthInd...: actual=${actual}`);
      expect(actual).assertEqual('2-101-29');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0095 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_FROM_MONTH_INDEX_0096
     * @tc.name      FilePreviewDLP_FormatDateFromMonthIndex_0096
     * @tc.desc      formatDateFromMonthIndex(year=1900, monthIndex=0, day=31) returns "1900-01-31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatDateFromMonthIndex_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0096 begin`);
      const actual: string = formatDateFromMonthIndex(1900, 0, 31);
      logInfo(`formatDateFromMonthIndex(year=1900, month...: actual=${actual}`);
      expect(actual).assertEqual('1900-01-31');
      logInfo(`${BUNDLE}FormatDateFromMonthIndex_0096 end`);
    });
  });
}
