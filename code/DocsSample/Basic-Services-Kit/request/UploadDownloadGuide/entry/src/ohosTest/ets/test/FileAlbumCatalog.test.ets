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

const ROOT_NAME: string = 'UploadDownloadAlbumCatalogRoot';
let context: common.UIAbilityContext;
let rootDir: string;

function createFile(path: string): void {
  let file = fileIo.openSync(path, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
  fileIo.closeSync(file);
}

function createDir(path: string): void {
  if (!fileIo.accessSync(path)) {
    fileIo.mkdirSync(path, true);
  }
}

export default function fileAlbumCatalogTest(): void {
  describe('UploadDownloadFileAlbumCatalogTest', () => {
    beforeAll(async () => {
      context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext()
        .createModuleContext('entry') as common.UIAbilityContext;
      rootDir = context.filesDir + '/' + ROOT_NAME;
      createDir(rootDir);
    });

    afterAll(async () => {
      try {
        if (fileIo.accessSync(rootDir)) {
          fileIo.rmdirSync(rootDir);
        }
      } catch (err) {
      }
    });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_ALBUMCATALOG_0100
     * @tc.name      testUploadDownloadAlbumCatalog0001
     * @tc.desc      Verify listing download folders creates the three albums in their display order.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadAlbumCatalog0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadAlbumCatalog0001');
        try {
          const dir: string = rootDir + '/standard';
          createDir(dir);
          const folders: Array<string> = await fileUtils.listFolders(dir);
          expect(folders.length).assertEqual(3);
          expect(folders[0]).assertEqual('Pictures');
          expect(folders[1]).assertEqual('Videos');
          expect(folders[2]).assertEqual('Others');
          expect(fileIo.accessSync(dir + '/Pictures')).assertTrue();
          expect(fileIo.accessSync(dir + '/Videos')).assertTrue();
          expect(fileIo.accessSync(dir + '/Others')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_ALBUMCATALOG_0200
     * @tc.name      testUploadDownloadAlbumCatalog0002
     * @tc.desc      Verify listing download folders keeps files that already exist inside an album.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadAlbumCatalog0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadAlbumCatalog0002');
        try {
          const dir: string = rootDir + '/preserve';
          createDir(dir + '/Pictures');
          createFile(dir + '/Pictures/keep.txt');
          const folders: Array<string> = await fileUtils.listFolders(dir);
          const files: Array<string> = await fileUtils.listFiles(dir, 'Pictures');
          expect(folders.length).assertEqual(3);
          expect(fileIo.accessSync(dir + '/Pictures/keep.txt')).assertTrue();
          expect(files.length).assertEqual(1);
          expect(files[0]).assertEqual('keep.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_ALBUMCATALOG_0300
     * @tc.name      testUploadDownloadAlbumCatalog0003
     * @tc.desc      Verify listing download folders repeatedly returns the same albums without duplicates.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadAlbumCatalog0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadAlbumCatalog0003');
        try {
          const dir: string = rootDir + '/repeat';
          createDir(dir);
          const first: Array<string> = await fileUtils.listFolders(dir);
          const second: Array<string> = await fileUtils.listFolders(dir);
          expect(first.join('|')).assertEqual('Pictures|Videos|Others');
          expect(second.join('|')).assertEqual(first.join('|'));
          expect(second.length).assertEqual(3);
          expect(fileIo.accessSync(dir + '/Others')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_ALBUMCATALOG_0400
     * @tc.name      testUploadDownloadAlbumCatalog0004
     * @tc.desc      Verify custom folders under the download root are not mixed into the album catalog.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadAlbumCatalog0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadAlbumCatalog0004');
        try {
          const dir: string = rootDir + '/custom';
          createDir(dir + '/MyFolder');
          createFile(dir + '/MyFolder/note.txt');
          const folders: Array<string> = await fileUtils.listFolders(dir);
          expect(folders.length).assertEqual(3);
          expect(folders.indexOf('MyFolder')).assertEqual(-1);
          expect(fileIo.accessSync(dir + '/MyFolder/note.txt')).assertTrue();
          expect(fileIo.accessSync(dir + '/Pictures')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_ALBUMCATALOG_0500
     * @tc.name      testUploadDownloadAlbumCatalog0005
     * @tc.desc      Verify albums are created under a download path that contains spaces and Chinese text.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadAlbumCatalog0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadAlbumCatalog0005');
        try {
          const dir: string = rootDir + '/相册 目录';
          createDir(dir);
          const folders: Array<string> = await fileUtils.listFolders(dir);
          expect(folders.join('|')).assertEqual('Pictures|Videos|Others');
          expect(folders.length).assertEqual(3);
          expect(fileIo.accessSync(dir + '/Pictures')).assertTrue();
          expect(fileIo.accessSync(dir + '/Videos')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_ALBUMCATALOG_0600
     * @tc.name      testUploadDownloadAlbumCatalog0006
     * @tc.desc      Verify listing a folder that does not exist returns an empty result instead of failing.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadAlbumCatalog0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadAlbumCatalog0006');
        try {
          const dir: string = rootDir + '/missing-list';
          createDir(dir);
          const files: Array<string> = await fileUtils.listFiles(dir, 'NoSuchFolder');
          expect(files.length).assertEqual(0);
          expect(files.join('')).assertEqual('');
          expect(files.indexOf('anything.txt')).assertEqual(-1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_ALBUMCATALOG_0700
     * @tc.name      testUploadDownloadAlbumCatalog0007
     * @tc.desc      Verify clearing a folder that does not exist is harmless and keeps the download root.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadAlbumCatalog0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadAlbumCatalog0007');
        try {
          const dir: string = rootDir + '/missing-clear';
          createDir(dir);
          await fileUtils.initDownloadDir(dir);
          await fileUtils.clearFolder(dir, 'NoSuchFolder');
          const files: Array<string> = await fileUtils.listFiles(dir, 'NoSuchFolder');
          expect(files.length).assertEqual(0);
          expect(fileIo.accessSync(dir)).assertTrue();
          expect(fileIo.accessSync(dir + '/Pictures')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_ALBUMCATALOG_0800
     * @tc.name      testUploadDownloadAlbumCatalog0008
     * @tc.desc      Verify clearing one album removes only its files and leaves other albums untouched.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadAlbumCatalog0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadAlbumCatalog0008');
        try {
          const dir: string = rootDir + '/isolated-clear';
          createDir(dir);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Pictures/keep.txt');
          createFile(dir + '/Others/a.txt');
          createFile(dir + '/Others/.hidden');
          await fileUtils.clearFolder(dir, 'Others');
          const others: Array<string> = await fileUtils.listFiles(dir, 'Others');
          const pictures: Array<string> = await fileUtils.listFiles(dir, 'Pictures');
          expect(others.length).assertEqual(0);
          expect(pictures.length).assertEqual(1);
          expect(pictures[0]).assertEqual('keep.txt');
          expect(fileIo.accessSync(dir + '/Others')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_ALBUMCATALOG_0900
     * @tc.name      testUploadDownloadAlbumCatalog0009
     * @tc.desc      Verify file names with spaces and Chinese text are listed without modification.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadAlbumCatalog0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadAlbumCatalog0009');
        try {
          const dir: string = rootDir + '/unicode-names';
          createDir(dir);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/测试 文件.txt');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(1);
          expect(files[0]).assertEqual('测试 文件.txt');
          expect(files.indexOf('测试 文件.txt')).assertEqual(0);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_ALBUMCATALOG_1000
     * @tc.name      testUploadDownloadAlbumCatalog0010
     * @tc.desc      Verify listing folders does not remove unrelated files stored at the download root.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadAlbumCatalog0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadAlbumCatalog0010');
        try {
          const dir: string = rootDir + '/root-files';
          createDir(dir);
          createFile(dir + '/root_note.txt');
          const folders: Array<string> = await fileUtils.listFolders(dir);
          expect(folders.length).assertEqual(3);
          expect(folders.join('|')).assertEqual('Pictures|Videos|Others');
          expect(fileIo.accessSync(dir + '/root_note.txt')).assertTrue();
          expect(fileIo.accessSync(dir + '/Others')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
  });
}
