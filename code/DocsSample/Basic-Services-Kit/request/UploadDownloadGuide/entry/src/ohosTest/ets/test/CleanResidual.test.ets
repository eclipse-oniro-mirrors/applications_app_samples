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

import { describe, expect, it, Level, Size, TestType, beforeAll, afterAll } from '@ohos/hypium';
import { fileIo } from '@kit.CoreFileKit';
import { common } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { requestDownload } from 'uploadanddownload';

let context: common.UIAbilityContext;
let rootDir: string;

function ensureDir(path: string): void {
  if (!fileIo.accessSync(path)) {
    fileIo.mkdirSync(path, true);
  }
}

function writeFile(path: string, content: string): void {
  const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE | fileIo.OpenMode.TRUNC);
  fileIo.writeSync(file.fd, content);
  fileIo.closeSync(file);
}

function removeTree(path: string): void {
  if (!fileIo.accessSync(path)) {
    return;
  }
  if (fileIo.statSync(path).isDirectory()) {
    const entries: string[] = fileIo.listFileSync(path);
    for (let i = 0; i < entries.length; i++) {
      removeTree(path + '/' + entries[i]);
    }
    fileIo.rmdirSync(path);
  } else {
    fileIo.unlinkSync(path);
  }
}

export default function cleanResidualTest(): void {
  describe('UploadDownloadCleanResidualTest', () => {
    beforeAll(async () => {
      context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().createModuleContext('entry') as common.UIAbilityContext;
      rootDir = context.filesDir + '/UploadDownloadCleanResidual';
      ensureDir(rootDir);
    });
    afterAll(async () => {
      try {
        removeTree(rootDir);
      } catch (err) {
        console.error('afterAll cleanup failed: ' + JSON.stringify(err));
      }
    });
    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_RESIDUAL_0100
     * @tc.name      testUploadDownloadCleanResidual0001
     * @tc.desc      Verify clearExistFile tolerates a missing file.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanResidual0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = rootDir + '/missing.txt';
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_RESIDUAL_0200
     * @tc.name      testUploadDownloadCleanResidual0002
     * @tc.desc      Verify clearExistFile removes an existing file.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanResidual0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = rootDir + '/existing.txt';
          writeFile(path, 'x');
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_RESIDUAL_0300
     * @tc.name      testUploadDownloadCleanResidual0003
     * @tc.desc      Verify clearExistFile removes a nested file.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanResidual0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/nested';
          ensureDir(dir);
          const path: string = dir + '/nested.txt';
          writeFile(path, 'x');
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          expect(fileIo.accessSync(dir)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_RESIDUAL_0400
     * @tc.name      testUploadDownloadCleanResidual0004
     * @tc.desc      Verify clearExistFile is idempotent on repeated calls.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanResidual0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = rootDir + '/repeat.txt';
          writeFile(path, 'x');
          requestDownload.clearExistFile(path);
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_RESIDUAL_0500
     * @tc.name      testUploadDownloadCleanResidual0005
     * @tc.desc      Verify clearExistFile supports Unicode names.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanResidual0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = rootDir + '/文件.txt';
          writeFile(path, 'x');
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_RESIDUAL_0600
     * @tc.name      testUploadDownloadCleanResidual0006
     * @tc.desc      Verify clearExistFile supports names with spaces.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanResidual0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = rootDir + '/file with space.txt';
          writeFile(path, 'x');
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_RESIDUAL_0700
     * @tc.name      testUploadDownloadCleanResidual0007
     * @tc.desc      Verify clearExistFile supports a long file name.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanResidual0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const name: string = 'a'.repeat(100) + '.txt';
          const path: string = rootDir + '/' + name;
          writeFile(path, 'x');
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_RESIDUAL_0800
     * @tc.name      testUploadDownloadCleanResidual0008
     * @tc.desc      Verify clearExistFile leaves a directory path untouched.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanResidual0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = rootDir + '/dirpath';
          ensureDir(path);
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          expect(fileIo.statSync(path).isDirectory()).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_RESIDUAL_0900
     * @tc.name      testUploadDownloadCleanResidual0009
     * @tc.desc      Verify clearExistFile tolerates an empty path.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanResidual0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          requestDownload.clearExistFile('');
          expect(true).assertTrue();
          expect(fileIo.accessSync(rootDir)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEAN_RESIDUAL_1000
     * @tc.name      testUploadDownloadCleanResidual0010
     * @tc.desc      Verify clearExistFile removes a file without extension.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanResidual0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = rootDir + '/noext';
          writeFile(path, 'x');
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
