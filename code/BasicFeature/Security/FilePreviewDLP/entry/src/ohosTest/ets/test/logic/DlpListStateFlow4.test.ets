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

/** Logic checks for DlpListState flow (49 cases). */
export default function dlpListStateFlow4Test(): void {
  describe('DlpListStateFlow4Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0161
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0161
     * @tc.desc      DlpListState call flow select > view > sift > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0161 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['http://example.com/a.mp3', 'https://example.com/media/video.mp4',
        'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step1 select(["http://example.com/a.mp3",...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: string = subject.view(-71);
      logInfo(`step2 view(-71): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.titleAt(36.86);
      logInfo(`step4 titleAt(36.86): step4=${step4}`);
      expect(step4).assertEqual('Text37.86');
      logInfo(`select>view>sift>titleAt final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`select>view>sift>titleAt final: JSON.stringify(subj...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`select>view>sift>titleAt final: JSON.stringify(subj...${JSON.stringify(subject.fileArray.slice(1, 2))}`);
      expect(JSON.stringify(subject.fileArray.slice(1, 2))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`select>view>sift>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0161 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0162
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0162
     * @tc.desc      DlpListState call flow view > view > view > view > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0162 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(8);
      logInfo(`step1 view(8): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.view(84.61);
      logInfo(`step2 view(84.61): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.view(92);
      logInfo(`step3 view(92): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.view(-36);
      logInfo(`step4 view(-36): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.view(-79);
      logInfo(`step5 view(-79): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateFlow_0162 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0163
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0163
     * @tc.desc      DlpListState call flow view > titleAt > select > sift > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0163 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(195);
      logInfo(`step1 view(195): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.titleAt(-77);
      logInfo(`step2 titleAt(-77): step2=${step2}`);
      expect(step2).assertEqual('Text-76');
      const step3: number = subject.select(['datashare:///media/image/1', 'http://example.com/a.mp3', '',
        'http://example.com/a.mp3', 'not a url']);
      logInfo(`step3 select(["datashare:///media/image/1...: step3=${step3}`);
      expect(step3).assertEqual(3);
      const step4: number = subject.sift();
      logInfo(`step4 sift(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: string = subject.titleAt(-77);
      logInfo(`step5 titleAt(-77): step5=${step5}`);
      expect(step5).assertEqual('Text-76');
      logInfo(`view>titleAt>select>sift>titleAt final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`view>titleAt>select>sift>titleAt final: JSON.stringify(subject....${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["datashare:///media/image/1","http://example.com/a.mp3",""]');
      logInfo(`view>titleAt>select>sift>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0163 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0164
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0164
     * @tc.desc      DlpListState call flow select > select > titleAt > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0164 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['datashare:///media/image/1', 'http://example.com/a.mp3', '',
        'http://example.com/a.mp3', 'not a url']);
      logInfo(`step1 select(["datashare:///media/image/1...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: number = subject.select(['datashare:///media/image/1', 'http://example.com/a.mp3', '',
        'http://example.com/a.mp3', 'not a url']);
      logInfo(`step2 select(["datashare:///media/image/1...: step2=${step2}`);
      expect(step2).assertEqual(6);
      const step3: string = subject.titleAt(185);
      logInfo(`step3 titleAt(185): step3=${step3}`);
      expect(step3).assertEqual('Text186');
      const step4: string = subject.view(-4);
      logInfo(`step4 view(-4): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`select>select>titleAt>view final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(6);
      logInfo(`select>select>titleAt>view final: JSON.stringify(su...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["datashare:///media/image/1"]');
      logInfo(`select>select>titleAt>view final: JSON.stringify(su...${JSON.stringify(subject.fileArray.slice(3, 4))}`);
      expect(JSON.stringify(subject.fileArray.slice(3, 4))).assertEqual('["datashare:///media/image/1"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0164 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0165
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0165
     * @tc.desc      DlpListState call flow titleAt > sift > sift > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0165 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(-26);
      logInfo(`step1 titleAt(-26): step1=${step1}`);
      expect(step1).assertEqual('Text-25');
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.sift();
      logInfo(`step4 sift(): step4=${step4}`);
      expect(step4).assertEqual(3);
      logInfo(`titleAt>sift>sift>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(3);
      logInfo(`${BUNDLE}DlpListStateFlow_0165 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0166
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0166
     * @tc.desc      DlpListState call flow select > view > sift > sift > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0166 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select([]);
      logInfo(`step1 select([]): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.view(125);
      logInfo(`step2 view(125): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.sift();
      logInfo(`step4 sift(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: string = subject.view(165);
      logInfo(`step5 view(165): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`select>view>sift>sift>view final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0166 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0167
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0167
     * @tc.desc      DlpListState call flow sift > titleAt > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0167 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.titleAt(17.06);
      logInfo(`step2 titleAt(17.06): step2=${step2}`);
      expect(step2).assertEqual('Text18.06');
      const step3: string = subject.view(127);
      logInfo(`step3 view(127): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`sift>titleAt>view final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0167 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0168
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0168
     * @tc.desc      DlpListState call flow view > titleAt > select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0168 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(90);
      logInfo(`step1 view(90): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.titleAt(-62);
      logInfo(`step2 titleAt(-62): step2=${step2}`);
      expect(step2).assertEqual('Text-61');
      const step3: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step3 select(["not a url", "", "datashare...: step3=${step3}`);
      expect(step3).assertEqual(3);
      const step4: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3',
        'file://media/Photo/1/IMG_1.jpg', 'datashare:///media/image/1', '']);
      logInfo(`step4 select(["https://example.com/media/...: step4=${step4}`);
      expect(step4).assertEqual(6);
      logInfo(`view>titleAt>select>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(6);
      logInfo(`view>titleAt>select>select final: JSON.stringify(su...${JSON.stringify(subject.fileArray.slice(0, 3))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 3)))
        .assertEqual('["not a url","","datashare:///media/image/1"]');
      logInfo(`view>titleAt>select>select final: JSON.stringify(su...${JSON.stringify(subject.fileArray.slice(4, 5))}`);
      expect(JSON.stringify(subject.fileArray.slice(4, 5))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0168 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0169
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0169
     * @tc.desc      DlpListState call flow select > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0169 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['file://media/Photo/1/IMG_1.jpg', 'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step1 select(["file://media/Photo/1/IMG_1...: step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: string = subject.view(121);
      logInfo(`step2 view(121): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`select>view final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(2);
      logInfo(`select>view final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["file://media/Photo/1/IMG_1.jpg","file://media/Photo/1/IMG_1.jpg"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0169 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0170
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0170
     * @tc.desc      DlpListState call flow sift > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0170 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.select([]);
      logInfo(`step2 select([]): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`sift>select final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0170 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0171
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0171
     * @tc.desc      DlpListState call flow titleAt > select > select > select > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0171 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(109);
      logInfo(`step1 titleAt(109): step1=${step1}`);
      expect(step1).assertEqual('Text110');
      const step2: number = subject.select([]);
      logInfo(`step2 select([]): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.select([]);
      logInfo(`step3 select([]): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.select(['http://example.com/a.mp3', 'https://example.com/media/video.mp4',
        'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step4 select(["http://example.com/a.mp3",...: step4=${step4}`);
      expect(step4).assertEqual(3);
      const step5: string = subject.view(50);
      logInfo(`step5 view(50): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`titleAt>select>select>select>view final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`titleAt>select>select>select>view final: JSON.strin...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`titleAt>select>select>select>view final: JSON.strin...${JSON.stringify(subject.fileArray.slice(1, 2))}`);
      expect(JSON.stringify(subject.fileArray.slice(1, 2))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0171 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0172
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0172
     * @tc.desc      DlpListState call flow view > select > titleAt > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0172 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(38);
      logInfo(`step1 view(38): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.select([]);
      logInfo(`step2 select([]): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.titleAt(-1);
      logInfo(`step3 titleAt(-1): step3=${step3}`);
      expect(step3).assertEqual('Text0');
      const step4: string = subject.view(140);
      logInfo(`step4 view(140): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateFlow_0172 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0173
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0173
     * @tc.desc      DlpListState call flow view > titleAt > view > view > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0173 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(76.82);
      logInfo(`step1 view(76.82): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.titleAt(-5);
      logInfo(`step2 titleAt(-5): step2=${step2}`);
      expect(step2).assertEqual('Text-4');
      const step3: string = subject.view(-39);
      logInfo(`step3 view(-39): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.view(166);
      logInfo(`step4 view(166): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.titleAt(40);
      logInfo(`step5 titleAt(40): step5=${step5}`);
      expect(step5).assertEqual('Text41');
      logInfo(`${BUNDLE}DlpListStateFlow_0173 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0174
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0174
     * @tc.desc      DlpListState call flow sift > sift > titleAt > select > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0174 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: string = subject.titleAt(179);
      logInfo(`step3 titleAt(179): step3=${step3}`);
      expect(step3).assertEqual('Text180');
      const step4: number = subject.select(['datashare:///media/image/1', 'http://example.com/a.mp3', '',
        'http://example.com/a.mp3', 'not a url']);
      logInfo(`step4 select(["datashare:///media/image/1...: step4=${step4}`);
      expect(step4).assertEqual(3);
      const step5: number = subject.sift();
      logInfo(`step5 sift(): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`sift>sift>titleAt>select>sift final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`sift>sift>titleAt>select>sift final: JSON.stringify(subject.fil...${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["datashare:///media/image/1","http://example.com/a.mp3",""]');
      logInfo(`sift>sift>titleAt>select>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(3);
      logInfo(`${BUNDLE}DlpListStateFlow_0174 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0175
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0175
     * @tc.desc      DlpListState call flow select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0175 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3',
        'file://media/Photo/1/IMG_1.jpg', 'datashare:///media/image/1', '']);
      logInfo(`step1 select(["https://example.com/media/...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step2 select(["https://example.com/media/...: step2=${step2}`);
      expect(step2).assertEqual(5);
      logInfo(`select>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(5);
      logInfo(`select>select final: JSON.stringify(subject.fileArr...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`select>select final: JSON.stringify(subject.fileArr...${JSON.stringify(subject.fileArray.slice(2, 3))}`);
      expect(JSON.stringify(subject.fileArray.slice(2, 3))).assertEqual('["file://media/Photo/1/IMG_1.jpg"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0175 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0176
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0176
     * @tc.desc      DlpListState call flow sift > view > view > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0176 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.view(76.82);
      logInfo(`step2 view(76.82): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.view(76.82);
      logInfo(`step3 view(76.82): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.view(54.74);
      logInfo(`step4 view(54.74): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`sift>view>view>view final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0176 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0177
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0177
     * @tc.desc      DlpListState call flow titleAt > titleAt > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0177 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(-1);
      logInfo(`step1 titleAt(-1): step1=${step1}`);
      expect(step1).assertEqual('Text0');
      const step2: string = subject.titleAt(65);
      logInfo(`step2 titleAt(65): step2=${step2}`);
      expect(step2).assertEqual('Text66');
      const step3: string = subject.view(98.14);
      logInfo(`step3 view(98.14): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateFlow_0177 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0178
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0178
     * @tc.desc      DlpListState call flow titleAt > sift > select > sift > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0178 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(0.37);
      logInfo(`step1 titleAt(0.37): step1=${step1}`);
      expect(step1).assertEqual('Text1.37');
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.select(['https://example.com/media/video.mp4']);
      logInfo(`step3 select(["https://example.com/media/...: step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.sift();
      logInfo(`step4 sift(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step5 select(["https://example.com/media/...: step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`titleAt>sift>select>sift>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`titleAt>sift>select>sift>select final: JSON.stringi...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`titleAt>sift>select>sift>select final: JSON.stringi...${JSON.stringify(subject.fileArray.slice(1, 2))}`);
      expect(JSON.stringify(subject.fileArray.slice(1, 2))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`titleAt>sift>select>sift>select final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0178 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0179
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0179
     * @tc.desc      DlpListState call flow sift > sift > titleAt > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0179 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: string = subject.titleAt(190);
      logInfo(`step3 titleAt(190): step3=${step3}`);
      expect(step3).assertEqual('Text191');
      const step4: string = subject.view(-1);
      logInfo(`step4 view(-1): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`sift>sift>titleAt>view final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0179 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0180
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0180
     * @tc.desc      DlpListState call flow titleAt > select > view > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0180 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(123);
      logInfo(`step1 titleAt(123): step1=${step1}`);
      expect(step1).assertEqual('Text124');
      const step2: number = subject.select(['http://example.com/a.mp3', 'https://example.com/media/video.mp4',
        'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step2 select(["http://example.com/a.mp3",...: step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: string = subject.view(135);
      logInfo(`step3 view(135): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.sift();
      logInfo(`step4 sift(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`titleAt>select>view>sift final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`titleAt>select>view>sift final: JSON.stringify(subj...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`titleAt>select>view>sift final: JSON.stringify(subj...${JSON.stringify(subject.fileArray.slice(1, 2))}`);
      expect(JSON.stringify(subject.fileArray.slice(1, 2))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`titleAt>select>view>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0180 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0181
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0181
     * @tc.desc      DlpListState call flow view > view > titleAt > view > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0181 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(29);
      logInfo(`step1 view(29): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.view(92);
      logInfo(`step2 view(92): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.titleAt(102);
      logInfo(`step3 titleAt(102): step3=${step3}`);
      expect(step3).assertEqual('Text103');
      const step4: string = subject.view(53.98);
      logInfo(`step4 view(53.98): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.view(37);
      logInfo(`step5 view(37): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateFlow_0181 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0182
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0182
     * @tc.desc      DlpListState call flow view > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0182 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(96);
      logInfo(`step1 view(96): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3',
        'file://media/Photo/1/IMG_1.jpg', 'datashare:///media/image/1', '']);
      logInfo(`step2 select(["https://example.com/media/...: step2=${step2}`);
      expect(step2).assertEqual(3);
      logInfo(`view>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`view>select final: JSON.stringify(subject.fileArray...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`view>select final: JSON.stringify(subject.fileArray...${JSON.stringify(subject.fileArray.slice(1, 2))}`);
      expect(JSON.stringify(subject.fileArray.slice(1, 2))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0182 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0183
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0183
     * @tc.desc      DlpListState call flow view > view > select > view > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0183 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(53);
      logInfo(`step1 view(53): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.view(150);
      logInfo(`step2 view(150): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step3 select(["not a url", "", "datashare...: step3=${step3}`);
      expect(step3).assertEqual(3);
      const step4: string = subject.view(-16);
      logInfo(`step4 view(-16): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.view(170);
      logInfo(`step5 view(170): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`view>view>select>view>view final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`view>view>select>view>view final: JSON.stringify(subject.fileAr...${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray)).assertEqual('["not a url","","datashare:///media/image/1"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0183 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0184
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0184
     * @tc.desc      DlpListState call flow titleAt > titleAt > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0184 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(-82);
      logInfo(`step1 titleAt(-82): step1=${step1}`);
      expect(step1).assertEqual('Text-81');
      const step2: string = subject.titleAt(68);
      logInfo(`step2 titleAt(68): step2=${step2}`);
      expect(step2).assertEqual('Text69');
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`titleAt>titleAt>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0184 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0185
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0185
     * @tc.desc      DlpListState call flow titleAt > titleAt > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0185 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(110);
      logInfo(`step1 titleAt(110): step1=${step1}`);
      expect(step1).assertEqual('Text111');
      const step2: string = subject.titleAt(190);
      logInfo(`step2 titleAt(190): step2=${step2}`);
      expect(step2).assertEqual('Text191');
      const step3: number = subject.select(['file://media/Photo/1/IMG_1.jpg', 'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step3 select(["file://media/Photo/1/IMG_1...: step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`titleAt>titleAt>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(2);
      logInfo(`titleAt>titleAt>select final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["file://media/Photo/1/IMG_1.jpg","file://media/Photo/1/IMG_1.jpg"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0185 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0186
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0186
     * @tc.desc      DlpListState call flow sift > select > select > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0186 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3',
        'file://media/Photo/1/IMG_1.jpg', 'datashare:///media/image/1', '']);
      logInfo(`step2 select(["https://example.com/media/...: step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: number = subject.select(['https://example.com/media/video.mp4']);
      logInfo(`step3 select(["https://example.com/media/...: step3=${step3}`);
      expect(step3).assertEqual(4);
      const step4: string = subject.view(164);
      logInfo(`step4 view(164): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`sift>select>select>view final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(4);
      logInfo(`sift>select>select>view final: JSON.stringify(subje...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`sift>select>select>view final: JSON.stringify(subje...${JSON.stringify(subject.fileArray.slice(2, 3))}`);
      expect(JSON.stringify(subject.fileArray.slice(2, 3))).assertEqual('["file://media/Photo/1/IMG_1.jpg"]');
      logInfo(`sift>select>select>view final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0186 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0187
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0187
     * @tc.desc      DlpListState call flow sift > view > select > select > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0187 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.view(26.67);
      logInfo(`step2 view(26.67): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step3 select(["not a url", "", "datashare...: step3=${step3}`);
      expect(step3).assertEqual(3);
      const step4: number = subject.select(['https://example.com/media/video.mp4']);
      logInfo(`step4 select(["https://example.com/media/...: step4=${step4}`);
      expect(step4).assertEqual(4);
      const step5: number = subject.sift();
      logInfo(`step5 sift(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`sift>view>select>select>sift final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(4);
      logInfo(`sift>view>select>select>sift final: JSON.stringify(...${JSON.stringify(subject.fileArray.slice(0, 3))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 3)))
        .assertEqual('["not a url","","datashare:///media/image/1"]');
      logInfo(`sift>view>select>select>sift final: JSON.stringify(...${JSON.stringify(subject.fileArray.slice(3, 4))}`);
      expect(JSON.stringify(subject.fileArray.slice(3, 4))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`sift>view>select>select>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0187 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0188
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0188
     * @tc.desc      DlpListState call flow titleAt > titleAt > sift > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0188 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(155);
      logInfo(`step1 titleAt(155): step1=${step1}`);
      expect(step1).assertEqual('Text156');
      const step2: string = subject.titleAt(13);
      logInfo(`step2 titleAt(13): step2=${step2}`);
      expect(step2).assertEqual('Text14');
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.titleAt(100);
      logInfo(`step4 titleAt(100): step4=${step4}`);
      expect(step4).assertEqual('Text101');
      logInfo(`titleAt>titleAt>sift>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0188 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0189
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0189
     * @tc.desc      DlpListState call flow view > select > view > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0189 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(5);
      logInfo(`step1 view(5): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step2 select(["not a url", "", "datashare...: step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: string = subject.view(160);
      logInfo(`step3 view(160): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.select(['http://example.com/a.mp3', 'https://example.com/media/video.mp4',
        'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step4 select(["http://example.com/a.mp3",...: step4=${step4}`);
      expect(step4).assertEqual(6);
      logInfo(`view>select>view>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(6);
      logInfo(`view>select>view>select final: JSON.stringify(subje...${JSON.stringify(subject.fileArray.slice(0, 3))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 3)))
        .assertEqual('["not a url","","datashare:///media/image/1"]');
      logInfo(`view>select>view>select final: JSON.stringify(subje...${JSON.stringify(subject.fileArray.slice(4, 5))}`);
      expect(JSON.stringify(subject.fileArray.slice(4, 5))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0189 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0190
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0190
     * @tc.desc      DlpListState call flow sift > titleAt > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0190 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.titleAt(17.06);
      logInfo(`step2 titleAt(17.06): step2=${step2}`);
      expect(step2).assertEqual('Text18.06');
      const step3: string = subject.titleAt(47.97);
      logInfo(`step3 titleAt(47.97): step3=${step3}`);
      expect(step3).assertEqual('Text48.97');
      logInfo(`sift>titleAt>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0190 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0191
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0191
     * @tc.desc      DlpListState call flow sift > select > select > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0191 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step2 select(["not a url", "", "datashare...: step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: number = subject.select([]);
      logInfo(`step3 select([]): step3=${step3}`);
      expect(step3).assertEqual(3);
      const step4: string = subject.view(100);
      logInfo(`step4 view(100): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`sift>select>select>view final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`sift>select>select>view final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray)).assertEqual('["not a url","","datashare:///media/image/1"]');
      logInfo(`sift>select>select>view final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0191 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0192
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0192
     * @tc.desc      DlpListState call flow sift > select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0192 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.select(['datashare:///media/image/1', 'http://example.com/a.mp3', '',
        'http://example.com/a.mp3', 'not a url']);
      logInfo(`step2 select(["datashare:///media/image/1...: step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: number = subject.select(['datashare:///media/image/1', 'http://example.com/a.mp3', '',
        'http://example.com/a.mp3', 'not a url']);
      logInfo(`step3 select(["datashare:///media/image/1...: step3=${step3}`);
      expect(step3).assertEqual(6);
      logInfo(`sift>select>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(6);
      logInfo(`sift>select>select final: JSON.stringify(subject.fi...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["datashare:///media/image/1"]');
      logInfo(`sift>select>select final: JSON.stringify(subject.fi...${JSON.stringify(subject.fileArray.slice(3, 4))}`);
      expect(JSON.stringify(subject.fileArray.slice(3, 4))).assertEqual('["datashare:///media/image/1"]');
      logInfo(`sift>select>select final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0192 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0193
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0193
     * @tc.desc      DlpListState call flow titleAt > titleAt > select > titleAt > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0193 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(112);
      logInfo(`step1 titleAt(112): step1=${step1}`);
      expect(step1).assertEqual('Text113');
      const step2: string = subject.titleAt(25);
      logInfo(`step2 titleAt(25): step2=${step2}`);
      expect(step2).assertEqual('Text26');
      const step3: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step3 select(["https://example.com/media/...: step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: string = subject.titleAt(102);
      logInfo(`step4 titleAt(102): step4=${step4}`);
      expect(step4).assertEqual('Text103');
      const step5: number = subject.sift();
      logInfo(`step5 sift(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`titleAt>titleAt>select>titleAt>sift final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(2);
      logInfo(`titleAt>titleAt>select>titleAt>sift final: JSON.stringify(subje...${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["https://example.com/media/video.mp4","http://example.com/a.mp3"]');
      logInfo(`titleAt>titleAt>select>titleAt>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0193 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0194
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0194
     * @tc.desc      DlpListState call flow select > view > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0194 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['datashare:///media/image/1', 'http://example.com/a.mp3', '',
        'http://example.com/a.mp3', 'not a url']);
      logInfo(`step1 select(["datashare:///media/image/1...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: string = subject.view(30);
      logInfo(`step2 view(30): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`select>view>sift final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`select>view>sift final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["datashare:///media/image/1","http://example.com/a.mp3",""]');
      logInfo(`select>view>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0194 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0195
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0195
     * @tc.desc      DlpListState call flow select > select > view > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0195 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['http://example.com/a.mp3', 'https://example.com/media/video.mp4',
        'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step1 select(["http://example.com/a.mp3",...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: number = subject.select([]);
      logInfo(`step2 select([]): step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: string = subject.view(105);
      logInfo(`step3 view(105): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step4 select(["https://example.com/media/...: step4=${step4}`);
      expect(step4).assertEqual(5);
      logInfo(`select>select>view>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(5);
      logInfo(`select>select>view>select final: JSON.stringify(sub...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`select>select>view>select final: JSON.stringify(sub...${JSON.stringify(subject.fileArray.slice(2, 3))}`);
      expect(JSON.stringify(subject.fileArray.slice(2, 3))).assertEqual('["file://media/Photo/1/IMG_1.jpg"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0195 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0196
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0196
     * @tc.desc      DlpListState call flow view > sift > titleAt > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0196 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(137);
      logInfo(`step1 view(137): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.titleAt(-66);
      logInfo(`step3 titleAt(-66): step3=${step3}`);
      expect(step3).assertEqual('Text-65');
      const step4: string = subject.view(29);
      logInfo(`step4 view(29): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`view>sift>titleAt>view final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0196 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0197
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0197
     * @tc.desc      DlpListState call flow sift > sift > sift > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0197 begin`);
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
      const step4: string = subject.view(176);
      logInfo(`step4 view(176): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`sift>sift>sift>view final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(3);
      logInfo(`${BUNDLE}DlpListStateFlow_0197 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0198
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0198
     * @tc.desc      DlpListState call flow select > titleAt > sift > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0198 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step1 select(["not a url", "", "datashare...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: string = subject.titleAt(-83);
      logInfo(`step2 titleAt(-83): step2=${step2}`);
      expect(step2).assertEqual('Text-82');
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.titleAt(140);
      logInfo(`step4 titleAt(140): step4=${step4}`);
      expect(step4).assertEqual('Text141');
      logInfo(`select>titleAt>sift>titleAt final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`select>titleAt>sift>titleAt final: JSON.stringify(subject.fileA...${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray)).assertEqual('["not a url","","datashare:///media/image/1"]');
      logInfo(`select>titleAt>sift>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0198 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0199
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0199
     * @tc.desc      DlpListState call flow select > sift > sift > sift > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0199 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['datashare:///media/image/1', 'http://example.com/a.mp3', '',
        'http://example.com/a.mp3', 'not a url']);
      logInfo(`step1 select(["datashare:///media/image/1...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.sift();
      logInfo(`step4 sift(): step4=${step4}`);
      expect(step4).assertEqual(3);
      const step5: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step5 select(["not a url", "", "datashare...: step5=${step5}`);
      expect(step5).assertEqual(6);
      logInfo(`select>sift>sift>sift>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(6);
      logInfo(`select>sift>sift>sift>select final: JSON.stringify(...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["datashare:///media/image/1"]');
      logInfo(`select>sift>sift>sift>select final: JSON.stringify(...${JSON.stringify(subject.fileArray.slice(1, 5))}`);
      expect(JSON.stringify(subject.fileArray.slice(1, 5)))
        .assertEqual('["http://example.com/a.mp3","","not a url",""]');
      logInfo(`select>sift>sift>sift>select final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(3);
      logInfo(`${BUNDLE}DlpListStateFlow_0199 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0200
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0200
     * @tc.desc      DlpListState call flow view > select > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0200 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(166);
      logInfo(`step1 view(166): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.select(['https://example.com/media/video.mp4']);
      logInfo(`step2 select(["https://example.com/media/...: step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.view(-71);
      logInfo(`step3 view(-71): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`view>select>view final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(1);
      logInfo(`view>select>view final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray)).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0200 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0201
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0201
     * @tc.desc      DlpListState call flow sift > sift > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0201 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: string = subject.titleAt(15.43);
      logInfo(`step3 titleAt(15.43): step3=${step3}`);
      expect(step3).assertEqual('Text16.43');
      logInfo(`sift>sift>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0201 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0202
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0202
     * @tc.desc      DlpListState call flow sift > titleAt > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0202 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.titleAt(102);
      logInfo(`step2 titleAt(102): step2=${step2}`);
      expect(step2).assertEqual('Text103');
      const step3: string = subject.view(88);
      logInfo(`step3 view(88): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`sift>titleAt>view final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0202 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0203
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0203
     * @tc.desc      DlpListState call flow select > select > select > view > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0203 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step1 select(["not a url", "", "datashare...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: number = subject.select(['datashare:///media/image/1', 'http://example.com/a.mp3', '',
        'http://example.com/a.mp3', 'not a url']);
      logInfo(`step2 select(["datashare:///media/image/1...: step2=${step2}`);
      expect(step2).assertEqual(6);
      const step3: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step3 select(["https://example.com/media/...: step3=${step3}`);
      expect(step3).assertEqual(8);
      const step4: string = subject.view(2);
      logInfo(`step4 view(2): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(73);
      logInfo(`step4 view(2): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('{"action":"ohos.want.action.view');
      logInfo(`step4 view(2): step4.substring(41)=${step4.substring(41)}`);
      expect(step4.substring(41)).assertEqual('i":"datashare:///media/image/1"}');
      const step5: string = subject.titleAt(0.37);
      logInfo(`step5 titleAt(0.37): step5=${step5}`);
      expect(step5).assertEqual('Text1.37');
      logInfo(`select>select>select>view>titleAt final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(8);
      logInfo(`select>select>select>view>titleAt final: JSON.strin...${JSON.stringify(subject.fileArray.slice(0, 3))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 3)))
        .assertEqual('["not a url","","datashare:///media/image/1"]');
      logInfo(`select>select>select>view>titleAt final: JSON.strin...${JSON.stringify(subject.fileArray.slice(4, 6))}`);
      expect(JSON.stringify(subject.fileArray.slice(4, 6))).assertEqual('["http://example.com/a.mp3",""]');
      logInfo(`select>select>select>view>titleAt final: subject.lastViewed=${subject.lastViewed}`);
      expect(subject.lastViewed).assertEqual('datashare:///media/image/1');
      logInfo(`select>select>select>view>titleAt final: subject.viewCount=${subject.viewCount}`);
      expect(subject.viewCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0203 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0204
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0204
     * @tc.desc      DlpListState call flow titleAt > sift > view > view > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0204 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(54.81);
      logInfo(`step1 titleAt(54.81): step1=${step1}`);
      expect(step1).assertEqual('Text55.81');
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.view(8);
      logInfo(`step3 view(8): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.view(8);
      logInfo(`step4 view(8): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.view(37);
      logInfo(`step5 view(37): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`titleAt>sift>view>view>view final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0204 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0205
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0205
     * @tc.desc      DlpListState call flow titleAt > select > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0205 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(54.81);
      logInfo(`step1 titleAt(54.81): step1=${step1}`);
      expect(step1).assertEqual('Text55.81');
      const step2: number = subject.select(['https://example.com/media/video.mp4']);
      logInfo(`step2 select(["https://example.com/media/...: step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.view(145);
      logInfo(`step3 view(145): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`titleAt>select>view final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(1);
      logInfo(`titleAt>select>view final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray)).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0205 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0206
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0206
     * @tc.desc      DlpListState call flow view > titleAt > sift > select > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0206 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(10);
      logInfo(`step1 view(10): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.titleAt(100);
      logInfo(`step2 titleAt(100): step2=${step2}`);
      expect(step2).assertEqual('Text101');
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.select(['file://media/Photo/1/IMG_1.jpg', 'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step4 select(["file://media/Photo/1/IMG_1...: step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: string = subject.titleAt(-1);
      logInfo(`step5 titleAt(-1): step5=${step5}`);
      expect(step5).assertEqual('Text0');
      logInfo(`view>titleAt>sift>select>titleAt final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(2);
      logInfo(`view>titleAt>sift>select>titleAt final: JSON.stringify(subject....${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["file://media/Photo/1/IMG_1.jpg","file://media/Photo/1/IMG_1.jpg"]');
      logInfo(`view>titleAt>sift>select>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0206 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0207
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0207
     * @tc.desc      DlpListState call flow titleAt > view > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0207 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(32.71);
      logInfo(`step1 titleAt(32.71): step1=${step1}`);
      expect(step1).assertEqual('Text33.71');
      const step2: string = subject.view(121);
      logInfo(`step2 view(121): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.titleAt(88.55);
      logInfo(`step3 titleAt(88.55): step3=${step3}`);
      expect(step3).assertEqual('Text89.55');
      logInfo(`${BUNDLE}DlpListStateFlow_0207 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0208
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0208
     * @tc.desc      DlpListState call flow titleAt > select > titleAt > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0208 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(75);
      logInfo(`step1 titleAt(75): step1=${step1}`);
      expect(step1).assertEqual('Text76');
      const step2: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3',
        'file://media/Photo/1/IMG_1.jpg', 'datashare:///media/image/1', '']);
      logInfo(`step2 select(["https://example.com/media/...: step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: string = subject.titleAt(109);
      logInfo(`step3 titleAt(109): step3=${step3}`);
      expect(step3).assertEqual('Text110');
      const step4: number = subject.sift();
      logInfo(`step4 sift(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`titleAt>select>titleAt>sift final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`titleAt>select>titleAt>sift final: JSON.stringify(s...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`titleAt>select>titleAt>sift final: JSON.stringify(s...${JSON.stringify(subject.fileArray.slice(1, 2))}`);
      expect(JSON.stringify(subject.fileArray.slice(1, 2))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`titleAt>select>titleAt>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0208 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0209
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0209
     * @tc.desc      DlpListState call flow view > sift > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0209 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(96.98);
      logInfo(`step1 view(96.98): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.select(['datashare:///media/image/1', 'http://example.com/a.mp3', '',
        'http://example.com/a.mp3', 'not a url']);
      logInfo(`step3 select(["datashare:///media/image/1...: step3=${step3}`);
      expect(step3).assertEqual(3);
      logInfo(`view>sift>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`view>sift>select final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["datashare:///media/image/1","http://example.com/a.mp3",""]');
      logInfo(`view>sift>select final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0209 end`);
    });
  });
}
