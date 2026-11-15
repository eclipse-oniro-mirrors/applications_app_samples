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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { formatTime, getFileNameFromUrl } from 'multiplefilesdownload/src/main/ets/utils/formatTime';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_MultipleFilesDownload]';

export default function FormatTimeMatrixPart2Test(): void {
  describe('FormatTimeMatrixPart2', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_9100
     * @tc.name      testFormatTime0091
     * @tc.desc      Verify format 'D.M.YYYY' for local date component row 90.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0091 begin');
      const value: Date = new Date(2020, 0, 1, 10, 10, 0);
      expect(formatTime(value, 'D.M.YYYY')).assertEqual('1.1.2020');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0091 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_9200
     * @tc.name      testFormatTime0092
     * @tc.desc      Verify format 'mm:ss' for local date component row 91.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0092 begin');
      const value: Date = new Date(2020, 0, 1, 10, 10, 1);
      expect(formatTime(value, 'mm:ss')).assertEqual('10:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0092 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_9300
     * @tc.name      testFormatTime0093
     * @tc.desc      Verify format 'YYYY-MM-DD HH:mm' for local date component row 92.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0093 begin');
      const value: Date = new Date(2020, 0, 1, 10, 10, 9);
      expect(formatTime(value, 'YYYY-MM-DD HH:mm')).assertEqual('2020-01-01 10:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0093 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_9400
     * @tc.name      testFormatTime0094
     * @tc.desc      Verify format 'M月D日' for local date component row 93.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0094 begin');
      const value: Date = new Date(2020, 0, 1, 10, 10, 10);
      expect(formatTime(value, 'M月D日')).assertEqual('1月1日');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0094 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_9500
     * @tc.name      testFormatTime0095
     * @tc.desc      Verify format 'YY-MM-DD' for local date component row 94.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0095 begin');
      const value: Date = new Date(2020, 0, 1, 10, 10, 59);
      expect(formatTime(value, 'YY-MM-DD')).assertEqual('20-01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0095 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_9600
     * @tc.name      testFormatTime0096
     * @tc.desc      Verify format 'HH:mm:ss YYYY-MM-DD' for local date component row 95.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0096 begin');
      const value: Date = new Date(2020, 0, 1, 10, 59, 0);
      expect(formatTime(value, 'HH:mm:ss YYYY-MM-DD')).assertEqual('10:59:00 2020-01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0096 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_9700
     * @tc.name      testFormatTime0097
     * @tc.desc      Verify format 'YYYY/MM/DD HH:mm' for local date component row 96.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0097 begin');
      const value: Date = new Date(2020, 0, 1, 10, 59, 1);
      expect(formatTime(value, 'YYYY/MM/DD HH:mm')).assertEqual('2020/01/01 10:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0097 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_9800
     * @tc.name      testFormatTime0098
     * @tc.desc      Verify format 'M-D-YY' for local date component row 97.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0098 begin');
      const value: Date = new Date(2020, 0, 1, 10, 59, 9);
      expect(formatTime(value, 'M-D-YY')).assertEqual('1-1-20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0098 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_9900
     * @tc.name      testFormatTime0099
     * @tc.desc      Verify format 'YYYY.MM.DD' for local date component row 98.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0099 begin');
      const value: Date = new Date(2020, 0, 1, 10, 59, 10);
      expect(formatTime(value, 'YYYY.MM.DD')).assertEqual('2020.01.01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0099 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_10000
     * @tc.name      testFormatTime0100
     * @tc.desc      Verify format 'H:m:s' for local date component row 99.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0100 begin');
      const value: Date = new Date(2020, 0, 1, 10, 59, 59);
      expect(formatTime(value, 'H:m:s')).assertEqual('10:59:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0100 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_10100
     * @tc.name      testFormatTime0101
     * @tc.desc      Verify format 'YYYY-MM-DD' for local date component row 100.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0101 begin');
      const value: Date = new Date(2020, 0, 1, 12, 0, 0);
      expect(formatTime(value, 'YYYY-MM-DD')).assertEqual('2020-01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0101 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_10200
     * @tc.name      testFormatTime0102
     * @tc.desc      Verify format 'YY/M/D' for local date component row 101.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0102 begin');
      const value: Date = new Date(2020, 0, 1, 12, 0, 1);
      expect(formatTime(value, 'YY/M/D')).assertEqual('20/1/1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0102 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_10300
     * @tc.name      testFormatTime0103
     * @tc.desc      Verify format 'YYYY-MM-DD HH:mm:ss' for local date component row 102.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0103 begin');
      const value: Date = new Date(2020, 0, 1, 12, 0, 9);
      expect(formatTime(value, 'YYYY-MM-DD HH:mm:ss')).assertEqual('2020-01-01 12:00:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0103 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_10400
     * @tc.name      testFormatTime0104
     * @tc.desc      Verify format 'MM-DD' for local date component row 103.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0104 begin');
      const value: Date = new Date(2020, 0, 1, 12, 0, 10);
      expect(formatTime(value, 'MM-DD')).assertEqual('01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0104 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_10500
     * @tc.name      testFormatTime0105
     * @tc.desc      Verify format 'HH:mm' for local date component row 104.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0105 begin');
      const value: Date = new Date(2020, 0, 1, 12, 0, 59);
      expect(formatTime(value, 'HH:mm')).assertEqual('12:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0105 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_10600
     * @tc.name      testFormatTime0106
     * @tc.desc      Verify format 'YYYY年MM月DD日' for local date component row 105.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0106 begin');
      const value: Date = new Date(2020, 0, 1, 12, 5, 0);
      expect(formatTime(value, 'YYYY年MM月DD日')).assertEqual('2020年01月01日');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0106 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_10700
     * @tc.name      testFormatTime0107
     * @tc.desc      Verify format 'YYYYMMDD' for local date component row 106.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0107 begin');
      const value: Date = new Date(2020, 0, 1, 12, 5, 1);
      expect(formatTime(value, 'YYYYMMDD')).assertEqual('20200101');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0107 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_10800
     * @tc.name      testFormatTime0108
     * @tc.desc      Verify format 'M/D/YY' for local date component row 107.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0108 begin');
      const value: Date = new Date(2020, 0, 1, 12, 5, 9);
      expect(formatTime(value, 'M/D/YY')).assertEqual('1/1/20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0108 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_10900
     * @tc.name      testFormatTime0109
     * @tc.desc      Verify format 'HH:mm:ss' for local date component row 108.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0109 begin');
      const value: Date = new Date(2020, 0, 1, 12, 5, 10);
      expect(formatTime(value, 'HH:mm:ss')).assertEqual('12:05:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0109 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_11000
     * @tc.name      testFormatTime0110
     * @tc.desc      Verify format 'YYYY-MM-DDTHH:mm:ss' for local date component row 109.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0110 begin');
      const value: Date = new Date(2020, 0, 1, 12, 5, 59);
      expect(formatTime(value, 'YYYY-MM-DDTHH:mm:ss')).assertEqual('2020-01-01T12:05:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0110 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_11100
     * @tc.name      testFormatTime0111
     * @tc.desc      Verify format 'D.M.YYYY' for local date component row 110.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0111 begin');
      const value: Date = new Date(2020, 0, 1, 12, 9, 0);
      expect(formatTime(value, 'D.M.YYYY')).assertEqual('1.1.2020');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0111 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_11200
     * @tc.name      testFormatTime0112
     * @tc.desc      Verify format 'mm:ss' for local date component row 111.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0112 begin');
      const value: Date = new Date(2020, 0, 1, 12, 9, 1);
      expect(formatTime(value, 'mm:ss')).assertEqual('09:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0112 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_11300
     * @tc.name      testFormatTime0113
     * @tc.desc      Verify format 'YYYY-MM-DD HH:mm' for local date component row 112.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0113 begin');
      const value: Date = new Date(2020, 0, 1, 12, 9, 9);
      expect(formatTime(value, 'YYYY-MM-DD HH:mm')).assertEqual('2020-01-01 12:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0113 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_11400
     * @tc.name      testFormatTime0114
     * @tc.desc      Verify format 'M月D日' for local date component row 113.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0114 begin');
      const value: Date = new Date(2020, 0, 1, 12, 9, 10);
      expect(formatTime(value, 'M月D日')).assertEqual('1月1日');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0114 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_11500
     * @tc.name      testFormatTime0115
     * @tc.desc      Verify format 'YY-MM-DD' for local date component row 114.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0115 begin');
      const value: Date = new Date(2020, 0, 1, 12, 9, 59);
      expect(formatTime(value, 'YY-MM-DD')).assertEqual('20-01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0115 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_11600
     * @tc.name      testFormatTime0116
     * @tc.desc      Verify format 'HH:mm:ss YYYY-MM-DD' for local date component row 115.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0116 begin');
      const value: Date = new Date(2020, 0, 1, 12, 10, 0);
      expect(formatTime(value, 'HH:mm:ss YYYY-MM-DD')).assertEqual('12:10:00 2020-01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0116 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_11700
     * @tc.name      testFormatTime0117
     * @tc.desc      Verify format 'YYYY/MM/DD HH:mm' for local date component row 116.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0117 begin');
      const value: Date = new Date(2020, 0, 1, 12, 10, 1);
      expect(formatTime(value, 'YYYY/MM/DD HH:mm')).assertEqual('2020/01/01 12:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0117 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_11800
     * @tc.name      testFormatTime0118
     * @tc.desc      Verify format 'M-D-YY' for local date component row 117.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0118 begin');
      const value: Date = new Date(2020, 0, 1, 12, 10, 9);
      expect(formatTime(value, 'M-D-YY')).assertEqual('1-1-20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0118 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_11900
     * @tc.name      testFormatTime0119
     * @tc.desc      Verify format 'YYYY.MM.DD' for local date component row 118.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0119 begin');
      const value: Date = new Date(2020, 0, 1, 12, 10, 10);
      expect(formatTime(value, 'YYYY.MM.DD')).assertEqual('2020.01.01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0119 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_12000
     * @tc.name      testFormatTime0120
     * @tc.desc      Verify format 'H:m:s' for local date component row 119.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0120 begin');
      const value: Date = new Date(2020, 0, 1, 12, 10, 59);
      expect(formatTime(value, 'H:m:s')).assertEqual('12:10:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0120 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_12100
     * @tc.name      testFormatTime0121
     * @tc.desc      Verify format 'YYYY-MM-DD' for local date component row 120.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0121 begin');
      const value: Date = new Date(2020, 0, 1, 12, 59, 0);
      expect(formatTime(value, 'YYYY-MM-DD')).assertEqual('2020-01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0121 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_12200
     * @tc.name      testFormatTime0122
     * @tc.desc      Verify format 'YY/M/D' for local date component row 121.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0122 begin');
      const value: Date = new Date(2020, 0, 1, 12, 59, 1);
      expect(formatTime(value, 'YY/M/D')).assertEqual('20/1/1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0122 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_12300
     * @tc.name      testFormatTime0123
     * @tc.desc      Verify format 'YYYY-MM-DD HH:mm:ss' for local date component row 122.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0123 begin');
      const value: Date = new Date(2020, 0, 1, 12, 59, 9);
      expect(formatTime(value, 'YYYY-MM-DD HH:mm:ss')).assertEqual('2020-01-01 12:59:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0123 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_12400
     * @tc.name      testFormatTime0124
     * @tc.desc      Verify format 'MM-DD' for local date component row 123.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0124 begin');
      const value: Date = new Date(2020, 0, 1, 12, 59, 10);
      expect(formatTime(value, 'MM-DD')).assertEqual('01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0124 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_12500
     * @tc.name      testFormatTime0125
     * @tc.desc      Verify format 'HH:mm' for local date component row 124.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0125 begin');
      const value: Date = new Date(2020, 0, 1, 12, 59, 59);
      expect(formatTime(value, 'HH:mm')).assertEqual('12:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0125 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_12600
     * @tc.name      testFormatTime0126
     * @tc.desc      Verify format 'YYYY年MM月DD日' for local date component row 125.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0126 begin');
      const value: Date = new Date(2020, 0, 1, 23, 0, 0);
      expect(formatTime(value, 'YYYY年MM月DD日')).assertEqual('2020年01月01日');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0126 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_12700
     * @tc.name      testFormatTime0127
     * @tc.desc      Verify format 'YYYYMMDD' for local date component row 126.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0127 begin');
      const value: Date = new Date(2020, 0, 1, 23, 0, 1);
      expect(formatTime(value, 'YYYYMMDD')).assertEqual('20200101');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0127 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_12800
     * @tc.name      testFormatTime0128
     * @tc.desc      Verify format 'M/D/YY' for local date component row 127.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0128 begin');
      const value: Date = new Date(2020, 0, 1, 23, 0, 9);
      expect(formatTime(value, 'M/D/YY')).assertEqual('1/1/20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0128 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_12900
     * @tc.name      testFormatTime0129
     * @tc.desc      Verify format 'HH:mm:ss' for local date component row 128.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0129 begin');
      const value: Date = new Date(2020, 0, 1, 23, 0, 10);
      expect(formatTime(value, 'HH:mm:ss')).assertEqual('23:00:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0129 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_13000
     * @tc.name      testFormatTime0130
     * @tc.desc      Verify format 'YYYY-MM-DDTHH:mm:ss' for local date component row 129.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0130 begin');
      const value: Date = new Date(2020, 0, 1, 23, 0, 59);
      expect(formatTime(value, 'YYYY-MM-DDTHH:mm:ss')).assertEqual('2020-01-01T23:00:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0130 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_13100
     * @tc.name      testFormatTime0131
     * @tc.desc      Verify format 'D.M.YYYY' for local date component row 130.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0131 begin');
      const value: Date = new Date(2020, 0, 1, 23, 5, 0);
      expect(formatTime(value, 'D.M.YYYY')).assertEqual('1.1.2020');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0131 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_13200
     * @tc.name      testFormatTime0132
     * @tc.desc      Verify format 'mm:ss' for local date component row 131.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0132 begin');
      const value: Date = new Date(2020, 0, 1, 23, 5, 1);
      expect(formatTime(value, 'mm:ss')).assertEqual('05:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0132 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_13300
     * @tc.name      testFormatTime0133
     * @tc.desc      Verify format 'YYYY-MM-DD HH:mm' for local date component row 132.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0133 begin');
      const value: Date = new Date(2020, 0, 1, 23, 5, 9);
      expect(formatTime(value, 'YYYY-MM-DD HH:mm')).assertEqual('2020-01-01 23:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0133 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_13400
     * @tc.name      testFormatTime0134
     * @tc.desc      Verify format 'M月D日' for local date component row 133.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0134 begin');
      const value: Date = new Date(2020, 0, 1, 23, 5, 10);
      expect(formatTime(value, 'M月D日')).assertEqual('1月1日');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0134 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_13500
     * @tc.name      testFormatTime0135
     * @tc.desc      Verify format 'YY-MM-DD' for local date component row 134.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0135 begin');
      const value: Date = new Date(2020, 0, 1, 23, 5, 59);
      expect(formatTime(value, 'YY-MM-DD')).assertEqual('20-01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0135 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_13600
     * @tc.name      testFormatTime0136
     * @tc.desc      Verify format 'HH:mm:ss YYYY-MM-DD' for local date component row 135.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0136 begin');
      const value: Date = new Date(2020, 0, 1, 23, 9, 0);
      expect(formatTime(value, 'HH:mm:ss YYYY-MM-DD')).assertEqual('23:09:00 2020-01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0136 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_13700
     * @tc.name      testFormatTime0137
     * @tc.desc      Verify format 'YYYY/MM/DD HH:mm' for local date component row 136.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0137 begin');
      const value: Date = new Date(2020, 0, 1, 23, 9, 1);
      expect(formatTime(value, 'YYYY/MM/DD HH:mm')).assertEqual('2020/01/01 23:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0137 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_13800
     * @tc.name      testFormatTime0138
     * @tc.desc      Verify format 'M-D-YY' for local date component row 137.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0138 begin');
      const value: Date = new Date(2020, 0, 1, 23, 9, 9);
      expect(formatTime(value, 'M-D-YY')).assertEqual('1-1-20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0138 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_13900
     * @tc.name      testFormatTime0139
     * @tc.desc      Verify format 'YYYY.MM.DD' for local date component row 138.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0139 begin');
      const value: Date = new Date(2020, 0, 1, 23, 9, 10);
      expect(formatTime(value, 'YYYY.MM.DD')).assertEqual('2020.01.01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0139 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_14000
     * @tc.name      testFormatTime0140
     * @tc.desc      Verify format 'H:m:s' for local date component row 139.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0140 begin');
      const value: Date = new Date(2020, 0, 1, 23, 9, 59);
      expect(formatTime(value, 'H:m:s')).assertEqual('23:9:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0140 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_14100
     * @tc.name      testFormatTime0141
     * @tc.desc      Verify format 'YYYY-MM-DD' for local date component row 140.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0141 begin');
      const value: Date = new Date(2020, 0, 1, 23, 10, 0);
      expect(formatTime(value, 'YYYY-MM-DD')).assertEqual('2020-01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0141 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_14200
     * @tc.name      testFormatTime0142
     * @tc.desc      Verify format 'YY/M/D' for local date component row 141.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0142 begin');
      const value: Date = new Date(2020, 0, 1, 23, 10, 1);
      expect(formatTime(value, 'YY/M/D')).assertEqual('20/1/1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0142 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_14300
     * @tc.name      testFormatTime0143
     * @tc.desc      Verify format 'YYYY-MM-DD HH:mm:ss' for local date component row 142.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0143 begin');
      const value: Date = new Date(2020, 0, 1, 23, 10, 9);
      expect(formatTime(value, 'YYYY-MM-DD HH:mm:ss')).assertEqual('2020-01-01 23:10:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0143 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_14400
     * @tc.name      testFormatTime0144
     * @tc.desc      Verify format 'MM-DD' for local date component row 143.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0144 begin');
      const value: Date = new Date(2020, 0, 1, 23, 10, 10);
      expect(formatTime(value, 'MM-DD')).assertEqual('01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0144 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_14500
     * @tc.name      testFormatTime0145
     * @tc.desc      Verify format 'HH:mm' for local date component row 144.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0145 begin');
      const value: Date = new Date(2020, 0, 1, 23, 10, 59);
      expect(formatTime(value, 'HH:mm')).assertEqual('23:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0145 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_14600
     * @tc.name      testFormatTime0146
     * @tc.desc      Verify format 'YYYY年MM月DD日' for local date component row 145.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0146 begin');
      const value: Date = new Date(2020, 0, 1, 23, 59, 0);
      expect(formatTime(value, 'YYYY年MM月DD日')).assertEqual('2020年01月01日');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0146 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_14700
     * @tc.name      testFormatTime0147
     * @tc.desc      Verify format 'YYYYMMDD' for local date component row 146.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0147 begin');
      const value: Date = new Date(2020, 0, 1, 23, 59, 1);
      expect(formatTime(value, 'YYYYMMDD')).assertEqual('20200101');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0147 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_14800
     * @tc.name      testFormatTime0148
     * @tc.desc      Verify format 'M/D/YY' for local date component row 147.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0148 begin');
      const value: Date = new Date(2020, 0, 1, 23, 59, 9);
      expect(formatTime(value, 'M/D/YY')).assertEqual('1/1/20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0148 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_14900
     * @tc.name      testFormatTime0149
     * @tc.desc      Verify format 'HH:mm:ss' for local date component row 148.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0149 begin');
      const value: Date = new Date(2020, 0, 1, 23, 59, 10);
      expect(formatTime(value, 'HH:mm:ss')).assertEqual('23:59:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0149 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_15000
     * @tc.name      testFormatTime0150
     * @tc.desc      Verify format 'YYYY-MM-DDTHH:mm:ss' for local date component row 149.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0150 begin');
      const value: Date = new Date(2020, 0, 1, 23, 59, 59);
      expect(formatTime(value, 'YYYY-MM-DDTHH:mm:ss')).assertEqual('2020-01-01T23:59:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0150 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_15100
     * @tc.name      testFormatTime0151
     * @tc.desc      Verify format 'D.M.YYYY' for local date component row 150.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0151 begin');
      const value: Date = new Date(2020, 0, 2, 0, 0, 0);
      expect(formatTime(value, 'D.M.YYYY')).assertEqual('2.1.2020');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0151 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_15200
     * @tc.name      testFormatTime0152
     * @tc.desc      Verify format 'mm:ss' for local date component row 151.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0152 begin');
      const value: Date = new Date(2020, 0, 2, 0, 0, 1);
      expect(formatTime(value, 'mm:ss')).assertEqual('00:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0152 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_15300
     * @tc.name      testFormatTime0153
     * @tc.desc      Verify format 'YYYY-MM-DD HH:mm' for local date component row 152.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0153 begin');
      const value: Date = new Date(2020, 0, 2, 0, 0, 9);
      expect(formatTime(value, 'YYYY-MM-DD HH:mm')).assertEqual('2020-01-02 00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0153 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_15400
     * @tc.name      testFormatTime0154
     * @tc.desc      Verify format 'M月D日' for local date component row 153.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0154 begin');
      const value: Date = new Date(2020, 0, 2, 0, 0, 10);
      expect(formatTime(value, 'M月D日')).assertEqual('1月2日');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0154 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_15500
     * @tc.name      testFormatTime0155
     * @tc.desc      Verify format 'YY-MM-DD' for local date component row 154.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0155 begin');
      const value: Date = new Date(2020, 0, 2, 0, 0, 59);
      expect(formatTime(value, 'YY-MM-DD')).assertEqual('20-01-02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0155 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_15600
     * @tc.name      testFormatTime0156
     * @tc.desc      Verify format 'HH:mm:ss YYYY-MM-DD' for local date component row 155.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0156 begin');
      const value: Date = new Date(2020, 0, 2, 0, 5, 0);
      expect(formatTime(value, 'HH:mm:ss YYYY-MM-DD')).assertEqual('00:05:00 2020-01-02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0156 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_15700
     * @tc.name      testFormatTime0157
     * @tc.desc      Verify format 'YYYY/MM/DD HH:mm' for local date component row 156.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0157 begin');
      const value: Date = new Date(2020, 0, 2, 0, 5, 1);
      expect(formatTime(value, 'YYYY/MM/DD HH:mm')).assertEqual('2020/01/02 00:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0157 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_15800
     * @tc.name      testFormatTime0158
     * @tc.desc      Verify format 'M-D-YY' for local date component row 157.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0158 begin');
      const value: Date = new Date(2020, 0, 2, 0, 5, 9);
      expect(formatTime(value, 'M-D-YY')).assertEqual('1-2-20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0158 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_15900
     * @tc.name      testFormatTime0159
     * @tc.desc      Verify format 'YYYY.MM.DD' for local date component row 158.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0159 begin');
      const value: Date = new Date(2020, 0, 2, 0, 5, 10);
      expect(formatTime(value, 'YYYY.MM.DD')).assertEqual('2020.01.02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0159 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_16000
     * @tc.name      testFormatTime0160
     * @tc.desc      Verify format 'H:m:s' for local date component row 159.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0160 begin');
      const value: Date = new Date(2020, 0, 2, 0, 5, 59);
      expect(formatTime(value, 'H:m:s')).assertEqual('0:5:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0160 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_16100
     * @tc.name      testFormatTime0161
     * @tc.desc      Verify format 'YYYY-MM-DD' for local date component row 160.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0161 begin');
      const value: Date = new Date(2020, 0, 2, 0, 9, 0);
      expect(formatTime(value, 'YYYY-MM-DD')).assertEqual('2020-01-02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0161 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_16200
     * @tc.name      testFormatTime0162
     * @tc.desc      Verify format 'YY/M/D' for local date component row 161.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0162 begin');
      const value: Date = new Date(2020, 0, 2, 0, 9, 1);
      expect(formatTime(value, 'YY/M/D')).assertEqual('20/1/2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0162 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_16300
     * @tc.name      testFormatTime0163
     * @tc.desc      Verify format 'YYYY-MM-DD HH:mm:ss' for local date component row 162.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0163 begin');
      const value: Date = new Date(2020, 0, 2, 0, 9, 9);
      expect(formatTime(value, 'YYYY-MM-DD HH:mm:ss')).assertEqual('2020-01-02 00:09:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0163 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_16400
     * @tc.name      testFormatTime0164
     * @tc.desc      Verify format 'MM-DD' for local date component row 163.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0164 begin');
      const value: Date = new Date(2020, 0, 2, 0, 9, 10);
      expect(formatTime(value, 'MM-DD')).assertEqual('01-02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0164 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_16500
     * @tc.name      testFormatTime0165
     * @tc.desc      Verify format 'HH:mm' for local date component row 164.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0165 begin');
      const value: Date = new Date(2020, 0, 2, 0, 9, 59);
      expect(formatTime(value, 'HH:mm')).assertEqual('00:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0165 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_16600
     * @tc.name      testFormatTime0166
     * @tc.desc      Verify format 'YYYY年MM月DD日' for local date component row 165.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0166 begin');
      const value: Date = new Date(2020, 0, 2, 0, 10, 0);
      expect(formatTime(value, 'YYYY年MM月DD日')).assertEqual('2020年01月02日');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0166 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_16700
     * @tc.name      testFormatTime0167
     * @tc.desc      Verify format 'YYYYMMDD' for local date component row 166.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0167 begin');
      const value: Date = new Date(2020, 0, 2, 0, 10, 1);
      expect(formatTime(value, 'YYYYMMDD')).assertEqual('20200102');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0167 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_16800
     * @tc.name      testFormatTime0168
     * @tc.desc      Verify format 'M/D/YY' for local date component row 167.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0168 begin');
      const value: Date = new Date(2020, 0, 2, 0, 10, 9);
      expect(formatTime(value, 'M/D/YY')).assertEqual('1/2/20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0168 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_16900
     * @tc.name      testFormatTime0169
     * @tc.desc      Verify format 'HH:mm:ss' for local date component row 168.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0169 begin');
      const value: Date = new Date(2020, 0, 2, 0, 10, 10);
      expect(formatTime(value, 'HH:mm:ss')).assertEqual('00:10:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0169 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_17000
     * @tc.name      testFormatTime0170
     * @tc.desc      Verify format 'YYYY-MM-DDTHH:mm:ss' for local date component row 169.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0170 begin');
      const value: Date = new Date(2020, 0, 2, 0, 10, 59);
      expect(formatTime(value, 'YYYY-MM-DDTHH:mm:ss')).assertEqual('2020-01-02T00:10:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0170 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_17100
     * @tc.name      testFormatTime0171
     * @tc.desc      Verify format 'D.M.YYYY' for local date component row 170.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0171 begin');
      const value: Date = new Date(2020, 0, 2, 0, 59, 0);
      expect(formatTime(value, 'D.M.YYYY')).assertEqual('2.1.2020');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0171 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_17200
     * @tc.name      testFormatTime0172
     * @tc.desc      Verify format 'mm:ss' for local date component row 171.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0172 begin');
      const value: Date = new Date(2020, 0, 2, 0, 59, 1);
      expect(formatTime(value, 'mm:ss')).assertEqual('59:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0172 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_17300
     * @tc.name      testFormatTime0173
     * @tc.desc      Verify format 'YYYY-MM-DD HH:mm' for local date component row 172.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0173 begin');
      const value: Date = new Date(2020, 0, 2, 0, 59, 9);
      expect(formatTime(value, 'YYYY-MM-DD HH:mm')).assertEqual('2020-01-02 00:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0173 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_17400
     * @tc.name      testFormatTime0174
     * @tc.desc      Verify format 'M月D日' for local date component row 173.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0174 begin');
      const value: Date = new Date(2020, 0, 2, 0, 59, 10);
      expect(formatTime(value, 'M月D日')).assertEqual('1月2日');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0174 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_17500
     * @tc.name      testFormatTime0175
     * @tc.desc      Verify format 'YY-MM-DD' for local date component row 174.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0175 begin');
      const value: Date = new Date(2020, 0, 2, 0, 59, 59);
      expect(formatTime(value, 'YY-MM-DD')).assertEqual('20-01-02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0175 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_17600
     * @tc.name      testFormatTime0176
     * @tc.desc      Verify format 'HH:mm:ss YYYY-MM-DD' for local date component row 175.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0176 begin');
      const value: Date = new Date(2020, 0, 2, 1, 0, 0);
      expect(formatTime(value, 'HH:mm:ss YYYY-MM-DD')).assertEqual('01:00:00 2020-01-02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0176 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_17700
     * @tc.name      testFormatTime0177
     * @tc.desc      Verify format 'YYYY/MM/DD HH:mm' for local date component row 176.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0177 begin');
      const value: Date = new Date(2020, 0, 2, 1, 0, 1);
      expect(formatTime(value, 'YYYY/MM/DD HH:mm')).assertEqual('2020/01/02 01:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0177 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_17800
     * @tc.name      testFormatTime0178
     * @tc.desc      Verify format 'M-D-YY' for local date component row 177.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0178 begin');
      const value: Date = new Date(2020, 0, 2, 1, 0, 9);
      expect(formatTime(value, 'M-D-YY')).assertEqual('1-2-20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0178 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_17900
     * @tc.name      testFormatTime0179
     * @tc.desc      Verify format 'YYYY.MM.DD' for local date component row 178.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0179 begin');
      const value: Date = new Date(2020, 0, 2, 1, 0, 10);
      expect(formatTime(value, 'YYYY.MM.DD')).assertEqual('2020.01.02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0179 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP2_18000
     * @tc.name      testFormatTime0180
     * @tc.desc      Verify format 'H:m:s' for local date component row 179.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0180 begin');
      const value: Date = new Date(2020, 0, 2, 1, 0, 59);
      expect(formatTime(value, 'H:m:s')).assertEqual('1:0:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0180 end');
    })

  })
}
