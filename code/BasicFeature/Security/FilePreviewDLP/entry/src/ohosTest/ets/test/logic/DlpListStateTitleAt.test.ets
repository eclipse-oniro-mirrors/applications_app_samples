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

/** Logic checks for DlpListState.titleAt (90 cases). */
export default function dlpListStateTitleAtTest(): void {
  describe('DlpListStateTitleAtTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0001
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0001
     * @tc.desc      DlpListState.titleAt(index=0) yields "Text1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0001 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(0);
      logInfo(`titleAt(index=0): actual=${actual}`);
      expect(actual).assertEqual('Text1');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0001 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0002
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0002
     * @tc.desc      DlpListState.titleAt(index=1) yields "Text2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0002 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(1);
      logInfo(`titleAt(index=1): actual=${actual}`);
      expect(actual).assertEqual('Text2');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0002 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0003
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0003
     * @tc.desc      DlpListState.titleAt(index=-1) yields "Text0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0003 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(-1);
      logInfo(`titleAt(index=-1): actual=${actual}`);
      expect(actual).assertEqual('Text0');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0003 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0004
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0004
     * @tc.desc      DlpListState.titleAt(index=2) yields "Text3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0004 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(2);
      logInfo(`titleAt(index=2): actual=${actual}`);
      expect(actual).assertEqual('Text3');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0004 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0005
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0005
     * @tc.desc      DlpListState.titleAt(index=5) yields "Text6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0005 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(5);
      logInfo(`titleAt(index=5): actual=${actual}`);
      expect(actual).assertEqual('Text6');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0005 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0006
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0006
     * @tc.desc      DlpListState.titleAt(index=10) yields "Text11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0006 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(10);
      logInfo(`titleAt(index=10): actual=${actual}`);
      expect(actual).assertEqual('Text11');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0006 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0007
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0007
     * @tc.desc      DlpListState.titleAt(index=3) yields "Text4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0007 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(3);
      logInfo(`titleAt(index=3): actual=${actual}`);
      expect(actual).assertEqual('Text4');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0007 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0008
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0008
     * @tc.desc      DlpListState.titleAt(index=100) yields "Text101"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0008 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(100);
      logInfo(`titleAt(index=100): actual=${actual}`);
      expect(actual).assertEqual('Text101');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0008 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0009
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0009
     * @tc.desc      DlpListState.titleAt(index=15) yields "Text16"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0009 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(15);
      logInfo(`titleAt(index=15): actual=${actual}`);
      expect(actual).assertEqual('Text16');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0009 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0010
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0010
     * @tc.desc      DlpListState.titleAt(index=20) yields "Text21"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0010 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(20);
      logInfo(`titleAt(index=20): actual=${actual}`);
      expect(actual).assertEqual('Text21');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0010 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0011
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0011
     * @tc.desc      DlpListState.titleAt(index=25) yields "Text26"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0011 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(25);
      logInfo(`titleAt(index=25): actual=${actual}`);
      expect(actual).assertEqual('Text26');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0011 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0012
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0012
     * @tc.desc      DlpListState.titleAt(index=30) yields "Text31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0012 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(30);
      logInfo(`titleAt(index=30): actual=${actual}`);
      expect(actual).assertEqual('Text31');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0012 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0013
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0013
     * @tc.desc      DlpListState.titleAt(index=35) yields "Text36"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0013 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(35);
      logInfo(`titleAt(index=35): actual=${actual}`);
      expect(actual).assertEqual('Text36');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0013 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0014
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0014
     * @tc.desc      DlpListState.titleAt(index=40) yields "Text41"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0014 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(40);
      logInfo(`titleAt(index=40): actual=${actual}`);
      expect(actual).assertEqual('Text41');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0014 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0015
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0015
     * @tc.desc      DlpListState.titleAt(index=45) yields "Text46"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0015 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(45);
      logInfo(`titleAt(index=45): actual=${actual}`);
      expect(actual).assertEqual('Text46');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0015 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0016
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0016
     * @tc.desc      DlpListState.titleAt(index=50) yields "Text51"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0016 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(50);
      logInfo(`titleAt(index=50): actual=${actual}`);
      expect(actual).assertEqual('Text51');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0016 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0017
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0017
     * @tc.desc      DlpListState.titleAt(index=55) yields "Text56"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0017 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(55);
      logInfo(`titleAt(index=55): actual=${actual}`);
      expect(actual).assertEqual('Text56');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0017 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0018
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0018
     * @tc.desc      DlpListState.titleAt(index=60) yields "Text61"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0018 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(60);
      logInfo(`titleAt(index=60): actual=${actual}`);
      expect(actual).assertEqual('Text61');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0018 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0019
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0019
     * @tc.desc      DlpListState.titleAt(index=65) yields "Text66"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0019 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(65);
      logInfo(`titleAt(index=65): actual=${actual}`);
      expect(actual).assertEqual('Text66');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0019 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0020
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0020
     * @tc.desc      DlpListState.titleAt(index=70) yields "Text71"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0020 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(70);
      logInfo(`titleAt(index=70): actual=${actual}`);
      expect(actual).assertEqual('Text71');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0020 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0021
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0021
     * @tc.desc      DlpListState.titleAt(index=75) yields "Text76"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0021 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(75);
      logInfo(`titleAt(index=75): actual=${actual}`);
      expect(actual).assertEqual('Text76');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0021 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0022
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0022
     * @tc.desc      DlpListState.titleAt(index=80) yields "Text81"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0022 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(80);
      logInfo(`titleAt(index=80): actual=${actual}`);
      expect(actual).assertEqual('Text81');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0022 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0023
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0023
     * @tc.desc      DlpListState.titleAt(index=85) yields "Text86"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0023 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(85);
      logInfo(`titleAt(index=85): actual=${actual}`);
      expect(actual).assertEqual('Text86');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0023 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0024
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0024
     * @tc.desc      DlpListState.titleAt(index=90) yields "Text91"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0024 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(90);
      logInfo(`titleAt(index=90): actual=${actual}`);
      expect(actual).assertEqual('Text91');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0024 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0025
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0025
     * @tc.desc      DlpListState.titleAt(index=95) yields "Text96"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0025 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(95);
      logInfo(`titleAt(index=95): actual=${actual}`);
      expect(actual).assertEqual('Text96');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0025 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0026
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0026
     * @tc.desc      DlpListState.titleAt(index=105) yields "Text106"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0026 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(105);
      logInfo(`titleAt(index=105): actual=${actual}`);
      expect(actual).assertEqual('Text106');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0026 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0027
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0027
     * @tc.desc      DlpListState.titleAt(index=110) yields "Text111"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0027 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(110);
      logInfo(`titleAt(index=110): actual=${actual}`);
      expect(actual).assertEqual('Text111');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0027 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0028
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0028
     * @tc.desc      DlpListState.titleAt(index=115) yields "Text116"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0028 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(115);
      logInfo(`titleAt(index=115): actual=${actual}`);
      expect(actual).assertEqual('Text116');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0028 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0029
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0029
     * @tc.desc      DlpListState.titleAt(index=120) yields "Text121"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0029 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(120);
      logInfo(`titleAt(index=120): actual=${actual}`);
      expect(actual).assertEqual('Text121');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0029 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0030
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0030
     * @tc.desc      DlpListState.titleAt(index=125) yields "Text126"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0030 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(125);
      logInfo(`titleAt(index=125): actual=${actual}`);
      expect(actual).assertEqual('Text126');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0030 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0031
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0031
     * @tc.desc      DlpListState.titleAt(index=130) yields "Text131"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0031 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(130);
      logInfo(`titleAt(index=130): actual=${actual}`);
      expect(actual).assertEqual('Text131');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0031 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0032
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0032
     * @tc.desc      DlpListState.titleAt(index=135) yields "Text136"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0032 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(135);
      logInfo(`titleAt(index=135): actual=${actual}`);
      expect(actual).assertEqual('Text136');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0032 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0033
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0033
     * @tc.desc      DlpListState.titleAt(index=140) yields "Text141"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0033 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(140);
      logInfo(`titleAt(index=140): actual=${actual}`);
      expect(actual).assertEqual('Text141');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0033 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0034
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0034
     * @tc.desc      DlpListState.titleAt(index=145) yields "Text146"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0034 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(145);
      logInfo(`titleAt(index=145): actual=${actual}`);
      expect(actual).assertEqual('Text146');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0034 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0035
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0035
     * @tc.desc      DlpListState.titleAt(index=150) yields "Text151"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0035 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(150);
      logInfo(`titleAt(index=150): actual=${actual}`);
      expect(actual).assertEqual('Text151');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0035 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0036
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0036
     * @tc.desc      DlpListState.titleAt(index=155) yields "Text156"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0036 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(155);
      logInfo(`titleAt(index=155): actual=${actual}`);
      expect(actual).assertEqual('Text156');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0036 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0037
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0037
     * @tc.desc      DlpListState.titleAt(index=160) yields "Text161"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0037 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(160);
      logInfo(`titleAt(index=160): actual=${actual}`);
      expect(actual).assertEqual('Text161');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0037 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0038
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0038
     * @tc.desc      DlpListState.titleAt(index=165) yields "Text166"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0038 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(165);
      logInfo(`titleAt(index=165): actual=${actual}`);
      expect(actual).assertEqual('Text166');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0038 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0039
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0039
     * @tc.desc      DlpListState.titleAt(index=170) yields "Text171"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0039 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(170);
      logInfo(`titleAt(index=170): actual=${actual}`);
      expect(actual).assertEqual('Text171');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0039 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0040
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0040
     * @tc.desc      DlpListState.titleAt(index=175) yields "Text176"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0040 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(175);
      logInfo(`titleAt(index=175): actual=${actual}`);
      expect(actual).assertEqual('Text176');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0040 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0041
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0041
     * @tc.desc      DlpListState.titleAt(index=180) yields "Text181"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0041 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(180);
      logInfo(`titleAt(index=180): actual=${actual}`);
      expect(actual).assertEqual('Text181');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0041 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0042
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0042
     * @tc.desc      DlpListState.titleAt(index=185) yields "Text186"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0042 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(185);
      logInfo(`titleAt(index=185): actual=${actual}`);
      expect(actual).assertEqual('Text186');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0042 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0043
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0043
     * @tc.desc      DlpListState.titleAt(index=190) yields "Text191"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0043 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(190);
      logInfo(`titleAt(index=190): actual=${actual}`);
      expect(actual).assertEqual('Text191');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0043 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0044
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0044
     * @tc.desc      DlpListState.titleAt(index=195) yields "Text196"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0044 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(195);
      logInfo(`titleAt(index=195): actual=${actual}`);
      expect(actual).assertEqual('Text196');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0044 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0045
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0045
     * @tc.desc      DlpListState.titleAt(index=200) yields "Text201"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0045 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(200);
      logInfo(`titleAt(index=200): actual=${actual}`);
      expect(actual).assertEqual('Text201');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0045 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0046
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0046
     * @tc.desc      DlpListState.titleAt(index=95.74) yields "Text96.74"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0046 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(95.74);
      logInfo(`titleAt(index=95.74): actual=${actual}`);
      expect(actual).assertEqual('Text96.74');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0046 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0047
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0047
     * @tc.desc      DlpListState.titleAt(index=13) yields "Text14"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0047 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(13);
      logInfo(`titleAt(index=13): actual=${actual}`);
      expect(actual).assertEqual('Text14');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0047 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0048
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0048
     * @tc.desc      DlpListState.titleAt(index=109) yields "Text110"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0048 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(109);
      logInfo(`titleAt(index=109): actual=${actual}`);
      expect(actual).assertEqual('Text110');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0048 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0049
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0049
     * @tc.desc      DlpListState.titleAt(index=61) yields "Text62"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0049 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(61);
      logInfo(`titleAt(index=61): actual=${actual}`);
      expect(actual).assertEqual('Text62');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0049 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0050
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0050
     * @tc.desc      DlpListState.titleAt(index=32.71) yields "Text33.71"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0050 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(32.71);
      logInfo(`titleAt(index=32.71): actual=${actual}`);
      expect(actual).assertEqual('Text33.71');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0050 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0051
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0051
     * @tc.desc      DlpListState.titleAt(index=59) yields "Text60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0051 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(59);
      logInfo(`titleAt(index=59): actual=${actual}`);
      expect(actual).assertEqual('Text60');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0051 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0052
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0052
     * @tc.desc      DlpListState.titleAt(index=0.37) yields "Text1.37"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0052 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(0.37);
      logInfo(`titleAt(index=0.37): actual=${actual}`);
      expect(actual).assertEqual('Text1.37');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0052 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0053
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0053
     * @tc.desc      DlpListState.titleAt(index=36.86) yields "Text37.86"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0053 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(36.86);
      logInfo(`titleAt(index=36.86): actual=${actual}`);
      expect(actual).assertEqual('Text37.86');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0053 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0054
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0054
     * @tc.desc      DlpListState.titleAt(index=11) yields "Text12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0054 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(11);
      logInfo(`titleAt(index=11): actual=${actual}`);
      expect(actual).assertEqual('Text12');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0054 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0055
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0055
     * @tc.desc      DlpListState.titleAt(index=-68) yields "Text-67"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0055 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(-68);
      logInfo(`titleAt(index=-68): actual=${actual}`);
      expect(actual).assertEqual('Text-67');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0055 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0056
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0056
     * @tc.desc      DlpListState.titleAt(index=179) yields "Text180"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0056 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(179);
      logInfo(`titleAt(index=179): actual=${actual}`);
      expect(actual).assertEqual('Text180');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0056 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0057
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0057
     * @tc.desc      DlpListState.titleAt(index=182) yields "Text183"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0057 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(182);
      logInfo(`titleAt(index=182): actual=${actual}`);
      expect(actual).assertEqual('Text183');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0057 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0058
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0058
     * @tc.desc      DlpListState.titleAt(index=-2) yields "Text-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0058 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(-2);
      logInfo(`titleAt(index=-2): actual=${actual}`);
      expect(actual).assertEqual('Text-1');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0058 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0059
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0059
     * @tc.desc      DlpListState.titleAt(index=-4) yields "Text-3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0059 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(-4);
      logInfo(`titleAt(index=-4): actual=${actual}`);
      expect(actual).assertEqual('Text-3');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0059 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0060
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0060
     * @tc.desc      DlpListState.titleAt(index=19.73) yields "Text20.73"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0060 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(19.73);
      logInfo(`titleAt(index=19.73): actual=${actual}`);
      expect(actual).assertEqual('Text20.73');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0060 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0061
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0061
     * @tc.desc      DlpListState.titleAt(index=52.98) yields "Text53.98"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0061 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(52.98);
      logInfo(`titleAt(index=52.98): actual=${actual}`);
      expect(actual).assertEqual('Text53.98');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0061 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0062
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0062
     * @tc.desc      DlpListState.titleAt(index=134) yields "Text135"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0062 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(134);
      logInfo(`titleAt(index=134): actual=${actual}`);
      expect(actual).assertEqual('Text135');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0062 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0063
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0063
     * @tc.desc      DlpListState.titleAt(index=31) yields "Text32"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0063 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(31);
      logInfo(`titleAt(index=31): actual=${actual}`);
      expect(actual).assertEqual('Text32');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0063 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0064
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0064
     * @tc.desc      DlpListState.titleAt(index=15.43) yields "Text16.43"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0064 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(15.43);
      logInfo(`titleAt(index=15.43): actual=${actual}`);
      expect(actual).assertEqual('Text16.43');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0064 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0065
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0065
     * @tc.desc      DlpListState.titleAt(index=-34) yields "Text-33"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0065 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(-34);
      logInfo(`titleAt(index=-34): actual=${actual}`);
      expect(actual).assertEqual('Text-33');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0065 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0066
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0066
     * @tc.desc      DlpListState.titleAt(index=112) yields "Text113"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0066 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(112);
      logInfo(`titleAt(index=112): actual=${actual}`);
      expect(actual).assertEqual('Text113');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0066 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0067
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0067
     * @tc.desc      DlpListState.titleAt(index=188) yields "Text189"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0067 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(188);
      logInfo(`titleAt(index=188): actual=${actual}`);
      expect(actual).assertEqual('Text189');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0067 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0068
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0068
     * @tc.desc      DlpListState.titleAt(index=39.74) yields "Text40.74"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0068 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(39.74);
      logInfo(`titleAt(index=39.74): actual=${actual}`);
      expect(actual).assertEqual('Text40.74');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0068 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0069
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0069
     * @tc.desc      DlpListState.titleAt(index=-82) yields "Text-81"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0069 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(-82);
      logInfo(`titleAt(index=-82): actual=${actual}`);
      expect(actual).assertEqual('Text-81');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0069 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0070
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0070
     * @tc.desc      DlpListState.titleAt(index=28) yields "Text29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0070 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(28);
      logInfo(`titleAt(index=28): actual=${actual}`);
      expect(actual).assertEqual('Text29');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0070 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0071
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0071
     * @tc.desc      DlpListState.titleAt(index=61.53) yields "Text62.53"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0071 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(61.53);
      logInfo(`titleAt(index=61.53): actual=${actual}`);
      expect(actual).assertEqual('Text62.53');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0071 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0072
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0072
     * @tc.desc      DlpListState.titleAt(index=54.81) yields "Text55.81"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0072 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(54.81);
      logInfo(`titleAt(index=54.81): actual=${actual}`);
      expect(actual).assertEqual('Text55.81');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0072 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0073
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0073
     * @tc.desc      DlpListState.titleAt(index=166) yields "Text167"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0073 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(166);
      logInfo(`titleAt(index=166): actual=${actual}`);
      expect(actual).assertEqual('Text167');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0073 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0074
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0074
     * @tc.desc      DlpListState.titleAt(index=101) yields "Text102"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0074 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(101);
      logInfo(`titleAt(index=101): actual=${actual}`);
      expect(actual).assertEqual('Text102');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0074 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0075
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0075
     * @tc.desc      DlpListState.titleAt(index=-83) yields "Text-82"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0075 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(-83);
      logInfo(`titleAt(index=-83): actual=${actual}`);
      expect(actual).assertEqual('Text-82');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0075 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0076
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0076
     * @tc.desc      DlpListState.titleAt(index=-6) yields "Text-5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0076 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(-6);
      logInfo(`titleAt(index=-6): actual=${actual}`);
      expect(actual).assertEqual('Text-5');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0076 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0077
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0077
     * @tc.desc      DlpListState.titleAt(index=77) yields "Text78"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0077 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(77);
      logInfo(`titleAt(index=77): actual=${actual}`);
      expect(actual).assertEqual('Text78');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0077 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0078
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0078
     * @tc.desc      DlpListState.titleAt(index=124) yields "Text125"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0078 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(124);
      logInfo(`titleAt(index=124): actual=${actual}`);
      expect(actual).assertEqual('Text125');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0078 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0079
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0079
     * @tc.desc      DlpListState.titleAt(index=88) yields "Text89"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0079 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(88);
      logInfo(`titleAt(index=88): actual=${actual}`);
      expect(actual).assertEqual('Text89');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0079 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0080
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0080
     * @tc.desc      DlpListState.titleAt(index=102) yields "Text103"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0080 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(102);
      logInfo(`titleAt(index=102): actual=${actual}`);
      expect(actual).assertEqual('Text103');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0080 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0081
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0081
     * @tc.desc      DlpListState.titleAt(index=108) yields "Text109"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0081 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(108);
      logInfo(`titleAt(index=108): actual=${actual}`);
      expect(actual).assertEqual('Text109');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0081 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0082
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0082
     * @tc.desc      DlpListState.titleAt(index=47.97) yields "Text48.97"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0082 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(47.97);
      logInfo(`titleAt(index=47.97): actual=${actual}`);
      expect(actual).assertEqual('Text48.97');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0082 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0083
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0083
     * @tc.desc      DlpListState.titleAt(index=75.52) yields "Text76.52"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0083 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(75.52);
      logInfo(`titleAt(index=75.52): actual=${actual}`);
      expect(actual).assertEqual('Text76.52');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0083 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0084
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0084
     * @tc.desc      DlpListState.titleAt(index=-75) yields "Text-74"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0084 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(-75);
      logInfo(`titleAt(index=-75): actual=${actual}`);
      expect(actual).assertEqual('Text-74');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0084 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0085
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0085
     * @tc.desc      DlpListState.titleAt(index=30.61) yields "Text31.61"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0085 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(30.61);
      logInfo(`titleAt(index=30.61): actual=${actual}`);
      expect(actual).assertEqual('Text31.61');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0085 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0086
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0086
     * @tc.desc      DlpListState.titleAt(index=84.01) yields "Text85.01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0086 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(84.01);
      logInfo(`titleAt(index=84.01): actual=${actual}`);
      expect(actual).assertEqual('Text85.01');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0086 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0087
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0087
     * @tc.desc      DlpListState.titleAt(index=68) yields "Text69"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0087 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(68);
      logInfo(`titleAt(index=68): actual=${actual}`);
      expect(actual).assertEqual('Text69');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0087 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0088
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0088
     * @tc.desc      DlpListState.titleAt(index=-66) yields "Text-65"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0088 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(-66);
      logInfo(`titleAt(index=-66): actual=${actual}`);
      expect(actual).assertEqual('Text-65');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0088 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0089
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0089
     * @tc.desc      DlpListState.titleAt(index=-19) yields "Text-18"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0089 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(-19);
      logInfo(`titleAt(index=-19): actual=${actual}`);
      expect(actual).assertEqual('Text-18');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0089 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0090
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0090
     * @tc.desc      DlpListState.titleAt(index=46.54) yields "Text47.54"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0090 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(46.54);
      logInfo(`titleAt(index=46.54): actual=${actual}`);
      expect(actual).assertEqual('Text47.54');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0090 end`);
    });
  });
}
