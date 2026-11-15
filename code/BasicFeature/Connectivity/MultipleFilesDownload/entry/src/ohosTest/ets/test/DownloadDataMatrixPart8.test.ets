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

export default function DownloadDataMatrixPart8Test(): void {
  describe('DownloadDataMatrixPart8', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP8_49100
     * @tc.name      testDownloadData0491
     * @tc.desc      Verify download data row 490 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0491', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0491 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir490/file_490.dat', 0, 490000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other490/second_490.bin', 1, 490500);
      expect(first.url).assertEqual('https://example.com/dir490/file_490.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(490000);
      expect(second.url).assertEqual('https://example.com/other490/second_490.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(490500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0491 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP8_49200
     * @tc.name      testDownloadData0492
     * @tc.desc      Verify download data row 491 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0492', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0492 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir491/file_491.dat', 1, 491000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other491/second_491.bin', 2, 491500);
      expect(first.url).assertEqual('https://example.com/dir491/file_491.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(491000);
      expect(second.url).assertEqual('https://example.com/other491/second_491.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(491500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0492 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP8_49300
     * @tc.name      testDownloadData0493
     * @tc.desc      Verify download data row 492 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0493', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0493 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir492/file_492.dat', 2, 492000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other492/second_492.bin', 3, 492500);
      expect(first.url).assertEqual('https://example.com/dir492/file_492.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(492000);
      expect(second.url).assertEqual('https://example.com/other492/second_492.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(492500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0493 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP8_49400
     * @tc.name      testDownloadData0494
     * @tc.desc      Verify download data row 493 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0494', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0494 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir493/file_493.dat', 3, 493000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other493/second_493.bin', 4, 493500);
      expect(first.url).assertEqual('https://example.com/dir493/file_493.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(493000);
      expect(second.url).assertEqual('https://example.com/other493/second_493.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(493500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0494 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP8_49500
     * @tc.name      testDownloadData0495
     * @tc.desc      Verify download data row 494 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0495', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0495 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir494/file_494.dat', 4, 494000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other494/second_494.bin', 0, 494500);
      expect(first.url).assertEqual('https://example.com/dir494/file_494.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(494000);
      expect(second.url).assertEqual('https://example.com/other494/second_494.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(494500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0495 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP8_49600
     * @tc.name      testDownloadData0496
     * @tc.desc      Verify download data row 495 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0496', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0496 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir495/file_495.dat', 0, 495000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other495/second_495.bin', 1, 495500);
      expect(first.url).assertEqual('https://example.com/dir495/file_495.dat');
      expect(first.fileStatus).assertEqual(0);
      expect(first.downloadTime).assertEqual(495000);
      expect(second.url).assertEqual('https://example.com/other495/second_495.bin');
      expect(second.fileStatus).assertEqual(1);
      expect(second.downloadTime).assertEqual(495500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0496 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP8_49700
     * @tc.name      testDownloadData0497
     * @tc.desc      Verify download data row 496 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0497', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0497 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir496/file_496.dat', 1, 496000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other496/second_496.bin', 2, 496500);
      expect(first.url).assertEqual('https://example.com/dir496/file_496.dat');
      expect(first.fileStatus).assertEqual(1);
      expect(first.downloadTime).assertEqual(496000);
      expect(second.url).assertEqual('https://example.com/other496/second_496.bin');
      expect(second.fileStatus).assertEqual(2);
      expect(second.downloadTime).assertEqual(496500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0497 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP8_49800
     * @tc.name      testDownloadData0498
     * @tc.desc      Verify download data row 497 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0498', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0498 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir497/file_497.dat', 2, 497000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other497/second_497.bin', 3, 497500);
      expect(first.url).assertEqual('https://example.com/dir497/file_497.dat');
      expect(first.fileStatus).assertEqual(2);
      expect(first.downloadTime).assertEqual(497000);
      expect(second.url).assertEqual('https://example.com/other497/second_497.bin');
      expect(second.fileStatus).assertEqual(3);
      expect(second.downloadTime).assertEqual(497500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0498 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP8_49900
     * @tc.name      testDownloadData0499
     * @tc.desc      Verify download data row 498 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0499', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0499 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir498/file_498.dat', 3, 498000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other498/second_498.bin', 4, 498500);
      expect(first.url).assertEqual('https://example.com/dir498/file_498.dat');
      expect(first.fileStatus).assertEqual(3);
      expect(first.downloadTime).assertEqual(498000);
      expect(second.url).assertEqual('https://example.com/other498/second_498.bin');
      expect(second.fileStatus).assertEqual(4);
      expect(second.downloadTime).assertEqual(498500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0499 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATAP8_50000
     * @tc.name      testDownloadData0500
     * @tc.desc      Verify download data row 499 keeps url, status, time and sequence id.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadData0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0500 begin');
      const first: downloadFilesData = new downloadFilesData('https://example.com/dir499/file_499.dat', 4, 499000);
      const second: downloadFilesData = new downloadFilesData('https://example.com/other499/second_499.bin', 0, 499500);
      expect(first.url).assertEqual('https://example.com/dir499/file_499.dat');
      expect(first.fileStatus).assertEqual(4);
      expect(first.downloadTime).assertEqual(499000);
      expect(second.url).assertEqual('https://example.com/other499/second_499.bin');
      expect(second.fileStatus).assertEqual(0);
      expect(second.downloadTime).assertEqual(499500);
      expect(first.id > 0).assertTrue();
      expect(second.id).assertEqual(first.id + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadData0500 end');
    })

  })
}
