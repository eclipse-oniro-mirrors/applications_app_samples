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

/** Logic checks for DlpListState flow (52 cases). */
export default function dlpListStateFlowTest(): void {
  describe('DlpListStateFlowTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0001
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0001
     * @tc.desc      DlpListState call flow select > view > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_DlpListStateFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0001 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['datashare:///media/image/1', 'http://example.com/a.mp3', '',
        'http://example.com/a.mp3', 'not a url']);
      logInfo(`step1 select(["datashare:///media/image/1...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: string = subject.view(-36);
      logInfo(`step2 view(-36): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.titleAt(130);
      logInfo(`step3 titleAt(130): step3=${step3}`);
      expect(step3).assertEqual('Text131');
      logInfo(`select>view>titleAt final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`select>view>titleAt final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["datashare:///media/image/1","http://example.com/a.mp3",""]');
      logInfo(`${BUNDLE}DlpListStateFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0002
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0002
     * @tc.desc      DlpListState call flow select > titleAt > sift > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_DlpListStateFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0002 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['http://example.com/a.mp3', 'https://example.com/media/video.mp4',
        'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step1 select(["http://example.com/a.mp3",...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: string = subject.titleAt(2);
      logInfo(`step2 titleAt(2): step2=${step2}`);
      expect(step2).assertEqual('Text3');
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.titleAt(109);
      logInfo(`step4 titleAt(109): step4=${step4}`);
      expect(step4).assertEqual('Text110');
      logInfo(`select>titleAt>sift>titleAt final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`select>titleAt>sift>titleAt final: JSON.stringify(s...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`select>titleAt>sift>titleAt final: JSON.stringify(s...${JSON.stringify(subject.fileArray.slice(1, 2))}`);
      expect(JSON.stringify(subject.fileArray.slice(1, 2))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`select>titleAt>sift>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0003
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0003
     * @tc.desc      DlpListState call flow view > titleAt > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0003 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(50);
      logInfo(`step1 view(50): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.titleAt(39.74);
      logInfo(`step2 titleAt(39.74): step2=${step2}`);
      expect(step2).assertEqual('Text40.74');
      const step3: string = subject.titleAt(52.98);
      logInfo(`step3 titleAt(52.98): step3=${step3}`);
      expect(step3).assertEqual('Text53.98');
      logInfo(`${BUNDLE}DlpListStateFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0004
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0004
     * @tc.desc      DlpListState call flow titleAt > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0004 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(5);
      logInfo(`step1 titleAt(5): step1=${step1}`);
      expect(step1).assertEqual('Text6');
      const step2: number = subject.select([]);
      logInfo(`step2 select([]): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}DlpListStateFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0005
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0005
     * @tc.desc      DlpListState call flow view > titleAt > select > view > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0005 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(-4);
      logInfo(`step1 view(-4): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.titleAt(47.97);
      logInfo(`step2 titleAt(47.97): step2=${step2}`);
      expect(step2).assertEqual('Text48.97');
      const step3: number = subject.select(['file://media/Photo/1/IMG_1.jpg', 'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step3 select(["file://media/Photo/1/IMG_1...: step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: string = subject.view(100);
      logInfo(`step4 view(100): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.view(144);
      logInfo(`step5 view(144): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`view>titleAt>select>view>view final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(2);
      logInfo(`view>titleAt>select>view>view final: JSON.stringify(subject.fil...${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["file://media/Photo/1/IMG_1.jpg","file://media/Photo/1/IMG_1.jpg"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0006
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0006
     * @tc.desc      DlpListState call flow sift > view > view > sift > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0006 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.view(185);
      logInfo(`step2 view(185): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.view(137);
      logInfo(`step3 view(137): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.sift();
      logInfo(`step4 sift(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: string = subject.titleAt(165);
      logInfo(`step5 titleAt(165): step5=${step5}`);
      expect(step5).assertEqual('Text166');
      logInfo(`sift>view>view>sift>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0007
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0007
     * @tc.desc      DlpListState call flow sift > select > select > view > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0007 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.select(['http://example.com/a.mp3', 'https://example.com/media/video.mp4',
        'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step2 select(["http://example.com/a.mp3",...: step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: number = subject.select(['http://example.com/a.mp3', 'https://example.com/media/video.mp4',
        'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step3 select(["http://example.com/a.mp3",...: step3=${step3}`);
      expect(step3).assertEqual(6);
      const step4: string = subject.view(13.67);
      logInfo(`step4 view(13.67): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: number = subject.sift();
      logInfo(`step5 sift(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`sift>select>select>view>sift final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(6);
      logInfo(`sift>select>select>view>sift final: JSON.stringify(...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`sift>select>select>view>sift final: JSON.stringify(...${JSON.stringify(subject.fileArray.slice(3, 4))}`);
      expect(JSON.stringify(subject.fileArray.slice(3, 4))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`sift>select>select>view>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0008
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0008
     * @tc.desc      DlpListState call flow titleAt > view > titleAt > sift > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0008 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(-2);
      logInfo(`step1 titleAt(-2): step1=${step1}`);
      expect(step1).assertEqual('Text-1');
      const step2: string = subject.view(70);
      logInfo(`step2 view(70): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.titleAt(35);
      logInfo(`step3 titleAt(35): step3=${step3}`);
      expect(step3).assertEqual('Text36');
      const step4: number = subject.sift();
      logInfo(`step4 sift(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: string = subject.titleAt(50);
      logInfo(`step5 titleAt(50): step5=${step5}`);
      expect(step5).assertEqual('Text51');
      logInfo(`titleAt>view>titleAt>sift>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0009
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0009
     * @tc.desc      DlpListState call flow titleAt > view > sift > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0009 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(94);
      logInfo(`step1 titleAt(94): step1=${step1}`);
      expect(step1).assertEqual('Text95');
      const step2: string = subject.view(93.03);
      logInfo(`step2 view(93.03): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.sift();
      logInfo(`step4 sift(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`titleAt>view>sift>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0010
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0010
     * @tc.desc      DlpListState call flow view > titleAt > select > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0010 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(60);
      logInfo(`step1 view(60): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.titleAt(145);
      logInfo(`step2 titleAt(145): step2=${step2}`);
      expect(step2).assertEqual('Text146');
      const step3: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step3 select(["https://example.com/media/...: step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.sift();
      logInfo(`step4 sift(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`view>titleAt>select>sift final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(2);
      logInfo(`view>titleAt>select>sift final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["https://example.com/media/video.mp4","http://example.com/a.mp3"]');
      logInfo(`view>titleAt>select>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0011
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0011
     * @tc.desc      DlpListState call flow select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0011 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select([]);
      logInfo(`step1 select([]): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step2 select(["https://example.com/media/...: step2=${step2}`);
      expect(step2).assertEqual(2);
      logInfo(`select>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(2);
      logInfo(`select>select final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["https://example.com/media/video.mp4","http://example.com/a.mp3"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0012
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0012
     * @tc.desc      DlpListState call flow titleAt > titleAt > view > titleAt > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0012 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(52.98);
      logInfo(`step1 titleAt(52.98): step1=${step1}`);
      expect(step1).assertEqual('Text53.98');
      const step2: string = subject.titleAt(-62);
      logInfo(`step2 titleAt(-62): step2=${step2}`);
      expect(step2).assertEqual('Text-61');
      const step3: string = subject.view(166);
      logInfo(`step3 view(166): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.titleAt(35);
      logInfo(`step4 titleAt(35): step4=${step4}`);
      expect(step4).assertEqual('Text36');
      const step5: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step5 select(["not a url", "", "datashare...: step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`titleAt>titleAt>view>titleAt>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`titleAt>titleAt>view>titleAt>select final: JSON.stringify(subje...${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray)).assertEqual('["not a url","","datashare:///media/image/1"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0013
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0013
     * @tc.desc      DlpListState call flow titleAt > sift > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0013 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(130);
      logInfo(`step1 titleAt(130): step1=${step1}`);
      expect(step1).assertEqual('Text131');
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.titleAt(200);
      logInfo(`step3 titleAt(200): step3=${step3}`);
      expect(step3).assertEqual('Text201');
      logInfo(`titleAt>sift>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0014
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0014
     * @tc.desc      DlpListState call flow select > titleAt > select > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0014 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step1 select(["not a url", "", "datashare...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: string = subject.titleAt(110);
      logInfo(`step2 titleAt(110): step2=${step2}`);
      expect(step2).assertEqual('Text111');
      const step3: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step3 select(["https://example.com/media/...: step3=${step3}`);
      expect(step3).assertEqual(5);
      const step4: number = subject.sift();
      logInfo(`step4 sift(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`select>titleAt>select>sift final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(5);
      logInfo(`select>titleAt>select>sift final: JSON.stringify(su...${JSON.stringify(subject.fileArray.slice(0, 3))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 3)))
        .assertEqual('["not a url","","datashare:///media/image/1"]');
      logInfo(`select>titleAt>select>sift final: JSON.stringify(su...${JSON.stringify(subject.fileArray.slice(3, 4))}`);
      expect(JSON.stringify(subject.fileArray.slice(3, 4))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`select>titleAt>select>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0015
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0015
     * @tc.desc      DlpListState call flow select > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0015 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['http://example.com/a.mp3', 'https://example.com/media/video.mp4',
        'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step1 select(["http://example.com/a.mp3",...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: string = subject.titleAt(61);
      logInfo(`step2 titleAt(61): step2=${step2}`);
      expect(step2).assertEqual('Text62');
      logInfo(`select>titleAt final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`select>titleAt final: JSON.stringify(subject.fileAr...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`select>titleAt final: JSON.stringify(subject.fileAr...${JSON.stringify(subject.fileArray.slice(1, 2))}`);
      expect(JSON.stringify(subject.fileArray.slice(1, 2))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0016
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0016
     * @tc.desc      DlpListState call flow titleAt > titleAt > view > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0016 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(198);
      logInfo(`step1 titleAt(198): step1=${step1}`);
      expect(step1).assertEqual('Text199');
      const step2: string = subject.titleAt(110);
      logInfo(`step2 titleAt(110): step2=${step2}`);
      expect(step2).assertEqual('Text111');
      const step3: string = subject.view(-20);
      logInfo(`step3 view(-20): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.titleAt(-1);
      logInfo(`step4 titleAt(-1): step4=${step4}`);
      expect(step4).assertEqual('Text0');
      logInfo(`${BUNDLE}DlpListStateFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0017
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0017
     * @tc.desc      DlpListState call flow select > sift > select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0017 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step1 select(["https://example.com/media/...: step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.select(['datashare:///media/image/1', 'http://example.com/a.mp3', '',
        'http://example.com/a.mp3', 'not a url']);
      logInfo(`step3 select(["datashare:///media/image/1...: step3=${step3}`);
      expect(step3).assertEqual(5);
      const step4: number = subject.select(['file://media/Photo/1/IMG_1.jpg', 'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step4 select(["file://media/Photo/1/IMG_1...: step4=${step4}`);
      expect(step4).assertEqual(7);
      logInfo(`select>sift>select>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(7);
      logInfo(`select>sift>select>select final: JSON.stringify(sub...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`select>sift>select>select final: JSON.stringify(sub...${JSON.stringify(subject.fileArray.slice(3, 5))}`);
      expect(JSON.stringify(subject.fileArray.slice(3, 5))).assertEqual('["http://example.com/a.mp3",""]');
      logInfo(`select>sift>select>select final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0018
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0018
     * @tc.desc      DlpListState call flow sift > titleAt > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0018 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.titleAt(-100);
      logInfo(`step2 titleAt(-100): step2=${step2}`);
      expect(step2).assertEqual('Text-99');
      const step3: string = subject.titleAt(125);
      logInfo(`step3 titleAt(125): step3=${step3}`);
      expect(step3).assertEqual('Text126');
      logInfo(`sift>titleAt>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0019
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0019
     * @tc.desc      DlpListState call flow select > view > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0019 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3',
        'file://media/Photo/1/IMG_1.jpg', 'datashare:///media/image/1', '']);
      logInfo(`step1 select(["https://example.com/media/...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: string = subject.view(70.38);
      logInfo(`step2 view(70.38): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.titleAt(-2);
      logInfo(`step3 titleAt(-2): step3=${step3}`);
      expect(step3).assertEqual('Text-1');
      logInfo(`select>view>titleAt final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`select>view>titleAt final: JSON.stringify(subject.f...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`select>view>titleAt final: JSON.stringify(subject.f...${JSON.stringify(subject.fileArray.slice(1, 2))}`);
      expect(JSON.stringify(subject.fileArray.slice(1, 2))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0020
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0020
     * @tc.desc      DlpListState call flow titleAt > view > select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0020 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(-27);
      logInfo(`step1 titleAt(-27): step1=${step1}`);
      expect(step1).assertEqual('Text-26');
      const step2: string = subject.view(2);
      logInfo(`step2 view(2): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.select([]);
      logInfo(`step3 select([]): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step4 select(["https://example.com/media/...: step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`titleAt>view>select>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(2);
      logInfo(`titleAt>view>select>select final: JSON.stringify(subject.fileAr...${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["https://example.com/media/video.mp4","http://example.com/a.mp3"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0021
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0021
     * @tc.desc      DlpListState call flow view > sift > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0021 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(173);
      logInfo(`step1 view(173): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`view>sift>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0022
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0022
     * @tc.desc      DlpListState call flow view > sift > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0022 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(175);
      logInfo(`step1 view(175): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.select(['file://media/Photo/1/IMG_1.jpg', 'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step3 select(["file://media/Photo/1/IMG_1...: step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`view>sift>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(2);
      logInfo(`view>sift>select final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["file://media/Photo/1/IMG_1.jpg","file://media/Photo/1/IMG_1.jpg"]');
      logInfo(`view>sift>select final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0023
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0023
     * @tc.desc      DlpListState call flow sift > sift > sift > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0023 begin`);
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
      const step4: string = subject.titleAt(-26);
      logInfo(`step4 titleAt(-26): step4=${step4}`);
      expect(step4).assertEqual('Text-25');
      logInfo(`sift>sift>sift>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(3);
      logInfo(`${BUNDLE}DlpListStateFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0024
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0024
     * @tc.desc      DlpListState call flow titleAt > sift > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0024 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(170);
      logInfo(`step1 titleAt(170): step1=${step1}`);
      expect(step1).assertEqual('Text171');
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`titleAt>sift>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0025
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0025
     * @tc.desc      DlpListState call flow view > titleAt > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0025 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(65);
      logInfo(`step1 view(65): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.titleAt(-82);
      logInfo(`step2 titleAt(-82): step2=${step2}`);
      expect(step2).assertEqual('Text-81');
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`view>titleAt>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0026
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0026
     * @tc.desc      DlpListState call flow titleAt > sift > titleAt > sift > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0026 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(19.39);
      logInfo(`step1 titleAt(19.39): step1=${step1}`);
      expect(step1).assertEqual('Text20.39');
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.titleAt(-34);
      logInfo(`step3 titleAt(-34): step3=${step3}`);
      expect(step3).assertEqual('Text-33');
      const step4: number = subject.sift();
      logInfo(`step4 sift(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.select(['file://media/Photo/1/IMG_1.jpg', 'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step5 select(["file://media/Photo/1/IMG_1...: step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`titleAt>sift>titleAt>sift>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(2);
      logInfo(`titleAt>sift>titleAt>sift>select final: JSON.stringify(subject....${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["file://media/Photo/1/IMG_1.jpg","file://media/Photo/1/IMG_1.jpg"]');
      logInfo(`titleAt>sift>titleAt>sift>select final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0027
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0027
     * @tc.desc      DlpListState call flow select > select > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0027 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['https://example.com/media/video.mp4']);
      logInfo(`step1 select(["https://example.com/media/...: step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.select([]);
      logInfo(`step2 select([]): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.view(-15);
      logInfo(`step3 view(-15): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`select>select>view final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(1);
      logInfo(`select>select>view final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray)).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0028
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0028
     * @tc.desc      DlpListState call flow select > sift > select > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0028 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step1 select(["https://example.com/media/...: step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3',
        'file://media/Photo/1/IMG_1.jpg', 'datashare:///media/image/1', '']);
      logInfo(`step3 select(["https://example.com/media/...: step3=${step3}`);
      expect(step3).assertEqual(5);
      const step4: string = subject.titleAt(19.73);
      logInfo(`step4 titleAt(19.73): step4=${step4}`);
      expect(step4).assertEqual('Text20.73');
      logInfo(`select>sift>select>titleAt final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(5);
      logInfo(`select>sift>select>titleAt final: JSON.stringify(su...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`select>sift>select>titleAt final: JSON.stringify(su...${JSON.stringify(subject.fileArray.slice(2, 3))}`);
      expect(JSON.stringify(subject.fileArray.slice(2, 3))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`select>sift>select>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0029
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0029
     * @tc.desc      DlpListState call flow view > titleAt > view > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0029 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(60);
      logInfo(`step1 view(60): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.titleAt(-77);
      logInfo(`step2 titleAt(-77): step2=${step2}`);
      expect(step2).assertEqual('Text-76');
      const step3: string = subject.view(-96);
      logInfo(`step3 view(-96): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.titleAt(61);
      logInfo(`step4 titleAt(61): step4=${step4}`);
      expect(step4).assertEqual('Text62');
      logInfo(`${BUNDLE}DlpListStateFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0030
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0030
     * @tc.desc      DlpListState call flow view > sift > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0030 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(56.06);
      logInfo(`step1 view(56.06): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.view(53.32);
      logInfo(`step3 view(53.32): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`view>sift>view final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0031
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0031
     * @tc.desc      DlpListState call flow view > view > select > sift > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0031 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(95);
      logInfo(`step1 view(95): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.view(185);
      logInfo(`step2 view(185): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3']);
      logInfo(`step3 select(["https://example.com/media/...: step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.sift();
      logInfo(`step4 sift(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.sift();
      logInfo(`step5 sift(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`view>view>select>sift>sift final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(2);
      logInfo(`view>view>select>sift>sift final: JSON.stringify(subject.fileAr...${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["https://example.com/media/video.mp4","http://example.com/a.mp3"]');
      logInfo(`view>view>select>sift>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0032
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0032
     * @tc.desc      DlpListState call flow sift > titleAt > view > select > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0032 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.titleAt(31);
      logInfo(`step2 titleAt(31): step2=${step2}`);
      expect(step2).assertEqual('Text32');
      const step3: string = subject.view(185);
      logInfo(`step3 view(185): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3',
        'file://media/Photo/1/IMG_1.jpg', 'datashare:///media/image/1', '']);
      logInfo(`step4 select(["https://example.com/media/...: step4=${step4}`);
      expect(step4).assertEqual(3);
      const step5: string = subject.view(165);
      logInfo(`step5 view(165): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`sift>titleAt>view>select>view final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`sift>titleAt>view>select>view final: JSON.stringify...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`sift>titleAt>view>select>view final: JSON.stringify...${JSON.stringify(subject.fileArray.slice(1, 2))}`);
      expect(JSON.stringify(subject.fileArray.slice(1, 2))).assertEqual('["http://example.com/a.mp3"]');
      logInfo(`sift>titleAt>view>select>view final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0033
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0033
     * @tc.desc      DlpListState call flow select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0033 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['datashare:///media/image/1', 'http://example.com/a.mp3', '',
        'http://example.com/a.mp3', 'not a url']);
      logInfo(`step1 select(["datashare:///media/image/1...: step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: number = subject.select(['file://media/Photo/1/IMG_1.jpg', 'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step2 select(["file://media/Photo/1/IMG_1...: step2=${step2}`);
      expect(step2).assertEqual(5);
      logInfo(`select>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(5);
      logInfo(`select>select final: JSON.stringify(subject.fileArr...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["datashare:///media/image/1"]');
      logInfo(`select>select final: JSON.stringify(subject.fileArr...${JSON.stringify(subject.fileArray.slice(3, 4))}`);
      expect(JSON.stringify(subject.fileArray.slice(3, 4))).assertEqual('["file://media/Photo/1/IMG_1.jpg"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0034
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0034
     * @tc.desc      DlpListState call flow select > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0034 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['https://example.com/media/video.mp4']);
      logInfo(`step1 select(["https://example.com/media/...: step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.view(78);
      logInfo(`step2 view(78): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`select>view final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(1);
      logInfo(`select>view final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray)).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0035
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0035
     * @tc.desc      DlpListState call flow titleAt > select > select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0035 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(195);
      logInfo(`step1 titleAt(195): step1=${step1}`);
      expect(step1).assertEqual('Text196');
      const step2: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step2 select(["not a url", "", "datashare...: step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3',
        'file://media/Photo/1/IMG_1.jpg', 'datashare:///media/image/1', '']);
      logInfo(`step3 select(["https://example.com/media/...: step3=${step3}`);
      expect(step3).assertEqual(6);
      const step4: number = subject.select(['file://media/Photo/1/IMG_1.jpg', 'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step4 select(["file://media/Photo/1/IMG_1...: step4=${step4}`);
      expect(step4).assertEqual(8);
      logInfo(`titleAt>select>select>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(8);
      logInfo(`titleAt>select>select>select final: JSON.stringify(...${JSON.stringify(subject.fileArray.slice(0, 3))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 3)))
        .assertEqual('["not a url","","datashare:///media/image/1"]');
      logInfo(`titleAt>select>select>select final: JSON.stringify(...${JSON.stringify(subject.fileArray.slice(5, 6))}`);
      expect(JSON.stringify(subject.fileArray.slice(5, 6))).assertEqual('["file://media/Photo/1/IMG_1.jpg"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0036
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0036
     * @tc.desc      DlpListState call flow select > view > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0036 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select([]);
      logInfo(`step1 select([]): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.view(185);
      logInfo(`step2 view(185): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`select>view>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0037
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0037
     * @tc.desc      DlpListState call flow view > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0037 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(35);
      logInfo(`step1 view(35): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.titleAt(49.74);
      logInfo(`step2 titleAt(49.74): step2=${step2}`);
      expect(step2).assertEqual('Text50.74');
      logInfo(`${BUNDLE}DlpListStateFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0038
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0038
     * @tc.desc      DlpListState call flow view > view > view > view > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0038 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(155);
      logInfo(`step1 view(155): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.view(-71);
      logInfo(`step2 view(-71): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.view(82.94);
      logInfo(`step3 view(82.94): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.view(26.67);
      logInfo(`step4 view(26.67): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: number = subject.sift();
      logInfo(`step5 sift(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`view>view>view>view>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0039
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0039
     * @tc.desc      DlpListState call flow view > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0039 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(-36);
      logInfo(`step1 view(-36): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.titleAt(76);
      logInfo(`step2 titleAt(76): step2=${step2}`);
      expect(step2).assertEqual('Text77');
      logInfo(`${BUNDLE}DlpListStateFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0040
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0040
     * @tc.desc      DlpListState call flow sift > select > titleAt > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0040 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.select(['not a url', '', 'datashare:///media/image/1',
        'file://media/Photo/1/IMG_1.jpg', 'http://example.com/a.mp3', 'https://example.com/media/video.mp4']);
      logInfo(`step2 select(["not a url", "", "datashare...: step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: string = subject.titleAt(-33);
      logInfo(`step3 titleAt(-33): step3=${step3}`);
      expect(step3).assertEqual('Text-32');
      const step4: string = subject.view(-2);
      logInfo(`step4 view(-2): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`sift>select>titleAt>view final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`sift>select>titleAt>view final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray)).assertEqual('["not a url","","datashare:///media/image/1"]');
      logInfo(`sift>select>titleAt>view final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0041
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0041
     * @tc.desc      DlpListState call flow select > view > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0041 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select([]);
      logInfo(`step1 select([]): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.view(41.9);
      logInfo(`step2 view(41.9): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.titleAt(-82);
      logInfo(`step3 titleAt(-82): step3=${step3}`);
      expect(step3).assertEqual('Text-81');
      logInfo(`${BUNDLE}DlpListStateFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0042
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0042
     * @tc.desc      DlpListState call flow sift > sift > sift > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0042 begin`);
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
      const step4: number = subject.sift();
      logInfo(`step4 sift(): step4=${step4}`);
      expect(step4).assertEqual(4);
      logInfo(`sift>sift>sift>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(4);
      logInfo(`${BUNDLE}DlpListStateFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0043
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0043
     * @tc.desc      DlpListState call flow titleAt > titleAt > select > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0043 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(80);
      logInfo(`step1 titleAt(80): step1=${step1}`);
      expect(step1).assertEqual('Text81');
      const step2: string = subject.titleAt(10);
      logInfo(`step2 titleAt(10): step2=${step2}`);
      expect(step2).assertEqual('Text11');
      const step3: number = subject.select(['datashare:///media/image/1', 'http://example.com/a.mp3', '',
        'http://example.com/a.mp3', 'not a url']);
      logInfo(`step3 select(["datashare:///media/image/1...: step3=${step3}`);
      expect(step3).assertEqual(3);
      const step4: string = subject.titleAt(-68);
      logInfo(`step4 titleAt(-68): step4=${step4}`);
      expect(step4).assertEqual('Text-67');
      logInfo(`titleAt>titleAt>select>titleAt final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`titleAt>titleAt>select>titleAt final: JSON.stringify(subject.fi...${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["datashare:///media/image/1","http://example.com/a.mp3",""]');
      logInfo(`${BUNDLE}DlpListStateFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0044
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0044
     * @tc.desc      DlpListState call flow titleAt > sift > sift > view > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0044 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(162);
      logInfo(`step1 titleAt(162): step1=${step1}`);
      expect(step1).assertEqual('Text163');
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: string = subject.view(5);
      logInfo(`step4 view(5): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: number = subject.sift();
      logInfo(`step5 sift(): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`titleAt>sift>sift>view>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(3);
      logInfo(`${BUNDLE}DlpListStateFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0045
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0045
     * @tc.desc      DlpListState call flow select > view > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0045 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.select(['file://media/Photo/1/IMG_1.jpg', 'file://media/Photo/1/IMG_1.jpg']);
      logInfo(`step1 select(["file://media/Photo/1/IMG_1...: step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: string = subject.view(-98);
      logInfo(`step2 view(-98): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.titleAt(39.74);
      logInfo(`step3 titleAt(39.74): step3=${step3}`);
      expect(step3).assertEqual('Text40.74');
      logInfo(`select>view>titleAt final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(2);
      logInfo(`select>view>titleAt final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["file://media/Photo/1/IMG_1.jpg","file://media/Photo/1/IMG_1.jpg"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0046
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0046
     * @tc.desc      DlpListState call flow sift > select > sift keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0046 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.select(['datashare:///media/image/1', 'http://example.com/a.mp3', '',
        'http://example.com/a.mp3', 'not a url']);
      logInfo(`step2 select(["datashare:///media/image/1...: step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: number = subject.sift();
      logInfo(`step3 sift(): step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`sift>select>sift final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(3);
      logInfo(`sift>select>sift final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray))
        .assertEqual('["datashare:///media/image/1","http://example.com/a.mp3",""]');
      logInfo(`sift>select>sift final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(2);
      logInfo(`${BUNDLE}DlpListStateFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0047
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0047
     * @tc.desc      DlpListState call flow sift > view > select > titleAt > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0047 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.view(164);
      logInfo(`step2 view(164): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.select(['https://example.com/media/video.mp4']);
      logInfo(`step3 select(["https://example.com/media/...: step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.titleAt(-100);
      logInfo(`step4 titleAt(-100): step4=${step4}`);
      expect(step4).assertEqual('Text-99');
      const step5: string = subject.titleAt(95.74);
      logInfo(`step5 titleAt(95.74): step5=${step5}`);
      expect(step5).assertEqual('Text96.74');
      logInfo(`sift>view>select>titleAt>titleAt final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(1);
      logInfo(`sift>view>select>titleAt>titleAt final: JSON.stringify(subject....${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray)).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`sift>view>select>titleAt>titleAt final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0048
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0048
     * @tc.desc      DlpListState call flow titleAt > sift > select > titleAt > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0048 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(68);
      logInfo(`step1 titleAt(68): step1=${step1}`);
      expect(step1).assertEqual('Text69');
      const step2: number = subject.sift();
      logInfo(`step2 sift(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.select(['https://example.com/media/video.mp4', 'http://example.com/a.mp3',
        'file://media/Photo/1/IMG_1.jpg', 'datashare:///media/image/1', '']);
      logInfo(`step3 select(["https://example.com/media/...: step3=${step3}`);
      expect(step3).assertEqual(3);
      const step4: string = subject.titleAt(95.74);
      logInfo(`step4 titleAt(95.74): step4=${step4}`);
      expect(step4).assertEqual('Text96.74');
      const step5: number = subject.select(['https://example.com/media/video.mp4']);
      logInfo(`step5 select(["https://example.com/media/...: step5=${step5}`);
      expect(step5).assertEqual(4);
      logInfo(`titleAt>sift>select>titleAt>select final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(4);
      logInfo(`titleAt>sift>select>titleAt>select final: JSON.stri...${JSON.stringify(subject.fileArray.slice(0, 1))}`);
      expect(JSON.stringify(subject.fileArray.slice(0, 1))).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`titleAt>sift>select>titleAt>select final: JSON.stri...${JSON.stringify(subject.fileArray.slice(2, 3))}`);
      expect(JSON.stringify(subject.fileArray.slice(2, 3))).assertEqual('["file://media/Photo/1/IMG_1.jpg"]');
      logInfo(`titleAt>sift>select>titleAt>select final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0049
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0049
     * @tc.desc      DlpListState call flow titleAt > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0049 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.titleAt(49.74);
      logInfo(`step1 titleAt(49.74): step1=${step1}`);
      expect(step1).assertEqual('Text50.74');
      const step2: string = subject.view(67);
      logInfo(`step2 view(67): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0050
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0050
     * @tc.desc      DlpListState call flow view > titleAt > select > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0050 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(88);
      logInfo(`step1 view(88): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.titleAt(76);
      logInfo(`step2 titleAt(76): step2=${step2}`);
      expect(step2).assertEqual('Text77');
      const step3: number = subject.select(['https://example.com/media/video.mp4']);
      logInfo(`step3 select(["https://example.com/media/...: step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.view(30);
      logInfo(`step4 view(30): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`view>titleAt>select>view final: subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(1);
      logInfo(`view>titleAt>select>view final: JSON.stringify(subject.fileArray)=${JSON.stringify(subject.fileArray)}`);
      expect(JSON.stringify(subject.fileArray)).assertEqual('["https://example.com/media/video.mp4"]');
      logInfo(`${BUNDLE}DlpListStateFlow_0050 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0051
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0051
     * @tc.desc      DlpListState call flow view > titleAt > titleAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0051 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: string = subject.view(86);
      logInfo(`step1 view(86): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.titleAt(61);
      logInfo(`step2 titleAt(61): step2=${step2}`);
      expect(step2).assertEqual('Text62');
      const step3: string = subject.titleAt(90);
      logInfo(`step3 titleAt(90): step3=${step3}`);
      expect(step3).assertEqual('Text91');
      logInfo(`${BUNDLE}DlpListStateFlow_0051 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_FLOW_0052
     * @tc.name      FilePreviewDLP_DlpListStateFlow_0052
     * @tc.desc      DlpListState call flow sift > view > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateFlow_0052 begin`);
      const subject: DlpListState = new DlpListState();
      const step1: number = subject.sift();
      logInfo(`step1 sift(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.view(155);
      logInfo(`step2 view(155): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.view(137);
      logInfo(`step3 view(137): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`sift>view>view final: subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(1);
      logInfo(`${BUNDLE}DlpListStateFlow_0052 end`);
    });
  });
}
