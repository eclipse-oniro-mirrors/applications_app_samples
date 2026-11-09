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

const ROOT_NAME: string = 'UploadDownloadMatrixRoot';
let context: common.UIAbilityContext;
let rootDir: string;

function createFile(path: string): void {
  let file = fileIo.openSync(path, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
  fileIo.closeSync(file);
}

export default function fileUtilsMatrixTest(): void {
  describe('UploadDownloadFileUtilsMatrixTest', () => {
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_0100
     * @tc.name      testUploadDownloadFileUtils0001
     * @tc.desc      Verify download directory initialization case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0001');
        try {
          const dir: string = rootDir + '/init1';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_0200
     * @tc.name      testUploadDownloadFileUtils0002
     * @tc.desc      Verify download directory initialization case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0002');
        try {
          const dir: string = rootDir + '/init2';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_0300
     * @tc.name      testUploadDownloadFileUtils0003
     * @tc.desc      Verify download directory initialization case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0003');
        try {
          const dir: string = rootDir + '/init3';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_0400
     * @tc.name      testUploadDownloadFileUtils0004
     * @tc.desc      Verify download directory initialization case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0004');
        try {
          const dir: string = rootDir + '/init4';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_0500
     * @tc.name      testUploadDownloadFileUtils0005
     * @tc.desc      Verify download directory initialization case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0005');
        try {
          const dir: string = rootDir + '/init5';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_0600
     * @tc.name      testUploadDownloadFileUtils0006
     * @tc.desc      Verify download directory initialization case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0006');
        try {
          const dir: string = rootDir + '/init6';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_0700
     * @tc.name      testUploadDownloadFileUtils0007
     * @tc.desc      Verify download directory initialization case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0007');
        try {
          const dir: string = rootDir + '/init7';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_0800
     * @tc.name      testUploadDownloadFileUtils0008
     * @tc.desc      Verify download directory initialization case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0008');
        try {
          const dir: string = rootDir + '/init8';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_0900
     * @tc.name      testUploadDownloadFileUtils0009
     * @tc.desc      Verify download directory initialization case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0009');
        try {
          const dir: string = rootDir + '/init9';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_1000
     * @tc.name      testUploadDownloadFileUtils0010
     * @tc.desc      Verify download directory initialization case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0010');
        try {
          const dir: string = rootDir + '/init10';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_1100
     * @tc.name      testUploadDownloadFileUtils0011
     * @tc.desc      Verify listFiles returns created files in Others.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0011');
        try {
          const dir: string = rootDir + '/list11';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/a.txt');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(1);
          expect(files).assertContain('a.txt');
          expect(Array.isArray(files)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_1200
     * @tc.name      testUploadDownloadFileUtils0012
     * @tc.desc      Verify clearFolder removes files from Pictures.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0012');
        try {
          const dir: string = rootDir + '/clear12';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Pictures/b.txt');          createFile(dir + '/Pictures/c.txt');
          await fileUtils.clearFolder(dir, 'Pictures');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Pictures');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(files.indexOf('b.txt') === -1).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_1300
     * @tc.name      testUploadDownloadFileUtils0013
     * @tc.desc      Verify listFiles returns created files in Videos.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0013');
        try {
          const dir: string = rootDir + '/list13';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Videos/c.txt');          createFile(dir + '/Videos/space name.txt');          createFile(dir + '/Videos/中文.txt');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Videos');
          expect(files.length).assertEqual(3);
          expect(files).assertContain('c.txt');
          expect(Array.isArray(files)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_1400
     * @tc.name      testUploadDownloadFileUtils0014
     * @tc.desc      Verify clearFolder removes files from Others.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0014');
        try {
          const dir: string = rootDir + '/clear14';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/space name.txt');          createFile(dir + '/Others/中文.txt');          createFile(dir + '/Others/a.b.c.txt');          createFile(dir + '/Others/image.jpg');
          await fileUtils.clearFolder(dir, 'Others');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(files.indexOf('space name.txt') === -1).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_1500
     * @tc.name      testUploadDownloadFileUtils0015
     * @tc.desc      Verify listFiles returns created files in Pictures.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0015');
        try {
          const dir: string = rootDir + '/list15';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Pictures/中文.txt');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Pictures');
          expect(files.length).assertEqual(1);
          expect(files).assertContain('中文.txt');
          expect(Array.isArray(files)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_1600
     * @tc.name      testUploadDownloadFileUtils0016
     * @tc.desc      Verify clearFolder removes files from Videos.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0016');
        try {
          const dir: string = rootDir + '/clear16';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Videos/a.b.c.txt');          createFile(dir + '/Videos/image.jpg');
          await fileUtils.clearFolder(dir, 'Videos');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Videos');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(files.indexOf('a.b.c.txt') === -1).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_1700
     * @tc.name      testUploadDownloadFileUtils0017
     * @tc.desc      Verify listFiles returns created files in Others.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0017');
        try {
          const dir: string = rootDir + '/list17';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/image.jpg');          createFile(dir + '/Others/audio.mp3');          createFile(dir + '/Others/video.mp4');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(3);
          expect(files).assertContain('image.jpg');
          expect(Array.isArray(files)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_1800
     * @tc.name      testUploadDownloadFileUtils0018
     * @tc.desc      Verify clearFolder removes files from Pictures.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0018');
        try {
          const dir: string = rootDir + '/clear18';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Pictures/audio.mp3');          createFile(dir + '/Pictures/video.mp4');          createFile(dir + '/Pictures/archive.zip');          createFile(dir + '/Pictures/a.txt');
          await fileUtils.clearFolder(dir, 'Pictures');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Pictures');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(files.indexOf('audio.mp3') === -1).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_1900
     * @tc.name      testUploadDownloadFileUtils0019
     * @tc.desc      Verify listFiles returns created files in Videos.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0019');
        try {
          const dir: string = rootDir + '/list19';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Videos/video.mp4');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Videos');
          expect(files.length).assertEqual(1);
          expect(files).assertContain('video.mp4');
          expect(Array.isArray(files)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_2000
     * @tc.name      testUploadDownloadFileUtils0020
     * @tc.desc      Verify clearFolder removes files from Others.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0020');
        try {
          const dir: string = rootDir + '/clear20';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/archive.zip');          createFile(dir + '/Others/a.txt');
          await fileUtils.clearFolder(dir, 'Others');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(files.indexOf('archive.zip') === -1).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_2100
     * @tc.name      testUploadDownloadFileUtils0021
     * @tc.desc      Verify listFiles returns created files in Pictures.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0021');
        try {
          const dir: string = rootDir + '/list21';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Pictures/a.txt');          createFile(dir + '/Pictures/b.txt');          createFile(dir + '/Pictures/c.txt');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Pictures');
          expect(files.length).assertEqual(3);
          expect(files).assertContain('a.txt');
          expect(Array.isArray(files)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_2200
     * @tc.name      testUploadDownloadFileUtils0022
     * @tc.desc      Verify clearFolder removes files from Videos.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0022');
        try {
          const dir: string = rootDir + '/clear22';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Videos/b.txt');          createFile(dir + '/Videos/c.txt');          createFile(dir + '/Videos/space name.txt');          createFile(dir + '/Videos/中文.txt');
          await fileUtils.clearFolder(dir, 'Videos');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Videos');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(files.indexOf('b.txt') === -1).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_2300
     * @tc.name      testUploadDownloadFileUtils0023
     * @tc.desc      Verify listFiles returns created files in Others.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0023');
        try {
          const dir: string = rootDir + '/list23';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/c.txt');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(1);
          expect(files).assertContain('c.txt');
          expect(Array.isArray(files)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_2400
     * @tc.name      testUploadDownloadFileUtils0024
     * @tc.desc      Verify clearFolder removes files from Pictures.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0024');
        try {
          const dir: string = rootDir + '/clear24';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Pictures/space name.txt');          createFile(dir + '/Pictures/中文.txt');
          await fileUtils.clearFolder(dir, 'Pictures');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Pictures');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(files.indexOf('space name.txt') === -1).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_2500
     * @tc.name      testUploadDownloadFileUtils0025
     * @tc.desc      Verify listFiles returns created files in Videos.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0025');
        try {
          const dir: string = rootDir + '/list25';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Videos/中文.txt');          createFile(dir + '/Videos/a.b.c.txt');          createFile(dir + '/Videos/image.jpg');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Videos');
          expect(files.length).assertEqual(3);
          expect(files).assertContain('中文.txt');
          expect(Array.isArray(files)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_2600
     * @tc.name      testUploadDownloadFileUtils0026
     * @tc.desc      Verify clearFolder removes files from Others.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0026');
        try {
          const dir: string = rootDir + '/clear26';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/a.b.c.txt');          createFile(dir + '/Others/image.jpg');          createFile(dir + '/Others/audio.mp3');          createFile(dir + '/Others/video.mp4');
          await fileUtils.clearFolder(dir, 'Others');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(files.indexOf('a.b.c.txt') === -1).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_2700
     * @tc.name      testUploadDownloadFileUtils0027
     * @tc.desc      Verify listFiles returns created files in Pictures.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0027');
        try {
          const dir: string = rootDir + '/list27';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Pictures/image.jpg');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Pictures');
          expect(files.length).assertEqual(1);
          expect(files).assertContain('image.jpg');
          expect(Array.isArray(files)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_2800
     * @tc.name      testUploadDownloadFileUtils0028
     * @tc.desc      Verify clearFolder removes files from Videos.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0028');
        try {
          const dir: string = rootDir + '/clear28';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Videos/audio.mp3');          createFile(dir + '/Videos/video.mp4');
          await fileUtils.clearFolder(dir, 'Videos');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Videos');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(files.indexOf('audio.mp3') === -1).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_2900
     * @tc.name      testUploadDownloadFileUtils0029
     * @tc.desc      Verify listFiles returns created files in Others.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0029');
        try {
          const dir: string = rootDir + '/list29';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/video.mp4');          createFile(dir + '/Others/archive.zip');          createFile(dir + '/Others/a.txt');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(3);
          expect(files).assertContain('video.mp4');
          expect(Array.isArray(files)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_3000
     * @tc.name      testUploadDownloadFileUtils0030
     * @tc.desc      Verify clearFolder removes files from Pictures.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0030');
        try {
          const dir: string = rootDir + '/clear30';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Pictures/archive.zip');          createFile(dir + '/Pictures/a.txt');          createFile(dir + '/Pictures/b.txt');          createFile(dir + '/Pictures/c.txt');
          await fileUtils.clearFolder(dir, 'Pictures');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Pictures');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(files.indexOf('archive.zip') === -1).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_3100
     * @tc.name      testUploadDownloadFileUtils0031
     * @tc.desc      Verify listFiles returns created files in Videos.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0031');
        try {
          const dir: string = rootDir + '/list31';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Videos/a.txt');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Videos');
          expect(files.length).assertEqual(1);
          expect(files).assertContain('a.txt');
          expect(Array.isArray(files)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_3200
     * @tc.name      testUploadDownloadFileUtils0032
     * @tc.desc      Verify clearFolder removes files from Others.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0032');
        try {
          const dir: string = rootDir + '/clear32';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/b.txt');          createFile(dir + '/Others/c.txt');
          await fileUtils.clearFolder(dir, 'Others');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(files.indexOf('b.txt') === -1).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_3300
     * @tc.name      testUploadDownloadFileUtils0033
     * @tc.desc      Verify listFiles returns created files in Pictures.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0033');
        try {
          const dir: string = rootDir + '/list33';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Pictures/c.txt');          createFile(dir + '/Pictures/space name.txt');          createFile(dir + '/Pictures/中文.txt');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Pictures');
          expect(files.length).assertEqual(3);
          expect(files).assertContain('c.txt');
          expect(Array.isArray(files)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_3400
     * @tc.name      testUploadDownloadFileUtils0034
     * @tc.desc      Verify clearFolder removes files from Videos.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0034');
        try {
          const dir: string = rootDir + '/clear34';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Videos/space name.txt');          createFile(dir + '/Videos/中文.txt');          createFile(dir + '/Videos/a.b.c.txt');          createFile(dir + '/Videos/image.jpg');
          await fileUtils.clearFolder(dir, 'Videos');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Videos');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(files.indexOf('space name.txt') === -1).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_3500
     * @tc.name      testUploadDownloadFileUtils0035
     * @tc.desc      Verify listFiles returns created files in Others.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0035');
        try {
          const dir: string = rootDir + '/list35';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/中文.txt');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(1);
          expect(files).assertContain('中文.txt');
          expect(Array.isArray(files)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_3600
     * @tc.name      testUploadDownloadFileUtils0036
     * @tc.desc      Verify clearFolder removes files from Pictures.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0036');
        try {
          const dir: string = rootDir + '/clear36';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Pictures/a.b.c.txt');          createFile(dir + '/Pictures/image.jpg');
          await fileUtils.clearFolder(dir, 'Pictures');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Pictures');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(files.indexOf('a.b.c.txt') === -1).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_3700
     * @tc.name      testUploadDownloadFileUtils0037
     * @tc.desc      Verify listFiles returns created files in Videos.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0037');
        try {
          const dir: string = rootDir + '/list37';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Videos/image.jpg');          createFile(dir + '/Videos/audio.mp3');          createFile(dir + '/Videos/video.mp4');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Videos');
          expect(files.length).assertEqual(3);
          expect(files).assertContain('image.jpg');
          expect(Array.isArray(files)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_3800
     * @tc.name      testUploadDownloadFileUtils0038
     * @tc.desc      Verify clearFolder removes files from Others.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0038');
        try {
          const dir: string = rootDir + '/clear38';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/audio.mp3');          createFile(dir + '/Others/video.mp4');          createFile(dir + '/Others/archive.zip');          createFile(dir + '/Others/a.txt');
          await fileUtils.clearFolder(dir, 'Others');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(files.indexOf('audio.mp3') === -1).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_3900
     * @tc.name      testUploadDownloadFileUtils0039
     * @tc.desc      Verify listFiles returns created files in Pictures.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0039');
        try {
          const dir: string = rootDir + '/list39';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Pictures/video.mp4');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Pictures');
          expect(files.length).assertEqual(1);
          expect(files).assertContain('video.mp4');
          expect(Array.isArray(files)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_4000
     * @tc.name      testUploadDownloadFileUtils0040
     * @tc.desc      Verify clearFolder removes files from Videos.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtils0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtils0040');
        try {
          const dir: string = rootDir + '/clear40';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Videos/archive.zip');          createFile(dir + '/Videos/a.txt');
          await fileUtils.clearFolder(dir, 'Videos');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Videos');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(files.indexOf('archive.zip') === -1).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
