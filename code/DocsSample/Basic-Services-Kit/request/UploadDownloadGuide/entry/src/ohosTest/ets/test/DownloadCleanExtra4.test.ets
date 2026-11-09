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

let context: common.UIAbilityContext;

function createFile(path: string): void {
  let file = fileIo.openSync(path, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
  fileIo.closeSync(file);
}

export default function downloadCleanExtra4Test(): void {
  describe('UploadDownloadDownloadCleanExtra4Test', () => {
    beforeAll(async () => {
      context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().createModuleContext('entry') as common.UIAbilityContext;
    });
    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_EXTRA4_0100
     * @tc.name      testUploadDownloadDownloadCleanExtra40001
     * @tc.desc      Verify final clearExistFile case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDownloadCleanExtra40001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/z_clean_a.txt';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_EXTRA4_0200
     * @tc.name      testUploadDownloadDownloadCleanExtra40002
     * @tc.desc      Verify final clearExistFile case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDownloadCleanExtra40002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/z_clean_b.bin';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_EXTRA4_0300
     * @tc.name      testUploadDownloadDownloadCleanExtra40003
     * @tc.desc      Verify final clearExistFile case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDownloadCleanExtra40003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/z_clean_c.jpg';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_EXTRA4_0400
     * @tc.name      testUploadDownloadDownloadCleanExtra40004
     * @tc.desc      Verify final clearExistFile case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDownloadCleanExtra40004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/z_clean_d.mp3';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_EXTRA4_0500
     * @tc.name      testUploadDownloadDownloadCleanExtra40005
     * @tc.desc      Verify final clearExistFile case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDownloadCleanExtra40005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/z_clean_e.mp4';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_EXTRA4_0600
     * @tc.name      testUploadDownloadDownloadCleanExtra40006
     * @tc.desc      Verify final clearExistFile case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDownloadCleanExtra40006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/z_clean space.txt';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_EXTRA4_0700
     * @tc.name      testUploadDownloadDownloadCleanExtra40007
     * @tc.desc      Verify final clearExistFile case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDownloadCleanExtra40007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/z_clean_中文.txt';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_EXTRA4_0800
     * @tc.name      testUploadDownloadDownloadCleanExtra40008
     * @tc.desc      Verify final clearExistFile case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDownloadCleanExtra40008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/z_clean.tar.gz';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_EXTRA4_0900
     * @tc.name      testUploadDownloadDownloadCleanExtra40009
     * @tc.desc      Verify final clearExistFile case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDownloadCleanExtra40009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/z_clean.dot';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_EXTRA4_1000
     * @tc.name      testUploadDownloadDownloadCleanExtra40010
     * @tc.desc      Verify final clearExistFile case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDownloadCleanExtra40010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/z_clean_1';
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
