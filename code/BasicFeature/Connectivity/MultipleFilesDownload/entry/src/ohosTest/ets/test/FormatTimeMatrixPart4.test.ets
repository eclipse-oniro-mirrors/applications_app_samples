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

export default function FormatTimeMatrixPart4Test(): void {
  describe('FormatTimeMatrixPart4', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP4_27100
     * @tc.name      testFormatTime0271
     * @tc.desc      Verify format 'D.M.YYYY' for local date component row 270.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0271 begin');
      const value: Date = new Date(2020, 0, 2, 12, 59, 0);
      expect(formatTime(value, 'D.M.YYYY')).assertEqual('2.1.2020');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0271 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP4_27200
     * @tc.name      testFormatTime0272
     * @tc.desc      Verify format 'mm:ss' for local date component row 271.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0272 begin');
      const value: Date = new Date(2020, 0, 2, 12, 59, 1);
      expect(formatTime(value, 'mm:ss')).assertEqual('59:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0272 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP4_27300
     * @tc.name      testFormatTime0273
     * @tc.desc      Verify format 'YYYY-MM-DD HH:mm' for local date component row 272.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0273 begin');
      const value: Date = new Date(2020, 0, 2, 12, 59, 9);
      expect(formatTime(value, 'YYYY-MM-DD HH:mm')).assertEqual('2020-01-02 12:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0273 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP4_27400
     * @tc.name      testFormatTime0274
     * @tc.desc      Verify format 'M月D日' for local date component row 273.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0274 begin');
      const value: Date = new Date(2020, 0, 2, 12, 59, 10);
      expect(formatTime(value, 'M月D日')).assertEqual('1月2日');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0274 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP4_27500
     * @tc.name      testFormatTime0275
     * @tc.desc      Verify format 'YY-MM-DD' for local date component row 274.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0275 begin');
      const value: Date = new Date(2020, 0, 2, 12, 59, 59);
      expect(formatTime(value, 'YY-MM-DD')).assertEqual('20-01-02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0275 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP4_27600
     * @tc.name      testFormatTime0276
     * @tc.desc      Verify format 'HH:mm:ss YYYY-MM-DD' for local date component row 275.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0276 begin');
      const value: Date = new Date(2020, 0, 2, 23, 0, 0);
      expect(formatTime(value, 'HH:mm:ss YYYY-MM-DD')).assertEqual('23:00:00 2020-01-02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0276 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP4_27700
     * @tc.name      testFormatTime0277
     * @tc.desc      Verify format 'YYYY/MM/DD HH:mm' for local date component row 276.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0277 begin');
      const value: Date = new Date(2020, 0, 2, 23, 0, 1);
      expect(formatTime(value, 'YYYY/MM/DD HH:mm')).assertEqual('2020/01/02 23:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0277 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP4_27800
     * @tc.name      testFormatTime0278
     * @tc.desc      Verify format 'M-D-YY' for local date component row 277.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0278 begin');
      const value: Date = new Date(2020, 0, 2, 23, 0, 9);
      expect(formatTime(value, 'M-D-YY')).assertEqual('1-2-20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0278 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP4_27900
     * @tc.name      testFormatTime0279
     * @tc.desc      Verify format 'YYYY.MM.DD' for local date component row 278.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0279 begin');
      const value: Date = new Date(2020, 0, 2, 23, 0, 10);
      expect(formatTime(value, 'YYYY.MM.DD')).assertEqual('2020.01.02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0279 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP4_28000
     * @tc.name      testFormatTime0280
     * @tc.desc      Verify format 'H:m:s' for local date component row 279.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0280 begin');
      const value: Date = new Date(2020, 0, 2, 23, 0, 59);
      expect(formatTime(value, 'H:m:s')).assertEqual('23:0:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0280 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP4_28100
     * @tc.name      testFormatTime0281
     * @tc.desc      Verify format 'YYYY-MM-DD' for local date component row 280.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0281 begin');
      const value: Date = new Date(2020, 0, 2, 23, 5, 0);
      expect(formatTime(value, 'YYYY-MM-DD')).assertEqual('2020-01-02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0281 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP4_28200
     * @tc.name      testFormatTime0282
     * @tc.desc      Verify format 'YY/M/D' for local date component row 281.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0282 begin');
      const value: Date = new Date(2020, 0, 2, 23, 5, 1);
      expect(formatTime(value, 'YY/M/D')).assertEqual('20/1/2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0282 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP4_28300
     * @tc.name      testFormatTime0283
     * @tc.desc      Verify format 'YYYY-MM-DD HH:mm:ss' for local date component row 282.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0283 begin');
      const value: Date = new Date(2020, 0, 2, 23, 5, 9);
      expect(formatTime(value, 'YYYY-MM-DD HH:mm:ss')).assertEqual('2020-01-02 23:05:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0283 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP4_28400
     * @tc.name      testFormatTime0284
     * @tc.desc      Verify format 'MM-DD' for local date component row 283.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0284 begin');
      const value: Date = new Date(2020, 0, 2, 23, 5, 10);
      expect(formatTime(value, 'MM-DD')).assertEqual('01-02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0284 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP4_28500
     * @tc.name      testFormatTime0285
     * @tc.desc      Verify format 'HH:mm' for local date component row 284.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0285 begin');
      const value: Date = new Date(2020, 0, 2, 23, 5, 59);
      expect(formatTime(value, 'HH:mm')).assertEqual('23:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0285 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP4_28600
     * @tc.name      testFormatTime0286
     * @tc.desc      Verify format 'YYYY年MM月DD日' for local date component row 285.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0286 begin');
      const value: Date = new Date(2020, 0, 2, 23, 9, 0);
      expect(formatTime(value, 'YYYY年MM月DD日')).assertEqual('2020年01月02日');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0286 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP4_28700
     * @tc.name      testFormatTime0287
     * @tc.desc      Verify format 'YYYYMMDD' for local date component row 286.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0287 begin');
      const value: Date = new Date(2020, 0, 2, 23, 9, 1);
      expect(formatTime(value, 'YYYYMMDD')).assertEqual('20200102');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0287 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP4_28800
     * @tc.name      testFormatTime0288
     * @tc.desc      Verify format 'M/D/YY' for local date component row 287.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0288 begin');
      const value: Date = new Date(2020, 0, 2, 23, 9, 9);
      expect(formatTime(value, 'M/D/YY')).assertEqual('1/2/20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0288 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP4_28900
     * @tc.name      testFormatTime0289
     * @tc.desc      Verify format 'HH:mm:ss' for local date component row 288.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0289 begin');
      const value: Date = new Date(2020, 0, 2, 23, 9, 10);
      expect(formatTime(value, 'HH:mm:ss')).assertEqual('23:09:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0289 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP4_29000
     * @tc.name      testFormatTime0290
     * @tc.desc      Verify format 'YYYY-MM-DDTHH:mm:ss' for local date component row 289.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0290 begin');
      const value: Date = new Date(2020, 0, 2, 23, 9, 59);
      expect(formatTime(value, 'YYYY-MM-DDTHH:mm:ss')).assertEqual('2020-01-02T23:09:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0290 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP4_29100
     * @tc.name      testFormatTime0291
     * @tc.desc      Verify format 'D.M.YYYY' for local date component row 290.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0291 begin');
      const value: Date = new Date(2020, 0, 2, 23, 10, 0);
      expect(formatTime(value, 'D.M.YYYY')).assertEqual('2.1.2020');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0291 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP4_29200
     * @tc.name      testFormatTime0292
     * @tc.desc      Verify format 'mm:ss' for local date component row 291.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0292 begin');
      const value: Date = new Date(2020, 0, 2, 23, 10, 1);
      expect(formatTime(value, 'mm:ss')).assertEqual('10:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0292 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP4_29300
     * @tc.name      testFormatTime0293
     * @tc.desc      Verify format 'YYYY-MM-DD HH:mm' for local date component row 292.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0293 begin');
      const value: Date = new Date(2020, 0, 2, 23, 10, 9);
      expect(formatTime(value, 'YYYY-MM-DD HH:mm')).assertEqual('2020-01-02 23:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0293 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP4_29400
     * @tc.name      testFormatTime0294
     * @tc.desc      Verify format 'M月D日' for local date component row 293.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0294 begin');
      const value: Date = new Date(2020, 0, 2, 23, 10, 10);
      expect(formatTime(value, 'M月D日')).assertEqual('1月2日');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0294 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP4_29500
     * @tc.name      testFormatTime0295
     * @tc.desc      Verify format 'YY-MM-DD' for local date component row 294.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0295 begin');
      const value: Date = new Date(2020, 0, 2, 23, 10, 59);
      expect(formatTime(value, 'YY-MM-DD')).assertEqual('20-01-02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0295 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP4_29600
     * @tc.name      testFormatTime0296
     * @tc.desc      Verify format 'HH:mm:ss YYYY-MM-DD' for local date component row 295.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0296 begin');
      const value: Date = new Date(2020, 0, 2, 23, 59, 0);
      expect(formatTime(value, 'HH:mm:ss YYYY-MM-DD')).assertEqual('23:59:00 2020-01-02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0296 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP4_29700
     * @tc.name      testFormatTime0297
     * @tc.desc      Verify format 'YYYY/MM/DD HH:mm' for local date component row 296.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0297 begin');
      const value: Date = new Date(2020, 0, 2, 23, 59, 1);
      expect(formatTime(value, 'YYYY/MM/DD HH:mm')).assertEqual('2020/01/02 23:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0297 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP4_29800
     * @tc.name      testFormatTime0298
     * @tc.desc      Verify format 'M-D-YY' for local date component row 297.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0298 begin');
      const value: Date = new Date(2020, 0, 2, 23, 59, 9);
      expect(formatTime(value, 'M-D-YY')).assertEqual('1-2-20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0298 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP4_29900
     * @tc.name      testFormatTime0299
     * @tc.desc      Verify format 'YYYY.MM.DD' for local date component row 298.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0299 begin');
      const value: Date = new Date(2020, 0, 2, 23, 59, 10);
      expect(formatTime(value, 'YYYY.MM.DD')).assertEqual('2020.01.02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0299 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP4_30000
     * @tc.name      testFormatTime0300
     * @tc.desc      Verify format 'H:m:s' for local date component row 299.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0300 begin');
      const value: Date = new Date(2020, 0, 2, 23, 59, 59);
      expect(formatTime(value, 'H:m:s')).assertEqual('23:59:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0300 end');
    })

  })
}
