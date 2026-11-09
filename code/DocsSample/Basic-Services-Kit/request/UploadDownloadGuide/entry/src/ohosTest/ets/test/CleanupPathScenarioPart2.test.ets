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

export default function cleanupPathScenarioTestPart2(): void {
  describe('UploadDownloadCleanupPathScenarioTestPart2', () => {
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
    it('testUploadDownloadCleanupPathScenario0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_040.pdf';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_4100
     * @tc.name      testUploadDownloadCleanupPathScenario0041
     * @tc.desc      Verify cleanup path scenario 41.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_041.zip';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_4200
     * @tc.name      testUploadDownloadCleanupPathScenario0042
     * @tc.desc      Verify cleanup path scenario 42.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_042.txt';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_4300
     * @tc.name      testUploadDownloadCleanupPathScenario0043
     * @tc.desc      Verify cleanup path scenario 43.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_043.bin';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_4400
     * @tc.name      testUploadDownloadCleanupPathScenario0044
     * @tc.desc      Verify cleanup path scenario 44.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_044.jpg';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_4500
     * @tc.name      testUploadDownloadCleanupPathScenario0045
     * @tc.desc      Verify cleanup path scenario 45.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_045.mp3';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_4600
     * @tc.name      testUploadDownloadCleanupPathScenario0046
     * @tc.desc      Verify cleanup path scenario 46.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_046.mp4';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_4700
     * @tc.name      testUploadDownloadCleanupPathScenario0047
     * @tc.desc      Verify cleanup path scenario 47.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_047.pdf';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_4800
     * @tc.name      testUploadDownloadCleanupPathScenario0048
     * @tc.desc      Verify cleanup path scenario 48.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_048.zip';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_4900
     * @tc.name      testUploadDownloadCleanupPathScenario0049
     * @tc.desc      Verify cleanup path scenario 49.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_049.txt';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_5000
     * @tc.name      testUploadDownloadCleanupPathScenario0050
     * @tc.desc      Verify cleanup path scenario 50.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/scenario_file_050.bin';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_5100
     * @tc.name      testUploadDownloadCleanupPathScenario0051
     * @tc.desc      Verify cleanup path scenario 51.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0051',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/missing_file_051.bin';
          expect(fileIo.accessSync(path)).assertFalse();
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_5200
     * @tc.name      testUploadDownloadCleanupPathScenario0052
     * @tc.desc      Verify cleanup path scenario 52.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0052',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/missing_file_052.bin';
          expect(fileIo.accessSync(path)).assertFalse();
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_5300
     * @tc.name      testUploadDownloadCleanupPathScenario0053
     * @tc.desc      Verify cleanup path scenario 53.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0053',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/missing_file_053.bin';
          expect(fileIo.accessSync(path)).assertFalse();
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_5400
     * @tc.name      testUploadDownloadCleanupPathScenario0054
     * @tc.desc      Verify cleanup path scenario 54.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0054',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/missing_file_054.bin';
          expect(fileIo.accessSync(path)).assertFalse();
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_5500
     * @tc.name      testUploadDownloadCleanupPathScenario0055
     * @tc.desc      Verify cleanup path scenario 55.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0055',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/missing_file_055.bin';
          expect(fileIo.accessSync(path)).assertFalse();
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_5600
     * @tc.name      testUploadDownloadCleanupPathScenario0056
     * @tc.desc      Verify cleanup path scenario 56.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0056',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/missing_file_056.bin';
          expect(fileIo.accessSync(path)).assertFalse();
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_5700
     * @tc.name      testUploadDownloadCleanupPathScenario0057
     * @tc.desc      Verify cleanup path scenario 57.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0057',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/missing_file_057.bin';
          expect(fileIo.accessSync(path)).assertFalse();
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_5800
     * @tc.name      testUploadDownloadCleanupPathScenario0058
     * @tc.desc      Verify cleanup path scenario 58.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0058',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/missing_file_058.bin';
          expect(fileIo.accessSync(path)).assertFalse();
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_5900
     * @tc.name      testUploadDownloadCleanupPathScenario0059
     * @tc.desc      Verify cleanup path scenario 59.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0059',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/missing_file_059.bin';
          expect(fileIo.accessSync(path)).assertFalse();
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_6000
     * @tc.name      testUploadDownloadCleanupPathScenario0060
     * @tc.desc      Verify cleanup path scenario 60.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0060',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/missing_file_060.bin';
          expect(fileIo.accessSync(path)).assertFalse();
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_6100
     * @tc.name      testUploadDownloadCleanupPathScenario0061
     * @tc.desc      Verify cleanup path scenario 61.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0061',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/missing_file_061.bin';
          expect(fileIo.accessSync(path)).assertFalse();
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_6200
     * @tc.name      testUploadDownloadCleanupPathScenario0062
     * @tc.desc      Verify cleanup path scenario 62.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0062',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/missing_file_062.bin';
          expect(fileIo.accessSync(path)).assertFalse();
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_6300
     * @tc.name      testUploadDownloadCleanupPathScenario0063
     * @tc.desc      Verify cleanup path scenario 63.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0063',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/missing_file_063.bin';
          expect(fileIo.accessSync(path)).assertFalse();
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_6400
     * @tc.name      testUploadDownloadCleanupPathScenario0064
     * @tc.desc      Verify cleanup path scenario 64.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0064',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/missing_file_064.bin';
          expect(fileIo.accessSync(path)).assertFalse();
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_6500
     * @tc.name      testUploadDownloadCleanupPathScenario0065
     * @tc.desc      Verify cleanup path scenario 65.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0065',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/missing_file_065.bin';
          expect(fileIo.accessSync(path)).assertFalse();
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_6600
     * @tc.name      testUploadDownloadCleanupPathScenario0066
     * @tc.desc      Verify cleanup path scenario 66.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0066',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/missing_file_066.bin';
          expect(fileIo.accessSync(path)).assertFalse();
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_6700
     * @tc.name      testUploadDownloadCleanupPathScenario0067
     * @tc.desc      Verify cleanup path scenario 67.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0067',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/missing_file_067.bin';
          expect(fileIo.accessSync(path)).assertFalse();
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_6800
     * @tc.name      testUploadDownloadCleanupPathScenario0068
     * @tc.desc      Verify cleanup path scenario 68.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0068',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/missing_file_068.bin';
          expect(fileIo.accessSync(path)).assertFalse();
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_6900
     * @tc.name      testUploadDownloadCleanupPathScenario0069
     * @tc.desc      Verify cleanup path scenario 69.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0069',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/missing_file_069.bin';
          expect(fileIo.accessSync(path)).assertFalse();
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_7000
     * @tc.name      testUploadDownloadCleanupPathScenario0070
     * @tc.desc      Verify cleanup path scenario 70.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0070',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/missing_file_070.bin';
          expect(fileIo.accessSync(path)).assertFalse();
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_7100
     * @tc.name      testUploadDownloadCleanupPathScenario0071
     * @tc.desc      Verify cleanup path scenario 71.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0071',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/repeat_clean_071.tmp';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_7200
     * @tc.name      testUploadDownloadCleanupPathScenario0072
     * @tc.desc      Verify cleanup path scenario 72.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0072',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/repeat_clean_072.tmp';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_7300
     * @tc.name      testUploadDownloadCleanupPathScenario0073
     * @tc.desc      Verify cleanup path scenario 73.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0073',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/repeat_clean_073.tmp';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_7400
     * @tc.name      testUploadDownloadCleanupPathScenario0074
     * @tc.desc      Verify cleanup path scenario 74.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0074',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/repeat_clean_074.tmp';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_7500
     * @tc.name      testUploadDownloadCleanupPathScenario0075
     * @tc.desc      Verify cleanup path scenario 75.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0075',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/repeat_clean_075.tmp';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_7600
     * @tc.name      testUploadDownloadCleanupPathScenario0076
     * @tc.desc      Verify cleanup path scenario 76.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0076',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/repeat_clean_076.tmp';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_7700
     * @tc.name      testUploadDownloadCleanupPathScenario0077
     * @tc.desc      Verify cleanup path scenario 77.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0077',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/repeat_clean_077.tmp';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_7800
     * @tc.name      testUploadDownloadCleanupPathScenario0078
     * @tc.desc      Verify cleanup path scenario 78.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0078',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/repeat_clean_078.tmp';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_7900
     * @tc.name      testUploadDownloadCleanupPathScenario0079
     * @tc.desc      Verify cleanup path scenario 79.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0079',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/repeat_clean_079.tmp';
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CLEANUPPATH_8000
     * @tc.name      testUploadDownloadCleanupPathScenario0080
     * @tc.desc      Verify cleanup path scenario 80.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadCleanupPathScenario0080',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const path: string = context.cacheDir + '/repeat_clean_080.tmp';
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

  });
}
