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

import { describe, expect, it, Level, Size, TestType, beforeAll } from '@ohos/hypium';
import { fileIo } from '@kit.CoreFileKit';
import { common } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { requestDownload } from 'uploadanddownload';

let context: common.UIAbilityContext;

function createFile(path: string): void {
  let file = fileIo.openSync(path, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
  fileIo.closeSync(file);
}

export default function cleanupPathScenarioTest(): void {
  describe('UploadDownloadCleanupPathScenarioTest', () => {
    beforeAll(async () => {
      context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().createModuleContext('entry') as common.UIAbilityContext;
    });
    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_0100
     * @tc.name      testUploadDownloadCleanupPathScenario0001
     * @tc.desc      Verify cleanup path scenario 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_001.bin';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_0200
     * @tc.name      testUploadDownloadCleanupPathScenario0002
     * @tc.desc      Verify cleanup path scenario 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_002.jpg';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_0300
     * @tc.name      testUploadDownloadCleanupPathScenario0003
     * @tc.desc      Verify cleanup path scenario 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_003.mp3';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_0400
     * @tc.name      testUploadDownloadCleanupPathScenario0004
     * @tc.desc      Verify cleanup path scenario 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_004.mp4';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_0500
     * @tc.name      testUploadDownloadCleanupPathScenario0005
     * @tc.desc      Verify cleanup path scenario 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_005.pdf';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_0600
     * @tc.name      testUploadDownloadCleanupPathScenario0006
     * @tc.desc      Verify cleanup path scenario 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_006.zip';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_0700
     * @tc.name      testUploadDownloadCleanupPathScenario0007
     * @tc.desc      Verify cleanup path scenario 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_007.txt';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_0800
     * @tc.name      testUploadDownloadCleanupPathScenario0008
     * @tc.desc      Verify cleanup path scenario 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_008.bin';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_0900
     * @tc.name      testUploadDownloadCleanupPathScenario0009
     * @tc.desc      Verify cleanup path scenario 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_009.jpg';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_1000
     * @tc.name      testUploadDownloadCleanupPathScenario0010
     * @tc.desc      Verify cleanup path scenario 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_010.mp3';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_1100
     * @tc.name      testUploadDownloadCleanupPathScenario0011
     * @tc.desc      Verify cleanup path scenario 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_011.mp4';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_1200
     * @tc.name      testUploadDownloadCleanupPathScenario0012
     * @tc.desc      Verify cleanup path scenario 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_012.pdf';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_1300
     * @tc.name      testUploadDownloadCleanupPathScenario0013
     * @tc.desc      Verify cleanup path scenario 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_013.zip';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_1400
     * @tc.name      testUploadDownloadCleanupPathScenario0014
     * @tc.desc      Verify cleanup path scenario 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_014.txt';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_1500
     * @tc.name      testUploadDownloadCleanupPathScenario0015
     * @tc.desc      Verify cleanup path scenario 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_015.bin';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_1600
     * @tc.name      testUploadDownloadCleanupPathScenario0016
     * @tc.desc      Verify cleanup path scenario 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_016.jpg';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_1700
     * @tc.name      testUploadDownloadCleanupPathScenario0017
     * @tc.desc      Verify cleanup path scenario 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_017.mp3';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_1800
     * @tc.name      testUploadDownloadCleanupPathScenario0018
     * @tc.desc      Verify cleanup path scenario 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_018.mp4';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_1900
     * @tc.name      testUploadDownloadCleanupPathScenario0019
     * @tc.desc      Verify cleanup path scenario 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_019.pdf';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_2000
     * @tc.name      testUploadDownloadCleanupPathScenario0020
     * @tc.desc      Verify cleanup path scenario 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_020.zip';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_2100
     * @tc.name      testUploadDownloadCleanupPathScenario0021
     * @tc.desc      Verify cleanup path scenario 21.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_021.txt';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_2200
     * @tc.name      testUploadDownloadCleanupPathScenario0022
     * @tc.desc      Verify cleanup path scenario 22.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_022.bin';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_2300
     * @tc.name      testUploadDownloadCleanupPathScenario0023
     * @tc.desc      Verify cleanup path scenario 23.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_023.jpg';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_2400
     * @tc.name      testUploadDownloadCleanupPathScenario0024
     * @tc.desc      Verify cleanup path scenario 24.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_024.mp3';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_2500
     * @tc.name      testUploadDownloadCleanupPathScenario0025
     * @tc.desc      Verify cleanup path scenario 25.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_025.mp4';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_2600
     * @tc.name      testUploadDownloadCleanupPathScenario0026
     * @tc.desc      Verify cleanup path scenario 26.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_026.pdf';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_2700
     * @tc.name      testUploadDownloadCleanupPathScenario0027
     * @tc.desc      Verify cleanup path scenario 27.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_027.zip';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_2800
     * @tc.name      testUploadDownloadCleanupPathScenario0028
     * @tc.desc      Verify cleanup path scenario 28.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_028.txt';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_2900
     * @tc.name      testUploadDownloadCleanupPathScenario0029
     * @tc.desc      Verify cleanup path scenario 29.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_029.bin';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_3000
     * @tc.name      testUploadDownloadCleanupPathScenario0030
     * @tc.desc      Verify cleanup path scenario 30.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_030.jpg';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_3100
     * @tc.name      testUploadDownloadCleanupPathScenario0031
     * @tc.desc      Verify cleanup path scenario 31.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_031.mp3';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_3200
     * @tc.name      testUploadDownloadCleanupPathScenario0032
     * @tc.desc      Verify cleanup path scenario 32.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_032.mp4';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_3300
     * @tc.name      testUploadDownloadCleanupPathScenario0033
     * @tc.desc      Verify cleanup path scenario 33.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_033.pdf';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_3400
     * @tc.name      testUploadDownloadCleanupPathScenario0034
     * @tc.desc      Verify cleanup path scenario 34.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_034.zip';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_3500
     * @tc.name      testUploadDownloadCleanupPathScenario0035
     * @tc.desc      Verify cleanup path scenario 35.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_035.txt';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_3600
     * @tc.name      testUploadDownloadCleanupPathScenario0036
     * @tc.desc      Verify cleanup path scenario 36.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_036.bin';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_3700
     * @tc.name      testUploadDownloadCleanupPathScenario0037
     * @tc.desc      Verify cleanup path scenario 37.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_037.jpg';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_3800
     * @tc.name      testUploadDownloadCleanupPathScenario0038
     * @tc.desc      Verify cleanup path scenario 38.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_038.mp3';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_3900
     * @tc.name      testUploadDownloadCleanupPathScenario0039
     * @tc.desc      Verify cleanup path scenario 39.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_039.mp4';
          createFile(path);
          expect(fileIo.accessSync(path)).assertTrue();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
          requestDownload.clearExistFile(path);
          expect(fileIo.accessSync(path)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_4000
     * @tc.name      testUploadDownloadCleanupPathScenario0040
     * @tc.desc      Verify cleanup path scenario 40.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
  });
}
