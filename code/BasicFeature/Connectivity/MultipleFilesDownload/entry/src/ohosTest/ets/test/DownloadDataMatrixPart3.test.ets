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

export default function DownloadDataMatrixPart3Test(): void {
  describe('DownloadDataMatrixPart3', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_14100
     * @tc.name      testDownloadData0141
     * @tc.desc      Verify download data row 140 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0141 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir140/file_140.dat', 0, 140000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other140/second_140.bin', 1, 140500);
      expect(first.url).assertEqual('https://example.com/dir140/file_140.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(140000);
      expect(second.url).assertEqual('https://example.com/other140/second_140.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(140500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0141 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_14200
     * @tc.name      testDownloadData0142
     * @tc.desc      Verify download data row 141 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0142 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir141/file_141.dat', 1, 141000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other141/second_141.bin', 2, 141500);
      expect(first.url).assertEqual('https://example.com/dir141/file_141.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(141000);
      expect(second.url).assertEqual('https://example.com/other141/second_141.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(141500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0142 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_14300
     * @tc.name      testDownloadData0143
     * @tc.desc      Verify download data row 142 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0143 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir142/file_142.dat', 2, 142000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other142/second_142.bin', 3, 142500);
      expect(first.url).assertEqual('https://example.com/dir142/file_142.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(142000);
      expect(second.url).assertEqual('https://example.com/other142/second_142.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(142500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0143 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_14400
     * @tc.name      testDownloadData0144
     * @tc.desc      Verify download data row 143 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0144 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir143/file_143.dat', 3, 143000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other143/second_143.bin', 4, 143500);
      expect(first.url).assertEqual('https://example.com/dir143/file_143.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(143000);
      expect(second.url).assertEqual('https://example.com/other143/second_143.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(143500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0144 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_14500
     * @tc.name      testDownloadData0145
     * @tc.desc      Verify download data row 144 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0145 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir144/file_144.dat', 4, 144000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other144/second_144.bin', 0, 144500);
      expect(first.url).assertEqual('https://example.com/dir144/file_144.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(144000);
      expect(second.url).assertEqual('https://example.com/other144/second_144.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(144500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0145 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_14600
     * @tc.name      testDownloadData0146
     * @tc.desc      Verify download data row 145 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0146 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir145/file_145.dat', 0, 145000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other145/second_145.bin', 1, 145500);
      expect(first.url).assertEqual('https://example.com/dir145/file_145.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(145000);
      expect(second.url).assertEqual('https://example.com/other145/second_145.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(145500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0146 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_14700
     * @tc.name      testDownloadData0147
     * @tc.desc      Verify download data row 146 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0147 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir146/file_146.dat', 1, 146000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other146/second_146.bin', 2, 146500);
      expect(first.url).assertEqual('https://example.com/dir146/file_146.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(146000);
      expect(second.url).assertEqual('https://example.com/other146/second_146.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(146500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0147 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_14800
     * @tc.name      testDownloadData0148
     * @tc.desc      Verify download data row 147 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0148 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir147/file_147.dat', 2, 147000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other147/second_147.bin', 3, 147500);
      expect(first.url).assertEqual('https://example.com/dir147/file_147.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(147000);
      expect(second.url).assertEqual('https://example.com/other147/second_147.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(147500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0148 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_14900
     * @tc.name      testDownloadData0149
     * @tc.desc      Verify download data row 148 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0149 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir148/file_148.dat', 3, 148000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other148/second_148.bin', 4, 148500);
      expect(first.url).assertEqual('https://example.com/dir148/file_148.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(148000);
      expect(second.url).assertEqual('https://example.com/other148/second_148.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(148500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0149 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_15000
     * @tc.name      testDownloadData0150
     * @tc.desc      Verify download data row 149 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0150 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir149/file_149.dat', 4, 149000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other149/second_149.bin', 0, 149500);
      expect(first.url).assertEqual('https://example.com/dir149/file_149.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(149000);
      expect(second.url).assertEqual('https://example.com/other149/second_149.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(149500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0150 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_15100
     * @tc.name      testDownloadData0151
     * @tc.desc      Verify download data row 150 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0151 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir150/file_150.dat', 0, 150000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other150/second_150.bin', 1, 150500);
      expect(first.url).assertEqual('https://example.com/dir150/file_150.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(150000);
      expect(second.url).assertEqual('https://example.com/other150/second_150.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(150500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0151 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_15200
     * @tc.name      testDownloadData0152
     * @tc.desc      Verify download data row 151 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0152 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir151/file_151.dat', 1, 151000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other151/second_151.bin', 2, 151500);
      expect(first.url).assertEqual('https://example.com/dir151/file_151.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(151000);
      expect(second.url).assertEqual('https://example.com/other151/second_151.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(151500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0152 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_15300
     * @tc.name      testDownloadData0153
     * @tc.desc      Verify download data row 152 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0153 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir152/file_152.dat', 2, 152000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other152/second_152.bin', 3, 152500);
      expect(first.url).assertEqual('https://example.com/dir152/file_152.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(152000);
      expect(second.url).assertEqual('https://example.com/other152/second_152.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(152500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0153 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_15400
     * @tc.name      testDownloadData0154
     * @tc.desc      Verify download data row 153 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0154 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir153/file_153.dat', 3, 153000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other153/second_153.bin', 4, 153500);
      expect(first.url).assertEqual('https://example.com/dir153/file_153.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(153000);
      expect(second.url).assertEqual('https://example.com/other153/second_153.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(153500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0154 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_15500
     * @tc.name      testDownloadData0155
     * @tc.desc      Verify download data row 154 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0155 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir154/file_154.dat', 4, 154000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other154/second_154.bin', 0, 154500);
      expect(first.url).assertEqual('https://example.com/dir154/file_154.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(154000);
      expect(second.url).assertEqual('https://example.com/other154/second_154.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(154500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0155 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_15600
     * @tc.name      testDownloadData0156
     * @tc.desc      Verify download data row 155 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0156 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir155/file_155.dat', 0, 155000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other155/second_155.bin', 1, 155500);
      expect(first.url).assertEqual('https://example.com/dir155/file_155.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(155000);
      expect(second.url).assertEqual('https://example.com/other155/second_155.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(155500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0156 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_15700
     * @tc.name      testDownloadData0157
     * @tc.desc      Verify download data row 156 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0157 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir156/file_156.dat', 1, 156000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other156/second_156.bin', 2, 156500);
      expect(first.url).assertEqual('https://example.com/dir156/file_156.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(156000);
      expect(second.url).assertEqual('https://example.com/other156/second_156.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(156500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0157 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_15800
     * @tc.name      testDownloadData0158
     * @tc.desc      Verify download data row 157 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0158 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir157/file_157.dat', 2, 157000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other157/second_157.bin', 3, 157500);
      expect(first.url).assertEqual('https://example.com/dir157/file_157.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(157000);
      expect(second.url).assertEqual('https://example.com/other157/second_157.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(157500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0158 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_15900
     * @tc.name      testDownloadData0159
     * @tc.desc      Verify download data row 158 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0159 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir158/file_158.dat', 3, 158000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other158/second_158.bin', 4, 158500);
      expect(first.url).assertEqual('https://example.com/dir158/file_158.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(158000);
      expect(second.url).assertEqual('https://example.com/other158/second_158.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(158500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0159 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_16000
     * @tc.name      testDownloadData0160
     * @tc.desc      Verify download data row 159 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0160 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir159/file_159.dat', 4, 159000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other159/second_159.bin', 0, 159500);
      expect(first.url).assertEqual('https://example.com/dir159/file_159.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(159000);
      expect(second.url).assertEqual('https://example.com/other159/second_159.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(159500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0160 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_16100
     * @tc.name      testDownloadData0161
     * @tc.desc      Verify download data row 160 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0161 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir160/file_160.dat', 0, 160000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other160/second_160.bin', 1, 160500);
      expect(first.url).assertEqual('https://example.com/dir160/file_160.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(160000);
      expect(second.url).assertEqual('https://example.com/other160/second_160.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(160500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0161 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_16200
     * @tc.name      testDownloadData0162
     * @tc.desc      Verify download data row 161 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0162 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir161/file_161.dat', 1, 161000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other161/second_161.bin', 2, 161500);
      expect(first.url).assertEqual('https://example.com/dir161/file_161.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(161000);
      expect(second.url).assertEqual('https://example.com/other161/second_161.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(161500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0162 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_16300
     * @tc.name      testDownloadData0163
     * @tc.desc      Verify download data row 162 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0163 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir162/file_162.dat', 2, 162000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other162/second_162.bin', 3, 162500);
      expect(first.url).assertEqual('https://example.com/dir162/file_162.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(162000);
      expect(second.url).assertEqual('https://example.com/other162/second_162.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(162500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0163 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_16400
     * @tc.name      testDownloadData0164
     * @tc.desc      Verify download data row 163 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0164 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir163/file_163.dat', 3, 163000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other163/second_163.bin', 4, 163500);
      expect(first.url).assertEqual('https://example.com/dir163/file_163.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(163000);
      expect(second.url).assertEqual('https://example.com/other163/second_163.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(163500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0164 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_16500
     * @tc.name      testDownloadData0165
     * @tc.desc      Verify download data row 164 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0165 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir164/file_164.dat', 4, 164000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other164/second_164.bin', 0, 164500);
      expect(first.url).assertEqual('https://example.com/dir164/file_164.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(164000);
      expect(second.url).assertEqual('https://example.com/other164/second_164.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(164500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0165 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_16600
     * @tc.name      testDownloadData0166
     * @tc.desc      Verify download data row 165 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0166 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir165/file_165.dat', 0, 165000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other165/second_165.bin', 1, 165500);
      expect(first.url).assertEqual('https://example.com/dir165/file_165.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(165000);
      expect(second.url).assertEqual('https://example.com/other165/second_165.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(165500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0166 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_16700
     * @tc.name      testDownloadData0167
     * @tc.desc      Verify download data row 166 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0167 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir166/file_166.dat', 1, 166000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other166/second_166.bin', 2, 166500);
      expect(first.url).assertEqual('https://example.com/dir166/file_166.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(166000);
      expect(second.url).assertEqual('https://example.com/other166/second_166.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(166500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0167 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_16800
     * @tc.name      testDownloadData0168
     * @tc.desc      Verify download data row 167 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0168 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir167/file_167.dat', 2, 167000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other167/second_167.bin', 3, 167500);
      expect(first.url).assertEqual('https://example.com/dir167/file_167.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(167000);
      expect(second.url).assertEqual('https://example.com/other167/second_167.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(167500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0168 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_16900
     * @tc.name      testDownloadData0169
     * @tc.desc      Verify download data row 168 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0169 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir168/file_168.dat', 3, 168000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other168/second_168.bin', 4, 168500);
      expect(first.url).assertEqual('https://example.com/dir168/file_168.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(168000);
      expect(second.url).assertEqual('https://example.com/other168/second_168.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(168500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0169 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_17000
     * @tc.name      testDownloadData0170
     * @tc.desc      Verify download data row 169 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0170 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir169/file_169.dat', 4, 169000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other169/second_169.bin', 0, 169500);
      expect(first.url).assertEqual('https://example.com/dir169/file_169.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(169000);
      expect(second.url).assertEqual('https://example.com/other169/second_169.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(169500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0170 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_17100
     * @tc.name      testDownloadData0171
     * @tc.desc      Verify download data row 170 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0171 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir170/file_170.dat', 0, 170000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other170/second_170.bin', 1, 170500);
      expect(first.url).assertEqual('https://example.com/dir170/file_170.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(170000);
      expect(second.url).assertEqual('https://example.com/other170/second_170.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(170500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0171 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_17200
     * @tc.name      testDownloadData0172
     * @tc.desc      Verify download data row 171 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0172 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir171/file_171.dat', 1, 171000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other171/second_171.bin', 2, 171500);
      expect(first.url).assertEqual('https://example.com/dir171/file_171.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(171000);
      expect(second.url).assertEqual('https://example.com/other171/second_171.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(171500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0172 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_17300
     * @tc.name      testDownloadData0173
     * @tc.desc      Verify download data row 172 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0173 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir172/file_172.dat', 2, 172000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other172/second_172.bin', 3, 172500);
      expect(first.url).assertEqual('https://example.com/dir172/file_172.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(172000);
      expect(second.url).assertEqual('https://example.com/other172/second_172.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(172500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0173 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_17400
     * @tc.name      testDownloadData0174
     * @tc.desc      Verify download data row 173 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0174 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir173/file_173.dat', 3, 173000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other173/second_173.bin', 4, 173500);
      expect(first.url).assertEqual('https://example.com/dir173/file_173.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(173000);
      expect(second.url).assertEqual('https://example.com/other173/second_173.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(173500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0174 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_17500
     * @tc.name      testDownloadData0175
     * @tc.desc      Verify download data row 174 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0175 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir174/file_174.dat', 4, 174000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other174/second_174.bin', 0, 174500);
      expect(first.url).assertEqual('https://example.com/dir174/file_174.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(174000);
      expect(second.url).assertEqual('https://example.com/other174/second_174.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(174500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0175 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_17600
     * @tc.name      testDownloadData0176
     * @tc.desc      Verify download data row 175 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0176 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir175/file_175.dat', 0, 175000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other175/second_175.bin', 1, 175500);
      expect(first.url).assertEqual('https://example.com/dir175/file_175.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(175000);
      expect(second.url).assertEqual('https://example.com/other175/second_175.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(175500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0176 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_17700
     * @tc.name      testDownloadData0177
     * @tc.desc      Verify download data row 176 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0177 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir176/file_176.dat', 1, 176000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other176/second_176.bin', 2, 176500);
      expect(first.url).assertEqual('https://example.com/dir176/file_176.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(176000);
      expect(second.url).assertEqual('https://example.com/other176/second_176.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(176500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0177 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_17800
     * @tc.name      testDownloadData0178
     * @tc.desc      Verify download data row 177 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0178 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir177/file_177.dat', 2, 177000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other177/second_177.bin', 3, 177500);
      expect(first.url).assertEqual('https://example.com/dir177/file_177.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(177000);
      expect(second.url).assertEqual('https://example.com/other177/second_177.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(177500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0178 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_17900
     * @tc.name      testDownloadData0179
     * @tc.desc      Verify download data row 178 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0179 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir178/file_178.dat', 3, 178000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other178/second_178.bin', 4, 178500);
      expect(first.url).assertEqual('https://example.com/dir178/file_178.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(178000);
      expect(second.url).assertEqual('https://example.com/other178/second_178.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(178500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0179 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_18000
     * @tc.name      testDownloadData0180
     * @tc.desc      Verify download data row 179 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0180 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir179/file_179.dat', 4, 179000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other179/second_179.bin', 0, 179500);
      expect(first.url).assertEqual('https://example.com/dir179/file_179.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(179000);
      expect(second.url).assertEqual('https://example.com/other179/second_179.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(179500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0180 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_18100
     * @tc.name      testDownloadData0181
     * @tc.desc      Verify download data row 180 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0181 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir180/file_180.dat', 0, 180000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other180/second_180.bin', 1, 180500);
      expect(first.url).assertEqual('https://example.com/dir180/file_180.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(180000);
      expect(second.url).assertEqual('https://example.com/other180/second_180.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(180500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0181 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_18200
     * @tc.name      testDownloadData0182
     * @tc.desc      Verify download data row 181 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0182 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir181/file_181.dat', 1, 181000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other181/second_181.bin', 2, 181500);
      expect(first.url).assertEqual('https://example.com/dir181/file_181.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(181000);
      expect(second.url).assertEqual('https://example.com/other181/second_181.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(181500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0182 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_18300
     * @tc.name      testDownloadData0183
     * @tc.desc      Verify download data row 182 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0183 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir182/file_182.dat', 2, 182000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other182/second_182.bin', 3, 182500);
      expect(first.url).assertEqual('https://example.com/dir182/file_182.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(182000);
      expect(second.url).assertEqual('https://example.com/other182/second_182.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(182500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0183 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_18400
     * @tc.name      testDownloadData0184
     * @tc.desc      Verify download data row 183 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0184 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir183/file_183.dat', 3, 183000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other183/second_183.bin', 4, 183500);
      expect(first.url).assertEqual('https://example.com/dir183/file_183.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(183000);
      expect(second.url).assertEqual('https://example.com/other183/second_183.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(183500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0184 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_18500
     * @tc.name      testDownloadData0185
     * @tc.desc      Verify download data row 184 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0185 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir184/file_184.dat', 4, 184000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other184/second_184.bin', 0, 184500);
      expect(first.url).assertEqual('https://example.com/dir184/file_184.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(184000);
      expect(second.url).assertEqual('https://example.com/other184/second_184.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(184500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0185 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_18600
     * @tc.name      testDownloadData0186
     * @tc.desc      Verify download data row 185 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0186 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir185/file_185.dat', 0, 185000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other185/second_185.bin', 1, 185500);
      expect(first.url).assertEqual('https://example.com/dir185/file_185.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(185000);
      expect(second.url).assertEqual('https://example.com/other185/second_185.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(185500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0186 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_18700
     * @tc.name      testDownloadData0187
     * @tc.desc      Verify download data row 186 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0187 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir186/file_186.dat', 1, 186000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other186/second_186.bin', 2, 186500);
      expect(first.url).assertEqual('https://example.com/dir186/file_186.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(186000);
      expect(second.url).assertEqual('https://example.com/other186/second_186.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(186500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0187 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_18800
     * @tc.name      testDownloadData0188
     * @tc.desc      Verify download data row 187 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0188 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir187/file_187.dat', 2, 187000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other187/second_187.bin', 3, 187500);
      expect(first.url).assertEqual('https://example.com/dir187/file_187.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(187000);
      expect(second.url).assertEqual('https://example.com/other187/second_187.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(187500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0188 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_18900
     * @tc.name      testDownloadData0189
     * @tc.desc      Verify download data row 188 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0189 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir188/file_188.dat', 3, 188000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other188/second_188.bin', 4, 188500);
      expect(first.url).assertEqual('https://example.com/dir188/file_188.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(188000);
      expect(second.url).assertEqual('https://example.com/other188/second_188.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(188500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0189 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_19000
     * @tc.name      testDownloadData0190
     * @tc.desc      Verify download data row 189 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0190 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir189/file_189.dat', 4, 189000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other189/second_189.bin', 0, 189500);
      expect(first.url).assertEqual('https://example.com/dir189/file_189.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(189000);
      expect(second.url).assertEqual('https://example.com/other189/second_189.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(189500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0190 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_19100
     * @tc.name      testDownloadData0191
     * @tc.desc      Verify download data row 190 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0191 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir190/file_190.dat', 0, 190000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other190/second_190.bin', 1, 190500);
      expect(first.url).assertEqual('https://example.com/dir190/file_190.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(190000);
      expect(second.url).assertEqual('https://example.com/other190/second_190.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(190500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0191 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_19200
     * @tc.name      testDownloadData0192
     * @tc.desc      Verify download data row 191 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0192 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir191/file_191.dat', 1, 191000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other191/second_191.bin', 2, 191500);
      expect(first.url).assertEqual('https://example.com/dir191/file_191.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(191000);
      expect(second.url).assertEqual('https://example.com/other191/second_191.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(191500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0192 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_19300
     * @tc.name      testDownloadData0193
     * @tc.desc      Verify download data row 192 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0193 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir192/file_192.dat', 2, 192000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other192/second_192.bin', 3, 192500);
      expect(first.url).assertEqual('https://example.com/dir192/file_192.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(192000);
      expect(second.url).assertEqual('https://example.com/other192/second_192.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(192500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0193 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_19400
     * @tc.name      testDownloadData0194
     * @tc.desc      Verify download data row 193 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0194 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir193/file_193.dat', 3, 193000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other193/second_193.bin', 4, 193500);
      expect(first.url).assertEqual('https://example.com/dir193/file_193.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(193000);
      expect(second.url).assertEqual('https://example.com/other193/second_193.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(193500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0194 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_19500
     * @tc.name      testDownloadData0195
     * @tc.desc      Verify download data row 194 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0195 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir194/file_194.dat', 4, 194000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other194/second_194.bin', 0, 194500);
      expect(first.url).assertEqual('https://example.com/dir194/file_194.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(194000);
      expect(second.url).assertEqual('https://example.com/other194/second_194.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(194500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0195 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_19600
     * @tc.name      testDownloadData0196
     * @tc.desc      Verify download data row 195 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0196 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir195/file_195.dat', 0, 195000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other195/second_195.bin', 1, 195500);
      expect(first.url).assertEqual('https://example.com/dir195/file_195.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(195000);
      expect(second.url).assertEqual('https://example.com/other195/second_195.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(195500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0196 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_19700
     * @tc.name      testDownloadData0197
     * @tc.desc      Verify download data row 196 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0197 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir196/file_196.dat', 1, 196000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other196/second_196.bin', 2, 196500);
      expect(first.url).assertEqual('https://example.com/dir196/file_196.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(196000);
      expect(second.url).assertEqual('https://example.com/other196/second_196.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(196500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0197 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_19800
     * @tc.name      testDownloadData0198
     * @tc.desc      Verify download data row 197 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0198 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir197/file_197.dat', 2, 197000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other197/second_197.bin', 3, 197500);
      expect(first.url).assertEqual('https://example.com/dir197/file_197.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(197000);
      expect(second.url).assertEqual('https://example.com/other197/second_197.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(197500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0198 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_19900
     * @tc.name      testDownloadData0199
     * @tc.desc      Verify download data row 198 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0199 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir198/file_198.dat', 3, 198000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other198/second_198.bin', 4, 198500);
      expect(first.url).assertEqual('https://example.com/dir198/file_198.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(198000);
      expect(second.url).assertEqual('https://example.com/other198/second_198.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(198500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0199 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_20000
     * @tc.name      testDownloadData0200
     * @tc.desc      Verify download data row 199 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0200 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir199/file_199.dat', 4, 199000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other199/second_199.bin', 0, 199500);
      expect(first.url).assertEqual('https://example.com/dir199/file_199.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(199000);
      expect(second.url).assertEqual('https://example.com/other199/second_199.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(199500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0200 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_20100
     * @tc.name      testDownloadData0201
     * @tc.desc      Verify download data row 200 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0201 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir200/file_200.dat', 0, 200000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other200/second_200.bin', 1, 200500);
      expect(first.url).assertEqual('https://example.com/dir200/file_200.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(200000);
      expect(second.url).assertEqual('https://example.com/other200/second_200.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(200500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0201 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_20200
     * @tc.name      testDownloadData0202
     * @tc.desc      Verify download data row 201 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0202 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir201/file_201.dat', 1, 201000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other201/second_201.bin', 2, 201500);
      expect(first.url).assertEqual('https://example.com/dir201/file_201.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(201000);
      expect(second.url).assertEqual('https://example.com/other201/second_201.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(201500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0202 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_20300
     * @tc.name      testDownloadData0203
     * @tc.desc      Verify download data row 202 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0203 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir202/file_202.dat', 2, 202000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other202/second_202.bin', 3, 202500);
      expect(first.url).assertEqual('https://example.com/dir202/file_202.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(202000);
      expect(second.url).assertEqual('https://example.com/other202/second_202.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(202500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0203 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_20400
     * @tc.name      testDownloadData0204
     * @tc.desc      Verify download data row 203 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0204 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir203/file_203.dat', 3, 203000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other203/second_203.bin', 4, 203500);
      expect(first.url).assertEqual('https://example.com/dir203/file_203.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(203000);
      expect(second.url).assertEqual('https://example.com/other203/second_203.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(203500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0204 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_20500
     * @tc.name      testDownloadData0205
     * @tc.desc      Verify download data row 204 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0205 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir204/file_204.dat', 4, 204000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other204/second_204.bin', 0, 204500);
      expect(first.url).assertEqual('https://example.com/dir204/file_204.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(204000);
      expect(second.url).assertEqual('https://example.com/other204/second_204.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(204500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0205 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_20600
     * @tc.name      testDownloadData0206
     * @tc.desc      Verify download data row 205 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0206 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir205/file_205.dat', 0, 205000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other205/second_205.bin', 1, 205500);
      expect(first.url).assertEqual('https://example.com/dir205/file_205.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(205000);
      expect(second.url).assertEqual('https://example.com/other205/second_205.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(205500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0206 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_20700
     * @tc.name      testDownloadData0207
     * @tc.desc      Verify download data row 206 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0207 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir206/file_206.dat', 1, 206000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other206/second_206.bin', 2, 206500);
      expect(first.url).assertEqual('https://example.com/dir206/file_206.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(206000);
      expect(second.url).assertEqual('https://example.com/other206/second_206.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(206500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0207 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_20800
     * @tc.name      testDownloadData0208
     * @tc.desc      Verify download data row 207 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0208 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir207/file_207.dat', 2, 207000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other207/second_207.bin', 3, 207500);
      expect(first.url).assertEqual('https://example.com/dir207/file_207.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(207000);
      expect(second.url).assertEqual('https://example.com/other207/second_207.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(207500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0208 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_20900
     * @tc.name      testDownloadData0209
     * @tc.desc      Verify download data row 208 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0209 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir208/file_208.dat', 3, 208000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other208/second_208.bin', 4, 208500);
      expect(first.url).assertEqual('https://example.com/dir208/file_208.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(208000);
      expect(second.url).assertEqual('https://example.com/other208/second_208.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(208500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0209 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP3_21000
     * @tc.name      testDownloadData0210
     * @tc.desc      Verify download data row 209 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0210 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir209/file_209.dat', 4, 209000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other209/second_209.bin', 0, 209500);
      expect(first.url).assertEqual('https://example.com/dir209/file_209.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(209000);
      expect(second.url).assertEqual('https://example.com/other209/second_209.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(209500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0210 end');
    })

  })
}
