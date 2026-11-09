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
import { fileUtils } from 'uploadanddownload';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TEST_DOMAIN: number = 0xF811;
const TEST_TAG: string = 'SampleTest';

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

export default function fileUtilsErrorResidualTest(): void {
  describe('UploadDownloadFileUtilsErrorResidualTest', () => {
    beforeAll(async () => {
      context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().createModuleContext('entry') as common.UIAbilityContext;
      rootDir = context.filesDir + '/UploadDownloadFileUtilsErrorResidual';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_ERROR_0100
     * @tc.name      testUploadDownloadFileUtilsErrorResidual0001
     * @tc.desc      Verify initDownloadDir tolerates a root path that is a file.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsErrorResidual0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsErrorResidual0001');
        try {
          const rootFile: string = rootDir + '/root-file';
          writeFile(rootFile, 'x');
          await fileUtils.initDownloadDir(rootFile);
          expect(fileIo.accessSync(rootFile)).assertTrue();
          expect(fileIo.statSync(rootFile).isDirectory()).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_ERROR_0200
     * @tc.name      testUploadDownloadFileUtilsErrorResidual0002
     * @tc.desc      Verify initDownloadDir tolerates album names occupied by files.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsErrorResidual0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsErrorResidual0002');
        try {
          const dir: string = rootDir + '/album-files';
          ensureDir(dir);
          writeFile(dir + '/Pictures', 'x');
          writeFile(dir + '/Videos', 'x');
          writeFile(dir + '/Others', 'x');
          await fileUtils.initDownloadDir(dir);
          expect(fileIo.statSync(dir + '/Pictures').isDirectory()).assertFalse();
          expect(fileIo.statSync(dir + '/Videos').isDirectory()).assertFalse();
          expect(fileIo.statSync(dir + '/Others').isDirectory()).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_ERROR_0300
     * @tc.name      testUploadDownloadFileUtilsErrorResidual0003
     * @tc.desc      Verify listFolders still returns the album names for a file path.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsErrorResidual0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsErrorResidual0003');
        try {
          const rootFile: string = rootDir + '/folders-file';
          writeFile(rootFile, 'x');
          const folders: string[] = await fileUtils.listFolders(rootFile);
          expect(folders.length).assertEqual(3);
          expect(folders[0]).assertEqual('Pictures');
          expect(folders[2]).assertEqual('Others');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_ERROR_0400
     * @tc.name      testUploadDownloadFileUtilsErrorResidual0004
     * @tc.desc      Verify listFiles returns empty when the target is a file.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsErrorResidual0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsErrorResidual0004');
        try {
          const dir: string = rootDir + '/list-file';
          ensureDir(dir);
          writeFile(dir + '/Pictures', 'x');
          const files: string[] = await fileUtils.listFiles(dir, 'Pictures');
          expect(files.length).assertEqual(0);
          expect(files instanceof Array).assertTrue();
          expect(files.includes('Pictures')).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_ERROR_0500
     * @tc.name      testUploadDownloadFileUtilsErrorResidual0005
     * @tc.desc      Verify clearFolder tolerates a folder path that is a file.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsErrorResidual0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsErrorResidual0005');
        try {
          const dir: string = rootDir + '/clear-file';
          ensureDir(dir);
          writeFile(dir + '/Pictures', 'x');
          await fileUtils.clearFolder(dir, 'Pictures');
          expect(fileIo.accessSync(dir + '/Pictures')).assertTrue();
          expect(fileIo.statSync(dir + '/Pictures').isDirectory()).assertFalse();
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_ERROR_0600
     * @tc.name      testUploadDownloadFileUtilsErrorResidual0006
     * @tc.desc      Verify clearFolder keeps a nested directory it cannot unlink.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsErrorResidual0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsErrorResidual0006');
        try {
          const dir: string = rootDir + '/clear-nested';
          ensureDir(dir + '/Others/sub');
          writeFile(dir + '/Others/a.txt', 'a');
          await fileUtils.clearFolder(dir, 'Others');
          expect(fileIo.accessSync(dir + '/Others/sub')).assertTrue();
          expect(fileIo.accessSync(dir + '/Others')).assertTrue();
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_ERROR_0700
     * @tc.name      testUploadDownloadFileUtilsErrorResidual0007
     * @tc.desc      Verify listFiles includes dot files.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsErrorResidual0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsErrorResidual0007');
        try {
          const dir: string = rootDir + '/dotfiles';
          ensureDir(dir + '/Others');
          writeFile(dir + '/Others/.hidden', 'x');
          writeFile(dir + '/Others/visible.txt', 'x');
          const files: string[] = await fileUtils.listFiles(dir, 'Others');
          expect(files.includes('.hidden')).assertTrue();
          expect(files.includes('visible.txt')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_ERROR_0800
     * @tc.name      testUploadDownloadFileUtilsErrorResidual0008
     * @tc.desc      Verify listFiles handles a long file name.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsErrorResidual0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsErrorResidual0008');
        try {
          const dir: string = rootDir + '/long-name';
          ensureDir(dir + '/Others');
          const name: string = 'a'.repeat(80) + '.txt';
          writeFile(dir + '/Others/' + name, 'x');
          const files: string[] = await fileUtils.listFiles(dir, 'Others');
          expect(files.includes(name)).assertTrue();
          expect(files.length).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_ERROR_0900
     * @tc.name      testUploadDownloadFileUtilsErrorResidual0009
     * @tc.desc      Verify clearFolder removes a long file name.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsErrorResidual0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsErrorResidual0009');
        try {
          const dir: string = rootDir + '/clear-long';
          ensureDir(dir + '/Others');
          const name: string = 'a'.repeat(80) + '.txt';
          writeFile(dir + '/Others/' + name, 'x');
          await fileUtils.clearFolder(dir, 'Others');
          expect((await fileUtils.listFiles(dir, 'Others')).length).assertEqual(0);
          expect(fileIo.accessSync(dir + '/Others/' + name)).assertFalse();
          expect(fileIo.accessSync(dir + '/Others')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_ERROR_1000
     * @tc.name      testUploadDownloadFileUtilsErrorResidual0010
     * @tc.desc      Verify clearFolder keeps the album after removing multiple files.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsErrorResidual0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsErrorResidual0010');
        try {
          const dir: string = rootDir + '/clear-multiple';
          ensureDir(dir + '/Videos');
          writeFile(dir + '/Videos/a.txt', 'a');
          writeFile(dir + '/Videos/b.txt', 'b');
          writeFile(dir + '/Videos/c.txt', 'c');
          await fileUtils.clearFolder(dir, 'Videos');
          expect((await fileUtils.listFiles(dir, 'Videos')).length).assertEqual(0);
          expect(fileIo.accessSync(dir + '/Videos')).assertTrue();
          expect(fileIo.statSync(dir + '/Videos').isDirectory()).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
