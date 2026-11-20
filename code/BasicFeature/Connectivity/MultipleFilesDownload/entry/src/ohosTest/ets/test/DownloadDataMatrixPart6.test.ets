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
import { downloadFilesData } from 'multiplefilesdownload/src/main/ets/model/dataType';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_MultipleFilesDownload]';

export default function DownloadDataMatrixPart6Test(): void {
  describe('DownloadDataMatrixPart6', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_0100
     * @tc.name      testDownloadData0351
     * @tc.desc      Verify download data row 350 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0351 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir350/file_350.dat', 0, 350000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other350/second_350.bin', 1, 350500);
      expect(first.url).assertEqual('https://example.com/dir350/file_350.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(350000);
      expect(second.url).assertEqual('https://example.com/other350/second_350.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(350500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0351 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_0200
     * @tc.name      testDownloadData0352
     * @tc.desc      Verify download data row 351 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0352 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir351/file_351.dat', 1, 351000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other351/second_351.bin', 2, 351500);
      expect(first.url).assertEqual('https://example.com/dir351/file_351.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(351000);
      expect(second.url).assertEqual('https://example.com/other351/second_351.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(351500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0352 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_0300
     * @tc.name      testDownloadData0353
     * @tc.desc      Verify download data row 352 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0353 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir352/file_352.dat', 2, 352000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other352/second_352.bin', 3, 352500);
      expect(first.url).assertEqual('https://example.com/dir352/file_352.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(352000);
      expect(second.url).assertEqual('https://example.com/other352/second_352.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(352500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0353 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_0400
     * @tc.name      testDownloadData0354
     * @tc.desc      Verify download data row 353 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0354 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir353/file_353.dat', 3, 353000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other353/second_353.bin', 4, 353500);
      expect(first.url).assertEqual('https://example.com/dir353/file_353.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(353000);
      expect(second.url).assertEqual('https://example.com/other353/second_353.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(353500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0354 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_0500
     * @tc.name      testDownloadData0355
     * @tc.desc      Verify download data row 354 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0355 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir354/file_354.dat', 4, 354000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other354/second_354.bin', 0, 354500);
      expect(first.url).assertEqual('https://example.com/dir354/file_354.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(354000);
      expect(second.url).assertEqual('https://example.com/other354/second_354.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(354500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0355 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_0600
     * @tc.name      testDownloadData0356
     * @tc.desc      Verify download data row 355 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0356 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir355/file_355.dat', 0, 355000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other355/second_355.bin', 1, 355500);
      expect(first.url).assertEqual('https://example.com/dir355/file_355.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(355000);
      expect(second.url).assertEqual('https://example.com/other355/second_355.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(355500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0356 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_0700
     * @tc.name      testDownloadData0357
     * @tc.desc      Verify download data row 356 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0357 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir356/file_356.dat', 1, 356000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other356/second_356.bin', 2, 356500);
      expect(first.url).assertEqual('https://example.com/dir356/file_356.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(356000);
      expect(second.url).assertEqual('https://example.com/other356/second_356.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(356500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0357 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_0800
     * @tc.name      testDownloadData0358
     * @tc.desc      Verify download data row 357 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0358 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir357/file_357.dat', 2, 357000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other357/second_357.bin', 3, 357500);
      expect(first.url).assertEqual('https://example.com/dir357/file_357.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(357000);
      expect(second.url).assertEqual('https://example.com/other357/second_357.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(357500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0358 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_0900
     * @tc.name      testDownloadData0359
     * @tc.desc      Verify download data row 358 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0359 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir358/file_358.dat', 3, 358000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other358/second_358.bin', 4, 358500);
      expect(first.url).assertEqual('https://example.com/dir358/file_358.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(358000);
      expect(second.url).assertEqual('https://example.com/other358/second_358.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(358500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0359 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_1000
     * @tc.name      testDownloadData0360
     * @tc.desc      Verify download data row 359 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0360 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir359/file_359.dat', 4, 359000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other359/second_359.bin', 0, 359500);
      expect(first.url).assertEqual('https://example.com/dir359/file_359.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(359000);
      expect(second.url).assertEqual('https://example.com/other359/second_359.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(359500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0360 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_1100
     * @tc.name      testDownloadData0361
     * @tc.desc      Verify download data row 360 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0361 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir360/file_360.dat', 0, 360000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other360/second_360.bin', 1, 360500);
      expect(first.url).assertEqual('https://example.com/dir360/file_360.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(360000);
      expect(second.url).assertEqual('https://example.com/other360/second_360.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(360500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0361 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_1200
     * @tc.name      testDownloadData0362
     * @tc.desc      Verify download data row 361 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0362 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir361/file_361.dat', 1, 361000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other361/second_361.bin', 2, 361500);
      expect(first.url).assertEqual('https://example.com/dir361/file_361.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(361000);
      expect(second.url).assertEqual('https://example.com/other361/second_361.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(361500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0362 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_1300
     * @tc.name      testDownloadData0363
     * @tc.desc      Verify download data row 362 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0363 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir362/file_362.dat', 2, 362000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other362/second_362.bin', 3, 362500);
      expect(first.url).assertEqual('https://example.com/dir362/file_362.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(362000);
      expect(second.url).assertEqual('https://example.com/other362/second_362.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(362500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0363 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_1400
     * @tc.name      testDownloadData0364
     * @tc.desc      Verify download data row 363 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0364 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir363/file_363.dat', 3, 363000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other363/second_363.bin', 4, 363500);
      expect(first.url).assertEqual('https://example.com/dir363/file_363.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(363000);
      expect(second.url).assertEqual('https://example.com/other363/second_363.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(363500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0364 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_1500
     * @tc.name      testDownloadData0365
     * @tc.desc      Verify download data row 364 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0365 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir364/file_364.dat', 4, 364000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other364/second_364.bin', 0, 364500);
      expect(first.url).assertEqual('https://example.com/dir364/file_364.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(364000);
      expect(second.url).assertEqual('https://example.com/other364/second_364.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(364500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0365 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_1600
     * @tc.name      testDownloadData0366
     * @tc.desc      Verify download data row 365 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0366 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir365/file_365.dat', 0, 365000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other365/second_365.bin', 1, 365500);
      expect(first.url).assertEqual('https://example.com/dir365/file_365.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(365000);
      expect(second.url).assertEqual('https://example.com/other365/second_365.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(365500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0366 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_1700
     * @tc.name      testDownloadData0367
     * @tc.desc      Verify download data row 366 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0367 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir366/file_366.dat', 1, 366000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other366/second_366.bin', 2, 366500);
      expect(first.url).assertEqual('https://example.com/dir366/file_366.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(366000);
      expect(second.url).assertEqual('https://example.com/other366/second_366.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(366500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0367 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_1800
     * @tc.name      testDownloadData0368
     * @tc.desc      Verify download data row 367 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0368 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir367/file_367.dat', 2, 367000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other367/second_367.bin', 3, 367500);
      expect(first.url).assertEqual('https://example.com/dir367/file_367.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(367000);
      expect(second.url).assertEqual('https://example.com/other367/second_367.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(367500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0368 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_1900
     * @tc.name      testDownloadData0369
     * @tc.desc      Verify download data row 368 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0369 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir368/file_368.dat', 3, 368000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other368/second_368.bin', 4, 368500);
      expect(first.url).assertEqual('https://example.com/dir368/file_368.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(368000);
      expect(second.url).assertEqual('https://example.com/other368/second_368.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(368500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0369 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_2000
     * @tc.name      testDownloadData0370
     * @tc.desc      Verify download data row 369 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0370 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir369/file_369.dat', 4, 369000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other369/second_369.bin', 0, 369500);
      expect(first.url).assertEqual('https://example.com/dir369/file_369.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(369000);
      expect(second.url).assertEqual('https://example.com/other369/second_369.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(369500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0370 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_2100
     * @tc.name      testDownloadData0371
     * @tc.desc      Verify download data row 370 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0371 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir370/file_370.dat', 0, 370000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other370/second_370.bin', 1, 370500);
      expect(first.url).assertEqual('https://example.com/dir370/file_370.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(370000);
      expect(second.url).assertEqual('https://example.com/other370/second_370.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(370500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0371 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_2200
     * @tc.name      testDownloadData0372
     * @tc.desc      Verify download data row 371 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0372 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir371/file_371.dat', 1, 371000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other371/second_371.bin', 2, 371500);
      expect(first.url).assertEqual('https://example.com/dir371/file_371.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(371000);
      expect(second.url).assertEqual('https://example.com/other371/second_371.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(371500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0372 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_2300
     * @tc.name      testDownloadData0373
     * @tc.desc      Verify download data row 372 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0373', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0373 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir372/file_372.dat', 2, 372000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other372/second_372.bin', 3, 372500);
      expect(first.url).assertEqual('https://example.com/dir372/file_372.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(372000);
      expect(second.url).assertEqual('https://example.com/other372/second_372.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(372500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0373 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_2400
     * @tc.name      testDownloadData0374
     * @tc.desc      Verify download data row 373 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0374', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0374 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir373/file_373.dat', 3, 373000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other373/second_373.bin', 4, 373500);
      expect(first.url).assertEqual('https://example.com/dir373/file_373.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(373000);
      expect(second.url).assertEqual('https://example.com/other373/second_373.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(373500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0374 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_2500
     * @tc.name      testDownloadData0375
     * @tc.desc      Verify download data row 374 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0375', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0375 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir374/file_374.dat', 4, 374000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other374/second_374.bin', 0, 374500);
      expect(first.url).assertEqual('https://example.com/dir374/file_374.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(374000);
      expect(second.url).assertEqual('https://example.com/other374/second_374.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(374500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0375 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_2600
     * @tc.name      testDownloadData0376
     * @tc.desc      Verify download data row 375 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0376', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0376 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir375/file_375.dat', 0, 375000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other375/second_375.bin', 1, 375500);
      expect(first.url).assertEqual('https://example.com/dir375/file_375.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(375000);
      expect(second.url).assertEqual('https://example.com/other375/second_375.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(375500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0376 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_2700
     * @tc.name      testDownloadData0377
     * @tc.desc      Verify download data row 376 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0377', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0377 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir376/file_376.dat', 1, 376000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other376/second_376.bin', 2, 376500);
      expect(first.url).assertEqual('https://example.com/dir376/file_376.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(376000);
      expect(second.url).assertEqual('https://example.com/other376/second_376.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(376500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0377 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_2800
     * @tc.name      testDownloadData0378
     * @tc.desc      Verify download data row 377 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0378', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0378 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir377/file_377.dat', 2, 377000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other377/second_377.bin', 3, 377500);
      expect(first.url).assertEqual('https://example.com/dir377/file_377.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(377000);
      expect(second.url).assertEqual('https://example.com/other377/second_377.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(377500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0378 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_2900
     * @tc.name      testDownloadData0379
     * @tc.desc      Verify download data row 378 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0379 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir378/file_378.dat', 3, 378000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other378/second_378.bin', 4, 378500);
      expect(first.url).assertEqual('https://example.com/dir378/file_378.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(378000);
      expect(second.url).assertEqual('https://example.com/other378/second_378.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(378500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0379 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_3000
     * @tc.name      testDownloadData0380
     * @tc.desc      Verify download data row 379 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0380', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0380 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir379/file_379.dat', 4, 379000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other379/second_379.bin', 0, 379500);
      expect(first.url).assertEqual('https://example.com/dir379/file_379.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(379000);
      expect(second.url).assertEqual('https://example.com/other379/second_379.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(379500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0380 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_3100
     * @tc.name      testDownloadData0381
     * @tc.desc      Verify download data row 380 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0381 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir380/file_380.dat', 0, 380000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other380/second_380.bin', 1, 380500);
      expect(first.url).assertEqual('https://example.com/dir380/file_380.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(380000);
      expect(second.url).assertEqual('https://example.com/other380/second_380.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(380500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0381 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_3200
     * @tc.name      testDownloadData0382
     * @tc.desc      Verify download data row 381 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0382', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0382 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir381/file_381.dat', 1, 381000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other381/second_381.bin', 2, 381500);
      expect(first.url).assertEqual('https://example.com/dir381/file_381.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(381000);
      expect(second.url).assertEqual('https://example.com/other381/second_381.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(381500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0382 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_3300
     * @tc.name      testDownloadData0383
     * @tc.desc      Verify download data row 382 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0383', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0383 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir382/file_382.dat', 2, 382000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other382/second_382.bin', 3, 382500);
      expect(first.url).assertEqual('https://example.com/dir382/file_382.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(382000);
      expect(second.url).assertEqual('https://example.com/other382/second_382.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(382500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0383 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_3400
     * @tc.name      testDownloadData0384
     * @tc.desc      Verify download data row 383 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0384', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0384 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir383/file_383.dat', 3, 383000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other383/second_383.bin', 4, 383500);
      expect(first.url).assertEqual('https://example.com/dir383/file_383.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(383000);
      expect(second.url).assertEqual('https://example.com/other383/second_383.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(383500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0384 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_3500
     * @tc.name      testDownloadData0385
     * @tc.desc      Verify download data row 384 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0385 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir384/file_384.dat', 4, 384000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other384/second_384.bin', 0, 384500);
      expect(first.url).assertEqual('https://example.com/dir384/file_384.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(384000);
      expect(second.url).assertEqual('https://example.com/other384/second_384.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(384500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0385 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_3600
     * @tc.name      testDownloadData0386
     * @tc.desc      Verify download data row 385 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0386 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir385/file_385.dat', 0, 385000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other385/second_385.bin', 1, 385500);
      expect(first.url).assertEqual('https://example.com/dir385/file_385.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(385000);
      expect(second.url).assertEqual('https://example.com/other385/second_385.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(385500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0386 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_3700
     * @tc.name      testDownloadData0387
     * @tc.desc      Verify download data row 386 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0387 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir386/file_386.dat', 1, 386000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other386/second_386.bin', 2, 386500);
      expect(first.url).assertEqual('https://example.com/dir386/file_386.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(386000);
      expect(second.url).assertEqual('https://example.com/other386/second_386.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(386500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0387 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_3800
     * @tc.name      testDownloadData0388
     * @tc.desc      Verify download data row 387 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0388 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir387/file_387.dat', 2, 387000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other387/second_387.bin', 3, 387500);
      expect(first.url).assertEqual('https://example.com/dir387/file_387.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(387000);
      expect(second.url).assertEqual('https://example.com/other387/second_387.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(387500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0388 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_3900
     * @tc.name      testDownloadData0389
     * @tc.desc      Verify download data row 388 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0389 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir388/file_388.dat', 3, 388000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other388/second_388.bin', 4, 388500);
      expect(first.url).assertEqual('https://example.com/dir388/file_388.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(388000);
      expect(second.url).assertEqual('https://example.com/other388/second_388.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(388500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0389 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_4000
     * @tc.name      testDownloadData0390
     * @tc.desc      Verify download data row 389 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0390 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir389/file_389.dat', 4, 389000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other389/second_389.bin', 0, 389500);
      expect(first.url).assertEqual('https://example.com/dir389/file_389.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(389000);
      expect(second.url).assertEqual('https://example.com/other389/second_389.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(389500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0390 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_4100
     * @tc.name      testDownloadData0391
     * @tc.desc      Verify download data row 390 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0391 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir390/file_390.dat', 0, 390000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other390/second_390.bin', 1, 390500);
      expect(first.url).assertEqual('https://example.com/dir390/file_390.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(390000);
      expect(second.url).assertEqual('https://example.com/other390/second_390.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(390500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0391 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_4200
     * @tc.name      testDownloadData0392
     * @tc.desc      Verify download data row 391 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0392 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir391/file_391.dat', 1, 391000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other391/second_391.bin', 2, 391500);
      expect(first.url).assertEqual('https://example.com/dir391/file_391.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(391000);
      expect(second.url).assertEqual('https://example.com/other391/second_391.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(391500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0392 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_4300
     * @tc.name      testDownloadData0393
     * @tc.desc      Verify download data row 392 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0393', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0393 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir392/file_392.dat', 2, 392000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other392/second_392.bin', 3, 392500);
      expect(first.url).assertEqual('https://example.com/dir392/file_392.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(392000);
      expect(second.url).assertEqual('https://example.com/other392/second_392.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(392500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0393 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_4400
     * @tc.name      testDownloadData0394
     * @tc.desc      Verify download data row 393 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0394 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir393/file_393.dat', 3, 393000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other393/second_393.bin', 4, 393500);
      expect(first.url).assertEqual('https://example.com/dir393/file_393.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(393000);
      expect(second.url).assertEqual('https://example.com/other393/second_393.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(393500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0394 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_4500
     * @tc.name      testDownloadData0395
     * @tc.desc      Verify download data row 394 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0395 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir394/file_394.dat', 4, 394000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other394/second_394.bin', 0, 394500);
      expect(first.url).assertEqual('https://example.com/dir394/file_394.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(394000);
      expect(second.url).assertEqual('https://example.com/other394/second_394.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(394500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0395 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_4600
     * @tc.name      testDownloadData0396
     * @tc.desc      Verify download data row 395 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0396 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir395/file_395.dat', 0, 395000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other395/second_395.bin', 1, 395500);
      expect(first.url).assertEqual('https://example.com/dir395/file_395.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(395000);
      expect(second.url).assertEqual('https://example.com/other395/second_395.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(395500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0396 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_4700
     * @tc.name      testDownloadData0397
     * @tc.desc      Verify download data row 396 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0397 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir396/file_396.dat', 1, 396000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other396/second_396.bin', 2, 396500);
      expect(first.url).assertEqual('https://example.com/dir396/file_396.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(396000);
      expect(second.url).assertEqual('https://example.com/other396/second_396.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(396500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0397 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_4800
     * @tc.name      testDownloadData0398
     * @tc.desc      Verify download data row 397 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0398 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir397/file_397.dat', 2, 397000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other397/second_397.bin', 3, 397500);
      expect(first.url).assertEqual('https://example.com/dir397/file_397.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(397000);
      expect(second.url).assertEqual('https://example.com/other397/second_397.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(397500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0398 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_4900
     * @tc.name      testDownloadData0399
     * @tc.desc      Verify download data row 398 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0399', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0399 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir398/file_398.dat', 3, 398000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other398/second_398.bin', 4, 398500);
      expect(first.url).assertEqual('https://example.com/dir398/file_398.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(398000);
      expect(second.url).assertEqual('https://example.com/other398/second_398.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(398500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0399 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_5000
     * @tc.name      testDownloadData0400
     * @tc.desc      Verify download data row 399 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0400 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir399/file_399.dat', 4, 399000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other399/second_399.bin', 0, 399500);
      expect(first.url).assertEqual('https://example.com/dir399/file_399.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(399000);
      expect(second.url).assertEqual('https://example.com/other399/second_399.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(399500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0400 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_5100
     * @tc.name      testDownloadData0401
     * @tc.desc      Verify download data row 400 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0401 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir400/file_400.dat', 0, 400000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other400/second_400.bin', 1, 400500);
      expect(first.url).assertEqual('https://example.com/dir400/file_400.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(400000);
      expect(second.url).assertEqual('https://example.com/other400/second_400.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(400500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0401 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_5200
     * @tc.name      testDownloadData0402
     * @tc.desc      Verify download data row 401 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0402 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir401/file_401.dat', 1, 401000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other401/second_401.bin', 2, 401500);
      expect(first.url).assertEqual('https://example.com/dir401/file_401.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(401000);
      expect(second.url).assertEqual('https://example.com/other401/second_401.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(401500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0402 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_5300
     * @tc.name      testDownloadData0403
     * @tc.desc      Verify download data row 402 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0403 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir402/file_402.dat', 2, 402000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other402/second_402.bin', 3, 402500);
      expect(first.url).assertEqual('https://example.com/dir402/file_402.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(402000);
      expect(second.url).assertEqual('https://example.com/other402/second_402.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(402500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0403 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_5400
     * @tc.name      testDownloadData0404
     * @tc.desc      Verify download data row 403 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0404 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir403/file_403.dat', 3, 403000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other403/second_403.bin', 4, 403500);
      expect(first.url).assertEqual('https://example.com/dir403/file_403.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(403000);
      expect(second.url).assertEqual('https://example.com/other403/second_403.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(403500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0404 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_5500
     * @tc.name      testDownloadData0405
     * @tc.desc      Verify download data row 404 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0405 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir404/file_404.dat', 4, 404000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other404/second_404.bin', 0, 404500);
      expect(first.url).assertEqual('https://example.com/dir404/file_404.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(404000);
      expect(second.url).assertEqual('https://example.com/other404/second_404.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(404500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0405 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_5600
     * @tc.name      testDownloadData0406
     * @tc.desc      Verify download data row 405 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0406 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir405/file_405.dat', 0, 405000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other405/second_405.bin', 1, 405500);
      expect(first.url).assertEqual('https://example.com/dir405/file_405.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(405000);
      expect(second.url).assertEqual('https://example.com/other405/second_405.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(405500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0406 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_5700
     * @tc.name      testDownloadData0407
     * @tc.desc      Verify download data row 406 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0407 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir406/file_406.dat', 1, 406000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other406/second_406.bin', 2, 406500);
      expect(first.url).assertEqual('https://example.com/dir406/file_406.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(406000);
      expect(second.url).assertEqual('https://example.com/other406/second_406.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(406500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0407 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_5800
     * @tc.name      testDownloadData0408
     * @tc.desc      Verify download data row 407 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0408 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir407/file_407.dat', 2, 407000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other407/second_407.bin', 3, 407500);
      expect(first.url).assertEqual('https://example.com/dir407/file_407.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(407000);
      expect(second.url).assertEqual('https://example.com/other407/second_407.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(407500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0408 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_5900
     * @tc.name      testDownloadData0409
     * @tc.desc      Verify download data row 408 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0409 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir408/file_408.dat', 3, 408000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other408/second_408.bin', 4, 408500);
      expect(first.url).assertEqual('https://example.com/dir408/file_408.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(408000);
      expect(second.url).assertEqual('https://example.com/other408/second_408.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(408500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0409 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_6000
     * @tc.name      testDownloadData0410
     * @tc.desc      Verify download data row 409 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0410 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir409/file_409.dat', 4, 409000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other409/second_409.bin', 0, 409500);
      expect(first.url).assertEqual('https://example.com/dir409/file_409.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(409000);
      expect(second.url).assertEqual('https://example.com/other409/second_409.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(409500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0410 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_6100
     * @tc.name      testDownloadData0411
     * @tc.desc      Verify download data row 410 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0411 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir410/file_410.dat', 0, 410000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other410/second_410.bin', 1, 410500);
      expect(first.url).assertEqual('https://example.com/dir410/file_410.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(410000);
      expect(second.url).assertEqual('https://example.com/other410/second_410.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(410500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0411 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_6200
     * @tc.name      testDownloadData0412
     * @tc.desc      Verify download data row 411 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0412 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir411/file_411.dat', 1, 411000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other411/second_411.bin', 2, 411500);
      expect(first.url).assertEqual('https://example.com/dir411/file_411.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(411000);
      expect(second.url).assertEqual('https://example.com/other411/second_411.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(411500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0412 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_6300
     * @tc.name      testDownloadData0413
     * @tc.desc      Verify download data row 412 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0413 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir412/file_412.dat', 2, 412000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other412/second_412.bin', 3, 412500);
      expect(first.url).assertEqual('https://example.com/dir412/file_412.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(412000);
      expect(second.url).assertEqual('https://example.com/other412/second_412.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(412500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0413 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_6400
     * @tc.name      testDownloadData0414
     * @tc.desc      Verify download data row 413 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0414 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir413/file_413.dat', 3, 413000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other413/second_413.bin', 4, 413500);
      expect(first.url).assertEqual('https://example.com/dir413/file_413.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(413000);
      expect(second.url).assertEqual('https://example.com/other413/second_413.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(413500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0414 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_6500
     * @tc.name      testDownloadData0415
     * @tc.desc      Verify download data row 414 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0415 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir414/file_414.dat', 4, 414000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other414/second_414.bin', 0, 414500);
      expect(first.url).assertEqual('https://example.com/dir414/file_414.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(414000);
      expect(second.url).assertEqual('https://example.com/other414/second_414.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(414500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0415 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_6600
     * @tc.name      testDownloadData0416
     * @tc.desc      Verify download data row 415 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0416 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir415/file_415.dat', 0, 415000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other415/second_415.bin', 1, 415500);
      expect(first.url).assertEqual('https://example.com/dir415/file_415.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(415000);
      expect(second.url).assertEqual('https://example.com/other415/second_415.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(415500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0416 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_6700
     * @tc.name      testDownloadData0417
     * @tc.desc      Verify download data row 416 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0417 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir416/file_416.dat', 1, 416000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other416/second_416.bin', 2, 416500);
      expect(first.url).assertEqual('https://example.com/dir416/file_416.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(416000);
      expect(second.url).assertEqual('https://example.com/other416/second_416.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(416500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0417 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_6800
     * @tc.name      testDownloadData0418
     * @tc.desc      Verify download data row 417 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0418 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir417/file_417.dat', 2, 417000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other417/second_417.bin', 3, 417500);
      expect(first.url).assertEqual('https://example.com/dir417/file_417.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(417000);
      expect(second.url).assertEqual('https://example.com/other417/second_417.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(417500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0418 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_6900
     * @tc.name      testDownloadData0419
     * @tc.desc      Verify download data row 418 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0419 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir418/file_418.dat', 3, 418000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other418/second_418.bin', 4, 418500);
      expect(first.url).assertEqual('https://example.com/dir418/file_418.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(418000);
      expect(second.url).assertEqual('https://example.com/other418/second_418.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(418500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0419 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP6_ONE_7000
     * @tc.name      testDownloadData0420
     * @tc.desc      Verify download data row 419 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0420 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir419/file_419.dat', 4, 419000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other419/second_419.bin', 0, 419500);
      expect(first.url).assertEqual('https://example.com/dir419/file_419.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(419000);
      expect(second.url).assertEqual('https://example.com/other419/second_419.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(419500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0420 end');
    })

  })
}
