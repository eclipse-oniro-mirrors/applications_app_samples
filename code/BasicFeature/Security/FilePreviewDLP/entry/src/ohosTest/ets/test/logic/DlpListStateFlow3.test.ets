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

/** Logic checks for DlpListState flow (55 cases). */
export default function dlpListStateFlow3Test(): void {
  describe('DlpListStateFlow3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0106
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0106
     * @tc.desc      DlpListState call flow view > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0106 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(10);
      logInfo(`step1 view(10): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.view(45);
      logInfo(`step2 view(45): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateFlow_0106 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0107
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0107
     * @tc.desc      DlpListState call flow view > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0107 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(105);
      logInfo(`step1 view(105): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.titleAt(95.74);
      logInfo(`step2 titleAt(95.74): step2=${step2}`);
      expect(step2).assertEqual('Text96.74');
      logInfo(`${BUNDLE}DlpListStateFlow_0107 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0108
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0108
     * @tc.desc      DlpListState call flow titleAt > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0108 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(61);
      logInfo(`step1 titleAt(61): step1=${step1}`);
      expect(step1).assertEqual('Text62');
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`titleAt>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0108 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0109
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0109
     * @tc.desc      DlpListState call flow view > sift > sift > titleAt > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0109 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(35);
      logInfo(`step1 view(35): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: string = subject.titleAt(115);
      logInfo(`step4 titleAt(115): step4=${step4}`);
      expect(step4).assertEqual('Text116');
      const step5: string = subject.view(121);
      logInfo(`step5 view(121): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`view>sift>sift>titleAt>view final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0109 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0110
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0110
     * @tc.desc      DlpListState call flow select > select > view > titleAt > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0110 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step1 select(["https://example.com/media/...: step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3',
        'file://media/Photo/1/IMG_1.jpg', 'datashare:///media/image/1', '']);
      logInfo(`step2 select(["https://example.com/media/...: step2=${step2}`);
      expect(step2).assertEqual(5);
      const step3: string = subject.view(176);
      logInfo(`step3 view(176): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.titleAt(-66);
      logInfo(`step4 titleAt(-66): step4=${step4}`);
      expect(step4).assertEqual('Text-65');
      const step5: string = subject.titleAt(162);
      logInfo(`step5 titleAt(162): step5=${step5}`);
      expect(step5).assertEqual('Text163');
      logInfo(`select>select>view>titleAt>titleAt final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(5);
      logInfo(`select>select>view>titleAt>titleAt final: JSON.stri...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`select>select>view>titleAt>titleAt final: JSON.stri...${JSON.stringify(subject.fileArray.slice(2, 3))}`);
      expect(JSON.stringify(subject.fileArray.slice(2, 3))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0110 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0111
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0111
     * @tc.desc      DlpListState call flow titleAt > titleAt > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0111 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(-66);
      logInfo(`step1 titleAt(-66): step1=${step1}`);
      expect(step1).assertEqual('Text-65');
      const step2: string = subject.titleAt(0);
      logInfo(`step2 titleAt(0): step2=${step2}`);
      expect(step2).assertEqual('Text1');
      const step3: string = subject.view(135);
      logInfo(`step3 view(135): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateFlow_0111 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0112
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0112
     * @tc.desc      DlpListState call flow select > select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0112 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step1 select(["https://example.com/media/...: step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.select(['datashare:///media/image/1', 'http://example.com/a.mp3', '',
        'http://example.com/a.mp3', 'not a url']);
      logInfo(`step2 select(["datashare:///media/image/1...: step2=${step2}`);
      expect(step2).assertEqual(5);
      const step3: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step3 select(["not a url", "", "datashare...: step3=${step3}`);
      expect(step3).assertEqual(8);
      logInfo(`select>select>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(8);
      logInfo(`select>select>select final: JSON.stringify(subject....${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`select>select>select final: JSON.stringify(subject....${JSON.stringify(subject.fileArray.slice(2, 3))}`);
      expect(JSON.stringify(subject.fileArray.slice(2, 3))).assertEqual('["datashare:///media/image/1"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0112 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0113
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0113
     * @tc.desc      DlpListState call flow view > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0113 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(-22);
      logInfo(`step1 view(-22): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`view>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0113 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0114
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0114
     * @tc.desc      DlpListState call flow view > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0114 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(190);
      logInfo(`step1 view(190): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.select(['http://example.com/a.mp3', 'https://example.com/media/video.mp4',
        'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step2 select(["http://example.com/a.mp3",...: step2=${step2}`);
      expect(step2).assertEqual(3);
      logInfo(`view>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`view>select final: JSON.stringify(subject.fileArray...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`view>select final: JSON.stringify(subject.fileArray...${JSON.stringify(subject.fileArray.slice(1, 2))}`);
      expect(JSON.stringify(subject.fileArray.slice(1, 2))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0114 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0115
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0115
     * @tc.desc      DlpListState call flow view > view > view > select > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0115 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(37);
      logInfo(`step1 view(37): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.view(38);
      logInfo(`step2 view(38): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.view(-71);
      logInfo(`step3 view(-71): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.select([]);
      logInfo(`step4 select([]): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.sift();
      logInfo(`step5 sift(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`view>view>view>select>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0115 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0116
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0116
     * @tc.desc      DlpListState call flow sift > select > view > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0116 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.select(['http://example.com/a.mp3', 'https://example.com/media/video.mp4',
        'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step2 select(["http://example.com/a.mp3",...: step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: string = subject.view(176);
      logInfo(`step3 view(176): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.titleAt(80);
      logInfo(`step4 titleAt(80): step4=${step4}`);
      expect(step4).assertEqual('Text81');
      logInfo(`sift>select>view>titleAt final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`sift>select>view>titleAt final: JSON.stringify(subj...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`sift>select>view>titleAt final: JSON.stringify(subj...${JSON.stringify(subject.fileArray.slice(1, 2))}`);
      expect(JSON.stringify(subject.fileArray.slice(1, 2))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`sift>select>view>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0116 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0117
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0117
     * @tc.desc      DlpListState call flow view > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0117 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(-15);
      logInfo(`step1 view(-15): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.select([]);
      logInfo(`step2 select([]): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}DlpListStateFlow_0117 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0118
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0118
     * @tc.desc      DlpListState call flow titleAt > sift > view > view > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0118 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(80);
      logInfo(`step1 titleAt(80): step1=${step1}`);
      expect(step1).assertEqual('Text81');
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.view(120);
      logInfo(`step3 view(120): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.view(166);
      logInfo(`step4 view(166): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: number = subject.select([]);
      logInfo(`step5 select([]): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`titleAt>sift>view>view>select final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0118 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0119
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0119
     * @tc.desc      DlpListState call flow titleAt > view > titleAt > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0119 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(60);
      logInfo(`step1 titleAt(60): step1=${step1}`);
      expect(step1).assertEqual('Text61');
      const step2: string = subject.view(153);
      logInfo(`step2 view(153): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.titleAt(115);
      logInfo(`step3 titleAt(115): step3=${step3}`);
      expect(step3).assertEqual('Text116');
      const step4: number = subject.sift();
      logInfo(`step4 sift(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`titleAt>view>titleAt>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0119 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0120
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0120
     * @tc.desc      DlpListState call flow view > titleAt > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0120 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(98.14);
      logInfo(`step1 view(98.14): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.titleAt(129);
      logInfo(`step2 titleAt(129): step2=${step2}`);
      expect(step2).assertEqual('Text130');
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`view>titleAt>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0120 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0121
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0121
     * @tc.desc      DlpListState call flow view > view > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0121 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(53.32);
      logInfo(`step1 view(53.32): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.view(72.54);
      logInfo(`step2 view(72.54): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.titleAt(0);
      logInfo(`step3 titleAt(0): step3=${step3}`);
      expect(step3).assertEqual('Text1');
      logInfo(`${BUNDLE}DlpListStateFlow_0121 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0122
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0122
     * @tc.desc      DlpListState call flow view > sift > sift > select > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0122 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(70);
      logInfo(`step1 view(70): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.select(['http://example.com/a.mp3', 'https://example.com/media/video.mp4',
        'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step4 select(["http://example.com/a.mp3",...: step4=${step4}`);
      expect(step4).assertEqual(3);
      const step5: string = subject.view(115);
      logInfo(`step5 view(115): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`view>sift>sift>select>view final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`view>sift>sift>select>view final: JSON.stringify(su...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`view>sift>sift>select>view final: JSON.stringify(su...${JSON.stringify(subject.fileArray.slice(1, 2))}`);
      expect(JSON.stringify(subject.fileArray.slice(1, 2))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`view>sift>sift>select>view final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0122 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0123
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0123
     * @tc.desc      DlpListState call flow titleAt > view > view > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0123 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(15);
      logInfo(`step1 titleAt(15): step1=${step1}`);
      expect(step1).assertEqual('Text16');
      const step2: string = subject.view(5);
      logInfo(`step2 view(5): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.view(78);
      logInfo(`step3 view(78): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.titleAt(80);
      logInfo(`step4 titleAt(80): step4=${step4}`);
      expect(step4).assertEqual('Text81');
      logInfo(`${BUNDLE}DlpListStateFlow_0123 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0124
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0124
     * @tc.desc      DlpListState call flow select > select > titleAt > select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0124 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select([]);
      logInfo(`step1 select([]): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3',
        'file://media/Photo/1/IMG_1.jpg', 'datashare:///media/image/1', '']);
      logInfo(`step2 select(["https://example.com/media/...: step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: string = subject.titleAt(60);
      logInfo(`step3 titleAt(60): step3=${step3}`);
      expect(step3).assertEqual('Text61');
      const step4: number = subject.select([]);
      logInfo(`step4 select([]): step4=${step4}`);
      expect(step4).assertEqual(3);
      const step5: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step5 select(["https://example.com/media/...: step5=${step5}`);
      expect(step5).assertEqual(5);
      logInfo(`select>select>titleAt>select>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(5);
      logInfo(`select>select>titleAt>select>select final: JSON.str...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`select>select>titleAt>select>select final: JSON.str...${JSON.stringify(subject.fileArray.slice(2, 3))}`);
      expect(JSON.stringify(subject.fileArray.slice(2, 3))).assertEqual('["file://media/Photo/1/IMG_1.jpg"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0124 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0125
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0125
     * @tc.desc      DlpListState call flow titleAt > sift > view > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0125 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(61.53);
      logInfo(`step1 titleAt(61.53): step1=${step1}`);
      expect(step1).assertEqual('Text62.53');
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.view(155);
      logInfo(`step3 view(155): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.select([]);
      logInfo(`step4 select([]): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`titleAt>sift>view>select final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0125 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0126
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0126
     * @tc.desc      DlpListState call flow titleAt > view > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0126 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(-19);
      logInfo(`step1 titleAt(-19): step1=${step1}`);
      expect(step1).assertEqual('Text-18');
      const step2: string = subject.view(100);
      logInfo(`step2 view(100): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`titleAt>view>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0126 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0127
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0127
     * @tc.desc      DlpListState call flow view > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0127 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(199);
      logInfo(`step1 view(199): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step2 select(["not a url", "", "datashare...: step2=${step2}`);
      expect(step2).assertEqual(3);
      logInfo(`view>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`view>select final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray)).assertEqual('["not a url","","datashare:///media/image/1"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0127 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0128
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0128
     * @tc.desc      DlpListState call flow titleAt > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0128 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(-77);
      logInfo(`step1 titleAt(-77): step1=${step1}`);
      expect(step1).assertEqual('Text-76');
      const step2: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3',
        'file://media/Photo/1/IMG_1.jpg', 'datashare:///media/image/1', '']);
      logInfo(`step2 select(["https://example.com/media/...: step2=${step2}`);
      expect(step2).assertEqual(3);
      logInfo(`titleAt>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`titleAt>select final: JSON.stringify(subject.fileAr...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`titleAt>select final: JSON.stringify(subject.fileAr...${JSON.stringify(subject.fileArray.slice(1, 2))}`);
      expect(JSON.stringify(subject.fileArray.slice(1, 2))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0128 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0129
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0129
     * @tc.desc      DlpListState call flow view > view > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0129 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(67);
      logInfo(`step1 view(67): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.view(166);
      logInfo(`step2 view(166): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`view>view>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0129 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0130
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0130
     * @tc.desc      DlpListState call flow titleAt > sift > view > titleAt > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0130 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(-16);
      logInfo(`step1 titleAt(-16): step1=${step1}`);
      expect(step1).assertEqual('Text-15');
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.view(173);
      logInfo(`step3 view(173): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.titleAt(10);
      logInfo(`step4 titleAt(10): step4=${step4}`);
      expect(step4).assertEqual('Text11');
      const step5: string = subject.view(80);
      logInfo(`step5 view(80): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`titleAt>sift>view>titleAt>view final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0130 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0131
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0131
     * @tc.desc      DlpListState call flow titleAt > sift > titleAt > select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0131 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(90);
      logInfo(`step1 titleAt(90): step1=${step1}`);
      expect(step1).assertEqual('Text91');
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.titleAt(19.73);
      logInfo(`step3 titleAt(19.73): step3=${step3}`);
      expect(step3).assertEqual('Text20.73');
      const step4: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step4 select(["https://example.com/media/...: step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.select(['https://example.com/media/video.mp4']);
      logInfo(`step5 select(["https://example.com/media/...: step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`titleAt>sift>titleAt>select>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`titleAt>sift>titleAt>select>select final: JSON.stri...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`titleAt>sift>titleAt>select>select final: JSON.stri...${JSON.stringify(subject.fileArray.slice(1, 2))}`);
      expect(JSON.stringify(subject.fileArray.slice(1, 2))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`titleAt>sift>titleAt>select>select final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0131 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0132
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0132
     * @tc.desc      DlpListState call flow select > select > sift > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0132 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select([]);
      logInfo(`step1 select([]): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.select(['datashare:///media/image/1', 'http://example.com/a.mp3', '',
        'http://example.com/a.mp3', 'not a url']);
      logInfo(`step2 select(["datashare:///media/image/1...: step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.view(65);
      logInfo(`step4 view(65): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`select>select>sift>view final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`select>select>sift>view final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["datashare:///media/image/1","http://example.com/a.mp3",""]');
      logInfo(`select>select>sift>view final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0132 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0133
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0133
     * @tc.desc      DlpListState call flow sift > sift > view > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0133 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: string = subject.view(190);
      logInfo(`step3 view(190): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.titleAt(179);
      logInfo(`step4 titleAt(179): step4=${step4}`);
      expect(step4).assertEqual('Text180');
      logInfo(`sift>sift>view>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0133 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0134
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0134
     * @tc.desc      DlpListState call flow view > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0134 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(199);
      logInfo(`step1 view(199): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.titleAt(-66);
      logInfo(`step2 titleAt(-66): step2=${step2}`);
      expect(step2).assertEqual('Text-65');
      logInfo(`${BUNDLE}DlpListStateFlow_0134 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0135
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0135
     * @tc.desc      DlpListState call flow titleAt > sift > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0135 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(139);
      logInfo(`step1 titleAt(139): step1=${step1}`);
      expect(step1).assertEqual('Text140');
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.view(105);
      logInfo(`step3 view(105): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`titleAt>sift>view final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0135 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0136
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0136
     * @tc.desc      DlpListState call flow titleAt > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0136 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(110);
      logInfo(`step1 titleAt(110): step1=${step1}`);
      expect(step1).assertEqual('Text111');
      const step2: string = subject.titleAt(-6);
      logInfo(`step2 titleAt(-6): step2=${step2}`);
      expect(step2).assertEqual('Text-5');
      logInfo(`${BUNDLE}DlpListStateFlow_0136 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0137
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0137
     * @tc.desc      DlpListState call flow titleAt > sift > titleAt > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0137 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(145);
      logInfo(`step1 titleAt(145): step1=${step1}`);
      expect(step1).assertEqual('Text146');
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.titleAt(-26);
      logInfo(`step3 titleAt(-26): step3=${step3}`);
      expect(step3).assertEqual('Text-25');
      const step4: string = subject.titleAt(36.86);
      logInfo(`step4 titleAt(36.86): step4=${step4}`);
      expect(step4).assertEqual('Text37.86');
      logInfo(`titleAt>sift>titleAt>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0137 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0138
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0138
     * @tc.desc      DlpListState call flow sift > select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0138 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3',
        'file://media/Photo/1/IMG_1.jpg', 'datashare:///media/image/1', '']);
      logInfo(`step2 select(["https://example.com/media/...: step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: number = subject.select(['file://media/Photo/1/IMG_1.jpg', 'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step3 select(["file://media/Photo/1/IMG_1...: step3=${step3}`);
      expect(step3).assertEqual(5);
      logInfo(`sift>select>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(5);
      logInfo(`sift>select>select final: JSON.stringify(subject.fi...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`sift>select>select final: JSON.stringify(subject.fi...${JSON.stringify(subject.fileArray.slice(2, 3))}`);
      expect(JSON.stringify(subject.fileArray.slice(2, 3))).assertEqual('["file://media/Photo/1/IMG_1.jpg"]');
      logInfo(`sift>select>select final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0138 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0139
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0139
     * @tc.desc      DlpListState call flow select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0139 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3',
        'file://media/Photo/1/IMG_1.jpg', 'datashare:///media/image/1', '']);
      logInfo(`step1 select(["https://example.com/media/...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3',
        'file://media/Photo/1/IMG_1.jpg', 'datashare:///media/image/1', '']);
      logInfo(`step2 select(["https://example.com/media/...: step2=${step2}`);
      expect(step2).assertEqual(6);
      logInfo(`select>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(6);
      logInfo(`select>select final: JSON.stringify(subject.fileArr...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`select>select final: JSON.stringify(subject.fileArr...${JSON.stringify(subject.fileArray.slice(3, 4))}`);
      expect(JSON.stringify(subject.fileArray.slice(3, 4))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0139 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0140
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0140
     * @tc.desc      DlpListState call flow view > select > sift > select > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0140 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(150);
      logInfo(`step1 view(150): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.select([]);
      logInfo(`step2 select([]): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.select([]);
      logInfo(`step4 select([]): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.sift();
      logInfo(`step5 sift(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`view>select>sift>select>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0140 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0141
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0141
     * @tc.desc      DlpListState call flow sift > titleAt > view > titleAt > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0141 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.titleAt(0);
      logInfo(`step2 titleAt(0): step2=${step2}`);
      expect(step2).assertEqual('Text1');
      const step3: string = subject.view(173);
      logInfo(`step3 view(173): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.titleAt(-100);
      logInfo(`step4 titleAt(-100): step4=${step4}`);
      expect(step4).assertEqual('Text-99');
      const step5: string = subject.view(21);
      logInfo(`step5 view(21): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`sift>titleAt>view>titleAt>view final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0141 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0142
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0142
     * @tc.desc      DlpListState call flow titleAt > select > view > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0142 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(1);
      logInfo(`step1 titleAt(1): step1=${step1}`);
      expect(step1).assertEqual('Text2');
      const step2: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step2 select(["https://example.com/media/...: step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: string = subject.view(38);
      logInfo(`step3 view(38): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.titleAt(15);
      logInfo(`step4 titleAt(15): step4=${step4}`);
      expect(step4).assertEqual('Text16');
      logInfo(`titleAt>select>view>titleAt final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(2);
      logInfo(`titleAt>select>view>titleAt final: JSON.stringify(subject.fileA...${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["https://example.com/media/video.mp4","http://example.com/a.mp3"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0142 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0143
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0143
     * @tc.desc      DlpListState call flow sift > view > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0143 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.view(51);
      logInfo(`step2 view(51): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.titleAt(-27);
      logInfo(`step3 titleAt(-27): step3=${step3}`);
      expect(step3).assertEqual('Text-26');
      logInfo(`sift>view>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0143 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0144
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0144
     * @tc.desc      DlpListState call flow sift > view > select > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0144 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.view(-7);
      logInfo(`step2 view(-7): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.select([]);
      logInfo(`step3 select([]): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.titleAt(45);
      logInfo(`step4 titleAt(45): step4=${step4}`);
      expect(step4).assertEqual('Text46');
      logInfo(`sift>view>select>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0144 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0145
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0145
     * @tc.desc      DlpListState call flow titleAt > titleAt > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0145 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(108);
      logInfo(`step1 titleAt(108): step1=${step1}`);
      expect(step1).assertEqual('Text109');
      const step2: string = subject.titleAt(-68);
      logInfo(`step2 titleAt(-68): step2=${step2}`);
      expect(step2).assertEqual('Text-67');
      const step3: string = subject.view(130);
      logInfo(`step3 view(130): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateFlow_0145 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0146
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0146
     * @tc.desc      DlpListState call flow view > select > titleAt > titleAt > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0146 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(101);
      logInfo(`step1 view(101): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step2 select(["https://example.com/media/...: step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: string = subject.titleAt(88);
      logInfo(`step3 titleAt(88): step3=${step3}`);
      expect(step3).assertEqual('Text89');
      const step4: string = subject.titleAt(-27);
      logInfo(`step4 titleAt(-27): step4=${step4}`);
      expect(step4).assertEqual('Text-26');
      const step5: string = subject.view(-96);
      logInfo(`step5 view(-96): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`view>select>titleAt>titleAt>view final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(2);
      logInfo(`view>select>titleAt>titleAt>view final: JSON.stringify(subject....${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["https://example.com/media/video.mp4","http://example.com/a.mp3"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0146 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0147
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0147
     * @tc.desc      DlpListState call flow titleAt > view > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0147 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(-100);
      logInfo(`step1 titleAt(-100): step1=${step1}`);
      expect(step1).assertEqual('Text-99');
      const step2: string = subject.view(182);
      logInfo(`step2 view(182): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.titleAt(112);
      logInfo(`step3 titleAt(112): step3=${step3}`);
      expect(step3).assertEqual('Text113');
      logInfo(`${BUNDLE}DlpListStateFlow_0147 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0148
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0148
     * @tc.desc      DlpListState call flow view > view > select > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0148 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(67);
      logInfo(`step1 view(67): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.view(82.94);
      logInfo(`step2 view(82.94): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.select(['file://media/Photo/1/IMG_1.jpg', 'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step3 select(["file://media/Photo/1/IMG_1...: step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: string = subject.titleAt(75.52);
      logInfo(`step4 titleAt(75.52): step4=${step4}`);
      expect(step4).assertEqual('Text76.52');
      logInfo(`view>view>select>titleAt final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(2);
      logInfo(`view>view>select>titleAt final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["file://media/Photo/1/IMG_1.jpg","file://media/Photo/1/IMG_1.jpg"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0148 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0149
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0149
     * @tc.desc      DlpListState call flow view > select > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0149 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(98.14);
      logInfo(`step1 view(98.14): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step2 select(["https://example.com/media/...: step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: string = subject.view(88.34);
      logInfo(`step3 view(88.34): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`view>select>view final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(2);
      logInfo(`view>select>view final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["https://example.com/media/video.mp4","http://example.com/a.mp3"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0149 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0150
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0150
     * @tc.desc      DlpListState call flow select > titleAt > select > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0150 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step1 select(["not a url", "", "datashare...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: string = subject.titleAt(198);
      logInfo(`step2 titleAt(198): step2=${step2}`);
      expect(step2).assertEqual('Text199');
      const step3: number = subject.select(['https://example.com/media/video.mp4']);
      logInfo(`step3 select(["https://example.com/media/...: step3=${step3}`);
      expect(step3).assertEqual(4);
      const step4: string = subject.titleAt(96);
      logInfo(`step4 titleAt(96): step4=${step4}`);
      expect(step4).assertEqual('Text97');
      logInfo(`select>titleAt>select>titleAt final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(4);
      logInfo(`select>titleAt>select>titleAt final: JSON.stringify...${JSON.stringify(subject.fileArray.slice(0, 3))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 3)))
        .assertEqual('["not a url","","datashare:///media/image/1"]');
      logInfo(`select>titleAt>select>titleAt final: JSON.stringify...${JSON.stringify(subject.fileArray.slice(3, 4))}`);
      expect(JSON.stringify(subject.fileArray.slice(3, 4))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0150 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0151
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0151
     * @tc.desc      DlpListState call flow titleAt > view > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0151 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(46.54);
      logInfo(`step1 titleAt(46.54): step1=${step1}`);
      expect(step1).assertEqual('Text47.54');
      const step2: string = subject.view(182);
      logInfo(`step2 view(182): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.view(93.03);
      logInfo(`step3 view(93.03): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateFlow_0151 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0152
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0152
     * @tc.desc      DlpListState call flow titleAt > select > view > sift > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0152 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(182);
      logInfo(`step1 titleAt(182): step1=${step1}`);
      expect(step1).assertEqual('Text183');
      const step2: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step2 select(["https://example.com/media/...: step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: string = subject.view(-1);
      logInfo(`step3 view(-1): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.sift();
      logInfo(`step4 sift(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: string = subject.view(26.67);
      logInfo(`step5 view(26.67): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`titleAt>select>view>sift>view final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(2);
      logInfo(`titleAt>select>view>sift>view final: JSON.stringify(subject.fil...${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["https://example.com/media/video.mp4","http://example.com/a.mp3"]');
      logInfo(`titleAt>select>view>sift>view final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0152 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0153
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0153
     * @tc.desc      DlpListState call flow select > titleAt > view > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0153 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step1 select(["https://example.com/media/...: step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: string = subject.titleAt(75.52);
      logInfo(`step2 titleAt(75.52): step2=${step2}`);
      expect(step2).assertEqual('Text76.52');
      const step3: string = subject.view(-16);
      logInfo(`step3 view(-16): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3',
        'file://media/Photo/1/IMG_1.jpg', 'datashare:///media/image/1', '']);
      logInfo(`step4 select(["https://example.com/media/...: step4=${step4}`);
      expect(step4).assertEqual(5);
      logInfo(`select>titleAt>view>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(5);
      logInfo(`select>titleAt>view>select final: JSON.stringify(su...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`select>titleAt>view>select final: JSON.stringify(su...${JSON.stringify(subject.fileArray.slice(2, 3))}`);
      expect(JSON.stringify(subject.fileArray.slice(2, 3))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0153 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0154
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0154
     * @tc.desc      DlpListState call flow titleAt > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0154 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(-62);
      logInfo(`step1 titleAt(-62): step1=${step1}`);
      expect(step1).assertEqual('Text-61');
      const step2: string = subject.titleAt(94);
      logInfo(`step2 titleAt(94): step2=${step2}`);
      expect(step2).assertEqual('Text95');
      logInfo(`${BUNDLE}DlpListStateFlow_0154 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0155
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0155
     * @tc.desc      DlpListState call flow view > view > sift > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0155 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(166);
      logInfo(`step1 view(166): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.view(115);
      logInfo(`step2 view(115): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.titleAt(101);
      logInfo(`step4 titleAt(101): step4=${step4}`);
      expect(step4).assertEqual('Text102');
      logInfo(`view>view>sift>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0155 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0156
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0156
     * @tc.desc      DlpListState call flow titleAt > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0156 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(123);
      logInfo(`step1 titleAt(123): step1=${step1}`);
      expect(step1).assertEqual('Text124');
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`titleAt>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0156 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0157
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0157
     * @tc.desc      DlpListState call flow view > sift > titleAt > select > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0157 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(70.38);
      logInfo(`step1 view(70.38): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.titleAt(108);
      logInfo(`step3 titleAt(108): step3=${step3}`);
      expect(step3).assertEqual('Text109');
      const step4: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step4 select(["https://example.com/media/...: step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.sift();
      logInfo(`step5 sift(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`view>sift>titleAt>select>sift final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(2);
      logInfo(`view>sift>titleAt>select>sift final: JSON.stringify(subject.fil...${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["https://example.com/media/video.mp4","http://example.com/a.mp3"]');
      logInfo(`view>sift>titleAt>select>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0157 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0158
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0158
     * @tc.desc      DlpListState call flow sift > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0158 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.view(-22);
      logInfo(`step2 view(-22): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`sift>view final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0158 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0159
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0159
     * @tc.desc      DlpListState call flow titleAt > view > sift > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0159 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(31);
      logInfo(`step1 titleAt(31): step1=${step1}`);
      expect(step1).assertEqual('Text32');
      const step2: string = subject.view(-86);
      logInfo(`step2 view(-86): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.titleAt(10);
      logInfo(`step4 titleAt(10): step4=${step4}`);
      expect(step4).assertEqual('Text11');
      logInfo(`titleAt>view>sift>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0159 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0160
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0160
     * @tc.desc      DlpListState call flow view > select > titleAt > view > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0160 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(150);
      logInfo(`step1 view(150): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.select([]);
      logInfo(`step2 select([]): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.titleAt(129);
      logInfo(`step3 titleAt(129): step3=${step3}`);
      expect(step3).assertEqual('Text130');
      const step4: string = subject.view(158);
      logInfo(`step4 view(158): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: number = subject.select(['https://example.com/media/video.mp4']);
      logInfo(`step5 select(["https://example.com/media/...: step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`view>select>titleAt>view>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(1);
      logInfo(`view>select>titleAt>view>select final: JSON.stringify(subject.f...${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray)).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0160 end`);
    });
  });
}
