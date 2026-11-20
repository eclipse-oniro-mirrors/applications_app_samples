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

/** Logic checks for DlpListState.titleAt (30 cases). */
export default function dlpListStateTitleAt2Test(): void {
  describe('DlpListStateTitleAt2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0091
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0091
     * @tc.desc      DlpListState.titleAt(index=137) yields "Text138"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0091 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(137);
      logInfo(`titleAt(index=137): actual=${actual}`);
      expect(actual).assertEqual('Text138');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0091 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0092
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0092
     * @tc.desc      DlpListState.titleAt(index=34) yields "Text35"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0092 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(34);
      logInfo(`titleAt(index=34): actual=${actual}`);
      expect(actual).assertEqual('Text35');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0092 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0093
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0093
     * @tc.desc      DlpListState.titleAt(index=17.06) yields "Text18.06"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0093 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(17.06);
      logInfo(`titleAt(index=17.06): actual=${actual}`);
      expect(actual).assertEqual('Text18.06');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0093 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0094
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0094
     * @tc.desc      DlpListState.titleAt(index=-16) yields "Text-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0094 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(-16);
      logInfo(`titleAt(index=-16): actual=${actual}`);
      expect(actual).assertEqual('Text-15');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0094 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0095
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0095
     * @tc.desc      DlpListState.titleAt(index=-33) yields "Text-32"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0095 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(-33);
      logInfo(`titleAt(index=-33): actual=${actual}`);
      expect(actual).assertEqual('Text-32');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0095 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0096
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0096
     * @tc.desc      DlpListState.titleAt(index=19.39) yields "Text20.39"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0096 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(19.39);
      logInfo(`titleAt(index=19.39): actual=${actual}`);
      expect(actual).assertEqual('Text20.39');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0096 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0097
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0097
     * @tc.desc      DlpListState.titleAt(index=-26) yields "Text-25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0097 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(-26);
      logInfo(`titleAt(index=-26): actual=${actual}`);
      expect(actual).assertEqual('Text-25');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0097 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0098
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0098
     * @tc.desc      DlpListState.titleAt(index=49) yields "Text50"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0098 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(49);
      logInfo(`titleAt(index=49): actual=${actual}`);
      expect(actual).assertEqual('Text50');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0098 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0099
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0099
     * @tc.desc      DlpListState.titleAt(index=96) yields "Text97"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0099 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(96);
      logInfo(`titleAt(index=96): actual=${actual}`);
      expect(actual).assertEqual('Text97');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0099 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0100
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0100
     * @tc.desc      DlpListState.titleAt(index=49.74) yields "Text50.74"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0100 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(49.74);
      logInfo(`titleAt(index=49.74): actual=${actual}`);
      expect(actual).assertEqual('Text50.74');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0100 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0101
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0101
     * @tc.desc      DlpListState.titleAt(index=162) yields "Text163"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0101 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(162);
      logInfo(`titleAt(index=162): actual=${actual}`);
      expect(actual).assertEqual('Text163');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0101 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0102
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0102
     * @tc.desc      DlpListState.titleAt(index=94) yields "Text95"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0102 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(94);
      logInfo(`titleAt(index=94): actual=${actual}`);
      expect(actual).assertEqual('Text95');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0102 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0103
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0103
     * @tc.desc      DlpListState.titleAt(index=-100) yields "Text-99"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0103 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(-100);
      logInfo(`titleAt(index=-100): actual=${actual}`);
      expect(actual).assertEqual('Text-99');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0103 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0104
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0104
     * @tc.desc      DlpListState.titleAt(index=-62) yields "Text-61"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0104 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(-62);
      logInfo(`titleAt(index=-62): actual=${actual}`);
      expect(actual).assertEqual('Text-61');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0104 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0105
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0105
     * @tc.desc      DlpListState.titleAt(index=4.72) yields "Text5.72"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0105 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(4.72);
      logInfo(`titleAt(index=4.72): actual=${actual}`);
      expect(actual).assertEqual('Text5.72');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0105 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0106
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0106
     * @tc.desc      DlpListState.titleAt(index=74) yields "Text75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0106 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(74);
      logInfo(`titleAt(index=74): actual=${actual}`);
      expect(actual).assertEqual('Text75');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0106 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0107
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0107
     * @tc.desc      DlpListState.titleAt(index=97) yields "Text98"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0107 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(97);
      logInfo(`titleAt(index=97): actual=${actual}`);
      expect(actual).assertEqual('Text98');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0107 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0108
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0108
     * @tc.desc      DlpListState.titleAt(index=24.71) yields "Text25.71"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0108 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(24.71);
      logInfo(`titleAt(index=24.71): actual=${actual}`);
      expect(actual).assertEqual('Text25.71');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0108 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0109
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0109
     * @tc.desc      DlpListState.titleAt(index=-5) yields "Text-4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0109 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(-5);
      logInfo(`titleAt(index=-5): actual=${actual}`);
      expect(actual).assertEqual('Text-4');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0109 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0110
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0110
     * @tc.desc      DlpListState.titleAt(index=-27) yields "Text-26"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0110 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(-27);
      logInfo(`titleAt(index=-27): actual=${actual}`);
      expect(actual).assertEqual('Text-26');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0110 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0111
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0111
     * @tc.desc      DlpListState.titleAt(index=198) yields "Text199"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0111 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(198);
      logInfo(`titleAt(index=198): actual=${actual}`);
      expect(actual).assertEqual('Text199');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0111 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0112
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0112
     * @tc.desc      DlpListState.titleAt(index=76) yields "Text77"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0112 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(76);
      logInfo(`titleAt(index=76): actual=${actual}`);
      expect(actual).assertEqual('Text77');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0112 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0113
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0113
     * @tc.desc      DlpListState.titleAt(index=17) yields "Text18"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0113 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(17);
      logInfo(`titleAt(index=17): actual=${actual}`);
      expect(actual).assertEqual('Text18');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0113 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0114
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0114
     * @tc.desc      DlpListState.titleAt(index=126) yields "Text127"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0114 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(126);
      logInfo(`titleAt(index=126): actual=${actual}`);
      expect(actual).assertEqual('Text127');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0114 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0115
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0115
     * @tc.desc      DlpListState.titleAt(index=139) yields "Text140"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0115 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(139);
      logInfo(`titleAt(index=139): actual=${actual}`);
      expect(actual).assertEqual('Text140');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0115 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0116
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0116
     * @tc.desc      DlpListState.titleAt(index=123) yields "Text124"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0116 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(123);
      logInfo(`titleAt(index=123): actual=${actual}`);
      expect(actual).assertEqual('Text124');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0116 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0117
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0117
     * @tc.desc      DlpListState.titleAt(index=129) yields "Text130"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0117 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(129);
      logInfo(`titleAt(index=129): actual=${actual}`);
      expect(actual).assertEqual('Text130');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0117 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0118
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0118
     * @tc.desc      DlpListState.titleAt(index=164) yields "Text165"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0118 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(164);
      logInfo(`titleAt(index=164): actual=${actual}`);
      expect(actual).assertEqual('Text165');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0118 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0119
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0119
     * @tc.desc      DlpListState.titleAt(index=-77) yields "Text-76"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0119 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(-77);
      logInfo(`titleAt(index=-77): actual=${actual}`);
      expect(actual).assertEqual('Text-76');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0119 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_TITLE_AT_0120
     * @tc.name      FilePreviewDLP_DlpListStateTitleAt_0120
     * @tc.desc      DlpListState.titleAt(index=88.55) yields "Text89.55"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_DlpListStateTitleAt_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DlpListStateTitleAt_0120 begin`);
      const subject: DlpListState = new DlpListState();
      const actual: string = subject.titleAt(88.55);
      logInfo(`titleAt(index=88.55): actual=${actual}`);
      expect(actual).assertEqual('Text89.55');
      logInfo(`${BUNDLE}DlpListStateTitleAt_0120 end`);
    });
  });
}
