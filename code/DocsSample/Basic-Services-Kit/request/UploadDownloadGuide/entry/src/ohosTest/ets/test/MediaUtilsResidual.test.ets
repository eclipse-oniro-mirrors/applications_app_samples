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
import { MediaUtils } from 'uploadanddownload';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TEST_DOMAIN: number = 0xF811;
const TEST_TAG: string = 'SampleTest';

let context: common.UIAbilityContext;
let rootDir: string;
const mediaUtils: MediaUtils = new MediaUtils();

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

export default function mediaUtilsResidualTest(): void {
  describe('UploadDownloadMediaUtilsResidualTest', () => {
    beforeAll(async () => {
      context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().createModuleContext('entry') as common.UIAbilityContext;
      rootDir = context.filesDir + '/UploadDownloadMediaUtilsResidual';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_MEDIAUTILS_RESIDUAL_0100
     * @tc.name      testUploadDownloadMediaUtilsResidual0001
     * @tc.desc      Verify a file is copied into the cache directory.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadMediaUtilsResidual0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadMediaUtilsResidual0001');
        try {
          const src: string = rootDir + '/source.txt';
          const cache: string = rootDir + '/cache1';
          ensureDir(cache);
          writeFile(src, 'hello');
          const dest: string = await mediaUtils.copyFileToCache(cache, src);
          expect(dest).assertEqual(cache + '/source.txt');
          expect(fileIo.statSync(dest).size).assertEqual(5);
          expect(fileIo.accessSync(dest)).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_MEDIAUTILS_RESIDUAL_0200
     * @tc.name      testUploadDownloadMediaUtilsResidual0002
     * @tc.desc      Verify the copied file keeps its source name.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadMediaUtilsResidual0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadMediaUtilsResidual0002');
        try {
          const src: string = rootDir + '/named.bin';
          const cache: string = rootDir + '/cache2';
          ensureDir(cache);
          writeFile(src, '1234');
          const dest: string = await mediaUtils.copyFileToCache(cache, src);
          expect(dest.endsWith('/named.bin')).assertTrue();
          expect(fileIo.statSync(dest).size).assertEqual(4);
          expect(fileIo.accessSync(dest)).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_MEDIAUTILS_RESIDUAL_0300
     * @tc.name      testUploadDownloadMediaUtilsResidual0003
     * @tc.desc      Verify an existing destination is returned without overwrite.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadMediaUtilsResidual0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadMediaUtilsResidual0003');
        try {
          const src: string = rootDir + '/overwrite.txt';
          const cache: string = rootDir + '/cache3';
          ensureDir(cache);
          writeFile(src, 'new');
          writeFile(cache + '/overwrite.txt', 'keep');
          const dest: string = await mediaUtils.copyFileToCache(cache, src);
          expect(dest).assertEqual(cache + '/overwrite.txt');
          expect(fileIo.statSync(dest).size).assertEqual(4);
          expect(fileIo.accessSync(dest)).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_MEDIAUTILS_RESIDUAL_0400
     * @tc.name      testUploadDownloadMediaUtilsResidual0004
     * @tc.desc      Verify an existing destination is returned when the source is missing.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadMediaUtilsResidual0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadMediaUtilsResidual0004');
        try {
          const cache: string = rootDir + '/cache4';
          ensureDir(cache);
          writeFile(cache + '/cached.txt', 'keep');
          const dest: string = await mediaUtils.copyFileToCache(cache, rootDir + '/missing/cached.txt');
          expect(dest).assertEqual(cache + '/cached.txt');
          expect(fileIo.statSync(dest).size).assertEqual(4);
          expect(fileIo.accessSync(dest)).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_MEDIAUTILS_RESIDUAL_0500
     * @tc.name      testUploadDownloadMediaUtilsResidual0005
     * @tc.desc      Verify a missing source is rejected when no destination exists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadMediaUtilsResidual0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadMediaUtilsResidual0005');
        try {
          const cache: string = rootDir + '/cache5';
          ensureDir(cache);
          let threw: boolean = false;
          try {
            await mediaUtils.copyFileToCache(cache, rootDir + '/missing.txt');
          } catch (err) {
            threw = true;
          }
          expect(threw).assertTrue();
          expect(fileIo.accessSync(cache + '/missing.txt')).assertFalse();
          expect(true).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_MEDIAUTILS_RESIDUAL_0600
     * @tc.name      testUploadDownloadMediaUtilsResidual0006
     * @tc.desc      Verify a missing cache directory is tolerated.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadMediaUtilsResidual0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadMediaUtilsResidual0006');
        try {
          const src: string = rootDir + '/no-cache.txt';
          writeFile(src, 'x');
          const cache: string = rootDir + '/no-cache';
          const dest: string = await mediaUtils.copyFileToCache(cache, src);
          expect(dest).assertEqual(cache + '/no-cache.txt');
          expect(fileIo.accessSync(dest)).assertFalse();
          expect(true).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_MEDIAUTILS_RESIDUAL_0700
     * @tc.name      testUploadDownloadMediaUtilsResidual0007
     * @tc.desc      Verify an empty file copies with zero size.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadMediaUtilsResidual0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadMediaUtilsResidual0007');
        try {
          const src: string = rootDir + '/empty.txt';
          const cache: string = rootDir + '/cache6';
          ensureDir(cache);
          writeFile(src, '');
          const dest: string = await mediaUtils.copyFileToCache(cache, src);
          expect(fileIo.statSync(dest).size).assertEqual(0);
          expect(fileIo.accessSync(dest)).assertTrue();
          expect(dest.endsWith('/empty.txt')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_MEDIAUTILS_RESIDUAL_0800
     * @tc.name      testUploadDownloadMediaUtilsResidual0008
     * @tc.desc      Verify a large file copies with matching size.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadMediaUtilsResidual0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadMediaUtilsResidual0008');
        try {
          const src: string = rootDir + '/large.txt';
          const cache: string = rootDir + '/cache7';
          ensureDir(cache);
          writeFile(src, 'x'.repeat(65536));
          const dest: string = await mediaUtils.copyFileToCache(cache, src);
          expect(fileIo.statSync(dest).size).assertEqual(65536);
          expect(fileIo.accessSync(dest)).assertTrue();
          expect(dest.endsWith('/large.txt')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_MEDIAUTILS_RESIDUAL_0900
     * @tc.name      testUploadDownloadMediaUtilsResidual0009
     * @tc.desc      Verify a Unicode source name is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadMediaUtilsResidual0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadMediaUtilsResidual0009');
        try {
          const src: string = rootDir + '/测试文件.txt';
          const cache: string = rootDir + '/cache8';
          ensureDir(cache);
          writeFile(src, 'unicode');
          const dest: string = await mediaUtils.copyFileToCache(cache, src);
          expect(dest.endsWith('/测试文件.txt')).assertTrue();
          expect(fileIo.statSync(dest).size).assertEqual(7);
          expect(fileIo.accessSync(dest)).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_MEDIAUTILS_RESIDUAL_1000
     * @tc.name      testUploadDownloadMediaUtilsResidual0010
     * @tc.desc      Verify a source name with spaces is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadMediaUtilsResidual0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadMediaUtilsResidual0010');
        try {
          const src: string = rootDir + '/file with space.txt';
          const cache: string = rootDir + '/cache9';
          ensureDir(cache);
          writeFile(src, 'space');
          const dest: string = await mediaUtils.copyFileToCache(cache, src);
          expect(dest.endsWith('/file with space.txt')).assertTrue();
          expect(fileIo.accessSync(dest)).assertTrue();
          expect(fileIo.statSync(dest).size).assertEqual(5);
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_MEDIAUTILS_RESIDUAL_1100
     * @tc.name      testUploadDownloadMediaUtilsResidual0011
     * @tc.desc      Verify a multi-dot source name is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadMediaUtilsResidual0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadMediaUtilsResidual0011');
        try {
          const src: string = rootDir + '/archive.tar.gz';
          const cache: string = rootDir + '/cache10';
          ensureDir(cache);
          writeFile(src, 'archive');
          const dest: string = await mediaUtils.copyFileToCache(cache, src);
          expect(dest.endsWith('/archive.tar.gz')).assertTrue();
          expect(fileIo.accessSync(dest)).assertTrue();
          expect(fileIo.statSync(dest).size).assertEqual(7);
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_MEDIAUTILS_RESIDUAL_1200
     * @tc.name      testUploadDownloadMediaUtilsResidual0012
     * @tc.desc      Verify a hidden source name is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadMediaUtilsResidual0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadMediaUtilsResidual0012');
        try {
          const src: string = rootDir + '/.hidden.jpg';
          const cache: string = rootDir + '/cache11';
          ensureDir(cache);
          writeFile(src, 'hidden');
          const dest: string = await mediaUtils.copyFileToCache(cache, src);
          expect(dest.endsWith('/.hidden.jpg')).assertTrue();
          expect(fileIo.accessSync(dest)).assertTrue();
          expect(fileIo.statSync(dest).size).assertEqual(6);
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_MEDIAUTILS_RESIDUAL_1300
     * @tc.name      testUploadDownloadMediaUtilsResidual0013
     * @tc.desc      Verify a source without extension is preserved.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadMediaUtilsResidual0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadMediaUtilsResidual0013');
        try {
          const src: string = rootDir + '/noext';
          const cache: string = rootDir + '/cache12';
          ensureDir(cache);
          writeFile(src, 'none');
          const dest: string = await mediaUtils.copyFileToCache(cache, src);
          expect(dest.endsWith('/noext')).assertTrue();
          expect(fileIo.accessSync(dest)).assertTrue();
          expect(fileIo.statSync(dest).size).assertEqual(4);
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_MEDIAUTILS_RESIDUAL_1400
     * @tc.name      testUploadDownloadMediaUtilsResidual0014
     * @tc.desc      Verify a nested source path copies only the file name.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadMediaUtilsResidual0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadMediaUtilsResidual0014');
        try {
          const nested: string = rootDir + '/nested/deep';
          ensureDir(nested);
          const src: string = nested + '/deep.txt';
          writeFile(src, 'deep');
          const cache: string = rootDir + '/cache13';
          ensureDir(cache);
          const dest: string = await mediaUtils.copyFileToCache(cache, src);
          expect(dest).assertEqual(cache + '/deep.txt');
          expect(fileIo.accessSync(dest)).assertTrue();
          expect(fileIo.statSync(dest).size).assertEqual(4);
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_MEDIAUTILS_RESIDUAL_1500
     * @tc.name      testUploadDownloadMediaUtilsResidual0015
     * @tc.desc      Verify the last path segment is used as the destination name.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadMediaUtilsResidual0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadMediaUtilsResidual0015');
        try {
          const src: string = rootDir + '/a/b/c/last.log';
          ensureDir(rootDir + '/a/b/c');
          writeFile(src, 'last');
          const cache: string = rootDir + '/cache14';
          ensureDir(cache);
          const dest: string = await mediaUtils.copyFileToCache(cache, src);
          expect(dest).assertEqual(cache + '/last.log');
          expect(fileIo.accessSync(dest)).assertTrue();
          expect(fileIo.statSync(dest).size).assertEqual(4);
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
