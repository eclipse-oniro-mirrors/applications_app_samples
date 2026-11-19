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

export default function DownloadDataMatrixPart1Test(): void {
  describe('DownloadDataMatrixPart1', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_0100
     * @tc.name      testDownloadData0001
     * @tc.desc      Verify download data row 0 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0001 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir0/file_0.dat', 0, 0);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other0/second_0.bin', 1, 500);
      expect(first.url).assertEqual('https://example.com/dir0/file_0.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(0);
      expect(second.url).assertEqual('https://example.com/other0/second_0.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0001 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_0200
     * @tc.name      testDownloadData0002
     * @tc.desc      Verify download data row 1 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0002 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir1/file_1.dat', 1, 1000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other1/second_1.bin', 2, 1500);
      expect(first.url).assertEqual('https://example.com/dir1/file_1.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(1000);
      expect(second.url).assertEqual('https://example.com/other1/second_1.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(1500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0002 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_0300
     * @tc.name      testDownloadData0003
     * @tc.desc      Verify download data row 2 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0003 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir2/file_2.dat', 2, 2000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other2/second_2.bin', 3, 2500);
      expect(first.url).assertEqual('https://example.com/dir2/file_2.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(2000);
      expect(second.url).assertEqual('https://example.com/other2/second_2.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(2500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0003 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_0400
     * @tc.name      testDownloadData0004
     * @tc.desc      Verify download data row 3 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0004 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir3/file_3.dat', 3, 3000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other3/second_3.bin', 4, 3500);
      expect(first.url).assertEqual('https://example.com/dir3/file_3.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(3000);
      expect(second.url).assertEqual('https://example.com/other3/second_3.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(3500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0004 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_0500
     * @tc.name      testDownloadData0005
     * @tc.desc      Verify download data row 4 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0005 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir4/file_4.dat', 4, 4000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other4/second_4.bin', 0, 4500);
      expect(first.url).assertEqual('https://example.com/dir4/file_4.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(4000);
      expect(second.url).assertEqual('https://example.com/other4/second_4.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(4500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0005 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_0600
     * @tc.name      testDownloadData0006
     * @tc.desc      Verify download data row 5 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0006 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir5/file_5.dat', 0, 5000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other5/second_5.bin', 1, 5500);
      expect(first.url).assertEqual('https://example.com/dir5/file_5.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(5000);
      expect(second.url).assertEqual('https://example.com/other5/second_5.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(5500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0006 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_0700
     * @tc.name      testDownloadData0007
     * @tc.desc      Verify download data row 6 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0007 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir6/file_6.dat', 1, 6000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other6/second_6.bin', 2, 6500);
      expect(first.url).assertEqual('https://example.com/dir6/file_6.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(6000);
      expect(second.url).assertEqual('https://example.com/other6/second_6.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(6500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0007 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_0800
     * @tc.name      testDownloadData0008
     * @tc.desc      Verify download data row 7 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0008 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir7/file_7.dat', 2, 7000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other7/second_7.bin', 3, 7500);
      expect(first.url).assertEqual('https://example.com/dir7/file_7.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(7000);
      expect(second.url).assertEqual('https://example.com/other7/second_7.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(7500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0008 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_0900
     * @tc.name      testDownloadData0009
     * @tc.desc      Verify download data row 8 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0009 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir8/file_8.dat', 3, 8000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other8/second_8.bin', 4, 8500);
      expect(first.url).assertEqual('https://example.com/dir8/file_8.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(8000);
      expect(second.url).assertEqual('https://example.com/other8/second_8.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(8500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0009 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_1000
     * @tc.name      testDownloadData0010
     * @tc.desc      Verify download data row 9 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0010 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir9/file_9.dat', 4, 9000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other9/second_9.bin', 0, 9500);
      expect(first.url).assertEqual('https://example.com/dir9/file_9.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(9000);
      expect(second.url).assertEqual('https://example.com/other9/second_9.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(9500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0010 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_1100
     * @tc.name      testDownloadData0011
     * @tc.desc      Verify download data row 10 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0011 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir10/file_10.dat', 0, 10000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other10/second_10.bin', 1, 10500);
      expect(first.url).assertEqual('https://example.com/dir10/file_10.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(10000);
      expect(second.url).assertEqual('https://example.com/other10/second_10.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(10500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0011 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_1200
     * @tc.name      testDownloadData0012
     * @tc.desc      Verify download data row 11 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0012 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir11/file_11.dat', 1, 11000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other11/second_11.bin', 2, 11500);
      expect(first.url).assertEqual('https://example.com/dir11/file_11.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(11000);
      expect(second.url).assertEqual('https://example.com/other11/second_11.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(11500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0012 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_1300
     * @tc.name      testDownloadData0013
     * @tc.desc      Verify download data row 12 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0013 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir12/file_12.dat', 2, 12000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other12/second_12.bin', 3, 12500);
      expect(first.url).assertEqual('https://example.com/dir12/file_12.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(12000);
      expect(second.url).assertEqual('https://example.com/other12/second_12.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(12500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0013 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_1400
     * @tc.name      testDownloadData0014
     * @tc.desc      Verify download data row 13 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0014 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir13/file_13.dat', 3, 13000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other13/second_13.bin', 4, 13500);
      expect(first.url).assertEqual('https://example.com/dir13/file_13.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(13000);
      expect(second.url).assertEqual('https://example.com/other13/second_13.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(13500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0014 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_1500
     * @tc.name      testDownloadData0015
     * @tc.desc      Verify download data row 14 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0015 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir14/file_14.dat', 4, 14000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other14/second_14.bin', 0, 14500);
      expect(first.url).assertEqual('https://example.com/dir14/file_14.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(14000);
      expect(second.url).assertEqual('https://example.com/other14/second_14.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(14500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0015 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_1600
     * @tc.name      testDownloadData0016
     * @tc.desc      Verify download data row 15 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0016 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir15/file_15.dat', 0, 15000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other15/second_15.bin', 1, 15500);
      expect(first.url).assertEqual('https://example.com/dir15/file_15.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(15000);
      expect(second.url).assertEqual('https://example.com/other15/second_15.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(15500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0016 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_1700
     * @tc.name      testDownloadData0017
     * @tc.desc      Verify download data row 16 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0017 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir16/file_16.dat', 1, 16000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other16/second_16.bin', 2, 16500);
      expect(first.url).assertEqual('https://example.com/dir16/file_16.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(16000);
      expect(second.url).assertEqual('https://example.com/other16/second_16.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(16500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0017 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_1800
     * @tc.name      testDownloadData0018
     * @tc.desc      Verify download data row 17 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0018 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir17/file_17.dat', 2, 17000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other17/second_17.bin', 3, 17500);
      expect(first.url).assertEqual('https://example.com/dir17/file_17.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(17000);
      expect(second.url).assertEqual('https://example.com/other17/second_17.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(17500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0018 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_1900
     * @tc.name      testDownloadData0019
     * @tc.desc      Verify download data row 18 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0019 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir18/file_18.dat', 3, 18000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other18/second_18.bin', 4, 18500);
      expect(first.url).assertEqual('https://example.com/dir18/file_18.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(18000);
      expect(second.url).assertEqual('https://example.com/other18/second_18.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(18500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0019 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_2000
     * @tc.name      testDownloadData0020
     * @tc.desc      Verify download data row 19 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0020 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir19/file_19.dat', 4, 19000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other19/second_19.bin', 0, 19500);
      expect(first.url).assertEqual('https://example.com/dir19/file_19.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(19000);
      expect(second.url).assertEqual('https://example.com/other19/second_19.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(19500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0020 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_2100
     * @tc.name      testDownloadData0021
     * @tc.desc      Verify download data row 20 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0021 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir20/file_20.dat', 0, 20000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other20/second_20.bin', 1, 20500);
      expect(first.url).assertEqual('https://example.com/dir20/file_20.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(20000);
      expect(second.url).assertEqual('https://example.com/other20/second_20.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(20500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0021 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_2200
     * @tc.name      testDownloadData0022
     * @tc.desc      Verify download data row 21 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0022 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir21/file_21.dat', 1, 21000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other21/second_21.bin', 2, 21500);
      expect(first.url).assertEqual('https://example.com/dir21/file_21.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(21000);
      expect(second.url).assertEqual('https://example.com/other21/second_21.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(21500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0022 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_2300
     * @tc.name      testDownloadData0023
     * @tc.desc      Verify download data row 22 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0023 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir22/file_22.dat', 2, 22000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other22/second_22.bin', 3, 22500);
      expect(first.url).assertEqual('https://example.com/dir22/file_22.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(22000);
      expect(second.url).assertEqual('https://example.com/other22/second_22.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(22500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0023 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_2400
     * @tc.name      testDownloadData0024
     * @tc.desc      Verify download data row 23 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0024 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir23/file_23.dat', 3, 23000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other23/second_23.bin', 4, 23500);
      expect(first.url).assertEqual('https://example.com/dir23/file_23.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(23000);
      expect(second.url).assertEqual('https://example.com/other23/second_23.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(23500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0024 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_2500
     * @tc.name      testDownloadData0025
     * @tc.desc      Verify download data row 24 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0025 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir24/file_24.dat', 4, 24000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other24/second_24.bin', 0, 24500);
      expect(first.url).assertEqual('https://example.com/dir24/file_24.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(24000);
      expect(second.url).assertEqual('https://example.com/other24/second_24.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(24500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0025 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_2600
     * @tc.name      testDownloadData0026
     * @tc.desc      Verify download data row 25 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0026 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir25/file_25.dat', 0, 25000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other25/second_25.bin', 1, 25500);
      expect(first.url).assertEqual('https://example.com/dir25/file_25.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(25000);
      expect(second.url).assertEqual('https://example.com/other25/second_25.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(25500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0026 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_2700
     * @tc.name      testDownloadData0027
     * @tc.desc      Verify download data row 26 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0027 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir26/file_26.dat', 1, 26000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other26/second_26.bin', 2, 26500);
      expect(first.url).assertEqual('https://example.com/dir26/file_26.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(26000);
      expect(second.url).assertEqual('https://example.com/other26/second_26.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(26500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0027 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_2800
     * @tc.name      testDownloadData0028
     * @tc.desc      Verify download data row 27 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0028 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir27/file_27.dat', 2, 27000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other27/second_27.bin', 3, 27500);
      expect(first.url).assertEqual('https://example.com/dir27/file_27.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(27000);
      expect(second.url).assertEqual('https://example.com/other27/second_27.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(27500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0028 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_2900
     * @tc.name      testDownloadData0029
     * @tc.desc      Verify download data row 28 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0029 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir28/file_28.dat', 3, 28000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other28/second_28.bin', 4, 28500);
      expect(first.url).assertEqual('https://example.com/dir28/file_28.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(28000);
      expect(second.url).assertEqual('https://example.com/other28/second_28.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(28500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0029 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_3000
     * @tc.name      testDownloadData0030
     * @tc.desc      Verify download data row 29 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0030 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir29/file_29.dat', 4, 29000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other29/second_29.bin', 0, 29500);
      expect(first.url).assertEqual('https://example.com/dir29/file_29.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(29000);
      expect(second.url).assertEqual('https://example.com/other29/second_29.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(29500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0030 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_3100
     * @tc.name      testDownloadData0031
     * @tc.desc      Verify download data row 30 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0031 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir30/file_30.dat', 0, 30000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other30/second_30.bin', 1, 30500);
      expect(first.url).assertEqual('https://example.com/dir30/file_30.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(30000);
      expect(second.url).assertEqual('https://example.com/other30/second_30.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(30500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0031 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_3200
     * @tc.name      testDownloadData0032
     * @tc.desc      Verify download data row 31 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0032 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir31/file_31.dat', 1, 31000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other31/second_31.bin', 2, 31500);
      expect(first.url).assertEqual('https://example.com/dir31/file_31.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(31000);
      expect(second.url).assertEqual('https://example.com/other31/second_31.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(31500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0032 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_3300
     * @tc.name      testDownloadData0033
     * @tc.desc      Verify download data row 32 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0033 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir32/file_32.dat', 2, 32000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other32/second_32.bin', 3, 32500);
      expect(first.url).assertEqual('https://example.com/dir32/file_32.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(32000);
      expect(second.url).assertEqual('https://example.com/other32/second_32.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(32500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0033 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_3400
     * @tc.name      testDownloadData0034
     * @tc.desc      Verify download data row 33 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0034 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir33/file_33.dat', 3, 33000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other33/second_33.bin', 4, 33500);
      expect(first.url).assertEqual('https://example.com/dir33/file_33.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(33000);
      expect(second.url).assertEqual('https://example.com/other33/second_33.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(33500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0034 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_3500
     * @tc.name      testDownloadData0035
     * @tc.desc      Verify download data row 34 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0035 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir34/file_34.dat', 4, 34000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other34/second_34.bin', 0, 34500);
      expect(first.url).assertEqual('https://example.com/dir34/file_34.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(34000);
      expect(second.url).assertEqual('https://example.com/other34/second_34.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(34500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0035 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_3600
     * @tc.name      testDownloadData0036
     * @tc.desc      Verify download data row 35 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0036 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir35/file_35.dat', 0, 35000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other35/second_35.bin', 1, 35500);
      expect(first.url).assertEqual('https://example.com/dir35/file_35.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(35000);
      expect(second.url).assertEqual('https://example.com/other35/second_35.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(35500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0036 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_3700
     * @tc.name      testDownloadData0037
     * @tc.desc      Verify download data row 36 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0037 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir36/file_36.dat', 1, 36000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other36/second_36.bin', 2, 36500);
      expect(first.url).assertEqual('https://example.com/dir36/file_36.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(36000);
      expect(second.url).assertEqual('https://example.com/other36/second_36.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(36500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0037 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_3800
     * @tc.name      testDownloadData0038
     * @tc.desc      Verify download data row 37 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0038 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir37/file_37.dat', 2, 37000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other37/second_37.bin', 3, 37500);
      expect(first.url).assertEqual('https://example.com/dir37/file_37.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(37000);
      expect(second.url).assertEqual('https://example.com/other37/second_37.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(37500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0038 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_3900
     * @tc.name      testDownloadData0039
     * @tc.desc      Verify download data row 38 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0039 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir38/file_38.dat', 3, 38000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other38/second_38.bin', 4, 38500);
      expect(first.url).assertEqual('https://example.com/dir38/file_38.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(38000);
      expect(second.url).assertEqual('https://example.com/other38/second_38.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(38500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0039 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_4000
     * @tc.name      testDownloadData0040
     * @tc.desc      Verify download data row 39 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0040 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir39/file_39.dat', 4, 39000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other39/second_39.bin', 0, 39500);
      expect(first.url).assertEqual('https://example.com/dir39/file_39.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(39000);
      expect(second.url).assertEqual('https://example.com/other39/second_39.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(39500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0040 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_4100
     * @tc.name      testDownloadData0041
     * @tc.desc      Verify download data row 40 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0041 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir40/file_40.dat', 0, 40000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other40/second_40.bin', 1, 40500);
      expect(first.url).assertEqual('https://example.com/dir40/file_40.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(40000);
      expect(second.url).assertEqual('https://example.com/other40/second_40.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(40500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0041 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_4200
     * @tc.name      testDownloadData0042
     * @tc.desc      Verify download data row 41 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0042 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir41/file_41.dat', 1, 41000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other41/second_41.bin', 2, 41500);
      expect(first.url).assertEqual('https://example.com/dir41/file_41.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(41000);
      expect(second.url).assertEqual('https://example.com/other41/second_41.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(41500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0042 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_4300
     * @tc.name      testDownloadData0043
     * @tc.desc      Verify download data row 42 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0043 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir42/file_42.dat', 2, 42000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other42/second_42.bin', 3, 42500);
      expect(first.url).assertEqual('https://example.com/dir42/file_42.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(42000);
      expect(second.url).assertEqual('https://example.com/other42/second_42.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(42500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0043 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_4400
     * @tc.name      testDownloadData0044
     * @tc.desc      Verify download data row 43 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0044 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir43/file_43.dat', 3, 43000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other43/second_43.bin', 4, 43500);
      expect(first.url).assertEqual('https://example.com/dir43/file_43.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(43000);
      expect(second.url).assertEqual('https://example.com/other43/second_43.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(43500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0044 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_4500
     * @tc.name      testDownloadData0045
     * @tc.desc      Verify download data row 44 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0045 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir44/file_44.dat', 4, 44000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other44/second_44.bin', 0, 44500);
      expect(first.url).assertEqual('https://example.com/dir44/file_44.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(44000);
      expect(second.url).assertEqual('https://example.com/other44/second_44.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(44500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0045 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_4600
     * @tc.name      testDownloadData0046
     * @tc.desc      Verify download data row 45 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0046 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir45/file_45.dat', 0, 45000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other45/second_45.bin', 1, 45500);
      expect(first.url).assertEqual('https://example.com/dir45/file_45.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(45000);
      expect(second.url).assertEqual('https://example.com/other45/second_45.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(45500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0046 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_4700
     * @tc.name      testDownloadData0047
     * @tc.desc      Verify download data row 46 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0047 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir46/file_46.dat', 1, 46000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other46/second_46.bin', 2, 46500);
      expect(first.url).assertEqual('https://example.com/dir46/file_46.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(46000);
      expect(second.url).assertEqual('https://example.com/other46/second_46.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(46500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0047 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_4800
     * @tc.name      testDownloadData0048
     * @tc.desc      Verify download data row 47 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0048 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir47/file_47.dat', 2, 47000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other47/second_47.bin', 3, 47500);
      expect(first.url).assertEqual('https://example.com/dir47/file_47.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(47000);
      expect(second.url).assertEqual('https://example.com/other47/second_47.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(47500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0048 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_4900
     * @tc.name      testDownloadData0049
     * @tc.desc      Verify download data row 48 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0049 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir48/file_48.dat', 3, 48000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other48/second_48.bin', 4, 48500);
      expect(first.url).assertEqual('https://example.com/dir48/file_48.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(48000);
      expect(second.url).assertEqual('https://example.com/other48/second_48.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(48500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0049 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_5000
     * @tc.name      testDownloadData0050
     * @tc.desc      Verify download data row 49 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0050 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir49/file_49.dat', 4, 49000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other49/second_49.bin', 0, 49500);
      expect(first.url).assertEqual('https://example.com/dir49/file_49.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(49000);
      expect(second.url).assertEqual('https://example.com/other49/second_49.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(49500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0050 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_5100
     * @tc.name      testDownloadData0051
     * @tc.desc      Verify download data row 50 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0051 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir50/file_50.dat', 0, 50000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other50/second_50.bin', 1, 50500);
      expect(first.url).assertEqual('https://example.com/dir50/file_50.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(50000);
      expect(second.url).assertEqual('https://example.com/other50/second_50.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(50500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0051 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_5200
     * @tc.name      testDownloadData0052
     * @tc.desc      Verify download data row 51 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0052 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir51/file_51.dat', 1, 51000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other51/second_51.bin', 2, 51500);
      expect(first.url).assertEqual('https://example.com/dir51/file_51.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(51000);
      expect(second.url).assertEqual('https://example.com/other51/second_51.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(51500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0052 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_5300
     * @tc.name      testDownloadData0053
     * @tc.desc      Verify download data row 52 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0053 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir52/file_52.dat', 2, 52000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other52/second_52.bin', 3, 52500);
      expect(first.url).assertEqual('https://example.com/dir52/file_52.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(52000);
      expect(second.url).assertEqual('https://example.com/other52/second_52.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(52500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0053 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_5400
     * @tc.name      testDownloadData0054
     * @tc.desc      Verify download data row 53 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0054 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir53/file_53.dat', 3, 53000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other53/second_53.bin', 4, 53500);
      expect(first.url).assertEqual('https://example.com/dir53/file_53.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(53000);
      expect(second.url).assertEqual('https://example.com/other53/second_53.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(53500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0054 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_5500
     * @tc.name      testDownloadData0055
     * @tc.desc      Verify download data row 54 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0055 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir54/file_54.dat', 4, 54000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other54/second_54.bin', 0, 54500);
      expect(first.url).assertEqual('https://example.com/dir54/file_54.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(54000);
      expect(second.url).assertEqual('https://example.com/other54/second_54.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(54500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0055 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_5600
     * @tc.name      testDownloadData0056
     * @tc.desc      Verify download data row 55 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0056 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir55/file_55.dat', 0, 55000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other55/second_55.bin', 1, 55500);
      expect(first.url).assertEqual('https://example.com/dir55/file_55.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(55000);
      expect(second.url).assertEqual('https://example.com/other55/second_55.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(55500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0056 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_5700
     * @tc.name      testDownloadData0057
     * @tc.desc      Verify download data row 56 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0057 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir56/file_56.dat', 1, 56000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other56/second_56.bin', 2, 56500);
      expect(first.url).assertEqual('https://example.com/dir56/file_56.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(56000);
      expect(second.url).assertEqual('https://example.com/other56/second_56.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(56500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0057 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_5800
     * @tc.name      testDownloadData0058
     * @tc.desc      Verify download data row 57 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0058 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir57/file_57.dat', 2, 57000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other57/second_57.bin', 3, 57500);
      expect(first.url).assertEqual('https://example.com/dir57/file_57.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(57000);
      expect(second.url).assertEqual('https://example.com/other57/second_57.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(57500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0058 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_5900
     * @tc.name      testDownloadData0059
     * @tc.desc      Verify download data row 58 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0059 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir58/file_58.dat', 3, 58000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other58/second_58.bin', 4, 58500);
      expect(first.url).assertEqual('https://example.com/dir58/file_58.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(58000);
      expect(second.url).assertEqual('https://example.com/other58/second_58.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(58500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0059 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_6000
     * @tc.name      testDownloadData0060
     * @tc.desc      Verify download data row 59 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0060 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir59/file_59.dat', 4, 59000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other59/second_59.bin', 0, 59500);
      expect(first.url).assertEqual('https://example.com/dir59/file_59.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(59000);
      expect(second.url).assertEqual('https://example.com/other59/second_59.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(59500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0060 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_6100
     * @tc.name      testDownloadData0061
     * @tc.desc      Verify download data row 60 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0061 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir60/file_60.dat', 0, 60000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other60/second_60.bin', 1, 60500);
      expect(first.url).assertEqual('https://example.com/dir60/file_60.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(60000);
      expect(second.url).assertEqual('https://example.com/other60/second_60.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(60500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0061 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_6200
     * @tc.name      testDownloadData0062
     * @tc.desc      Verify download data row 61 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0062 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir61/file_61.dat', 1, 61000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other61/second_61.bin', 2, 61500);
      expect(first.url).assertEqual('https://example.com/dir61/file_61.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(61000);
      expect(second.url).assertEqual('https://example.com/other61/second_61.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(61500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0062 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_6300
     * @tc.name      testDownloadData0063
     * @tc.desc      Verify download data row 62 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0063 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir62/file_62.dat', 2, 62000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other62/second_62.bin', 3, 62500);
      expect(first.url).assertEqual('https://example.com/dir62/file_62.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(62000);
      expect(second.url).assertEqual('https://example.com/other62/second_62.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(62500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0063 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_6400
     * @tc.name      testDownloadData0064
     * @tc.desc      Verify download data row 63 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0064 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir63/file_63.dat', 3, 63000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other63/second_63.bin', 4, 63500);
      expect(first.url).assertEqual('https://example.com/dir63/file_63.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(63000);
      expect(second.url).assertEqual('https://example.com/other63/second_63.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(63500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0064 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_6500
     * @tc.name      testDownloadData0065
     * @tc.desc      Verify download data row 64 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0065 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir64/file_64.dat', 4, 64000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other64/second_64.bin', 0, 64500);
      expect(first.url).assertEqual('https://example.com/dir64/file_64.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(64000);
      expect(second.url).assertEqual('https://example.com/other64/second_64.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(64500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0065 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_6600
     * @tc.name      testDownloadData0066
     * @tc.desc      Verify download data row 65 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0066 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir65/file_65.dat', 0, 65000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other65/second_65.bin', 1, 65500);
      expect(first.url).assertEqual('https://example.com/dir65/file_65.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(65000);
      expect(second.url).assertEqual('https://example.com/other65/second_65.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(65500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0066 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_6700
     * @tc.name      testDownloadData0067
     * @tc.desc      Verify download data row 66 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0067 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir66/file_66.dat', 1, 66000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other66/second_66.bin', 2, 66500);
      expect(first.url).assertEqual('https://example.com/dir66/file_66.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(66000);
      expect(second.url).assertEqual('https://example.com/other66/second_66.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(66500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0067 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_6800
     * @tc.name      testDownloadData0068
     * @tc.desc      Verify download data row 67 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0068 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir67/file_67.dat', 2, 67000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other67/second_67.bin', 3, 67500);
      expect(first.url).assertEqual('https://example.com/dir67/file_67.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(67000);
      expect(second.url).assertEqual('https://example.com/other67/second_67.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(67500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0068 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_6900
     * @tc.name      testDownloadData0069
     * @tc.desc      Verify download data row 68 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0069 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir68/file_68.dat', 3, 68000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other68/second_68.bin', 4, 68500);
      expect(first.url).assertEqual('https://example.com/dir68/file_68.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(68000);
      expect(second.url).assertEqual('https://example.com/other68/second_68.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(68500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0069 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP1_7000
     * @tc.name      testDownloadData0070
     * @tc.desc      Verify download data row 69 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0070 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir69/file_69.dat', 4, 69000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other69/second_69.bin', 0, 69500);
      expect(first.url).assertEqual('https://example.com/dir69/file_69.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(69000);
      expect(second.url).assertEqual('https://example.com/other69/second_69.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(69500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0070 end');
    })

  })
}
