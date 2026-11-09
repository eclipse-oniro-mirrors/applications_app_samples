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

export default function fileModelMatrixTest(): void {
  describe('UploadDownloadFileModelMatrixTest', () => {
    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_0100
     * @tc.name      testUploadDownloadFileModel0001
     * @tc.desc      Verify FileModel type for name 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('Documents', true, []);
          expect(model.fileType).assertEqual(FileType.FOLDER);
          expect(model.isFolder).assertEqual(true);
          expect(model.files.length).assertEqual(0);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_0200
     * @tc.name      testUploadDownloadFileModel0002
     * @tc.desc      Verify FileModel type for name 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('Pictures', true, []);
          expect(model.fileType).assertEqual(FileType.FOLDER);
          expect(model.isFolder).assertEqual(true);
          expect(model.files.length).assertEqual(0);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_0300
     * @tc.name      testUploadDownloadFileModel0003
     * @tc.desc      Verify FileModel type for name 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('video.mp4', false, ['file0']);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_0400
     * @tc.name      testUploadDownloadFileModel0004
     * @tc.desc      Verify FileModel type for name 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('VIDEO.MP4', false, ['file0']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_0500
     * @tc.name      testUploadDownloadFileModel0005
     * @tc.desc      Verify FileModel type for name 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('audio.mp3', false, ['file0']);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_0600
     * @tc.name      testUploadDownloadFileModel0006
     * @tc.desc      Verify FileModel type for name 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('AUDIO.MP3', false, ['file0']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_0700
     * @tc.name      testUploadDownloadFileModel0007
     * @tc.desc      Verify FileModel type for name 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('image.jpg', false, ['file0']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_0800
     * @tc.name      testUploadDownloadFileModel0008
     * @tc.desc      Verify FileModel type for name 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('image.jpeg', false, ['file0']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_0900
     * @tc.name      testUploadDownloadFileModel0009
     * @tc.desc      Verify FileModel type for name 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('image.png', false, ['file0']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_1000
     * @tc.name      testUploadDownloadFileModel0010
     * @tc.desc      Verify FileModel type for name 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('IMAGE.JPG', false, ['file0']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_1100
     * @tc.name      testUploadDownloadFileModel0011
     * @tc.desc      Verify FileModel type for name 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('readme.txt', false, ['file0']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_1200
     * @tc.name      testUploadDownloadFileModel0012
     * @tc.desc      Verify FileModel type for name 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('report.pdf', false, ['file0']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_1300
     * @tc.name      testUploadDownloadFileModel0013
     * @tc.desc      Verify FileModel type for name 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('README', false, ['file0']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_1400
     * @tc.name      testUploadDownloadFileModel0014
     * @tc.desc      Verify FileModel type for name 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('.jpg', false, ['file0']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_1500
     * @tc.name      testUploadDownloadFileModel0015
     * @tc.desc      Verify FileModel type for name 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('name.mp4.txt', false, ['file0']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_1600
     * @tc.name      testUploadDownloadFileModel0016
     * @tc.desc      Verify FileModel type for name 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('name.txt.mp4', false, ['file0', 'file1']);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(2);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_1700
     * @tc.name      testUploadDownloadFileModel0017
     * @tc.desc      Verify FileModel type for name 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('name.jpg.png', false, ['file0', 'file1', 'file2']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(3);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_1800
     * @tc.name      testUploadDownloadFileModel0018
     * @tc.desc      Verify FileModel type for name 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('', false, []);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(0);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_1900
     * @tc.name      testUploadDownloadFileModel0019
     * @tc.desc      Verify FileModel type for name 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('movie.mp3', false, ['file0', 'file1']);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(2);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_2000
     * @tc.name      testUploadDownloadFileModel0020
     * @tc.desc      Verify FileModel type for name 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('图片.jpg', false, ['file0']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_2100
     * @tc.name      testUploadDownloadFileModel0021
     * @tc.desc      Verify FileModel type for name 21.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('photo.jpeg', false, ['file0']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_2200
     * @tc.name      testUploadDownloadFileModel0022
     * @tc.desc      Verify FileModel type for name 22.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('photo.JPEG', false, ['file0']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_2300
     * @tc.name      testUploadDownloadFileModel0023
     * @tc.desc      Verify FileModel type for name 23.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('photo.png', false, ['file0', 'file1']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(2);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_2400
     * @tc.name      testUploadDownloadFileModel0024
     * @tc.desc      Verify FileModel type for name 24.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('folder.mp4', true, ['file0']);
          expect(model.fileType).assertEqual(FileType.FOLDER);
          expect(model.isFolder).assertEqual(true);
          expect(model.files.length).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_2500
     * @tc.name      testUploadDownloadFileModel0025
     * @tc.desc      Verify FileModel type for name 25.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('folder', true, []);
          expect(model.fileType).assertEqual(FileType.FOLDER);
          expect(model.isFolder).assertEqual(true);
          expect(model.files.length).assertEqual(0);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_2600
     * @tc.name      testUploadDownloadFileModel0026
     * @tc.desc      Verify FileModel type for name 26.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('archive.zip', false, ['file0']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_2700
     * @tc.name      testUploadDownloadFileModel0027
     * @tc.desc      Verify FileModel type for name 27.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('music.mp3', false, ['file0', 'file1', 'file2']);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(3);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_2800
     * @tc.name      testUploadDownloadFileModel0028
     * @tc.desc      Verify FileModel type for name 28.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('PHOTO.JPEG', false, ['file0']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_2900
     * @tc.name      testUploadDownloadFileModel0029
     * @tc.desc      Verify FileModel type for name 29.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('CLIP.MP4', false, ['file0', 'file1']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(2);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_3000
     * @tc.name      testUploadDownloadFileModel0030
     * @tc.desc      Verify FileModel type for name 30.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('test', false, ['file0']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_3100
     * @tc.name      testUploadDownloadFileModel0031
     * @tc.desc      Verify FileModel type for name 31.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('single.txt', false, ['file0']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_3200
     * @tc.name      testUploadDownloadFileModel0032
     * @tc.desc      Verify FileModel type for name 32.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('multiple.bin', false, ['file0', 'file1', 'file2', 'file3']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(4);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_3300
     * @tc.name      testUploadDownloadFileModel0033
     * @tc.desc      Verify FileModel type for name 33.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('empty.bin', false, []);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(0);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_3400
     * @tc.name      testUploadDownloadFileModel0034
     * @tc.desc      Verify FileModel type for name 34.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('not-folder.mp4', false, ['file0']);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_3500
     * @tc.name      testUploadDownloadFileModel0035
     * @tc.desc      Verify FileModel type for name 35.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('real-folder', true, ['file0', 'file1']);
          expect(model.fileType).assertEqual(FileType.FOLDER);
          expect(model.isFolder).assertEqual(true);
          expect(model.files.length).assertEqual(2);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_3600
     * @tc.name      testUploadDownloadFileModel0036
     * @tc.desc      Verify FileModel type for name 36.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('name.jpg', false, ['file0']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_3700
     * @tc.name      testUploadDownloadFileModel0037
     * @tc.desc      Verify FileModel type for name 37.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('name.mp3', false, ['file0']);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_3800
     * @tc.name      testUploadDownloadFileModel0038
     * @tc.desc      Verify FileModel type for name 38.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('name.mp4', false, ['file0']);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_3900
     * @tc.name      testUploadDownloadFileModel0039
     * @tc.desc      Verify FileModel type for name 39.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('name.txt', false, ['file0']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_4000
     * @tc.name      testUploadDownloadFileModel0040
     * @tc.desc      Verify FileModel type for name 40.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModel0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('last.png', false, ['file0', 'file1', 'file2', 'file3', 'file4']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertEqual(false);
          expect(model.files.length).assertEqual(5);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
