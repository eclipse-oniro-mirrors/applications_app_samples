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

const ROOT_NAME: string = 'UploadDownloadExtra4Root';
let context: common.UIAbilityContext;
let rootDir: string;

function createFile(path: string): void {
  let file = fileIo.openSync(path, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
  fileIo.closeSync(file);
}

export default function fileUtilsExtra4Test(): void {
  describe('UploadDownloadFileUtilsExtra4Test', () => {
    beforeAll(async () => {
      context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().createModuleContext('entry') as common.UIAbilityContext;
      rootDir = context.filesDir + '/' + ROOT_NAME;
      if (!fileIo.accessSync(rootDir)) {
        fileIo.mkdirSync(rootDir, true);
      }
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA4_0100
     * @tc.name      testUploadDownloadFileUtilsExtra40001
     * @tc.desc      Verify directory lifecycle case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra40001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/case1';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/one.txt');
          createFile(dir + '/Videos/two.mp4');
          const others: Array<string> = await fileUtils.listFiles(dir, 'Others');
          const videos: Array<string> = await fileUtils.listFiles(dir, 'Videos');
          await fileUtils.clearFolder(dir, 'Others');
          expect(others.length).assertEqual(1);
          expect(videos.length).assertEqual(1);
          expect(fileIo.accessSync(dir + '/Others')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA4_0200
     * @tc.name      testUploadDownloadFileUtilsExtra40002
     * @tc.desc      Verify directory lifecycle case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra40002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/case2';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/one.txt');
          createFile(dir + '/Videos/two.mp4');
          const others: Array<string> = await fileUtils.listFiles(dir, 'Others');
          const videos: Array<string> = await fileUtils.listFiles(dir, 'Videos');
          await fileUtils.clearFolder(dir, 'Others');
          expect(others.length).assertEqual(1);
          expect(videos.length).assertEqual(1);
          expect(fileIo.accessSync(dir + '/Others')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA4_0300
     * @tc.name      testUploadDownloadFileUtilsExtra40003
     * @tc.desc      Verify directory lifecycle case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra40003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/case3';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/one.txt');
          createFile(dir + '/Videos/two.mp4');
          const others: Array<string> = await fileUtils.listFiles(dir, 'Others');
          const videos: Array<string> = await fileUtils.listFiles(dir, 'Videos');
          await fileUtils.clearFolder(dir, 'Others');
          expect(others.length).assertEqual(1);
          expect(videos.length).assertEqual(1);
          expect(fileIo.accessSync(dir + '/Others')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA4_0400
     * @tc.name      testUploadDownloadFileUtilsExtra40004
     * @tc.desc      Verify directory lifecycle case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra40004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/case4';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/one.txt');
          createFile(dir + '/Videos/two.mp4');
          const others: Array<string> = await fileUtils.listFiles(dir, 'Others');
          const videos: Array<string> = await fileUtils.listFiles(dir, 'Videos');
          await fileUtils.clearFolder(dir, 'Others');
          expect(others.length).assertEqual(1);
          expect(videos.length).assertEqual(1);
          expect(fileIo.accessSync(dir + '/Others')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA4_0500
     * @tc.name      testUploadDownloadFileUtilsExtra40005
     * @tc.desc      Verify directory lifecycle case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra40005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/case5';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/one.txt');
          createFile(dir + '/Videos/two.mp4');
          const others: Array<string> = await fileUtils.listFiles(dir, 'Others');
          const videos: Array<string> = await fileUtils.listFiles(dir, 'Videos');
          await fileUtils.clearFolder(dir, 'Others');
          expect(others.length).assertEqual(1);
          expect(videos.length).assertEqual(1);
          expect(fileIo.accessSync(dir + '/Others')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA4_0600
     * @tc.name      testUploadDownloadFileUtilsExtra40006
     * @tc.desc      Verify directory lifecycle case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra40006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/case6';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/one.txt');
          createFile(dir + '/Videos/two.mp4');
          const others: Array<string> = await fileUtils.listFiles(dir, 'Others');
          const videos: Array<string> = await fileUtils.listFiles(dir, 'Videos');
          await fileUtils.clearFolder(dir, 'Others');
          expect(others.length).assertEqual(1);
          expect(videos.length).assertEqual(1);
          expect(fileIo.accessSync(dir + '/Others')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA4_0700
     * @tc.name      testUploadDownloadFileUtilsExtra40007
     * @tc.desc      Verify directory lifecycle case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra40007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/case7';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/one.txt');
          createFile(dir + '/Videos/two.mp4');
          const others: Array<string> = await fileUtils.listFiles(dir, 'Others');
          const videos: Array<string> = await fileUtils.listFiles(dir, 'Videos');
          await fileUtils.clearFolder(dir, 'Others');
          expect(others.length).assertEqual(1);
          expect(videos.length).assertEqual(1);
          expect(fileIo.accessSync(dir + '/Others')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA4_0800
     * @tc.name      testUploadDownloadFileUtilsExtra40008
     * @tc.desc      Verify directory lifecycle case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra40008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/case8';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/one.txt');
          createFile(dir + '/Videos/two.mp4');
          const others: Array<string> = await fileUtils.listFiles(dir, 'Others');
          const videos: Array<string> = await fileUtils.listFiles(dir, 'Videos');
          await fileUtils.clearFolder(dir, 'Others');
          expect(others.length).assertEqual(1);
          expect(videos.length).assertEqual(1);
          expect(fileIo.accessSync(dir + '/Others')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA4_0900
     * @tc.name      testUploadDownloadFileUtilsExtra40009
     * @tc.desc      Verify directory lifecycle case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra40009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/case9';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/one.txt');
          createFile(dir + '/Videos/two.mp4');
          const others: Array<string> = await fileUtils.listFiles(dir, 'Others');
          const videos: Array<string> = await fileUtils.listFiles(dir, 'Videos');
          await fileUtils.clearFolder(dir, 'Others');
          expect(others.length).assertEqual(1);
          expect(videos.length).assertEqual(1);
          expect(fileIo.accessSync(dir + '/Others')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA4_1000
     * @tc.name      testUploadDownloadFileUtilsExtra40010
     * @tc.desc      Verify directory lifecycle case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra40010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/case10';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/one.txt');
          createFile(dir + '/Videos/two.mp4');
          const others: Array<string> = await fileUtils.listFiles(dir, 'Others');
          const videos: Array<string> = await fileUtils.listFiles(dir, 'Videos');
          await fileUtils.clearFolder(dir, 'Others');
          expect(others.length).assertEqual(1);
          expect(videos.length).assertEqual(1);
          expect(fileIo.accessSync(dir + '/Others')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
