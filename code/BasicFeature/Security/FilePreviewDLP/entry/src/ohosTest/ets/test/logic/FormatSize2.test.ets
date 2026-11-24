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
import { formatSize } from '../model/FilePreviewDlpLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FilePreviewDLP]';
const BUNDLE: string = 'FilePreviewDLP_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for formatSize (24 cases). */
export default function formatSize2Test(): void {
  describe('FormatSize2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0097
     * @tc.name      FilePreviewDLP_FormatSize_0097
     * @tc.desc      formatSize(fraction=64) returns "640.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0097 begin`);
      const actual: string = formatSize(64);
      logInfo(`formatSize(fraction=64): actual=${actual}`);
      expect(actual).assertEqual('640.0MB');
      logInfo(`${BUNDLE}FormatSize_0097 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0098
     * @tc.name      FilePreviewDLP_FormatSize_0098
     * @tc.desc      formatSize(fraction=17) returns "170.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0098 begin`);
      const actual: string = formatSize(17);
      logInfo(`formatSize(fraction=17): actual=${actual}`);
      expect(actual).assertEqual('170.0MB');
      logInfo(`${BUNDLE}FormatSize_0098 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0099
     * @tc.name      FilePreviewDLP_FormatSize_0099
     * @tc.desc      formatSize(fraction=27) returns "270.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0099 begin`);
      const actual: string = formatSize(27);
      logInfo(`formatSize(fraction=27): actual=${actual}`);
      expect(actual).assertEqual('270.0MB');
      logInfo(`${BUNDLE}FormatSize_0099 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0100
     * @tc.name      FilePreviewDLP_FormatSize_0100
     * @tc.desc      formatSize(fraction=72.35) returns "723.5MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0100 begin`);
      const actual: string = formatSize(72.35);
      logInfo(`formatSize(fraction=72.35): actual=${actual}`);
      expect(actual).assertEqual('723.5MB');
      logInfo(`${BUNDLE}FormatSize_0100 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0101
     * @tc.name      FilePreviewDLP_FormatSize_0101
     * @tc.desc      formatSize(fraction=-87) returns "-870.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatSize_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatSize_0101 begin`);
      const actual: string = formatSize(-87);
      logInfo(`formatSize(fraction=-87): actual=${actual}`);
      expect(actual).assertEqual('-870.0MB');
      logInfo(`${BUNDLE}FormatSize_0101 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0102
     * @tc.name      FilePreviewDLP_FormatSize_0102
     * @tc.desc      formatSize(fraction=193) returns "1930.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0102 begin`);
      const actual: string = formatSize(193);
      logInfo(`formatSize(fraction=193): actual=${actual}`);
      expect(actual).assertEqual('1930.0MB');
      logInfo(`${BUNDLE}FormatSize_0102 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0103
     * @tc.name      FilePreviewDLP_FormatSize_0103
     * @tc.desc      formatSize(fraction=174) returns "1740.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0103 begin`);
      const actual: string = formatSize(174);
      logInfo(`formatSize(fraction=174): actual=${actual}`);
      expect(actual).assertEqual('1740.0MB');
      logInfo(`${BUNDLE}FormatSize_0103 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0104
     * @tc.name      FilePreviewDLP_FormatSize_0104
     * @tc.desc      formatSize(fraction=79) returns "790.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0104 begin`);
      const actual: string = formatSize(79);
      logInfo(`formatSize(fraction=79): actual=${actual}`);
      expect(actual).assertEqual('790.0MB');
      logInfo(`${BUNDLE}FormatSize_0104 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0105
     * @tc.name      FilePreviewDLP_FormatSize_0105
     * @tc.desc      formatSize(fraction=-24) returns "-240.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatSize_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatSize_0105 begin`);
      const actual: string = formatSize(-24);
      logInfo(`formatSize(fraction=-24): actual=${actual}`);
      expect(actual).assertEqual('-240.0MB');
      logInfo(`${BUNDLE}FormatSize_0105 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0106
     * @tc.name      FilePreviewDLP_FormatSize_0106
     * @tc.desc      formatSize(fraction=-19) returns "-190.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatSize_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatSize_0106 begin`);
      const actual: string = formatSize(-19);
      logInfo(`formatSize(fraction=-19): actual=${actual}`);
      expect(actual).assertEqual('-190.0MB');
      logInfo(`${BUNDLE}FormatSize_0106 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0107
     * @tc.name      FilePreviewDLP_FormatSize_0107
     * @tc.desc      formatSize(fraction=194) returns "1940.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0107 begin`);
      const actual: string = formatSize(194);
      logInfo(`formatSize(fraction=194): actual=${actual}`);
      expect(actual).assertEqual('1940.0MB');
      logInfo(`${BUNDLE}FormatSize_0107 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0108
     * @tc.name      FilePreviewDLP_FormatSize_0108
     * @tc.desc      formatSize(fraction=27.87) returns "278.7MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0108 begin`);
      const actual: string = formatSize(27.87);
      logInfo(`formatSize(fraction=27.87): actual=${actual}`);
      expect(actual).assertEqual('278.7MB');
      logInfo(`${BUNDLE}FormatSize_0108 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0109
     * @tc.name      FilePreviewDLP_FormatSize_0109
     * @tc.desc      formatSize(fraction=43.43) returns "434.3MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0109 begin`);
      const actual: string = formatSize(43.43);
      logInfo(`formatSize(fraction=43.43): actual=${actual}`);
      expect(actual).assertEqual('434.3MB');
      logInfo(`${BUNDLE}FormatSize_0109 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0110
     * @tc.name      FilePreviewDLP_FormatSize_0110
     * @tc.desc      formatSize(fraction=189) returns "1890.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0110 begin`);
      const actual: string = formatSize(189);
      logInfo(`formatSize(fraction=189): actual=${actual}`);
      expect(actual).assertEqual('1890.0MB');
      logInfo(`${BUNDLE}FormatSize_0110 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0111
     * @tc.name      FilePreviewDLP_FormatSize_0111
     * @tc.desc      formatSize(fraction=154) returns "1540.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0111 begin`);
      const actual: string = formatSize(154);
      logInfo(`formatSize(fraction=154): actual=${actual}`);
      expect(actual).assertEqual('1540.0MB');
      logInfo(`${BUNDLE}FormatSize_0111 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0112
     * @tc.name      FilePreviewDLP_FormatSize_0112
     * @tc.desc      formatSize(fraction=121) returns "1210.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0112 begin`);
      const actual: string = formatSize(121);
      logInfo(`formatSize(fraction=121): actual=${actual}`);
      expect(actual).assertEqual('1210.0MB');
      logInfo(`${BUNDLE}FormatSize_0112 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0113
     * @tc.name      FilePreviewDLP_FormatSize_0113
     * @tc.desc      formatSize(fraction=87.69) returns "876.9MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0113 begin`);
      const actual: string = formatSize(87.69);
      logInfo(`formatSize(fraction=87.69): actual=${actual}`);
      expect(actual).assertEqual('876.9MB');
      logInfo(`${BUNDLE}FormatSize_0113 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0114
     * @tc.name      FilePreviewDLP_FormatSize_0114
     * @tc.desc      formatSize(fraction=-48) returns "-480.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatSize_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatSize_0114 begin`);
      const actual: string = formatSize(-48);
      logInfo(`formatSize(fraction=-48): actual=${actual}`);
      expect(actual).assertEqual('-480.0MB');
      logInfo(`${BUNDLE}FormatSize_0114 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0115
     * @tc.name      FilePreviewDLP_FormatSize_0115
     * @tc.desc      formatSize(fraction=22.89) returns "228.9MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0115 begin`);
      const actual: string = formatSize(22.89);
      logInfo(`formatSize(fraction=22.89): actual=${actual}`);
      expect(actual).assertEqual('228.9MB');
      logInfo(`${BUNDLE}FormatSize_0115 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0116
     * @tc.name      FilePreviewDLP_FormatSize_0116
     * @tc.desc      formatSize(fraction=84.63) returns "846.3MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0116 begin`);
      const actual: string = formatSize(84.63);
      logInfo(`formatSize(fraction=84.63): actual=${actual}`);
      expect(actual).assertEqual('846.3MB');
      logInfo(`${BUNDLE}FormatSize_0116 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0117
     * @tc.name      FilePreviewDLP_FormatSize_0117
     * @tc.desc      formatSize(fraction=147) returns "1470.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0117 begin`);
      const actual: string = formatSize(147);
      logInfo(`formatSize(fraction=147): actual=${actual}`);
      expect(actual).assertEqual('1470.0MB');
      logInfo(`${BUNDLE}FormatSize_0117 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0118
     * @tc.name      FilePreviewDLP_FormatSize_0118
     * @tc.desc      formatSize(fraction=14) returns "140.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0118 begin`);
      const actual: string = formatSize(14);
      logInfo(`formatSize(fraction=14): actual=${actual}`);
      expect(actual).assertEqual('140.0MB');
      logInfo(`${BUNDLE}FormatSize_0118 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0119
     * @tc.name      FilePreviewDLP_FormatSize_0119
     * @tc.desc      formatSize(fraction=-91) returns "-910.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatSize_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatSize_0119 begin`);
      const actual: string = formatSize(-91);
      logInfo(`formatSize(fraction=-91): actual=${actual}`);
      expect(actual).assertEqual('-910.0MB');
      logInfo(`${BUNDLE}FormatSize_0119 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0120
     * @tc.name      FilePreviewDLP_FormatSize_0120
     * @tc.desc      formatSize(fraction=173) returns "1730.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0120 begin`);
      const actual: string = formatSize(173);
      logInfo(`formatSize(fraction=173): actual=${actual}`);
      expect(actual).assertEqual('1730.0MB');
      logInfo(`${BUNDLE}FormatSize_0120 end`);
    });
  });
}
