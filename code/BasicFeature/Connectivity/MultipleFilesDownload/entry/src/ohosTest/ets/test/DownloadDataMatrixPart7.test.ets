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

export default function DownloadDataMatrixPart7Test(): void {
  describe('DownloadDataMatrixPart7', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_42100
     * @tc.name      testDownloadData0421
     * @tc.desc      Verify download data row 420 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0421 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir420/file_420.dat', 0, 420000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other420/second_420.bin', 1, 420500);
      expect(first.url).assertEqual('https://example.com/dir420/file_420.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(420000);
      expect(second.url).assertEqual('https://example.com/other420/second_420.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(420500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0421 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_42200
     * @tc.name      testDownloadData0422
     * @tc.desc      Verify download data row 421 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0422 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir421/file_421.dat', 1, 421000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other421/second_421.bin', 2, 421500);
      expect(first.url).assertEqual('https://example.com/dir421/file_421.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(421000);
      expect(second.url).assertEqual('https://example.com/other421/second_421.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(421500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0422 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_42300
     * @tc.name      testDownloadData0423
     * @tc.desc      Verify download data row 422 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0423 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir422/file_422.dat', 2, 422000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other422/second_422.bin', 3, 422500);
      expect(first.url).assertEqual('https://example.com/dir422/file_422.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(422000);
      expect(second.url).assertEqual('https://example.com/other422/second_422.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(422500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0423 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_42400
     * @tc.name      testDownloadData0424
     * @tc.desc      Verify download data row 423 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0424 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir423/file_423.dat', 3, 423000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other423/second_423.bin', 4, 423500);
      expect(first.url).assertEqual('https://example.com/dir423/file_423.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(423000);
      expect(second.url).assertEqual('https://example.com/other423/second_423.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(423500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0424 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_42500
     * @tc.name      testDownloadData0425
     * @tc.desc      Verify download data row 424 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0425 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir424/file_424.dat', 4, 424000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other424/second_424.bin', 0, 424500);
      expect(first.url).assertEqual('https://example.com/dir424/file_424.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(424000);
      expect(second.url).assertEqual('https://example.com/other424/second_424.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(424500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0425 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_42600
     * @tc.name      testDownloadData0426
     * @tc.desc      Verify download data row 425 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0426 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir425/file_425.dat', 0, 425000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other425/second_425.bin', 1, 425500);
      expect(first.url).assertEqual('https://example.com/dir425/file_425.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(425000);
      expect(second.url).assertEqual('https://example.com/other425/second_425.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(425500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0426 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_42700
     * @tc.name      testDownloadData0427
     * @tc.desc      Verify download data row 426 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0427 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir426/file_426.dat', 1, 426000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other426/second_426.bin', 2, 426500);
      expect(first.url).assertEqual('https://example.com/dir426/file_426.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(426000);
      expect(second.url).assertEqual('https://example.com/other426/second_426.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(426500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0427 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_42800
     * @tc.name      testDownloadData0428
     * @tc.desc      Verify download data row 427 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0428 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir427/file_427.dat', 2, 427000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other427/second_427.bin', 3, 427500);
      expect(first.url).assertEqual('https://example.com/dir427/file_427.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(427000);
      expect(second.url).assertEqual('https://example.com/other427/second_427.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(427500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0428 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_42900
     * @tc.name      testDownloadData0429
     * @tc.desc      Verify download data row 428 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0429 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir428/file_428.dat', 3, 428000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other428/second_428.bin', 4, 428500);
      expect(first.url).assertEqual('https://example.com/dir428/file_428.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(428000);
      expect(second.url).assertEqual('https://example.com/other428/second_428.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(428500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0429 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_43000
     * @tc.name      testDownloadData0430
     * @tc.desc      Verify download data row 429 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0430 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir429/file_429.dat', 4, 429000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other429/second_429.bin', 0, 429500);
      expect(first.url).assertEqual('https://example.com/dir429/file_429.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(429000);
      expect(second.url).assertEqual('https://example.com/other429/second_429.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(429500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0430 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_43100
     * @tc.name      testDownloadData0431
     * @tc.desc      Verify download data row 430 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0431 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir430/file_430.dat', 0, 430000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other430/second_430.bin', 1, 430500);
      expect(first.url).assertEqual('https://example.com/dir430/file_430.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(430000);
      expect(second.url).assertEqual('https://example.com/other430/second_430.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(430500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0431 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_43200
     * @tc.name      testDownloadData0432
     * @tc.desc      Verify download data row 431 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0432 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir431/file_431.dat', 1, 431000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other431/second_431.bin', 2, 431500);
      expect(first.url).assertEqual('https://example.com/dir431/file_431.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(431000);
      expect(second.url).assertEqual('https://example.com/other431/second_431.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(431500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0432 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_43300
     * @tc.name      testDownloadData0433
     * @tc.desc      Verify download data row 432 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0433 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir432/file_432.dat', 2, 432000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other432/second_432.bin', 3, 432500);
      expect(first.url).assertEqual('https://example.com/dir432/file_432.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(432000);
      expect(second.url).assertEqual('https://example.com/other432/second_432.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(432500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0433 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_43400
     * @tc.name      testDownloadData0434
     * @tc.desc      Verify download data row 433 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0434 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir433/file_433.dat', 3, 433000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other433/second_433.bin', 4, 433500);
      expect(first.url).assertEqual('https://example.com/dir433/file_433.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(433000);
      expect(second.url).assertEqual('https://example.com/other433/second_433.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(433500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0434 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_43500
     * @tc.name      testDownloadData0435
     * @tc.desc      Verify download data row 434 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0435 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir434/file_434.dat', 4, 434000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other434/second_434.bin', 0, 434500);
      expect(first.url).assertEqual('https://example.com/dir434/file_434.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(434000);
      expect(second.url).assertEqual('https://example.com/other434/second_434.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(434500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0435 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_43600
     * @tc.name      testDownloadData0436
     * @tc.desc      Verify download data row 435 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0436 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir435/file_435.dat', 0, 435000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other435/second_435.bin', 1, 435500);
      expect(first.url).assertEqual('https://example.com/dir435/file_435.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(435000);
      expect(second.url).assertEqual('https://example.com/other435/second_435.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(435500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0436 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_43700
     * @tc.name      testDownloadData0437
     * @tc.desc      Verify download data row 436 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0437', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0437 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir436/file_436.dat', 1, 436000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other436/second_436.bin', 2, 436500);
      expect(first.url).assertEqual('https://example.com/dir436/file_436.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(436000);
      expect(second.url).assertEqual('https://example.com/other436/second_436.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(436500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0437 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_43800
     * @tc.name      testDownloadData0438
     * @tc.desc      Verify download data row 437 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0438', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0438 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir437/file_437.dat', 2, 437000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other437/second_437.bin', 3, 437500);
      expect(first.url).assertEqual('https://example.com/dir437/file_437.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(437000);
      expect(second.url).assertEqual('https://example.com/other437/second_437.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(437500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0438 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_43900
     * @tc.name      testDownloadData0439
     * @tc.desc      Verify download data row 438 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0439', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0439 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir438/file_438.dat', 3, 438000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other438/second_438.bin', 4, 438500);
      expect(first.url).assertEqual('https://example.com/dir438/file_438.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(438000);
      expect(second.url).assertEqual('https://example.com/other438/second_438.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(438500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0439 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_44000
     * @tc.name      testDownloadData0440
     * @tc.desc      Verify download data row 439 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0440', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0440 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir439/file_439.dat', 4, 439000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other439/second_439.bin', 0, 439500);
      expect(first.url).assertEqual('https://example.com/dir439/file_439.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(439000);
      expect(second.url).assertEqual('https://example.com/other439/second_439.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(439500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0440 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_44100
     * @tc.name      testDownloadData0441
     * @tc.desc      Verify download data row 440 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0441', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0441 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir440/file_440.dat', 0, 440000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other440/second_440.bin', 1, 440500);
      expect(first.url).assertEqual('https://example.com/dir440/file_440.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(440000);
      expect(second.url).assertEqual('https://example.com/other440/second_440.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(440500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0441 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_44200
     * @tc.name      testDownloadData0442
     * @tc.desc      Verify download data row 441 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0442', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0442 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir441/file_441.dat', 1, 441000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other441/second_441.bin', 2, 441500);
      expect(first.url).assertEqual('https://example.com/dir441/file_441.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(441000);
      expect(second.url).assertEqual('https://example.com/other441/second_441.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(441500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0442 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_44300
     * @tc.name      testDownloadData0443
     * @tc.desc      Verify download data row 442 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0443', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0443 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir442/file_442.dat', 2, 442000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other442/second_442.bin', 3, 442500);
      expect(first.url).assertEqual('https://example.com/dir442/file_442.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(442000);
      expect(second.url).assertEqual('https://example.com/other442/second_442.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(442500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0443 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_44400
     * @tc.name      testDownloadData0444
     * @tc.desc      Verify download data row 443 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0444', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0444 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir443/file_443.dat', 3, 443000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other443/second_443.bin', 4, 443500);
      expect(first.url).assertEqual('https://example.com/dir443/file_443.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(443000);
      expect(second.url).assertEqual('https://example.com/other443/second_443.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(443500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0444 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_44500
     * @tc.name      testDownloadData0445
     * @tc.desc      Verify download data row 444 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0445', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0445 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir444/file_444.dat', 4, 444000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other444/second_444.bin', 0, 444500);
      expect(first.url).assertEqual('https://example.com/dir444/file_444.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(444000);
      expect(second.url).assertEqual('https://example.com/other444/second_444.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(444500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0445 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_44600
     * @tc.name      testDownloadData0446
     * @tc.desc      Verify download data row 445 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0446', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0446 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir445/file_445.dat', 0, 445000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other445/second_445.bin', 1, 445500);
      expect(first.url).assertEqual('https://example.com/dir445/file_445.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(445000);
      expect(second.url).assertEqual('https://example.com/other445/second_445.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(445500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0446 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_44700
     * @tc.name      testDownloadData0447
     * @tc.desc      Verify download data row 446 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0447', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0447 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir446/file_446.dat', 1, 446000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other446/second_446.bin', 2, 446500);
      expect(first.url).assertEqual('https://example.com/dir446/file_446.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(446000);
      expect(second.url).assertEqual('https://example.com/other446/second_446.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(446500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0447 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_44800
     * @tc.name      testDownloadData0448
     * @tc.desc      Verify download data row 447 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0448', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0448 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir447/file_447.dat', 2, 447000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other447/second_447.bin', 3, 447500);
      expect(first.url).assertEqual('https://example.com/dir447/file_447.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(447000);
      expect(second.url).assertEqual('https://example.com/other447/second_447.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(447500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0448 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_44900
     * @tc.name      testDownloadData0449
     * @tc.desc      Verify download data row 448 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0449', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0449 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir448/file_448.dat', 3, 448000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other448/second_448.bin', 4, 448500);
      expect(first.url).assertEqual('https://example.com/dir448/file_448.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(448000);
      expect(second.url).assertEqual('https://example.com/other448/second_448.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(448500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0449 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_45000
     * @tc.name      testDownloadData0450
     * @tc.desc      Verify download data row 449 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0450', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0450 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir449/file_449.dat', 4, 449000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other449/second_449.bin', 0, 449500);
      expect(first.url).assertEqual('https://example.com/dir449/file_449.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(449000);
      expect(second.url).assertEqual('https://example.com/other449/second_449.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(449500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0450 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_45100
     * @tc.name      testDownloadData0451
     * @tc.desc      Verify download data row 450 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0451', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0451 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir450/file_450.dat', 0, 450000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other450/second_450.bin', 1, 450500);
      expect(first.url).assertEqual('https://example.com/dir450/file_450.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(450000);
      expect(second.url).assertEqual('https://example.com/other450/second_450.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(450500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0451 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_45200
     * @tc.name      testDownloadData0452
     * @tc.desc      Verify download data row 451 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0452', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0452 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir451/file_451.dat', 1, 451000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other451/second_451.bin', 2, 451500);
      expect(first.url).assertEqual('https://example.com/dir451/file_451.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(451000);
      expect(second.url).assertEqual('https://example.com/other451/second_451.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(451500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0452 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_45300
     * @tc.name      testDownloadData0453
     * @tc.desc      Verify download data row 452 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0453', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0453 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir452/file_452.dat', 2, 452000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other452/second_452.bin', 3, 452500);
      expect(first.url).assertEqual('https://example.com/dir452/file_452.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(452000);
      expect(second.url).assertEqual('https://example.com/other452/second_452.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(452500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0453 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_45400
     * @tc.name      testDownloadData0454
     * @tc.desc      Verify download data row 453 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0454', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0454 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir453/file_453.dat', 3, 453000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other453/second_453.bin', 4, 453500);
      expect(first.url).assertEqual('https://example.com/dir453/file_453.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(453000);
      expect(second.url).assertEqual('https://example.com/other453/second_453.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(453500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0454 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_45500
     * @tc.name      testDownloadData0455
     * @tc.desc      Verify download data row 454 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0455', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0455 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir454/file_454.dat', 4, 454000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other454/second_454.bin', 0, 454500);
      expect(first.url).assertEqual('https://example.com/dir454/file_454.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(454000);
      expect(second.url).assertEqual('https://example.com/other454/second_454.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(454500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0455 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_45600
     * @tc.name      testDownloadData0456
     * @tc.desc      Verify download data row 455 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0456', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0456 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir455/file_455.dat', 0, 455000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other455/second_455.bin', 1, 455500);
      expect(first.url).assertEqual('https://example.com/dir455/file_455.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(455000);
      expect(second.url).assertEqual('https://example.com/other455/second_455.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(455500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0456 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_45700
     * @tc.name      testDownloadData0457
     * @tc.desc      Verify download data row 456 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0457', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0457 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir456/file_456.dat', 1, 456000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other456/second_456.bin', 2, 456500);
      expect(first.url).assertEqual('https://example.com/dir456/file_456.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(456000);
      expect(second.url).assertEqual('https://example.com/other456/second_456.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(456500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0457 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_45800
     * @tc.name      testDownloadData0458
     * @tc.desc      Verify download data row 457 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0458', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0458 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir457/file_457.dat', 2, 457000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other457/second_457.bin', 3, 457500);
      expect(first.url).assertEqual('https://example.com/dir457/file_457.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(457000);
      expect(second.url).assertEqual('https://example.com/other457/second_457.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(457500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0458 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_45900
     * @tc.name      testDownloadData0459
     * @tc.desc      Verify download data row 458 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0459', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0459 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir458/file_458.dat', 3, 458000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other458/second_458.bin', 4, 458500);
      expect(first.url).assertEqual('https://example.com/dir458/file_458.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(458000);
      expect(second.url).assertEqual('https://example.com/other458/second_458.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(458500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0459 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_46000
     * @tc.name      testDownloadData0460
     * @tc.desc      Verify download data row 459 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0460', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0460 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir459/file_459.dat', 4, 459000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other459/second_459.bin', 0, 459500);
      expect(first.url).assertEqual('https://example.com/dir459/file_459.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(459000);
      expect(second.url).assertEqual('https://example.com/other459/second_459.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(459500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0460 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_46100
     * @tc.name      testDownloadData0461
     * @tc.desc      Verify download data row 460 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0461', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0461 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir460/file_460.dat', 0, 460000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other460/second_460.bin', 1, 460500);
      expect(first.url).assertEqual('https://example.com/dir460/file_460.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(460000);
      expect(second.url).assertEqual('https://example.com/other460/second_460.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(460500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0461 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_46200
     * @tc.name      testDownloadData0462
     * @tc.desc      Verify download data row 461 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0462', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0462 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir461/file_461.dat', 1, 461000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other461/second_461.bin', 2, 461500);
      expect(first.url).assertEqual('https://example.com/dir461/file_461.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(461000);
      expect(second.url).assertEqual('https://example.com/other461/second_461.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(461500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0462 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_46300
     * @tc.name      testDownloadData0463
     * @tc.desc      Verify download data row 462 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0463', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0463 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir462/file_462.dat', 2, 462000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other462/second_462.bin', 3, 462500);
      expect(first.url).assertEqual('https://example.com/dir462/file_462.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(462000);
      expect(second.url).assertEqual('https://example.com/other462/second_462.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(462500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0463 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_46400
     * @tc.name      testDownloadData0464
     * @tc.desc      Verify download data row 463 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0464', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0464 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir463/file_463.dat', 3, 463000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other463/second_463.bin', 4, 463500);
      expect(first.url).assertEqual('https://example.com/dir463/file_463.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(463000);
      expect(second.url).assertEqual('https://example.com/other463/second_463.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(463500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0464 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_46500
     * @tc.name      testDownloadData0465
     * @tc.desc      Verify download data row 464 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0465', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0465 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir464/file_464.dat', 4, 464000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other464/second_464.bin', 0, 464500);
      expect(first.url).assertEqual('https://example.com/dir464/file_464.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(464000);
      expect(second.url).assertEqual('https://example.com/other464/second_464.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(464500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0465 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_46600
     * @tc.name      testDownloadData0466
     * @tc.desc      Verify download data row 465 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0466', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0466 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir465/file_465.dat', 0, 465000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other465/second_465.bin', 1, 465500);
      expect(first.url).assertEqual('https://example.com/dir465/file_465.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(465000);
      expect(second.url).assertEqual('https://example.com/other465/second_465.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(465500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0466 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_46700
     * @tc.name      testDownloadData0467
     * @tc.desc      Verify download data row 466 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0467', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0467 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir466/file_466.dat', 1, 466000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other466/second_466.bin', 2, 466500);
      expect(first.url).assertEqual('https://example.com/dir466/file_466.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(466000);
      expect(second.url).assertEqual('https://example.com/other466/second_466.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(466500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0467 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_46800
     * @tc.name      testDownloadData0468
     * @tc.desc      Verify download data row 467 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0468', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0468 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir467/file_467.dat', 2, 467000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other467/second_467.bin', 3, 467500);
      expect(first.url).assertEqual('https://example.com/dir467/file_467.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(467000);
      expect(second.url).assertEqual('https://example.com/other467/second_467.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(467500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0468 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_46900
     * @tc.name      testDownloadData0469
     * @tc.desc      Verify download data row 468 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0469', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0469 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir468/file_468.dat', 3, 468000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other468/second_468.bin', 4, 468500);
      expect(first.url).assertEqual('https://example.com/dir468/file_468.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(468000);
      expect(second.url).assertEqual('https://example.com/other468/second_468.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(468500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0469 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_47000
     * @tc.name      testDownloadData0470
     * @tc.desc      Verify download data row 469 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0470', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0470 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir469/file_469.dat', 4, 469000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other469/second_469.bin', 0, 469500);
      expect(first.url).assertEqual('https://example.com/dir469/file_469.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(469000);
      expect(second.url).assertEqual('https://example.com/other469/second_469.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(469500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0470 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_47100
     * @tc.name      testDownloadData0471
     * @tc.desc      Verify download data row 470 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0471', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0471 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir470/file_470.dat', 0, 470000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other470/second_470.bin', 1, 470500);
      expect(first.url).assertEqual('https://example.com/dir470/file_470.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(470000);
      expect(second.url).assertEqual('https://example.com/other470/second_470.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(470500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0471 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_47200
     * @tc.name      testDownloadData0472
     * @tc.desc      Verify download data row 471 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0472', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0472 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir471/file_471.dat', 1, 471000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other471/second_471.bin', 2, 471500);
      expect(first.url).assertEqual('https://example.com/dir471/file_471.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(471000);
      expect(second.url).assertEqual('https://example.com/other471/second_471.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(471500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0472 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_47300
     * @tc.name      testDownloadData0473
     * @tc.desc      Verify download data row 472 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0473', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0473 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir472/file_472.dat', 2, 472000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other472/second_472.bin', 3, 472500);
      expect(first.url).assertEqual('https://example.com/dir472/file_472.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(472000);
      expect(second.url).assertEqual('https://example.com/other472/second_472.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(472500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0473 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_47400
     * @tc.name      testDownloadData0474
     * @tc.desc      Verify download data row 473 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0474', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0474 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir473/file_473.dat', 3, 473000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other473/second_473.bin', 4, 473500);
      expect(first.url).assertEqual('https://example.com/dir473/file_473.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(473000);
      expect(second.url).assertEqual('https://example.com/other473/second_473.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(473500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0474 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_47500
     * @tc.name      testDownloadData0475
     * @tc.desc      Verify download data row 474 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0475', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0475 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir474/file_474.dat', 4, 474000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other474/second_474.bin', 0, 474500);
      expect(first.url).assertEqual('https://example.com/dir474/file_474.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(474000);
      expect(second.url).assertEqual('https://example.com/other474/second_474.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(474500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0475 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_47600
     * @tc.name      testDownloadData0476
     * @tc.desc      Verify download data row 475 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0476', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0476 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir475/file_475.dat', 0, 475000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other475/second_475.bin', 1, 475500);
      expect(first.url).assertEqual('https://example.com/dir475/file_475.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(475000);
      expect(second.url).assertEqual('https://example.com/other475/second_475.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(475500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0476 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_47700
     * @tc.name      testDownloadData0477
     * @tc.desc      Verify download data row 476 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0477', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0477 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir476/file_476.dat', 1, 476000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other476/second_476.bin', 2, 476500);
      expect(first.url).assertEqual('https://example.com/dir476/file_476.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(476000);
      expect(second.url).assertEqual('https://example.com/other476/second_476.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(476500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0477 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_47800
     * @tc.name      testDownloadData0478
     * @tc.desc      Verify download data row 477 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0478', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0478 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir477/file_477.dat', 2, 477000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other477/second_477.bin', 3, 477500);
      expect(first.url).assertEqual('https://example.com/dir477/file_477.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(477000);
      expect(second.url).assertEqual('https://example.com/other477/second_477.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(477500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0478 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_47900
     * @tc.name      testDownloadData0479
     * @tc.desc      Verify download data row 478 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0479', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0479 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir478/file_478.dat', 3, 478000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other478/second_478.bin', 4, 478500);
      expect(first.url).assertEqual('https://example.com/dir478/file_478.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(478000);
      expect(second.url).assertEqual('https://example.com/other478/second_478.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(478500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0479 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_48000
     * @tc.name      testDownloadData0480
     * @tc.desc      Verify download data row 479 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0480', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0480 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir479/file_479.dat', 4, 479000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other479/second_479.bin', 0, 479500);
      expect(first.url).assertEqual('https://example.com/dir479/file_479.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(479000);
      expect(second.url).assertEqual('https://example.com/other479/second_479.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(479500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0480 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_48100
     * @tc.name      testDownloadData0481
     * @tc.desc      Verify download data row 480 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0481', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0481 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir480/file_480.dat', 0, 480000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other480/second_480.bin', 1, 480500);
      expect(first.url).assertEqual('https://example.com/dir480/file_480.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(480000);
      expect(second.url).assertEqual('https://example.com/other480/second_480.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(480500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0481 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_48200
     * @tc.name      testDownloadData0482
     * @tc.desc      Verify download data row 481 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0482', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0482 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir481/file_481.dat', 1, 481000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other481/second_481.bin', 2, 481500);
      expect(first.url).assertEqual('https://example.com/dir481/file_481.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(481000);
      expect(second.url).assertEqual('https://example.com/other481/second_481.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(481500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0482 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_48300
     * @tc.name      testDownloadData0483
     * @tc.desc      Verify download data row 482 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0483', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0483 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir482/file_482.dat', 2, 482000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other482/second_482.bin', 3, 482500);
      expect(first.url).assertEqual('https://example.com/dir482/file_482.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(482000);
      expect(second.url).assertEqual('https://example.com/other482/second_482.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(482500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0483 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_48400
     * @tc.name      testDownloadData0484
     * @tc.desc      Verify download data row 483 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0484', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0484 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir483/file_483.dat', 3, 483000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other483/second_483.bin', 4, 483500);
      expect(first.url).assertEqual('https://example.com/dir483/file_483.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(483000);
      expect(second.url).assertEqual('https://example.com/other483/second_483.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(483500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0484 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_48500
     * @tc.name      testDownloadData0485
     * @tc.desc      Verify download data row 484 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0485', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0485 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir484/file_484.dat', 4, 484000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other484/second_484.bin', 0, 484500);
      expect(first.url).assertEqual('https://example.com/dir484/file_484.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(484000);
      expect(second.url).assertEqual('https://example.com/other484/second_484.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(484500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0485 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_48600
     * @tc.name      testDownloadData0486
     * @tc.desc      Verify download data row 485 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0486', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0486 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir485/file_485.dat', 0, 485000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other485/second_485.bin', 1, 485500);
      expect(first.url).assertEqual('https://example.com/dir485/file_485.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(485000);
      expect(second.url).assertEqual('https://example.com/other485/second_485.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(485500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0486 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_48700
     * @tc.name      testDownloadData0487
     * @tc.desc      Verify download data row 486 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0487', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0487 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir486/file_486.dat', 1, 486000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other486/second_486.bin', 2, 486500);
      expect(first.url).assertEqual('https://example.com/dir486/file_486.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(486000);
      expect(second.url).assertEqual('https://example.com/other486/second_486.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(486500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0487 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_48800
     * @tc.name      testDownloadData0488
     * @tc.desc      Verify download data row 487 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0488', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0488 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir487/file_487.dat', 2, 487000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other487/second_487.bin', 3, 487500);
      expect(first.url).assertEqual('https://example.com/dir487/file_487.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(487000);
      expect(second.url).assertEqual('https://example.com/other487/second_487.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(487500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0488 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_48900
     * @tc.name      testDownloadData0489
     * @tc.desc      Verify download data row 488 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0489', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0489 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir488/file_488.dat', 3, 488000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other488/second_488.bin', 4, 488500);
      expect(first.url).assertEqual('https://example.com/dir488/file_488.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(488000);
      expect(second.url).assertEqual('https://example.com/other488/second_488.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(488500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0489 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP7_49000
     * @tc.name      testDownloadData0490
     * @tc.desc      Verify download data row 489 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0490', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0490 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir489/file_489.dat', 4, 489000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other489/second_489.bin', 0, 489500);
      expect(first.url).assertEqual('https://example.com/dir489/file_489.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(489000);
      expect(second.url).assertEqual('https://example.com/other489/second_489.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(489500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0490 end');
    })

  })
}
