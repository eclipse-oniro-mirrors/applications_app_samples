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

export default function DownloadDataMatrixPart5Test(): void {
  describe('DownloadDataMatrixPart5', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_28100
     * @tc.name      testDownloadData0281
     * @tc.desc      Verify download data row 280 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0281 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir280/file_280.dat', 0, 280000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other280/second_280.bin', 1, 280500);
      expect(first.url).assertEqual('https://example.com/dir280/file_280.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(280000);
      expect(second.url).assertEqual('https://example.com/other280/second_280.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(280500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0281 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_28200
     * @tc.name      testDownloadData0282
     * @tc.desc      Verify download data row 281 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0282 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir281/file_281.dat', 1, 281000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other281/second_281.bin', 2, 281500);
      expect(first.url).assertEqual('https://example.com/dir281/file_281.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(281000);
      expect(second.url).assertEqual('https://example.com/other281/second_281.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(281500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0282 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_28300
     * @tc.name      testDownloadData0283
     * @tc.desc      Verify download data row 282 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0283 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir282/file_282.dat', 2, 282000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other282/second_282.bin', 3, 282500);
      expect(first.url).assertEqual('https://example.com/dir282/file_282.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(282000);
      expect(second.url).assertEqual('https://example.com/other282/second_282.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(282500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0283 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_28400
     * @tc.name      testDownloadData0284
     * @tc.desc      Verify download data row 283 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0284 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir283/file_283.dat', 3, 283000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other283/second_283.bin', 4, 283500);
      expect(first.url).assertEqual('https://example.com/dir283/file_283.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(283000);
      expect(second.url).assertEqual('https://example.com/other283/second_283.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(283500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0284 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_28500
     * @tc.name      testDownloadData0285
     * @tc.desc      Verify download data row 284 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0285 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir284/file_284.dat', 4, 284000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other284/second_284.bin', 0, 284500);
      expect(first.url).assertEqual('https://example.com/dir284/file_284.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(284000);
      expect(second.url).assertEqual('https://example.com/other284/second_284.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(284500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0285 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_28600
     * @tc.name      testDownloadData0286
     * @tc.desc      Verify download data row 285 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0286 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir285/file_285.dat', 0, 285000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other285/second_285.bin', 1, 285500);
      expect(first.url).assertEqual('https://example.com/dir285/file_285.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(285000);
      expect(second.url).assertEqual('https://example.com/other285/second_285.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(285500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0286 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_28700
     * @tc.name      testDownloadData0287
     * @tc.desc      Verify download data row 286 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0287 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir286/file_286.dat', 1, 286000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other286/second_286.bin', 2, 286500);
      expect(first.url).assertEqual('https://example.com/dir286/file_286.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(286000);
      expect(second.url).assertEqual('https://example.com/other286/second_286.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(286500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0287 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_28800
     * @tc.name      testDownloadData0288
     * @tc.desc      Verify download data row 287 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0288 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir287/file_287.dat', 2, 287000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other287/second_287.bin', 3, 287500);
      expect(first.url).assertEqual('https://example.com/dir287/file_287.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(287000);
      expect(second.url).assertEqual('https://example.com/other287/second_287.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(287500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0288 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_28900
     * @tc.name      testDownloadData0289
     * @tc.desc      Verify download data row 288 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0289 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir288/file_288.dat', 3, 288000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other288/second_288.bin', 4, 288500);
      expect(first.url).assertEqual('https://example.com/dir288/file_288.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(288000);
      expect(second.url).assertEqual('https://example.com/other288/second_288.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(288500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0289 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_29000
     * @tc.name      testDownloadData0290
     * @tc.desc      Verify download data row 289 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0290 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir289/file_289.dat', 4, 289000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other289/second_289.bin', 0, 289500);
      expect(first.url).assertEqual('https://example.com/dir289/file_289.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(289000);
      expect(second.url).assertEqual('https://example.com/other289/second_289.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(289500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0290 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_29100
     * @tc.name      testDownloadData0291
     * @tc.desc      Verify download data row 290 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0291 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir290/file_290.dat', 0, 290000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other290/second_290.bin', 1, 290500);
      expect(first.url).assertEqual('https://example.com/dir290/file_290.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(290000);
      expect(second.url).assertEqual('https://example.com/other290/second_290.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(290500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0291 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_29200
     * @tc.name      testDownloadData0292
     * @tc.desc      Verify download data row 291 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0292 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir291/file_291.dat', 1, 291000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other291/second_291.bin', 2, 291500);
      expect(first.url).assertEqual('https://example.com/dir291/file_291.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(291000);
      expect(second.url).assertEqual('https://example.com/other291/second_291.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(291500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0292 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_29300
     * @tc.name      testDownloadData0293
     * @tc.desc      Verify download data row 292 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0293 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir292/file_292.dat', 2, 292000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other292/second_292.bin', 3, 292500);
      expect(first.url).assertEqual('https://example.com/dir292/file_292.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(292000);
      expect(second.url).assertEqual('https://example.com/other292/second_292.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(292500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0293 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_29400
     * @tc.name      testDownloadData0294
     * @tc.desc      Verify download data row 293 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0294 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir293/file_293.dat', 3, 293000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other293/second_293.bin', 4, 293500);
      expect(first.url).assertEqual('https://example.com/dir293/file_293.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(293000);
      expect(second.url).assertEqual('https://example.com/other293/second_293.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(293500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0294 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_29500
     * @tc.name      testDownloadData0295
     * @tc.desc      Verify download data row 294 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0295 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir294/file_294.dat', 4, 294000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other294/second_294.bin', 0, 294500);
      expect(first.url).assertEqual('https://example.com/dir294/file_294.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(294000);
      expect(second.url).assertEqual('https://example.com/other294/second_294.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(294500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0295 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_29600
     * @tc.name      testDownloadData0296
     * @tc.desc      Verify download data row 295 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0296 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir295/file_295.dat', 0, 295000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other295/second_295.bin', 1, 295500);
      expect(first.url).assertEqual('https://example.com/dir295/file_295.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(295000);
      expect(second.url).assertEqual('https://example.com/other295/second_295.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(295500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0296 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_29700
     * @tc.name      testDownloadData0297
     * @tc.desc      Verify download data row 296 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0297 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir296/file_296.dat', 1, 296000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other296/second_296.bin', 2, 296500);
      expect(first.url).assertEqual('https://example.com/dir296/file_296.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(296000);
      expect(second.url).assertEqual('https://example.com/other296/second_296.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(296500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0297 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_29800
     * @tc.name      testDownloadData0298
     * @tc.desc      Verify download data row 297 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0298 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir297/file_297.dat', 2, 297000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other297/second_297.bin', 3, 297500);
      expect(first.url).assertEqual('https://example.com/dir297/file_297.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(297000);
      expect(second.url).assertEqual('https://example.com/other297/second_297.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(297500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0298 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_29900
     * @tc.name      testDownloadData0299
     * @tc.desc      Verify download data row 298 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0299 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir298/file_298.dat', 3, 298000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other298/second_298.bin', 4, 298500);
      expect(first.url).assertEqual('https://example.com/dir298/file_298.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(298000);
      expect(second.url).assertEqual('https://example.com/other298/second_298.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(298500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0299 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_30000
     * @tc.name      testDownloadData0300
     * @tc.desc      Verify download data row 299 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0300 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir299/file_299.dat', 4, 299000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other299/second_299.bin', 0, 299500);
      expect(first.url).assertEqual('https://example.com/dir299/file_299.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(299000);
      expect(second.url).assertEqual('https://example.com/other299/second_299.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(299500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0300 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_30100
     * @tc.name      testDownloadData0301
     * @tc.desc      Verify download data row 300 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0301 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir300/file_300.dat', 0, 300000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other300/second_300.bin', 1, 300500);
      expect(first.url).assertEqual('https://example.com/dir300/file_300.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(300000);
      expect(second.url).assertEqual('https://example.com/other300/second_300.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(300500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0301 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_30200
     * @tc.name      testDownloadData0302
     * @tc.desc      Verify download data row 301 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0302 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir301/file_301.dat', 1, 301000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other301/second_301.bin', 2, 301500);
      expect(first.url).assertEqual('https://example.com/dir301/file_301.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(301000);
      expect(second.url).assertEqual('https://example.com/other301/second_301.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(301500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0302 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_30300
     * @tc.name      testDownloadData0303
     * @tc.desc      Verify download data row 302 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0303 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir302/file_302.dat', 2, 302000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other302/second_302.bin', 3, 302500);
      expect(first.url).assertEqual('https://example.com/dir302/file_302.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(302000);
      expect(second.url).assertEqual('https://example.com/other302/second_302.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(302500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0303 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_30400
     * @tc.name      testDownloadData0304
     * @tc.desc      Verify download data row 303 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0304 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir303/file_303.dat', 3, 303000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other303/second_303.bin', 4, 303500);
      expect(first.url).assertEqual('https://example.com/dir303/file_303.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(303000);
      expect(second.url).assertEqual('https://example.com/other303/second_303.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(303500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0304 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_30500
     * @tc.name      testDownloadData0305
     * @tc.desc      Verify download data row 304 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0305 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir304/file_304.dat', 4, 304000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other304/second_304.bin', 0, 304500);
      expect(first.url).assertEqual('https://example.com/dir304/file_304.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(304000);
      expect(second.url).assertEqual('https://example.com/other304/second_304.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(304500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0305 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_30600
     * @tc.name      testDownloadData0306
     * @tc.desc      Verify download data row 305 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0306 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir305/file_305.dat', 0, 305000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other305/second_305.bin', 1, 305500);
      expect(first.url).assertEqual('https://example.com/dir305/file_305.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(305000);
      expect(second.url).assertEqual('https://example.com/other305/second_305.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(305500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0306 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_30700
     * @tc.name      testDownloadData0307
     * @tc.desc      Verify download data row 306 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0307 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir306/file_306.dat', 1, 306000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other306/second_306.bin', 2, 306500);
      expect(first.url).assertEqual('https://example.com/dir306/file_306.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(306000);
      expect(second.url).assertEqual('https://example.com/other306/second_306.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(306500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0307 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_30800
     * @tc.name      testDownloadData0308
     * @tc.desc      Verify download data row 307 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0308 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir307/file_307.dat', 2, 307000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other307/second_307.bin', 3, 307500);
      expect(first.url).assertEqual('https://example.com/dir307/file_307.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(307000);
      expect(second.url).assertEqual('https://example.com/other307/second_307.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(307500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0308 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_30900
     * @tc.name      testDownloadData0309
     * @tc.desc      Verify download data row 308 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0309 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir308/file_308.dat', 3, 308000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other308/second_308.bin', 4, 308500);
      expect(first.url).assertEqual('https://example.com/dir308/file_308.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(308000);
      expect(second.url).assertEqual('https://example.com/other308/second_308.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(308500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0309 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_31000
     * @tc.name      testDownloadData0310
     * @tc.desc      Verify download data row 309 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0310 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir309/file_309.dat', 4, 309000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other309/second_309.bin', 0, 309500);
      expect(first.url).assertEqual('https://example.com/dir309/file_309.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(309000);
      expect(second.url).assertEqual('https://example.com/other309/second_309.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(309500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0310 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_31100
     * @tc.name      testDownloadData0311
     * @tc.desc      Verify download data row 310 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0311 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir310/file_310.dat', 0, 310000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other310/second_310.bin', 1, 310500);
      expect(first.url).assertEqual('https://example.com/dir310/file_310.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(310000);
      expect(second.url).assertEqual('https://example.com/other310/second_310.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(310500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0311 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_31200
     * @tc.name      testDownloadData0312
     * @tc.desc      Verify download data row 311 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0312 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir311/file_311.dat', 1, 311000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other311/second_311.bin', 2, 311500);
      expect(first.url).assertEqual('https://example.com/dir311/file_311.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(311000);
      expect(second.url).assertEqual('https://example.com/other311/second_311.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(311500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0312 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_31300
     * @tc.name      testDownloadData0313
     * @tc.desc      Verify download data row 312 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0313 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir312/file_312.dat', 2, 312000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other312/second_312.bin', 3, 312500);
      expect(first.url).assertEqual('https://example.com/dir312/file_312.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(312000);
      expect(second.url).assertEqual('https://example.com/other312/second_312.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(312500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0313 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_31400
     * @tc.name      testDownloadData0314
     * @tc.desc      Verify download data row 313 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0314 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir313/file_313.dat', 3, 313000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other313/second_313.bin', 4, 313500);
      expect(first.url).assertEqual('https://example.com/dir313/file_313.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(313000);
      expect(second.url).assertEqual('https://example.com/other313/second_313.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(313500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0314 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_31500
     * @tc.name      testDownloadData0315
     * @tc.desc      Verify download data row 314 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0315 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir314/file_314.dat', 4, 314000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other314/second_314.bin', 0, 314500);
      expect(first.url).assertEqual('https://example.com/dir314/file_314.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(314000);
      expect(second.url).assertEqual('https://example.com/other314/second_314.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(314500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0315 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_31600
     * @tc.name      testDownloadData0316
     * @tc.desc      Verify download data row 315 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0316 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir315/file_315.dat', 0, 315000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other315/second_315.bin', 1, 315500);
      expect(first.url).assertEqual('https://example.com/dir315/file_315.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(315000);
      expect(second.url).assertEqual('https://example.com/other315/second_315.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(315500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0316 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_31700
     * @tc.name      testDownloadData0317
     * @tc.desc      Verify download data row 316 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0317 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir316/file_316.dat', 1, 316000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other316/second_316.bin', 2, 316500);
      expect(first.url).assertEqual('https://example.com/dir316/file_316.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(316000);
      expect(second.url).assertEqual('https://example.com/other316/second_316.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(316500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0317 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_31800
     * @tc.name      testDownloadData0318
     * @tc.desc      Verify download data row 317 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0318 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir317/file_317.dat', 2, 317000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other317/second_317.bin', 3, 317500);
      expect(first.url).assertEqual('https://example.com/dir317/file_317.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(317000);
      expect(second.url).assertEqual('https://example.com/other317/second_317.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(317500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0318 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_31900
     * @tc.name      testDownloadData0319
     * @tc.desc      Verify download data row 318 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0319 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir318/file_318.dat', 3, 318000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other318/second_318.bin', 4, 318500);
      expect(first.url).assertEqual('https://example.com/dir318/file_318.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(318000);
      expect(second.url).assertEqual('https://example.com/other318/second_318.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(318500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0319 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_32000
     * @tc.name      testDownloadData0320
     * @tc.desc      Verify download data row 319 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0320 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir319/file_319.dat', 4, 319000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other319/second_319.bin', 0, 319500);
      expect(first.url).assertEqual('https://example.com/dir319/file_319.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(319000);
      expect(second.url).assertEqual('https://example.com/other319/second_319.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(319500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0320 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_32100
     * @tc.name      testDownloadData0321
     * @tc.desc      Verify download data row 320 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0321 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir320/file_320.dat', 0, 320000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other320/second_320.bin', 1, 320500);
      expect(first.url).assertEqual('https://example.com/dir320/file_320.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(320000);
      expect(second.url).assertEqual('https://example.com/other320/second_320.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(320500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0321 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_32200
     * @tc.name      testDownloadData0322
     * @tc.desc      Verify download data row 321 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0322 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir321/file_321.dat', 1, 321000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other321/second_321.bin', 2, 321500);
      expect(first.url).assertEqual('https://example.com/dir321/file_321.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(321000);
      expect(second.url).assertEqual('https://example.com/other321/second_321.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(321500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0322 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_32300
     * @tc.name      testDownloadData0323
     * @tc.desc      Verify download data row 322 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0323 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir322/file_322.dat', 2, 322000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other322/second_322.bin', 3, 322500);
      expect(first.url).assertEqual('https://example.com/dir322/file_322.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(322000);
      expect(second.url).assertEqual('https://example.com/other322/second_322.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(322500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0323 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_32400
     * @tc.name      testDownloadData0324
     * @tc.desc      Verify download data row 323 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0324 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir323/file_323.dat', 3, 323000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other323/second_323.bin', 4, 323500);
      expect(first.url).assertEqual('https://example.com/dir323/file_323.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(323000);
      expect(second.url).assertEqual('https://example.com/other323/second_323.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(323500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0324 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_32500
     * @tc.name      testDownloadData0325
     * @tc.desc      Verify download data row 324 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0325 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir324/file_324.dat', 4, 324000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other324/second_324.bin', 0, 324500);
      expect(first.url).assertEqual('https://example.com/dir324/file_324.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(324000);
      expect(second.url).assertEqual('https://example.com/other324/second_324.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(324500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0325 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_32600
     * @tc.name      testDownloadData0326
     * @tc.desc      Verify download data row 325 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0326 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir325/file_325.dat', 0, 325000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other325/second_325.bin', 1, 325500);
      expect(first.url).assertEqual('https://example.com/dir325/file_325.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(325000);
      expect(second.url).assertEqual('https://example.com/other325/second_325.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(325500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0326 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_32700
     * @tc.name      testDownloadData0327
     * @tc.desc      Verify download data row 326 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0327 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir326/file_326.dat', 1, 326000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other326/second_326.bin', 2, 326500);
      expect(first.url).assertEqual('https://example.com/dir326/file_326.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(326000);
      expect(second.url).assertEqual('https://example.com/other326/second_326.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(326500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0327 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_32800
     * @tc.name      testDownloadData0328
     * @tc.desc      Verify download data row 327 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0328 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir327/file_327.dat', 2, 327000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other327/second_327.bin', 3, 327500);
      expect(first.url).assertEqual('https://example.com/dir327/file_327.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(327000);
      expect(second.url).assertEqual('https://example.com/other327/second_327.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(327500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0328 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_32900
     * @tc.name      testDownloadData0329
     * @tc.desc      Verify download data row 328 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0329 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir328/file_328.dat', 3, 328000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other328/second_328.bin', 4, 328500);
      expect(first.url).assertEqual('https://example.com/dir328/file_328.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(328000);
      expect(second.url).assertEqual('https://example.com/other328/second_328.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(328500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0329 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_33000
     * @tc.name      testDownloadData0330
     * @tc.desc      Verify download data row 329 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0330 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir329/file_329.dat', 4, 329000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other329/second_329.bin', 0, 329500);
      expect(first.url).assertEqual('https://example.com/dir329/file_329.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(329000);
      expect(second.url).assertEqual('https://example.com/other329/second_329.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(329500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0330 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_33100
     * @tc.name      testDownloadData0331
     * @tc.desc      Verify download data row 330 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0331 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir330/file_330.dat', 0, 330000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other330/second_330.bin', 1, 330500);
      expect(first.url).assertEqual('https://example.com/dir330/file_330.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(330000);
      expect(second.url).assertEqual('https://example.com/other330/second_330.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(330500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0331 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_33200
     * @tc.name      testDownloadData0332
     * @tc.desc      Verify download data row 331 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0332 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir331/file_331.dat', 1, 331000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other331/second_331.bin', 2, 331500);
      expect(first.url).assertEqual('https://example.com/dir331/file_331.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(331000);
      expect(second.url).assertEqual('https://example.com/other331/second_331.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(331500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0332 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_33300
     * @tc.name      testDownloadData0333
     * @tc.desc      Verify download data row 332 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0333 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir332/file_332.dat', 2, 332000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other332/second_332.bin', 3, 332500);
      expect(first.url).assertEqual('https://example.com/dir332/file_332.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(332000);
      expect(second.url).assertEqual('https://example.com/other332/second_332.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(332500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0333 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_33400
     * @tc.name      testDownloadData0334
     * @tc.desc      Verify download data row 333 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0334 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir333/file_333.dat', 3, 333000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other333/second_333.bin', 4, 333500);
      expect(first.url).assertEqual('https://example.com/dir333/file_333.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(333000);
      expect(second.url).assertEqual('https://example.com/other333/second_333.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(333500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0334 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_33500
     * @tc.name      testDownloadData0335
     * @tc.desc      Verify download data row 334 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0335 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir334/file_334.dat', 4, 334000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other334/second_334.bin', 0, 334500);
      expect(first.url).assertEqual('https://example.com/dir334/file_334.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(334000);
      expect(second.url).assertEqual('https://example.com/other334/second_334.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(334500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0335 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_33600
     * @tc.name      testDownloadData0336
     * @tc.desc      Verify download data row 335 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0336 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir335/file_335.dat', 0, 335000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other335/second_335.bin', 1, 335500);
      expect(first.url).assertEqual('https://example.com/dir335/file_335.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(335000);
      expect(second.url).assertEqual('https://example.com/other335/second_335.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(335500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0336 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_33700
     * @tc.name      testDownloadData0337
     * @tc.desc      Verify download data row 336 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0337 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir336/file_336.dat', 1, 336000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other336/second_336.bin', 2, 336500);
      expect(first.url).assertEqual('https://example.com/dir336/file_336.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(336000);
      expect(second.url).assertEqual('https://example.com/other336/second_336.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(336500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0337 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_33800
     * @tc.name      testDownloadData0338
     * @tc.desc      Verify download data row 337 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0338 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir337/file_337.dat', 2, 337000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other337/second_337.bin', 3, 337500);
      expect(first.url).assertEqual('https://example.com/dir337/file_337.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(337000);
      expect(second.url).assertEqual('https://example.com/other337/second_337.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(337500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0338 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_33900
     * @tc.name      testDownloadData0339
     * @tc.desc      Verify download data row 338 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0339 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir338/file_338.dat', 3, 338000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other338/second_338.bin', 4, 338500);
      expect(first.url).assertEqual('https://example.com/dir338/file_338.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(338000);
      expect(second.url).assertEqual('https://example.com/other338/second_338.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(338500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0339 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_34000
     * @tc.name      testDownloadData0340
     * @tc.desc      Verify download data row 339 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0340 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir339/file_339.dat', 4, 339000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other339/second_339.bin', 0, 339500);
      expect(first.url).assertEqual('https://example.com/dir339/file_339.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(339000);
      expect(second.url).assertEqual('https://example.com/other339/second_339.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(339500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0340 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_34100
     * @tc.name      testDownloadData0341
     * @tc.desc      Verify download data row 340 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0341 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir340/file_340.dat', 0, 340000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other340/second_340.bin', 1, 340500);
      expect(first.url).assertEqual('https://example.com/dir340/file_340.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(340000);
      expect(second.url).assertEqual('https://example.com/other340/second_340.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(340500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0341 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_34200
     * @tc.name      testDownloadData0342
     * @tc.desc      Verify download data row 341 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0342 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir341/file_341.dat', 1, 341000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other341/second_341.bin', 2, 341500);
      expect(first.url).assertEqual('https://example.com/dir341/file_341.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(341000);
      expect(second.url).assertEqual('https://example.com/other341/second_341.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(341500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0342 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_34300
     * @tc.name      testDownloadData0343
     * @tc.desc      Verify download data row 342 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0343 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir342/file_342.dat', 2, 342000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other342/second_342.bin', 3, 342500);
      expect(first.url).assertEqual('https://example.com/dir342/file_342.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(342000);
      expect(second.url).assertEqual('https://example.com/other342/second_342.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(342500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0343 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_34400
     * @tc.name      testDownloadData0344
     * @tc.desc      Verify download data row 343 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0344 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir343/file_343.dat', 3, 343000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other343/second_343.bin', 4, 343500);
      expect(first.url).assertEqual('https://example.com/dir343/file_343.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(343000);
      expect(second.url).assertEqual('https://example.com/other343/second_343.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(343500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0344 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_34500
     * @tc.name      testDownloadData0345
     * @tc.desc      Verify download data row 344 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0345 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir344/file_344.dat', 4, 344000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other344/second_344.bin', 0, 344500);
      expect(first.url).assertEqual('https://example.com/dir344/file_344.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(344000);
      expect(second.url).assertEqual('https://example.com/other344/second_344.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(344500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0345 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_34600
     * @tc.name      testDownloadData0346
     * @tc.desc      Verify download data row 345 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0346 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir345/file_345.dat', 0, 345000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other345/second_345.bin', 1, 345500);
      expect(first.url).assertEqual('https://example.com/dir345/file_345.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(345000);
      expect(second.url).assertEqual('https://example.com/other345/second_345.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(345500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0346 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_34700
     * @tc.name      testDownloadData0347
     * @tc.desc      Verify download data row 346 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0347 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir346/file_346.dat', 1, 346000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other346/second_346.bin', 2, 346500);
      expect(first.url).assertEqual('https://example.com/dir346/file_346.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(346000);
      expect(second.url).assertEqual('https://example.com/other346/second_346.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(346500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0347 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_34800
     * @tc.name      testDownloadData0348
     * @tc.desc      Verify download data row 347 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0348 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir347/file_347.dat', 2, 347000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other347/second_347.bin', 3, 347500);
      expect(first.url).assertEqual('https://example.com/dir347/file_347.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(347000);
      expect(second.url).assertEqual('https://example.com/other347/second_347.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(347500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0348 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_34900
     * @tc.name      testDownloadData0349
     * @tc.desc      Verify download data row 348 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0349 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir348/file_348.dat', 3, 348000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other348/second_348.bin', 4, 348500);
      expect(first.url).assertEqual('https://example.com/dir348/file_348.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(348000);
      expect(second.url).assertEqual('https://example.com/other348/second_348.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(348500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0349 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP5_35000
     * @tc.name      testDownloadData0350
     * @tc.desc      Verify download data row 349 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0350 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir349/file_349.dat', 4, 349000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other349/second_349.bin', 0, 349500);
      expect(first.url).assertEqual('https://example.com/dir349/file_349.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(349000);
      expect(second.url).assertEqual('https://example.com/other349/second_349.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(349500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0350 end');
    })

  })
}
