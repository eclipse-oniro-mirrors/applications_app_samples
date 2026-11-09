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

export default function uploadDownloadBulkResidual2Test(): void {
  describe('UploadDownloadBulkResidual2Test', () => {
    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0001
     * @tc.name      testUploadDownloadBulkResidual2_0001
     * @tc.desc      Verify FileModel bulk2 classification case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_img_00.jpg', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_img_00.jpg');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0002
     * @tc.name      testUploadDownloadBulkResidual2_0002
     * @tc.desc      Verify FileModel bulk2 classification case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_img_01.png', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_img_01.png');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0003
     * @tc.name      testUploadDownloadBulkResidual2_0003
     * @tc.desc      Verify FileModel bulk2 classification case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_img_02.jpeg', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_img_02.jpeg');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0004
     * @tc.name      testUploadDownloadBulkResidual2_0004
     * @tc.desc      Verify FileModel bulk2 classification case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_img_03.jpg', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_img_03.jpg');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0005
     * @tc.name      testUploadDownloadBulkResidual2_0005
     * @tc.desc      Verify FileModel bulk2 classification case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_img_04.png', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_img_04.png');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0006
     * @tc.name      testUploadDownloadBulkResidual2_0006
     * @tc.desc      Verify FileModel bulk2 classification case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_img_05.jpeg', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_img_05.jpeg');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0007
     * @tc.name      testUploadDownloadBulkResidual2_0007
     * @tc.desc      Verify FileModel bulk2 classification case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_img_06.jpg', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_img_06.jpg');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0008
     * @tc.name      testUploadDownloadBulkResidual2_0008
     * @tc.desc      Verify FileModel bulk2 classification case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_img_07.png', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_img_07.png');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0009
     * @tc.name      testUploadDownloadBulkResidual2_0009
     * @tc.desc      Verify FileModel bulk2 classification case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_img_08.jpeg', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_img_08.jpeg');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0010
     * @tc.name      testUploadDownloadBulkResidual2_0010
     * @tc.desc      Verify FileModel bulk2 classification case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_img_09.jpg', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_img_09.jpg');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0011
     * @tc.name      testUploadDownloadBulkResidual2_0011
     * @tc.desc      Verify FileModel bulk2 classification case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_img_10.png', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_img_10.png');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0012
     * @tc.name      testUploadDownloadBulkResidual2_0012
     * @tc.desc      Verify FileModel bulk2 classification case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_img_11.jpeg', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_img_11.jpeg');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0013
     * @tc.name      testUploadDownloadBulkResidual2_0013
     * @tc.desc      Verify FileModel bulk2 classification case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_img_12.jpg', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_img_12.jpg');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0014
     * @tc.name      testUploadDownloadBulkResidual2_0014
     * @tc.desc      Verify FileModel bulk2 classification case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_img_13.png', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_img_13.png');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0015
     * @tc.name      testUploadDownloadBulkResidual2_0015
     * @tc.desc      Verify FileModel bulk2 classification case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_img_14.jpeg', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_img_14.jpeg');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0016
     * @tc.name      testUploadDownloadBulkResidual2_0016
     * @tc.desc      Verify FileModel bulk2 classification case 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_img_15.jpg', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_img_15.jpg');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0017
     * @tc.name      testUploadDownloadBulkResidual2_0017
     * @tc.desc      Verify FileModel bulk2 classification case 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_img_16.png', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_img_16.png');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0018
     * @tc.name      testUploadDownloadBulkResidual2_0018
     * @tc.desc      Verify FileModel bulk2 classification case 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_img_17.jpeg', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_img_17.jpeg');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0019
     * @tc.name      testUploadDownloadBulkResidual2_0019
     * @tc.desc      Verify FileModel bulk2 classification case 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_img_18.jpg', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_img_18.jpg');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0020
     * @tc.name      testUploadDownloadBulkResidual2_0020
     * @tc.desc      Verify FileModel bulk2 classification case 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_img_19.png', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.IMAGE);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_img_19.png');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0021
     * @tc.name      testUploadDownloadBulkResidual2_0021
     * @tc.desc      Verify FileModel bulk2 classification case 21.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_music_00.mp3', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_music_00.mp3');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0022
     * @tc.name      testUploadDownloadBulkResidual2_0022
     * @tc.desc      Verify FileModel bulk2 classification case 22.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_music_01.mp3', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_music_01.mp3');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0023
     * @tc.name      testUploadDownloadBulkResidual2_0023
     * @tc.desc      Verify FileModel bulk2 classification case 23.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_music_02.mp3', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_music_02.mp3');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0024
     * @tc.name      testUploadDownloadBulkResidual2_0024
     * @tc.desc      Verify FileModel bulk2 classification case 24.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_music_03.mp3', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_music_03.mp3');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0025
     * @tc.name      testUploadDownloadBulkResidual2_0025
     * @tc.desc      Verify FileModel bulk2 classification case 25.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_music_04.mp3', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_music_04.mp3');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0026
     * @tc.name      testUploadDownloadBulkResidual2_0026
     * @tc.desc      Verify FileModel bulk2 classification case 26.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_music_05.mp3', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_music_05.mp3');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0027
     * @tc.name      testUploadDownloadBulkResidual2_0027
     * @tc.desc      Verify FileModel bulk2 classification case 27.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_music_06.mp3', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_music_06.mp3');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0028
     * @tc.name      testUploadDownloadBulkResidual2_0028
     * @tc.desc      Verify FileModel bulk2 classification case 28.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_music_07.mp3', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_music_07.mp3');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0029
     * @tc.name      testUploadDownloadBulkResidual2_0029
     * @tc.desc      Verify FileModel bulk2 classification case 29.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_music_08.mp3', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_music_08.mp3');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0030
     * @tc.name      testUploadDownloadBulkResidual2_0030
     * @tc.desc      Verify FileModel bulk2 classification case 30.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_music_09.mp3', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_music_09.mp3');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0031
     * @tc.name      testUploadDownloadBulkResidual2_0031
     * @tc.desc      Verify FileModel bulk2 classification case 31.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_music_10.mp3', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_music_10.mp3');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0032
     * @tc.name      testUploadDownloadBulkResidual2_0032
     * @tc.desc      Verify FileModel bulk2 classification case 32.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_music_11.mp3', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_music_11.mp3');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0033
     * @tc.name      testUploadDownloadBulkResidual2_0033
     * @tc.desc      Verify FileModel bulk2 classification case 33.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_music_12.mp3', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_music_12.mp3');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0034
     * @tc.name      testUploadDownloadBulkResidual2_0034
     * @tc.desc      Verify FileModel bulk2 classification case 34.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_music_13.mp3', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_music_13.mp3');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0035
     * @tc.name      testUploadDownloadBulkResidual2_0035
     * @tc.desc      Verify FileModel bulk2 classification case 35.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_music_14.mp3', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.MUSIC);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_music_14.mp3');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0036
     * @tc.name      testUploadDownloadBulkResidual2_0036
     * @tc.desc      Verify FileModel bulk2 classification case 36.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_video_00.mp4', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_video_00.mp4');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0037
     * @tc.name      testUploadDownloadBulkResidual2_0037
     * @tc.desc      Verify FileModel bulk2 classification case 37.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_video_01.mp4', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_video_01.mp4');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0038
     * @tc.name      testUploadDownloadBulkResidual2_0038
     * @tc.desc      Verify FileModel bulk2 classification case 38.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_video_02.mp4', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_video_02.mp4');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0039
     * @tc.name      testUploadDownloadBulkResidual2_0039
     * @tc.desc      Verify FileModel bulk2 classification case 39.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_video_03.mp4', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_video_03.mp4');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0040
     * @tc.name      testUploadDownloadBulkResidual2_0040
     * @tc.desc      Verify FileModel bulk2 classification case 40.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_video_04.mp4', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_video_04.mp4');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0041
     * @tc.name      testUploadDownloadBulkResidual2_0041
     * @tc.desc      Verify FileModel bulk2 classification case 41.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_video_05.mp4', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_video_05.mp4');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0042
     * @tc.name      testUploadDownloadBulkResidual2_0042
     * @tc.desc      Verify FileModel bulk2 classification case 42.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_video_06.mp4', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_video_06.mp4');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0043
     * @tc.name      testUploadDownloadBulkResidual2_0043
     * @tc.desc      Verify FileModel bulk2 classification case 43.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_video_07.mp4', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_video_07.mp4');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0044
     * @tc.name      testUploadDownloadBulkResidual2_0044
     * @tc.desc      Verify FileModel bulk2 classification case 44.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_video_08.mp4', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_video_08.mp4');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0045
     * @tc.name      testUploadDownloadBulkResidual2_0045
     * @tc.desc      Verify FileModel bulk2 classification case 45.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_video_09.mp4', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_video_09.mp4');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0046
     * @tc.name      testUploadDownloadBulkResidual2_0046
     * @tc.desc      Verify FileModel bulk2 classification case 46.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_video_10.mp4', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_video_10.mp4');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0047
     * @tc.name      testUploadDownloadBulkResidual2_0047
     * @tc.desc      Verify FileModel bulk2 classification case 47.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_video_11.mp4', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_video_11.mp4');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0048
     * @tc.name      testUploadDownloadBulkResidual2_0048
     * @tc.desc      Verify FileModel bulk2 classification case 48.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_video_12.mp4', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_video_12.mp4');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0049
     * @tc.name      testUploadDownloadBulkResidual2_0049
     * @tc.desc      Verify FileModel bulk2 classification case 49.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadBulkResidual2_0049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('bulk_video_13.mp4', false, []);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.Video);
          expect(model.isFolder).assertFalse();
          expect(model.name).assertEqual('bulk_video_13.mp4');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_BULK2_0050
     * @tc.name      testUploadDownloadBulkResidual2_0050
     * @tc.desc      Verify FileModel bulk2 classification case 50.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
  });
}
