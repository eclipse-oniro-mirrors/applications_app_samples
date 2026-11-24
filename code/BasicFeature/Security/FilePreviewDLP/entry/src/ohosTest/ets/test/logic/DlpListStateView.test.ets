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

/** Logic checks for DlpListState.view (30 cases). */
export default function dlpListStateViewTest(): void {
  describe('DlpListStateViewTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_VIEW_0001
     * @tc.name      FilePreviewDLP_DlpListStateView_0001
     * @tc.desc      DlpListState.view(index=0) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_DlpListStateView_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DlpListStateView_0001 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.view(0);
      logInfo(`view(index=0): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateView_0001 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_VIEW_0002
     * @tc.name      FilePreviewDLP_DlpListStateView_0002
     * @tc.desc      DlpListState.view(index=1) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_DlpListStateView_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DlpListStateView_0002 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.view(1);
      logInfo(`view(index=1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateView_0002 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_VIEW_0003
     * @tc.name      FilePreviewDLP_DlpListStateView_0003
     * @tc.desc      DlpListState.view(index=-1) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_DlpListStateView_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DlpListStateView_0003 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.view(-1);
      logInfo(`view(index=-1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateView_0003 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_VIEW_0004
     * @tc.name      FilePreviewDLP_DlpListStateView_0004
     * @tc.desc      DlpListState.view(index=2) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateView_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateView_0004 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.view(2);
      logInfo(`view(index=2): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateView_0004 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_VIEW_0005
     * @tc.name      FilePreviewDLP_DlpListStateView_0005
     * @tc.desc      DlpListState.view(index=5) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateView_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateView_0005 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.view(5);
      logInfo(`view(index=5): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateView_0005 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_VIEW_0006
     * @tc.name      FilePreviewDLP_DlpListStateView_0006
     * @tc.desc      DlpListState.view(index=10) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateView_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateView_0006 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.view(10);
      logInfo(`view(index=10): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateView_0006 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_VIEW_0007
     * @tc.name      FilePreviewDLP_DlpListStateView_0007
     * @tc.desc      DlpListState.view(index=3) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateView_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateView_0007 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.view(3);
      logInfo(`view(index=3): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateView_0007 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_VIEW_0008
     * @tc.name      FilePreviewDLP_DlpListStateView_0008
     * @tc.desc      DlpListState.view(index=100) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateView_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateView_0008 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.view(100);
      logInfo(`view(index=100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateView_0008 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_VIEW_0009
     * @tc.name      FilePreviewDLP_DlpListStateView_0009
     * @tc.desc      DlpListState.view(index=15) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateView_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateView_0009 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.view(15);
      logInfo(`view(index=15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateView_0009 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_VIEW_0010
     * @tc.name      FilePreviewDLP_DlpListStateView_0010
     * @tc.desc      DlpListState.view(index=20) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateView_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateView_0010 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.view(20);
      logInfo(`view(index=20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateView_0010 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_VIEW_0011
     * @tc.name      FilePreviewDLP_DlpListStateView_0011
     * @tc.desc      DlpListState.view(index=25) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateView_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateView_0011 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.view(25);
      logInfo(`view(index=25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateView_0011 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_VIEW_0012
     * @tc.name      FilePreviewDLP_DlpListStateView_0012
     * @tc.desc      DlpListState.view(index=30) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateView_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateView_0012 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.view(30);
      logInfo(`view(index=30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateView_0012 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_VIEW_0013
     * @tc.name      FilePreviewDLP_DlpListStateView_0013
     * @tc.desc      DlpListState.view(index=35) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateView_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateView_0013 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.view(35);
      logInfo(`view(index=35): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateView_0013 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_VIEW_0014
     * @tc.name      FilePreviewDLP_DlpListStateView_0014
     * @tc.desc      DlpListState.view(index=40) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateView_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateView_0014 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.view(40);
      logInfo(`view(index=40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateView_0014 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_VIEW_0015
     * @tc.name      FilePreviewDLP_DlpListStateView_0015
     * @tc.desc      DlpListState.view(index=45) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateView_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateView_0015 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.view(45);
      logInfo(`view(index=45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateView_0015 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_VIEW_0016
     * @tc.name      FilePreviewDLP_DlpListStateView_0016
     * @tc.desc      DlpListState.view(index=50) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateView_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateView_0016 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.view(50);
      logInfo(`view(index=50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateView_0016 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_VIEW_0017
     * @tc.name      FilePreviewDLP_DlpListStateView_0017
     * @tc.desc      DlpListState.view(index=55) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateView_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateView_0017 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.view(55);
      logInfo(`view(index=55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateView_0017 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_VIEW_0018
     * @tc.name      FilePreviewDLP_DlpListStateView_0018
     * @tc.desc      DlpListState.view(index=60) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateView_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateView_0018 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.view(60);
      logInfo(`view(index=60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateView_0018 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_VIEW_0019
     * @tc.name      FilePreviewDLP_DlpListStateView_0019
     * @tc.desc      DlpListState.view(index=65) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateView_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateView_0019 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.view(65);
      logInfo(`view(index=65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateView_0019 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_VIEW_0020
     * @tc.name      FilePreviewDLP_DlpListStateView_0020
     * @tc.desc      DlpListState.view(index=70) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateView_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateView_0020 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.view(70);
      logInfo(`view(index=70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateView_0020 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_VIEW_0021
     * @tc.name      FilePreviewDLP_DlpListStateView_0021
     * @tc.desc      DlpListState.view(index=75) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateView_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateView_0021 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.view(75);
      logInfo(`view(index=75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateView_0021 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_VIEW_0022
     * @tc.name      FilePreviewDLP_DlpListStateView_0022
     * @tc.desc      DlpListState.view(index=80) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateView_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateView_0022 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.view(80);
      logInfo(`view(index=80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateView_0022 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_VIEW_0023
     * @tc.name      FilePreviewDLP_DlpListStateView_0023
     * @tc.desc      DlpListState.view(index=85) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateView_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateView_0023 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.view(85);
      logInfo(`view(index=85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateView_0023 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_VIEW_0024
     * @tc.name      FilePreviewDLP_DlpListStateView_0024
     * @tc.desc      DlpListState.view(index=90) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateView_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateView_0024 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.view(90);
      logInfo(`view(index=90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateView_0024 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_VIEW_0025
     * @tc.name      FilePreviewDLP_DlpListStateView_0025
     * @tc.desc      DlpListState.view(index=95) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateView_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateView_0025 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.view(95);
      logInfo(`view(index=95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateView_0025 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_VIEW_0026
     * @tc.name      FilePreviewDLP_DlpListStateView_0026
     * @tc.desc      DlpListState.view(index=105) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateView_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateView_0026 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.view(105);
      logInfo(`view(index=105): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateView_0026 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_VIEW_0027
     * @tc.name      FilePreviewDLP_DlpListStateView_0027
     * @tc.desc      DlpListState.view(index=110) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateView_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateView_0027 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.view(110);
      logInfo(`view(index=110): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateView_0027 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_VIEW_0028
     * @tc.name      FilePreviewDLP_DlpListStateView_0028
     * @tc.desc      DlpListState.view(index=115) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateView_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateView_0028 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.view(115);
      logInfo(`view(index=115): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateView_0028 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_VIEW_0029
     * @tc.name      FilePreviewDLP_DlpListStateView_0029
     * @tc.desc      DlpListState.view(index=120) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateView_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateView_0029 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.view(120);
      logInfo(`view(index=120): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateView_0029 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_VIEW_0030
     * @tc.name      FilePreviewDLP_DlpListStateView_0030
     * @tc.desc      DlpListState.view(index=125) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateView_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateView_0030 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.view(125);
      logInfo(`view(index=125): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DlpListStateView_0030 end`);
    });
  });
}
