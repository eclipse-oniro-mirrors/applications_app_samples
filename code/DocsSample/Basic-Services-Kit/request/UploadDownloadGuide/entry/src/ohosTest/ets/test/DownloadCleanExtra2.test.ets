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

export default function downloadCleanExtra2Test(): void {
  describe('UploadDownloadDownloadCleanExtra2Test', () => {
    beforeAll(async () => {
      context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().createModuleContext('entry') as common.UIAbilityContext;
    });
    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_EXTRA2_0100
     * @tc.name      testUploadDownloadDownloadCleanExtra20001
     * @tc.desc      Verify additional clearExistFile case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDownloadCleanExtra20001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDownloadCleanExtra20001');
        try {
          const path: string = context.cacheDir + '/x_clean_1.txt';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_EXTRA2_0200
     * @tc.name      testUploadDownloadDownloadCleanExtra20002
     * @tc.desc      Verify additional clearExistFile case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDownloadCleanExtra20002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDownloadCleanExtra20002');
        try {
          const path: string = context.cacheDir + '/x_clean_2.txt';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_EXTRA2_0300
     * @tc.name      testUploadDownloadDownloadCleanExtra20003
     * @tc.desc      Verify additional clearExistFile case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDownloadCleanExtra20003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDownloadCleanExtra20003');
        try {
          const path: string = context.cacheDir + '/x_clean_3.bin';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_EXTRA2_0400
     * @tc.name      testUploadDownloadDownloadCleanExtra20004
     * @tc.desc      Verify additional clearExistFile case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDownloadCleanExtra20004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDownloadCleanExtra20004');
        try {
          const path: string = context.cacheDir + '/x_clean space.txt';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_EXTRA2_0500
     * @tc.name      testUploadDownloadDownloadCleanExtra20005
     * @tc.desc      Verify additional clearExistFile case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDownloadCleanExtra20005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDownloadCleanExtra20005');
        try {
          const path: string = context.cacheDir + '/x_clean_中文.txt';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_EXTRA2_0600
     * @tc.name      testUploadDownloadDownloadCleanExtra20006
     * @tc.desc      Verify additional clearExistFile case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDownloadCleanExtra20006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDownloadCleanExtra20006');
        try {
          const path: string = context.cacheDir + '/x_clean.jpg';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_EXTRA2_0700
     * @tc.name      testUploadDownloadDownloadCleanExtra20007
     * @tc.desc      Verify additional clearExistFile case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDownloadCleanExtra20007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDownloadCleanExtra20007');
        try {
          const path: string = context.cacheDir + '/x_clean.mp3';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_EXTRA2_0800
     * @tc.name      testUploadDownloadDownloadCleanExtra20008
     * @tc.desc      Verify additional clearExistFile case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDownloadCleanExtra20008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDownloadCleanExtra20008');
        try {
          const path: string = context.cacheDir + '/x_clean.mp4';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_EXTRA2_0900
     * @tc.name      testUploadDownloadDownloadCleanExtra20009
     * @tc.desc      Verify additional clearExistFile case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDownloadCleanExtra20009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDownloadCleanExtra20009');
        try {
          const path: string = context.cacheDir + '/x_clean.tar.gz';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_EXTRA2_1000
     * @tc.name      testUploadDownloadDownloadCleanExtra20010
     * @tc.desc      Verify additional clearExistFile case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDownloadCleanExtra20010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDownloadCleanExtra20010');
        try {
          const path: string = context.cacheDir + '/x_clean.dot';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
