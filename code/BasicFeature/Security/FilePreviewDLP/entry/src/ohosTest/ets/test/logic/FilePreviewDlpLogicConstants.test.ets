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
import { FONT_WEIGHT, MAX_SELECT_NUMBER, SIZE_UNIT, VIEW_ACTION } from '../model/FilePreviewDlpLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FilePreviewDLP]';
const BUNDLE: string = 'FilePreviewDLP_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for FilePreviewDlpLogic (4 cases). */
export default function filePreviewDlpLogicConstantsTest(): void {
  describe('FilePreviewDlpLogicConstantsTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FILE_PREVIEW_DLP_LOGIC_CONSTANTS_0001
     * @tc.name      FilePreviewDLP_FilePreviewDlpLogicConstants_0001
     * @tc.desc      MAX_SELECT_NUMBER keeps value 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_FilePreviewDlpLogicConstants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FilePreviewDlpLogicConstants_0001 begin`);
      const actual: number = MAX_SELECT_NUMBER;
      logInfo(`MAX_SELECT_NUMBER: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}FilePreviewDlpLogicConstants_0001 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FILE_PREVIEW_DLP_LOGIC_CONSTANTS_0002
     * @tc.name      FilePreviewDLP_FilePreviewDlpLogicConstants_0002
     * @tc.desc      VIEW_ACTION keeps value "ohos.want.action.viewData"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_FilePreviewDlpLogicConstants_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FilePreviewDlpLogicConstants_0002 begin`);
      const actual: string = VIEW_ACTION;
      logInfo(`VIEW_ACTION: actual=${actual}`);
      expect(actual).assertEqual('ohos.want.action.viewData');
      logInfo(`${BUNDLE}FilePreviewDlpLogicConstants_0002 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FILE_PREVIEW_DLP_LOGIC_CONSTANTS_0003
     * @tc.name      FilePreviewDLP_FilePreviewDlpLogicConstants_0003
     * @tc.desc      FONT_WEIGHT keeps value 400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FilePreviewDlpLogicConstants_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilePreviewDlpLogicConstants_0003 begin`);
      const actual: number = FONT_WEIGHT;
      logInfo(`FONT_WEIGHT: actual=${actual}`);
      expect(actual).assertEqual(400);
      logInfo(`${BUNDLE}FilePreviewDlpLogicConstants_0003 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FILE_PREVIEW_DLP_LOGIC_CONSTANTS_0004
     * @tc.name      FilePreviewDLP_FilePreviewDlpLogicConstants_0004
     * @tc.desc      SIZE_UNIT keeps value "MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FilePreviewDlpLogicConstants_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilePreviewDlpLogicConstants_0004 begin`);
      const actual: string = SIZE_UNIT;
      logInfo(`SIZE_UNIT: actual=${actual}`);
      expect(actual).assertEqual('MB');
      logInfo(`${BUNDLE}FilePreviewDlpLogicConstants_0004 end`);
    });
  });
}
