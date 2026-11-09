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

const ROOT_NAME: string = 'UploadDownloadExtra2Root';
let context: common.UIAbilityContext;
let rootDir: string;

function createFile(path: string): void {
  let file = fileIo.openSync(path, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
  fileIo.closeSync(file);
}

export default function fileUtilsExtra2Test(): void {
  describe('UploadDownloadFileUtilsExtra2Test', () => {
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA2_0100
     * @tc.name      testUploadDownloadFileUtilsExtra20001
     * @tc.desc      Verify nested directory init 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra20001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsExtra20001');
        try {
          const dir: string = rootDir + '/nested1/child';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA2_0200
     * @tc.name      testUploadDownloadFileUtilsExtra20002
     * @tc.desc      Verify nested directory init 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra20002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsExtra20002');
        try {
          const dir: string = rootDir + '/nested2/child';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA2_0300
     * @tc.name      testUploadDownloadFileUtilsExtra20003
     * @tc.desc      Verify nested directory init 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra20003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsExtra20003');
        try {
          const dir: string = rootDir + '/nested3/child';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA2_0400
     * @tc.name      testUploadDownloadFileUtilsExtra20004
     * @tc.desc      Verify nested directory init 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra20004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsExtra20004');
        try {
          const dir: string = rootDir + '/nested4/child';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA2_0500
     * @tc.name      testUploadDownloadFileUtilsExtra20005
     * @tc.desc      Verify nested directory init 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra20005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsExtra20005');
        try {
          const dir: string = rootDir + '/nested5/child';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA2_0600
     * @tc.name      testUploadDownloadFileUtilsExtra20006
     * @tc.desc      Verify nested directory init 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra20006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsExtra20006');
        try {
          const dir: string = rootDir + '/nested6/child';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA2_0700
     * @tc.name      testUploadDownloadFileUtilsExtra20007
     * @tc.desc      Verify nested directory init 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra20007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsExtra20007');
        try {
          const dir: string = rootDir + '/nested7/child';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA2_0800
     * @tc.name      testUploadDownloadFileUtilsExtra20008
     * @tc.desc      Verify clear multiple files case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra20008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsExtra20008');
        try {
          const dir: string = rootDir + '/multi8';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/a.txt');
          createFile(dir + '/Others/b.txt');
          createFile(dir + '/Others/c.txt');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA2_0900
     * @tc.name      testUploadDownloadFileUtilsExtra20009
     * @tc.desc      Verify clear multiple files case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra20009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsExtra20009');
        try {
          const dir: string = rootDir + '/multi9';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/a.txt');
          createFile(dir + '/Others/b.txt');
          createFile(dir + '/Others/c.txt');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA2_1000
     * @tc.name      testUploadDownloadFileUtilsExtra20010
     * @tc.desc      Verify clear multiple files case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra20010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsExtra20010');
        try {
          const dir: string = rootDir + '/multi10';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/a.txt');
          createFile(dir + '/Others/b.txt');
          createFile(dir + '/Others/c.txt');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA2_1100
     * @tc.name      testUploadDownloadFileUtilsExtra20011
     * @tc.desc      Verify clear multiple files case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra20011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsExtra20011');
        try {
          const dir: string = rootDir + '/multi11';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/a.txt');
          createFile(dir + '/Others/b.txt');
          createFile(dir + '/Others/c.txt');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA2_1200
     * @tc.name      testUploadDownloadFileUtilsExtra20012
     * @tc.desc      Verify clear multiple files case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra20012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsExtra20012');
        try {
          const dir: string = rootDir + '/multi12';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/a.txt');
          createFile(dir + '/Others/b.txt');
          createFile(dir + '/Others/c.txt');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA2_1300
     * @tc.name      testUploadDownloadFileUtilsExtra20013
     * @tc.desc      Verify clear multiple files case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra20013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsExtra20013');
        try {
          const dir: string = rootDir + '/multi13';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/a.txt');
          createFile(dir + '/Others/b.txt');
          createFile(dir + '/Others/c.txt');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA2_1400
     * @tc.name      testUploadDownloadFileUtilsExtra20014
     * @tc.desc      Verify clear multiple files case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra20014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsExtra20014');
        try {
          const dir: string = rootDir + '/multi14';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/a.txt');
          createFile(dir + '/Others/b.txt');
          createFile(dir + '/Others/c.txt');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA2_1500
     * @tc.name      testUploadDownloadFileUtilsExtra20015
     * @tc.desc      Verify list multiple files case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra20015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsExtra20015');
        try {
          const dir: string = rootDir + '/list15';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA2_1600
     * @tc.name      testUploadDownloadFileUtilsExtra20016
     * @tc.desc      Verify list multiple files case 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra20016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsExtra20016');
        try {
          const dir: string = rootDir + '/list16';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA2_1700
     * @tc.name      testUploadDownloadFileUtilsExtra20017
     * @tc.desc      Verify list multiple files case 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra20017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsExtra20017');
        try {
          const dir: string = rootDir + '/list17';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA2_1800
     * @tc.name      testUploadDownloadFileUtilsExtra20018
     * @tc.desc      Verify list multiple files case 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra20018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsExtra20018');
        try {
          const dir: string = rootDir + '/list18';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA2_1900
     * @tc.name      testUploadDownloadFileUtilsExtra20019
     * @tc.desc      Verify list multiple files case 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra20019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsExtra20019');
        try {
          const dir: string = rootDir + '/list19';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEUTILS_EXTRA2_2000
     * @tc.name      testUploadDownloadFileUtilsExtra20020
     * @tc.desc      Verify list multiple files case 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileUtilsExtra20020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileUtilsExtra20020');
        try {
          const dir: string = rootDir + '/list20';
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

  });
}
