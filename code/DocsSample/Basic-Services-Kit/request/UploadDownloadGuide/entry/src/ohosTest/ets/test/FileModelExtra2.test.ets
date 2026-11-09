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

export default function fileModelExtra2Test(): void {
  describe('UploadDownloadFileModelExtra2Test', () => {
    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA2_0100
     * @tc.name      testUploadDownloadFileModelExtra20001
     * @tc.desc      Verify additional suffix case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra20001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('g.gif', false, ['f1', 'f2']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('g.gif');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA2_0200
     * @tc.name      testUploadDownloadFileModelExtra20002
     * @tc.desc      Verify additional suffix case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra20002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('h.webp', false, ['f1', 'f2']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('h.webp');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA2_0300
     * @tc.name      testUploadDownloadFileModelExtra20003
     * @tc.desc      Verify additional suffix case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra20003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('i.svg', false, ['f1', 'f2']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('i.svg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA2_0400
     * @tc.name      testUploadDownloadFileModelExtra20004
     * @tc.desc      Verify additional suffix case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra20004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('j.heic', false, ['f1', 'f2']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('j.heic');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA2_0500
     * @tc.name      testUploadDownloadFileModelExtra20005
     * @tc.desc      Verify additional suffix case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra20005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('k.mov', false, ['f1', 'f2']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('k.mov');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA2_0600
     * @tc.name      testUploadDownloadFileModelExtra20006
     * @tc.desc      Verify additional suffix case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra20006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('l.avi', false, ['f1', 'f2']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('l.avi');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA2_0700
     * @tc.name      testUploadDownloadFileModelExtra20007
     * @tc.desc      Verify additional suffix case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra20007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('m.mkv', false, ['f1', 'f2']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('m.mkv');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA2_0800
     * @tc.name      testUploadDownloadFileModelExtra20008
     * @tc.desc      Verify additional suffix case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra20008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('n.wav', false, ['f1', 'f2']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('n.wav');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA2_0900
     * @tc.name      testUploadDownloadFileModelExtra20009
     * @tc.desc      Verify additional suffix case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra20009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('o.flac', false, ['f1', 'f2']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('o.flac');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA2_1000
     * @tc.name      testUploadDownloadFileModelExtra20010
     * @tc.desc      Verify additional suffix case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra20010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('p.aac', false, ['f1', 'f2']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('p.aac');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA2_1100
     * @tc.name      testUploadDownloadFileModelExtra20011
     * @tc.desc      Verify additional suffix case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra20011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('q.ogg', false, ['f1', 'f2']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('q.ogg');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA2_1200
     * @tc.name      testUploadDownloadFileModelExtra20012
     * @tc.desc      Verify additional suffix case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra20012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('r.opus', false, ['f1', 'f2']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('r.opus');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA2_1300
     * @tc.name      testUploadDownloadFileModelExtra20013
     * @tc.desc      Verify additional suffix case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra20013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('s.3gp', false, ['f1', 'f2']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('s.3gp');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA2_1400
     * @tc.name      testUploadDownloadFileModelExtra20014
     * @tc.desc      Verify additional suffix case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra20014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('t.m4v', false, ['f1', 'f2']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('t.m4v');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FILEMODEL_EXTRA2_1500
     * @tc.name      testUploadDownloadFileModelExtra20015
     * @tc.desc      Verify additional suffix case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFileModelExtra20015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('u.vcf', false, ['f1', 'f2']);
          hilog.info(DOMAIN, TAG, 'model: %{public}s', model.name);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.files.length).assertEqual(2);
          expect(model.name).assertEqual('u.vcf');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
