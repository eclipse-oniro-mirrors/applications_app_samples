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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../../utils/EventLoopYield';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { DlpListState } from '../model/FilePreviewDlpLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FilePreviewDLP]';
const BUNDLE: string = 'FilePreviewDLP_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for DlpListState.select (8 cases). */
export default function dlpListStateSelectTest(): void {
  describe('DlpListStateSelectTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_SELECT_0001
     * @tc.name      FilePreviewDLP_DlpListStateSelect_0001
     * @tc.desc      DlpListState.select(uris=[]) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_DlpListStateSelect_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DlpListStateSelect_0001 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: number = subject.select([]);
      logInfo(`select(uris=[]): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DlpListStateSelect_0001 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_SELECT_0002
     * @tc.name      FilePreviewDLP_DlpListStateSelect_0002
     * @tc.desc      DlpListState.select(uris=[""]) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_DlpListStateSelect_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DlpListStateSelect_0002 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: number = subject.select(['']);
      logInfo(`select(uris=[""]): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`select(uris=[""]) state: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(1);
      logInfo(`select(uris=[""]) state: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray)).assertEqual('[""]');
      logInfo(`${BUNDLE}DlpListStateSelect_0002 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_SELECT_0003
     * @tc.name      FilePreviewDLP_DlpListStateSelect_0003
     * @tc.desc      DlpListState.select(uris=["", "x"]) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateSelect_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateSelect_0003 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: number = subject.select(['', 'x']);
      logInfo(`select(uris=["", "x"]): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`select(uris=["", "x"]) state: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(2);
      logInfo(`select(uris=["", "x"]) state: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray)).assertEqual('["","x"]');
      logInfo(`${BUNDLE}DlpListStateSelect_0003 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_SELECT_0004
     * @tc.name      FilePreviewDLP_DlpListStateSelect_0004
     * @tc.desc      DlpListState.select(uris=["x", "", "https://example.com/media/video.mp4"]) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateSelect_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateSelect_0004 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: number = subject.select(['x', '', 'https://example.com/media/video.mp4']);
      logInfo(`select(uris=["x", "", "https://example.co...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`select(uris=["x", "", "https://example.co...: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`select(uris=["x", "", "https://example.co...: JSON.stringify(su...${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray)).assertEqual('["x","","https://example.com/media/video.mp4"]');
      logInfo(`${BUNDLE}DlpListStateSelect_0004 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_SELECT_0005
     * @tc.name      FilePreviewDLP_DlpListStateSelect_0005
     * @tc.desc      DlpListState.select(uris=["https://example.com/media/video.mp4", "https://example.com/media/vide...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateSelect_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateSelect_0005 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: number = subject.select(['https://example.com/media/video.mp4',
        'https://example.com/media/video.mp4']);
      logInfo(`select(uris=["https://example.com/media/v...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`select(uris=["https://example.com/media/v...: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(2);
      logInfo(`select(uris=["https://example.com/media/v...: JSON....${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`select(uris=["https://example.com/media/v...: JSON....${JSON.stringify(subject.fileArray.slice(1, 2))}`);
      expect(JSON.stringify(subject.fileArray.slice(1, 2))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`${BUNDLE}DlpListStateSelect_0005 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_SELECT_0006
     * @tc.name      FilePreviewDLP_DlpListStateSelect_0006
     * @tc.desc      DlpListState.select(uris=["", "x", "https://example.com/media/video.mp4", "http://example.com/a....
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateSelect_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateSelect_0006 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: number = subject.select(['', 'x', 'https://example.com/media/video.mp4', 'http://example.com/a.mp3',
        'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`select(uris=["", "x", "https://example.co...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`select(uris=["", "x", "https://example.co...: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`select(uris=["", "x", "https://example.co...: JSON.stringify(su...${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray)).assertEqual('["","x","https://example.com/media/video.mp4"]');
      logInfo(`${BUNDLE}DlpListStateSelect_0006 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_SELECT_0007
     * @tc.name      FilePreviewDLP_DlpListStateSelect_0007
     * @tc.desc      DlpListState.select(uris=["http://example.com/a.mp3", "x", "file://media/Photo/1/IMG_1.jpg", "x"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateSelect_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateSelect_0007 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: number = subject.select(['http://example.com/a.mp3', 'x', 'file://media/Photo/1/IMG_1.jpg', 'x',
        'datashare:///media/image/1']);
      logInfo(`select(uris=["http://example.com/a.mp3", ...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`select(uris=["http://example.com/a.mp3", ...: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`select(uris=["http://example.com/a.mp3", ...: JSON.stringify(su...${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["http://example.com/a.mp3","x","file://media/Photo/1/IMG_1.jpg"]');
      logInfo(`${BUNDLE}DlpListStateSelect_0007 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_SELECT_0008
     * @tc.name      FilePreviewDLP_DlpListStateSelect_0008
     * @tc.desc      DlpListState.select(uris=["datashare:///media/image/1", "file://media/Photo/1/IMG_1.jpg", "http:...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateSelect_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateSelect_0008 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: number = subject.select(['datashare:///media/image/1', 'file://media/Photo/1/IMG_1.jpg',
        'http://example.com/a.mp3', 'https://example.com/media/video.mp4', 'x', '']);
      logInfo(`select(uris=["datashare:///media/image/1"...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`select(uris=["datashare:///media/image/1"...: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`select(uris=["datashare:///media/image/1"...: JSON....${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["datashare:///media/image/1"]');
      logInfo(`select(uris=["datashare:///media/image/1"...: JSON....${JSON.stringify(subject.fileArray.slice(1, 2))}`);
      expect(JSON.stringify(subject.fileArray.slice(1, 2))).assertEqual('["file://media/Photo/1/IMG_1.jpg"]');
      logInfo(`${BUNDLE}DlpListStateSelect_0008 end`);
    });
  });
}
