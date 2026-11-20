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

/** Logic checks for DlpListState flow (53 cases). */
export default function dlpListStateFlow2Test(): void {
  describe('DlpListStateFlow2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0053
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0053
     * @tc.desc      DlpListState call flow select > view > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0053 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step1 select(["not a url", "", "datashare...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: string = subject.view(199);
      logInfo(`step2 view(199): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step3 select(["https://example.com/media/...: step3=${step3}`);
      expect(step3).assertEqual(5);
      logInfo(`select>view>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(5);
      logInfo(`select>view>select final: JSON.stringify(subject.fi...${JSON.stringify(subject.fileArray.slice(0, 3))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 3)))
        .assertEqual('["not a url","","datashare:///media/image/1"]');
      logInfo(`select>view>select final: JSON.stringify(subject.fi...${JSON.stringify(subject.fileArray.slice(3, 4))}`);
      expect(JSON.stringify(subject.fileArray.slice(3, 4))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0054
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0054
     * @tc.desc      DlpListState call flow sift > view > view > titleAt > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0054 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.view(21);
      logInfo(`step2 view(21): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.view(0);
      logInfo(`step3 view(0): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.titleAt(52.98);
      logInfo(`step4 titleAt(52.98): step4=${step4}`);
      expect(step4).assertEqual('Text53.98');
      const step5: number = subject.sift();
      logInfo(`step5 sift(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`sift>view>view>titleAt>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0054 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0055
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0055
     * @tc.desc      DlpListState call flow titleAt > sift > titleAt > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0055 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(200);
      logInfo(`step1 titleAt(200): step1=${step1}`);
      expect(step1).assertEqual('Text201');
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.titleAt(15.43);
      logInfo(`step3 titleAt(15.43): step3=${step3}`);
      expect(step3).assertEqual('Text16.43');
      const step4: string = subject.titleAt(35);
      logInfo(`step4 titleAt(35): step4=${step4}`);
      expect(step4).assertEqual('Text36');
      logInfo(`titleAt>sift>titleAt>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0056
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0056
     * @tc.desc      DlpListState call flow select > titleAt > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0056 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['file://media/Photo/1/IMG_1.jpg', 'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step1 select(["file://media/Photo/1/IMG_1...: step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: string = subject.titleAt(-2);
      logInfo(`step2 titleAt(-2): step2=${step2}`);
      expect(step2).assertEqual('Text-1');
      const step3: string = subject.view(101);
      logInfo(`step3 view(101): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`select>titleAt>view final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(2);
      logInfo(`select>titleAt>view final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["file://media/Photo/1/IMG_1.jpg","file://media/Photo/1/IMG_1.jpg"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0056 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0057
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0057
     * @tc.desc      DlpListState call flow titleAt > select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0057 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(70);
      logInfo(`step1 titleAt(70): step1=${step1}`);
      expect(step1).assertEqual('Text71');
      const step2: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step2 select(["https://example.com/media/...: step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.select(['https://example.com/media/video.mp4']);
      logInfo(`step3 select(["https://example.com/media/...: step3=${step3}`);
      expect(step3).assertEqual(3);
      logInfo(`titleAt>select>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`titleAt>select>select final: JSON.stringify(subject...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`titleAt>select>select final: JSON.stringify(subject...${JSON.stringify(subject.fileArray.slice(1, 2))}`);
      expect(JSON.stringify(subject.fileArray.slice(1, 2))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0058
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0058
     * @tc.desc      DlpListState call flow titleAt > view > titleAt > select > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0058 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(24.71);
      logInfo(`step1 titleAt(24.71): step1=${step1}`);
      expect(step1).assertEqual('Text25.71');
      const step2: string = subject.view(190);
      logInfo(`step2 view(190): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.titleAt(134);
      logInfo(`step3 titleAt(134): step3=${step3}`);
      expect(step3).assertEqual('Text135');
      const step4: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step4 select(["not a url", "", "datashare...: step4=${step4}`);
      expect(step4).assertEqual(3);
      const step5: string = subject.view(-77);
      logInfo(`step5 view(-77): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`titleAt>view>titleAt>select>view final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`titleAt>view>titleAt>select>view final: JSON.stringify(subject....${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray)).assertEqual('["not a url","","datashare:///media/image/1"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0059
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0059
     * @tc.desc      DlpListState call flow select > titleAt > sift > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0059 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['datashare:///media/image/1', 'http://example.com/a.mp3', '',
        'http://example.com/a.mp3', 'not a url']);
      logInfo(`step1 select(["datashare:///media/image/1...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: string = subject.titleAt(76);
      logInfo(`step2 titleAt(76): step2=${step2}`);
      expect(step2).assertEqual('Text77');
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.sift();
      logInfo(`step4 sift(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`select>titleAt>sift>sift final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`select>titleAt>sift>sift final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["datashare:///media/image/1","http://example.com/a.mp3",""]');
      logInfo(`select>titleAt>sift>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0059 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0060
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0060
     * @tc.desc      DlpListState call flow select > titleAt > select > titleAt > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0060 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3',
        'file://media/Photo/1/IMG_1.jpg', 'datashare:///media/image/1', '']);
      logInfo(`step1 select(["https://example.com/media/...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: string = subject.titleAt(30.61);
      logInfo(`step2 titleAt(30.61): step2=${step2}`);
      expect(step2).assertEqual('Text31.61');
      const step3: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step3 select(["https://example.com/media/...: step3=${step3}`);
      expect(step3).assertEqual(5);
      const step4: string = subject.titleAt(15.43);
      logInfo(`step4 titleAt(15.43): step4=${step4}`);
      expect(step4).assertEqual('Text16.43');
      const step5: string = subject.view(15);
      logInfo(`step5 view(15): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`select>titleAt>select>titleAt>view final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(5);
      logInfo(`select>titleAt>select>titleAt>view final: JSON.stri...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`select>titleAt>select>titleAt>view final: JSON.stri...${JSON.stringify(subject.fileArray.slice(2, 3))}`);
      expect(JSON.stringify(subject.fileArray.slice(2, 3))).assertEqual('["file://media/Photo/1/IMG_1.jpg"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0060 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0061
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0061
     * @tc.desc      DlpListState call flow titleAt > view > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0061 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(25);
      logInfo(`step1 titleAt(25): step1=${step1}`);
      expect(step1).assertEqual('Text26');
      const step2: string = subject.view(26.24);
      logInfo(`step2 view(26.24): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step3 select(["not a url", "", "datashare...: step3=${step3}`);
      expect(step3).assertEqual(3);
      logInfo(`titleAt>view>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`titleAt>view>select final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray)).assertEqual('["not a url","","datashare:///media/image/1"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0061 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0062
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0062
     * @tc.desc      DlpListState call flow view > view > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0062 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(21);
      logInfo(`step1 view(21): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.view(26.24);
      logInfo(`step2 view(26.24): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.view(176);
      logInfo(`step3 view(176): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateFlow_0062 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0063
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0063
     * @tc.desc      DlpListState call flow view > view > sift > titleAt > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0063 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(20);
      logInfo(`step1 view(20): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.view(135);
      logInfo(`step2 view(135): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.titleAt(19.39);
      logInfo(`step4 titleAt(19.39): step4=${step4}`);
      expect(step4).assertEqual('Text20.39');
      const step5: string = subject.titleAt(179);
      logInfo(`step5 titleAt(179): step5=${step5}`);
      expect(step5).assertEqual('Text180');
      logInfo(`view>view>sift>titleAt>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0063 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0064
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0064
     * @tc.desc      DlpListState call flow sift > titleAt > select > titleAt > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0064 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.titleAt(166);
      logInfo(`step2 titleAt(166): step2=${step2}`);
      expect(step2).assertEqual('Text167');
      const step3: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step3 select(["https://example.com/media/...: step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: string = subject.titleAt(15);
      logInfo(`step4 titleAt(15): step4=${step4}`);
      expect(step4).assertEqual('Text16');
      const step5: string = subject.titleAt(4.72);
      logInfo(`step5 titleAt(4.72): step5=${step5}`);
      expect(step5).assertEqual('Text5.72');
      logInfo(`sift>titleAt>select>titleAt>titleAt final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(2);
      logInfo(`sift>titleAt>select>titleAt>titleAt final: JSON.stringify(subje...${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["https://example.com/media/video.mp4","http://example.com/a.mp3"]');
      logInfo(`sift>titleAt>select>titleAt>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0064 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0065
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0065
     * @tc.desc      DlpListState call flow titleAt > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0065 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(96);
      logInfo(`step1 titleAt(96): step1=${step1}`);
      expect(step1).assertEqual('Text97');
      const step2: string = subject.titleAt(25);
      logInfo(`step2 titleAt(25): step2=${step2}`);
      expect(step2).assertEqual('Text26');
      logInfo(`${BUNDLE}DlpListStateFlow_0065 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0066
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0066
     * @tc.desc      DlpListState call flow sift > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0066 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.titleAt(54.81);
      logInfo(`step2 titleAt(54.81): step2=${step2}`);
      expect(step2).assertEqual('Text55.81');
      logInfo(`sift>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0066 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0067
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0067
     * @tc.desc      DlpListState call flow select > sift > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0067 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['https://example.com/media/video.mp4']);
      logInfo(`step1 select(["https://example.com/media/...: step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.view(88);
      logInfo(`step3 view(88): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`select>sift>view final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(1);
      logInfo(`select>sift>view final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray)).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`select>sift>view final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0067 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0068
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0068
     * @tc.desc      DlpListState call flow titleAt > titleAt > view > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0068 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(162);
      logInfo(`step1 titleAt(162): step1=${step1}`);
      expect(step1).assertEqual('Text163');
      const step2: string = subject.titleAt(80);
      logInfo(`step2 titleAt(80): step2=${step2}`);
      expect(step2).assertEqual('Text81');
      const step3: string = subject.view(72.54);
      logInfo(`step3 view(72.54): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.sift();
      logInfo(`step4 sift(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`titleAt>titleAt>view>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0068 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0069
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0069
     * @tc.desc      DlpListState call flow view > select > titleAt > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0069 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(24);
      logInfo(`step1 view(24): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.select(['https://example.com/media/video.mp4']);
      logInfo(`step2 select(["https://example.com/media/...: step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.titleAt(15);
      logInfo(`step3 titleAt(15): step3=${step3}`);
      expect(step3).assertEqual('Text16');
      const step4: string = subject.titleAt(182);
      logInfo(`step4 titleAt(182): step4=${step4}`);
      expect(step4).assertEqual('Text183');
      logInfo(`view>select>titleAt>titleAt final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(1);
      logInfo(`view>select>titleAt>titleAt final: JSON.stringify(subject.fileA...${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray)).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0069 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0070
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0070
     * @tc.desc      DlpListState call flow sift > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0070 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(2);
      logInfo(`sift>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0070 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0071
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0071
     * @tc.desc      DlpListState call flow select > sift > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0071 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step1 select(["https://example.com/media/...: step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.titleAt(52.98);
      logInfo(`step3 titleAt(52.98): step3=${step3}`);
      expect(step3).assertEqual('Text53.98');
      logInfo(`select>sift>titleAt final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(2);
      logInfo(`select>sift>titleAt final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["https://example.com/media/video.mp4","http://example.com/a.mp3"]');
      logInfo(`select>sift>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0071 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0072
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0072
     * @tc.desc      DlpListState call flow titleAt > titleAt > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0072 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(47.97);
      logInfo(`step1 titleAt(47.97): step1=${step1}`);
      expect(step1).assertEqual('Text48.97');
      const step2: string = subject.titleAt(140);
      logInfo(`step2 titleAt(140): step2=${step2}`);
      expect(step2).assertEqual('Text141');
      const step3: string = subject.titleAt(46.54);
      logInfo(`step3 titleAt(46.54): step3=${step3}`);
      expect(step3).assertEqual('Text47.54');
      logInfo(`${BUNDLE}DlpListStateFlow_0072 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0073
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0073
     * @tc.desc      DlpListState call flow titleAt > select > titleAt > select > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0073 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(105);
      logInfo(`step1 titleAt(105): step1=${step1}`);
      expect(step1).assertEqual('Text106');
      const step2: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step2 select(["https://example.com/media/...: step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: string = subject.titleAt(30.61);
      logInfo(`step3 titleAt(30.61): step3=${step3}`);
      expect(step3).assertEqual('Text31.61');
      const step4: number = subject.select(['datashare:///media/image/1', 'http://example.com/a.mp3', '',
        'http://example.com/a.mp3', 'not a url']);
      logInfo(`step4 select(["datashare:///media/image/1...: step4=${step4}`);
      expect(step4).assertEqual(5);
      const step5: number = subject.sift();
      logInfo(`step5 sift(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`titleAt>select>titleAt>select>sift final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(5);
      logInfo(`titleAt>select>titleAt>select>sift final: JSON.stri...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`titleAt>select>titleAt>select>sift final: JSON.stri...${JSON.stringify(subject.fileArray.slice(2, 3))}`);
      expect(JSON.stringify(subject.fileArray.slice(2, 3))).assertEqual('["datashare:///media/image/1"]');
      logInfo(`titleAt>select>titleAt>select>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0073 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0074
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0074
     * @tc.desc      DlpListState call flow view > select > view > select > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0074 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(185);
      logInfo(`step1 view(185): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.select(['file://media/Photo/1/IMG_1.jpg', 'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step2 select(["file://media/Photo/1/IMG_1...: step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: string = subject.view(53.98);
      logInfo(`step3 view(53.98): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.select(['file://media/Photo/1/IMG_1.jpg', 'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step4 select(["file://media/Photo/1/IMG_1...: step4=${step4}`);
      expect(step4).assertEqual(4);
      const step5: string = subject.view(29);
      logInfo(`step5 view(29): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`view>select>view>select>view final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(4);
      logInfo(`view>select>view>select>view final: JSON.stringify(...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["file://media/Photo/1/IMG_1.jpg"]');
      logInfo(`view>select>view>select>view final: JSON.stringify(...${JSON.stringify(subject.fileArray.slice(2, 3))}`);
      expect(JSON.stringify(subject.fileArray.slice(2, 3))).assertEqual('["file://media/Photo/1/IMG_1.jpg"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0074 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0075
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0075
     * @tc.desc      DlpListState call flow titleAt > view > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0075 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(-82);
      logInfo(`step1 titleAt(-82): step1=${step1}`);
      expect(step1).assertEqual('Text-81');
      const step2: string = subject.view(153);
      logInfo(`step2 view(153): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3',
        'file://media/Photo/1/IMG_1.jpg', 'datashare:///media/image/1', '']);
      logInfo(`step3 select(["https://example.com/media/...: step3=${step3}`);
      expect(step3).assertEqual(3);
      logInfo(`titleAt>view>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`titleAt>view>select final: JSON.stringify(subject.f...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`titleAt>view>select final: JSON.stringify(subject.f...${JSON.stringify(subject.fileArray.slice(1, 2))}`);
      expect(JSON.stringify(subject.fileArray.slice(1, 2))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0075 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0076
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0076
     * @tc.desc      DlpListState call flow titleAt > view > sift > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0076 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(162);
      logInfo(`step1 titleAt(162): step1=${step1}`);
      expect(step1).assertEqual('Text163');
      const step2: string = subject.view(24);
      logInfo(`step2 view(24): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.titleAt(80);
      logInfo(`step4 titleAt(80): step4=${step4}`);
      expect(step4).assertEqual('Text81');
      logInfo(`titleAt>view>sift>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0076 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0077
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0077
     * @tc.desc      DlpListState call flow titleAt > titleAt > select > select > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0077 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(97);
      logInfo(`step1 titleAt(97): step1=${step1}`);
      expect(step1).assertEqual('Text98');
      const step2: string = subject.titleAt(182);
      logInfo(`step2 titleAt(182): step2=${step2}`);
      expect(step2).assertEqual('Text183');
      const step3: number = subject.select(['https://example.com/media/video.mp4']);
      logInfo(`step3 select(["https://example.com/media/...: step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step4 select(["https://example.com/media/...: step4=${step4}`);
      expect(step4).assertEqual(3);
      const step5: number = subject.sift();
      logInfo(`step5 sift(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`titleAt>titleAt>select>select>sift final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`titleAt>titleAt>select>select>sift final: JSON.stri...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`titleAt>titleAt>select>select>sift final: JSON.stri...${JSON.stringify(subject.fileArray.slice(1, 2))}`);
      expect(JSON.stringify(subject.fileArray.slice(1, 2))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`titleAt>titleAt>select>select>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0077 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0078
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0078
     * @tc.desc      DlpListState call flow select > select > select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0078 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step1 select(["https://example.com/media/...: step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.select(['https://example.com/media/video.mp4']);
      logInfo(`step2 select(["https://example.com/media/...: step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step3 select(["not a url", "", "datashare...: step3=${step3}`);
      expect(step3).assertEqual(6);
      const step4: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step4 select(["https://example.com/media/...: step4=${step4}`);
      expect(step4).assertEqual(8);
      logInfo(`select>select>select>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(8);
      logInfo(`select>select>select>select final: JSON.stringify(s...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`select>select>select>select final: JSON.stringify(s...${JSON.stringify(subject.fileArray.slice(5, 6))}`);
      expect(JSON.stringify(subject.fileArray.slice(5, 6))).assertEqual('["datashare:///media/image/1"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0078 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0079
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0079
     * @tc.desc      DlpListState call flow sift > select > view > select > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0079 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.select(['datashare:///media/image/1', 'http://example.com/a.mp3', '',
        'http://example.com/a.mp3', 'not a url']);
      logInfo(`step2 select(["datashare:///media/image/1...: step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: string = subject.view(158);
      logInfo(`step3 view(158): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.select(['https://example.com/media/video.mp4']);
      logInfo(`step4 select(["https://example.com/media/...: step4=${step4}`);
      expect(step4).assertEqual(4);
      const step5: string = subject.view(137);
      logInfo(`step5 view(137): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`sift>select>view>select>view final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(4);
      logInfo(`sift>select>view>select>view final: JSON.stringify(...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["datashare:///media/image/1"]');
      logInfo(`sift>select>view>select>view final: JSON.stringify(...${JSON.stringify(subject.fileArray.slice(1, 3))}`);
      expect(JSON.stringify(subject.fileArray.slice(1, 3))).assertEqual('["http://example.com/a.mp3",""]');
      logInfo(`sift>select>view>select>view final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0079 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0080
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0080
     * @tc.desc      DlpListState call flow titleAt > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0080 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(-2);
      logInfo(`step1 titleAt(-2): step1=${step1}`);
      expect(step1).assertEqual('Text-1');
      const step2: string = subject.titleAt(129);
      logInfo(`step2 titleAt(129): step2=${step2}`);
      expect(step2).assertEqual('Text130');
      logInfo(`${BUNDLE}DlpListStateFlow_0080 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0081
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0081
     * @tc.desc      DlpListState call flow select > select > select > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0081 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['http://example.com/a.mp3', 'https://example.com/media/video.mp4',
        'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step1 select(["http://example.com/a.mp3",...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: number = subject.select(['datashare:///media/image/1', 'http://example.com/a.mp3', '',
        'http://example.com/a.mp3', 'not a url']);
      logInfo(`step2 select(["datashare:///media/image/1...: step2=${step2}`);
      expect(step2).assertEqual(6);
      const step3: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step3 select(["not a url", "", "datashare...: step3=${step3}`);
      expect(step3).assertEqual(9);
      const step4: number = subject.sift();
      logInfo(`step4 sift(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`select>select>select>sift final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(9);
      logInfo(`select>select>select>sift final: JSON.stringify(sub...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`select>select>select>sift final: JSON.stringify(sub...${JSON.stringify(subject.fileArray.slice(3, 4))}`);
      expect(JSON.stringify(subject.fileArray.slice(3, 4))).assertEqual('["datashare:///media/image/1"]');
      logInfo(`select>select>select>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0081 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0082
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0082
     * @tc.desc      DlpListState call flow sift > select > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0082 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.select(['file://media/Photo/1/IMG_1.jpg', 'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step2 select(["file://media/Photo/1/IMG_1...: step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`sift>select>sift final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(2);
      logInfo(`sift>select>sift final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["file://media/Photo/1/IMG_1.jpg","file://media/Photo/1/IMG_1.jpg"]');
      logInfo(`sift>select>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0082 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0083
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0083
     * @tc.desc      DlpListState call flow titleAt > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0083 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(55);
      logInfo(`step1 titleAt(55): step1=${step1}`);
      expect(step1).assertEqual('Text56');
      const step2: string = subject.view(173);
      logInfo(`step2 view(173): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateFlow_0083 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0084
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0084
     * @tc.desc      DlpListState call flow select > titleAt > select > sift > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0084 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step1 select(["https://example.com/media/...: step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: string = subject.titleAt(55);
      logInfo(`step2 titleAt(55): step2=${step2}`);
      expect(step2).assertEqual('Text56');
      const step3: number = subject.select(['https://example.com/media/video.mp4']);
      logInfo(`step3 select(["https://example.com/media/...: step3=${step3}`);
      expect(step3).assertEqual(3);
      const step4: number = subject.sift();
      logInfo(`step4 sift(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: string = subject.view(25);
      logInfo(`step5 view(25): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`select>titleAt>select>sift>view final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`select>titleAt>select>sift>view final: JSON.stringi...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`select>titleAt>select>sift>view final: JSON.stringi...${JSON.stringify(subject.fileArray.slice(1, 2))}`);
      expect(JSON.stringify(subject.fileArray.slice(1, 2))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`select>titleAt>select>sift>view final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0084 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0085
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0085
     * @tc.desc      DlpListState call flow sift > sift > sift > view > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0085 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(3);
      const step4: string = subject.view(199);
      logInfo(`step4 view(199): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: number = subject.select(['datashare:///media/image/1', 'http://example.com/a.mp3', '',
        'http://example.com/a.mp3', 'not a url']);
      logInfo(`step5 select(["datashare:///media/image/1...: step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`sift>sift>sift>view>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`sift>sift>sift>view>select final: JSON.stringify(subject.fileAr...${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["datashare:///media/image/1","http://example.com/a.mp3",""]');
      logInfo(`sift>sift>sift>view>select final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(3);
      logInfo(`${BUNDLE}DlpListStateFlow_0085 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0086
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0086
     * @tc.desc      DlpListState call flow sift > sift > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0086 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: string = subject.view(127);
      logInfo(`step3 view(127): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`sift>sift>view final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0086 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0087
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0087
     * @tc.desc      DlpListState call flow sift > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0087 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.titleAt(-34);
      logInfo(`step2 titleAt(-34): step2=${step2}`);
      expect(step2).assertEqual('Text-33');
      logInfo(`sift>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0087 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0088
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0088
     * @tc.desc      DlpListState call flow select > titleAt > view > sift > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0088 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['file://media/Photo/1/IMG_1.jpg', 'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step1 select(["file://media/Photo/1/IMG_1...: step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: string = subject.titleAt(52.98);
      logInfo(`step2 titleAt(52.98): step2=${step2}`);
      expect(step2).assertEqual('Text53.98');
      const step3: string = subject.view(78);
      logInfo(`step3 view(78): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.sift();
      logInfo(`step4 sift(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.select(['http://example.com/a.mp3', 'https://example.com/media/video.mp4',
        'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step5 select(["http://example.com/a.mp3",...: step5=${step5}`);
      expect(step5).assertEqual(5);
      logInfo(`select>titleAt>view>sift>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(5);
      logInfo(`select>titleAt>view>sift>select final: JSON.stringi...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["file://media/Photo/1/IMG_1.jpg"]');
      logInfo(`select>titleAt>view>sift>select final: JSON.stringi...${JSON.stringify(subject.fileArray.slice(2, 3))}`);
      expect(JSON.stringify(subject.fileArray.slice(2, 3))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`select>titleAt>view>sift>select final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0088 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0089
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0089
     * @tc.desc      DlpListState call flow titleAt > sift > select > view > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0089 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(15);
      logInfo(`step1 titleAt(15): step1=${step1}`);
      expect(step1).assertEqual('Text16');
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step3 select(["not a url", "", "datashare...: step3=${step3}`);
      expect(step3).assertEqual(3);
      const step4: string = subject.view(8);
      logInfo(`step4 view(8): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.view(82.94);
      logInfo(`step5 view(82.94): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`titleAt>sift>select>view>view final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`titleAt>sift>select>view>view final: JSON.stringify(subject.fil...${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray)).assertEqual('["not a url","","datashare:///media/image/1"]');
      logInfo(`titleAt>sift>select>view>view final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0089 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0090
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0090
     * @tc.desc      DlpListState call flow select > sift > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0090 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step1 select(["https://example.com/media/...: step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.view(53.32);
      logInfo(`step3 view(53.32): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`select>sift>view final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(2);
      logInfo(`select>sift>view final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["https://example.com/media/video.mp4","http://example.com/a.mp3"]');
      logInfo(`select>sift>view final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0090 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0091
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0091
     * @tc.desc      DlpListState call flow select > titleAt > view > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0091 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['http://example.com/a.mp3', 'https://example.com/media/video.mp4',
        'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step1 select(["http://example.com/a.mp3",...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: string = subject.titleAt(185);
      logInfo(`step2 titleAt(185): step2=${step2}`);
      expect(step2).assertEqual('Text186');
      const step3: string = subject.view(-71);
      logInfo(`step3 view(-71): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.sift();
      logInfo(`step4 sift(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`select>titleAt>view>sift final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`select>titleAt>view>sift final: JSON.stringify(subj...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`select>titleAt>view>sift final: JSON.stringify(subj...${JSON.stringify(subject.fileArray.slice(1, 2))}`);
      expect(JSON.stringify(subject.fileArray.slice(1, 2))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`select>titleAt>view>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0091 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0092
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0092
     * @tc.desc      DlpListState call flow select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0092 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3',
        'file://media/Photo/1/IMG_1.jpg', 'datashare:///media/image/1', '']);
      logInfo(`step1 select(["https://example.com/media/...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: number = subject.select(['datashare:///media/image/1', 'http://example.com/a.mp3', '',
        'http://example.com/a.mp3', 'not a url']);
      logInfo(`step2 select(["datashare:///media/image/1...: step2=${step2}`);
      expect(step2).assertEqual(6);
      logInfo(`select>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(6);
      logInfo(`select>select final: JSON.stringify(subject.fileArr...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`select>select final: JSON.stringify(subject.fileArr...${JSON.stringify(subject.fileArray.slice(2, 3))}`);
      expect(JSON.stringify(subject.fileArray.slice(2, 3))).assertEqual('["file://media/Photo/1/IMG_1.jpg"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0092 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0093
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0093
     * @tc.desc      DlpListState call flow select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0093 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['http://example.com/a.mp3', 'https://example.com/media/video.mp4',
        'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step1 select(["http://example.com/a.mp3",...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: number = subject.select(['file://media/Photo/1/IMG_1.jpg', 'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step2 select(["file://media/Photo/1/IMG_1...: step2=${step2}`);
      expect(step2).assertEqual(5);
      logInfo(`select>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(5);
      logInfo(`select>select final: JSON.stringify(subject.fileArr...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`select>select final: JSON.stringify(subject.fileArr...${JSON.stringify(subject.fileArray.slice(2, 3))}`);
      expect(JSON.stringify(subject.fileArray.slice(2, 3))).assertEqual('["file://media/Photo/1/IMG_1.jpg"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0093 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0094
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0094
     * @tc.desc      DlpListState call flow view > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0094 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(35);
      logInfo(`step1 view(35): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.titleAt(19.39);
      logInfo(`step2 titleAt(19.39): step2=${step2}`);
      expect(step2).assertEqual('Text20.39');
      logInfo(`${BUNDLE}DlpListStateFlow_0094 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0095
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0095
     * @tc.desc      DlpListState call flow view > view > titleAt > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0095 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(185);
      logInfo(`step1 view(185): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.view(-39);
      logInfo(`step2 view(-39): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.titleAt(166);
      logInfo(`step3 titleAt(166): step3=${step3}`);
      expect(step3).assertEqual('Text167');
      const step4: string = subject.view(170);
      logInfo(`step4 view(170): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateFlow_0095 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0096
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0096
     * @tc.desc      DlpListState call flow titleAt > titleAt > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0096 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(15);
      logInfo(`step1 titleAt(15): step1=${step1}`);
      expect(step1).assertEqual('Text16');
      const step2: string = subject.titleAt(77);
      logInfo(`step2 titleAt(77): step2=${step2}`);
      expect(step2).assertEqual('Text78');
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`titleAt>titleAt>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0096 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0097
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0097
     * @tc.desc      DlpListState call flow titleAt > titleAt > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0097 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(-2);
      logInfo(`step1 titleAt(-2): step1=${step1}`);
      expect(step1).assertEqual('Text-1');
      const step2: string = subject.titleAt(60);
      logInfo(`step2 titleAt(60): step2=${step2}`);
      expect(step2).assertEqual('Text61');
      const step3: string = subject.view(-54);
      logInfo(`step3 view(-54): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateFlow_0097 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0098
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0098
     * @tc.desc      DlpListState call flow titleAt > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0098 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(120);
      logInfo(`step1 titleAt(120): step1=${step1}`);
      expect(step1).assertEqual('Text121');
      const step2: string = subject.view(15);
      logInfo(`step2 view(15): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateFlow_0098 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0099
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0099
     * @tc.desc      DlpListState call flow titleAt > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0099 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(135);
      logInfo(`step1 titleAt(135): step1=${step1}`);
      expect(step1).assertEqual('Text136');
      const step2: string = subject.titleAt(-34);
      logInfo(`step2 titleAt(-34): step2=${step2}`);
      expect(step2).assertEqual('Text-33');
      logInfo(`${BUNDLE}DlpListStateFlow_0099 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0100
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0100
     * @tc.desc      DlpListState call flow view > select > sift > titleAt > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0100 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(82.94);
      logInfo(`step1 view(82.94): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3',
        'file://media/Photo/1/IMG_1.jpg', 'datashare:///media/image/1', '']);
      logInfo(`step2 select(["https://example.com/media/...: step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.titleAt(198);
      logInfo(`step4 titleAt(198): step4=${step4}`);
      expect(step4).assertEqual('Text199');
      const step5: string = subject.titleAt(100);
      logInfo(`step5 titleAt(100): step5=${step5}`);
      expect(step5).assertEqual('Text101');
      logInfo(`view>select>sift>titleAt>titleAt final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`view>select>sift>titleAt>titleAt final: JSON.string...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`view>select>sift>titleAt>titleAt final: JSON.string...${JSON.stringify(subject.fileArray.slice(1, 2))}`);
      expect(JSON.stringify(subject.fileArray.slice(1, 2))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`view>select>sift>titleAt>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0100 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0101
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0101
     * @tc.desc      DlpListState call flow select > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0101 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step1 select(["not a url", "", "datashare...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`select>sift final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`select>sift final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray)).assertEqual('["not a url","","datashare:///media/image/1"]');
      logInfo(`select>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0101 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0102
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0102
     * @tc.desc      DlpListState call flow titleAt > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0102 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(75);
      logInfo(`step1 titleAt(75): step1=${step1}`);
      expect(step1).assertEqual('Text76');
      const step2: string = subject.titleAt(101);
      logInfo(`step2 titleAt(101): step2=${step2}`);
      expect(step2).assertEqual('Text102');
      logInfo(`${BUNDLE}DlpListStateFlow_0102 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0103
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0103
     * @tc.desc      DlpListState call flow view > titleAt > view > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0103 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(1);
      logInfo(`step1 view(1): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.titleAt(11);
      logInfo(`step2 titleAt(11): step2=${step2}`);
      expect(step2).assertEqual('Text12');
      const step3: string = subject.view(29);
      logInfo(`step3 view(29): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.view(53.98);
      logInfo(`step4 view(53.98): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateFlow_0103 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0104
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0104
     * @tc.desc      DlpListState call flow titleAt > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0104 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(32.71);
      logInfo(`step1 titleAt(32.71): step1=${step1}`);
      expect(step1).assertEqual('Text33.71');
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`titleAt>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0104 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0105
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0105
     * @tc.desc      DlpListState call flow select > view > sift > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0105 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['http://example.com/a.mp3', 'https://example.com/media/video.mp4',
        'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step1 select(["http://example.com/a.mp3",...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: string = subject.view(92.71);
      logInfo(`step2 view(92.71): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.sift();
      logInfo(`step4 sift(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`select>view>sift>sift final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`select>view>sift>sift final: JSON.stringify(subject...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`select>view>sift>sift final: JSON.stringify(subject...${JSON.stringify(subject.fileArray.slice(1, 2))}`);
      expect(JSON.stringify(subject.fileArray.slice(1, 2))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`select>view>sift>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0105 end`);
    });
  });
}
