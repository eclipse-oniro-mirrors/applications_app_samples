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

export default function fileUtilsResidualTest(): void {
  describe('UploadDownloadFileUtilsResidualTest', () => {
    beforeAll(async () => {
      context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().createModuleContext('entry') as common.UIAbilityContext;
      rootDir = context.filesDir + '/UploadDownloadFileUtilsResidual';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_RESIDUAL_0100
     * @tc.name      testUploadDownloadFileUtilsResidual0001
     * @tc.desc      Verify listFolders returns the three standard albums and creates them.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsResidual0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsResidual0001');
        try {
          const dir: string = rootDir + '/folders1';
          ensureDir(dir);
          const folders: string[] = await fileUtils.listFolders(dir);
          expect(folders.length).assertEqual(3);
          expect(folders[0]).assertEqual('Pictures');
          expect(fileIo.accessSync(dir + '/Others')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_RESIDUAL_0200
     * @tc.name      testUploadDownloadFileUtilsResidual0002
     * @tc.desc      Verify listFolders is idempotent for an initialized directory.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsResidual0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsResidual0002');
        try {
          const dir: string = rootDir + '/folders2';
          ensureDir(dir);
          await fileUtils.listFolders(dir);
          const second: string[] = await fileUtils.listFolders(dir);
          expect(second[1]).assertEqual('Videos');
          expect(fileIo.accessSync(dir + '/Videos')).assertTrue();
          expect(second.length).assertEqual(3);
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_RESIDUAL_0300
     * @tc.name      testUploadDownloadFileUtilsResidual0003
     * @tc.desc      Verify initDownloadDir accepts a trailing slash path.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsResidual0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsResidual0003');
        try {
          const dir: string = rootDir + '/init1';
          ensureDir(dir);
          await fileUtils.initDownloadDir(dir + '/');
          expect(fileIo.accessSync(dir + '/Pictures')).assertTrue();
          expect(fileIo.accessSync(dir + '/Videos')).assertTrue();
          expect(fileIo.accessSync(dir + '/Others')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_RESIDUAL_0400
     * @tc.name      testUploadDownloadFileUtilsResidual0004
     * @tc.desc      Verify repeated initDownloadDir does not throw on existing albums.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsResidual0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsResidual0004');
        try {
          const dir: string = rootDir + '/init2';
          ensureDir(dir);
          await fileUtils.initDownloadDir(dir);
          await fileUtils.initDownloadDir(dir);
          expect(fileIo.accessSync(dir + '/Pictures')).assertTrue();
          expect(fileIo.accessSync(dir + '/Others')).assertTrue();
          expect(true).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_RESIDUAL_0500
     * @tc.name      testUploadDownloadFileUtilsResidual0005
     * @tc.desc      Verify listFiles returns an empty array for an empty folder.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsResidual0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsResidual0005');
        try {
          const dir: string = rootDir + '/list1';
          ensureDir(dir);
          const files: string[] = await fileUtils.listFiles(dir, 'Pictures');
          expect(files.length).assertEqual(0);
          expect(files instanceof Array).assertTrue();
          expect(files[0] === undefined).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_RESIDUAL_0600
     * @tc.name      testUploadDownloadFileUtilsResidual0006
     * @tc.desc      Verify listFiles returns all files in a folder.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsResidual0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsResidual0006');
        try {
          const dir: string = rootDir + '/list2';
          ensureDir(dir + '/Pictures');
          writeFile(dir + '/Pictures/a.txt', 'a');
          writeFile(dir + '/Pictures/b.txt', 'b');
          const files: string[] = await fileUtils.listFiles(dir, 'Pictures');
          expect(files.length).assertEqual(2);
          expect(files.includes('a.txt') && files.includes('b.txt')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_RESIDUAL_0700
     * @tc.name      testUploadDownloadFileUtilsResidual0007
     * @tc.desc      Verify listFiles returns an empty array for a missing folder.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsResidual0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsResidual0007');
        try {
          const dir: string = rootDir + '/list3';
          ensureDir(dir);
          const files: string[] = await fileUtils.listFiles(dir, 'Missing');
          expect(files.length).assertEqual(0);
          expect(files instanceof Array).assertTrue();
          expect(files.includes('x')).assertFalse();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_RESIDUAL_0800
     * @tc.name      testUploadDownloadFileUtilsResidual0008
     * @tc.desc      Verify clearFolder removes files and keeps the album folder.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsResidual0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsResidual0008');
        try {
          const dir: string = rootDir + '/clear1';
          ensureDir(dir + '/Pictures');
          writeFile(dir + '/Pictures/a.txt', 'a');
          writeFile(dir + '/Pictures/b.txt', 'b');
          await fileUtils.clearFolder(dir, 'Pictures');
          expect(fileIo.accessSync(dir + '/Pictures')).assertTrue();
          expect((await fileUtils.listFiles(dir, 'Pictures')).length).assertEqual(0);
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_RESIDUAL_0900
     * @tc.name      testUploadDownloadFileUtilsResidual0009
     * @tc.desc      Verify clearFolder on an empty folder does not throw.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsResidual0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsResidual0009');
        try {
          const dir: string = rootDir + '/clear2';
          ensureDir(dir + '/Videos');
          await fileUtils.clearFolder(dir, 'Videos');
          expect(fileIo.accessSync(dir + '/Videos')).assertTrue();
          expect((await fileUtils.listFiles(dir, 'Videos')).length).assertEqual(0);
          expect(true).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_RESIDUAL_1000
     * @tc.name      testUploadDownloadFileUtilsResidual0010
     * @tc.desc      Verify clearFolder on a missing folder is tolerated.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsResidual0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsResidual0010');
        try {
          const dir: string = rootDir + '/clear3';
          ensureDir(dir);
          await fileUtils.clearFolder(dir, 'Missing');
          expect(fileIo.accessSync(dir + '/Missing')).assertFalse();
          expect((await fileUtils.listFiles(dir, 'Missing')).length).assertEqual(0);
          expect(true).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_RESIDUAL_1100
     * @tc.name      testUploadDownloadFileUtilsResidual0011
     * @tc.desc      Verify listFiles preserves Unicode file names.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsResidual0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsResidual0011');
        try {
          const dir: string = rootDir + '/unicode1';
          ensureDir(dir + '/Others');
          writeFile(dir + '/Others/测试.txt', 'x');
          const files: string[] = await fileUtils.listFiles(dir, 'Others');
          expect(files.includes('测试.txt')).assertTrue();
          expect(files.length).assertEqual(1);
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_RESIDUAL_1200
     * @tc.name      testUploadDownloadFileUtilsResidual0012
     * @tc.desc      Verify clearFolder removes Unicode file names.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsResidual0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsResidual0012');
        try {
          const dir: string = rootDir + '/unicode2';
          ensureDir(dir + '/Others');
          writeFile(dir + '/Others/测试.txt', 'x');
          await fileUtils.clearFolder(dir, 'Others');
          expect((await fileUtils.listFiles(dir, 'Others')).length).assertEqual(0);
          expect(fileIo.accessSync(dir + '/Others/测试.txt')).assertFalse();
          expect(fileIo.accessSync(dir + '/Others')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_RESIDUAL_1300
     * @tc.name      testUploadDownloadFileUtilsResidual0013
     * @tc.desc      Verify listFiles includes a subdirectory entry.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsResidual0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsResidual0013');
        try {
          const dir: string = rootDir + '/nested1';
          ensureDir(dir + '/Others/sub');
          writeFile(dir + '/Others/sub/a.txt', 'a');
          const files: string[] = await fileUtils.listFiles(dir, 'Others');
          expect(files.includes('sub')).assertTrue();
          expect(files.length).assertEqual(1);
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_RESIDUAL_1400
     * @tc.name      testUploadDownloadFileUtilsResidual0014
     * @tc.desc      Verify initDownloadDir supports a nested long path.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsResidual0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsResidual0014');
        try {
          const dir: string = rootDir + '/nested/long/path/init';
          ensureDir(dir);
          await fileUtils.initDownloadDir(dir);
          expect(fileIo.accessSync(dir + '/Pictures')).assertTrue();
          expect(fileIo.accessSync(dir + '/Videos')).assertTrue();
          expect(fileIo.accessSync(dir + '/Others')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_RESIDUAL_1500
     * @tc.name      testUploadDownloadFileUtilsResidual0015
     * @tc.desc      Verify listFolders supports a directory name with spaces.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsResidual0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsResidual0015');
        try {
          const dir: string = rootDir + '/folder with space';
          ensureDir(dir);
          const folders: string[] = await fileUtils.listFolders(dir);
          expect(folders.length).assertEqual(3);
          expect(fileIo.accessSync(dir + '/Pictures')).assertTrue();
          expect(fileIo.accessSync(dir + '/Others')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
