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
export default function formatDateTest(): void {
  describe('FormatDateTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0001
     * @tc.name      FilePreviewDLP_FormatDate_0001
     * @tc.desc      formatDate(year=2024, month=1, day=1) returns "2024-01-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_FormatDate_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FormatDate_0001 begin`);
      const actual: string = formatDate(2024, 1, 1);
      logInfo(`formatDate(year=2024, month=1, day=1): actual=${actual}`);
      expect(actual).assertEqual('2024-01-01');
      logInfo(`${BUNDLE}FormatDate_0001 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0002
     * @tc.name      FilePreviewDLP_FormatDate_0002
     * @tc.desc      formatDate(year=2023, month=1, day=1) returns "2023-01-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_FormatDate_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FormatDate_0002 begin`);
      const actual: string = formatDate(2023, 1, 1);
      logInfo(`formatDate(year=2023, month=1, day=1): actual=${actual}`);
      expect(actual).assertEqual('2023-01-01');
      logInfo(`${BUNDLE}FormatDate_0002 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0003
     * @tc.name      FilePreviewDLP_FormatDate_0003
     * @tc.desc      formatDate(year=2000, month=1, day=1) returns "2000-01-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0003 begin`);
      const actual: string = formatDate(2000, 1, 1);
      logInfo(`formatDate(year=2000, month=1, day=1): actual=${actual}`);
      expect(actual).assertEqual('2000-01-01');
      logInfo(`${BUNDLE}FormatDate_0003 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0004
     * @tc.name      FilePreviewDLP_FormatDate_0004
     * @tc.desc      formatDate(year=1900, month=1, day=1) returns "1900-01-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0004 begin`);
      const actual: string = formatDate(1900, 1, 1);
      logInfo(`formatDate(year=1900, month=1, day=1): actual=${actual}`);
      expect(actual).assertEqual('1900-01-01');
      logInfo(`${BUNDLE}FormatDate_0004 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0005
     * @tc.name      FilePreviewDLP_FormatDate_0005
     * @tc.desc      formatDate(year=2100, month=1, day=1) returns "2100-01-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0005 begin`);
      const actual: string = formatDate(2100, 1, 1);
      logInfo(`formatDate(year=2100, month=1, day=1): actual=${actual}`);
      expect(actual).assertEqual('2100-01-01');
      logInfo(`${BUNDLE}FormatDate_0005 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0006
     * @tc.name      FilePreviewDLP_FormatDate_0006
     * @tc.desc      formatDate(year=1970, month=1, day=1) returns "1970-01-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0006 begin`);
      const actual: string = formatDate(1970, 1, 1);
      logInfo(`formatDate(year=1970, month=1, day=1): actual=${actual}`);
      expect(actual).assertEqual('1970-01-01');
      logInfo(`${BUNDLE}FormatDate_0006 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0007
     * @tc.name      FilePreviewDLP_FormatDate_0007
     * @tc.desc      formatDate(year=2025, month=1, day=1) returns "2025-01-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0007 begin`);
      const actual: string = formatDate(2025, 1, 1);
      logInfo(`formatDate(year=2025, month=1, day=1): actual=${actual}`);
      expect(actual).assertEqual('2025-01-01');
      logInfo(`${BUNDLE}FormatDate_0007 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0008
     * @tc.name      FilePreviewDLP_FormatDate_0008
     * @tc.desc      formatDate(year=0, month=1, day=1) returns "0-01-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0008 begin`);
      const actual: string = formatDate(0, 1, 1);
      logInfo(`formatDate(year=0, month=1, day=1): actual=${actual}`);
      expect(actual).assertEqual('0-01-01');
      logInfo(`${BUNDLE}FormatDate_0008 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0009
     * @tc.name      FilePreviewDLP_FormatDate_0009
     * @tc.desc      formatDate(year=1, month=1, day=1) returns "1-01-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0009 begin`);
      const actual: string = formatDate(1, 1, 1);
      logInfo(`formatDate(year=1, month=1, day=1): actual=${actual}`);
      expect(actual).assertEqual('1-01-01');
      logInfo(`${BUNDLE}FormatDate_0009 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0010
     * @tc.name      FilePreviewDLP_FormatDate_0010
     * @tc.desc      formatDate(year=-1, month=1, day=1) returns "-1-01-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0010 begin`);
      const actual: string = formatDate(-1, 1, 1);
      logInfo(`formatDate(year=-1, month=1, day=1): actual=${actual}`);
      expect(actual).assertEqual('-1-01-01');
      logInfo(`${BUNDLE}FormatDate_0010 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0011
     * @tc.name      FilePreviewDLP_FormatDate_0011
     * @tc.desc      formatDate(year=2, month=1, day=1) returns "2-01-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0011 begin`);
      const actual: string = formatDate(2, 1, 1);
      logInfo(`formatDate(year=2, month=1, day=1): actual=${actual}`);
      expect(actual).assertEqual('2-01-01');
      logInfo(`${BUNDLE}FormatDate_0011 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0012
     * @tc.name      FilePreviewDLP_FormatDate_0012
     * @tc.desc      formatDate(year=3, month=1, day=1) returns "3-01-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0012 begin`);
      const actual: string = formatDate(3, 1, 1);
      logInfo(`formatDate(year=3, month=1, day=1): actual=${actual}`);
      expect(actual).assertEqual('3-01-01');
      logInfo(`${BUNDLE}FormatDate_0012 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0013
     * @tc.name      FilePreviewDLP_FormatDate_0013
     * @tc.desc      formatDate(year=2024, month=2, day=1) returns "2024-02-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0013 begin`);
      const actual: string = formatDate(2024, 2, 1);
      logInfo(`formatDate(year=2024, month=2, day=1): actual=${actual}`);
      expect(actual).assertEqual('2024-02-01');
      logInfo(`${BUNDLE}FormatDate_0013 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0014
     * @tc.name      FilePreviewDLP_FormatDate_0014
     * @tc.desc      formatDate(year=2024, month=6, day=1) returns "2024-06-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0014 begin`);
      const actual: string = formatDate(2024, 6, 1);
      logInfo(`formatDate(year=2024, month=6, day=1): actual=${actual}`);
      expect(actual).assertEqual('2024-06-01');
      logInfo(`${BUNDLE}FormatDate_0014 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0015
     * @tc.name      FilePreviewDLP_FormatDate_0015
     * @tc.desc      formatDate(year=2024, month=12, day=1) returns "2024-12-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0015 begin`);
      const actual: string = formatDate(2024, 12, 1);
      logInfo(`formatDate(year=2024, month=12, day=1): actual=${actual}`);
      expect(actual).assertEqual('2024-12-01');
      logInfo(`${BUNDLE}FormatDate_0015 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0016
     * @tc.name      FilePreviewDLP_FormatDate_0016
     * @tc.desc      formatDate(year=2024, month=0, day=1) returns "2024-00-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0016 begin`);
      const actual: string = formatDate(2024, 0, 1);
      logInfo(`formatDate(year=2024, month=0, day=1): actual=${actual}`);
      expect(actual).assertEqual('2024-00-01');
      logInfo(`${BUNDLE}FormatDate_0016 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0017
     * @tc.name      FilePreviewDLP_FormatDate_0017
     * @tc.desc      formatDate(year=2024, month=13, day=1) returns "2024-13-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0017 begin`);
      const actual: string = formatDate(2024, 13, 1);
      logInfo(`formatDate(year=2024, month=13, day=1): actual=${actual}`);
      expect(actual).assertEqual('2024-13-01');
      logInfo(`${BUNDLE}FormatDate_0017 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0018
     * @tc.name      FilePreviewDLP_FormatDate_0018
     * @tc.desc      formatDate(year=2024, month=-1, day=1) returns "2024--1-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0018 begin`);
      const actual: string = formatDate(2024, -1, 1);
      logInfo(`formatDate(year=2024, month=-1, day=1): actual=${actual}`);
      expect(actual).assertEqual('2024--1-01');
      logInfo(`${BUNDLE}FormatDate_0018 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0019
     * @tc.name      FilePreviewDLP_FormatDate_0019
     * @tc.desc      formatDate(year=2024, month=3, day=1) returns "2024-03-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0019 begin`);
      const actual: string = formatDate(2024, 3, 1);
      logInfo(`formatDate(year=2024, month=3, day=1): actual=${actual}`);
      expect(actual).assertEqual('2024-03-01');
      logInfo(`${BUNDLE}FormatDate_0019 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0020
     * @tc.name      FilePreviewDLP_FormatDate_0020
     * @tc.desc      formatDate(year=2024, month=10, day=1) returns "2024-10-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0020 begin`);
      const actual: string = formatDate(2024, 10, 1);
      logInfo(`formatDate(year=2024, month=10, day=1): actual=${actual}`);
      expect(actual).assertEqual('2024-10-01');
      logInfo(`${BUNDLE}FormatDate_0020 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0021
     * @tc.name      FilePreviewDLP_FormatDate_0021
     * @tc.desc      formatDate(year=2024, month=100, day=1) returns "2024-100-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0021 begin`);
      const actual: string = formatDate(2024, 100, 1);
      logInfo(`formatDate(year=2024, month=100, day=1): actual=${actual}`);
      expect(actual).assertEqual('2024-100-01');
      logInfo(`${BUNDLE}FormatDate_0021 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0022
     * @tc.name      FilePreviewDLP_FormatDate_0022
     * @tc.desc      formatDate(year=2024, month=5, day=1) returns "2024-05-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0022 begin`);
      const actual: string = formatDate(2024, 5, 1);
      logInfo(`formatDate(year=2024, month=5, day=1): actual=${actual}`);
      expect(actual).assertEqual('2024-05-01');
      logInfo(`${BUNDLE}FormatDate_0022 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0023
     * @tc.name      FilePreviewDLP_FormatDate_0023
     * @tc.desc      formatDate(year=2024, month=78, day=1) returns "2024-78-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0023 begin`);
      const actual: string = formatDate(2024, 78, 1);
      logInfo(`formatDate(year=2024, month=78, day=1): actual=${actual}`);
      expect(actual).assertEqual('2024-78-01');
      logInfo(`${BUNDLE}FormatDate_0023 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0024
     * @tc.name      FilePreviewDLP_FormatDate_0024
     * @tc.desc      formatDate(year=2024, month=1, day=15) returns "2024-01-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0024 begin`);
      const actual: string = formatDate(2024, 1, 15);
      logInfo(`formatDate(year=2024, month=1, day=15): actual=${actual}`);
      expect(actual).assertEqual('2024-01-15');
      logInfo(`${BUNDLE}FormatDate_0024 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0025
     * @tc.name      FilePreviewDLP_FormatDate_0025
     * @tc.desc      formatDate(year=2024, month=1, day=28) returns "2024-01-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0025 begin`);
      const actual: string = formatDate(2024, 1, 28);
      logInfo(`formatDate(year=2024, month=1, day=28): actual=${actual}`);
      expect(actual).assertEqual('2024-01-28');
      logInfo(`${BUNDLE}FormatDate_0025 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0026
     * @tc.name      FilePreviewDLP_FormatDate_0026
     * @tc.desc      formatDate(year=2024, month=1, day=29) returns "2024-01-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0026 begin`);
      const actual: string = formatDate(2024, 1, 29);
      logInfo(`formatDate(year=2024, month=1, day=29): actual=${actual}`);
      expect(actual).assertEqual('2024-01-29');
      logInfo(`${BUNDLE}FormatDate_0026 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0027
     * @tc.name      FilePreviewDLP_FormatDate_0027
     * @tc.desc      formatDate(year=2024, month=1, day=30) returns "2024-01-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0027 begin`);
      const actual: string = formatDate(2024, 1, 30);
      logInfo(`formatDate(year=2024, month=1, day=30): actual=${actual}`);
      expect(actual).assertEqual('2024-01-30');
      logInfo(`${BUNDLE}FormatDate_0027 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0028
     * @tc.name      FilePreviewDLP_FormatDate_0028
     * @tc.desc      formatDate(year=2024, month=1, day=31) returns "2024-01-31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0028 begin`);
      const actual: string = formatDate(2024, 1, 31);
      logInfo(`formatDate(year=2024, month=1, day=31): actual=${actual}`);
      expect(actual).assertEqual('2024-01-31');
      logInfo(`${BUNDLE}FormatDate_0028 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0029
     * @tc.name      FilePreviewDLP_FormatDate_0029
     * @tc.desc      formatDate(year=2024, month=1, day=0) returns "2024-01-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0029 begin`);
      const actual: string = formatDate(2024, 1, 0);
      logInfo(`formatDate(year=2024, month=1, day=0): actual=${actual}`);
      expect(actual).assertEqual('2024-01-00');
      logInfo(`${BUNDLE}FormatDate_0029 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0030
     * @tc.name      FilePreviewDLP_FormatDate_0030
     * @tc.desc      formatDate(year=2024, month=1, day=-1) returns "2024-01--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0030 begin`);
      const actual: string = formatDate(2024, 1, -1);
      logInfo(`formatDate(year=2024, month=1, day=-1): actual=${actual}`);
      expect(actual).assertEqual('2024-01--1');
      logInfo(`${BUNDLE}FormatDate_0030 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0031
     * @tc.name      FilePreviewDLP_FormatDate_0031
     * @tc.desc      formatDate(year=2024, month=1, day=2) returns "2024-01-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0031 begin`);
      const actual: string = formatDate(2024, 1, 2);
      logInfo(`formatDate(year=2024, month=1, day=2): actual=${actual}`);
      expect(actual).assertEqual('2024-01-02');
      logInfo(`${BUNDLE}FormatDate_0031 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0032
     * @tc.name      FilePreviewDLP_FormatDate_0032
     * @tc.desc      formatDate(year=2024, month=1, day=3) returns "2024-01-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0032 begin`);
      const actual: string = formatDate(2024, 1, 3);
      logInfo(`formatDate(year=2024, month=1, day=3): actual=${actual}`);
      expect(actual).assertEqual('2024-01-03');
      logInfo(`${BUNDLE}FormatDate_0032 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0033
     * @tc.name      FilePreviewDLP_FormatDate_0033
     * @tc.desc      formatDate(year=2024, month=1, day=10) returns "2024-01-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0033 begin`);
      const actual: string = formatDate(2024, 1, 10);
      logInfo(`formatDate(year=2024, month=1, day=10): actual=${actual}`);
      expect(actual).assertEqual('2024-01-10');
      logInfo(`${BUNDLE}FormatDate_0033 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0034
     * @tc.name      FilePreviewDLP_FormatDate_0034
     * @tc.desc      formatDate(year=2024, month=1, day=100) returns "2024-01-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0034 begin`);
      const actual: string = formatDate(2024, 1, 100);
      logInfo(`formatDate(year=2024, month=1, day=100): actual=${actual}`);
      expect(actual).assertEqual('2024-01-100');
      logInfo(`${BUNDLE}FormatDate_0034 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0035
     * @tc.name      FilePreviewDLP_FormatDate_0035
     * @tc.desc      formatDate(year=1, month=12, day=-1) returns "1-12--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0035 begin`);
      const actual: string = formatDate(1, 12, -1);
      logInfo(`formatDate(year=1, month=12, day=-1): actual=${actual}`);
      expect(actual).assertEqual('1-12--1');
      logInfo(`${BUNDLE}FormatDate_0035 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0036
     * @tc.name      FilePreviewDLP_FormatDate_0036
     * @tc.desc      formatDate(year=2025, month=1, day=-1) returns "2025-01--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0036 begin`);
      const actual: string = formatDate(2025, 1, -1);
      logInfo(`formatDate(year=2025, month=1, day=-1): actual=${actual}`);
      expect(actual).assertEqual('2025-01--1');
      logInfo(`${BUNDLE}FormatDate_0036 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0037
     * @tc.name      FilePreviewDLP_FormatDate_0037
     * @tc.desc      formatDate(year=2025, month=-1, day=10) returns "2025--1-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0037 begin`);
      const actual: string = formatDate(2025, -1, 10);
      logInfo(`formatDate(year=2025, month=-1, day=10): actual=${actual}`);
      expect(actual).assertEqual('2025--1-10');
      logInfo(`${BUNDLE}FormatDate_0037 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0038
     * @tc.name      FilePreviewDLP_FormatDate_0038
     * @tc.desc      formatDate(year=1900, month=6, day=1) returns "1900-06-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0038 begin`);
      const actual: string = formatDate(1900, 6, 1);
      logInfo(`formatDate(year=1900, month=6, day=1): actual=${actual}`);
      expect(actual).assertEqual('1900-06-01');
      logInfo(`${BUNDLE}FormatDate_0038 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0039
     * @tc.name      FilePreviewDLP_FormatDate_0039
     * @tc.desc      formatDate(year=0, month=-1, day=29) returns "0--1-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0039 begin`);
      const actual: string = formatDate(0, -1, 29);
      logInfo(`formatDate(year=0, month=-1, day=29): actual=${actual}`);
      expect(actual).assertEqual('0--1-29');
      logInfo(`${BUNDLE}FormatDate_0039 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0040
     * @tc.name      FilePreviewDLP_FormatDate_0040
     * @tc.desc      formatDate(year=2025, month=10, day=0) returns "2025-10-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0040 begin`);
      const actual: string = formatDate(2025, 10, 0);
      logInfo(`formatDate(year=2025, month=10, day=0): actual=${actual}`);
      expect(actual).assertEqual('2025-10-00');
      logInfo(`${BUNDLE}FormatDate_0040 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0041
     * @tc.name      FilePreviewDLP_FormatDate_0041
     * @tc.desc      formatDate(year=2, month=3, day=1) returns "2-03-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0041 begin`);
      const actual: string = formatDate(2, 3, 1);
      logInfo(`formatDate(year=2, month=3, day=1): actual=${actual}`);
      expect(actual).assertEqual('2-03-01');
      logInfo(`${BUNDLE}FormatDate_0041 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0042
     * @tc.name      FilePreviewDLP_FormatDate_0042
     * @tc.desc      formatDate(year=1900, month=78, day=15) returns "1900-78-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0042 begin`);
      const actual: string = formatDate(1900, 78, 15);
      logInfo(`formatDate(year=1900, month=78, day=15): actual=${actual}`);
      expect(actual).assertEqual('1900-78-15');
      logInfo(`${BUNDLE}FormatDate_0042 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0043
     * @tc.name      FilePreviewDLP_FormatDate_0043
     * @tc.desc      formatDate(year=2024, month=6, day=0) returns "2024-06-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0043 begin`);
      const actual: string = formatDate(2024, 6, 0);
      logInfo(`formatDate(year=2024, month=6, day=0): actual=${actual}`);
      expect(actual).assertEqual('2024-06-00');
      logInfo(`${BUNDLE}FormatDate_0043 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0044
     * @tc.name      FilePreviewDLP_FormatDate_0044
     * @tc.desc      formatDate(year=2000, month=13, day=30) returns "2000-13-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0044 begin`);
      const actual: string = formatDate(2000, 13, 30);
      logInfo(`formatDate(year=2000, month=13, day=30): actual=${actual}`);
      expect(actual).assertEqual('2000-13-30');
      logInfo(`${BUNDLE}FormatDate_0044 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0045
     * @tc.name      FilePreviewDLP_FormatDate_0045
     * @tc.desc      formatDate(year=1900, month=5, day=100) returns "1900-05-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0045 begin`);
      const actual: string = formatDate(1900, 5, 100);
      logInfo(`formatDate(year=1900, month=5, day=100): actual=${actual}`);
      expect(actual).assertEqual('1900-05-100');
      logInfo(`${BUNDLE}FormatDate_0045 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0046
     * @tc.name      FilePreviewDLP_FormatDate_0046
     * @tc.desc      formatDate(year=2025, month=6, day=3) returns "2025-06-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0046 begin`);
      const actual: string = formatDate(2025, 6, 3);
      logInfo(`formatDate(year=2025, month=6, day=3): actual=${actual}`);
      expect(actual).assertEqual('2025-06-03');
      logInfo(`${BUNDLE}FormatDate_0046 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0047
     * @tc.name      FilePreviewDLP_FormatDate_0047
     * @tc.desc      formatDate(year=-1, month=-1, day=2) returns "-1--1-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0047 begin`);
      const actual: string = formatDate(-1, -1, 2);
      logInfo(`formatDate(year=-1, month=-1, day=2): actual=${actual}`);
      expect(actual).assertEqual('-1--1-02');
      logInfo(`${BUNDLE}FormatDate_0047 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0048
     * @tc.name      FilePreviewDLP_FormatDate_0048
     * @tc.desc      formatDate(year=2023, month=100, day=2) returns "2023-100-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0048 begin`);
      const actual: string = formatDate(2023, 100, 2);
      logInfo(`formatDate(year=2023, month=100, day=2): actual=${actual}`);
      expect(actual).assertEqual('2023-100-02');
      logInfo(`${BUNDLE}FormatDate_0048 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0049
     * @tc.name      FilePreviewDLP_FormatDate_0049
     * @tc.desc      formatDate(year=2025, month=-1, day=31) returns "2025--1-31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0049 begin`);
      const actual: string = formatDate(2025, -1, 31);
      logInfo(`formatDate(year=2025, month=-1, day=31): actual=${actual}`);
      expect(actual).assertEqual('2025--1-31');
      logInfo(`${BUNDLE}FormatDate_0049 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0050
     * @tc.name      FilePreviewDLP_FormatDate_0050
     * @tc.desc      formatDate(year=2025, month=100, day=1) returns "2025-100-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0050 begin`);
      const actual: string = formatDate(2025, 100, 1);
      logInfo(`formatDate(year=2025, month=100, day=1): actual=${actual}`);
      expect(actual).assertEqual('2025-100-01');
      logInfo(`${BUNDLE}FormatDate_0050 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0051
     * @tc.name      FilePreviewDLP_FormatDate_0051
     * @tc.desc      formatDate(year=3, month=78, day=15) returns "3-78-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0051 begin`);
      const actual: string = formatDate(3, 78, 15);
      logInfo(`formatDate(year=3, month=78, day=15): actual=${actual}`);
      expect(actual).assertEqual('3-78-15');
      logInfo(`${BUNDLE}FormatDate_0051 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0052
     * @tc.name      FilePreviewDLP_FormatDate_0052
     * @tc.desc      formatDate(year=2100, month=10, day=15) returns "2100-10-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0052 begin`);
      const actual: string = formatDate(2100, 10, 15);
      logInfo(`formatDate(year=2100, month=10, day=15): actual=${actual}`);
      expect(actual).assertEqual('2100-10-15');
      logInfo(`${BUNDLE}FormatDate_0052 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0053
     * @tc.name      FilePreviewDLP_FormatDate_0053
     * @tc.desc      formatDate(year=2000, month=78, day=1) returns "2000-78-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0053 begin`);
      const actual: string = formatDate(2000, 78, 1);
      logInfo(`formatDate(year=2000, month=78, day=1): actual=${actual}`);
      expect(actual).assertEqual('2000-78-01');
      logInfo(`${BUNDLE}FormatDate_0053 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0054
     * @tc.name      FilePreviewDLP_FormatDate_0054
     * @tc.desc      formatDate(year=-1, month=2, day=100) returns "-1-02-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0054 begin`);
      const actual: string = formatDate(-1, 2, 100);
      logInfo(`formatDate(year=-1, month=2, day=100): actual=${actual}`);
      expect(actual).assertEqual('-1-02-100');
      logInfo(`${BUNDLE}FormatDate_0054 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0055
     * @tc.name      FilePreviewDLP_FormatDate_0055
     * @tc.desc      formatDate(year=2024, month=78, day=-1) returns "2024-78--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0055 begin`);
      const actual: string = formatDate(2024, 78, -1);
      logInfo(`formatDate(year=2024, month=78, day=-1): actual=${actual}`);
      expect(actual).assertEqual('2024-78--1');
      logInfo(`${BUNDLE}FormatDate_0055 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0056
     * @tc.name      FilePreviewDLP_FormatDate_0056
     * @tc.desc      formatDate(year=3, month=5, day=29) returns "3-05-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0056 begin`);
      const actual: string = formatDate(3, 5, 29);
      logInfo(`formatDate(year=3, month=5, day=29): actual=${actual}`);
      expect(actual).assertEqual('3-05-29');
      logInfo(`${BUNDLE}FormatDate_0056 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0057
     * @tc.name      FilePreviewDLP_FormatDate_0057
     * @tc.desc      formatDate(year=3, month=13, day=29) returns "3-13-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0057 begin`);
      const actual: string = formatDate(3, 13, 29);
      logInfo(`formatDate(year=3, month=13, day=29): actual=${actual}`);
      expect(actual).assertEqual('3-13-29');
      logInfo(`${BUNDLE}FormatDate_0057 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0058
     * @tc.name      FilePreviewDLP_FormatDate_0058
     * @tc.desc      formatDate(year=2, month=3, day=31) returns "2-03-31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0058 begin`);
      const actual: string = formatDate(2, 3, 31);
      logInfo(`formatDate(year=2, month=3, day=31): actual=${actual}`);
      expect(actual).assertEqual('2-03-31');
      logInfo(`${BUNDLE}FormatDate_0058 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0059
     * @tc.name      FilePreviewDLP_FormatDate_0059
     * @tc.desc      formatDate(year=3, month=5, day=31) returns "3-05-31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0059 begin`);
      const actual: string = formatDate(3, 5, 31);
      logInfo(`formatDate(year=3, month=5, day=31): actual=${actual}`);
      expect(actual).assertEqual('3-05-31');
      logInfo(`${BUNDLE}FormatDate_0059 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0060
     * @tc.name      FilePreviewDLP_FormatDate_0060
     * @tc.desc      formatDate(year=3, month=10, day=-1) returns "3-10--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0060 begin`);
      const actual: string = formatDate(3, 10, -1);
      logInfo(`formatDate(year=3, month=10, day=-1): actual=${actual}`);
      expect(actual).assertEqual('3-10--1');
      logInfo(`${BUNDLE}FormatDate_0060 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0061
     * @tc.name      FilePreviewDLP_FormatDate_0061
     * @tc.desc      formatDate(year=2000, month=3, day=28) returns "2000-03-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0061 begin`);
      const actual: string = formatDate(2000, 3, 28);
      logInfo(`formatDate(year=2000, month=3, day=28): actual=${actual}`);
      expect(actual).assertEqual('2000-03-28');
      logInfo(`${BUNDLE}FormatDate_0061 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0062
     * @tc.name      FilePreviewDLP_FormatDate_0062
     * @tc.desc      formatDate(year=1, month=6, day=10) returns "1-06-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0062 begin`);
      const actual: string = formatDate(1, 6, 10);
      logInfo(`formatDate(year=1, month=6, day=10): actual=${actual}`);
      expect(actual).assertEqual('1-06-10');
      logInfo(`${BUNDLE}FormatDate_0062 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0063
     * @tc.name      FilePreviewDLP_FormatDate_0063
     * @tc.desc      formatDate(year=1970, month=2, day=-1) returns "1970-02--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0063 begin`);
      const actual: string = formatDate(1970, 2, -1);
      logInfo(`formatDate(year=1970, month=2, day=-1): actual=${actual}`);
      expect(actual).assertEqual('1970-02--1');
      logInfo(`${BUNDLE}FormatDate_0063 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0064
     * @tc.name      FilePreviewDLP_FormatDate_0064
     * @tc.desc      formatDate(year=1, month=13, day=2) returns "1-13-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0064 begin`);
      const actual: string = formatDate(1, 13, 2);
      logInfo(`formatDate(year=1, month=13, day=2): actual=${actual}`);
      expect(actual).assertEqual('1-13-02');
      logInfo(`${BUNDLE}FormatDate_0064 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0065
     * @tc.name      FilePreviewDLP_FormatDate_0065
     * @tc.desc      formatDate(year=2023, month=5, day=30) returns "2023-05-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0065 begin`);
      const actual: string = formatDate(2023, 5, 30);
      logInfo(`formatDate(year=2023, month=5, day=30): actual=${actual}`);
      expect(actual).assertEqual('2023-05-30');
      logInfo(`${BUNDLE}FormatDate_0065 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0066
     * @tc.name      FilePreviewDLP_FormatDate_0066
     * @tc.desc      formatDate(year=1, month=13, day=30) returns "1-13-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0066 begin`);
      const actual: string = formatDate(1, 13, 30);
      logInfo(`formatDate(year=1, month=13, day=30): actual=${actual}`);
      expect(actual).assertEqual('1-13-30');
      logInfo(`${BUNDLE}FormatDate_0066 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0067
     * @tc.name      FilePreviewDLP_FormatDate_0067
     * @tc.desc      formatDate(year=1970, month=10, day=29) returns "1970-10-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0067 begin`);
      const actual: string = formatDate(1970, 10, 29);
      logInfo(`formatDate(year=1970, month=10, day=29): actual=${actual}`);
      expect(actual).assertEqual('1970-10-29');
      logInfo(`${BUNDLE}FormatDate_0067 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0068
     * @tc.name      FilePreviewDLP_FormatDate_0068
     * @tc.desc      formatDate(year=2, month=13, day=-1) returns "2-13--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0068 begin`);
      const actual: string = formatDate(2, 13, -1);
      logInfo(`formatDate(year=2, month=13, day=-1): actual=${actual}`);
      expect(actual).assertEqual('2-13--1');
      logInfo(`${BUNDLE}FormatDate_0068 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0069
     * @tc.name      FilePreviewDLP_FormatDate_0069
     * @tc.desc      formatDate(year=-1, month=3, day=2) returns "-1-03-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0069 begin`);
      const actual: string = formatDate(-1, 3, 2);
      logInfo(`formatDate(year=-1, month=3, day=2): actual=${actual}`);
      expect(actual).assertEqual('-1-03-02');
      logInfo(`${BUNDLE}FormatDate_0069 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0070
     * @tc.name      FilePreviewDLP_FormatDate_0070
     * @tc.desc      formatDate(year=3, month=100, day=29) returns "3-100-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0070 begin`);
      const actual: string = formatDate(3, 100, 29);
      logInfo(`formatDate(year=3, month=100, day=29): actual=${actual}`);
      expect(actual).assertEqual('3-100-29');
      logInfo(`${BUNDLE}FormatDate_0070 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0071
     * @tc.name      FilePreviewDLP_FormatDate_0071
     * @tc.desc      formatDate(year=2025, month=12, day=28) returns "2025-12-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0071 begin`);
      const actual: string = formatDate(2025, 12, 28);
      logInfo(`formatDate(year=2025, month=12, day=28): actual=${actual}`);
      expect(actual).assertEqual('2025-12-28');
      logInfo(`${BUNDLE}FormatDate_0071 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0072
     * @tc.name      FilePreviewDLP_FormatDate_0072
     * @tc.desc      formatDate(year=2024, month=78, day=2) returns "2024-78-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0072 begin`);
      const actual: string = formatDate(2024, 78, 2);
      logInfo(`formatDate(year=2024, month=78, day=2): actual=${actual}`);
      expect(actual).assertEqual('2024-78-02');
      logInfo(`${BUNDLE}FormatDate_0072 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0073
     * @tc.name      FilePreviewDLP_FormatDate_0073
     * @tc.desc      formatDate(year=0, month=1, day=100) returns "0-01-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0073 begin`);
      const actual: string = formatDate(0, 1, 100);
      logInfo(`formatDate(year=0, month=1, day=100): actual=${actual}`);
      expect(actual).assertEqual('0-01-100');
      logInfo(`${BUNDLE}FormatDate_0073 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0074
     * @tc.name      FilePreviewDLP_FormatDate_0074
     * @tc.desc      formatDate(year=1970, month=100, day=1) returns "1970-100-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0074 begin`);
      const actual: string = formatDate(1970, 100, 1);
      logInfo(`formatDate(year=1970, month=100, day=1): actual=${actual}`);
      expect(actual).assertEqual('1970-100-01');
      logInfo(`${BUNDLE}FormatDate_0074 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0075
     * @tc.name      FilePreviewDLP_FormatDate_0075
     * @tc.desc      formatDate(year=2, month=78, day=10) returns "2-78-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0075 begin`);
      const actual: string = formatDate(2, 78, 10);
      logInfo(`formatDate(year=2, month=78, day=10): actual=${actual}`);
      expect(actual).assertEqual('2-78-10');
      logInfo(`${BUNDLE}FormatDate_0075 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0076
     * @tc.name      FilePreviewDLP_FormatDate_0076
     * @tc.desc      formatDate(year=2024, month=5, day=28) returns "2024-05-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0076 begin`);
      const actual: string = formatDate(2024, 5, 28);
      logInfo(`formatDate(year=2024, month=5, day=28): actual=${actual}`);
      expect(actual).assertEqual('2024-05-28');
      logInfo(`${BUNDLE}FormatDate_0076 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0077
     * @tc.name      FilePreviewDLP_FormatDate_0077
     * @tc.desc      formatDate(year=3, month=2, day=1) returns "3-02-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0077 begin`);
      const actual: string = formatDate(3, 2, 1);
      logInfo(`formatDate(year=3, month=2, day=1): actual=${actual}`);
      expect(actual).assertEqual('3-02-01');
      logInfo(`${BUNDLE}FormatDate_0077 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0078
     * @tc.name      FilePreviewDLP_FormatDate_0078
     * @tc.desc      formatDate(year=3, month=3, day=15) returns "3-03-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0078 begin`);
      const actual: string = formatDate(3, 3, 15);
      logInfo(`formatDate(year=3, month=3, day=15): actual=${actual}`);
      expect(actual).assertEqual('3-03-15');
      logInfo(`${BUNDLE}FormatDate_0078 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0079
     * @tc.name      FilePreviewDLP_FormatDate_0079
     * @tc.desc      formatDate(year=1970, month=6, day=29) returns "1970-06-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0079 begin`);
      const actual: string = formatDate(1970, 6, 29);
      logInfo(`formatDate(year=1970, month=6, day=29): actual=${actual}`);
      expect(actual).assertEqual('1970-06-29');
      logInfo(`${BUNDLE}FormatDate_0079 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0080
     * @tc.name      FilePreviewDLP_FormatDate_0080
     * @tc.desc      formatDate(year=1900, month=12, day=10) returns "1900-12-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0080 begin`);
      const actual: string = formatDate(1900, 12, 10);
      logInfo(`formatDate(year=1900, month=12, day=10): actual=${actual}`);
      expect(actual).assertEqual('1900-12-10');
      logInfo(`${BUNDLE}FormatDate_0080 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0081
     * @tc.name      FilePreviewDLP_FormatDate_0081
     * @tc.desc      formatDate(year=0, month=3, day=3) returns "0-03-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0081 begin`);
      const actual: string = formatDate(0, 3, 3);
      logInfo(`formatDate(year=0, month=3, day=3): actual=${actual}`);
      expect(actual).assertEqual('0-03-03');
      logInfo(`${BUNDLE}FormatDate_0081 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0082
     * @tc.name      FilePreviewDLP_FormatDate_0082
     * @tc.desc      formatDate(year=2025, month=12, day=100) returns "2025-12-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0082 begin`);
      const actual: string = formatDate(2025, 12, 100);
      logInfo(`formatDate(year=2025, month=12, day=100): actual=${actual}`);
      expect(actual).assertEqual('2025-12-100');
      logInfo(`${BUNDLE}FormatDate_0082 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0083
     * @tc.name      FilePreviewDLP_FormatDate_0083
     * @tc.desc      formatDate(year=2100, month=1, day=15) returns "2100-01-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0083 begin`);
      const actual: string = formatDate(2100, 1, 15);
      logInfo(`formatDate(year=2100, month=1, day=15): actual=${actual}`);
      expect(actual).assertEqual('2100-01-15');
      logInfo(`${BUNDLE}FormatDate_0083 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0084
     * @tc.name      FilePreviewDLP_FormatDate_0084
     * @tc.desc      formatDate(year=2000, month=6, day=15) returns "2000-06-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0084 begin`);
      const actual: string = formatDate(2000, 6, 15);
      logInfo(`formatDate(year=2000, month=6, day=15): actual=${actual}`);
      expect(actual).assertEqual('2000-06-15');
      logInfo(`${BUNDLE}FormatDate_0084 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0085
     * @tc.name      FilePreviewDLP_FormatDate_0085
     * @tc.desc      formatDate(year=2025, month=10, day=100) returns "2025-10-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0085 begin`);
      const actual: string = formatDate(2025, 10, 100);
      logInfo(`formatDate(year=2025, month=10, day=100): actual=${actual}`);
      expect(actual).assertEqual('2025-10-100');
      logInfo(`${BUNDLE}FormatDate_0085 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0086
     * @tc.name      FilePreviewDLP_FormatDate_0086
     * @tc.desc      formatDate(year=2100, month=6, day=100) returns "2100-06-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0086 begin`);
      const actual: string = formatDate(2100, 6, 100);
      logInfo(`formatDate(year=2100, month=6, day=100): actual=${actual}`);
      expect(actual).assertEqual('2100-06-100');
      logInfo(`${BUNDLE}FormatDate_0086 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0087
     * @tc.name      FilePreviewDLP_FormatDate_0087
     * @tc.desc      formatDate(year=0, month=100, day=30) returns "0-100-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0087 begin`);
      const actual: string = formatDate(0, 100, 30);
      logInfo(`formatDate(year=0, month=100, day=30): actual=${actual}`);
      expect(actual).assertEqual('0-100-30');
      logInfo(`${BUNDLE}FormatDate_0087 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0088
     * @tc.name      FilePreviewDLP_FormatDate_0088
     * @tc.desc      formatDate(year=1970, month=3, day=1) returns "1970-03-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0088 begin`);
      const actual: string = formatDate(1970, 3, 1);
      logInfo(`formatDate(year=1970, month=3, day=1): actual=${actual}`);
      expect(actual).assertEqual('1970-03-01');
      logInfo(`${BUNDLE}FormatDate_0088 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0089
     * @tc.name      FilePreviewDLP_FormatDate_0089
     * @tc.desc      formatDate(year=1970, month=5, day=29) returns "1970-05-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0089 begin`);
      const actual: string = formatDate(1970, 5, 29);
      logInfo(`formatDate(year=1970, month=5, day=29): actual=${actual}`);
      expect(actual).assertEqual('1970-05-29');
      logInfo(`${BUNDLE}FormatDate_0089 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0090
     * @tc.name      FilePreviewDLP_FormatDate_0090
     * @tc.desc      formatDate(year=3, month=3, day=30) returns "3-03-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0090 begin`);
      const actual: string = formatDate(3, 3, 30);
      logInfo(`formatDate(year=3, month=3, day=30): actual=${actual}`);
      expect(actual).assertEqual('3-03-30');
      logInfo(`${BUNDLE}FormatDate_0090 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0091
     * @tc.name      FilePreviewDLP_FormatDate_0091
     * @tc.desc      formatDate(year=0, month=10, day=10) returns "0-10-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0091 begin`);
      const actual: string = formatDate(0, 10, 10);
      logInfo(`formatDate(year=0, month=10, day=10): actual=${actual}`);
      expect(actual).assertEqual('0-10-10');
      logInfo(`${BUNDLE}FormatDate_0091 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0092
     * @tc.name      FilePreviewDLP_FormatDate_0092
     * @tc.desc      formatDate(year=2000, month=5, day=-1) returns "2000-05--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0092 begin`);
      const actual: string = formatDate(2000, 5, -1);
      logInfo(`formatDate(year=2000, month=5, day=-1): actual=${actual}`);
      expect(actual).assertEqual('2000-05--1');
      logInfo(`${BUNDLE}FormatDate_0092 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0093
     * @tc.name      FilePreviewDLP_FormatDate_0093
     * @tc.desc      formatDate(year=2024, month=3, day=0) returns "2024-03-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0093 begin`);
      const actual: string = formatDate(2024, 3, 0);
      logInfo(`formatDate(year=2024, month=3, day=0): actual=${actual}`);
      expect(actual).assertEqual('2024-03-00');
      logInfo(`${BUNDLE}FormatDate_0093 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0094
     * @tc.name      FilePreviewDLP_FormatDate_0094
     * @tc.desc      formatDate(year=2025, month=2, day=100) returns "2025-02-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0094 begin`);
      const actual: string = formatDate(2025, 2, 100);
      logInfo(`formatDate(year=2025, month=2, day=100): actual=${actual}`);
      expect(actual).assertEqual('2025-02-100');
      logInfo(`${BUNDLE}FormatDate_0094 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0095
     * @tc.name      FilePreviewDLP_FormatDate_0095
     * @tc.desc      formatDate(year=1970, month=2, day=30) returns "1970-02-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0095 begin`);
      const actual: string = formatDate(1970, 2, 30);
      logInfo(`formatDate(year=1970, month=2, day=30): actual=${actual}`);
      expect(actual).assertEqual('1970-02-30');
      logInfo(`${BUNDLE}FormatDate_0095 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0096
     * @tc.name      FilePreviewDLP_FormatDate_0096
     * @tc.desc      formatDate(year=-1, month=6, day=10) returns "-1-06-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0096 begin`);
      const actual: string = formatDate(-1, 6, 10);
      logInfo(`formatDate(year=-1, month=6, day=10): actual=${actual}`);
      expect(actual).assertEqual('-1-06-10');
      logInfo(`${BUNDLE}FormatDate_0096 end`);
    });
  });
}
