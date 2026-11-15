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

export default function DownloadDataMatrixPart4Test(): void {
  describe('DownloadDataMatrixPart4', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_21100
     * @tc.name      testDownloadData0211
     * @tc.desc      Verify download data row 210 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0211 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir210/file_210.dat', 0, 210000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other210/second_210.bin', 1, 210500);
      expect(first.url).assertEqual('https://example.com/dir210/file_210.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(210000);
      expect(second.url).assertEqual('https://example.com/other210/second_210.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(210500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0211 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_21200
     * @tc.name      testDownloadData0212
     * @tc.desc      Verify download data row 211 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0212 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir211/file_211.dat', 1, 211000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other211/second_211.bin', 2, 211500);
      expect(first.url).assertEqual('https://example.com/dir211/file_211.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(211000);
      expect(second.url).assertEqual('https://example.com/other211/second_211.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(211500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0212 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_21300
     * @tc.name      testDownloadData0213
     * @tc.desc      Verify download data row 212 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0213 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir212/file_212.dat', 2, 212000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other212/second_212.bin', 3, 212500);
      expect(first.url).assertEqual('https://example.com/dir212/file_212.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(212000);
      expect(second.url).assertEqual('https://example.com/other212/second_212.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(212500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0213 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_21400
     * @tc.name      testDownloadData0214
     * @tc.desc      Verify download data row 213 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0214 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir213/file_213.dat', 3, 213000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other213/second_213.bin', 4, 213500);
      expect(first.url).assertEqual('https://example.com/dir213/file_213.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(213000);
      expect(second.url).assertEqual('https://example.com/other213/second_213.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(213500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0214 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_21500
     * @tc.name      testDownloadData0215
     * @tc.desc      Verify download data row 214 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0215 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir214/file_214.dat', 4, 214000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other214/second_214.bin', 0, 214500);
      expect(first.url).assertEqual('https://example.com/dir214/file_214.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(214000);
      expect(second.url).assertEqual('https://example.com/other214/second_214.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(214500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0215 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_21600
     * @tc.name      testDownloadData0216
     * @tc.desc      Verify download data row 215 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0216 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir215/file_215.dat', 0, 215000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other215/second_215.bin', 1, 215500);
      expect(first.url).assertEqual('https://example.com/dir215/file_215.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(215000);
      expect(second.url).assertEqual('https://example.com/other215/second_215.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(215500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0216 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_21700
     * @tc.name      testDownloadData0217
     * @tc.desc      Verify download data row 216 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0217 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir216/file_216.dat', 1, 216000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other216/second_216.bin', 2, 216500);
      expect(first.url).assertEqual('https://example.com/dir216/file_216.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(216000);
      expect(second.url).assertEqual('https://example.com/other216/second_216.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(216500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0217 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_21800
     * @tc.name      testDownloadData0218
     * @tc.desc      Verify download data row 217 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0218 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir217/file_217.dat', 2, 217000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other217/second_217.bin', 3, 217500);
      expect(first.url).assertEqual('https://example.com/dir217/file_217.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(217000);
      expect(second.url).assertEqual('https://example.com/other217/second_217.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(217500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0218 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_21900
     * @tc.name      testDownloadData0219
     * @tc.desc      Verify download data row 218 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0219 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir218/file_218.dat', 3, 218000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other218/second_218.bin', 4, 218500);
      expect(first.url).assertEqual('https://example.com/dir218/file_218.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(218000);
      expect(second.url).assertEqual('https://example.com/other218/second_218.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(218500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0219 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_22000
     * @tc.name      testDownloadData0220
     * @tc.desc      Verify download data row 219 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0220 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir219/file_219.dat', 4, 219000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other219/second_219.bin', 0, 219500);
      expect(first.url).assertEqual('https://example.com/dir219/file_219.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(219000);
      expect(second.url).assertEqual('https://example.com/other219/second_219.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(219500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0220 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_22100
     * @tc.name      testDownloadData0221
     * @tc.desc      Verify download data row 220 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0221 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir220/file_220.dat', 0, 220000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other220/second_220.bin', 1, 220500);
      expect(first.url).assertEqual('https://example.com/dir220/file_220.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(220000);
      expect(second.url).assertEqual('https://example.com/other220/second_220.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(220500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0221 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_22200
     * @tc.name      testDownloadData0222
     * @tc.desc      Verify download data row 221 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0222 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir221/file_221.dat', 1, 221000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other221/second_221.bin', 2, 221500);
      expect(first.url).assertEqual('https://example.com/dir221/file_221.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(221000);
      expect(second.url).assertEqual('https://example.com/other221/second_221.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(221500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0222 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_22300
     * @tc.name      testDownloadData0223
     * @tc.desc      Verify download data row 222 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0223 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir222/file_222.dat', 2, 222000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other222/second_222.bin', 3, 222500);
      expect(first.url).assertEqual('https://example.com/dir222/file_222.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(222000);
      expect(second.url).assertEqual('https://example.com/other222/second_222.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(222500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0223 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_22400
     * @tc.name      testDownloadData0224
     * @tc.desc      Verify download data row 223 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0224 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir223/file_223.dat', 3, 223000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other223/second_223.bin', 4, 223500);
      expect(first.url).assertEqual('https://example.com/dir223/file_223.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(223000);
      expect(second.url).assertEqual('https://example.com/other223/second_223.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(223500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0224 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_22500
     * @tc.name      testDownloadData0225
     * @tc.desc      Verify download data row 224 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0225 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir224/file_224.dat', 4, 224000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other224/second_224.bin', 0, 224500);
      expect(first.url).assertEqual('https://example.com/dir224/file_224.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(224000);
      expect(second.url).assertEqual('https://example.com/other224/second_224.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(224500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0225 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_22600
     * @tc.name      testDownloadData0226
     * @tc.desc      Verify download data row 225 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0226 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir225/file_225.dat', 0, 225000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other225/second_225.bin', 1, 225500);
      expect(first.url).assertEqual('https://example.com/dir225/file_225.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(225000);
      expect(second.url).assertEqual('https://example.com/other225/second_225.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(225500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0226 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_22700
     * @tc.name      testDownloadData0227
     * @tc.desc      Verify download data row 226 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0227 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir226/file_226.dat', 1, 226000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other226/second_226.bin', 2, 226500);
      expect(first.url).assertEqual('https://example.com/dir226/file_226.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(226000);
      expect(second.url).assertEqual('https://example.com/other226/second_226.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(226500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0227 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_22800
     * @tc.name      testDownloadData0228
     * @tc.desc      Verify download data row 227 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0228 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir227/file_227.dat', 2, 227000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other227/second_227.bin', 3, 227500);
      expect(first.url).assertEqual('https://example.com/dir227/file_227.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(227000);
      expect(second.url).assertEqual('https://example.com/other227/second_227.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(227500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0228 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_22900
     * @tc.name      testDownloadData0229
     * @tc.desc      Verify download data row 228 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0229 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir228/file_228.dat', 3, 228000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other228/second_228.bin', 4, 228500);
      expect(first.url).assertEqual('https://example.com/dir228/file_228.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(228000);
      expect(second.url).assertEqual('https://example.com/other228/second_228.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(228500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0229 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_23000
     * @tc.name      testDownloadData0230
     * @tc.desc      Verify download data row 229 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0230 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir229/file_229.dat', 4, 229000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other229/second_229.bin', 0, 229500);
      expect(first.url).assertEqual('https://example.com/dir229/file_229.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(229000);
      expect(second.url).assertEqual('https://example.com/other229/second_229.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(229500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0230 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_23100
     * @tc.name      testDownloadData0231
     * @tc.desc      Verify download data row 230 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0231 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir230/file_230.dat', 0, 230000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other230/second_230.bin', 1, 230500);
      expect(first.url).assertEqual('https://example.com/dir230/file_230.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(230000);
      expect(second.url).assertEqual('https://example.com/other230/second_230.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(230500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0231 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_23200
     * @tc.name      testDownloadData0232
     * @tc.desc      Verify download data row 231 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0232 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir231/file_231.dat', 1, 231000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other231/second_231.bin', 2, 231500);
      expect(first.url).assertEqual('https://example.com/dir231/file_231.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(231000);
      expect(second.url).assertEqual('https://example.com/other231/second_231.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(231500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0232 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_23300
     * @tc.name      testDownloadData0233
     * @tc.desc      Verify download data row 232 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0233 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir232/file_232.dat', 2, 232000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other232/second_232.bin', 3, 232500);
      expect(first.url).assertEqual('https://example.com/dir232/file_232.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(232000);
      expect(second.url).assertEqual('https://example.com/other232/second_232.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(232500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0233 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_23400
     * @tc.name      testDownloadData0234
     * @tc.desc      Verify download data row 233 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0234 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir233/file_233.dat', 3, 233000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other233/second_233.bin', 4, 233500);
      expect(first.url).assertEqual('https://example.com/dir233/file_233.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(233000);
      expect(second.url).assertEqual('https://example.com/other233/second_233.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(233500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0234 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_23500
     * @tc.name      testDownloadData0235
     * @tc.desc      Verify download data row 234 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0235 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir234/file_234.dat', 4, 234000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other234/second_234.bin', 0, 234500);
      expect(first.url).assertEqual('https://example.com/dir234/file_234.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(234000);
      expect(second.url).assertEqual('https://example.com/other234/second_234.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(234500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0235 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_23600
     * @tc.name      testDownloadData0236
     * @tc.desc      Verify download data row 235 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0236 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir235/file_235.dat', 0, 235000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other235/second_235.bin', 1, 235500);
      expect(first.url).assertEqual('https://example.com/dir235/file_235.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(235000);
      expect(second.url).assertEqual('https://example.com/other235/second_235.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(235500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0236 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_23700
     * @tc.name      testDownloadData0237
     * @tc.desc      Verify download data row 236 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0237 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir236/file_236.dat', 1, 236000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other236/second_236.bin', 2, 236500);
      expect(first.url).assertEqual('https://example.com/dir236/file_236.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(236000);
      expect(second.url).assertEqual('https://example.com/other236/second_236.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(236500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0237 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_23800
     * @tc.name      testDownloadData0238
     * @tc.desc      Verify download data row 237 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0238 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir237/file_237.dat', 2, 237000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other237/second_237.bin', 3, 237500);
      expect(first.url).assertEqual('https://example.com/dir237/file_237.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(237000);
      expect(second.url).assertEqual('https://example.com/other237/second_237.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(237500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0238 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_23900
     * @tc.name      testDownloadData0239
     * @tc.desc      Verify download data row 238 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0239 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir238/file_238.dat', 3, 238000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other238/second_238.bin', 4, 238500);
      expect(first.url).assertEqual('https://example.com/dir238/file_238.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(238000);
      expect(second.url).assertEqual('https://example.com/other238/second_238.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(238500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0239 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_24000
     * @tc.name      testDownloadData0240
     * @tc.desc      Verify download data row 239 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0240 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir239/file_239.dat', 4, 239000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other239/second_239.bin', 0, 239500);
      expect(first.url).assertEqual('https://example.com/dir239/file_239.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(239000);
      expect(second.url).assertEqual('https://example.com/other239/second_239.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(239500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0240 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_24100
     * @tc.name      testDownloadData0241
     * @tc.desc      Verify download data row 240 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0241 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir240/file_240.dat', 0, 240000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other240/second_240.bin', 1, 240500);
      expect(first.url).assertEqual('https://example.com/dir240/file_240.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(240000);
      expect(second.url).assertEqual('https://example.com/other240/second_240.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(240500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0241 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_24200
     * @tc.name      testDownloadData0242
     * @tc.desc      Verify download data row 241 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0242 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir241/file_241.dat', 1, 241000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other241/second_241.bin', 2, 241500);
      expect(first.url).assertEqual('https://example.com/dir241/file_241.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(241000);
      expect(second.url).assertEqual('https://example.com/other241/second_241.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(241500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0242 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_24300
     * @tc.name      testDownloadData0243
     * @tc.desc      Verify download data row 242 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0243 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir242/file_242.dat', 2, 242000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other242/second_242.bin', 3, 242500);
      expect(first.url).assertEqual('https://example.com/dir242/file_242.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(242000);
      expect(second.url).assertEqual('https://example.com/other242/second_242.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(242500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0243 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_24400
     * @tc.name      testDownloadData0244
     * @tc.desc      Verify download data row 243 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0244 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir243/file_243.dat', 3, 243000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other243/second_243.bin', 4, 243500);
      expect(first.url).assertEqual('https://example.com/dir243/file_243.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(243000);
      expect(second.url).assertEqual('https://example.com/other243/second_243.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(243500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0244 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_24500
     * @tc.name      testDownloadData0245
     * @tc.desc      Verify download data row 244 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0245 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir244/file_244.dat', 4, 244000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other244/second_244.bin', 0, 244500);
      expect(first.url).assertEqual('https://example.com/dir244/file_244.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(244000);
      expect(second.url).assertEqual('https://example.com/other244/second_244.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(244500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0245 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_24600
     * @tc.name      testDownloadData0246
     * @tc.desc      Verify download data row 245 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0246 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir245/file_245.dat', 0, 245000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other245/second_245.bin', 1, 245500);
      expect(first.url).assertEqual('https://example.com/dir245/file_245.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(245000);
      expect(second.url).assertEqual('https://example.com/other245/second_245.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(245500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0246 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_24700
     * @tc.name      testDownloadData0247
     * @tc.desc      Verify download data row 246 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0247 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir246/file_246.dat', 1, 246000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other246/second_246.bin', 2, 246500);
      expect(first.url).assertEqual('https://example.com/dir246/file_246.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(246000);
      expect(second.url).assertEqual('https://example.com/other246/second_246.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(246500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0247 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_24800
     * @tc.name      testDownloadData0248
     * @tc.desc      Verify download data row 247 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0248 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir247/file_247.dat', 2, 247000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other247/second_247.bin', 3, 247500);
      expect(first.url).assertEqual('https://example.com/dir247/file_247.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(247000);
      expect(second.url).assertEqual('https://example.com/other247/second_247.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(247500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0248 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_24900
     * @tc.name      testDownloadData0249
     * @tc.desc      Verify download data row 248 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0249 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir248/file_248.dat', 3, 248000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other248/second_248.bin', 4, 248500);
      expect(first.url).assertEqual('https://example.com/dir248/file_248.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(248000);
      expect(second.url).assertEqual('https://example.com/other248/second_248.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(248500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0249 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_25000
     * @tc.name      testDownloadData0250
     * @tc.desc      Verify download data row 249 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0250 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir249/file_249.dat', 4, 249000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other249/second_249.bin', 0, 249500);
      expect(first.url).assertEqual('https://example.com/dir249/file_249.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(249000);
      expect(second.url).assertEqual('https://example.com/other249/second_249.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(249500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0250 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_25100
     * @tc.name      testDownloadData0251
     * @tc.desc      Verify download data row 250 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0251 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir250/file_250.dat', 0, 250000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other250/second_250.bin', 1, 250500);
      expect(first.url).assertEqual('https://example.com/dir250/file_250.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(250000);
      expect(second.url).assertEqual('https://example.com/other250/second_250.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(250500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0251 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_25200
     * @tc.name      testDownloadData0252
     * @tc.desc      Verify download data row 251 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0252 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir251/file_251.dat', 1, 251000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other251/second_251.bin', 2, 251500);
      expect(first.url).assertEqual('https://example.com/dir251/file_251.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(251000);
      expect(second.url).assertEqual('https://example.com/other251/second_251.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(251500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0252 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_25300
     * @tc.name      testDownloadData0253
     * @tc.desc      Verify download data row 252 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0253 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir252/file_252.dat', 2, 252000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other252/second_252.bin', 3, 252500);
      expect(first.url).assertEqual('https://example.com/dir252/file_252.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(252000);
      expect(second.url).assertEqual('https://example.com/other252/second_252.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(252500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0253 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_25400
     * @tc.name      testDownloadData0254
     * @tc.desc      Verify download data row 253 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0254 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir253/file_253.dat', 3, 253000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other253/second_253.bin', 4, 253500);
      expect(first.url).assertEqual('https://example.com/dir253/file_253.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(253000);
      expect(second.url).assertEqual('https://example.com/other253/second_253.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(253500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0254 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_25500
     * @tc.name      testDownloadData0255
     * @tc.desc      Verify download data row 254 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0255 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir254/file_254.dat', 4, 254000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other254/second_254.bin', 0, 254500);
      expect(first.url).assertEqual('https://example.com/dir254/file_254.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(254000);
      expect(second.url).assertEqual('https://example.com/other254/second_254.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(254500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0255 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_25600
     * @tc.name      testDownloadData0256
     * @tc.desc      Verify download data row 255 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0256 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir255/file_255.dat', 0, 255000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other255/second_255.bin', 1, 255500);
      expect(first.url).assertEqual('https://example.com/dir255/file_255.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(255000);
      expect(second.url).assertEqual('https://example.com/other255/second_255.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(255500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0256 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_25700
     * @tc.name      testDownloadData0257
     * @tc.desc      Verify download data row 256 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0257 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir256/file_256.dat', 1, 256000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other256/second_256.bin', 2, 256500);
      expect(first.url).assertEqual('https://example.com/dir256/file_256.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(256000);
      expect(second.url).assertEqual('https://example.com/other256/second_256.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(256500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0257 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_25800
     * @tc.name      testDownloadData0258
     * @tc.desc      Verify download data row 257 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0258 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir257/file_257.dat', 2, 257000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other257/second_257.bin', 3, 257500);
      expect(first.url).assertEqual('https://example.com/dir257/file_257.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(257000);
      expect(second.url).assertEqual('https://example.com/other257/second_257.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(257500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0258 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_25900
     * @tc.name      testDownloadData0259
     * @tc.desc      Verify download data row 258 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0259 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir258/file_258.dat', 3, 258000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other258/second_258.bin', 4, 258500);
      expect(first.url).assertEqual('https://example.com/dir258/file_258.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(258000);
      expect(second.url).assertEqual('https://example.com/other258/second_258.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(258500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0259 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_26000
     * @tc.name      testDownloadData0260
     * @tc.desc      Verify download data row 259 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0260 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir259/file_259.dat', 4, 259000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other259/second_259.bin', 0, 259500);
      expect(first.url).assertEqual('https://example.com/dir259/file_259.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(259000);
      expect(second.url).assertEqual('https://example.com/other259/second_259.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(259500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0260 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_26100
     * @tc.name      testDownloadData0261
     * @tc.desc      Verify download data row 260 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0261 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir260/file_260.dat', 0, 260000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other260/second_260.bin', 1, 260500);
      expect(first.url).assertEqual('https://example.com/dir260/file_260.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(260000);
      expect(second.url).assertEqual('https://example.com/other260/second_260.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(260500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0261 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_26200
     * @tc.name      testDownloadData0262
     * @tc.desc      Verify download data row 261 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0262 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir261/file_261.dat', 1, 261000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other261/second_261.bin', 2, 261500);
      expect(first.url).assertEqual('https://example.com/dir261/file_261.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(261000);
      expect(second.url).assertEqual('https://example.com/other261/second_261.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(261500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0262 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_26300
     * @tc.name      testDownloadData0263
     * @tc.desc      Verify download data row 262 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0263 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir262/file_262.dat', 2, 262000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other262/second_262.bin', 3, 262500);
      expect(first.url).assertEqual('https://example.com/dir262/file_262.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(262000);
      expect(second.url).assertEqual('https://example.com/other262/second_262.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(262500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0263 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_26400
     * @tc.name      testDownloadData0264
     * @tc.desc      Verify download data row 263 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0264 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir263/file_263.dat', 3, 263000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other263/second_263.bin', 4, 263500);
      expect(first.url).assertEqual('https://example.com/dir263/file_263.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(263000);
      expect(second.url).assertEqual('https://example.com/other263/second_263.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(263500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0264 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_26500
     * @tc.name      testDownloadData0265
     * @tc.desc      Verify download data row 264 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0265 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir264/file_264.dat', 4, 264000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other264/second_264.bin', 0, 264500);
      expect(first.url).assertEqual('https://example.com/dir264/file_264.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(264000);
      expect(second.url).assertEqual('https://example.com/other264/second_264.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(264500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0265 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_26600
     * @tc.name      testDownloadData0266
     * @tc.desc      Verify download data row 265 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0266 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir265/file_265.dat', 0, 265000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other265/second_265.bin', 1, 265500);
      expect(first.url).assertEqual('https://example.com/dir265/file_265.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(265000);
      expect(second.url).assertEqual('https://example.com/other265/second_265.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(265500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0266 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_26700
     * @tc.name      testDownloadData0267
     * @tc.desc      Verify download data row 266 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0267 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir266/file_266.dat', 1, 266000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other266/second_266.bin', 2, 266500);
      expect(first.url).assertEqual('https://example.com/dir266/file_266.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(266000);
      expect(second.url).assertEqual('https://example.com/other266/second_266.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(266500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0267 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_26800
     * @tc.name      testDownloadData0268
     * @tc.desc      Verify download data row 267 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0268 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir267/file_267.dat', 2, 267000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other267/second_267.bin', 3, 267500);
      expect(first.url).assertEqual('https://example.com/dir267/file_267.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(267000);
      expect(second.url).assertEqual('https://example.com/other267/second_267.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(267500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0268 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_26900
     * @tc.name      testDownloadData0269
     * @tc.desc      Verify download data row 268 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0269 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir268/file_268.dat', 3, 268000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other268/second_268.bin', 4, 268500);
      expect(first.url).assertEqual('https://example.com/dir268/file_268.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(268000);
      expect(second.url).assertEqual('https://example.com/other268/second_268.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(268500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0269 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_27000
     * @tc.name      testDownloadData0270
     * @tc.desc      Verify download data row 269 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0270 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir269/file_269.dat', 4, 269000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other269/second_269.bin', 0, 269500);
      expect(first.url).assertEqual('https://example.com/dir269/file_269.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(269000);
      expect(second.url).assertEqual('https://example.com/other269/second_269.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(269500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0270 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_27100
     * @tc.name      testDownloadData0271
     * @tc.desc      Verify download data row 270 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0271 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir270/file_270.dat', 0, 270000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other270/second_270.bin', 1, 270500);
      expect(first.url).assertEqual('https://example.com/dir270/file_270.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(270000);
      expect(second.url).assertEqual('https://example.com/other270/second_270.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(270500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0271 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_27200
     * @tc.name      testDownloadData0272
     * @tc.desc      Verify download data row 271 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0272 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir271/file_271.dat', 1, 271000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other271/second_271.bin', 2, 271500);
      expect(first.url).assertEqual('https://example.com/dir271/file_271.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(271000);
      expect(second.url).assertEqual('https://example.com/other271/second_271.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(271500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0272 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_27300
     * @tc.name      testDownloadData0273
     * @tc.desc      Verify download data row 272 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0273 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir272/file_272.dat', 2, 272000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other272/second_272.bin', 3, 272500);
      expect(first.url).assertEqual('https://example.com/dir272/file_272.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(272000);
      expect(second.url).assertEqual('https://example.com/other272/second_272.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(272500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0273 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_27400
     * @tc.name      testDownloadData0274
     * @tc.desc      Verify download data row 273 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0274 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir273/file_273.dat', 3, 273000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other273/second_273.bin', 4, 273500);
      expect(first.url).assertEqual('https://example.com/dir273/file_273.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(273000);
      expect(second.url).assertEqual('https://example.com/other273/second_273.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(273500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0274 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_27500
     * @tc.name      testDownloadData0275
     * @tc.desc      Verify download data row 274 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0275 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir274/file_274.dat', 4, 274000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other274/second_274.bin', 0, 274500);
      expect(first.url).assertEqual('https://example.com/dir274/file_274.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(274000);
      expect(second.url).assertEqual('https://example.com/other274/second_274.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(274500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0275 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_27600
     * @tc.name      testDownloadData0276
     * @tc.desc      Verify download data row 275 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0276 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir275/file_275.dat', 0, 275000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other275/second_275.bin', 1, 275500);
      expect(first.url).assertEqual('https://example.com/dir275/file_275.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(275000);
      expect(second.url).assertEqual('https://example.com/other275/second_275.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(275500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0276 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_27700
     * @tc.name      testDownloadData0277
     * @tc.desc      Verify download data row 276 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0277 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir276/file_276.dat', 1, 276000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other276/second_276.bin', 2, 276500);
      expect(first.url).assertEqual('https://example.com/dir276/file_276.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(276000);
      expect(second.url).assertEqual('https://example.com/other276/second_276.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(276500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0277 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_27800
     * @tc.name      testDownloadData0278
     * @tc.desc      Verify download data row 277 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0278 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir277/file_277.dat', 2, 277000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other277/second_277.bin', 3, 277500);
      expect(first.url).assertEqual('https://example.com/dir277/file_277.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(277000);
      expect(second.url).assertEqual('https://example.com/other277/second_277.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(277500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0278 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_27900
     * @tc.name      testDownloadData0279
     * @tc.desc      Verify download data row 278 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0279 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir278/file_278.dat', 3, 278000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other278/second_278.bin', 4, 278500);
      expect(first.url).assertEqual('https://example.com/dir278/file_278.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(278000);
      expect(second.url).assertEqual('https://example.com/other278/second_278.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(278500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0279 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP4_28000
     * @tc.name      testDownloadData0280
     * @tc.desc      Verify download data row 279 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0280 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir279/file_279.dat', 4, 279000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other279/second_279.bin', 0, 279500);
      expect(first.url).assertEqual('https://example.com/dir279/file_279.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(279000);
      expect(second.url).assertEqual('https://example.com/other279/second_279.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(279500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0280 end');
    })

  })
}
