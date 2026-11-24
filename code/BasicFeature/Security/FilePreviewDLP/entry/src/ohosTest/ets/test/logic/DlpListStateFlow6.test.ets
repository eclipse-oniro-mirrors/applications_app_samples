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

/** Logic checks for DlpListState flow (6 cases). */
export default function dlpListStateFlow6Test(): void {
  describe('DlpListStateFlow6Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0261
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0261
     * @tc.desc      DlpListState call flow sift > view > titleAt > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0261 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.view(-7);
      logInfo(`step2 view(-7): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.titleAt(101);
      logInfo(`step3 titleAt(101): step3=${step3}`);
      expect(step3).assertEqual('Text102');
      const step4: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step4 select(["not a url", "", "datashare...: step4=${step4}`);
      expect(step4).assertEqual(3);
      logInfo(`sift>view>titleAt>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`sift>view>titleAt>select final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray)).assertEqual('["not a url","","datashare:///media/image/1"]');
      logInfo(`sift>view>titleAt>select final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0261 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0262
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0262
     * @tc.desc      DlpListState call flow select > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0262 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step1 select(["not a url", "", "datashare...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: string = subject.view(25);
      logInfo(`step2 view(25): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`select>view final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`select>view final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray)).assertEqual('["not a url","","datashare:///media/image/1"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0262 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0263
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0263
     * @tc.desc      DlpListState call flow select > sift > view > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0263 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['file://media/Photo/1/IMG_1.jpg', 'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step1 select(["file://media/Photo/1/IMG_1...: step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.view(53.98);
      logInfo(`step3 view(53.98): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step4 select(["not a url", "", "datashare...: step4=${step4}`);
      expect(step4).assertEqual(5);
      logInfo(`select>sift>view>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(5);
      logInfo(`select>sift>view>select final: JSON.stringify(subje...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["file://media/Photo/1/IMG_1.jpg"]');
      logInfo(`select>sift>view>select final: JSON.stringify(subje...${JSON.stringify(subject.fileArray.slice(1, 4))}`);
      expect(JSON.stringify(subject.fileArray.slice(1, 4)))
        .assertEqual('["file://media/Photo/1/IMG_1.jpg","not a url",""]');
      logInfo(`select>sift>view>select final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0263 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0264
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0264
     * @tc.desc      DlpListState call flow select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0264 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['http://example.com/a.mp3', 'https://example.com/media/video.mp4',
        'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step1 select(["http://example.com/a.mp3",...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: number = subject.select(['http://example.com/a.mp3', 'https://example.com/media/video.mp4',
        'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step2 select(["http://example.com/a.mp3",...: step2=${step2}`);
      expect(step2).assertEqual(6);
      logInfo(`select>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(6);
      logInfo(`select>select final: JSON.stringify(subject.fileArr...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`select>select final: JSON.stringify(subject.fileArr...${JSON.stringify(subject.fileArray.slice(3, 4))}`);
      expect(JSON.stringify(subject.fileArray.slice(3, 4))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0264 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0265
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0265
     * @tc.desc      DlpListState call flow select > view > sift > select > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0265 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3',
        'file://media/Photo/1/IMG_1.jpg', 'datashare:///media/image/1', '']);
      logInfo(`step1 select(["https://example.com/media/...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: string = subject.view(60);
      logInfo(`step2 view(60): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.select(['file://media/Photo/1/IMG_1.jpg', 'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step4 select(["file://media/Photo/1/IMG_1...: step4=${step4}`);
      expect(step4).assertEqual(5);
      const step5: number = subject.sift();
      logInfo(`step5 sift(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`select>view>sift>select>sift final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(5);
      logInfo(`select>view>sift>select>sift final: JSON.stringify(...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`select>view>sift>select>sift final: JSON.stringify(...${JSON.stringify(subject.fileArray.slice(2, 3))}`);
      expect(JSON.stringify(subject.fileArray.slice(2, 3))).assertEqual('["file://media/Photo/1/IMG_1.jpg"]');
      logInfo(`select>view>sift>select>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0265 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0266
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0266
     * @tc.desc      DlpListState call flow view > view > sift > view > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0266 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(-36);
      logInfo(`step1 view(-36): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.view(8);
      logInfo(`step2 view(8): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.view(55);
      logInfo(`step4 view(55): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step5 select(["not a url", "", "datashare...: step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`view>view>sift>view>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`view>view>sift>view>select final: JSON.stringify(subject.fileAr...${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray)).assertEqual('["not a url","","datashare:///media/image/1"]');
      logInfo(`view>view>sift>view>select final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0266 end`);
    });
  });
}
