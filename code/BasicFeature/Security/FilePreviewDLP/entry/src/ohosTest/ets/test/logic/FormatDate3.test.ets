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

/** Logic checks for formatDate (75 cases). */
export default function formatDate3Test(): void {
  describe('FormatDate3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0193
     * @tc.name      FilePreviewDLP_FormatDate_0193
     * @tc.desc      formatDate(year=2100, month=10, day=30) returns "2100-10-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0193 begin`);
      const actual: string = formatDate(2100, 10, 30);
      logInfo(`formatDate(year=2100, month=10, day=30): actual=${actual}`);
      expect(actual).assertEqual('2100-10-30');
      logInfo(`${BUNDLE}FormatDate_0193 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0194
     * @tc.name      FilePreviewDLP_FormatDate_0194
     * @tc.desc      formatDate(year=-1, month=6, day=0) returns "-1-06-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0194 begin`);
      const actual: string = formatDate(-1, 6, 0);
      logInfo(`formatDate(year=-1, month=6, day=0): actual=${actual}`);
      expect(actual).assertEqual('-1-06-00');
      logInfo(`${BUNDLE}FormatDate_0194 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0195
     * @tc.name      FilePreviewDLP_FormatDate_0195
     * @tc.desc      formatDate(year=-1, month=-1, day=28) returns "-1--1-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0195 begin`);
      const actual: string = formatDate(-1, -1, 28);
      logInfo(`formatDate(year=-1, month=-1, day=28): actual=${actual}`);
      expect(actual).assertEqual('-1--1-28');
      logInfo(`${BUNDLE}FormatDate_0195 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0196
     * @tc.name      FilePreviewDLP_FormatDate_0196
     * @tc.desc      formatDate(year=0, month=13, day=15) returns "0-13-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0196 begin`);
      const actual: string = formatDate(0, 13, 15);
      logInfo(`formatDate(year=0, month=13, day=15): actual=${actual}`);
      expect(actual).assertEqual('0-13-15');
      logInfo(`${BUNDLE}FormatDate_0196 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0197
     * @tc.name      FilePreviewDLP_FormatDate_0197
     * @tc.desc      formatDate(year=1970, month=0, day=10) returns "1970-00-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0197 begin`);
      const actual: string = formatDate(1970, 0, 10);
      logInfo(`formatDate(year=1970, month=0, day=10): actual=${actual}`);
      expect(actual).assertEqual('1970-00-10');
      logInfo(`${BUNDLE}FormatDate_0197 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0198
     * @tc.name      FilePreviewDLP_FormatDate_0198
     * @tc.desc      formatDate(year=1970, month=78, day=100) returns "1970-78-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0198 begin`);
      const actual: string = formatDate(1970, 78, 100);
      logInfo(`formatDate(year=1970, month=78, day=100): actual=${actual}`);
      expect(actual).assertEqual('1970-78-100');
      logInfo(`${BUNDLE}FormatDate_0198 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0199
     * @tc.name      FilePreviewDLP_FormatDate_0199
     * @tc.desc      formatDate(year=-1, month=100, day=0) returns "-1-100-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0199 begin`);
      const actual: string = formatDate(-1, 100, 0);
      logInfo(`formatDate(year=-1, month=100, day=0): actual=${actual}`);
      expect(actual).assertEqual('-1-100-00');
      logInfo(`${BUNDLE}FormatDate_0199 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0200
     * @tc.name      FilePreviewDLP_FormatDate_0200
     * @tc.desc      formatDate(year=-1, month=78, day=30) returns "-1-78-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0200 begin`);
      const actual: string = formatDate(-1, 78, 30);
      logInfo(`formatDate(year=-1, month=78, day=30): actual=${actual}`);
      expect(actual).assertEqual('-1-78-30');
      logInfo(`${BUNDLE}FormatDate_0200 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0201
     * @tc.name      FilePreviewDLP_FormatDate_0201
     * @tc.desc      formatDate(year=0, month=0, day=15) returns "0-00-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0201 begin`);
      const actual: string = formatDate(0, 0, 15);
      logInfo(`formatDate(year=0, month=0, day=15): actual=${actual}`);
      expect(actual).assertEqual('0-00-15');
      logInfo(`${BUNDLE}FormatDate_0201 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0202
     * @tc.name      FilePreviewDLP_FormatDate_0202
     * @tc.desc      formatDate(year=-1, month=0, day=15) returns "-1-00-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0202 begin`);
      const actual: string = formatDate(-1, 0, 15);
      logInfo(`formatDate(year=-1, month=0, day=15): actual=${actual}`);
      expect(actual).assertEqual('-1-00-15');
      logInfo(`${BUNDLE}FormatDate_0202 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0203
     * @tc.name      FilePreviewDLP_FormatDate_0203
     * @tc.desc      formatDate(year=2023, month=10, day=28) returns "2023-10-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0203 begin`);
      const actual: string = formatDate(2023, 10, 28);
      logInfo(`formatDate(year=2023, month=10, day=28): actual=${actual}`);
      expect(actual).assertEqual('2023-10-28');
      logInfo(`${BUNDLE}FormatDate_0203 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0204
     * @tc.name      FilePreviewDLP_FormatDate_0204
     * @tc.desc      formatDate(year=0, month=0, day=10) returns "0-00-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0204 begin`);
      const actual: string = formatDate(0, 0, 10);
      logInfo(`formatDate(year=0, month=0, day=10): actual=${actual}`);
      expect(actual).assertEqual('0-00-10');
      logInfo(`${BUNDLE}FormatDate_0204 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0205
     * @tc.name      FilePreviewDLP_FormatDate_0205
     * @tc.desc      formatDate(year=1, month=3, day=3) returns "1-03-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0205 begin`);
      const actual: string = formatDate(1, 3, 3);
      logInfo(`formatDate(year=1, month=3, day=3): actual=${actual}`);
      expect(actual).assertEqual('1-03-03');
      logInfo(`${BUNDLE}FormatDate_0205 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0206
     * @tc.name      FilePreviewDLP_FormatDate_0206
     * @tc.desc      formatDate(year=2024, month=3, day=3) returns "2024-03-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0206 begin`);
      const actual: string = formatDate(2024, 3, 3);
      logInfo(`formatDate(year=2024, month=3, day=3): actual=${actual}`);
      expect(actual).assertEqual('2024-03-03');
      logInfo(`${BUNDLE}FormatDate_0206 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0207
     * @tc.name      FilePreviewDLP_FormatDate_0207
     * @tc.desc      formatDate(year=2025, month=-1, day=0) returns "2025--1-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0207 begin`);
      const actual: string = formatDate(2025, -1, 0);
      logInfo(`formatDate(year=2025, month=-1, day=0): actual=${actual}`);
      expect(actual).assertEqual('2025--1-00');
      logInfo(`${BUNDLE}FormatDate_0207 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0208
     * @tc.name      FilePreviewDLP_FormatDate_0208
     * @tc.desc      formatDate(year=2100, month=78, day=2) returns "2100-78-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0208 begin`);
      const actual: string = formatDate(2100, 78, 2);
      logInfo(`formatDate(year=2100, month=78, day=2): actual=${actual}`);
      expect(actual).assertEqual('2100-78-02');
      logInfo(`${BUNDLE}FormatDate_0208 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0209
     * @tc.name      FilePreviewDLP_FormatDate_0209
     * @tc.desc      formatDate(year=2, month=100, day=31) returns "2-100-31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0209 begin`);
      const actual: string = formatDate(2, 100, 31);
      logInfo(`formatDate(year=2, month=100, day=31): actual=${actual}`);
      expect(actual).assertEqual('2-100-31');
      logInfo(`${BUNDLE}FormatDate_0209 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0210
     * @tc.name      FilePreviewDLP_FormatDate_0210
     * @tc.desc      formatDate(year=1, month=5, day=15) returns "1-05-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0210 begin`);
      const actual: string = formatDate(1, 5, 15);
      logInfo(`formatDate(year=1, month=5, day=15): actual=${actual}`);
      expect(actual).assertEqual('1-05-15');
      logInfo(`${BUNDLE}FormatDate_0210 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0211
     * @tc.name      FilePreviewDLP_FormatDate_0211
     * @tc.desc      formatDate(year=2023, month=0, day=1) returns "2023-00-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0211 begin`);
      const actual: string = formatDate(2023, 0, 1);
      logInfo(`formatDate(year=2023, month=0, day=1): actual=${actual}`);
      expect(actual).assertEqual('2023-00-01');
      logInfo(`${BUNDLE}FormatDate_0211 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0212
     * @tc.name      FilePreviewDLP_FormatDate_0212
     * @tc.desc      formatDate(year=-1, month=-1, day=10) returns "-1--1-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0212 begin`);
      const actual: string = formatDate(-1, -1, 10);
      logInfo(`formatDate(year=-1, month=-1, day=10): actual=${actual}`);
      expect(actual).assertEqual('-1--1-10');
      logInfo(`${BUNDLE}FormatDate_0212 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0213
     * @tc.name      FilePreviewDLP_FormatDate_0213
     * @tc.desc      formatDate(year=1900, month=5, day=-1) returns "1900-05--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0213 begin`);
      const actual: string = formatDate(1900, 5, -1);
      logInfo(`formatDate(year=1900, month=5, day=-1): actual=${actual}`);
      expect(actual).assertEqual('1900-05--1');
      logInfo(`${BUNDLE}FormatDate_0213 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0214
     * @tc.name      FilePreviewDLP_FormatDate_0214
     * @tc.desc      formatDate(year=2, month=10, day=31) returns "2-10-31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0214 begin`);
      const actual: string = formatDate(2, 10, 31);
      logInfo(`formatDate(year=2, month=10, day=31): actual=${actual}`);
      expect(actual).assertEqual('2-10-31');
      logInfo(`${BUNDLE}FormatDate_0214 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0215
     * @tc.name      FilePreviewDLP_FormatDate_0215
     * @tc.desc      formatDate(year=3, month=2, day=30) returns "3-02-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0215 begin`);
      const actual: string = formatDate(3, 2, 30);
      logInfo(`formatDate(year=3, month=2, day=30): actual=${actual}`);
      expect(actual).assertEqual('3-02-30');
      logInfo(`${BUNDLE}FormatDate_0215 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0216
     * @tc.name      FilePreviewDLP_FormatDate_0216
     * @tc.desc      formatDate(year=2000, month=2, day=-1) returns "2000-02--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0216 begin`);
      const actual: string = formatDate(2000, 2, -1);
      logInfo(`formatDate(year=2000, month=2, day=-1): actual=${actual}`);
      expect(actual).assertEqual('2000-02--1');
      logInfo(`${BUNDLE}FormatDate_0216 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0217
     * @tc.name      FilePreviewDLP_FormatDate_0217
     * @tc.desc      formatDate(year=1, month=-1, day=-1) returns "1--1--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0217 begin`);
      const actual: string = formatDate(1, -1, -1);
      logInfo(`formatDate(year=1, month=-1, day=-1): actual=${actual}`);
      expect(actual).assertEqual('1--1--1');
      logInfo(`${BUNDLE}FormatDate_0217 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0218
     * @tc.name      FilePreviewDLP_FormatDate_0218
     * @tc.desc      formatDate(year=3, month=13, day=-1) returns "3-13--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0218 begin`);
      const actual: string = formatDate(3, 13, -1);
      logInfo(`formatDate(year=3, month=13, day=-1): actual=${actual}`);
      expect(actual).assertEqual('3-13--1');
      logInfo(`${BUNDLE}FormatDate_0218 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0219
     * @tc.name      FilePreviewDLP_FormatDate_0219
     * @tc.desc      formatDate(year=2, month=0, day=-1) returns "2-00--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0219 begin`);
      const actual: string = formatDate(2, 0, -1);
      logInfo(`formatDate(year=2, month=0, day=-1): actual=${actual}`);
      expect(actual).assertEqual('2-00--1');
      logInfo(`${BUNDLE}FormatDate_0219 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0220
     * @tc.name      FilePreviewDLP_FormatDate_0220
     * @tc.desc      formatDate(year=2100, month=13, day=3) returns "2100-13-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0220 begin`);
      const actual: string = formatDate(2100, 13, 3);
      logInfo(`formatDate(year=2100, month=13, day=3): actual=${actual}`);
      expect(actual).assertEqual('2100-13-03');
      logInfo(`${BUNDLE}FormatDate_0220 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0221
     * @tc.name      FilePreviewDLP_FormatDate_0221
     * @tc.desc      formatDate(year=2100, month=13, day=2) returns "2100-13-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0221 begin`);
      const actual: string = formatDate(2100, 13, 2);
      logInfo(`formatDate(year=2100, month=13, day=2): actual=${actual}`);
      expect(actual).assertEqual('2100-13-02');
      logInfo(`${BUNDLE}FormatDate_0221 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0222
     * @tc.name      FilePreviewDLP_FormatDate_0222
     * @tc.desc      formatDate(year=1, month=-1, day=28) returns "1--1-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0222 begin`);
      const actual: string = formatDate(1, -1, 28);
      logInfo(`formatDate(year=1, month=-1, day=28): actual=${actual}`);
      expect(actual).assertEqual('1--1-28');
      logInfo(`${BUNDLE}FormatDate_0222 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0223
     * @tc.name      FilePreviewDLP_FormatDate_0223
     * @tc.desc      formatDate(year=-1, month=10, day=0) returns "-1-10-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0223 begin`);
      const actual: string = formatDate(-1, 10, 0);
      logInfo(`formatDate(year=-1, month=10, day=0): actual=${actual}`);
      expect(actual).assertEqual('-1-10-00');
      logInfo(`${BUNDLE}FormatDate_0223 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0224
     * @tc.name      FilePreviewDLP_FormatDate_0224
     * @tc.desc      formatDate(year=1, month=10, day=-1) returns "1-10--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0224 begin`);
      const actual: string = formatDate(1, 10, -1);
      logInfo(`formatDate(year=1, month=10, day=-1): actual=${actual}`);
      expect(actual).assertEqual('1-10--1');
      logInfo(`${BUNDLE}FormatDate_0224 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0225
     * @tc.name      FilePreviewDLP_FormatDate_0225
     * @tc.desc      formatDate(year=2100, month=1, day=0) returns "2100-01-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0225 begin`);
      const actual: string = formatDate(2100, 1, 0);
      logInfo(`formatDate(year=2100, month=1, day=0): actual=${actual}`);
      expect(actual).assertEqual('2100-01-00');
      logInfo(`${BUNDLE}FormatDate_0225 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0226
     * @tc.name      FilePreviewDLP_FormatDate_0226
     * @tc.desc      formatDate(year=1, month=13, day=-1) returns "1-13--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0226 begin`);
      const actual: string = formatDate(1, 13, -1);
      logInfo(`formatDate(year=1, month=13, day=-1): actual=${actual}`);
      expect(actual).assertEqual('1-13--1');
      logInfo(`${BUNDLE}FormatDate_0226 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0227
     * @tc.name      FilePreviewDLP_FormatDate_0227
     * @tc.desc      formatDate(year=-1, month=13, day=15) returns "-1-13-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0227 begin`);
      const actual: string = formatDate(-1, 13, 15);
      logInfo(`formatDate(year=-1, month=13, day=15): actual=${actual}`);
      expect(actual).assertEqual('-1-13-15');
      logInfo(`${BUNDLE}FormatDate_0227 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0228
     * @tc.name      FilePreviewDLP_FormatDate_0228
     * @tc.desc      formatDate(year=2024, month=12, day=10) returns "2024-12-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0228 begin`);
      const actual: string = formatDate(2024, 12, 10);
      logInfo(`formatDate(year=2024, month=12, day=10): actual=${actual}`);
      expect(actual).assertEqual('2024-12-10');
      logInfo(`${BUNDLE}FormatDate_0228 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0229
     * @tc.name      FilePreviewDLP_FormatDate_0229
     * @tc.desc      formatDate(year=2025, month=-1, day=15) returns "2025--1-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0229 begin`);
      const actual: string = formatDate(2025, -1, 15);
      logInfo(`formatDate(year=2025, month=-1, day=15): actual=${actual}`);
      expect(actual).assertEqual('2025--1-15');
      logInfo(`${BUNDLE}FormatDate_0229 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0230
     * @tc.name      FilePreviewDLP_FormatDate_0230
     * @tc.desc      formatDate(year=3, month=-1, day=30) returns "3--1-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0230 begin`);
      const actual: string = formatDate(3, -1, 30);
      logInfo(`formatDate(year=3, month=-1, day=30): actual=${actual}`);
      expect(actual).assertEqual('3--1-30');
      logInfo(`${BUNDLE}FormatDate_0230 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0231
     * @tc.name      FilePreviewDLP_FormatDate_0231
     * @tc.desc      formatDate(year=1900, month=2, day=30) returns "1900-02-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0231 begin`);
      const actual: string = formatDate(1900, 2, 30);
      logInfo(`formatDate(year=1900, month=2, day=30): actual=${actual}`);
      expect(actual).assertEqual('1900-02-30');
      logInfo(`${BUNDLE}FormatDate_0231 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0232
     * @tc.name      FilePreviewDLP_FormatDate_0232
     * @tc.desc      formatDate(year=2100, month=10, day=3) returns "2100-10-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0232 begin`);
      const actual: string = formatDate(2100, 10, 3);
      logInfo(`formatDate(year=2100, month=10, day=3): actual=${actual}`);
      expect(actual).assertEqual('2100-10-03');
      logInfo(`${BUNDLE}FormatDate_0232 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0233
     * @tc.name      FilePreviewDLP_FormatDate_0233
     * @tc.desc      formatDate(year=2000, month=0, day=3) returns "2000-00-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0233 begin`);
      const actual: string = formatDate(2000, 0, 3);
      logInfo(`formatDate(year=2000, month=0, day=3): actual=${actual}`);
      expect(actual).assertEqual('2000-00-03');
      logInfo(`${BUNDLE}FormatDate_0233 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0234
     * @tc.name      FilePreviewDLP_FormatDate_0234
     * @tc.desc      formatDate(year=2, month=13, day=0) returns "2-13-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0234 begin`);
      const actual: string = formatDate(2, 13, 0);
      logInfo(`formatDate(year=2, month=13, day=0): actual=${actual}`);
      expect(actual).assertEqual('2-13-00');
      logInfo(`${BUNDLE}FormatDate_0234 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0235
     * @tc.name      FilePreviewDLP_FormatDate_0235
     * @tc.desc      formatDate(year=2024, month=12, day=15) returns "2024-12-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0235 begin`);
      const actual: string = formatDate(2024, 12, 15);
      logInfo(`formatDate(year=2024, month=12, day=15): actual=${actual}`);
      expect(actual).assertEqual('2024-12-15');
      logInfo(`${BUNDLE}FormatDate_0235 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0236
     * @tc.name      FilePreviewDLP_FormatDate_0236
     * @tc.desc      formatDate(year=0, month=2, day=-1) returns "0-02--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0236 begin`);
      const actual: string = formatDate(0, 2, -1);
      logInfo(`formatDate(year=0, month=2, day=-1): actual=${actual}`);
      expect(actual).assertEqual('0-02--1');
      logInfo(`${BUNDLE}FormatDate_0236 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0237
     * @tc.name      FilePreviewDLP_FormatDate_0237
     * @tc.desc      formatDate(year=2100, month=2, day=2) returns "2100-02-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0237 begin`);
      const actual: string = formatDate(2100, 2, 2);
      logInfo(`formatDate(year=2100, month=2, day=2): actual=${actual}`);
      expect(actual).assertEqual('2100-02-02');
      logInfo(`${BUNDLE}FormatDate_0237 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0238
     * @tc.name      FilePreviewDLP_FormatDate_0238
     * @tc.desc      formatDate(year=2000, month=12, day=15) returns "2000-12-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0238 begin`);
      const actual: string = formatDate(2000, 12, 15);
      logInfo(`formatDate(year=2000, month=12, day=15): actual=${actual}`);
      expect(actual).assertEqual('2000-12-15');
      logInfo(`${BUNDLE}FormatDate_0238 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0239
     * @tc.name      FilePreviewDLP_FormatDate_0239
     * @tc.desc      formatDate(year=2024, month=2, day=30) returns "2024-02-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0239 begin`);
      const actual: string = formatDate(2024, 2, 30);
      logInfo(`formatDate(year=2024, month=2, day=30): actual=${actual}`);
      expect(actual).assertEqual('2024-02-30');
      logInfo(`${BUNDLE}FormatDate_0239 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0240
     * @tc.name      FilePreviewDLP_FormatDate_0240
     * @tc.desc      formatDate(year=1900, month=1, day=15) returns "1900-01-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0240 begin`);
      const actual: string = formatDate(1900, 1, 15);
      logInfo(`formatDate(year=1900, month=1, day=15): actual=${actual}`);
      expect(actual).assertEqual('1900-01-15');
      logInfo(`${BUNDLE}FormatDate_0240 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0241
     * @tc.name      FilePreviewDLP_FormatDate_0241
     * @tc.desc      formatDate(year=1, month=10, day=2) returns "1-10-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0241 begin`);
      const actual: string = formatDate(1, 10, 2);
      logInfo(`formatDate(year=1, month=10, day=2): actual=${actual}`);
      expect(actual).assertEqual('1-10-02');
      logInfo(`${BUNDLE}FormatDate_0241 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0242
     * @tc.name      FilePreviewDLP_FormatDate_0242
     * @tc.desc      formatDate(year=2100, month=12, day=2) returns "2100-12-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0242 begin`);
      const actual: string = formatDate(2100, 12, 2);
      logInfo(`formatDate(year=2100, month=12, day=2): actual=${actual}`);
      expect(actual).assertEqual('2100-12-02');
      logInfo(`${BUNDLE}FormatDate_0242 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0243
     * @tc.name      FilePreviewDLP_FormatDate_0243
     * @tc.desc      formatDate(year=0, month=6, day=0) returns "0-06-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0243 begin`);
      const actual: string = formatDate(0, 6, 0);
      logInfo(`formatDate(year=0, month=6, day=0): actual=${actual}`);
      expect(actual).assertEqual('0-06-00');
      logInfo(`${BUNDLE}FormatDate_0243 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0244
     * @tc.name      FilePreviewDLP_FormatDate_0244
     * @tc.desc      formatDate(year=2023, month=1, day=15) returns "2023-01-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0244 begin`);
      const actual: string = formatDate(2023, 1, 15);
      logInfo(`formatDate(year=2023, month=1, day=15): actual=${actual}`);
      expect(actual).assertEqual('2023-01-15');
      logInfo(`${BUNDLE}FormatDate_0244 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0245
     * @tc.name      FilePreviewDLP_FormatDate_0245
     * @tc.desc      formatDate(year=1, month=13, day=100) returns "1-13-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0245 begin`);
      const actual: string = formatDate(1, 13, 100);
      logInfo(`formatDate(year=1, month=13, day=100): actual=${actual}`);
      expect(actual).assertEqual('1-13-100');
      logInfo(`${BUNDLE}FormatDate_0245 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0246
     * @tc.name      FilePreviewDLP_FormatDate_0246
     * @tc.desc      formatDate(year=2023, month=78, day=28) returns "2023-78-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0246 begin`);
      const actual: string = formatDate(2023, 78, 28);
      logInfo(`formatDate(year=2023, month=78, day=28): actual=${actual}`);
      expect(actual).assertEqual('2023-78-28');
      logInfo(`${BUNDLE}FormatDate_0246 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0247
     * @tc.name      FilePreviewDLP_FormatDate_0247
     * @tc.desc      formatDate(year=2000, month=100, day=31) returns "2000-100-31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0247 begin`);
      const actual: string = formatDate(2000, 100, 31);
      logInfo(`formatDate(year=2000, month=100, day=31): actual=${actual}`);
      expect(actual).assertEqual('2000-100-31');
      logInfo(`${BUNDLE}FormatDate_0247 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0248
     * @tc.name      FilePreviewDLP_FormatDate_0248
     * @tc.desc      formatDate(year=2100, month=-1, day=28) returns "2100--1-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0248 begin`);
      const actual: string = formatDate(2100, -1, 28);
      logInfo(`formatDate(year=2100, month=-1, day=28): actual=${actual}`);
      expect(actual).assertEqual('2100--1-28');
      logInfo(`${BUNDLE}FormatDate_0248 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0249
     * @tc.name      FilePreviewDLP_FormatDate_0249
     * @tc.desc      formatDate(year=2100, month=2, day=0) returns "2100-02-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0249 begin`);
      const actual: string = formatDate(2100, 2, 0);
      logInfo(`formatDate(year=2100, month=2, day=0): actual=${actual}`);
      expect(actual).assertEqual('2100-02-00');
      logInfo(`${BUNDLE}FormatDate_0249 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0250
     * @tc.name      FilePreviewDLP_FormatDate_0250
     * @tc.desc      formatDate(year=-1, month=1, day=2) returns "-1-01-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0250 begin`);
      const actual: string = formatDate(-1, 1, 2);
      logInfo(`formatDate(year=-1, month=1, day=2): actual=${actual}`);
      expect(actual).assertEqual('-1-01-02');
      logInfo(`${BUNDLE}FormatDate_0250 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0251
     * @tc.name      FilePreviewDLP_FormatDate_0251
     * @tc.desc      formatDate(year=0, month=-1, day=28) returns "0--1-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0251 begin`);
      const actual: string = formatDate(0, -1, 28);
      logInfo(`formatDate(year=0, month=-1, day=28): actual=${actual}`);
      expect(actual).assertEqual('0--1-28');
      logInfo(`${BUNDLE}FormatDate_0251 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0252
     * @tc.name      FilePreviewDLP_FormatDate_0252
     * @tc.desc      formatDate(year=2025, month=2, day=0) returns "2025-02-00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0252 begin`);
      const actual: string = formatDate(2025, 2, 0);
      logInfo(`formatDate(year=2025, month=2, day=0): actual=${actual}`);
      expect(actual).assertEqual('2025-02-00');
      logInfo(`${BUNDLE}FormatDate_0252 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0253
     * @tc.name      FilePreviewDLP_FormatDate_0253
     * @tc.desc      formatDate(year=2023, month=3, day=100) returns "2023-03-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0253 begin`);
      const actual: string = formatDate(2023, 3, 100);
      logInfo(`formatDate(year=2023, month=3, day=100): actual=${actual}`);
      expect(actual).assertEqual('2023-03-100');
      logInfo(`${BUNDLE}FormatDate_0253 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0254
     * @tc.name      FilePreviewDLP_FormatDate_0254
     * @tc.desc      formatDate(year=3, month=1, day=30) returns "3-01-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0254 begin`);
      const actual: string = formatDate(3, 1, 30);
      logInfo(`formatDate(year=3, month=1, day=30): actual=${actual}`);
      expect(actual).assertEqual('3-01-30');
      logInfo(`${BUNDLE}FormatDate_0254 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0255
     * @tc.name      FilePreviewDLP_FormatDate_0255
     * @tc.desc      formatDate(year=-1, month=13, day=29) returns "-1-13-29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0255 begin`);
      const actual: string = formatDate(-1, 13, 29);
      logInfo(`formatDate(year=-1, month=13, day=29): actual=${actual}`);
      expect(actual).assertEqual('-1-13-29');
      logInfo(`${BUNDLE}FormatDate_0255 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0256
     * @tc.name      FilePreviewDLP_FormatDate_0256
     * @tc.desc      formatDate(year=1, month=6, day=1) returns "1-06-01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0256 begin`);
      const actual: string = formatDate(1, 6, 1);
      logInfo(`formatDate(year=1, month=6, day=1): actual=${actual}`);
      expect(actual).assertEqual('1-06-01');
      logInfo(`${BUNDLE}FormatDate_0256 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0257
     * @tc.name      FilePreviewDLP_FormatDate_0257
     * @tc.desc      formatDate(year=2100, month=2, day=-1) returns "2100-02--1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatDate_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatDate_0257 begin`);
      const actual: string = formatDate(2100, 2, -1);
      logInfo(`formatDate(year=2100, month=2, day=-1): actual=${actual}`);
      expect(actual).assertEqual('2100-02--1');
      logInfo(`${BUNDLE}FormatDate_0257 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0258
     * @tc.name      FilePreviewDLP_FormatDate_0258
     * @tc.desc      formatDate(year=2023, month=2, day=3) returns "2023-02-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0258 begin`);
      const actual: string = formatDate(2023, 2, 3);
      logInfo(`formatDate(year=2023, month=2, day=3): actual=${actual}`);
      expect(actual).assertEqual('2023-02-03');
      logInfo(`${BUNDLE}FormatDate_0258 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0259
     * @tc.name      FilePreviewDLP_FormatDate_0259
     * @tc.desc      formatDate(year=1970, month=5, day=2) returns "1970-05-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0259 begin`);
      const actual: string = formatDate(1970, 5, 2);
      logInfo(`formatDate(year=1970, month=5, day=2): actual=${actual}`);
      expect(actual).assertEqual('1970-05-02');
      logInfo(`${BUNDLE}FormatDate_0259 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0260
     * @tc.name      FilePreviewDLP_FormatDate_0260
     * @tc.desc      formatDate(year=2, month=2, day=2) returns "2-02-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0260 begin`);
      const actual: string = formatDate(2, 2, 2);
      logInfo(`formatDate(year=2, month=2, day=2): actual=${actual}`);
      expect(actual).assertEqual('2-02-02');
      logInfo(`${BUNDLE}FormatDate_0260 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0261
     * @tc.name      FilePreviewDLP_FormatDate_0261
     * @tc.desc      formatDate(year=2023, month=6, day=2) returns "2023-06-02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0261 begin`);
      const actual: string = formatDate(2023, 6, 2);
      logInfo(`formatDate(year=2023, month=6, day=2): actual=${actual}`);
      expect(actual).assertEqual('2023-06-02');
      logInfo(`${BUNDLE}FormatDate_0261 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0262
     * @tc.name      FilePreviewDLP_FormatDate_0262
     * @tc.desc      formatDate(year=2100, month=12, day=28) returns "2100-12-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0262 begin`);
      const actual: string = formatDate(2100, 12, 28);
      logInfo(`formatDate(year=2100, month=12, day=28): actual=${actual}`);
      expect(actual).assertEqual('2100-12-28');
      logInfo(`${BUNDLE}FormatDate_0262 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0263
     * @tc.name      FilePreviewDLP_FormatDate_0263
     * @tc.desc      formatDate(year=2024, month=6, day=3) returns "2024-06-03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0263 begin`);
      const actual: string = formatDate(2024, 6, 3);
      logInfo(`formatDate(year=2024, month=6, day=3): actual=${actual}`);
      expect(actual).assertEqual('2024-06-03');
      logInfo(`${BUNDLE}FormatDate_0263 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0264
     * @tc.name      FilePreviewDLP_FormatDate_0264
     * @tc.desc      formatDate(year=2023, month=5, day=31) returns "2023-05-31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0264 begin`);
      const actual: string = formatDate(2023, 5, 31);
      logInfo(`formatDate(year=2023, month=5, day=31): actual=${actual}`);
      expect(actual).assertEqual('2023-05-31');
      logInfo(`${BUNDLE}FormatDate_0264 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0265
     * @tc.name      FilePreviewDLP_FormatDate_0265
     * @tc.desc      formatDate(year=0, month=13, day=28) returns "0-13-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0265 begin`);
      const actual: string = formatDate(0, 13, 28);
      logInfo(`formatDate(year=0, month=13, day=28): actual=${actual}`);
      expect(actual).assertEqual('0-13-28');
      logInfo(`${BUNDLE}FormatDate_0265 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0266
     * @tc.name      FilePreviewDLP_FormatDate_0266
     * @tc.desc      formatDate(year=1970, month=3, day=100) returns "1970-03-100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0266 begin`);
      const actual: string = formatDate(1970, 3, 100);
      logInfo(`formatDate(year=1970, month=3, day=100): actual=${actual}`);
      expect(actual).assertEqual('1970-03-100');
      logInfo(`${BUNDLE}FormatDate_0266 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_DATE_0267
     * @tc.name      FilePreviewDLP_FormatDate_0267
     * @tc.desc      formatDate(year=1970, month=10, day=28) returns "1970-10-28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatDate_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatDate_0267 begin`);
      const actual: string = formatDate(1970, 10, 28);
      logInfo(`formatDate(year=1970, month=10, day=28): actual=${actual}`);
      expect(actual).assertEqual('1970-10-28');
      logInfo(`${BUNDLE}FormatDate_0267 end`);
    });
  });
}
