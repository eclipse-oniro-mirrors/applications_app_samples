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

export default function DownloadDataMatrixPart2Test(): void {
  describe('DownloadDataMatrixPart2', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_7100
     * @tc.name      testDownloadData0071
     * @tc.desc      Verify download data row 70 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0071 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir70/file_70.dat', 0, 70000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other70/second_70.bin', 1, 70500);
      expect(first.url).assertEqual('https://example.com/dir70/file_70.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(70000);
      expect(second.url).assertEqual('https://example.com/other70/second_70.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(70500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0071 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_7200
     * @tc.name      testDownloadData0072
     * @tc.desc      Verify download data row 71 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0072 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir71/file_71.dat', 1, 71000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other71/second_71.bin', 2, 71500);
      expect(first.url).assertEqual('https://example.com/dir71/file_71.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(71000);
      expect(second.url).assertEqual('https://example.com/other71/second_71.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(71500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0072 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_7300
     * @tc.name      testDownloadData0073
     * @tc.desc      Verify download data row 72 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0073 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir72/file_72.dat', 2, 72000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other72/second_72.bin', 3, 72500);
      expect(first.url).assertEqual('https://example.com/dir72/file_72.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(72000);
      expect(second.url).assertEqual('https://example.com/other72/second_72.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(72500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0073 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_7400
     * @tc.name      testDownloadData0074
     * @tc.desc      Verify download data row 73 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0074 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir73/file_73.dat', 3, 73000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other73/second_73.bin', 4, 73500);
      expect(first.url).assertEqual('https://example.com/dir73/file_73.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(73000);
      expect(second.url).assertEqual('https://example.com/other73/second_73.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(73500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0074 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_7500
     * @tc.name      testDownloadData0075
     * @tc.desc      Verify download data row 74 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0075 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir74/file_74.dat', 4, 74000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other74/second_74.bin', 0, 74500);
      expect(first.url).assertEqual('https://example.com/dir74/file_74.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(74000);
      expect(second.url).assertEqual('https://example.com/other74/second_74.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(74500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0075 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_7600
     * @tc.name      testDownloadData0076
     * @tc.desc      Verify download data row 75 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0076 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir75/file_75.dat', 0, 75000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other75/second_75.bin', 1, 75500);
      expect(first.url).assertEqual('https://example.com/dir75/file_75.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(75000);
      expect(second.url).assertEqual('https://example.com/other75/second_75.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(75500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0076 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_7700
     * @tc.name      testDownloadData0077
     * @tc.desc      Verify download data row 76 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0077 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir76/file_76.dat', 1, 76000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other76/second_76.bin', 2, 76500);
      expect(first.url).assertEqual('https://example.com/dir76/file_76.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(76000);
      expect(second.url).assertEqual('https://example.com/other76/second_76.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(76500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0077 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_7800
     * @tc.name      testDownloadData0078
     * @tc.desc      Verify download data row 77 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0078 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir77/file_77.dat', 2, 77000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other77/second_77.bin', 3, 77500);
      expect(first.url).assertEqual('https://example.com/dir77/file_77.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(77000);
      expect(second.url).assertEqual('https://example.com/other77/second_77.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(77500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0078 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_7900
     * @tc.name      testDownloadData0079
     * @tc.desc      Verify download data row 78 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0079 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir78/file_78.dat', 3, 78000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other78/second_78.bin', 4, 78500);
      expect(first.url).assertEqual('https://example.com/dir78/file_78.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(78000);
      expect(second.url).assertEqual('https://example.com/other78/second_78.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(78500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0079 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_8000
     * @tc.name      testDownloadData0080
     * @tc.desc      Verify download data row 79 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0080 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir79/file_79.dat', 4, 79000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other79/second_79.bin', 0, 79500);
      expect(first.url).assertEqual('https://example.com/dir79/file_79.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(79000);
      expect(second.url).assertEqual('https://example.com/other79/second_79.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(79500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0080 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_8100
     * @tc.name      testDownloadData0081
     * @tc.desc      Verify download data row 80 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0081 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir80/file_80.dat', 0, 80000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other80/second_80.bin', 1, 80500);
      expect(first.url).assertEqual('https://example.com/dir80/file_80.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(80000);
      expect(second.url).assertEqual('https://example.com/other80/second_80.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(80500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0081 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_8200
     * @tc.name      testDownloadData0082
     * @tc.desc      Verify download data row 81 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0082 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir81/file_81.dat', 1, 81000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other81/second_81.bin', 2, 81500);
      expect(first.url).assertEqual('https://example.com/dir81/file_81.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(81000);
      expect(second.url).assertEqual('https://example.com/other81/second_81.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(81500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0082 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_8300
     * @tc.name      testDownloadData0083
     * @tc.desc      Verify download data row 82 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0083 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir82/file_82.dat', 2, 82000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other82/second_82.bin', 3, 82500);
      expect(first.url).assertEqual('https://example.com/dir82/file_82.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(82000);
      expect(second.url).assertEqual('https://example.com/other82/second_82.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(82500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0083 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_8400
     * @tc.name      testDownloadData0084
     * @tc.desc      Verify download data row 83 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0084 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir83/file_83.dat', 3, 83000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other83/second_83.bin', 4, 83500);
      expect(first.url).assertEqual('https://example.com/dir83/file_83.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(83000);
      expect(second.url).assertEqual('https://example.com/other83/second_83.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(83500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0084 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_8500
     * @tc.name      testDownloadData0085
     * @tc.desc      Verify download data row 84 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0085 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir84/file_84.dat', 4, 84000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other84/second_84.bin', 0, 84500);
      expect(first.url).assertEqual('https://example.com/dir84/file_84.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(84000);
      expect(second.url).assertEqual('https://example.com/other84/second_84.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(84500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0085 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_8600
     * @tc.name      testDownloadData0086
     * @tc.desc      Verify download data row 85 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0086 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir85/file_85.dat', 0, 85000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other85/second_85.bin', 1, 85500);
      expect(first.url).assertEqual('https://example.com/dir85/file_85.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(85000);
      expect(second.url).assertEqual('https://example.com/other85/second_85.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(85500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0086 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_8700
     * @tc.name      testDownloadData0087
     * @tc.desc      Verify download data row 86 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0087 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir86/file_86.dat', 1, 86000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other86/second_86.bin', 2, 86500);
      expect(first.url).assertEqual('https://example.com/dir86/file_86.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(86000);
      expect(second.url).assertEqual('https://example.com/other86/second_86.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(86500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0087 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_8800
     * @tc.name      testDownloadData0088
     * @tc.desc      Verify download data row 87 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0088 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir87/file_87.dat', 2, 87000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other87/second_87.bin', 3, 87500);
      expect(first.url).assertEqual('https://example.com/dir87/file_87.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(87000);
      expect(second.url).assertEqual('https://example.com/other87/second_87.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(87500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0088 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_8900
     * @tc.name      testDownloadData0089
     * @tc.desc      Verify download data row 88 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0089 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir88/file_88.dat', 3, 88000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other88/second_88.bin', 4, 88500);
      expect(first.url).assertEqual('https://example.com/dir88/file_88.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(88000);
      expect(second.url).assertEqual('https://example.com/other88/second_88.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(88500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0089 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_9000
     * @tc.name      testDownloadData0090
     * @tc.desc      Verify download data row 89 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0090 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir89/file_89.dat', 4, 89000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other89/second_89.bin', 0, 89500);
      expect(first.url).assertEqual('https://example.com/dir89/file_89.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(89000);
      expect(second.url).assertEqual('https://example.com/other89/second_89.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(89500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0090 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_9100
     * @tc.name      testDownloadData0091
     * @tc.desc      Verify download data row 90 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0091 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir90/file_90.dat', 0, 90000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other90/second_90.bin', 1, 90500);
      expect(first.url).assertEqual('https://example.com/dir90/file_90.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(90000);
      expect(second.url).assertEqual('https://example.com/other90/second_90.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(90500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0091 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_9200
     * @tc.name      testDownloadData0092
     * @tc.desc      Verify download data row 91 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0092 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir91/file_91.dat', 1, 91000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other91/second_91.bin', 2, 91500);
      expect(first.url).assertEqual('https://example.com/dir91/file_91.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(91000);
      expect(second.url).assertEqual('https://example.com/other91/second_91.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(91500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0092 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_9300
     * @tc.name      testDownloadData0093
     * @tc.desc      Verify download data row 92 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0093 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir92/file_92.dat', 2, 92000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other92/second_92.bin', 3, 92500);
      expect(first.url).assertEqual('https://example.com/dir92/file_92.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(92000);
      expect(second.url).assertEqual('https://example.com/other92/second_92.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(92500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0093 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_9400
     * @tc.name      testDownloadData0094
     * @tc.desc      Verify download data row 93 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0094 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir93/file_93.dat', 3, 93000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other93/second_93.bin', 4, 93500);
      expect(first.url).assertEqual('https://example.com/dir93/file_93.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(93000);
      expect(second.url).assertEqual('https://example.com/other93/second_93.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(93500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0094 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_9500
     * @tc.name      testDownloadData0095
     * @tc.desc      Verify download data row 94 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0095 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir94/file_94.dat', 4, 94000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other94/second_94.bin', 0, 94500);
      expect(first.url).assertEqual('https://example.com/dir94/file_94.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(94000);
      expect(second.url).assertEqual('https://example.com/other94/second_94.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(94500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0095 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_9600
     * @tc.name      testDownloadData0096
     * @tc.desc      Verify download data row 95 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0096 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir95/file_95.dat', 0, 95000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other95/second_95.bin', 1, 95500);
      expect(first.url).assertEqual('https://example.com/dir95/file_95.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(95000);
      expect(second.url).assertEqual('https://example.com/other95/second_95.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(95500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0096 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_9700
     * @tc.name      testDownloadData0097
     * @tc.desc      Verify download data row 96 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0097 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir96/file_96.dat', 1, 96000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other96/second_96.bin', 2, 96500);
      expect(first.url).assertEqual('https://example.com/dir96/file_96.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(96000);
      expect(second.url).assertEqual('https://example.com/other96/second_96.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(96500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0097 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_9800
     * @tc.name      testDownloadData0098
     * @tc.desc      Verify download data row 97 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0098 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir97/file_97.dat', 2, 97000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other97/second_97.bin', 3, 97500);
      expect(first.url).assertEqual('https://example.com/dir97/file_97.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(97000);
      expect(second.url).assertEqual('https://example.com/other97/second_97.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(97500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0098 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_9900
     * @tc.name      testDownloadData0099
     * @tc.desc      Verify download data row 98 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0099 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir98/file_98.dat', 3, 98000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other98/second_98.bin', 4, 98500);
      expect(first.url).assertEqual('https://example.com/dir98/file_98.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(98000);
      expect(second.url).assertEqual('https://example.com/other98/second_98.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(98500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0099 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_10000
     * @tc.name      testDownloadData0100
     * @tc.desc      Verify download data row 99 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0100 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir99/file_99.dat', 4, 99000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other99/second_99.bin', 0, 99500);
      expect(first.url).assertEqual('https://example.com/dir99/file_99.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(99000);
      expect(second.url).assertEqual('https://example.com/other99/second_99.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(99500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0100 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_10100
     * @tc.name      testDownloadData0101
     * @tc.desc      Verify download data row 100 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0101 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir100/file_100.dat', 0, 100000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other100/second_100.bin', 1, 100500);
      expect(first.url).assertEqual('https://example.com/dir100/file_100.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(100000);
      expect(second.url).assertEqual('https://example.com/other100/second_100.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(100500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0101 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_10200
     * @tc.name      testDownloadData0102
     * @tc.desc      Verify download data row 101 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0102 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir101/file_101.dat', 1, 101000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other101/second_101.bin', 2, 101500);
      expect(first.url).assertEqual('https://example.com/dir101/file_101.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(101000);
      expect(second.url).assertEqual('https://example.com/other101/second_101.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(101500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0102 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_10300
     * @tc.name      testDownloadData0103
     * @tc.desc      Verify download data row 102 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0103 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir102/file_102.dat', 2, 102000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other102/second_102.bin', 3, 102500);
      expect(first.url).assertEqual('https://example.com/dir102/file_102.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(102000);
      expect(second.url).assertEqual('https://example.com/other102/second_102.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(102500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0103 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_10400
     * @tc.name      testDownloadData0104
     * @tc.desc      Verify download data row 103 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0104 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir103/file_103.dat', 3, 103000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other103/second_103.bin', 4, 103500);
      expect(first.url).assertEqual('https://example.com/dir103/file_103.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(103000);
      expect(second.url).assertEqual('https://example.com/other103/second_103.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(103500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0104 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_10500
     * @tc.name      testDownloadData0105
     * @tc.desc      Verify download data row 104 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0105 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir104/file_104.dat', 4, 104000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other104/second_104.bin', 0, 104500);
      expect(first.url).assertEqual('https://example.com/dir104/file_104.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(104000);
      expect(second.url).assertEqual('https://example.com/other104/second_104.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(104500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0105 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_10600
     * @tc.name      testDownloadData0106
     * @tc.desc      Verify download data row 105 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0106 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir105/file_105.dat', 0, 105000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other105/second_105.bin', 1, 105500);
      expect(first.url).assertEqual('https://example.com/dir105/file_105.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(105000);
      expect(second.url).assertEqual('https://example.com/other105/second_105.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(105500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0106 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_10700
     * @tc.name      testDownloadData0107
     * @tc.desc      Verify download data row 106 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0107 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir106/file_106.dat', 1, 106000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other106/second_106.bin', 2, 106500);
      expect(first.url).assertEqual('https://example.com/dir106/file_106.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(106000);
      expect(second.url).assertEqual('https://example.com/other106/second_106.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(106500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0107 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_10800
     * @tc.name      testDownloadData0108
     * @tc.desc      Verify download data row 107 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0108 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir107/file_107.dat', 2, 107000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other107/second_107.bin', 3, 107500);
      expect(first.url).assertEqual('https://example.com/dir107/file_107.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(107000);
      expect(second.url).assertEqual('https://example.com/other107/second_107.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(107500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0108 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_10900
     * @tc.name      testDownloadData0109
     * @tc.desc      Verify download data row 108 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0109 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir108/file_108.dat', 3, 108000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other108/second_108.bin', 4, 108500);
      expect(first.url).assertEqual('https://example.com/dir108/file_108.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(108000);
      expect(second.url).assertEqual('https://example.com/other108/second_108.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(108500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0109 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_11000
     * @tc.name      testDownloadData0110
     * @tc.desc      Verify download data row 109 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0110 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir109/file_109.dat', 4, 109000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other109/second_109.bin', 0, 109500);
      expect(first.url).assertEqual('https://example.com/dir109/file_109.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(109000);
      expect(second.url).assertEqual('https://example.com/other109/second_109.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(109500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0110 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_11100
     * @tc.name      testDownloadData0111
     * @tc.desc      Verify download data row 110 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0111 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir110/file_110.dat', 0, 110000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other110/second_110.bin', 1, 110500);
      expect(first.url).assertEqual('https://example.com/dir110/file_110.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(110000);
      expect(second.url).assertEqual('https://example.com/other110/second_110.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(110500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0111 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_11200
     * @tc.name      testDownloadData0112
     * @tc.desc      Verify download data row 111 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0112 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir111/file_111.dat', 1, 111000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other111/second_111.bin', 2, 111500);
      expect(first.url).assertEqual('https://example.com/dir111/file_111.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(111000);
      expect(second.url).assertEqual('https://example.com/other111/second_111.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(111500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0112 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_11300
     * @tc.name      testDownloadData0113
     * @tc.desc      Verify download data row 112 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0113 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir112/file_112.dat', 2, 112000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other112/second_112.bin', 3, 112500);
      expect(first.url).assertEqual('https://example.com/dir112/file_112.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(112000);
      expect(second.url).assertEqual('https://example.com/other112/second_112.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(112500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0113 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_11400
     * @tc.name      testDownloadData0114
     * @tc.desc      Verify download data row 113 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0114 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir113/file_113.dat', 3, 113000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other113/second_113.bin', 4, 113500);
      expect(first.url).assertEqual('https://example.com/dir113/file_113.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(113000);
      expect(second.url).assertEqual('https://example.com/other113/second_113.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(113500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0114 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_11500
     * @tc.name      testDownloadData0115
     * @tc.desc      Verify download data row 114 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0115 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir114/file_114.dat', 4, 114000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other114/second_114.bin', 0, 114500);
      expect(first.url).assertEqual('https://example.com/dir114/file_114.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(114000);
      expect(second.url).assertEqual('https://example.com/other114/second_114.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(114500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0115 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_11600
     * @tc.name      testDownloadData0116
     * @tc.desc      Verify download data row 115 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0116 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir115/file_115.dat', 0, 115000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other115/second_115.bin', 1, 115500);
      expect(first.url).assertEqual('https://example.com/dir115/file_115.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(115000);
      expect(second.url).assertEqual('https://example.com/other115/second_115.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(115500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0116 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_11700
     * @tc.name      testDownloadData0117
     * @tc.desc      Verify download data row 116 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0117 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir116/file_116.dat', 1, 116000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other116/second_116.bin', 2, 116500);
      expect(first.url).assertEqual('https://example.com/dir116/file_116.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(116000);
      expect(second.url).assertEqual('https://example.com/other116/second_116.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(116500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0117 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_11800
     * @tc.name      testDownloadData0118
     * @tc.desc      Verify download data row 117 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0118 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir117/file_117.dat', 2, 117000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other117/second_117.bin', 3, 117500);
      expect(first.url).assertEqual('https://example.com/dir117/file_117.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(117000);
      expect(second.url).assertEqual('https://example.com/other117/second_117.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(117500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0118 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_11900
     * @tc.name      testDownloadData0119
     * @tc.desc      Verify download data row 118 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0119 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir118/file_118.dat', 3, 118000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other118/second_118.bin', 4, 118500);
      expect(first.url).assertEqual('https://example.com/dir118/file_118.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(118000);
      expect(second.url).assertEqual('https://example.com/other118/second_118.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(118500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0119 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_12000
     * @tc.name      testDownloadData0120
     * @tc.desc      Verify download data row 119 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0120 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir119/file_119.dat', 4, 119000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other119/second_119.bin', 0, 119500);
      expect(first.url).assertEqual('https://example.com/dir119/file_119.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(119000);
      expect(second.url).assertEqual('https://example.com/other119/second_119.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(119500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0120 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_12100
     * @tc.name      testDownloadData0121
     * @tc.desc      Verify download data row 120 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0121 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir120/file_120.dat', 0, 120000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other120/second_120.bin', 1, 120500);
      expect(first.url).assertEqual('https://example.com/dir120/file_120.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(120000);
      expect(second.url).assertEqual('https://example.com/other120/second_120.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(120500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0121 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_12200
     * @tc.name      testDownloadData0122
     * @tc.desc      Verify download data row 121 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0122 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir121/file_121.dat', 1, 121000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other121/second_121.bin', 2, 121500);
      expect(first.url).assertEqual('https://example.com/dir121/file_121.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(121000);
      expect(second.url).assertEqual('https://example.com/other121/second_121.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(121500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0122 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_12300
     * @tc.name      testDownloadData0123
     * @tc.desc      Verify download data row 122 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0123 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir122/file_122.dat', 2, 122000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other122/second_122.bin', 3, 122500);
      expect(first.url).assertEqual('https://example.com/dir122/file_122.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(122000);
      expect(second.url).assertEqual('https://example.com/other122/second_122.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(122500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0123 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_12400
     * @tc.name      testDownloadData0124
     * @tc.desc      Verify download data row 123 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0124 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir123/file_123.dat', 3, 123000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other123/second_123.bin', 4, 123500);
      expect(first.url).assertEqual('https://example.com/dir123/file_123.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(123000);
      expect(second.url).assertEqual('https://example.com/other123/second_123.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(123500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0124 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_12500
     * @tc.name      testDownloadData0125
     * @tc.desc      Verify download data row 124 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0125 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir124/file_124.dat', 4, 124000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other124/second_124.bin', 0, 124500);
      expect(first.url).assertEqual('https://example.com/dir124/file_124.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(124000);
      expect(second.url).assertEqual('https://example.com/other124/second_124.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(124500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0125 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_12600
     * @tc.name      testDownloadData0126
     * @tc.desc      Verify download data row 125 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0126 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir125/file_125.dat', 0, 125000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other125/second_125.bin', 1, 125500);
      expect(first.url).assertEqual('https://example.com/dir125/file_125.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(125000);
      expect(second.url).assertEqual('https://example.com/other125/second_125.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(125500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0126 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_12700
     * @tc.name      testDownloadData0127
     * @tc.desc      Verify download data row 126 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0127 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir126/file_126.dat', 1, 126000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other126/second_126.bin', 2, 126500);
      expect(first.url).assertEqual('https://example.com/dir126/file_126.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(126000);
      expect(second.url).assertEqual('https://example.com/other126/second_126.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(126500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0127 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_12800
     * @tc.name      testDownloadData0128
     * @tc.desc      Verify download data row 127 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0128 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir127/file_127.dat', 2, 127000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other127/second_127.bin', 3, 127500);
      expect(first.url).assertEqual('https://example.com/dir127/file_127.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(127000);
      expect(second.url).assertEqual('https://example.com/other127/second_127.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(127500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0128 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_12900
     * @tc.name      testDownloadData0129
     * @tc.desc      Verify download data row 128 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0129 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir128/file_128.dat', 3, 128000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other128/second_128.bin', 4, 128500);
      expect(first.url).assertEqual('https://example.com/dir128/file_128.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(128000);
      expect(second.url).assertEqual('https://example.com/other128/second_128.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(128500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0129 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_13000
     * @tc.name      testDownloadData0130
     * @tc.desc      Verify download data row 129 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0130 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir129/file_129.dat', 4, 129000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other129/second_129.bin', 0, 129500);
      expect(first.url).assertEqual('https://example.com/dir129/file_129.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(129000);
      expect(second.url).assertEqual('https://example.com/other129/second_129.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(129500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0130 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_13100
     * @tc.name      testDownloadData0131
     * @tc.desc      Verify download data row 130 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0131 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir130/file_130.dat', 0, 130000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other130/second_130.bin', 1, 130500);
      expect(first.url).assertEqual('https://example.com/dir130/file_130.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(130000);
      expect(second.url).assertEqual('https://example.com/other130/second_130.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(130500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0131 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_13200
     * @tc.name      testDownloadData0132
     * @tc.desc      Verify download data row 131 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0132 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir131/file_131.dat', 1, 131000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other131/second_131.bin', 2, 131500);
      expect(first.url).assertEqual('https://example.com/dir131/file_131.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(131000);
      expect(second.url).assertEqual('https://example.com/other131/second_131.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(131500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0132 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_13300
     * @tc.name      testDownloadData0133
     * @tc.desc      Verify download data row 132 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0133 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir132/file_132.dat', 2, 132000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other132/second_132.bin', 3, 132500);
      expect(first.url).assertEqual('https://example.com/dir132/file_132.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(132000);
      expect(second.url).assertEqual('https://example.com/other132/second_132.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(132500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0133 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_13400
     * @tc.name      testDownloadData0134
     * @tc.desc      Verify download data row 133 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0134 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir133/file_133.dat', 3, 133000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other133/second_133.bin', 4, 133500);
      expect(first.url).assertEqual('https://example.com/dir133/file_133.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(133000);
      expect(second.url).assertEqual('https://example.com/other133/second_133.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(133500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0134 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_13500
     * @tc.name      testDownloadData0135
     * @tc.desc      Verify download data row 134 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0135 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir134/file_134.dat', 4, 134000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other134/second_134.bin', 0, 134500);
      expect(first.url).assertEqual('https://example.com/dir134/file_134.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(134000);
      expect(second.url).assertEqual('https://example.com/other134/second_134.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(134500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0135 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_13600
     * @tc.name      testDownloadData0136
     * @tc.desc      Verify download data row 135 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0136 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir135/file_135.dat', 0, 135000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other135/second_135.bin', 1, 135500);
      expect(first.url).assertEqual('https://example.com/dir135/file_135.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(135000);
      expect(second.url).assertEqual('https://example.com/other135/second_135.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(135500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0136 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_13700
     * @tc.name      testDownloadData0137
     * @tc.desc      Verify download data row 136 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0137 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir136/file_136.dat', 1, 136000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other136/second_136.bin', 2, 136500);
      expect(first.url).assertEqual('https://example.com/dir136/file_136.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(136000);
      expect(second.url).assertEqual('https://example.com/other136/second_136.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(136500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0137 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_13800
     * @tc.name      testDownloadData0138
     * @tc.desc      Verify download data row 137 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0138 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir137/file_137.dat', 2, 137000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other137/second_137.bin', 3, 137500);
      expect(first.url).assertEqual('https://example.com/dir137/file_137.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(137000);
      expect(second.url).assertEqual('https://example.com/other137/second_137.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(137500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0138 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_13900
     * @tc.name      testDownloadData0139
     * @tc.desc      Verify download data row 138 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0139 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir138/file_138.dat', 3, 138000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other138/second_138.bin', 4, 138500);
      expect(first.url).assertEqual('https://example.com/dir138/file_138.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(138000);
      expect(second.url).assertEqual('https://example.com/other138/second_138.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(138500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0139 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP2_14000
     * @tc.name      testDownloadData0140
     * @tc.desc      Verify download data row 139 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0140 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir139/file_139.dat', 4, 139000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other139/second_139.bin', 0, 139500);
      expect(first.url).assertEqual('https://example.com/dir139/file_139.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(139000);
      expect(second.url).assertEqual('https://example.com/other139/second_139.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(139500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0140 end');
    })

  })
}
