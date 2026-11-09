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

export default function fileTypeCatalogTest(): void {
  describe('UploadDownloadFileTypeCatalogTest', () => {
    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_0100
     * @tc.name      testUploadDownloadFileTypeCatalog0001
     * @tc.desc      Verify file type catalog entry 1 for IMG_0001.jpeg.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('IMG_0001.jpeg', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.files).assertContain('f1');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_0200
     * @tc.name      testUploadDownloadFileTypeCatalog0002
     * @tc.desc      Verify file type catalog entry 2 for IMG_0002.png.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('IMG_0002.png', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.files.length).assertEqual(1);
          expect(model.isFolder).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_0300
     * @tc.name      testUploadDownloadFileTypeCatalog0003
     * @tc.desc      Verify file type catalog entry 3 for IMG_0003.jpg.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('IMG_0003.jpg', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('IMG_0003.jpg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_0400
     * @tc.name      testUploadDownloadFileTypeCatalog0004
     * @tc.desc      Verify file type catalog entry 4 for IMG_0004.jpeg.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('IMG_0004.jpeg', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.files).assertContain('f1');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_0500
     * @tc.name      testUploadDownloadFileTypeCatalog0005
     * @tc.desc      Verify file type catalog entry 5 for IMG_0005.png.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('IMG_0005.png', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.files.length).assertEqual(1);
          expect(model.isFolder).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_0600
     * @tc.name      testUploadDownloadFileTypeCatalog0006
     * @tc.desc      Verify file type catalog entry 6 for IMG_0006.jpg.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('IMG_0006.jpg', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('IMG_0006.jpg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_0700
     * @tc.name      testUploadDownloadFileTypeCatalog0007
     * @tc.desc      Verify file type catalog entry 7 for IMG_0007.jpeg.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('IMG_0007.jpeg', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.files).assertContain('f1');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_0800
     * @tc.name      testUploadDownloadFileTypeCatalog0008
     * @tc.desc      Verify file type catalog entry 8 for IMG_0008.png.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('IMG_0008.png', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.files.length).assertEqual(1);
          expect(model.isFolder).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_0900
     * @tc.name      testUploadDownloadFileTypeCatalog0009
     * @tc.desc      Verify file type catalog entry 9 for IMG_0009.jpg.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('IMG_0009.jpg', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('IMG_0009.jpg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_1000
     * @tc.name      testUploadDownloadFileTypeCatalog0010
     * @tc.desc      Verify file type catalog entry 10 for IMG_0010.jpeg.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('IMG_0010.jpeg', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.files).assertContain('f1');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_1100
     * @tc.name      testUploadDownloadFileTypeCatalog0011
     * @tc.desc      Verify file type catalog entry 11 for IMG_0011.png.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('IMG_0011.png', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.files.length).assertEqual(1);
          expect(model.isFolder).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_1200
     * @tc.name      testUploadDownloadFileTypeCatalog0012
     * @tc.desc      Verify file type catalog entry 12 for IMG_0012.jpg.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('IMG_0012.jpg', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('IMG_0012.jpg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_1300
     * @tc.name      testUploadDownloadFileTypeCatalog0013
     * @tc.desc      Verify file type catalog entry 13 for IMG_0013.jpeg.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('IMG_0013.jpeg', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.files).assertContain('f1');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_1400
     * @tc.name      testUploadDownloadFileTypeCatalog0014
     * @tc.desc      Verify file type catalog entry 14 for IMG_0014.png.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('IMG_0014.png', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.files.length).assertEqual(1);
          expect(model.isFolder).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_1500
     * @tc.name      testUploadDownloadFileTypeCatalog0015
     * @tc.desc      Verify file type catalog entry 15 for IMG_0015.jpg.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('IMG_0015.jpg', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('IMG_0015.jpg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_1600
     * @tc.name      testUploadDownloadFileTypeCatalog0016
     * @tc.desc      Verify file type catalog entry 16 for IMG_0016.jpeg.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('IMG_0016.jpeg', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.files).assertContain('f1');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_1700
     * @tc.name      testUploadDownloadFileTypeCatalog0017
     * @tc.desc      Verify file type catalog entry 17 for IMG_0017.png.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('IMG_0017.png', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.files.length).assertEqual(1);
          expect(model.isFolder).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_1800
     * @tc.name      testUploadDownloadFileTypeCatalog0018
     * @tc.desc      Verify file type catalog entry 18 for IMG_0018.jpg.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('IMG_0018.jpg', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('IMG_0018.jpg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_1900
     * @tc.name      testUploadDownloadFileTypeCatalog0019
     * @tc.desc      Verify file type catalog entry 19 for IMG_0019.jpeg.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('IMG_0019.jpeg', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.files).assertContain('f1');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_2000
     * @tc.name      testUploadDownloadFileTypeCatalog0020
     * @tc.desc      Verify file type catalog entry 20 for IMG_0020.png.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('IMG_0020.png', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.files.length).assertEqual(1);
          expect(model.isFolder).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_2100
     * @tc.name      testUploadDownloadFileTypeCatalog0021
     * @tc.desc      Verify file type catalog entry 21 for IMG_0021.jpg.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('IMG_0021.jpg', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('IMG_0021.jpg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_2200
     * @tc.name      testUploadDownloadFileTypeCatalog0022
     * @tc.desc      Verify file type catalog entry 22 for IMG_0022.jpeg.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('IMG_0022.jpeg', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.files).assertContain('f1');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_2300
     * @tc.name      testUploadDownloadFileTypeCatalog0023
     * @tc.desc      Verify file type catalog entry 23 for IMG_0023.png.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('IMG_0023.png', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.files.length).assertEqual(1);
          expect(model.isFolder).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_2400
     * @tc.name      testUploadDownloadFileTypeCatalog0024
     * @tc.desc      Verify file type catalog entry 24 for IMG_0024.jpg.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('IMG_0024.jpg', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('IMG_0024.jpg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_2500
     * @tc.name      testUploadDownloadFileTypeCatalog0025
     * @tc.desc      Verify file type catalog entry 25 for IMG_0025.jpeg.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('IMG_0025.jpeg', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.files).assertContain('f1');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_2600
     * @tc.name      testUploadDownloadFileTypeCatalog0026
     * @tc.desc      Verify file type catalog entry 26 for IMG_0026.png.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('IMG_0026.png', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.files.length).assertEqual(1);
          expect(model.isFolder).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_2700
     * @tc.name      testUploadDownloadFileTypeCatalog0027
     * @tc.desc      Verify file type catalog entry 27 for IMG_0027.jpg.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('IMG_0027.jpg', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('IMG_0027.jpg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_2800
     * @tc.name      testUploadDownloadFileTypeCatalog0028
     * @tc.desc      Verify file type catalog entry 28 for IMG_0028.jpeg.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('IMG_0028.jpeg', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.files).assertContain('f1');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_2900
     * @tc.name      testUploadDownloadFileTypeCatalog0029
     * @tc.desc      Verify file type catalog entry 29 for IMG_0029.png.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('IMG_0029.png', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.files.length).assertEqual(1);
          expect(model.isFolder).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_3000
     * @tc.name      testUploadDownloadFileTypeCatalog0030
     * @tc.desc      Verify file type catalog entry 30 for IMG_0030.jpg.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('IMG_0030.jpg', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('IMG_0030.jpg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_3100
     * @tc.name      testUploadDownloadFileTypeCatalog0031
     * @tc.desc      Verify file type catalog entry 31 for VID_0031.mp4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('VID_0031.mp4', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.files).assertContain('f1');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_3200
     * @tc.name      testUploadDownloadFileTypeCatalog0032
     * @tc.desc      Verify file type catalog entry 32 for VID_0032.mp4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('VID_0032.mp4', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.files.length).assertEqual(1);
          expect(model.isFolder).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_3300
     * @tc.name      testUploadDownloadFileTypeCatalog0033
     * @tc.desc      Verify file type catalog entry 33 for VID_0033.mp4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('VID_0033.mp4', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('VID_0033.mp4');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_3400
     * @tc.name      testUploadDownloadFileTypeCatalog0034
     * @tc.desc      Verify file type catalog entry 34 for VID_0034.mp4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('VID_0034.mp4', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.files).assertContain('f1');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_3500
     * @tc.name      testUploadDownloadFileTypeCatalog0035
     * @tc.desc      Verify file type catalog entry 35 for VID_0035.mp4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('VID_0035.mp4', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.files.length).assertEqual(1);
          expect(model.isFolder).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_3600
     * @tc.name      testUploadDownloadFileTypeCatalog0036
     * @tc.desc      Verify file type catalog entry 36 for VID_0036.mp4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('VID_0036.mp4', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('VID_0036.mp4');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_3700
     * @tc.name      testUploadDownloadFileTypeCatalog0037
     * @tc.desc      Verify file type catalog entry 37 for VID_0037.mp4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('VID_0037.mp4', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.files).assertContain('f1');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_3800
     * @tc.name      testUploadDownloadFileTypeCatalog0038
     * @tc.desc      Verify file type catalog entry 38 for VID_0038.mp4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('VID_0038.mp4', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.files.length).assertEqual(1);
          expect(model.isFolder).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_3900
     * @tc.name      testUploadDownloadFileTypeCatalog0039
     * @tc.desc      Verify file type catalog entry 39 for VID_0039.mp4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('VID_0039.mp4', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('VID_0039.mp4');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_4000
     * @tc.name      testUploadDownloadFileTypeCatalog0040
     * @tc.desc      Verify file type catalog entry 40 for VID_0040.mp4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('VID_0040.mp4', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.files).assertContain('f1');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_4100
     * @tc.name      testUploadDownloadFileTypeCatalog0041
     * @tc.desc      Verify file type catalog entry 41 for VID_0041.mp4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('VID_0041.mp4', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.files.length).assertEqual(1);
          expect(model.isFolder).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_4200
     * @tc.name      testUploadDownloadFileTypeCatalog0042
     * @tc.desc      Verify file type catalog entry 42 for VID_0042.mp4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('VID_0042.mp4', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('VID_0042.mp4');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_4300
     * @tc.name      testUploadDownloadFileTypeCatalog0043
     * @tc.desc      Verify file type catalog entry 43 for VID_0043.mp4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('VID_0043.mp4', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.files).assertContain('f1');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_4400
     * @tc.name      testUploadDownloadFileTypeCatalog0044
     * @tc.desc      Verify file type catalog entry 44 for VID_0044.mp4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('VID_0044.mp4', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.files.length).assertEqual(1);
          expect(model.isFolder).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_4500
     * @tc.name      testUploadDownloadFileTypeCatalog0045
     * @tc.desc      Verify file type catalog entry 45 for VID_0045.mp4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('VID_0045.mp4', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('VID_0045.mp4');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_4600
     * @tc.name      testUploadDownloadFileTypeCatalog0046
     * @tc.desc      Verify file type catalog entry 46 for VID_0046.mp4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('VID_0046.mp4', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.files).assertContain('f1');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_4700
     * @tc.name      testUploadDownloadFileTypeCatalog0047
     * @tc.desc      Verify file type catalog entry 47 for VID_0047.mp4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('VID_0047.mp4', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.files.length).assertEqual(1);
          expect(model.isFolder).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_4800
     * @tc.name      testUploadDownloadFileTypeCatalog0048
     * @tc.desc      Verify file type catalog entry 48 for VID_0048.mp4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('VID_0048.mp4', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('VID_0048.mp4');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_4900
     * @tc.name      testUploadDownloadFileTypeCatalog0049
     * @tc.desc      Verify file type catalog entry 49 for VID_0049.mp4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('VID_0049.mp4', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.files).assertContain('f1');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_5000
     * @tc.name      testUploadDownloadFileTypeCatalog0050
     * @tc.desc      Verify file type catalog entry 50 for VID_0050.mp4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('VID_0050.mp4', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.files.length).assertEqual(1);
          expect(model.isFolder).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_5100
     * @tc.name      testUploadDownloadFileTypeCatalog0051
     * @tc.desc      Verify file type catalog entry 51 for AUD_0051.mp3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0051',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('AUD_0051.mp3', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('AUD_0051.mp3');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_5200
     * @tc.name      testUploadDownloadFileTypeCatalog0052
     * @tc.desc      Verify file type catalog entry 52 for AUD_0052.mp3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0052',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('AUD_0052.mp3', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.files).assertContain('f1');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_5300
     * @tc.name      testUploadDownloadFileTypeCatalog0053
     * @tc.desc      Verify file type catalog entry 53 for AUD_0053.mp3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
  });
}
