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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { FileModel, FileType } from 'uploadanddownload';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = 'SampleTest';

export default function fileModelExtraTest(): void {
  describe('UploadDownloadFileModelExtraTest', () => {
    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_0100
     * @tc.name      testUploadDownloadFileModelExtra0001
     * @tc.desc      Verify FileModel suffix case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('video.mp4', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('video.mp4');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_0200
     * @tc.name      testUploadDownloadFileModelExtra0002
     * @tc.desc      Verify FileModel suffix case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('audio.mp3', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('audio.mp3');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_0300
     * @tc.name      testUploadDownloadFileModelExtra0003
     * @tc.desc      Verify FileModel suffix case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('image.jpg', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('image.jpg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_0400
     * @tc.name      testUploadDownloadFileModelExtra0004
     * @tc.desc      Verify FileModel suffix case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('image.jpeg', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('image.jpeg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_0500
     * @tc.name      testUploadDownloadFileModelExtra0005
     * @tc.desc      Verify FileModel suffix case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('image.png', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('image.png');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_0600
     * @tc.name      testUploadDownloadFileModelExtra0006
     * @tc.desc      Verify FileModel suffix case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('readme.txt', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('readme.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_0700
     * @tc.name      testUploadDownloadFileModelExtra0007
     * @tc.desc      Verify FileModel suffix case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('report.pdf', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('report.pdf');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_0800
     * @tc.name      testUploadDownloadFileModelExtra0008
     * @tc.desc      Verify FileModel suffix case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('archive.zip', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('archive.zip');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_0900
     * @tc.name      testUploadDownloadFileModelExtra0009
     * @tc.desc      Verify FileModel suffix case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('data.bin', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('data.bin');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_1000
     * @tc.name      testUploadDownloadFileModelExtra0010
     * @tc.desc      Verify FileModel suffix case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('data.dat', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('data.dat');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_1100
     * @tc.name      testUploadDownloadFileModelExtra0011
     * @tc.desc      Verify FileModel suffix case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('config.json', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('config.json');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_1200
     * @tc.name      testUploadDownloadFileModelExtra0012
     * @tc.desc      Verify FileModel suffix case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('page.html', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('page.html');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_1300
     * @tc.name      testUploadDownloadFileModelExtra0013
     * @tc.desc      Verify FileModel suffix case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('style.css', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('style.css');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_1400
     * @tc.name      testUploadDownloadFileModelExtra0014
     * @tc.desc      Verify FileModel suffix case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('script.js', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('script.js');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_1500
     * @tc.name      testUploadDownloadFileModelExtra0015
     * @tc.desc      Verify FileModel suffix case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('module.ts', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('module.ts');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_1600
     * @tc.name      testUploadDownloadFileModelExtra0016
     * @tc.desc      Verify FileModel suffix case 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('sample.ets', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('sample.ets');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_1700
     * @tc.name      testUploadDownloadFileModelExtra0017
     * @tc.desc      Verify FileModel suffix case 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('app.hap', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('app.hap');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_1800
     * @tc.name      testUploadDownloadFileModelExtra0018
     * @tc.desc      Verify FileModel suffix case 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('log.txt', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('log.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_1900
     * @tc.name      testUploadDownloadFileModelExtra0019
     * @tc.desc      Verify FileModel suffix case 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('note.md', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('note.md');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_2000
     * @tc.name      testUploadDownloadFileModelExtra0020
     * @tc.desc      Verify FileModel suffix case 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('table.csv', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('table.csv');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_2100
     * @tc.name      testUploadDownloadFileModelExtra0021
     * @tc.desc      Verify FileModel suffix case 21.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('image.svg', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('image.svg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_2200
     * @tc.name      testUploadDownloadFileModelExtra0022
     * @tc.desc      Verify FileModel suffix case 22.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('image.webp', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('image.webp');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_2300
     * @tc.name      testUploadDownloadFileModelExtra0023
     * @tc.desc      Verify FileModel suffix case 23.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('image.gif', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('image.gif');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_2400
     * @tc.name      testUploadDownloadFileModelExtra0024
     * @tc.desc      Verify FileModel suffix case 24.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('image.bmp', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('image.bmp');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_2500
     * @tc.name      testUploadDownloadFileModelExtra0025
     * @tc.desc      Verify FileModel suffix case 25.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('movie.mov', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('movie.mov');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_2600
     * @tc.name      testUploadDownloadFileModelExtra0026
     * @tc.desc      Verify FileModel suffix case 26.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('movie.avi', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('movie.avi');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_2700
     * @tc.name      testUploadDownloadFileModelExtra0027
     * @tc.desc      Verify FileModel suffix case 27.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('movie.mkv', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('movie.mkv');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_2800
     * @tc.name      testUploadDownloadFileModelExtra0028
     * @tc.desc      Verify FileModel suffix case 28.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('sound.wav', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('sound.wav');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_2900
     * @tc.name      testUploadDownloadFileModelExtra0029
     * @tc.desc      Verify FileModel suffix case 29.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('sound.flac', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('sound.flac');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_3000
     * @tc.name      testUploadDownloadFileModelExtra0030
     * @tc.desc      Verify FileModel suffix case 30.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('sound.aac', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('sound.aac');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_3100
     * @tc.name      testUploadDownloadFileModelExtra0031
     * @tc.desc      Verify FileModel suffix case 31.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('sound.ogg', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('sound.ogg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_3200
     * @tc.name      testUploadDownloadFileModelExtra0032
     * @tc.desc      Verify FileModel suffix case 32.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('sound.opus', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('sound.opus');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_3300
     * @tc.name      testUploadDownloadFileModelExtra0033
     * @tc.desc      Verify FileModel suffix case 33.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('clip.3gp', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('clip.3gp');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_3400
     * @tc.name      testUploadDownloadFileModelExtra0034
     * @tc.desc      Verify FileModel suffix case 34.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('clip.m4v', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('clip.m4v');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_3500
     * @tc.name      testUploadDownloadFileModelExtra0035
     * @tc.desc      Verify FileModel suffix case 35.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('a.mp4', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('a.mp4');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_3600
     * @tc.name      testUploadDownloadFileModelExtra0036
     * @tc.desc      Verify FileModel suffix case 36.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('b.mp3', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('b.mp3');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_3700
     * @tc.name      testUploadDownloadFileModelExtra0037
     * @tc.desc      Verify FileModel suffix case 37.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('c.jpeg', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('c.jpeg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_3800
     * @tc.name      testUploadDownloadFileModelExtra0038
     * @tc.desc      Verify FileModel suffix case 38.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('d.png', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('d.png');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_3900
     * @tc.name      testUploadDownloadFileModelExtra0039
     * @tc.desc      Verify FileModel suffix case 39.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('e.JPG', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('e.JPG');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA_4000
     * @tc.name      testUploadDownloadFileModelExtra0040
     * @tc.desc      Verify FileModel suffix case 40.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('f.MP3', false, ['file']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('f.MP3');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
