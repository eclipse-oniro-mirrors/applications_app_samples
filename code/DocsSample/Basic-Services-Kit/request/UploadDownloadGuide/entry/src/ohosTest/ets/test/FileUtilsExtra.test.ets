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

const ROOT_NAME: string = 'UploadDownloadExtraRoot';
let context: common.UIAbilityContext;
let rootDir: string;

function createFile(path: string): void {
  let file = fileIo.openSync(path, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
  fileIo.closeSync(file);
}

export default function fileUtilsExtraTest(): void {
  describe('UploadDownloadFileUtilsExtraTest', () => {
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA_0100
     * @tc.name      testUploadDownloadFileUtilsExtra0001
     * @tc.desc      Verify idempotent directory init 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/idem1';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA_0200
     * @tc.name      testUploadDownloadFileUtilsExtra0002
     * @tc.desc      Verify idempotent directory init 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/idem2';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA_0300
     * @tc.name      testUploadDownloadFileUtilsExtra0003
     * @tc.desc      Verify idempotent directory init 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/idem3';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA_0400
     * @tc.name      testUploadDownloadFileUtilsExtra0004
     * @tc.desc      Verify idempotent directory init 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/idem4';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA_0500
     * @tc.name      testUploadDownloadFileUtilsExtra0005
     * @tc.desc      Verify idempotent directory init 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/idem5';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA_0600
     * @tc.name      testUploadDownloadFileUtilsExtra0006
     * @tc.desc      Verify listFiles empty folder 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/empty6';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(files.indexOf('x.txt') === -1).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA_0700
     * @tc.name      testUploadDownloadFileUtilsExtra0007
     * @tc.desc      Verify listFiles empty folder 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/empty7';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(files.indexOf('x.txt') === -1).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA_0800
     * @tc.name      testUploadDownloadFileUtilsExtra0008
     * @tc.desc      Verify listFiles empty folder 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/empty8';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(files.indexOf('x.txt') === -1).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA_0900
     * @tc.name      testUploadDownloadFileUtilsExtra0009
     * @tc.desc      Verify listFiles empty folder 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/empty9';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(files.indexOf('x.txt') === -1).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA_1000
     * @tc.name      testUploadDownloadFileUtilsExtra0010
     * @tc.desc      Verify listFiles empty folder 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/empty10';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(files.indexOf('x.txt') === -1).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA_1100
     * @tc.name      testUploadDownloadFileUtilsExtra0011
     * @tc.desc      Verify clearFolder missing/empty case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear11';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          await fileUtils.clearFolder(dir, 'Others');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(fileIo.accessSync(dir + '/Others')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA_1200
     * @tc.name      testUploadDownloadFileUtilsExtra0012
     * @tc.desc      Verify clearFolder missing/empty case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear12';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          await fileUtils.clearFolder(dir, 'Others');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(fileIo.accessSync(dir + '/Others')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA_1300
     * @tc.name      testUploadDownloadFileUtilsExtra0013
     * @tc.desc      Verify clearFolder missing/empty case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear13';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          await fileUtils.clearFolder(dir, 'Others');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(fileIo.accessSync(dir + '/Others')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA_1400
     * @tc.name      testUploadDownloadFileUtilsExtra0014
     * @tc.desc      Verify clearFolder missing/empty case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear14';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          await fileUtils.clearFolder(dir, 'Others');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(fileIo.accessSync(dir + '/Others')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA_1500
     * @tc.name      testUploadDownloadFileUtilsExtra0015
     * @tc.desc      Verify clearFolder missing/empty case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear15';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          await fileUtils.clearFolder(dir, 'Others');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(fileIo.accessSync(dir + '/Others')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA_1600
     * @tc.name      testUploadDownloadFileUtilsExtra0016
     * @tc.desc      Verify listFiles multiple files case 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/multi16';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/f0.txt');
          createFile(dir + '/Others/f1.txt');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(2);
          expect(files).assertContain('f0.txt');
          expect(Array.isArray(files)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA_1700
     * @tc.name      testUploadDownloadFileUtilsExtra0017
     * @tc.desc      Verify listFiles multiple files case 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/multi17';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/f0.txt');
          createFile(dir + '/Others/f1.txt');
          createFile(dir + '/Others/f2.txt');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(3);
          expect(files).assertContain('f0.txt');
          expect(Array.isArray(files)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA_1800
     * @tc.name      testUploadDownloadFileUtilsExtra0018
     * @tc.desc      Verify listFiles multiple files case 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/multi18';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/f0.txt');
          createFile(dir + '/Others/f1.txt');
          createFile(dir + '/Others/f2.txt');
          createFile(dir + '/Others/f3.txt');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(4);
          expect(files).assertContain('f0.txt');
          expect(Array.isArray(files)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA_1900
     * @tc.name      testUploadDownloadFileUtilsExtra0019
     * @tc.desc      Verify listFiles multiple files case 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/multi19';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/f0.txt');
          createFile(dir + '/Others/f1.txt');
          createFile(dir + '/Others/f2.txt');
          createFile(dir + '/Others/f3.txt');
          createFile(dir + '/Others/f4.txt');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(5);
          expect(files).assertContain('f0.txt');
          expect(Array.isArray(files)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA_2000
     * @tc.name      testUploadDownloadFileUtilsExtra0020
     * @tc.desc      Verify listFiles multiple files case 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/multi20';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/f0.txt');
          createFile(dir + '/Others/f1.txt');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(2);
          expect(files).assertContain('f0.txt');
          expect(Array.isArray(files)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA_2100
     * @tc.name      testUploadDownloadFileUtilsExtra0021
     * @tc.desc      Verify listFiles multiple files case 21.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/multi21';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/f0.txt');
          createFile(dir + '/Others/f1.txt');
          createFile(dir + '/Others/f2.txt');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(3);
          expect(files).assertContain('f0.txt');
          expect(Array.isArray(files)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA_2200
     * @tc.name      testUploadDownloadFileUtilsExtra0022
     * @tc.desc      Verify listFiles multiple files case 22.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/multi22';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/f0.txt');
          createFile(dir + '/Others/f1.txt');
          createFile(dir + '/Others/f2.txt');
          createFile(dir + '/Others/f3.txt');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(4);
          expect(files).assertContain('f0.txt');
          expect(Array.isArray(files)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA_2300
     * @tc.name      testUploadDownloadFileUtilsExtra0023
     * @tc.desc      Verify listFiles multiple files case 23.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/multi23';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/f0.txt');
          createFile(dir + '/Others/f1.txt');
          createFile(dir + '/Others/f2.txt');
          createFile(dir + '/Others/f3.txt');
          createFile(dir + '/Others/f4.txt');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(5);
          expect(files).assertContain('f0.txt');
          expect(Array.isArray(files)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA_2400
     * @tc.name      testUploadDownloadFileUtilsExtra0024
     * @tc.desc      Verify listFiles multiple files case 24.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/multi24';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/f0.txt');
          createFile(dir + '/Others/f1.txt');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(2);
          expect(files).assertContain('f0.txt');
          expect(Array.isArray(files)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA_2500
     * @tc.name      testUploadDownloadFileUtilsExtra0025
     * @tc.desc      Verify listFiles multiple files case 25.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/multi25';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/f0.txt');
          createFile(dir + '/Others/f1.txt');
          createFile(dir + '/Others/f2.txt');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(3);
          expect(files).assertContain('f0.txt');
          expect(Array.isArray(files)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
