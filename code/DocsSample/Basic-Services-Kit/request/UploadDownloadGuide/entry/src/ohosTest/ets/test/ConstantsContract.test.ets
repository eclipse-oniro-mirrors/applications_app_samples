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
import { TOAST_BOTTOM, NO_IMAGE_SELECTED, BackgroundTaskState } from 'uploadanddownload';
import { FileType } from 'uploadanddownload';

export default function constantsContractTest(): void {
  describe('UploadDownloadConstantsContractTest', () => {
    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CONST_0100
     * @tc.name      testUploadDownloadConstants0001
     * @tc.desc      Verify toast bottom constant.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadConstants0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(TOAST_BOTTOM).assertEqual(200);
          expect(typeof TOAST_BOTTOM).assertEqual(typeof 200);
          expect(TOAST_BOTTOM === 200).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CONST_0200
     * @tc.name      testUploadDownloadConstants0002
     * @tc.desc      Verify no image selected constant.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadConstants0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(NO_IMAGE_SELECTED).assertEqual(-1);
          expect(typeof NO_IMAGE_SELECTED).assertEqual(typeof -1);
          expect(NO_IMAGE_SELECTED === -1).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CONST_0300
     * @tc.name      testUploadDownloadConstants0003
     * @tc.desc      Verify background none.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadConstants0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(BackgroundTaskState.NONE).assertEqual(0);
          expect(typeof BackgroundTaskState.NONE).assertEqual(typeof 0);
          expect(BackgroundTaskState.NONE === 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CONST_0400
     * @tc.name      testUploadDownloadConstants0004
     * @tc.desc      Verify background running.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadConstants0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(BackgroundTaskState.RUNNING).assertEqual(1);
          expect(typeof BackgroundTaskState.RUNNING).assertEqual(typeof 1);
          expect(BackgroundTaskState.RUNNING === 1).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CONST_0500
     * @tc.name      testUploadDownloadConstants0005
     * @tc.desc      Verify background pause.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadConstants0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(BackgroundTaskState.PAUSE).assertEqual(2);
          expect(typeof BackgroundTaskState.PAUSE).assertEqual(typeof 2);
          expect(BackgroundTaskState.PAUSE === 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CONST_0600
     * @tc.name      testUploadDownloadConstants0006
     * @tc.desc      Verify folder type.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadConstants0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(FileType.FOLDER).assertEqual('folder');
          expect(typeof FileType.FOLDER).assertEqual(typeof 'folder');
          expect(FileType.FOLDER === 'folder').assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CONST_0700
     * @tc.name      testUploadDownloadConstants0007
     * @tc.desc      Verify image type.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadConstants0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(FileType.IMAGE).assertEqual('image');
          expect(typeof FileType.IMAGE).assertEqual(typeof 'image');
          expect(FileType.IMAGE === 'image').assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CONST_0800
     * @tc.name      testUploadDownloadConstants0008
     * @tc.desc      Verify video type.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadConstants0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(FileType.Video).assertEqual('video');
          expect(typeof FileType.Video).assertEqual(typeof 'video');
          expect(FileType.Video === 'video').assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CONST_0900
     * @tc.name      testUploadDownloadConstants0009
     * @tc.desc      Verify music type.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadConstants0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(FileType.MUSIC).assertEqual('music');
          expect(typeof FileType.MUSIC).assertEqual(typeof 'music');
          expect(FileType.MUSIC === 'music').assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CONST_1000
     * @tc.name      testUploadDownloadConstants0010
     * @tc.desc      Verify document type.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadConstants0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(FileType.DOCUMENT).assertEqual('document');
          expect(typeof FileType.DOCUMENT).assertEqual(typeof 'document');
          expect(FileType.DOCUMENT === 'document').assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CONST_1100
     * @tc.name      testUploadDownloadConstants0011
     * @tc.desc      Verify background states are distinct.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadConstants0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(Number(BackgroundTaskState.NONE) !== Number(BackgroundTaskState.RUNNING)).assertTrue();
          expect(TOAST_BOTTOM > 0).assertTrue();
          expect(NO_IMAGE_SELECTED < 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CONST_1200
     * @tc.name      testUploadDownloadConstants0012
     * @tc.desc      Verify running differs from pause.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadConstants0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(Number(BackgroundTaskState.RUNNING) !== Number(BackgroundTaskState.PAUSE)).assertTrue();
          expect(TOAST_BOTTOM > 0).assertTrue();
          expect(NO_IMAGE_SELECTED < 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CONST_1300
     * @tc.name      testUploadDownloadConstants0013
     * @tc.desc      Verify folder differs from image.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadConstants0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(String(FileType.FOLDER) !== String(FileType.IMAGE)).assertTrue();
          expect(TOAST_BOTTOM > 0).assertTrue();
          expect(NO_IMAGE_SELECTED < 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CONST_1400
     * @tc.name      testUploadDownloadConstants0014
     * @tc.desc      Verify video differs from music.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadConstants0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(String(FileType.Video) !== String(FileType.MUSIC)).assertTrue();
          expect(TOAST_BOTTOM > 0).assertTrue();
          expect(NO_IMAGE_SELECTED < 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_CONST_1500
     * @tc.name      testUploadDownloadConstants0015
     * @tc.desc      Verify music differs from document.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadConstants0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(String(FileType.MUSIC) !== String(FileType.DOCUMENT)).assertTrue();
          expect(TOAST_BOTTOM > 0).assertTrue();
          expect(NO_IMAGE_SELECTED < 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
