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

import { describe, expect, it, Level, Size, TestType, beforeAll } from '@ohos/hypium';
import { fileIo } from '@kit.CoreFileKit';
import { common } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { requestDownload } from 'uploadanddownload';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TEST_DOMAIN: number = 0xF811;
const TEST_TAG: string = 'SampleTest';

let context: common.UIAbilityContext;

function createFile(path: string): void {
  let file = fileIo.openSync(path, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
  fileIo.closeSync(file);
}

export default function downloadCleanExtra3Test(): void {
  describe('UploadDownloadDownloadCleanExtra3Test', () => {
    beforeAll(async () => {
      context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().createModuleContext('entry') as common.UIAbilityContext;
    });
    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_EXTRA3_0100
     * @tc.name      testUploadDownloadDownloadCleanExtra30001
     * @tc.desc      Verify additional clearExistFile case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDownloadCleanExtra30001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDownloadCleanExtra30001');
        try {
          const path: string = context.cacheDir + '/y_clean_a.txt';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_EXTRA3_0200
     * @tc.name      testUploadDownloadDownloadCleanExtra30002
     * @tc.desc      Verify additional clearExistFile case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDownloadCleanExtra30002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDownloadCleanExtra30002');
        try {
          const path: string = context.cacheDir + '/y_clean_b.bin';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_EXTRA3_0300
     * @tc.name      testUploadDownloadDownloadCleanExtra30003
     * @tc.desc      Verify additional clearExistFile case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDownloadCleanExtra30003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDownloadCleanExtra30003');
        try {
          const path: string = context.cacheDir + '/y_clean_c.jpg';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_EXTRA3_0400
     * @tc.name      testUploadDownloadDownloadCleanExtra30004
     * @tc.desc      Verify additional clearExistFile case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDownloadCleanExtra30004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDownloadCleanExtra30004');
        try {
          const path: string = context.cacheDir + '/y_clean_d.mp3';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_EXTRA3_0500
     * @tc.name      testUploadDownloadDownloadCleanExtra30005
     * @tc.desc      Verify additional clearExistFile case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDownloadCleanExtra30005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDownloadCleanExtra30005');
        try {
          const path: string = context.cacheDir + '/y_clean_e.mp4';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_EXTRA3_0600
     * @tc.name      testUploadDownloadDownloadCleanExtra30006
     * @tc.desc      Verify additional clearExistFile case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDownloadCleanExtra30006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDownloadCleanExtra30006');
        try {
          const path: string = context.cacheDir + '/y_clean space.txt';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_EXTRA3_0700
     * @tc.name      testUploadDownloadDownloadCleanExtra30007
     * @tc.desc      Verify additional clearExistFile case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDownloadCleanExtra30007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDownloadCleanExtra30007');
        try {
          const path: string = context.cacheDir + '/y_clean_中文.txt';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_EXTRA3_0800
     * @tc.name      testUploadDownloadDownloadCleanExtra30008
     * @tc.desc      Verify additional clearExistFile case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDownloadCleanExtra30008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDownloadCleanExtra30008');
        try {
          const path: string = context.cacheDir + '/y_clean.tar.gz';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_EXTRA3_0900
     * @tc.name      testUploadDownloadDownloadCleanExtra30009
     * @tc.desc      Verify additional clearExistFile case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDownloadCleanExtra30009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDownloadCleanExtra30009');
        try {
          const path: string = context.cacheDir + '/y_clean.dot.name';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_EXTRA3_1000
     * @tc.name      testUploadDownloadDownloadCleanExtra30010
     * @tc.desc      Verify additional clearExistFile case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDownloadCleanExtra30010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDownloadCleanExtra30010');
        try {
          const path: string = context.cacheDir + '/y_clean_1';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_EXTRA3_1100
     * @tc.name      testUploadDownloadDownloadCleanExtra30011
     * @tc.desc      Verify additional clearExistFile case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDownloadCleanExtra30011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDownloadCleanExtra30011');
        try {
          const path: string = context.cacheDir + '/y_clean_2';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_EXTRA3_1200
     * @tc.name      testUploadDownloadDownloadCleanExtra30012
     * @tc.desc      Verify additional clearExistFile case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDownloadCleanExtra30012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDownloadCleanExtra30012');
        try {
          const path: string = context.cacheDir + '/y_clean_3';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
