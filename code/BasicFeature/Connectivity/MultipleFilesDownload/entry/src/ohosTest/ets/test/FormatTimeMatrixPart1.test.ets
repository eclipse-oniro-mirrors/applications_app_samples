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

export default function FormatTimeMatrixPart1Test(): void {
  describe('FormatTimeMatrixPart1', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_0100
     * @tc.name      testFormatTime0001
     * @tc.desc      Verify format 'YYYY-MM-DD' for local date component row 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0001 begin');
      const value: Date = new Date(2020, 0, 1, 0, 0, 0);
      expect(formatTime(value, 'YYYY-MM-DD')).assertEqual('2020-01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0001 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_0200
     * @tc.name      testFormatTime0002
     * @tc.desc      Verify format 'YY/M/D' for local date component row 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0002 begin');
      const value: Date = new Date(2020, 0, 1, 0, 0, 1);
      expect(formatTime(value, 'YY/M/D')).assertEqual('20/1/1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0002 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_0300
     * @tc.name      testFormatTime0003
     * @tc.desc      Verify format 'YYYY-MM-DD HH:mm:ss' for local date component row 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0003 begin');
      const value: Date = new Date(2020, 0, 1, 0, 0, 9);
      expect(formatTime(value, 'YYYY-MM-DD HH:mm:ss')).assertEqual('2020-01-01 00:00:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0003 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_0400
     * @tc.name      testFormatTime0004
     * @tc.desc      Verify format 'MM-DD' for local date component row 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0004 begin');
      const value: Date = new Date(2020, 0, 1, 0, 0, 10);
      expect(formatTime(value, 'MM-DD')).assertEqual('01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0004 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_0500
     * @tc.name      testFormatTime0005
     * @tc.desc      Verify format 'HH:mm' for local date component row 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0005 begin');
      const value: Date = new Date(2020, 0, 1, 0, 0, 59);
      expect(formatTime(value, 'HH:mm')).assertEqual('00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0005 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_0600
     * @tc.name      testFormatTime0006
     * @tc.desc      Verify format 'YYYY年MM月DD日' for local date component row 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0006 begin');
      const value: Date = new Date(2020, 0, 1, 0, 5, 0);
      expect(formatTime(value, 'YYYY年MM月DD日')).assertEqual('2020年01月01日');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0006 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_0700
     * @tc.name      testFormatTime0007
     * @tc.desc      Verify format 'YYYYMMDD' for local date component row 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0007 begin');
      const value: Date = new Date(2020, 0, 1, 0, 5, 1);
      expect(formatTime(value, 'YYYYMMDD')).assertEqual('20200101');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0007 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_0800
     * @tc.name      testFormatTime0008
     * @tc.desc      Verify format 'M/D/YY' for local date component row 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0008 begin');
      const value: Date = new Date(2020, 0, 1, 0, 5, 9);
      expect(formatTime(value, 'M/D/YY')).assertEqual('1/1/20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0008 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_0900
     * @tc.name      testFormatTime0009
     * @tc.desc      Verify format 'HH:mm:ss' for local date component row 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0009 begin');
      const value: Date = new Date(2020, 0, 1, 0, 5, 10);
      expect(formatTime(value, 'HH:mm:ss')).assertEqual('00:05:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0009 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_1000
     * @tc.name      testFormatTime0010
     * @tc.desc      Verify format 'YYYY-MM-DDTHH:mm:ss' for local date component row 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0010 begin');
      const value: Date = new Date(2020, 0, 1, 0, 5, 59);
      expect(formatTime(value, 'YYYY-MM-DDTHH:mm:ss')).assertEqual('2020-01-01T00:05:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0010 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_1100
     * @tc.name      testFormatTime0011
     * @tc.desc      Verify format 'D.M.YYYY' for local date component row 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0011 begin');
      const value: Date = new Date(2020, 0, 1, 0, 9, 0);
      expect(formatTime(value, 'D.M.YYYY')).assertEqual('1.1.2020');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0011 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_1200
     * @tc.name      testFormatTime0012
     * @tc.desc      Verify format 'mm:ss' for local date component row 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0012 begin');
      const value: Date = new Date(2020, 0, 1, 0, 9, 1);
      expect(formatTime(value, 'mm:ss')).assertEqual('09:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0012 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_1300
     * @tc.name      testFormatTime0013
     * @tc.desc      Verify format 'YYYY-MM-DD HH:mm' for local date component row 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0013 begin');
      const value: Date = new Date(2020, 0, 1, 0, 9, 9);
      expect(formatTime(value, 'YYYY-MM-DD HH:mm')).assertEqual('2020-01-01 00:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0013 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_1400
     * @tc.name      testFormatTime0014
     * @tc.desc      Verify format 'M月D日' for local date component row 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0014 begin');
      const value: Date = new Date(2020, 0, 1, 0, 9, 10);
      expect(formatTime(value, 'M月D日')).assertEqual('1月1日');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0014 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_1500
     * @tc.name      testFormatTime0015
     * @tc.desc      Verify format 'YY-MM-DD' for local date component row 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0015 begin');
      const value: Date = new Date(2020, 0, 1, 0, 9, 59);
      expect(formatTime(value, 'YY-MM-DD')).assertEqual('20-01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0015 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_1600
     * @tc.name      testFormatTime0016
     * @tc.desc      Verify format 'HH:mm:ss YYYY-MM-DD' for local date component row 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0016 begin');
      const value: Date = new Date(2020, 0, 1, 0, 10, 0);
      expect(formatTime(value, 'HH:mm:ss YYYY-MM-DD')).assertEqual('00:10:00 2020-01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0016 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_1700
     * @tc.name      testFormatTime0017
     * @tc.desc      Verify format 'YYYY/MM/DD HH:mm' for local date component row 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0017 begin');
      const value: Date = new Date(2020, 0, 1, 0, 10, 1);
      expect(formatTime(value, 'YYYY/MM/DD HH:mm')).assertEqual('2020/01/01 00:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0017 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_1800
     * @tc.name      testFormatTime0018
     * @tc.desc      Verify format 'M-D-YY' for local date component row 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0018 begin');
      const value: Date = new Date(2020, 0, 1, 0, 10, 9);
      expect(formatTime(value, 'M-D-YY')).assertEqual('1-1-20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0018 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_1900
     * @tc.name      testFormatTime0019
     * @tc.desc      Verify format 'YYYY.MM.DD' for local date component row 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0019 begin');
      const value: Date = new Date(2020, 0, 1, 0, 10, 10);
      expect(formatTime(value, 'YYYY.MM.DD')).assertEqual('2020.01.01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0019 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_2000
     * @tc.name      testFormatTime0020
     * @tc.desc      Verify format 'H:m:s' for local date component row 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0020 begin');
      const value: Date = new Date(2020, 0, 1, 0, 10, 59);
      expect(formatTime(value, 'H:m:s')).assertEqual('0:10:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0020 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_2100
     * @tc.name      testFormatTime0021
     * @tc.desc      Verify format 'YYYY-MM-DD' for local date component row 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0021 begin');
      const value: Date = new Date(2020, 0, 1, 0, 59, 0);
      expect(formatTime(value, 'YYYY-MM-DD')).assertEqual('2020-01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0021 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_2200
     * @tc.name      testFormatTime0022
     * @tc.desc      Verify format 'YY/M/D' for local date component row 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0022 begin');
      const value: Date = new Date(2020, 0, 1, 0, 59, 1);
      expect(formatTime(value, 'YY/M/D')).assertEqual('20/1/1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0022 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_2300
     * @tc.name      testFormatTime0023
     * @tc.desc      Verify format 'YYYY-MM-DD HH:mm:ss' for local date component row 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0023 begin');
      const value: Date = new Date(2020, 0, 1, 0, 59, 9);
      expect(formatTime(value, 'YYYY-MM-DD HH:mm:ss')).assertEqual('2020-01-01 00:59:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0023 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_2400
     * @tc.name      testFormatTime0024
     * @tc.desc      Verify format 'MM-DD' for local date component row 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0024 begin');
      const value: Date = new Date(2020, 0, 1, 0, 59, 10);
      expect(formatTime(value, 'MM-DD')).assertEqual('01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0024 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_2500
     * @tc.name      testFormatTime0025
     * @tc.desc      Verify format 'HH:mm' for local date component row 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0025 begin');
      const value: Date = new Date(2020, 0, 1, 0, 59, 59);
      expect(formatTime(value, 'HH:mm')).assertEqual('00:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0025 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_2600
     * @tc.name      testFormatTime0026
     * @tc.desc      Verify format 'YYYY年MM月DD日' for local date component row 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0026 begin');
      const value: Date = new Date(2020, 0, 1, 1, 0, 0);
      expect(formatTime(value, 'YYYY年MM月DD日')).assertEqual('2020年01月01日');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0026 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_2700
     * @tc.name      testFormatTime0027
     * @tc.desc      Verify format 'YYYYMMDD' for local date component row 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0027 begin');
      const value: Date = new Date(2020, 0, 1, 1, 0, 1);
      expect(formatTime(value, 'YYYYMMDD')).assertEqual('20200101');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0027 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_2800
     * @tc.name      testFormatTime0028
     * @tc.desc      Verify format 'M/D/YY' for local date component row 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0028 begin');
      const value: Date = new Date(2020, 0, 1, 1, 0, 9);
      expect(formatTime(value, 'M/D/YY')).assertEqual('1/1/20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0028 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_2900
     * @tc.name      testFormatTime0029
     * @tc.desc      Verify format 'HH:mm:ss' for local date component row 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0029 begin');
      const value: Date = new Date(2020, 0, 1, 1, 0, 10);
      expect(formatTime(value, 'HH:mm:ss')).assertEqual('01:00:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0029 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_3000
     * @tc.name      testFormatTime0030
     * @tc.desc      Verify format 'YYYY-MM-DDTHH:mm:ss' for local date component row 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0030 begin');
      const value: Date = new Date(2020, 0, 1, 1, 0, 59);
      expect(formatTime(value, 'YYYY-MM-DDTHH:mm:ss')).assertEqual('2020-01-01T01:00:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0030 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_3100
     * @tc.name      testFormatTime0031
     * @tc.desc      Verify format 'D.M.YYYY' for local date component row 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0031 begin');
      const value: Date = new Date(2020, 0, 1, 1, 5, 0);
      expect(formatTime(value, 'D.M.YYYY')).assertEqual('1.1.2020');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0031 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_3200
     * @tc.name      testFormatTime0032
     * @tc.desc      Verify format 'mm:ss' for local date component row 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0032 begin');
      const value: Date = new Date(2020, 0, 1, 1, 5, 1);
      expect(formatTime(value, 'mm:ss')).assertEqual('05:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0032 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_3300
     * @tc.name      testFormatTime0033
     * @tc.desc      Verify format 'YYYY-MM-DD HH:mm' for local date component row 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0033 begin');
      const value: Date = new Date(2020, 0, 1, 1, 5, 9);
      expect(formatTime(value, 'YYYY-MM-DD HH:mm')).assertEqual('2020-01-01 01:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0033 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_3400
     * @tc.name      testFormatTime0034
     * @tc.desc      Verify format 'M月D日' for local date component row 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0034 begin');
      const value: Date = new Date(2020, 0, 1, 1, 5, 10);
      expect(formatTime(value, 'M月D日')).assertEqual('1月1日');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0034 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_3500
     * @tc.name      testFormatTime0035
     * @tc.desc      Verify format 'YY-MM-DD' for local date component row 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0035 begin');
      const value: Date = new Date(2020, 0, 1, 1, 5, 59);
      expect(formatTime(value, 'YY-MM-DD')).assertEqual('20-01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0035 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_3600
     * @tc.name      testFormatTime0036
     * @tc.desc      Verify format 'HH:mm:ss YYYY-MM-DD' for local date component row 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0036 begin');
      const value: Date = new Date(2020, 0, 1, 1, 9, 0);
      expect(formatTime(value, 'HH:mm:ss YYYY-MM-DD')).assertEqual('01:09:00 2020-01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0036 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_3700
     * @tc.name      testFormatTime0037
     * @tc.desc      Verify format 'YYYY/MM/DD HH:mm' for local date component row 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0037 begin');
      const value: Date = new Date(2020, 0, 1, 1, 9, 1);
      expect(formatTime(value, 'YYYY/MM/DD HH:mm')).assertEqual('2020/01/01 01:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0037 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_3800
     * @tc.name      testFormatTime0038
     * @tc.desc      Verify format 'M-D-YY' for local date component row 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0038 begin');
      const value: Date = new Date(2020, 0, 1, 1, 9, 9);
      expect(formatTime(value, 'M-D-YY')).assertEqual('1-1-20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0038 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_3900
     * @tc.name      testFormatTime0039
     * @tc.desc      Verify format 'YYYY.MM.DD' for local date component row 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0039 begin');
      const value: Date = new Date(2020, 0, 1, 1, 9, 10);
      expect(formatTime(value, 'YYYY.MM.DD')).assertEqual('2020.01.01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0039 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_4000
     * @tc.name      testFormatTime0040
     * @tc.desc      Verify format 'H:m:s' for local date component row 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0040 begin');
      const value: Date = new Date(2020, 0, 1, 1, 9, 59);
      expect(formatTime(value, 'H:m:s')).assertEqual('1:9:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0040 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_4100
     * @tc.name      testFormatTime0041
     * @tc.desc      Verify format 'YYYY-MM-DD' for local date component row 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0041 begin');
      const value: Date = new Date(2020, 0, 1, 1, 10, 0);
      expect(formatTime(value, 'YYYY-MM-DD')).assertEqual('2020-01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0041 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_4200
     * @tc.name      testFormatTime0042
     * @tc.desc      Verify format 'YY/M/D' for local date component row 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0042 begin');
      const value: Date = new Date(2020, 0, 1, 1, 10, 1);
      expect(formatTime(value, 'YY/M/D')).assertEqual('20/1/1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0042 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_4300
     * @tc.name      testFormatTime0043
     * @tc.desc      Verify format 'YYYY-MM-DD HH:mm:ss' for local date component row 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0043 begin');
      const value: Date = new Date(2020, 0, 1, 1, 10, 9);
      expect(formatTime(value, 'YYYY-MM-DD HH:mm:ss')).assertEqual('2020-01-01 01:10:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0043 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_4400
     * @tc.name      testFormatTime0044
     * @tc.desc      Verify format 'MM-DD' for local date component row 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0044 begin');
      const value: Date = new Date(2020, 0, 1, 1, 10, 10);
      expect(formatTime(value, 'MM-DD')).assertEqual('01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0044 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_4500
     * @tc.name      testFormatTime0045
     * @tc.desc      Verify format 'HH:mm' for local date component row 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0045 begin');
      const value: Date = new Date(2020, 0, 1, 1, 10, 59);
      expect(formatTime(value, 'HH:mm')).assertEqual('01:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0045 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_4600
     * @tc.name      testFormatTime0046
     * @tc.desc      Verify format 'YYYY年MM月DD日' for local date component row 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0046 begin');
      const value: Date = new Date(2020, 0, 1, 1, 59, 0);
      expect(formatTime(value, 'YYYY年MM月DD日')).assertEqual('2020年01月01日');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0046 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_4700
     * @tc.name      testFormatTime0047
     * @tc.desc      Verify format 'YYYYMMDD' for local date component row 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0047 begin');
      const value: Date = new Date(2020, 0, 1, 1, 59, 1);
      expect(formatTime(value, 'YYYYMMDD')).assertEqual('20200101');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0047 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_4800
     * @tc.name      testFormatTime0048
     * @tc.desc      Verify format 'M/D/YY' for local date component row 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0048 begin');
      const value: Date = new Date(2020, 0, 1, 1, 59, 9);
      expect(formatTime(value, 'M/D/YY')).assertEqual('1/1/20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0048 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_4900
     * @tc.name      testFormatTime0049
     * @tc.desc      Verify format 'HH:mm:ss' for local date component row 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0049 begin');
      const value: Date = new Date(2020, 0, 1, 1, 59, 10);
      expect(formatTime(value, 'HH:mm:ss')).assertEqual('01:59:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0049 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_5000
     * @tc.name      testFormatTime0050
     * @tc.desc      Verify format 'YYYY-MM-DDTHH:mm:ss' for local date component row 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0050 begin');
      const value: Date = new Date(2020, 0, 1, 1, 59, 59);
      expect(formatTime(value, 'YYYY-MM-DDTHH:mm:ss')).assertEqual('2020-01-01T01:59:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0050 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_5100
     * @tc.name      testFormatTime0051
     * @tc.desc      Verify format 'D.M.YYYY' for local date component row 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0051 begin');
      const value: Date = new Date(2020, 0, 1, 9, 0, 0);
      expect(formatTime(value, 'D.M.YYYY')).assertEqual('1.1.2020');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0051 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_5200
     * @tc.name      testFormatTime0052
     * @tc.desc      Verify format 'mm:ss' for local date component row 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0052 begin');
      const value: Date = new Date(2020, 0, 1, 9, 0, 1);
      expect(formatTime(value, 'mm:ss')).assertEqual('00:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0052 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_5300
     * @tc.name      testFormatTime0053
     * @tc.desc      Verify format 'YYYY-MM-DD HH:mm' for local date component row 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0053 begin');
      const value: Date = new Date(2020, 0, 1, 9, 0, 9);
      expect(formatTime(value, 'YYYY-MM-DD HH:mm')).assertEqual('2020-01-01 09:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0053 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_5400
     * @tc.name      testFormatTime0054
     * @tc.desc      Verify format 'M月D日' for local date component row 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0054 begin');
      const value: Date = new Date(2020, 0, 1, 9, 0, 10);
      expect(formatTime(value, 'M月D日')).assertEqual('1月1日');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0054 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_5500
     * @tc.name      testFormatTime0055
     * @tc.desc      Verify format 'YY-MM-DD' for local date component row 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0055 begin');
      const value: Date = new Date(2020, 0, 1, 9, 0, 59);
      expect(formatTime(value, 'YY-MM-DD')).assertEqual('20-01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0055 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_5600
     * @tc.name      testFormatTime0056
     * @tc.desc      Verify format 'HH:mm:ss YYYY-MM-DD' for local date component row 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0056 begin');
      const value: Date = new Date(2020, 0, 1, 9, 5, 0);
      expect(formatTime(value, 'HH:mm:ss YYYY-MM-DD')).assertEqual('09:05:00 2020-01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0056 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_5700
     * @tc.name      testFormatTime0057
     * @tc.desc      Verify format 'YYYY/MM/DD HH:mm' for local date component row 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0057 begin');
      const value: Date = new Date(2020, 0, 1, 9, 5, 1);
      expect(formatTime(value, 'YYYY/MM/DD HH:mm')).assertEqual('2020/01/01 09:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0057 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_5800
     * @tc.name      testFormatTime0058
     * @tc.desc      Verify format 'M-D-YY' for local date component row 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0058 begin');
      const value: Date = new Date(2020, 0, 1, 9, 5, 9);
      expect(formatTime(value, 'M-D-YY')).assertEqual('1-1-20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0058 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_5900
     * @tc.name      testFormatTime0059
     * @tc.desc      Verify format 'YYYY.MM.DD' for local date component row 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0059 begin');
      const value: Date = new Date(2020, 0, 1, 9, 5, 10);
      expect(formatTime(value, 'YYYY.MM.DD')).assertEqual('2020.01.01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0059 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_6000
     * @tc.name      testFormatTime0060
     * @tc.desc      Verify format 'H:m:s' for local date component row 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0060 begin');
      const value: Date = new Date(2020, 0, 1, 9, 5, 59);
      expect(formatTime(value, 'H:m:s')).assertEqual('9:5:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0060 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_6100
     * @tc.name      testFormatTime0061
     * @tc.desc      Verify format 'YYYY-MM-DD' for local date component row 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0061 begin');
      const value: Date = new Date(2020, 0, 1, 9, 9, 0);
      expect(formatTime(value, 'YYYY-MM-DD')).assertEqual('2020-01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0061 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_6200
     * @tc.name      testFormatTime0062
     * @tc.desc      Verify format 'YY/M/D' for local date component row 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0062 begin');
      const value: Date = new Date(2020, 0, 1, 9, 9, 1);
      expect(formatTime(value, 'YY/M/D')).assertEqual('20/1/1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0062 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_6300
     * @tc.name      testFormatTime0063
     * @tc.desc      Verify format 'YYYY-MM-DD HH:mm:ss' for local date component row 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0063 begin');
      const value: Date = new Date(2020, 0, 1, 9, 9, 9);
      expect(formatTime(value, 'YYYY-MM-DD HH:mm:ss')).assertEqual('2020-01-01 09:09:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0063 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_6400
     * @tc.name      testFormatTime0064
     * @tc.desc      Verify format 'MM-DD' for local date component row 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0064 begin');
      const value: Date = new Date(2020, 0, 1, 9, 9, 10);
      expect(formatTime(value, 'MM-DD')).assertEqual('01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0064 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_6500
     * @tc.name      testFormatTime0065
     * @tc.desc      Verify format 'HH:mm' for local date component row 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0065 begin');
      const value: Date = new Date(2020, 0, 1, 9, 9, 59);
      expect(formatTime(value, 'HH:mm')).assertEqual('09:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0065 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_6600
     * @tc.name      testFormatTime0066
     * @tc.desc      Verify format 'YYYY年MM月DD日' for local date component row 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0066 begin');
      const value: Date = new Date(2020, 0, 1, 9, 10, 0);
      expect(formatTime(value, 'YYYY年MM月DD日')).assertEqual('2020年01月01日');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0066 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_6700
     * @tc.name      testFormatTime0067
     * @tc.desc      Verify format 'YYYYMMDD' for local date component row 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0067 begin');
      const value: Date = new Date(2020, 0, 1, 9, 10, 1);
      expect(formatTime(value, 'YYYYMMDD')).assertEqual('20200101');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0067 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_6800
     * @tc.name      testFormatTime0068
     * @tc.desc      Verify format 'M/D/YY' for local date component row 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0068 begin');
      const value: Date = new Date(2020, 0, 1, 9, 10, 9);
      expect(formatTime(value, 'M/D/YY')).assertEqual('1/1/20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0068 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_6900
     * @tc.name      testFormatTime0069
     * @tc.desc      Verify format 'HH:mm:ss' for local date component row 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0069 begin');
      const value: Date = new Date(2020, 0, 1, 9, 10, 10);
      expect(formatTime(value, 'HH:mm:ss')).assertEqual('09:10:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0069 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_7000
     * @tc.name      testFormatTime0070
     * @tc.desc      Verify format 'YYYY-MM-DDTHH:mm:ss' for local date component row 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0070 begin');
      const value: Date = new Date(2020, 0, 1, 9, 10, 59);
      expect(formatTime(value, 'YYYY-MM-DDTHH:mm:ss')).assertEqual('2020-01-01T09:10:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0070 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_7100
     * @tc.name      testFormatTime0071
     * @tc.desc      Verify format 'D.M.YYYY' for local date component row 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0071 begin');
      const value: Date = new Date(2020, 0, 1, 9, 59, 0);
      expect(formatTime(value, 'D.M.YYYY')).assertEqual('1.1.2020');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0071 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_7200
     * @tc.name      testFormatTime0072
     * @tc.desc      Verify format 'mm:ss' for local date component row 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0072 begin');
      const value: Date = new Date(2020, 0, 1, 9, 59, 1);
      expect(formatTime(value, 'mm:ss')).assertEqual('59:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0072 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_7300
     * @tc.name      testFormatTime0073
     * @tc.desc      Verify format 'YYYY-MM-DD HH:mm' for local date component row 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0073 begin');
      const value: Date = new Date(2020, 0, 1, 9, 59, 9);
      expect(formatTime(value, 'YYYY-MM-DD HH:mm')).assertEqual('2020-01-01 09:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0073 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_7400
     * @tc.name      testFormatTime0074
     * @tc.desc      Verify format 'M月D日' for local date component row 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0074 begin');
      const value: Date = new Date(2020, 0, 1, 9, 59, 10);
      expect(formatTime(value, 'M月D日')).assertEqual('1月1日');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0074 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_7500
     * @tc.name      testFormatTime0075
     * @tc.desc      Verify format 'YY-MM-DD' for local date component row 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0075 begin');
      const value: Date = new Date(2020, 0, 1, 9, 59, 59);
      expect(formatTime(value, 'YY-MM-DD')).assertEqual('20-01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0075 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_7600
     * @tc.name      testFormatTime0076
     * @tc.desc      Verify format 'HH:mm:ss YYYY-MM-DD' for local date component row 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0076 begin');
      const value: Date = new Date(2020, 0, 1, 10, 0, 0);
      expect(formatTime(value, 'HH:mm:ss YYYY-MM-DD')).assertEqual('10:00:00 2020-01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0076 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_7700
     * @tc.name      testFormatTime0077
     * @tc.desc      Verify format 'YYYY/MM/DD HH:mm' for local date component row 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0077 begin');
      const value: Date = new Date(2020, 0, 1, 10, 0, 1);
      expect(formatTime(value, 'YYYY/MM/DD HH:mm')).assertEqual('2020/01/01 10:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0077 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_7800
     * @tc.name      testFormatTime0078
     * @tc.desc      Verify format 'M-D-YY' for local date component row 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0078 begin');
      const value: Date = new Date(2020, 0, 1, 10, 0, 9);
      expect(formatTime(value, 'M-D-YY')).assertEqual('1-1-20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0078 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_7900
     * @tc.name      testFormatTime0079
     * @tc.desc      Verify format 'YYYY.MM.DD' for local date component row 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0079 begin');
      const value: Date = new Date(2020, 0, 1, 10, 0, 10);
      expect(formatTime(value, 'YYYY.MM.DD')).assertEqual('2020.01.01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0079 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_8000
     * @tc.name      testFormatTime0080
     * @tc.desc      Verify format 'H:m:s' for local date component row 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0080 begin');
      const value: Date = new Date(2020, 0, 1, 10, 0, 59);
      expect(formatTime(value, 'H:m:s')).assertEqual('10:0:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0080 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_8100
     * @tc.name      testFormatTime0081
     * @tc.desc      Verify format 'YYYY-MM-DD' for local date component row 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0081 begin');
      const value: Date = new Date(2020, 0, 1, 10, 5, 0);
      expect(formatTime(value, 'YYYY-MM-DD')).assertEqual('2020-01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0081 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_8200
     * @tc.name      testFormatTime0082
     * @tc.desc      Verify format 'YY/M/D' for local date component row 81.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0082 begin');
      const value: Date = new Date(2020, 0, 1, 10, 5, 1);
      expect(formatTime(value, 'YY/M/D')).assertEqual('20/1/1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0082 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_8300
     * @tc.name      testFormatTime0083
     * @tc.desc      Verify format 'YYYY-MM-DD HH:mm:ss' for local date component row 82.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0083 begin');
      const value: Date = new Date(2020, 0, 1, 10, 5, 9);
      expect(formatTime(value, 'YYYY-MM-DD HH:mm:ss')).assertEqual('2020-01-01 10:05:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0083 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_8400
     * @tc.name      testFormatTime0084
     * @tc.desc      Verify format 'MM-DD' for local date component row 83.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0084 begin');
      const value: Date = new Date(2020, 0, 1, 10, 5, 10);
      expect(formatTime(value, 'MM-DD')).assertEqual('01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0084 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_8500
     * @tc.name      testFormatTime0085
     * @tc.desc      Verify format 'HH:mm' for local date component row 84.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0085 begin');
      const value: Date = new Date(2020, 0, 1, 10, 5, 59);
      expect(formatTime(value, 'HH:mm')).assertEqual('10:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0085 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_8600
     * @tc.name      testFormatTime0086
     * @tc.desc      Verify format 'YYYY年MM月DD日' for local date component row 85.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0086 begin');
      const value: Date = new Date(2020, 0, 1, 10, 9, 0);
      expect(formatTime(value, 'YYYY年MM月DD日')).assertEqual('2020年01月01日');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0086 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_8700
     * @tc.name      testFormatTime0087
     * @tc.desc      Verify format 'YYYYMMDD' for local date component row 86.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0087 begin');
      const value: Date = new Date(2020, 0, 1, 10, 9, 1);
      expect(formatTime(value, 'YYYYMMDD')).assertEqual('20200101');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0087 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_8800
     * @tc.name      testFormatTime0088
     * @tc.desc      Verify format 'M/D/YY' for local date component row 87.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0088 begin');
      const value: Date = new Date(2020, 0, 1, 10, 9, 9);
      expect(formatTime(value, 'M/D/YY')).assertEqual('1/1/20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0088 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_8900
     * @tc.name      testFormatTime0089
     * @tc.desc      Verify format 'HH:mm:ss' for local date component row 88.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0089 begin');
      const value: Date = new Date(2020, 0, 1, 10, 9, 10);
      expect(formatTime(value, 'HH:mm:ss')).assertEqual('10:09:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0089 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTIMEP1_9000
     * @tc.name      testFormatTime0090
     * @tc.desc      Verify format 'YYYY-MM-DDTHH:mm:ss' for local date component row 89.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFormatTime0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0090 begin');
      const value: Date = new Date(2020, 0, 1, 10, 9, 59);
      expect(formatTime(value, 'YYYY-MM-DDTHH:mm:ss')).assertEqual('2020-01-01T10:09:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0090 end');
    })

  })
}
