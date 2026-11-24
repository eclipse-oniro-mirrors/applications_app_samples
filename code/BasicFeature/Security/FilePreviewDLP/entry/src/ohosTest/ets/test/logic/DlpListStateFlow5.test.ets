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

/** Logic checks for DlpListState flow (51 cases). */
export default function dlpListStateFlow5Test(): void {
  describe('DlpListStateFlow5Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0210
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0210
     * @tc.desc      DlpListState call flow select > select > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0210 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['http://example.com/a.mp3', 'https://example.com/media/video.mp4',
        'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step1 select(["http://example.com/a.mp3",...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: number = subject.select(['https://example.com/media/video.mp4']);
      logInfo(`step2 select(["https://example.com/media/...: step2=${step2}`);
      expect(step2).assertEqual(4);
      const step3: string = subject.titleAt(31);
      logInfo(`step3 titleAt(31): step3=${step3}`);
      expect(step3).assertEqual('Text32');
      logInfo(`select>select>titleAt final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(4);
      logInfo(`select>select>titleAt final: JSON.stringify(subject...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`select>select>titleAt final: JSON.stringify(subject...${JSON.stringify(subject.fileArray.slice(2, 3))}`);
      expect(JSON.stringify(subject.fileArray.slice(2, 3))).assertEqual('["file://media/Photo/1/IMG_1.jpg"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0210 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0211
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0211
     * @tc.desc      DlpListState call flow view > titleAt > view > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0211 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(140);
      logInfo(`step1 view(140): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.titleAt(130);
      logInfo(`step2 titleAt(130): step2=${step2}`);
      expect(step2).assertEqual('Text131');
      const step3: string = subject.view(96);
      logInfo(`step3 view(96): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.titleAt(-4);
      logInfo(`step4 titleAt(-4): step4=${step4}`);
      expect(step4).assertEqual('Text-3');
      logInfo(`${BUNDLE}DlpListStateFlow_0211 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0212
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0212
     * @tc.desc      DlpListState call flow titleAt > select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0212 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(54.81);
      logInfo(`step1 titleAt(54.81): step1=${step1}`);
      expect(step1).assertEqual('Text55.81');
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
      logInfo(`${BUNDLE}DlpListStateFlow_0212 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0213
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0213
     * @tc.desc      DlpListState call flow view > sift > select > select > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0213 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(-79);
      logInfo(`step1 view(-79): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.select(['http://example.com/a.mp3', 'https://example.com/media/video.mp4',
        'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step3 select(["http://example.com/a.mp3",...: step3=${step3}`);
      expect(step3).assertEqual(3);
      const step4: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step4 select(["https://example.com/media/...: step4=${step4}`);
      expect(step4).assertEqual(5);
      const step5: number = subject.sift();
      logInfo(`step5 sift(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`view>sift>select>select>sift final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(5);
      logInfo(`view>sift>select>select>sift final: JSON.stringify(...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`view>sift>select>select>sift final: JSON.stringify(...${JSON.stringify(subject.fileArray.slice(2, 3))}`);
      expect(JSON.stringify(subject.fileArray.slice(2, 3))).assertEqual('["file://media/Photo/1/IMG_1.jpg"]');
      logInfo(`view>sift>select>select>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0213 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0214
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0214
     * @tc.desc      DlpListState call flow sift > sift > titleAt > sift > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0214 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: string = subject.titleAt(88.55);
      logInfo(`step3 titleAt(88.55): step3=${step3}`);
      expect(step3).assertEqual('Text89.55');
      const step4: number = subject.sift();
      logInfo(`step4 sift(): step4=${step4}`);
      expect(step4).assertEqual(3);
      const step5: number = subject.sift();
      logInfo(`step5 sift(): step5=${step5}`);
      expect(step5).assertEqual(4);
      logInfo(`sift>sift>titleAt>sift>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(4);
      logInfo(`${BUNDLE}DlpListStateFlow_0214 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0215
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0215
     * @tc.desc      DlpListState call flow view > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0215 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(88.34);
      logInfo(`step1 view(88.34): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.titleAt(10);
      logInfo(`step2 titleAt(10): step2=${step2}`);
      expect(step2).assertEqual('Text11');
      logInfo(`${BUNDLE}DlpListStateFlow_0215 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0216
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0216
     * @tc.desc      DlpListState call flow sift > titleAt > sift > view > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0216 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.titleAt(59);
      logInfo(`step2 titleAt(59): step2=${step2}`);
      expect(step2).assertEqual('Text60');
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: string = subject.view(130);
      logInfo(`step4 view(130): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: number = subject.select(['datashare:///media/image/1', 'http://example.com/a.mp3', '',
        'http://example.com/a.mp3', 'not a url']);
      logInfo(`step5 select(["datashare:///media/image/1...: step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`sift>titleAt>sift>view>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`sift>titleAt>sift>view>select final: JSON.stringify(subject.fil...${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["datashare:///media/image/1","http://example.com/a.mp3",""]');
      logInfo(`sift>titleAt>sift>view>select final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0216 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0217
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0217
     * @tc.desc      DlpListState call flow titleAt > sift > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0217 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(17.06);
      logInfo(`step1 titleAt(17.06): step1=${step1}`);
      expect(step1).assertEqual('Text18.06');
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.titleAt(61.53);
      logInfo(`step3 titleAt(61.53): step3=${step3}`);
      expect(step3).assertEqual('Text62.53');
      logInfo(`titleAt>sift>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0217 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0218
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0218
     * @tc.desc      DlpListState call flow view > sift > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0218 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(125);
      logInfo(`step1 view(125): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.titleAt(75);
      logInfo(`step3 titleAt(75): step3=${step3}`);
      expect(step3).assertEqual('Text76');
      logInfo(`view>sift>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0218 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0219
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0219
     * @tc.desc      DlpListState call flow titleAt > titleAt > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0219 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(49.74);
      logInfo(`step1 titleAt(49.74): step1=${step1}`);
      expect(step1).assertEqual('Text50.74');
      const step2: string = subject.titleAt(130);
      logInfo(`step2 titleAt(130): step2=${step2}`);
      expect(step2).assertEqual('Text131');
      const step3: string = subject.titleAt(200);
      logInfo(`step3 titleAt(200): step3=${step3}`);
      expect(step3).assertEqual('Text201');
      logInfo(`${BUNDLE}DlpListStateFlow_0219 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0220
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0220
     * @tc.desc      DlpListState call flow titleAt > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0220 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(-77);
      logInfo(`step1 titleAt(-77): step1=${step1}`);
      expect(step1).assertEqual('Text-76');
      const step2: number = subject.select(['datashare:///media/image/1', 'http://example.com/a.mp3', '',
        'http://example.com/a.mp3', 'not a url']);
      logInfo(`step2 select(["datashare:///media/image/1...: step2=${step2}`);
      expect(step2).assertEqual(3);
      logInfo(`titleAt>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`titleAt>select final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["datashare:///media/image/1","http://example.com/a.mp3",""]');
      logInfo(`${BUNDLE}DlpListStateFlow_0220 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0221
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0221
     * @tc.desc      DlpListState call flow select > view > view > titleAt > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0221 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step1 select(["https://example.com/media/...: step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: string = subject.view(-7);
      logInfo(`step2 view(-7): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.view(-2);
      logInfo(`step3 view(-2): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.titleAt(45);
      logInfo(`step4 titleAt(45): step4=${step4}`);
      expect(step4).assertEqual('Text46');
      const step5: string = subject.view(200);
      logInfo(`step5 view(200): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`select>view>view>titleAt>view final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(2);
      logInfo(`select>view>view>titleAt>view final: JSON.stringify(subject.fil...${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["https://example.com/media/video.mp4","http://example.com/a.mp3"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0221 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0222
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0222
     * @tc.desc      DlpListState call flow sift > titleAt > sift > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0222 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.titleAt(-26);
      logInfo(`step2 titleAt(-26): step2=${step2}`);
      expect(step2).assertEqual('Text-25');
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: string = subject.view(48.66);
      logInfo(`step4 view(48.66): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`sift>titleAt>sift>view final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0222 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0223
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0223
     * @tc.desc      DlpListState call flow select > sift > titleAt > view > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0223 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step1 select(["not a url", "", "datashare...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.titleAt(97);
      logInfo(`step3 titleAt(97): step3=${step3}`);
      expect(step3).assertEqual('Text98');
      const step4: string = subject.view(0);
      logInfo(`step4 view(0): step4=${step4}`);
      expect(step4).assertEqual('{"action":"ohos.want.action.viewData","uri":"not a url"}');
      const step5: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step5 select(["not a url", "", "datashare...: step5=${step5}`);
      expect(step5).assertEqual(6);
      logInfo(`select>sift>titleAt>view>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(6);
      logInfo(`select>sift>titleAt>view>select final: JSON.stringi...${JSON.stringify(subject.fileArray.slice(0, 3))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 3)))
        .assertEqual('["not a url","","datashare:///media/image/1"]');
      logInfo(`select>sift>titleAt>view>select final: JSON.stringi...${JSON.stringify(subject.fileArray.slice(3, 6))}`);
      expect(JSON.stringify(subject.fileArray.slice(3, 6)))
        .assertEqual('["not a url","","datashare:///media/image/1"]');
      logInfo(`select>sift>titleAt>view>select final: subject.lastViewed=${subject.lastViewed}`);
      expect(subject.lastViewed).assertEqual('not a url');
      logInfo(`select>sift>titleAt>view>select final: subject.viewCount=${subject.viewCount}`);
      expect(subject.viewCount).assertEqual(1);
      logInfo(`select>sift>titleAt>view>select final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0223 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0224
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0224
     * @tc.desc      DlpListState call flow titleAt > titleAt > titleAt > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0224 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(120);
      logInfo(`step1 titleAt(120): step1=${step1}`);
      expect(step1).assertEqual('Text121');
      const step2: string = subject.titleAt(75);
      logInfo(`step2 titleAt(75): step2=${step2}`);
      expect(step2).assertEqual('Text76');
      const step3: string = subject.titleAt(31);
      logInfo(`step3 titleAt(31): step3=${step3}`);
      expect(step3).assertEqual('Text32');
      const step4: number = subject.select(['https://example.com/media/video.mp4']);
      logInfo(`step4 select(["https://example.com/media/...: step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`titleAt>titleAt>titleAt>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(1);
      logInfo(`titleAt>titleAt>titleAt>select final: JSON.stringify(subject.fi...${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray)).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0224 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0225
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0225
     * @tc.desc      DlpListState call flow select > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0225 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['file://media/Photo/1/IMG_1.jpg', 'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step1 select(["file://media/Photo/1/IMG_1...: step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: string = subject.titleAt(130);
      logInfo(`step2 titleAt(130): step2=${step2}`);
      expect(step2).assertEqual('Text131');
      logInfo(`select>titleAt final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(2);
      logInfo(`select>titleAt final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["file://media/Photo/1/IMG_1.jpg","file://media/Photo/1/IMG_1.jpg"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0225 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0226
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0226
     * @tc.desc      DlpListState call flow sift > sift > titleAt > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0226 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: string = subject.titleAt(77);
      logInfo(`step3 titleAt(77): step3=${step3}`);
      expect(step3).assertEqual('Text78');
      const step4: string = subject.titleAt(28);
      logInfo(`step4 titleAt(28): step4=${step4}`);
      expect(step4).assertEqual('Text29');
      logInfo(`sift>sift>titleAt>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0226 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0227
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0227
     * @tc.desc      DlpListState call flow titleAt > view > sift > view > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0227 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(102);
      logInfo(`step1 titleAt(102): step1=${step1}`);
      expect(step1).assertEqual('Text103');
      const step2: string = subject.view(70);
      logInfo(`step2 view(70): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.view(72.54);
      logInfo(`step4 view(72.54): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step5 select(["not a url", "", "datashare...: step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`titleAt>view>sift>view>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`titleAt>view>sift>view>select final: JSON.stringify(subject.fil...${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray)).assertEqual('["not a url","","datashare:///media/image/1"]');
      logInfo(`titleAt>view>sift>view>select final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0227 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0228
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0228
     * @tc.desc      DlpListState call flow view > view > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0228 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(82.94);
      logInfo(`step1 view(82.94): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.view(75);
      logInfo(`step2 view(75): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.titleAt(-77);
      logInfo(`step3 titleAt(-77): step3=${step3}`);
      expect(step3).assertEqual('Text-76');
      logInfo(`${BUNDLE}DlpListStateFlow_0228 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0229
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0229
     * @tc.desc      DlpListState call flow select > titleAt > select > sift > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0229 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select([]);
      logInfo(`step1 select([]): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.titleAt(150);
      logInfo(`step2 titleAt(150): step2=${step2}`);
      expect(step2).assertEqual('Text151');
      const step3: number = subject.select(['datashare:///media/image/1', 'http://example.com/a.mp3', '',
        'http://example.com/a.mp3', 'not a url']);
      logInfo(`step3 select(["datashare:///media/image/1...: step3=${step3}`);
      expect(step3).assertEqual(3);
      const step4: number = subject.sift();
      logInfo(`step4 sift(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.sift();
      logInfo(`step5 sift(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`select>titleAt>select>sift>sift final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`select>titleAt>select>sift>sift final: JSON.stringify(subject.f...${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["datashare:///media/image/1","http://example.com/a.mp3",""]');
      logInfo(`select>titleAt>select>sift>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0229 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0230
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0230
     * @tc.desc      DlpListState call flow view > titleAt > titleAt > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0230 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(170);
      logInfo(`step1 view(170): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.titleAt(5);
      logInfo(`step2 titleAt(5): step2=${step2}`);
      expect(step2).assertEqual('Text6');
      const step3: string = subject.titleAt(15);
      logInfo(`step3 titleAt(15): step3=${step3}`);
      expect(step3).assertEqual('Text16');
      const step4: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step4 select(["https://example.com/media/...: step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`view>titleAt>titleAt>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(2);
      logInfo(`view>titleAt>titleAt>select final: JSON.stringify(subject.fileA...${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["https://example.com/media/video.mp4","http://example.com/a.mp3"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0230 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0231
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0231
     * @tc.desc      DlpListState call flow titleAt > view > sift > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0231 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(5);
      logInfo(`step1 titleAt(5): step1=${step1}`);
      expect(step1).assertEqual('Text6');
      const step2: string = subject.view(144);
      logInfo(`step2 view(144): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.titleAt(-4);
      logInfo(`step4 titleAt(-4): step4=${step4}`);
      expect(step4).assertEqual('Text-3');
      logInfo(`titleAt>view>sift>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0231 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0232
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0232
     * @tc.desc      DlpListState call flow select > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0232 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['http://example.com/a.mp3', 'https://example.com/media/video.mp4',
        'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step1 select(["http://example.com/a.mp3",...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: string = subject.view(-54);
      logInfo(`step2 view(-54): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`select>view final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`select>view final: JSON.stringify(subject.fileArray...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`select>view final: JSON.stringify(subject.fileArray...${JSON.stringify(subject.fileArray.slice(1, 2))}`);
      expect(JSON.stringify(subject.fileArray.slice(1, 2))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0232 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0233
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0233
     * @tc.desc      DlpListState call flow view > titleAt > sift > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0233 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(-39);
      logInfo(`step1 view(-39): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.titleAt(61);
      logInfo(`step2 titleAt(61): step2=${step2}`);
      expect(step2).assertEqual('Text62');
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.view(21);
      logInfo(`step4 view(21): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`view>titleAt>sift>view final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0233 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0234
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0234
     * @tc.desc      DlpListState call flow view > titleAt > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0234 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(85);
      logInfo(`step1 view(85): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.titleAt(46.54);
      logInfo(`step2 titleAt(46.54): step2=${step2}`);
      expect(step2).assertEqual('Text47.54');
      const step3: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step3 select(["https://example.com/media/...: step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`view>titleAt>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(2);
      logInfo(`view>titleAt>select final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["https://example.com/media/video.mp4","http://example.com/a.mp3"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0234 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0235
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0235
     * @tc.desc      DlpListState call flow select > view > select > view > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0235 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3',
        'file://media/Photo/1/IMG_1.jpg', 'datashare:///media/image/1', '']);
      logInfo(`step1 select(["https://example.com/media/...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: string = subject.view(53.98);
      logInfo(`step2 view(53.98): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.select(['file://media/Photo/1/IMG_1.jpg', 'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step3 select(["file://media/Photo/1/IMG_1...: step3=${step3}`);
      expect(step3).assertEqual(5);
      const step4: string = subject.view(-86);
      logInfo(`step4 view(-86): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.titleAt(102);
      logInfo(`step5 titleAt(102): step5=${step5}`);
      expect(step5).assertEqual('Text103');
      logInfo(`select>view>select>view>titleAt final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(5);
      logInfo(`select>view>select>view>titleAt final: JSON.stringi...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`select>view>select>view>titleAt final: JSON.stringi...${JSON.stringify(subject.fileArray.slice(2, 3))}`);
      expect(JSON.stringify(subject.fileArray.slice(2, 3))).assertEqual('["file://media/Photo/1/IMG_1.jpg"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0235 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0236
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0236
     * @tc.desc      DlpListState call flow view > select > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0236 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(41.9);
      logInfo(`step1 view(41.9): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.select(['http://example.com/a.mp3', 'https://example.com/media/video.mp4',
        'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step2 select(["http://example.com/a.mp3",...: step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`view>select>sift final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`view>select>sift final: JSON.stringify(subject.file...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`view>select>sift final: JSON.stringify(subject.file...${JSON.stringify(subject.fileArray.slice(1, 2))}`);
      expect(JSON.stringify(subject.fileArray.slice(1, 2))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`view>select>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0236 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0237
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0237
     * @tc.desc      DlpListState call flow sift > select > select > titleAt > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0237 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step2 select(["not a url", "", "datashare...: step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step3 select(["not a url", "", "datashare...: step3=${step3}`);
      expect(step3).assertEqual(6);
      const step4: string = subject.titleAt(30.61);
      logInfo(`step4 titleAt(30.61): step4=${step4}`);
      expect(step4).assertEqual('Text31.61');
      const step5: string = subject.view(42.16);
      logInfo(`step5 view(42.16): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`sift>select>select>titleAt>view final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(6);
      logInfo(`sift>select>select>titleAt>view final: JSON.stringi...${JSON.stringify(subject.fileArray.slice(0, 3))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 3)))
        .assertEqual('["not a url","","datashare:///media/image/1"]');
      logInfo(`sift>select>select>titleAt>view final: JSON.stringi...${JSON.stringify(subject.fileArray.slice(3, 6))}`);
      expect(JSON.stringify(subject.fileArray.slice(3, 6)))
        .assertEqual('["not a url","","datashare:///media/image/1"]');
      logInfo(`sift>select>select>titleAt>view final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0237 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0238
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0238
     * @tc.desc      DlpListState call flow sift > sift > view > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0238 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: string = subject.view(170);
      logInfo(`step3 view(170): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.view(84.61);
      logInfo(`step4 view(84.61): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`sift>sift>view>view final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0238 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0239
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0239
     * @tc.desc      DlpListState call flow titleAt > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0239 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(110);
      logInfo(`step1 titleAt(110): step1=${step1}`);
      expect(step1).assertEqual('Text111');
      const step2: string = subject.view(37);
      logInfo(`step2 view(37): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateFlow_0239 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0240
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0240
     * @tc.desc      DlpListState call flow view > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0240 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(70.38);
      logInfo(`step1 view(70.38): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.titleAt(101);
      logInfo(`step2 titleAt(101): step2=${step2}`);
      expect(step2).assertEqual('Text102');
      logInfo(`${BUNDLE}DlpListStateFlow_0240 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0241
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0241
     * @tc.desc      DlpListState call flow select > sift > sift > select > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0241 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['https://example.com/media/video.mp4']);
      logInfo(`step1 select(["https://example.com/media/...: step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.select([]);
      logInfo(`step4 select([]): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.sift();
      logInfo(`step5 sift(): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`select>sift>sift>select>sift final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(1);
      logInfo(`select>sift>sift>select>sift final: JSON.stringify(subject.file...${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray)).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`select>sift>sift>select>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(3);
      logInfo(`${BUNDLE}DlpListStateFlow_0241 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0242
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0242
     * @tc.desc      DlpListState call flow view > view > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0242 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(-95);
      logInfo(`step1 view(-95): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.view(60);
      logInfo(`step2 view(60): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step3 select(["https://example.com/media/...: step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`view>view>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(2);
      logInfo(`view>view>select final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["https://example.com/media/video.mp4","http://example.com/a.mp3"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0242 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0243
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0243
     * @tc.desc      DlpListState call flow select > titleAt > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0243 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['https://example.com/media/video.mp4']);
      logInfo(`step1 select(["https://example.com/media/...: step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.titleAt(74);
      logInfo(`step2 titleAt(74): step2=${step2}`);
      expect(step2).assertEqual('Text75');
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`select>titleAt>sift final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(1);
      logInfo(`select>titleAt>sift final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray)).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`select>titleAt>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0243 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0244
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0244
     * @tc.desc      DlpListState call flow sift > view > sift > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0244 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.view(42.16);
      logInfo(`step2 view(42.16): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: string = subject.titleAt(3);
      logInfo(`step4 titleAt(3): step4=${step4}`);
      expect(step4).assertEqual('Text4');
      logInfo(`sift>view>sift>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0244 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0245
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0245
     * @tc.desc      DlpListState call flow select > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0245 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['datashare:///media/image/1', 'http://example.com/a.mp3', '',
        'http://example.com/a.mp3', 'not a url']);
      logInfo(`step1 select(["datashare:///media/image/1...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`select>sift final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`select>sift final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["datashare:///media/image/1","http://example.com/a.mp3",""]');
      logInfo(`select>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0245 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0246
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0246
     * @tc.desc      DlpListState call flow view > titleAt > view > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0246 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(-39);
      logInfo(`step1 view(-39): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.titleAt(45);
      logInfo(`step2 titleAt(45): step2=${step2}`);
      expect(step2).assertEqual('Text46');
      const step3: string = subject.view(51);
      logInfo(`step3 view(51): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.view(158);
      logInfo(`step4 view(158): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateFlow_0246 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0247
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0247
     * @tc.desc      DlpListState call flow view > sift > sift > view > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0247 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(21);
      logInfo(`step1 view(21): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: string = subject.view(29);
      logInfo(`step4 view(29): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.titleAt(-27);
      logInfo(`step5 titleAt(-27): step5=${step5}`);
      expect(step5).assertEqual('Text-26');
      logInfo(`view>sift>sift>view>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0247 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0248
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0248
     * @tc.desc      DlpListState call flow titleAt > view > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0248 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(74);
      logInfo(`step1 titleAt(74): step1=${step1}`);
      expect(step1).assertEqual('Text75');
      const step2: string = subject.view(-20);
      logInfo(`step2 view(-20): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.select([]);
      logInfo(`step3 select([]): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}DlpListStateFlow_0248 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0249
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0249
     * @tc.desc      DlpListState call flow sift > select > view > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0249 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step2 select(["not a url", "", "datashare...: step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: string = subject.view(82.94);
      logInfo(`step3 view(82.94): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.view(195);
      logInfo(`step4 view(195): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`sift>select>view>view final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`sift>select>view>view final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray)).assertEqual('["not a url","","datashare:///media/image/1"]');
      logInfo(`sift>select>view>view final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0249 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0250
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0250
     * @tc.desc      DlpListState call flow sift > titleAt > titleAt > sift > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0250 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.titleAt(15);
      logInfo(`step2 titleAt(15): step2=${step2}`);
      expect(step2).assertEqual('Text16');
      const step3: string = subject.titleAt(55);
      logInfo(`step3 titleAt(55): step3=${step3}`);
      expect(step3).assertEqual('Text56');
      const step4: number = subject.sift();
      logInfo(`step4 sift(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.select(['https://example.com/media/video.mp4']);
      logInfo(`step5 select(["https://example.com/media/...: step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`sift>titleAt>titleAt>sift>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(1);
      logInfo(`sift>titleAt>titleAt>sift>select final: JSON.stringify(subject....${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray)).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`sift>titleAt>titleAt>sift>select final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0250 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0251
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0251
     * @tc.desc      DlpListState call flow view > select > view > select > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0251 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(140);
      logInfo(`step1 view(140): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.select([]);
      logInfo(`step2 select([]): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.view(182);
      logInfo(`step3 view(182): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3',
        'file://media/Photo/1/IMG_1.jpg', 'datashare:///media/image/1', '']);
      logInfo(`step4 select(["https://example.com/media/...: step4=${step4}`);
      expect(step4).assertEqual(3);
      const step5: string = subject.titleAt(46.54);
      logInfo(`step5 titleAt(46.54): step5=${step5}`);
      expect(step5).assertEqual('Text47.54');
      logInfo(`view>select>view>select>titleAt final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`view>select>view>select>titleAt final: JSON.stringi...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`view>select>view>select>titleAt final: JSON.stringi...${JSON.stringify(subject.fileArray.slice(1, 2))}`);
      expect(JSON.stringify(subject.fileArray.slice(1, 2))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0251 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0252
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0252
     * @tc.desc      DlpListState call flow select > select > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0252 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step1 select(["not a url", "", "datashare...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step2 select(["not a url", "", "datashare...: step2=${step2}`);
      expect(step2).assertEqual(6);
      const step3: string = subject.titleAt(15);
      logInfo(`step3 titleAt(15): step3=${step3}`);
      expect(step3).assertEqual('Text16');
      logInfo(`select>select>titleAt final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(6);
      logInfo(`select>select>titleAt final: JSON.stringify(subject...${JSON.stringify(subject.fileArray.slice(0, 3))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 3)))
        .assertEqual('["not a url","","datashare:///media/image/1"]');
      logInfo(`select>select>titleAt final: JSON.stringify(subject...${JSON.stringify(subject.fileArray.slice(3, 6))}`);
      expect(JSON.stringify(subject.fileArray.slice(3, 6)))
        .assertEqual('["not a url","","datashare:///media/image/1"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0252 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0253
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0253
     * @tc.desc      DlpListState call flow sift > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0253 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.titleAt(30);
      logInfo(`step2 titleAt(30): step2=${step2}`);
      expect(step2).assertEqual('Text31');
      logInfo(`sift>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0253 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0254
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0254
     * @tc.desc      DlpListState call flow titleAt > view > select > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0254 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(60);
      logInfo(`step1 titleAt(60): step1=${step1}`);
      expect(step1).assertEqual('Text61');
      const step2: string = subject.view(-1);
      logInfo(`step2 view(-1): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.select(['http://example.com/a.mp3', 'https://example.com/media/video.mp4',
        'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step3 select(["http://example.com/a.mp3",...: step3=${step3}`);
      expect(step3).assertEqual(3);
      const step4: string = subject.view(67);
      logInfo(`step4 view(67): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`titleAt>view>select>view final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`titleAt>view>select>view final: JSON.stringify(subj...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`titleAt>view>select>view final: JSON.stringify(subj...${JSON.stringify(subject.fileArray.slice(1, 2))}`);
      expect(JSON.stringify(subject.fileArray.slice(1, 2))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0254 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0255
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0255
     * @tc.desc      DlpListState call flow titleAt > select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0255 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(108);
      logInfo(`step1 titleAt(108): step1=${step1}`);
      expect(step1).assertEqual('Text109');
      const step2: number = subject.select(['https://example.com/media/video.mp4']);
      logInfo(`step2 select(["https://example.com/media/...: step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.select(['https://example.com/media/video.mp4']);
      logInfo(`step3 select(["https://example.com/media/...: step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`titleAt>select>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(2);
      logInfo(`titleAt>select>select final: JSON.stringify(subject...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`titleAt>select>select final: JSON.stringify(subject...${JSON.stringify(subject.fileArray.slice(1, 2))}`);
      expect(JSON.stringify(subject.fileArray.slice(1, 2))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0255 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0256
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0256
     * @tc.desc      DlpListState call flow select > titleAt > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0256 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select([]);
      logInfo(`step1 select([]): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.titleAt(195);
      logInfo(`step2 titleAt(195): step2=${step2}`);
      expect(step2).assertEqual('Text196');
      const step3: string = subject.titleAt(150);
      logInfo(`step3 titleAt(150): step3=${step3}`);
      expect(step3).assertEqual('Text151');
      logInfo(`${BUNDLE}DlpListStateFlow_0256 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0257
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0257
     * @tc.desc      DlpListState call flow titleAt > view > sift > select > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0257 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(88.55);
      logInfo(`step1 titleAt(88.55): step1=${step1}`);
      expect(step1).assertEqual('Text89.55');
      const step2: string = subject.view(45);
      logInfo(`step2 view(45): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step4 select(["https://example.com/media/...: step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: string = subject.titleAt(49.74);
      logInfo(`step5 titleAt(49.74): step5=${step5}`);
      expect(step5).assertEqual('Text50.74');
      logInfo(`titleAt>view>sift>select>titleAt final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(2);
      logInfo(`titleAt>view>sift>select>titleAt final: JSON.stringify(subject....${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["https://example.com/media/video.mp4","http://example.com/a.mp3"]');
      logInfo(`titleAt>view>sift>select>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0257 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0258
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0258
     * @tc.desc      DlpListState call flow select > view > titleAt > sift > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0258 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step1 select(["not a url", "", "datashare...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: string = subject.view(-20);
      logInfo(`step2 view(-20): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.titleAt(180);
      logInfo(`step3 titleAt(180): step3=${step3}`);
      expect(step3).assertEqual('Text181');
      const step4: number = subject.sift();
      logInfo(`step4 sift(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.sift();
      logInfo(`step5 sift(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`select>view>titleAt>sift>sift final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`select>view>titleAt>sift>sift final: JSON.stringify(subject.fil...${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray)).assertEqual('["not a url","","datashare:///media/image/1"]');
      logInfo(`select>view>titleAt>sift>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0258 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0259
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0259
     * @tc.desc      DlpListState call flow titleAt > select > select > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0259 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(15.43);
      logInfo(`step1 titleAt(15.43): step1=${step1}`);
      expect(step1).assertEqual('Text16.43');
      const step2: number = subject.select(['file://media/Photo/1/IMG_1.jpg', 'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step2 select(["file://media/Photo/1/IMG_1...: step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.select(['http://example.com/a.mp3', 'https://example.com/media/video.mp4',
        'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step3 select(["http://example.com/a.mp3",...: step3=${step3}`);
      expect(step3).assertEqual(5);
      const step4: number = subject.sift();
      logInfo(`step4 sift(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`titleAt>select>select>sift final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(5);
      logInfo(`titleAt>select>select>sift final: JSON.stringify(su...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["file://media/Photo/1/IMG_1.jpg"]');
      logInfo(`titleAt>select>select>sift final: JSON.stringify(su...${JSON.stringify(subject.fileArray.slice(2, 3))}`);
      expect(JSON.stringify(subject.fileArray.slice(2, 3))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`titleAt>select>select>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0259 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0260
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0260
     * @tc.desc      DlpListState call flow view > select > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0260 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(88.21);
      logInfo(`step1 view(88.21): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step2 select(["https://example.com/media/...: step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`view>select>sift final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(2);
      logInfo(`view>select>sift final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["https://example.com/media/video.mp4","http://example.com/a.mp3"]');
      logInfo(`view>select>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0260 end`);
    });
  });
}
