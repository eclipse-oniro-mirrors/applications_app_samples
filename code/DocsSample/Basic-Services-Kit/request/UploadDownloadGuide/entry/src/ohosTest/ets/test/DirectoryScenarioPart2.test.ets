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

const ROOT_NAME: string = 'UploadDownloadScenarioRoot';
let context: common.UIAbilityContext;
let rootDir: string;

function createFile(path: string): void {
  let file = fileIo.openSync(path, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
  fileIo.closeSync(file);
}

export default function downloadDirectoryScenarioTestPart2(): void {
  describe('UploadDownloadDirectoryScenarioTestPart2', () => {
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_0100
     * @tc.name      testUploadDownloadDirectoryScenario0001
     * @tc.desc      Verify download directory Download initialization 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/list47';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/data.csv');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(1);
          expect(Array.isArray(files)).assertTrue();
          expect(files.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_4800
     * @tc.name      testUploadDownloadDirectoryScenario0048
     * @tc.desc      Verify directory listing scenario 48.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/list48';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Pictures/archive.zip');
          createFile(dir + '/Pictures/config.json');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Pictures');
          expect(files.length).assertEqual(2);
          expect(Array.isArray(files)).assertTrue();
          expect(files.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_4900
     * @tc.name      testUploadDownloadDirectoryScenario0049
     * @tc.desc      Verify directory listing scenario 49.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/list49';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Videos/config.json');
          createFile(dir + '/Videos/IMG_0001.jpg');
          createFile(dir + '/Videos/IMG_0002.jpeg');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Videos');
          expect(files.length).assertEqual(3);
          expect(Array.isArray(files)).assertTrue();
          expect(files.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_5000
     * @tc.name      testUploadDownloadDirectoryScenario0050
     * @tc.desc      Verify directory listing scenario 50.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/list50';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/IMG_0001.jpg');
          createFile(dir + '/Others/IMG_0002.jpeg');
          createFile(dir + '/Others/IMG_0003.png');
          createFile(dir + '/Others/VID_0001.mp4');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(4);
          expect(Array.isArray(files)).assertTrue();
          expect(files.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_5100
     * @tc.name      testUploadDownloadDirectoryScenario0051
     * @tc.desc      Verify directory listing scenario 51.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0051',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/list51';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Pictures/IMG_0002.jpeg');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Pictures');
          expect(files.length).assertEqual(1);
          expect(Array.isArray(files)).assertTrue();
          expect(files.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_5200
     * @tc.name      testUploadDownloadDirectoryScenario0052
     * @tc.desc      Verify directory listing scenario 52.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0052',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/list52';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Videos/IMG_0003.png');
          createFile(dir + '/Videos/VID_0001.mp4');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Videos');
          expect(files.length).assertEqual(2);
          expect(Array.isArray(files)).assertTrue();
          expect(files.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_5300
     * @tc.name      testUploadDownloadDirectoryScenario0053
     * @tc.desc      Verify directory listing scenario 53.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0053',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/list53';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/VID_0001.mp4');
          createFile(dir + '/Others/AUD_0001.mp3');
          createFile(dir + '/Others/report.pdf');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(3);
          expect(Array.isArray(files)).assertTrue();
          expect(files.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_5400
     * @tc.name      testUploadDownloadDirectoryScenario0054
     * @tc.desc      Verify directory listing scenario 54.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0054',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/list54';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Pictures/AUD_0001.mp3');
          createFile(dir + '/Pictures/report.pdf');
          createFile(dir + '/Pictures/notes.txt');
          createFile(dir + '/Pictures/data.csv');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Pictures');
          expect(files.length).assertEqual(4);
          expect(Array.isArray(files)).assertTrue();
          expect(files.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_5500
     * @tc.name      testUploadDownloadDirectoryScenario0055
     * @tc.desc      Verify directory listing scenario 55.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0055',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/list55';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Videos/report.pdf');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Videos');
          expect(files.length).assertEqual(1);
          expect(Array.isArray(files)).assertTrue();
          expect(files.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_5600
     * @tc.name      testUploadDownloadDirectoryScenario0056
     * @tc.desc      Verify directory listing scenario 56.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0056',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/list56';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/notes.txt');
          createFile(dir + '/Others/data.csv');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(2);
          expect(Array.isArray(files)).assertTrue();
          expect(files.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_5700
     * @tc.name      testUploadDownloadDirectoryScenario0057
     * @tc.desc      Verify directory listing scenario 57.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0057',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/list57';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Pictures/data.csv');
          createFile(dir + '/Pictures/archive.zip');
          createFile(dir + '/Pictures/config.json');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Pictures');
          expect(files.length).assertEqual(3);
          expect(Array.isArray(files)).assertTrue();
          expect(files.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_5800
     * @tc.name      testUploadDownloadDirectoryScenario0058
     * @tc.desc      Verify directory listing scenario 58.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0058',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/list58';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Videos/archive.zip');
          createFile(dir + '/Videos/config.json');
          createFile(dir + '/Videos/IMG_0001.jpg');
          createFile(dir + '/Videos/IMG_0002.jpeg');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Videos');
          expect(files.length).assertEqual(4);
          expect(Array.isArray(files)).assertTrue();
          expect(files.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_5900
     * @tc.name      testUploadDownloadDirectoryScenario0059
     * @tc.desc      Verify directory listing scenario 59.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0059',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/list59';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/config.json');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Others');
          expect(files.length).assertEqual(1);
          expect(Array.isArray(files)).assertTrue();
          expect(files.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_6000
     * @tc.name      testUploadDownloadDirectoryScenario0060
     * @tc.desc      Verify directory listing scenario 60.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0060',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/list60';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Pictures/IMG_0001.jpg');
          createFile(dir + '/Pictures/IMG_0002.jpeg');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Pictures');
          expect(files.length).assertEqual(2);
          expect(Array.isArray(files)).assertTrue();
          expect(files.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_6100
     * @tc.name      testUploadDownloadDirectoryScenario0061
     * @tc.desc      Verify directory cleanup scenario 61.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0061',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear61';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Videos/IMG_0002.jpeg');
          await fileUtils.clearFolder(dir, 'Videos');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Videos');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(fileIo.accessSync(dir + '/Videos')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_6200
     * @tc.name      testUploadDownloadDirectoryScenario0062
     * @tc.desc      Verify directory cleanup scenario 62.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0062',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear62';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/IMG_0003.png');
          createFile(dir + '/Others/VID_0001.mp4');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_6300
     * @tc.name      testUploadDownloadDirectoryScenario0063
     * @tc.desc      Verify directory cleanup scenario 63.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0063',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear63';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Pictures/VID_0001.mp4');
          createFile(dir + '/Pictures/AUD_0001.mp3');
          createFile(dir + '/Pictures/report.pdf');
          await fileUtils.clearFolder(dir, 'Pictures');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Pictures');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(fileIo.accessSync(dir + '/Pictures')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_6400
     * @tc.name      testUploadDownloadDirectoryScenario0064
     * @tc.desc      Verify directory cleanup scenario 64.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0064',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear64';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Videos/AUD_0001.mp3');
          await fileUtils.clearFolder(dir, 'Videos');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Videos');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(fileIo.accessSync(dir + '/Videos')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_6500
     * @tc.name      testUploadDownloadDirectoryScenario0065
     * @tc.desc      Verify directory cleanup scenario 65.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0065',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear65';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/report.pdf');
          createFile(dir + '/Others/notes.txt');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_6600
     * @tc.name      testUploadDownloadDirectoryScenario0066
     * @tc.desc      Verify directory cleanup scenario 66.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0066',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear66';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Pictures/notes.txt');
          createFile(dir + '/Pictures/data.csv');
          createFile(dir + '/Pictures/archive.zip');
          await fileUtils.clearFolder(dir, 'Pictures');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Pictures');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(fileIo.accessSync(dir + '/Pictures')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_6700
     * @tc.name      testUploadDownloadDirectoryScenario0067
     * @tc.desc      Verify directory cleanup scenario 67.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0067',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear67';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Videos/data.csv');
          await fileUtils.clearFolder(dir, 'Videos');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Videos');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(fileIo.accessSync(dir + '/Videos')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_6800
     * @tc.name      testUploadDownloadDirectoryScenario0068
     * @tc.desc      Verify directory cleanup scenario 68.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0068',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear68';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/archive.zip');
          createFile(dir + '/Others/config.json');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_6900
     * @tc.name      testUploadDownloadDirectoryScenario0069
     * @tc.desc      Verify directory cleanup scenario 69.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0069',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear69';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Pictures/config.json');
          createFile(dir + '/Pictures/IMG_0001.jpg');
          createFile(dir + '/Pictures/IMG_0002.jpeg');
          await fileUtils.clearFolder(dir, 'Pictures');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Pictures');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(fileIo.accessSync(dir + '/Pictures')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_7000
     * @tc.name      testUploadDownloadDirectoryScenario0070
     * @tc.desc      Verify directory cleanup scenario 70.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0070',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear70';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Videos/IMG_0001.jpg');
          await fileUtils.clearFolder(dir, 'Videos');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Videos');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(fileIo.accessSync(dir + '/Videos')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_7100
     * @tc.name      testUploadDownloadDirectoryScenario0071
     * @tc.desc      Verify directory cleanup scenario 71.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0071',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear71';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/IMG_0002.jpeg');
          createFile(dir + '/Others/IMG_0003.png');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_7200
     * @tc.name      testUploadDownloadDirectoryScenario0072
     * @tc.desc      Verify directory cleanup scenario 72.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0072',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear72';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Pictures/IMG_0003.png');
          createFile(dir + '/Pictures/VID_0001.mp4');
          createFile(dir + '/Pictures/AUD_0001.mp3');
          await fileUtils.clearFolder(dir, 'Pictures');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Pictures');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(fileIo.accessSync(dir + '/Pictures')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_7300
     * @tc.name      testUploadDownloadDirectoryScenario0073
     * @tc.desc      Verify directory cleanup scenario 73.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0073',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear73';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Videos/VID_0001.mp4');
          await fileUtils.clearFolder(dir, 'Videos');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Videos');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(fileIo.accessSync(dir + '/Videos')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_7400
     * @tc.name      testUploadDownloadDirectoryScenario0074
     * @tc.desc      Verify directory cleanup scenario 74.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0074',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear74';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/AUD_0001.mp3');
          createFile(dir + '/Others/report.pdf');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_7500
     * @tc.name      testUploadDownloadDirectoryScenario0075
     * @tc.desc      Verify directory cleanup scenario 75.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0075',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear75';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Pictures/report.pdf');
          createFile(dir + '/Pictures/notes.txt');
          createFile(dir + '/Pictures/data.csv');
          await fileUtils.clearFolder(dir, 'Pictures');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Pictures');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(fileIo.accessSync(dir + '/Pictures')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_7600
     * @tc.name      testUploadDownloadDirectoryScenario0076
     * @tc.desc      Verify directory cleanup scenario 76.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0076',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear76';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Videos/notes.txt');
          await fileUtils.clearFolder(dir, 'Videos');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Videos');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(fileIo.accessSync(dir + '/Videos')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_7700
     * @tc.name      testUploadDownloadDirectoryScenario0077
     * @tc.desc      Verify directory cleanup scenario 77.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0077',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear77';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/data.csv');
          createFile(dir + '/Others/archive.zip');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_7800
     * @tc.name      testUploadDownloadDirectoryScenario0078
     * @tc.desc      Verify directory cleanup scenario 78.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0078',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear78';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Pictures/archive.zip');
          createFile(dir + '/Pictures/config.json');
          createFile(dir + '/Pictures/IMG_0001.jpg');
          await fileUtils.clearFolder(dir, 'Pictures');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Pictures');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(fileIo.accessSync(dir + '/Pictures')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_7900
     * @tc.name      testUploadDownloadDirectoryScenario0079
     * @tc.desc      Verify directory cleanup scenario 79.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0079',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear79';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Videos/config.json');
          await fileUtils.clearFolder(dir, 'Videos');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Videos');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(fileIo.accessSync(dir + '/Videos')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_8000
     * @tc.name      testUploadDownloadDirectoryScenario0080
     * @tc.desc      Verify directory cleanup scenario 80.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0080',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear80';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/IMG_0001.jpg');
          createFile(dir + '/Others/IMG_0002.jpeg');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_8100
     * @tc.name      testUploadDownloadDirectoryScenario0081
     * @tc.desc      Verify directory cleanup scenario 81.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0081',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear81';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Pictures/IMG_0002.jpeg');
          createFile(dir + '/Pictures/IMG_0003.png');
          createFile(dir + '/Pictures/VID_0001.mp4');
          await fileUtils.clearFolder(dir, 'Pictures');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Pictures');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(fileIo.accessSync(dir + '/Pictures')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_8200
     * @tc.name      testUploadDownloadDirectoryScenario0082
     * @tc.desc      Verify directory cleanup scenario 82.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0082',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear82';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Videos/IMG_0003.png');
          await fileUtils.clearFolder(dir, 'Videos');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Videos');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(fileIo.accessSync(dir + '/Videos')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_8300
     * @tc.name      testUploadDownloadDirectoryScenario0083
     * @tc.desc      Verify directory cleanup scenario 83.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0083',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear83';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/VID_0001.mp4');
          createFile(dir + '/Others/AUD_0001.mp3');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_8400
     * @tc.name      testUploadDownloadDirectoryScenario0084
     * @tc.desc      Verify directory cleanup scenario 84.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0084',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear84';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Pictures/AUD_0001.mp3');
          createFile(dir + '/Pictures/report.pdf');
          createFile(dir + '/Pictures/notes.txt');
          await fileUtils.clearFolder(dir, 'Pictures');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Pictures');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(fileIo.accessSync(dir + '/Pictures')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_8500
     * @tc.name      testUploadDownloadDirectoryScenario0085
     * @tc.desc      Verify directory cleanup scenario 85.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0085',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear85';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Videos/report.pdf');
          await fileUtils.clearFolder(dir, 'Videos');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Videos');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(fileIo.accessSync(dir + '/Videos')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_8600
     * @tc.name      testUploadDownloadDirectoryScenario0086
     * @tc.desc      Verify directory cleanup scenario 86.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0086',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear86';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/notes.txt');
          createFile(dir + '/Others/data.csv');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_8700
     * @tc.name      testUploadDownloadDirectoryScenario0087
     * @tc.desc      Verify directory cleanup scenario 87.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0087',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear87';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Pictures/data.csv');
          createFile(dir + '/Pictures/archive.zip');
          createFile(dir + '/Pictures/config.json');
          await fileUtils.clearFolder(dir, 'Pictures');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Pictures');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(fileIo.accessSync(dir + '/Pictures')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_8800
     * @tc.name      testUploadDownloadDirectoryScenario0088
     * @tc.desc      Verify directory cleanup scenario 88.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0088',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear88';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Videos/archive.zip');
          await fileUtils.clearFolder(dir, 'Videos');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Videos');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(fileIo.accessSync(dir + '/Videos')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_8900
     * @tc.name      testUploadDownloadDirectoryScenario0089
     * @tc.desc      Verify directory cleanup scenario 89.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0089',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear89';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/config.json');
          createFile(dir + '/Others/IMG_0001.jpg');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_9000
     * @tc.name      testUploadDownloadDirectoryScenario0090
     * @tc.desc      Verify directory cleanup scenario 90.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0090',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/clear90';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Pictures/IMG_0001.jpg');
          createFile(dir + '/Pictures/IMG_0002.jpeg');
          createFile(dir + '/Pictures/IMG_0003.png');
          await fileUtils.clearFolder(dir, 'Pictures');
          const files: Array<string> = await fileUtils.listFiles(dir, 'Pictures');
          expect(files.length).assertEqual(0);
          expect(Array.isArray(files)).assertTrue();
          expect(fileIo.accessSync(dir + '/Pictures')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
