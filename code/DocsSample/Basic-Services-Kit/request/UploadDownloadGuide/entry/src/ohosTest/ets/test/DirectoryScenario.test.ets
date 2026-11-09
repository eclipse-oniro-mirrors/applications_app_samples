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

export default function downloadDirectoryScenarioTest(): void {
  describe('UploadDownloadDirectoryScenarioTest', () => {
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
    it('testUploadDownloadDirectoryScenario0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/init1_Download';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_0200
     * @tc.name      testUploadDownloadDirectoryScenario0002
     * @tc.desc      Verify download directory Documents initialization 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/init2_Documents';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_0300
     * @tc.name      testUploadDownloadDirectoryScenario0003
     * @tc.desc      Verify download directory Pictures initialization 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/init3_Pictures';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_0400
     * @tc.name      testUploadDownloadDirectoryScenario0004
     * @tc.desc      Verify download directory Videos initialization 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/init4_Videos';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_0500
     * @tc.name      testUploadDownloadDirectoryScenario0005
     * @tc.desc      Verify download directory Others initialization 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/init5_Others';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_0600
     * @tc.name      testUploadDownloadDirectoryScenario0006
     * @tc.desc      Verify download directory Backup initialization 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/init6_Backup';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_0700
     * @tc.name      testUploadDownloadDirectoryScenario0007
     * @tc.desc      Verify download directory 2026 initialization 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/init7_2026';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_0800
     * @tc.name      testUploadDownloadDirectoryScenario0008
     * @tc.desc      Verify download directory inbox initialization 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/init8_inbox';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_0900
     * @tc.name      testUploadDownloadDirectoryScenario0009
     * @tc.desc      Verify download directory outbox initialization 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/init9_outbox';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_1000
     * @tc.name      testUploadDownloadDirectoryScenario0010
     * @tc.desc      Verify download directory shared initialization 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/init10_shared';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_1100
     * @tc.name      testUploadDownloadDirectoryScenario0011
     * @tc.desc      Verify download directory cache initialization 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/init11_cache';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_1200
     * @tc.name      testUploadDownloadDirectoryScenario0012
     * @tc.desc      Verify download directory media initialization 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/init12_media';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_1300
     * @tc.name      testUploadDownloadDirectoryScenario0013
     * @tc.desc      Verify download directory archive initialization 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/init13_archive';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_1400
     * @tc.name      testUploadDownloadDirectoryScenario0014
     * @tc.desc      Verify download directory temp initialization 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/init14_temp';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_1500
     * @tc.name      testUploadDownloadDirectoryScenario0015
     * @tc.desc      Verify download directory work initialization 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/init15_work';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_1600
     * @tc.name      testUploadDownloadDirectoryScenario0016
     * @tc.desc      Verify download directory Download initialization 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/init16_Download';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_1700
     * @tc.name      testUploadDownloadDirectoryScenario0017
     * @tc.desc      Verify download directory Documents initialization 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/init17_Documents';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_1800
     * @tc.name      testUploadDownloadDirectoryScenario0018
     * @tc.desc      Verify download directory Pictures initialization 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/init18_Pictures';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_1900
     * @tc.name      testUploadDownloadDirectoryScenario0019
     * @tc.desc      Verify download directory Videos initialization 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/init19_Videos';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_2000
     * @tc.name      testUploadDownloadDirectoryScenario0020
     * @tc.desc      Verify download directory Others initialization 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/init20_Others';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_2100
     * @tc.name      testUploadDownloadDirectoryScenario0021
     * @tc.desc      Verify download directory Backup initialization 21.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/init21_Backup';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_2200
     * @tc.name      testUploadDownloadDirectoryScenario0022
     * @tc.desc      Verify download directory 2026 initialization 22.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/init22_2026';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_2300
     * @tc.name      testUploadDownloadDirectoryScenario0023
     * @tc.desc      Verify download directory inbox initialization 23.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/init23_inbox';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_2400
     * @tc.name      testUploadDownloadDirectoryScenario0024
     * @tc.desc      Verify download directory outbox initialization 24.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/init24_outbox';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_2500
     * @tc.name      testUploadDownloadDirectoryScenario0025
     * @tc.desc      Verify download directory shared initialization 25.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/init25_shared';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_2600
     * @tc.name      testUploadDownloadDirectoryScenario0026
     * @tc.desc      Verify download directory cache initialization 26.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/init26_cache';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_2700
     * @tc.name      testUploadDownloadDirectoryScenario0027
     * @tc.desc      Verify download directory media initialization 27.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/init27_media';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_2800
     * @tc.name      testUploadDownloadDirectoryScenario0028
     * @tc.desc      Verify download directory archive initialization 28.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/init28_archive';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_2900
     * @tc.name      testUploadDownloadDirectoryScenario0029
     * @tc.desc      Verify download directory temp initialization 29.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/init29_temp';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_3000
     * @tc.name      testUploadDownloadDirectoryScenario0030
     * @tc.desc      Verify download directory work initialization 30.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/init30_work';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_3100
     * @tc.name      testUploadDownloadDirectoryScenario0031
     * @tc.desc      Verify directory listing scenario 31.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/list31';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Videos/IMG_0002.jpeg');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_3200
     * @tc.name      testUploadDownloadDirectoryScenario0032
     * @tc.desc      Verify directory listing scenario 32.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/list32';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/IMG_0003.png');
          createFile(dir + '/Others/VID_0001.mp4');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_3300
     * @tc.name      testUploadDownloadDirectoryScenario0033
     * @tc.desc      Verify directory listing scenario 33.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/list33';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Pictures/VID_0001.mp4');
          createFile(dir + '/Pictures/AUD_0001.mp3');
          createFile(dir + '/Pictures/report.pdf');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_3400
     * @tc.name      testUploadDownloadDirectoryScenario0034
     * @tc.desc      Verify directory listing scenario 34.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/list34';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Videos/AUD_0001.mp3');
          createFile(dir + '/Videos/report.pdf');
          createFile(dir + '/Videos/notes.txt');
          createFile(dir + '/Videos/data.csv');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_3500
     * @tc.name      testUploadDownloadDirectoryScenario0035
     * @tc.desc      Verify directory listing scenario 35.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/list35';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/report.pdf');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_3600
     * @tc.name      testUploadDownloadDirectoryScenario0036
     * @tc.desc      Verify directory listing scenario 36.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/list36';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Pictures/notes.txt');
          createFile(dir + '/Pictures/data.csv');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_3700
     * @tc.name      testUploadDownloadDirectoryScenario0037
     * @tc.desc      Verify directory listing scenario 37.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/list37';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Videos/data.csv');
          createFile(dir + '/Videos/archive.zip');
          createFile(dir + '/Videos/config.json');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_3800
     * @tc.name      testUploadDownloadDirectoryScenario0038
     * @tc.desc      Verify directory listing scenario 38.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/list38';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/archive.zip');
          createFile(dir + '/Others/config.json');
          createFile(dir + '/Others/IMG_0001.jpg');
          createFile(dir + '/Others/IMG_0002.jpeg');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_3900
     * @tc.name      testUploadDownloadDirectoryScenario0039
     * @tc.desc      Verify directory listing scenario 39.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/list39';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Pictures/config.json');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_4000
     * @tc.name      testUploadDownloadDirectoryScenario0040
     * @tc.desc      Verify directory listing scenario 40.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/list40';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Videos/IMG_0001.jpg');
          createFile(dir + '/Videos/IMG_0002.jpeg');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_4100
     * @tc.name      testUploadDownloadDirectoryScenario0041
     * @tc.desc      Verify directory listing scenario 41.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/list41';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/IMG_0002.jpeg');
          createFile(dir + '/Others/IMG_0003.png');
          createFile(dir + '/Others/VID_0001.mp4');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_4200
     * @tc.name      testUploadDownloadDirectoryScenario0042
     * @tc.desc      Verify directory listing scenario 42.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/list42';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Pictures/IMG_0003.png');
          createFile(dir + '/Pictures/VID_0001.mp4');
          createFile(dir + '/Pictures/AUD_0001.mp3');
          createFile(dir + '/Pictures/report.pdf');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_4300
     * @tc.name      testUploadDownloadDirectoryScenario0043
     * @tc.desc      Verify directory listing scenario 43.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/list43';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Videos/VID_0001.mp4');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_4400
     * @tc.name      testUploadDownloadDirectoryScenario0044
     * @tc.desc      Verify directory listing scenario 44.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/list44';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Others/AUD_0001.mp3');
          createFile(dir + '/Others/report.pdf');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_4500
     * @tc.name      testUploadDownloadDirectoryScenario0045
     * @tc.desc      Verify directory listing scenario 45.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/list45';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Pictures/report.pdf');
          createFile(dir + '/Pictures/notes.txt');
          createFile(dir + '/Pictures/data.csv');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_4600
     * @tc.name      testUploadDownloadDirectoryScenario0046
     * @tc.desc      Verify directory listing scenario 46.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDirectoryScenario0046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dir: string = rootDir + '/list46';
          fileIo.mkdirSync(dir, true);
          await fileUtils.initDownloadDir(dir);
          createFile(dir + '/Videos/notes.txt');
          createFile(dir + '/Videos/data.csv');
          createFile(dir + '/Videos/archive.zip');
          createFile(dir + '/Videos/config.json');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DIRSCENARIO_4700
     * @tc.name      testUploadDownloadDirectoryScenario0047
     * @tc.desc      Verify directory listing scenario 47.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
  });
}
