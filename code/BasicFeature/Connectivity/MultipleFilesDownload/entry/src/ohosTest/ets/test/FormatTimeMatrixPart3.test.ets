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

export default function FormatTimeMatrixPart3Test(): void {
  describe('FormatTimeMatrixPart3', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_18100
     * @tc.name      testFormatTime0181
     * @tc.desc      Verify format 'YYYY-MM-DD' for local date component row 180.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0181 begin');
      const value: Date = new Date(2020, 0, 2, 1, 5, 0);
      expect(formatTime(value, 'YYYY-MM-DD')).assertEqual('2020-01-02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0181 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_18200
     * @tc.name      testFormatTime0182
     * @tc.desc      Verify format 'YY/M/D' for local date component row 181.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0182 begin');
      const value: Date = new Date(2020, 0, 2, 1, 5, 1);
      expect(formatTime(value, 'YY/M/D')).assertEqual('20/1/2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0182 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_18300
     * @tc.name      testFormatTime0183
     * @tc.desc      Verify format 'YYYY-MM-DD HH:mm:ss' for local date component row 182.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0183 begin');
      const value: Date = new Date(2020, 0, 2, 1, 5, 9);
      expect(formatTime(value, 'YYYY-MM-DD HH:mm:ss')).assertEqual('2020-01-02 01:05:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0183 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_18400
     * @tc.name      testFormatTime0184
     * @tc.desc      Verify format 'MM-DD' for local date component row 183.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0184 begin');
      const value: Date = new Date(2020, 0, 2, 1, 5, 10);
      expect(formatTime(value, 'MM-DD')).assertEqual('01-02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0184 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_18500
     * @tc.name      testFormatTime0185
     * @tc.desc      Verify format 'HH:mm' for local date component row 184.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0185 begin');
      const value: Date = new Date(2020, 0, 2, 1, 5, 59);
      expect(formatTime(value, 'HH:mm')).assertEqual('01:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0185 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_18600
     * @tc.name      testFormatTime0186
     * @tc.desc      Verify format 'YYYY年MM月DD日' for local date component row 185.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0186 begin');
      const value: Date = new Date(2020, 0, 2, 1, 9, 0);
      expect(formatTime(value, 'YYYY年MM月DD日')).assertEqual('2020年01月02日');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0186 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_18700
     * @tc.name      testFormatTime0187
     * @tc.desc      Verify format 'YYYYMMDD' for local date component row 186.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0187 begin');
      const value: Date = new Date(2020, 0, 2, 1, 9, 1);
      expect(formatTime(value, 'YYYYMMDD')).assertEqual('20200102');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0187 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_18800
     * @tc.name      testFormatTime0188
     * @tc.desc      Verify format 'M/D/YY' for local date component row 187.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0188 begin');
      const value: Date = new Date(2020, 0, 2, 1, 9, 9);
      expect(formatTime(value, 'M/D/YY')).assertEqual('1/2/20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0188 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_18900
     * @tc.name      testFormatTime0189
     * @tc.desc      Verify format 'HH:mm:ss' for local date component row 188.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0189 begin');
      const value: Date = new Date(2020, 0, 2, 1, 9, 10);
      expect(formatTime(value, 'HH:mm:ss')).assertEqual('01:09:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0189 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_19000
     * @tc.name      testFormatTime0190
     * @tc.desc      Verify format 'YYYY-MM-DDTHH:mm:ss' for local date component row 189.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0190 begin');
      const value: Date = new Date(2020, 0, 2, 1, 9, 59);
      expect(formatTime(value, 'YYYY-MM-DDTHH:mm:ss')).assertEqual('2020-01-02T01:09:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0190 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_19100
     * @tc.name      testFormatTime0191
     * @tc.desc      Verify format 'D.M.YYYY' for local date component row 190.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0191 begin');
      const value: Date = new Date(2020, 0, 2, 1, 10, 0);
      expect(formatTime(value, 'D.M.YYYY')).assertEqual('2.1.2020');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0191 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_19200
     * @tc.name      testFormatTime0192
     * @tc.desc      Verify format 'mm:ss' for local date component row 191.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0192 begin');
      const value: Date = new Date(2020, 0, 2, 1, 10, 1);
      expect(formatTime(value, 'mm:ss')).assertEqual('10:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0192 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_19300
     * @tc.name      testFormatTime0193
     * @tc.desc      Verify format 'YYYY-MM-DD HH:mm' for local date component row 192.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0193 begin');
      const value: Date = new Date(2020, 0, 2, 1, 10, 9);
      expect(formatTime(value, 'YYYY-MM-DD HH:mm')).assertEqual('2020-01-02 01:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0193 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_19400
     * @tc.name      testFormatTime0194
     * @tc.desc      Verify format 'M月D日' for local date component row 193.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0194 begin');
      const value: Date = new Date(2020, 0, 2, 1, 10, 10);
      expect(formatTime(value, 'M月D日')).assertEqual('1月2日');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0194 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_19500
     * @tc.name      testFormatTime0195
     * @tc.desc      Verify format 'YY-MM-DD' for local date component row 194.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0195 begin');
      const value: Date = new Date(2020, 0, 2, 1, 10, 59);
      expect(formatTime(value, 'YY-MM-DD')).assertEqual('20-01-02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0195 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_19600
     * @tc.name      testFormatTime0196
     * @tc.desc      Verify format 'HH:mm:ss YYYY-MM-DD' for local date component row 195.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0196 begin');
      const value: Date = new Date(2020, 0, 2, 1, 59, 0);
      expect(formatTime(value, 'HH:mm:ss YYYY-MM-DD')).assertEqual('01:59:00 2020-01-02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0196 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_19700
     * @tc.name      testFormatTime0197
     * @tc.desc      Verify format 'YYYY/MM/DD HH:mm' for local date component row 196.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0197 begin');
      const value: Date = new Date(2020, 0, 2, 1, 59, 1);
      expect(formatTime(value, 'YYYY/MM/DD HH:mm')).assertEqual('2020/01/02 01:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0197 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_19800
     * @tc.name      testFormatTime0198
     * @tc.desc      Verify format 'M-D-YY' for local date component row 197.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0198 begin');
      const value: Date = new Date(2020, 0, 2, 1, 59, 9);
      expect(formatTime(value, 'M-D-YY')).assertEqual('1-2-20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0198 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_19900
     * @tc.name      testFormatTime0199
     * @tc.desc      Verify format 'YYYY.MM.DD' for local date component row 198.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0199 begin');
      const value: Date = new Date(2020, 0, 2, 1, 59, 10);
      expect(formatTime(value, 'YYYY.MM.DD')).assertEqual('2020.01.02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0199 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_20000
     * @tc.name      testFormatTime0200
     * @tc.desc      Verify format 'H:m:s' for local date component row 199.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0200 begin');
      const value: Date = new Date(2020, 0, 2, 1, 59, 59);
      expect(formatTime(value, 'H:m:s')).assertEqual('1:59:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0200 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_20100
     * @tc.name      testFormatTime0201
     * @tc.desc      Verify format 'YYYY-MM-DD' for local date component row 200.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0201 begin');
      const value: Date = new Date(2020, 0, 2, 9, 0, 0);
      expect(formatTime(value, 'YYYY-MM-DD')).assertEqual('2020-01-02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0201 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_20200
     * @tc.name      testFormatTime0202
     * @tc.desc      Verify format 'YY/M/D' for local date component row 201.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0202 begin');
      const value: Date = new Date(2020, 0, 2, 9, 0, 1);
      expect(formatTime(value, 'YY/M/D')).assertEqual('20/1/2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0202 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_20300
     * @tc.name      testFormatTime0203
     * @tc.desc      Verify format 'YYYY-MM-DD HH:mm:ss' for local date component row 202.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0203 begin');
      const value: Date = new Date(2020, 0, 2, 9, 0, 9);
      expect(formatTime(value, 'YYYY-MM-DD HH:mm:ss')).assertEqual('2020-01-02 09:00:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0203 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_20400
     * @tc.name      testFormatTime0204
     * @tc.desc      Verify format 'MM-DD' for local date component row 203.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0204 begin');
      const value: Date = new Date(2020, 0, 2, 9, 0, 10);
      expect(formatTime(value, 'MM-DD')).assertEqual('01-02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0204 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_20500
     * @tc.name      testFormatTime0205
     * @tc.desc      Verify format 'HH:mm' for local date component row 204.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0205 begin');
      const value: Date = new Date(2020, 0, 2, 9, 0, 59);
      expect(formatTime(value, 'HH:mm')).assertEqual('09:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0205 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_20600
     * @tc.name      testFormatTime0206
     * @tc.desc      Verify format 'YYYY年MM月DD日' for local date component row 205.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0206 begin');
      const value: Date = new Date(2020, 0, 2, 9, 5, 0);
      expect(formatTime(value, 'YYYY年MM月DD日')).assertEqual('2020年01月02日');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0206 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_20700
     * @tc.name      testFormatTime0207
     * @tc.desc      Verify format 'YYYYMMDD' for local date component row 206.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0207 begin');
      const value: Date = new Date(2020, 0, 2, 9, 5, 1);
      expect(formatTime(value, 'YYYYMMDD')).assertEqual('20200102');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0207 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_20800
     * @tc.name      testFormatTime0208
     * @tc.desc      Verify format 'M/D/YY' for local date component row 207.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0208 begin');
      const value: Date = new Date(2020, 0, 2, 9, 5, 9);
      expect(formatTime(value, 'M/D/YY')).assertEqual('1/2/20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0208 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_20900
     * @tc.name      testFormatTime0209
     * @tc.desc      Verify format 'HH:mm:ss' for local date component row 208.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0209 begin');
      const value: Date = new Date(2020, 0, 2, 9, 5, 10);
      expect(formatTime(value, 'HH:mm:ss')).assertEqual('09:05:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0209 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_21000
     * @tc.name      testFormatTime0210
     * @tc.desc      Verify format 'YYYY-MM-DDTHH:mm:ss' for local date component row 209.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0210 begin');
      const value: Date = new Date(2020, 0, 2, 9, 5, 59);
      expect(formatTime(value, 'YYYY-MM-DDTHH:mm:ss')).assertEqual('2020-01-02T09:05:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0210 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_21100
     * @tc.name      testFormatTime0211
     * @tc.desc      Verify format 'D.M.YYYY' for local date component row 210.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0211 begin');
      const value: Date = new Date(2020, 0, 2, 9, 9, 0);
      expect(formatTime(value, 'D.M.YYYY')).assertEqual('2.1.2020');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0211 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_21200
     * @tc.name      testFormatTime0212
     * @tc.desc      Verify format 'mm:ss' for local date component row 211.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0212 begin');
      const value: Date = new Date(2020, 0, 2, 9, 9, 1);
      expect(formatTime(value, 'mm:ss')).assertEqual('09:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0212 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_21300
     * @tc.name      testFormatTime0213
     * @tc.desc      Verify format 'YYYY-MM-DD HH:mm' for local date component row 212.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0213 begin');
      const value: Date = new Date(2020, 0, 2, 9, 9, 9);
      expect(formatTime(value, 'YYYY-MM-DD HH:mm')).assertEqual('2020-01-02 09:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0213 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_21400
     * @tc.name      testFormatTime0214
     * @tc.desc      Verify format 'M月D日' for local date component row 213.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0214 begin');
      const value: Date = new Date(2020, 0, 2, 9, 9, 10);
      expect(formatTime(value, 'M月D日')).assertEqual('1月2日');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0214 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_21500
     * @tc.name      testFormatTime0215
     * @tc.desc      Verify format 'YY-MM-DD' for local date component row 214.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0215 begin');
      const value: Date = new Date(2020, 0, 2, 9, 9, 59);
      expect(formatTime(value, 'YY-MM-DD')).assertEqual('20-01-02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0215 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_21600
     * @tc.name      testFormatTime0216
     * @tc.desc      Verify format 'HH:mm:ss YYYY-MM-DD' for local date component row 215.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0216 begin');
      const value: Date = new Date(2020, 0, 2, 9, 10, 0);
      expect(formatTime(value, 'HH:mm:ss YYYY-MM-DD')).assertEqual('09:10:00 2020-01-02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0216 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_21700
     * @tc.name      testFormatTime0217
     * @tc.desc      Verify format 'YYYY/MM/DD HH:mm' for local date component row 216.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0217 begin');
      const value: Date = new Date(2020, 0, 2, 9, 10, 1);
      expect(formatTime(value, 'YYYY/MM/DD HH:mm')).assertEqual('2020/01/02 09:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0217 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_21800
     * @tc.name      testFormatTime0218
     * @tc.desc      Verify format 'M-D-YY' for local date component row 217.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0218 begin');
      const value: Date = new Date(2020, 0, 2, 9, 10, 9);
      expect(formatTime(value, 'M-D-YY')).assertEqual('1-2-20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0218 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_21900
     * @tc.name      testFormatTime0219
     * @tc.desc      Verify format 'YYYY.MM.DD' for local date component row 218.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0219 begin');
      const value: Date = new Date(2020, 0, 2, 9, 10, 10);
      expect(formatTime(value, 'YYYY.MM.DD')).assertEqual('2020.01.02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0219 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_22000
     * @tc.name      testFormatTime0220
     * @tc.desc      Verify format 'H:m:s' for local date component row 219.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0220 begin');
      const value: Date = new Date(2020, 0, 2, 9, 10, 59);
      expect(formatTime(value, 'H:m:s')).assertEqual('9:10:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0220 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_22100
     * @tc.name      testFormatTime0221
     * @tc.desc      Verify format 'YYYY-MM-DD' for local date component row 220.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0221 begin');
      const value: Date = new Date(2020, 0, 2, 9, 59, 0);
      expect(formatTime(value, 'YYYY-MM-DD')).assertEqual('2020-01-02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0221 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_22200
     * @tc.name      testFormatTime0222
     * @tc.desc      Verify format 'YY/M/D' for local date component row 221.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0222 begin');
      const value: Date = new Date(2020, 0, 2, 9, 59, 1);
      expect(formatTime(value, 'YY/M/D')).assertEqual('20/1/2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0222 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_22300
     * @tc.name      testFormatTime0223
     * @tc.desc      Verify format 'YYYY-MM-DD HH:mm:ss' for local date component row 222.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0223 begin');
      const value: Date = new Date(2020, 0, 2, 9, 59, 9);
      expect(formatTime(value, 'YYYY-MM-DD HH:mm:ss')).assertEqual('2020-01-02 09:59:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0223 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_22400
     * @tc.name      testFormatTime0224
     * @tc.desc      Verify format 'MM-DD' for local date component row 223.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0224 begin');
      const value: Date = new Date(2020, 0, 2, 9, 59, 10);
      expect(formatTime(value, 'MM-DD')).assertEqual('01-02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0224 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_22500
     * @tc.name      testFormatTime0225
     * @tc.desc      Verify format 'HH:mm' for local date component row 224.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0225 begin');
      const value: Date = new Date(2020, 0, 2, 9, 59, 59);
      expect(formatTime(value, 'HH:mm')).assertEqual('09:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0225 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_22600
     * @tc.name      testFormatTime0226
     * @tc.desc      Verify format 'YYYY年MM月DD日' for local date component row 225.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0226 begin');
      const value: Date = new Date(2020, 0, 2, 10, 0, 0);
      expect(formatTime(value, 'YYYY年MM月DD日')).assertEqual('2020年01月02日');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0226 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_22700
     * @tc.name      testFormatTime0227
     * @tc.desc      Verify format 'YYYYMMDD' for local date component row 226.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0227 begin');
      const value: Date = new Date(2020, 0, 2, 10, 0, 1);
      expect(formatTime(value, 'YYYYMMDD')).assertEqual('20200102');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0227 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_22800
     * @tc.name      testFormatTime0228
     * @tc.desc      Verify format 'M/D/YY' for local date component row 227.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0228 begin');
      const value: Date = new Date(2020, 0, 2, 10, 0, 9);
      expect(formatTime(value, 'M/D/YY')).assertEqual('1/2/20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0228 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_22900
     * @tc.name      testFormatTime0229
     * @tc.desc      Verify format 'HH:mm:ss' for local date component row 228.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0229 begin');
      const value: Date = new Date(2020, 0, 2, 10, 0, 10);
      expect(formatTime(value, 'HH:mm:ss')).assertEqual('10:00:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0229 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_23000
     * @tc.name      testFormatTime0230
     * @tc.desc      Verify format 'YYYY-MM-DDTHH:mm:ss' for local date component row 229.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0230 begin');
      const value: Date = new Date(2020, 0, 2, 10, 0, 59);
      expect(formatTime(value, 'YYYY-MM-DDTHH:mm:ss')).assertEqual('2020-01-02T10:00:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0230 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_23100
     * @tc.name      testFormatTime0231
     * @tc.desc      Verify format 'D.M.YYYY' for local date component row 230.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0231 begin');
      const value: Date = new Date(2020, 0, 2, 10, 5, 0);
      expect(formatTime(value, 'D.M.YYYY')).assertEqual('2.1.2020');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0231 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_23200
     * @tc.name      testFormatTime0232
     * @tc.desc      Verify format 'mm:ss' for local date component row 231.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0232 begin');
      const value: Date = new Date(2020, 0, 2, 10, 5, 1);
      expect(formatTime(value, 'mm:ss')).assertEqual('05:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0232 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_23300
     * @tc.name      testFormatTime0233
     * @tc.desc      Verify format 'YYYY-MM-DD HH:mm' for local date component row 232.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0233 begin');
      const value: Date = new Date(2020, 0, 2, 10, 5, 9);
      expect(formatTime(value, 'YYYY-MM-DD HH:mm')).assertEqual('2020-01-02 10:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0233 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_23400
     * @tc.name      testFormatTime0234
     * @tc.desc      Verify format 'M月D日' for local date component row 233.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0234 begin');
      const value: Date = new Date(2020, 0, 2, 10, 5, 10);
      expect(formatTime(value, 'M月D日')).assertEqual('1月2日');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0234 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_23500
     * @tc.name      testFormatTime0235
     * @tc.desc      Verify format 'YY-MM-DD' for local date component row 234.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0235 begin');
      const value: Date = new Date(2020, 0, 2, 10, 5, 59);
      expect(formatTime(value, 'YY-MM-DD')).assertEqual('20-01-02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0235 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_23600
     * @tc.name      testFormatTime0236
     * @tc.desc      Verify format 'HH:mm:ss YYYY-MM-DD' for local date component row 235.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0236 begin');
      const value: Date = new Date(2020, 0, 2, 10, 9, 0);
      expect(formatTime(value, 'HH:mm:ss YYYY-MM-DD')).assertEqual('10:09:00 2020-01-02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0236 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_23700
     * @tc.name      testFormatTime0237
     * @tc.desc      Verify format 'YYYY/MM/DD HH:mm' for local date component row 236.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0237 begin');
      const value: Date = new Date(2020, 0, 2, 10, 9, 1);
      expect(formatTime(value, 'YYYY/MM/DD HH:mm')).assertEqual('2020/01/02 10:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0237 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_23800
     * @tc.name      testFormatTime0238
     * @tc.desc      Verify format 'M-D-YY' for local date component row 237.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0238 begin');
      const value: Date = new Date(2020, 0, 2, 10, 9, 9);
      expect(formatTime(value, 'M-D-YY')).assertEqual('1-2-20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0238 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_23900
     * @tc.name      testFormatTime0239
     * @tc.desc      Verify format 'YYYY.MM.DD' for local date component row 238.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0239 begin');
      const value: Date = new Date(2020, 0, 2, 10, 9, 10);
      expect(formatTime(value, 'YYYY.MM.DD')).assertEqual('2020.01.02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0239 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_24000
     * @tc.name      testFormatTime0240
     * @tc.desc      Verify format 'H:m:s' for local date component row 239.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0240 begin');
      const value: Date = new Date(2020, 0, 2, 10, 9, 59);
      expect(formatTime(value, 'H:m:s')).assertEqual('10:9:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0240 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_24100
     * @tc.name      testFormatTime0241
     * @tc.desc      Verify format 'YYYY-MM-DD' for local date component row 240.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0241 begin');
      const value: Date = new Date(2020, 0, 2, 10, 10, 0);
      expect(formatTime(value, 'YYYY-MM-DD')).assertEqual('2020-01-02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0241 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_24200
     * @tc.name      testFormatTime0242
     * @tc.desc      Verify format 'YY/M/D' for local date component row 241.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0242 begin');
      const value: Date = new Date(2020, 0, 2, 10, 10, 1);
      expect(formatTime(value, 'YY/M/D')).assertEqual('20/1/2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0242 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_24300
     * @tc.name      testFormatTime0243
     * @tc.desc      Verify format 'YYYY-MM-DD HH:mm:ss' for local date component row 242.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0243 begin');
      const value: Date = new Date(2020, 0, 2, 10, 10, 9);
      expect(formatTime(value, 'YYYY-MM-DD HH:mm:ss')).assertEqual('2020-01-02 10:10:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0243 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_24400
     * @tc.name      testFormatTime0244
     * @tc.desc      Verify format 'MM-DD' for local date component row 243.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0244 begin');
      const value: Date = new Date(2020, 0, 2, 10, 10, 10);
      expect(formatTime(value, 'MM-DD')).assertEqual('01-02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0244 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_24500
     * @tc.name      testFormatTime0245
     * @tc.desc      Verify format 'HH:mm' for local date component row 244.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0245 begin');
      const value: Date = new Date(2020, 0, 2, 10, 10, 59);
      expect(formatTime(value, 'HH:mm')).assertEqual('10:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0245 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_24600
     * @tc.name      testFormatTime0246
     * @tc.desc      Verify format 'YYYY年MM月DD日' for local date component row 245.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0246 begin');
      const value: Date = new Date(2020, 0, 2, 10, 59, 0);
      expect(formatTime(value, 'YYYY年MM月DD日')).assertEqual('2020年01月02日');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0246 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_24700
     * @tc.name      testFormatTime0247
     * @tc.desc      Verify format 'YYYYMMDD' for local date component row 246.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0247 begin');
      const value: Date = new Date(2020, 0, 2, 10, 59, 1);
      expect(formatTime(value, 'YYYYMMDD')).assertEqual('20200102');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0247 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_24800
     * @tc.name      testFormatTime0248
     * @tc.desc      Verify format 'M/D/YY' for local date component row 247.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0248 begin');
      const value: Date = new Date(2020, 0, 2, 10, 59, 9);
      expect(formatTime(value, 'M/D/YY')).assertEqual('1/2/20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0248 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_24900
     * @tc.name      testFormatTime0249
     * @tc.desc      Verify format 'HH:mm:ss' for local date component row 248.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0249 begin');
      const value: Date = new Date(2020, 0, 2, 10, 59, 10);
      expect(formatTime(value, 'HH:mm:ss')).assertEqual('10:59:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0249 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_25000
     * @tc.name      testFormatTime0250
     * @tc.desc      Verify format 'YYYY-MM-DDTHH:mm:ss' for local date component row 249.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0250 begin');
      const value: Date = new Date(2020, 0, 2, 10, 59, 59);
      expect(formatTime(value, 'YYYY-MM-DDTHH:mm:ss')).assertEqual('2020-01-02T10:59:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0250 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_25100
     * @tc.name      testFormatTime0251
     * @tc.desc      Verify format 'D.M.YYYY' for local date component row 250.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0251 begin');
      const value: Date = new Date(2020, 0, 2, 12, 0, 0);
      expect(formatTime(value, 'D.M.YYYY')).assertEqual('2.1.2020');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0251 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_25200
     * @tc.name      testFormatTime0252
     * @tc.desc      Verify format 'mm:ss' for local date component row 251.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0252 begin');
      const value: Date = new Date(2020, 0, 2, 12, 0, 1);
      expect(formatTime(value, 'mm:ss')).assertEqual('00:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0252 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_25300
     * @tc.name      testFormatTime0253
     * @tc.desc      Verify format 'YYYY-MM-DD HH:mm' for local date component row 252.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0253 begin');
      const value: Date = new Date(2020, 0, 2, 12, 0, 9);
      expect(formatTime(value, 'YYYY-MM-DD HH:mm')).assertEqual('2020-01-02 12:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0253 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_25400
     * @tc.name      testFormatTime0254
     * @tc.desc      Verify format 'M月D日' for local date component row 253.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0254 begin');
      const value: Date = new Date(2020, 0, 2, 12, 0, 10);
      expect(formatTime(value, 'M月D日')).assertEqual('1月2日');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0254 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_25500
     * @tc.name      testFormatTime0255
     * @tc.desc      Verify format 'YY-MM-DD' for local date component row 254.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0255 begin');
      const value: Date = new Date(2020, 0, 2, 12, 0, 59);
      expect(formatTime(value, 'YY-MM-DD')).assertEqual('20-01-02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0255 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_25600
     * @tc.name      testFormatTime0256
     * @tc.desc      Verify format 'HH:mm:ss YYYY-MM-DD' for local date component row 255.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0256 begin');
      const value: Date = new Date(2020, 0, 2, 12, 5, 0);
      expect(formatTime(value, 'HH:mm:ss YYYY-MM-DD')).assertEqual('12:05:00 2020-01-02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0256 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_25700
     * @tc.name      testFormatTime0257
     * @tc.desc      Verify format 'YYYY/MM/DD HH:mm' for local date component row 256.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0257 begin');
      const value: Date = new Date(2020, 0, 2, 12, 5, 1);
      expect(formatTime(value, 'YYYY/MM/DD HH:mm')).assertEqual('2020/01/02 12:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0257 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_25800
     * @tc.name      testFormatTime0258
     * @tc.desc      Verify format 'M-D-YY' for local date component row 257.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0258 begin');
      const value: Date = new Date(2020, 0, 2, 12, 5, 9);
      expect(formatTime(value, 'M-D-YY')).assertEqual('1-2-20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0258 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_25900
     * @tc.name      testFormatTime0259
     * @tc.desc      Verify format 'YYYY.MM.DD' for local date component row 258.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0259 begin');
      const value: Date = new Date(2020, 0, 2, 12, 5, 10);
      expect(formatTime(value, 'YYYY.MM.DD')).assertEqual('2020.01.02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0259 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_26000
     * @tc.name      testFormatTime0260
     * @tc.desc      Verify format 'H:m:s' for local date component row 259.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0260 begin');
      const value: Date = new Date(2020, 0, 2, 12, 5, 59);
      expect(formatTime(value, 'H:m:s')).assertEqual('12:5:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0260 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_26100
     * @tc.name      testFormatTime0261
     * @tc.desc      Verify format 'YYYY-MM-DD' for local date component row 260.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0261 begin');
      const value: Date = new Date(2020, 0, 2, 12, 9, 0);
      expect(formatTime(value, 'YYYY-MM-DD')).assertEqual('2020-01-02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0261 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_26200
     * @tc.name      testFormatTime0262
     * @tc.desc      Verify format 'YY/M/D' for local date component row 261.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0262 begin');
      const value: Date = new Date(2020, 0, 2, 12, 9, 1);
      expect(formatTime(value, 'YY/M/D')).assertEqual('20/1/2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0262 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_26300
     * @tc.name      testFormatTime0263
     * @tc.desc      Verify format 'YYYY-MM-DD HH:mm:ss' for local date component row 262.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0263 begin');
      const value: Date = new Date(2020, 0, 2, 12, 9, 9);
      expect(formatTime(value, 'YYYY-MM-DD HH:mm:ss')).assertEqual('2020-01-02 12:09:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0263 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_26400
     * @tc.name      testFormatTime0264
     * @tc.desc      Verify format 'MM-DD' for local date component row 263.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0264 begin');
      const value: Date = new Date(2020, 0, 2, 12, 9, 10);
      expect(formatTime(value, 'MM-DD')).assertEqual('01-02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0264 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_26500
     * @tc.name      testFormatTime0265
     * @tc.desc      Verify format 'HH:mm' for local date component row 264.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0265 begin');
      const value: Date = new Date(2020, 0, 2, 12, 9, 59);
      expect(formatTime(value, 'HH:mm')).assertEqual('12:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0265 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_26600
     * @tc.name      testFormatTime0266
     * @tc.desc      Verify format 'YYYY年MM月DD日' for local date component row 265.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0266 begin');
      const value: Date = new Date(2020, 0, 2, 12, 10, 0);
      expect(formatTime(value, 'YYYY年MM月DD日')).assertEqual('2020年01月02日');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0266 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_26700
     * @tc.name      testFormatTime0267
     * @tc.desc      Verify format 'YYYYMMDD' for local date component row 266.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0267 begin');
      const value: Date = new Date(2020, 0, 2, 12, 10, 1);
      expect(formatTime(value, 'YYYYMMDD')).assertEqual('20200102');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0267 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_26800
     * @tc.name      testFormatTime0268
     * @tc.desc      Verify format 'M/D/YY' for local date component row 267.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0268 begin');
      const value: Date = new Date(2020, 0, 2, 12, 10, 9);
      expect(formatTime(value, 'M/D/YY')).assertEqual('1/2/20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0268 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_26900
     * @tc.name      testFormatTime0269
     * @tc.desc      Verify format 'HH:mm:ss' for local date component row 268.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0269 begin');
      const value: Date = new Date(2020, 0, 2, 12, 10, 10);
      expect(formatTime(value, 'HH:mm:ss')).assertEqual('12:10:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0269 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP3_27000
     * @tc.name      testFormatTime0270
     * @tc.desc      Verify format 'YYYY-MM-DDTHH:mm:ss' for local date component row 269.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0270 begin');
      const value: Date = new Date(2020, 0, 2, 12, 10, 59);
      expect(formatTime(value, 'YYYY-MM-DDTHH:mm:ss')).assertEqual('2020-01-02T12:10:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0270 end');
    })

  })
}
