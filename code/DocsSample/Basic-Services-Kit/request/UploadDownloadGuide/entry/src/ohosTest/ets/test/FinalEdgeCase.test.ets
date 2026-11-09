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

export default function finalEdgeCaseTest(): void {
  describe('UploadDownloadFinalEdgeCaseTest', () => {
    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FINAL_EDGE_0100
     * @tc.name      testUploadDownloadFinalEdgeCase0001
     * @tc.desc      Verify final extension edge case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFinalEdgeCase0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('final.docx', false, ['a', 'b', 'c']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.files.length).assertEqual(3);
          expect(model.name).assertEqual('final.docx');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FINAL_EDGE_0200
     * @tc.name      testUploadDownloadFinalEdgeCase0002
     * @tc.desc      Verify final extension edge case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFinalEdgeCase0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('final.xlsx', false, ['a', 'b', 'c']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.files.length).assertEqual(3);
          expect(model.name).assertEqual('final.xlsx');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FINAL_EDGE_0300
     * @tc.name      testUploadDownloadFinalEdgeCase0003
     * @tc.desc      Verify final extension edge case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFinalEdgeCase0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('final.pptx', false, ['a', 'b', 'c']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.files.length).assertEqual(3);
          expect(model.name).assertEqual('final.pptx');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FINAL_EDGE_0400
     * @tc.name      testUploadDownloadFinalEdgeCase0004
     * @tc.desc      Verify final extension edge case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFinalEdgeCase0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('final.rar', false, ['a', 'b', 'c']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.files.length).assertEqual(3);
          expect(model.name).assertEqual('final.rar');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_FINAL_EDGE_0500
     * @tc.name      testUploadDownloadFinalEdgeCase0005
     * @tc.desc      Verify final extension edge case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadFinalEdgeCase0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const model: FileModel = new FileModel('final.7z', false, ['a', 'b', 'c']);
          expect(model.fileType).assertEqual(FileType.DOCUMENT);
          expect(model.files.length).assertEqual(3);
          expect(model.name).assertEqual('final.7z');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
