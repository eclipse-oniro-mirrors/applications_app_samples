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

export default function fileModelResidualTest(): void {
  describe('UploadDownloadFileModelResidualTest', () => {
    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_RESIDUAL_0100
     * @tc.name      testUploadDownloadFileModelResidual0001
     * @tc.desc      Verify lower-case jpeg suffix is classified as image.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelResidual0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('photo.jpeg', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('photo.jpeg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_RESIDUAL_0200
     * @tc.name      testUploadDownloadFileModelResidual0002
     * @tc.desc      Verify upper-case image suffix remains a document.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelResidual0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('photo.JPG', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('photo.JPG');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_RESIDUAL_0300
     * @tc.name      testUploadDownloadFileModelResidual0003
     * @tc.desc      Verify multi-dot name uses the final mp4 suffix.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelResidual0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('archive.tar.mp4', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('archive.tar.mp4');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_RESIDUAL_0400
     * @tc.name      testUploadDownloadFileModelResidual0004
     * @tc.desc      Verify upper-case music suffix remains a document.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelResidual0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('song.MP3', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('song.MP3');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_RESIDUAL_0500
     * @tc.name      testUploadDownloadFileModelResidual0005
     * @tc.desc      Verify a non-final mp4 segment remains a document.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelResidual0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('clip.mp4.bak', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('clip.mp4.bak');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_RESIDUAL_0600
     * @tc.name      testUploadDownloadFileModelResidual0006
     * @tc.desc      Verify a suffix-only jpeg name is classified as image.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelResidual0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('.jpg', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('.jpg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_RESIDUAL_0700
     * @tc.name      testUploadDownloadFileModelResidual0007
     * @tc.desc      Verify a suffix-only mp3 name is classified as music.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelResidual0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('.mp3', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('.mp3');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_RESIDUAL_0800
     * @tc.name      testUploadDownloadFileModelResidual0008
     * @tc.desc      Verify a suffix-only mp4 name is classified as video.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelResidual0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('.mp4', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('.mp4');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_RESIDUAL_0900
     * @tc.name      testUploadDownloadFileModelResidual0009
     * @tc.desc      Verify a trailing dot name is a document.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelResidual0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('file.', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('file.');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_RESIDUAL_1000
     * @tc.name      testUploadDownloadFileModelResidual0010
     * @tc.desc      Verify a name without extension is a document.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelResidual0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('noextension', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('noextension');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_RESIDUAL_1100
     * @tc.name      testUploadDownloadFileModelResidual0011
     * @tc.desc      Verify a Unicode image name is classified as image.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelResidual0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('图片.jpg', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('图片.jpg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_RESIDUAL_1200
     * @tc.name      testUploadDownloadFileModelResidual0012
     * @tc.desc      Verify surrounding spaces change suffix matching.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelResidual0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel(' image.jpg ', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual(' image.jpg ');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_RESIDUAL_1300
     * @tc.name      testUploadDownloadFileModelResidual0013
     * @tc.desc      Verify a long unknown extension is a document.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelResidual0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('file.verylongextension', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('file.verylongextension');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_RESIDUAL_1400
     * @tc.name      testUploadDownloadFileModelResidual0014
     * @tc.desc      Verify a path-like image name is classified by suffix.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelResidual0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('dir/image.png', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('dir/image.png');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_RESIDUAL_1500
     * @tc.name      testUploadDownloadFileModelResidual0015
     * @tc.desc      Verify folder flag takes precedence over the jpg suffix.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelResidual0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('folder.jpg', true, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.FOLDER);
          expect(model.isFolder).assertTrue();
          expect(model.name).assertEqual('folder.jpg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_RESIDUAL_1600
     * @tc.name      testUploadDownloadFileModelResidual0016
     * @tc.desc      Verify an empty name is classified as document.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelResidual0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_RESIDUAL_1700
     * @tc.name      testUploadDownloadFileModelResidual0017
     * @tc.desc      Verify a pdf name is classified as document.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelResidual0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('file.pdf', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('file.pdf');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_RESIDUAL_1800
     * @tc.name      testUploadDownloadFileModelResidual0018
     * @tc.desc      Verify a png name is classified as image.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelResidual0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('file.png', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('file.png');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_RESIDUAL_1900
     * @tc.name      testUploadDownloadFileModelResidual0019
     * @tc.desc      Verify an mp4 name is classified as video.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelResidual0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('file.mp4', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('file.mp4');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_RESIDUAL_2000
     * @tc.name      testUploadDownloadFileModelResidual0020
     * @tc.desc      Verify folder flag takes precedence over a text suffix.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelResidual0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('folder.txt', true, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.FOLDER);
          expect(model.isFolder).assertTrue();
          expect(model.name).assertEqual('folder.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
