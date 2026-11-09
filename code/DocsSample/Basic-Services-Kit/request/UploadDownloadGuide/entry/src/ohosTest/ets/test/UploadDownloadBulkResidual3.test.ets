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

export default function uploadDownloadBulkResidual3Test(): void {
  describe('UploadDownloadBulkResidual3Test', () => {
    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0001
     * @tc.name      testUploadDownloadBulkResidual3_0001
     * @tc.desc      Verify FileModel bulk3 case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_img_00.jpg', false, []);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk3_img_00.jpg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0002
     * @tc.name      testUploadDownloadBulkResidual3_0002
     * @tc.desc      Verify FileModel bulk3 case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_img_01.png', false, []);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk3_img_01.png');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0003
     * @tc.name      testUploadDownloadBulkResidual3_0003
     * @tc.desc      Verify FileModel bulk3 case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_img_02.jpeg', false, []);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk3_img_02.jpeg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0004
     * @tc.name      testUploadDownloadBulkResidual3_0004
     * @tc.desc      Verify FileModel bulk3 case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_img_03.jpg', false, []);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk3_img_03.jpg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0005
     * @tc.name      testUploadDownloadBulkResidual3_0005
     * @tc.desc      Verify FileModel bulk3 case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_img_04.png', false, []);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk3_img_04.png');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0006
     * @tc.name      testUploadDownloadBulkResidual3_0006
     * @tc.desc      Verify FileModel bulk3 case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_img_05.jpeg', false, []);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk3_img_05.jpeg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0007
     * @tc.name      testUploadDownloadBulkResidual3_0007
     * @tc.desc      Verify FileModel bulk3 case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_img_06.jpg', false, []);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk3_img_06.jpg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0008
     * @tc.name      testUploadDownloadBulkResidual3_0008
     * @tc.desc      Verify FileModel bulk3 case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_img_07.png', false, []);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk3_img_07.png');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0009
     * @tc.name      testUploadDownloadBulkResidual3_0009
     * @tc.desc      Verify FileModel bulk3 case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_audio_00.mp3', false, []);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk3_audio_00.mp3');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0010
     * @tc.name      testUploadDownloadBulkResidual3_0010
     * @tc.desc      Verify FileModel bulk3 case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_audio_01.mp3', false, []);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk3_audio_01.mp3');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0011
     * @tc.name      testUploadDownloadBulkResidual3_0011
     * @tc.desc      Verify FileModel bulk3 case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_audio_02.mp3', false, []);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk3_audio_02.mp3');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0012
     * @tc.name      testUploadDownloadBulkResidual3_0012
     * @tc.desc      Verify FileModel bulk3 case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_audio_03.mp3', false, []);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk3_audio_03.mp3');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0013
     * @tc.name      testUploadDownloadBulkResidual3_0013
     * @tc.desc      Verify FileModel bulk3 case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_audio_04.mp3', false, []);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk3_audio_04.mp3');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0014
     * @tc.name      testUploadDownloadBulkResidual3_0014
     * @tc.desc      Verify FileModel bulk3 case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_audio_05.mp3', false, []);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk3_audio_05.mp3');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0015
     * @tc.name      testUploadDownloadBulkResidual3_0015
     * @tc.desc      Verify FileModel bulk3 case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_audio_06.mp3', false, []);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk3_audio_06.mp3');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0016
     * @tc.name      testUploadDownloadBulkResidual3_0016
     * @tc.desc      Verify FileModel bulk3 case 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_audio_07.mp3', false, []);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk3_audio_07.mp3');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0017
     * @tc.name      testUploadDownloadBulkResidual3_0017
     * @tc.desc      Verify FileModel bulk3 case 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_video_00.mp4', false, []);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk3_video_00.mp4');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0018
     * @tc.name      testUploadDownloadBulkResidual3_0018
     * @tc.desc      Verify FileModel bulk3 case 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_video_01.mp4', false, []);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk3_video_01.mp4');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0019
     * @tc.name      testUploadDownloadBulkResidual3_0019
     * @tc.desc      Verify FileModel bulk3 case 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_video_02.mp4', false, []);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk3_video_02.mp4');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0020
     * @tc.name      testUploadDownloadBulkResidual3_0020
     * @tc.desc      Verify FileModel bulk3 case 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_video_03.mp4', false, []);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk3_video_03.mp4');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0021
     * @tc.name      testUploadDownloadBulkResidual3_0021
     * @tc.desc      Verify FileModel bulk3 case 21.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_video_04.mp4', false, []);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk3_video_04.mp4');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0022
     * @tc.name      testUploadDownloadBulkResidual3_0022
     * @tc.desc      Verify FileModel bulk3 case 22.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_video_05.mp4', false, []);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk3_video_05.mp4');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0023
     * @tc.name      testUploadDownloadBulkResidual3_0023
     * @tc.desc      Verify FileModel bulk3 case 23.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_video_06.mp4', false, []);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk3_video_06.mp4');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0024
     * @tc.name      testUploadDownloadBulkResidual3_0024
     * @tc.desc      Verify FileModel bulk3 case 24.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_video_07.mp4', false, []);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk3_video_07.mp4');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0025
     * @tc.name      testUploadDownloadBulkResidual3_0025
     * @tc.desc      Verify FileModel bulk3 case 25.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_doc_00.txt', false, []);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk3_doc_00.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0026
     * @tc.name      testUploadDownloadBulkResidual3_0026
     * @tc.desc      Verify FileModel bulk3 case 26.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_doc_01.pdf', false, []);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk3_doc_01.pdf');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0027
     * @tc.name      testUploadDownloadBulkResidual3_0027
     * @tc.desc      Verify FileModel bulk3 case 27.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_doc_02.doc', false, []);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk3_doc_02.doc');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0028
     * @tc.name      testUploadDownloadBulkResidual3_0028
     * @tc.desc      Verify FileModel bulk3 case 28.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_doc_03.zip', false, []);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk3_doc_03.zip');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0029
     * @tc.name      testUploadDownloadBulkResidual3_0029
     * @tc.desc      Verify FileModel bulk3 case 29.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_doc_04.txt', false, []);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk3_doc_04.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0030
     * @tc.name      testUploadDownloadBulkResidual3_0030
     * @tc.desc      Verify FileModel bulk3 case 30.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_doc_05.pdf', false, []);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk3_doc_05.pdf');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0031
     * @tc.name      testUploadDownloadBulkResidual3_0031
     * @tc.desc      Verify FileModel bulk3 case 31.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_doc_06.doc', false, []);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk3_doc_06.doc');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0032
     * @tc.name      testUploadDownloadBulkResidual3_0032
     * @tc.desc      Verify FileModel bulk3 case 32.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_doc_07.zip', false, []);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk3_doc_07.zip');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0033
     * @tc.name      testUploadDownloadBulkResidual3_0033
     * @tc.desc      Verify FileModel bulk3 case 33.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_dir_00.png', true, []);
          expect(model.fileType).assertEqual(FileType.FOLDER);
          expect(model.isFolder).assertTrue();
          expect(model.name).assertEqual('bulk3_dir_00.png');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0034
     * @tc.name      testUploadDownloadBulkResidual3_0034
     * @tc.desc      Verify FileModel bulk3 case 34.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_dir_01.png', true, []);
          expect(model.fileType).assertEqual(FileType.FOLDER);
          expect(model.isFolder).assertTrue();
          expect(model.name).assertEqual('bulk3_dir_01.png');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0035
     * @tc.name      testUploadDownloadBulkResidual3_0035
     * @tc.desc      Verify FileModel bulk3 case 35.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_dir_02.png', true, []);
          expect(model.fileType).assertEqual(FileType.FOLDER);
          expect(model.isFolder).assertTrue();
          expect(model.name).assertEqual('bulk3_dir_02.png');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0036
     * @tc.name      testUploadDownloadBulkResidual3_0036
     * @tc.desc      Verify FileModel bulk3 case 36.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3_dir_03.png', true, []);
          expect(model.fileType).assertEqual(FileType.FOLDER);
          expect(model.isFolder).assertTrue();
          expect(model.name).assertEqual('bulk3_dir_03.png');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0037
     * @tc.name      testUploadDownloadBulkResidual3_0037
     * @tc.desc      Verify FileModel bulk3 case 37.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('BULK3.MP4', false, []);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('BULK3.MP4');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0038
     * @tc.name      testUploadDownloadBulkResidual3_0038
     * @tc.desc      Verify FileModel bulk3 case 38.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk3noext', false, []);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk3noext');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0039
     * @tc.name      testUploadDownloadBulkResidual3_0039
     * @tc.desc      Verify FileModel bulk3 case 39.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('.bulk3.jpg', false, []);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('.bulk3.jpg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK3_0040
     * @tc.name      testUploadDownloadBulkResidual3_0040
     * @tc.desc      Verify FileModel bulk3 case 40.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual3_0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('批量3.jpg', false, []);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('批量3.jpg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
