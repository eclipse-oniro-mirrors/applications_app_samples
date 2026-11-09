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

export default function uploadDownloadBulkResidual2TestPart2(): void {
  describe('UploadDownloadBulkResidual2TestPart2', () => {
    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0001
     * @tc.name      testUploadDownloadBulkResidual2_0001
     * @tc.desc      Verify FileModel bulk2 classification case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_video_14.mp4', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_video_14.mp4');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0051
     * @tc.name      testUploadDownloadBulkResidual2_0051
     * @tc.desc      Verify FileModel bulk2 classification case 51.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0051',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_doc_00.txt', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_doc_00.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0052
     * @tc.name      testUploadDownloadBulkResidual2_0052
     * @tc.desc      Verify FileModel bulk2 classification case 52.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0052',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_doc_01.pdf', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_doc_01.pdf');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0053
     * @tc.name      testUploadDownloadBulkResidual2_0053
     * @tc.desc      Verify FileModel bulk2 classification case 53.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0053',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_doc_02.doc', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_doc_02.doc');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0054
     * @tc.name      testUploadDownloadBulkResidual2_0054
     * @tc.desc      Verify FileModel bulk2 classification case 54.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0054',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_doc_03.zip', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_doc_03.zip');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0055
     * @tc.name      testUploadDownloadBulkResidual2_0055
     * @tc.desc      Verify FileModel bulk2 classification case 55.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0055',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_doc_04.dat', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_doc_04.dat');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0056
     * @tc.name      testUploadDownloadBulkResidual2_0056
     * @tc.desc      Verify FileModel bulk2 classification case 56.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0056',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_doc_05.txt', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_doc_05.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0057
     * @tc.name      testUploadDownloadBulkResidual2_0057
     * @tc.desc      Verify FileModel bulk2 classification case 57.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0057',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_doc_06.pdf', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_doc_06.pdf');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0058
     * @tc.name      testUploadDownloadBulkResidual2_0058
     * @tc.desc      Verify FileModel bulk2 classification case 58.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0058',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_doc_07.doc', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_doc_07.doc');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0059
     * @tc.name      testUploadDownloadBulkResidual2_0059
     * @tc.desc      Verify FileModel bulk2 classification case 59.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0059',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_doc_08.zip', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_doc_08.zip');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0060
     * @tc.name      testUploadDownloadBulkResidual2_0060
     * @tc.desc      Verify FileModel bulk2 classification case 60.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0060',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_doc_09.dat', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_doc_09.dat');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0061
     * @tc.name      testUploadDownloadBulkResidual2_0061
     * @tc.desc      Verify FileModel bulk2 classification case 61.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0061',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_doc_10.txt', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_doc_10.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0062
     * @tc.name      testUploadDownloadBulkResidual2_0062
     * @tc.desc      Verify FileModel bulk2 classification case 62.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0062',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_doc_11.pdf', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_doc_11.pdf');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0063
     * @tc.name      testUploadDownloadBulkResidual2_0063
     * @tc.desc      Verify FileModel bulk2 classification case 63.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0063',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_doc_12.doc', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_doc_12.doc');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0064
     * @tc.name      testUploadDownloadBulkResidual2_0064
     * @tc.desc      Verify FileModel bulk2 classification case 64.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0064',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_doc_13.zip', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_doc_13.zip');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0065
     * @tc.name      testUploadDownloadBulkResidual2_0065
     * @tc.desc      Verify FileModel bulk2 classification case 65.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0065',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_doc_14.dat', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_doc_14.dat');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0066
     * @tc.name      testUploadDownloadBulkResidual2_0066
     * @tc.desc      Verify FileModel bulk2 classification case 66.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0066',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_doc_15.txt', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_doc_15.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0067
     * @tc.name      testUploadDownloadBulkResidual2_0067
     * @tc.desc      Verify FileModel bulk2 classification case 67.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0067',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_doc_16.pdf', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_doc_16.pdf');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0068
     * @tc.name      testUploadDownloadBulkResidual2_0068
     * @tc.desc      Verify FileModel bulk2 classification case 68.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0068',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_doc_17.doc', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_doc_17.doc');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0069
     * @tc.name      testUploadDownloadBulkResidual2_0069
     * @tc.desc      Verify FileModel bulk2 classification case 69.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0069',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_doc_18.zip', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_doc_18.zip');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0070
     * @tc.name      testUploadDownloadBulkResidual2_0070
     * @tc.desc      Verify FileModel bulk2 classification case 70.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0070',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_doc_19.dat', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_doc_19.dat');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0071
     * @tc.name      testUploadDownloadBulkResidual2_0071
     * @tc.desc      Verify FileModel bulk2 classification case 71.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0071',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_folder_00.jpg', true, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.FOLDER);
          expect(model.isFolder).assertTrue();
          expect(model.name).assertEqual('bulk_folder_00.jpg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0072
     * @tc.name      testUploadDownloadBulkResidual2_0072
     * @tc.desc      Verify FileModel bulk2 classification case 72.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0072',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_folder_01.jpg', true, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.FOLDER);
          expect(model.isFolder).assertTrue();
          expect(model.name).assertEqual('bulk_folder_01.jpg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0073
     * @tc.name      testUploadDownloadBulkResidual2_0073
     * @tc.desc      Verify FileModel bulk2 classification case 73.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0073',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_folder_02.jpg', true, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.FOLDER);
          expect(model.isFolder).assertTrue();
          expect(model.name).assertEqual('bulk_folder_02.jpg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0074
     * @tc.name      testUploadDownloadBulkResidual2_0074
     * @tc.desc      Verify FileModel bulk2 classification case 74.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0074',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_folder_03.jpg', true, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.FOLDER);
          expect(model.isFolder).assertTrue();
          expect(model.name).assertEqual('bulk_folder_03.jpg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0075
     * @tc.name      testUploadDownloadBulkResidual2_0075
     * @tc.desc      Verify FileModel bulk2 classification case 75.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0075',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_folder_04.jpg', true, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.FOLDER);
          expect(model.isFolder).assertTrue();
          expect(model.name).assertEqual('bulk_folder_04.jpg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0076
     * @tc.name      testUploadDownloadBulkResidual2_0076
     * @tc.desc      Verify FileModel bulk2 classification case 76.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0076',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_folder_05.jpg', true, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.FOLDER);
          expect(model.isFolder).assertTrue();
          expect(model.name).assertEqual('bulk_folder_05.jpg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0077
     * @tc.name      testUploadDownloadBulkResidual2_0077
     * @tc.desc      Verify FileModel bulk2 classification case 77.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0077',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_folder_06.jpg', true, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.FOLDER);
          expect(model.isFolder).assertTrue();
          expect(model.name).assertEqual('bulk_folder_06.jpg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0078
     * @tc.name      testUploadDownloadBulkResidual2_0078
     * @tc.desc      Verify FileModel bulk2 classification case 78.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0078',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_folder_07.jpg', true, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.FOLDER);
          expect(model.isFolder).assertTrue();
          expect(model.name).assertEqual('bulk_folder_07.jpg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0079
     * @tc.name      testUploadDownloadBulkResidual2_0079
     * @tc.desc      Verify FileModel bulk2 classification case 79.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0079',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_folder_08.jpg', true, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.FOLDER);
          expect(model.isFolder).assertTrue();
          expect(model.name).assertEqual('bulk_folder_08.jpg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0080
     * @tc.name      testUploadDownloadBulkResidual2_0080
     * @tc.desc      Verify FileModel bulk2 classification case 80.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0080',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_folder_09.jpg', true, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.FOLDER);
          expect(model.isFolder).assertTrue();
          expect(model.name).assertEqual('bulk_folder_09.jpg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0081
     * @tc.name      testUploadDownloadBulkResidual2_0081
     * @tc.desc      Verify FileModel bulk2 classification case 81.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0081',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('BULK.JPG', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('BULK.JPG');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0082
     * @tc.name      testUploadDownloadBulkResidual2_0082
     * @tc.desc      Verify FileModel bulk2 classification case 82.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0082',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('BULK.MP4', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('BULK.MP4');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0083
     * @tc.name      testUploadDownloadBulkResidual2_0083
     * @tc.desc      Verify FileModel bulk2 classification case 83.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0083',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('BULK.MP3', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('BULK.MP3');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0084
     * @tc.name      testUploadDownloadBulkResidual2_0084
     * @tc.desc      Verify FileModel bulk2 classification case 84.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0084',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('.hidden.jpg', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('.hidden.jpg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0085
     * @tc.name      testUploadDownloadBulkResidual2_0085
     * @tc.desc      Verify FileModel bulk2 classification case 85.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0085',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('.hidden.mp3', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('.hidden.mp3');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0086
     * @tc.name      testUploadDownloadBulkResidual2_0086
     * @tc.desc      Verify FileModel bulk2 classification case 86.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0086',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulknoext', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulknoext');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0087
     * @tc.name      testUploadDownloadBulkResidual2_0087
     * @tc.desc      Verify FileModel bulk2 classification case 87.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0087',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulkdot.', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulkdot.');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0088
     * @tc.name      testUploadDownloadBulkResidual2_0088
     * @tc.desc      Verify FileModel bulk2 classification case 88.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0088',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('   ', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('   ');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0089
     * @tc.name      testUploadDownloadBulkResidual2_0089
     * @tc.desc      Verify FileModel bulk2 classification case 89.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0089',
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0090
     * @tc.name      testUploadDownloadBulkResidual2_0090
     * @tc.desc      Verify FileModel bulk2 classification case 90.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0090',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('批量图片.jpg', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('批量图片.jpg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0091
     * @tc.name      testUploadDownloadBulkResidual2_0091
     * @tc.desc      Verify FileModel bulk2 classification case 91.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0091',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('批量歌曲.mp3', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('批量歌曲.mp3');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0092
     * @tc.name      testUploadDownloadBulkResidual2_0092
     * @tc.desc      Verify FileModel bulk2 classification case 92.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0092',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('批量视频.mp4', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('批量视频.mp4');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0093
     * @tc.name      testUploadDownloadBulkResidual2_0093
     * @tc.desc      Verify FileModel bulk2 classification case 93.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0093',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('批量文档.txt', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('批量文档.txt');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0094
     * @tc.name      testUploadDownloadBulkResidual2_0094
     * @tc.desc      Verify FileModel bulk2 classification case 94.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0094',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk.tar.gz', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk.tar.gz');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0095
     * @tc.name      testUploadDownloadBulkResidual2_0095
     * @tc.desc      Verify FileModel bulk2 classification case 95.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0095',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk.tar.mp4', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk.tar.mp4');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0096
     * @tc.name      testUploadDownloadBulkResidual2_0096
     * @tc.desc      Verify FileModel bulk2 classification case 96.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0096',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk.mp4.bak', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk.mp4.bak');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0097
     * @tc.name      testUploadDownloadBulkResidual2_0097
     * @tc.desc      Verify FileModel bulk2 classification case 97.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0097',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk file.jpg', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk file.jpg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0098
     * @tc.name      testUploadDownloadBulkResidual2_0098
     * @tc.desc      Verify FileModel bulk2 classification case 98.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0098',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel(' bulk.jpg', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual(' bulk.jpg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0099
     * @tc.name      testUploadDownloadBulkResidual2_0099
     * @tc.desc      Verify FileModel bulk2 classification case 99.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0099',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk.jpg ', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk.jpg ');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0100
     * @tc.name      testUploadDownloadBulkResidual2_0100
     * @tc.desc      Verify FileModel bulk2 classification case 100.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk/dir.png', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk/dir.png');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
