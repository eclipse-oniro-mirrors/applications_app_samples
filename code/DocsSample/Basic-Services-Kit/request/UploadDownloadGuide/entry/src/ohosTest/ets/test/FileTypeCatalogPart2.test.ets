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

const TEST_DOMAIN: number = 0xF811;
const TEST_TAG: string = 'SampleTest';

export default function fileTypeCatalogTestPart2(): void {
  describe('UploadDownloadFileTypeCatalogTestPart2', () => {
    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_0100
     * @tc.name      testUploadDownloadFileTypeCatalog0001
     * @tc.desc      Verify file type catalog entry 1 for IMG_0001.jpeg.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0053',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0053');
        try {
          const model: FileModel = new FileModel('AUD_0053.mp3', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.files.length).assertEqual(1);
          expect(model.isFolder).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_5400
     * @tc.name      testUploadDownloadFileTypeCatalog0054
     * @tc.desc      Verify file type catalog entry 54 for AUD_0054.mp3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0054',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0054');
        try {
          const model: FileModel = new FileModel('AUD_0054.mp3', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('AUD_0054.mp3');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_5500
     * @tc.name      testUploadDownloadFileTypeCatalog0055
     * @tc.desc      Verify file type catalog entry 55 for AUD_0055.mp3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0055',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0055');
        try {
          const model: FileModel = new FileModel('AUD_0055.mp3', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertFalse();
          expect(model.files).assertContain('f1');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_5600
     * @tc.name      testUploadDownloadFileTypeCatalog0056
     * @tc.desc      Verify file type catalog entry 56 for AUD_0056.mp3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0056',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0056');
        try {
          const model: FileModel = new FileModel('AUD_0056.mp3', false, ['f1', 'f2']);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_5700
     * @tc.name      testUploadDownloadFileTypeCatalog0057
     * @tc.desc      Verify file type catalog entry 57 for AUD_0057.mp3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0057',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0057');
        try {
          const model: FileModel = new FileModel('AUD_0057.mp3', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('AUD_0057.mp3');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_5800
     * @tc.name      testUploadDownloadFileTypeCatalog0058
     * @tc.desc      Verify file type catalog entry 58 for AUD_0058.mp3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0058',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0058');
        try {
          const model: FileModel = new FileModel('AUD_0058.mp3', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertFalse();
          expect(model.files).assertContain('f1');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_5900
     * @tc.name      testUploadDownloadFileTypeCatalog0059
     * @tc.desc      Verify file type catalog entry 59 for AUD_0059.mp3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0059',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0059');
        try {
          const model: FileModel = new FileModel('AUD_0059.mp3', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.files.length).assertEqual(1);
          expect(model.isFolder).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_6000
     * @tc.name      testUploadDownloadFileTypeCatalog0060
     * @tc.desc      Verify file type catalog entry 60 for AUD_0060.mp3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0060',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0060');
        try {
          const model: FileModel = new FileModel('AUD_0060.mp3', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('AUD_0060.mp3');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_6100
     * @tc.name      testUploadDownloadFileTypeCatalog0061
     * @tc.desc      Verify file type catalog entry 61 for AUD_0061.mp3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0061',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0061');
        try {
          const model: FileModel = new FileModel('AUD_0061.mp3', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertFalse();
          expect(model.files).assertContain('f1');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_6200
     * @tc.name      testUploadDownloadFileTypeCatalog0062
     * @tc.desc      Verify file type catalog entry 62 for AUD_0062.mp3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0062',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0062');
        try {
          const model: FileModel = new FileModel('AUD_0062.mp3', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.files.length).assertEqual(1);
          expect(model.isFolder).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_6300
     * @tc.name      testUploadDownloadFileTypeCatalog0063
     * @tc.desc      Verify file type catalog entry 63 for AUD_0063.mp3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0063',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0063');
        try {
          const model: FileModel = new FileModel('AUD_0063.mp3', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('AUD_0063.mp3');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_6400
     * @tc.name      testUploadDownloadFileTypeCatalog0064
     * @tc.desc      Verify file type catalog entry 64 for AUD_0064.mp3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0064',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0064');
        try {
          const model: FileModel = new FileModel('AUD_0064.mp3', false, ['f1', 'f2']);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_6500
     * @tc.name      testUploadDownloadFileTypeCatalog0065
     * @tc.desc      Verify file type catalog entry 65 for AUD_0065.mp3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0065',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0065');
        try {
          const model: FileModel = new FileModel('AUD_0065.mp3', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.files.length).assertEqual(1);
          expect(model.isFolder).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_6600
     * @tc.name      testUploadDownloadFileTypeCatalog0066
     * @tc.desc      Verify file type catalog entry 66 for AUD_0066.mp3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0066',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0066');
        try {
          const model: FileModel = new FileModel('AUD_0066.mp3', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('AUD_0066.mp3');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_6700
     * @tc.name      testUploadDownloadFileTypeCatalog0067
     * @tc.desc      Verify file type catalog entry 67 for AUD_0067.mp3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0067',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0067');
        try {
          const model: FileModel = new FileModel('AUD_0067.mp3', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertFalse();
          expect(model.files).assertContain('f1');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_6800
     * @tc.name      testUploadDownloadFileTypeCatalog0068
     * @tc.desc      Verify file type catalog entry 68 for AUD_0068.mp3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0068',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0068');
        try {
          const model: FileModel = new FileModel('AUD_0068.mp3', false, ['f1', 'f2']);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_6900
     * @tc.name      testUploadDownloadFileTypeCatalog0069
     * @tc.desc      Verify file type catalog entry 69 for AUD_0069.mp3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0069',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0069');
        try {
          const model: FileModel = new FileModel('AUD_0069.mp3', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('AUD_0069.mp3');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_7000
     * @tc.name      testUploadDownloadFileTypeCatalog0070
     * @tc.desc      Verify file type catalog entry 70 for AUD_0070.mp3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0070',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0070');
        try {
          const model: FileModel = new FileModel('AUD_0070.mp3', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertFalse();
          expect(model.files).assertContain('f1');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_7100
     * @tc.name      testUploadDownloadFileTypeCatalog0071
     * @tc.desc      Verify file type catalog entry 71 for DOC_0071.txt.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0071',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0071');
        try {
          const model: FileModel = new FileModel('DOC_0071.txt', false, ['f1', 'f2']);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_7200
     * @tc.name      testUploadDownloadFileTypeCatalog0072
     * @tc.desc      Verify file type catalog entry 72 for DOC_0072.pdf.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0072',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0072');
        try {
          const model: FileModel = new FileModel('DOC_0072.pdf', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('DOC_0072.pdf');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_7300
     * @tc.name      testUploadDownloadFileTypeCatalog0073
     * @tc.desc      Verify file type catalog entry 73 for DOC_0073.zip.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0073',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0073');
        try {
          const model: FileModel = new FileModel('DOC_0073.zip', false, ['f1', 'f2']);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_7400
     * @tc.name      testUploadDownloadFileTypeCatalog0074
     * @tc.desc      Verify file type catalog entry 74 for DOC_0074.json.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0074',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0074');
        try {
          const model: FileModel = new FileModel('DOC_0074.json', false, ['f1', 'f2']);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_7500
     * @tc.name      testUploadDownloadFileTypeCatalog0075
     * @tc.desc      Verify file type catalog entry 75 for DOC_0075.csv.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0075',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0075');
        try {
          const model: FileModel = new FileModel('DOC_0075.csv', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('DOC_0075.csv');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_7600
     * @tc.name      testUploadDownloadFileTypeCatalog0076
     * @tc.desc      Verify file type catalog entry 76 for DOC_0076.xml.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0076',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0076');
        try {
          const model: FileModel = new FileModel('DOC_0076.xml', false, ['f1', 'f2']);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_7700
     * @tc.name      testUploadDownloadFileTypeCatalog0077
     * @tc.desc      Verify file type catalog entry 77 for DOC_0077.html.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0077',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0077');
        try {
          const model: FileModel = new FileModel('DOC_0077.html', false, ['f1', 'f2']);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_7800
     * @tc.name      testUploadDownloadFileTypeCatalog0078
     * @tc.desc      Verify file type catalog entry 78 for DOC_0078.css.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0078',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0078');
        try {
          const model: FileModel = new FileModel('DOC_0078.css', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('DOC_0078.css');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_7900
     * @tc.name      testUploadDownloadFileTypeCatalog0079
     * @tc.desc      Verify file type catalog entry 79 for DOC_0079.js.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0079',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0079');
        try {
          const model: FileModel = new FileModel('DOC_0079.js', false, ['f1', 'f2']);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_8000
     * @tc.name      testUploadDownloadFileTypeCatalog0080
     * @tc.desc      Verify file type catalog entry 80 for DOC_0080.ts.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0080',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0080');
        try {
          const model: FileModel = new FileModel('DOC_0080.ts', false, ['f1', 'f2']);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_8100
     * @tc.name      testUploadDownloadFileTypeCatalog0081
     * @tc.desc      Verify file type catalog entry 81 for DOC_0081.ets.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0081',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0081');
        try {
          const model: FileModel = new FileModel('DOC_0081.ets', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('DOC_0081.ets');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_8200
     * @tc.name      testUploadDownloadFileTypeCatalog0082
     * @tc.desc      Verify file type catalog entry 82 for DOC_0082.hap.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0082',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0082');
        try {
          const model: FileModel = new FileModel('DOC_0082.hap', false, ['f1', 'f2']);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_8300
     * @tc.name      testUploadDownloadFileTypeCatalog0083
     * @tc.desc      Verify file type catalog entry 83 for DOC_0083.bin.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0083',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0083');
        try {
          const model: FileModel = new FileModel('DOC_0083.bin', false, ['f1', 'f2']);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_8400
     * @tc.name      testUploadDownloadFileTypeCatalog0084
     * @tc.desc      Verify file type catalog entry 84 for DOC_0084.dat.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0084',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0084');
        try {
          const model: FileModel = new FileModel('DOC_0084.dat', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('DOC_0084.dat');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_8500
     * @tc.name      testUploadDownloadFileTypeCatalog0085
     * @tc.desc      Verify file type catalog entry 85 for DOC_0085.log.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0085',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0085');
        try {
          const model: FileModel = new FileModel('DOC_0085.log', false, ['f1', 'f2']);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_8600
     * @tc.name      testUploadDownloadFileTypeCatalog0086
     * @tc.desc      Verify file type catalog entry 86 for DOC_0086.md.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0086',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0086');
        try {
          const model: FileModel = new FileModel('DOC_0086.md', false, ['f1', 'f2']);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_8700
     * @tc.name      testUploadDownloadFileTypeCatalog0087
     * @tc.desc      Verify file type catalog entry 87 for DOC_0087.yaml.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0087',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0087');
        try {
          const model: FileModel = new FileModel('DOC_0087.yaml', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('DOC_0087.yaml');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_8800
     * @tc.name      testUploadDownloadFileTypeCatalog0088
     * @tc.desc      Verify file type catalog entry 88 for DOC_0088.yml.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0088',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0088');
        try {
          const model: FileModel = new FileModel('DOC_0088.yml', false, ['f1', 'f2']);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_8900
     * @tc.name      testUploadDownloadFileTypeCatalog0089
     * @tc.desc      Verify file type catalog entry 89 for DOC_0089.docx.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0089',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0089');
        try {
          const model: FileModel = new FileModel('DOC_0089.docx', false, ['f1', 'f2']);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_9000
     * @tc.name      testUploadDownloadFileTypeCatalog0090
     * @tc.desc      Verify file type catalog entry 90 for DOC_0090.xlsx.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0090',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0090');
        try {
          const model: FileModel = new FileModel('DOC_0090.xlsx', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('DOC_0090.xlsx');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_9100
     * @tc.name      testUploadDownloadFileTypeCatalog0091
     * @tc.desc      Verify file type catalog entry 91 for backup.tar.gz.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0091',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0091');
        try {
          const model: FileModel = new FileModel('backup.tar.gz', false, ['f1', 'f2']);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_9200
     * @tc.name      testUploadDownloadFileTypeCatalog0092
     * @tc.desc      Verify file type catalog entry 92 for file.mp4.txt.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0092',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0092');
        try {
          const model: FileModel = new FileModel('file.mp4.txt', false, ['f1', 'f2']);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_9300
     * @tc.name      testUploadDownloadFileTypeCatalog0093
     * @tc.desc      Verify file type catalog entry 93 for photo.jpg.png.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0093',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0093');
        try {
          const model: FileModel = new FileModel('photo.jpg.png', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('photo.jpg.png');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_9400
     * @tc.name      testUploadDownloadFileTypeCatalog0094
     * @tc.desc      Verify file type catalog entry 94 for clip.txt.mp4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0094',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0094');
        try {
          const model: FileModel = new FileModel('clip.txt.mp4', false, ['f1', 'f2']);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_9500
     * @tc.name      testUploadDownloadFileTypeCatalog0095
     * @tc.desc      Verify file type catalog entry 95 for README.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0095',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0095');
        try {
          const model: FileModel = new FileModel('README', false, ['f1', 'f2']);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_9600
     * @tc.name      testUploadDownloadFileTypeCatalog0096
     * @tc.desc      Verify file type catalog entry 96 for .jpg.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0096',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0096');
        try {
          const model: FileModel = new FileModel('.jpg', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('.jpg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_9700
     * @tc.name      testUploadDownloadFileTypeCatalog0097
     * @tc.desc      Verify file type catalog entry 97 for music.MP3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0097',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0097');
        try {
          const model: FileModel = new FileModel('music.MP3', false, ['f1', 'f2']);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_9800
     * @tc.name      testUploadDownloadFileTypeCatalog0098
     * @tc.desc      Verify file type catalog entry 98 for video.MP4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0098',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0098');
        try {
          const model: FileModel = new FileModel('video.MP4', false, ['f1', 'f2']);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_9900
     * @tc.name      testUploadDownloadFileTypeCatalog0099
     * @tc.desc      Verify file type catalog entry 99 for image.JPG.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0099',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0099');
        try {
          const model: FileModel = new FileModel('image.JPG', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('image.JPG');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_10000
     * @tc.name      testUploadDownloadFileTypeCatalog0100
     * @tc.desc      Verify file type catalog entry 100 for IMG_2026_01_01 12_00_00.jpeg.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0100');
        try {
          const model: FileModel = new FileModel('IMG_2026_01_01 12_00_00.jpeg', false, ['f1', 'f2']);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_10100
     * @tc.name      testUploadDownloadFileTypeCatalog0101
     * @tc.desc      Verify file type catalog entry 101 for VID_2026-01-01_12-00-00.mp4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0101');
        try {
          const model: FileModel = new FileModel('VID_2026-01-01_12-00-00.mp4', false, ['f1', 'f2']);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_10200
     * @tc.name      testUploadDownloadFileTypeCatalog0102
     * @tc.desc      Verify file type catalog entry 102 for AUD_2026-01-01_12-00-00.mp3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0102');
        try {
          const model: FileModel = new FileModel('AUD_2026-01-01_12-00-00.mp3', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('AUD_2026-01-01_12-00-00.mp3');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_10300
     * @tc.name      testUploadDownloadFileTypeCatalog0103
     * @tc.desc      Verify file type catalog entry 103 for photo_final_v2.png.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0103',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0103');
        try {
          const model: FileModel = new FileModel('photo_final_v2.png', false, ['f1', 'f2']);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_10400
     * @tc.name      testUploadDownloadFileTypeCatalog0104
     * @tc.desc      Verify file type catalog entry 104 for report_final_2026.pdf.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0104',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0104');
        try {
          const model: FileModel = new FileModel('report_final_2026.pdf', false, ['f1', 'f2']);
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILETYPECATALOG_10500
     * @tc.name      testUploadDownloadFileTypeCatalog0105
     * @tc.desc      Verify file type catalog entry 105 for archive_backup_2026.zip.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileTypeCatalog0105',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFileTypeCatalog0105');
        try {
          const model: FileModel = new FileModel('archive_backup_2026.zip', false, ['f1', 'f2']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('archive_backup_2026.zip');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
