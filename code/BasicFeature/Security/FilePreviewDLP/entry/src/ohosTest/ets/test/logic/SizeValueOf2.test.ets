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
import { sizeValueOf } from '../model/FilePreviewDlpLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FilePreviewDLP]';
const BUNDLE: string = 'FilePreviewDLP_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for sizeValueOf (24 cases). */
export default function sizeValueOf2Test(): void {
  describe('SizeValueOf2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0097
     * @tc.name      FilePreviewDLP_SizeValueOf_0097
     * @tc.desc      sizeValueOf(fraction=92.12) returns 921.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0097 begin`);
      const actual: number = sizeValueOf(92.12);
      logInfo(`sizeValueOf(fraction=92.12): actual=${actual}`);
      expect(actual).assertClose(921.2, PRECISION);
      logInfo(`${BUNDLE}SizeValueOf_0097 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0098
     * @tc.name      FilePreviewDLP_SizeValueOf_0098
     * @tc.desc      sizeValueOf(fraction=23.21) returns 232.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0098 begin`);
      const actual: number = sizeValueOf(23.21);
      logInfo(`sizeValueOf(fraction=23.21): actual=${actual}`);
      expect(actual).assertClose(232.1, PRECISION);
      logInfo(`${BUNDLE}SizeValueOf_0098 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0099
     * @tc.name      FilePreviewDLP_SizeValueOf_0099
     * @tc.desc      sizeValueOf(fraction=82) returns 820
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0099 begin`);
      const actual: number = sizeValueOf(82);
      logInfo(`sizeValueOf(fraction=82): actual=${actual}`);
      expect(actual).assertEqual(820);
      logInfo(`${BUNDLE}SizeValueOf_0099 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0100
     * @tc.name      FilePreviewDLP_SizeValueOf_0100
     * @tc.desc      sizeValueOf(fraction=6.81) returns 68.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0100 begin`);
      const actual: number = sizeValueOf(6.81);
      logInfo(`sizeValueOf(fraction=6.81): actual=${actual}`);
      expect(actual).assertClose(68.1, PRECISION);
      logInfo(`${BUNDLE}SizeValueOf_0100 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0101
     * @tc.name      FilePreviewDLP_SizeValueOf_0101
     * @tc.desc      sizeValueOf(fraction=45.92) returns 459.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0101 begin`);
      const actual: number = sizeValueOf(45.92);
      logInfo(`sizeValueOf(fraction=45.92): actual=${actual}`);
      expect(actual).assertClose(459.2, PRECISION);
      logInfo(`${BUNDLE}SizeValueOf_0101 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0102
     * @tc.name      FilePreviewDLP_SizeValueOf_0102
     * @tc.desc      sizeValueOf(fraction=-15) returns -150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_SizeValueOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeValueOf_0102 begin`);
      const actual: number = sizeValueOf(-15);
      logInfo(`sizeValueOf(fraction=-15): actual=${actual}`);
      expect(actual).assertEqual(-150);
      logInfo(`${BUNDLE}SizeValueOf_0102 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0103
     * @tc.name      FilePreviewDLP_SizeValueOf_0103
     * @tc.desc      sizeValueOf(fraction=193) returns 1930
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0103 begin`);
      const actual: number = sizeValueOf(193);
      logInfo(`sizeValueOf(fraction=193): actual=${actual}`);
      expect(actual).assertEqual(1930);
      logInfo(`${BUNDLE}SizeValueOf_0103 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0104
     * @tc.name      FilePreviewDLP_SizeValueOf_0104
     * @tc.desc      sizeValueOf(fraction=83.83) returns 838.3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0104 begin`);
      const actual: number = sizeValueOf(83.83);
      logInfo(`sizeValueOf(fraction=83.83): actual=${actual}`);
      expect(actual).assertClose(838.3, PRECISION);
      logInfo(`${BUNDLE}SizeValueOf_0104 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0105
     * @tc.name      FilePreviewDLP_SizeValueOf_0105
     * @tc.desc      sizeValueOf(fraction=51.75) returns 517.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0105 begin`);
      const actual: number = sizeValueOf(51.75);
      logInfo(`sizeValueOf(fraction=51.75): actual=${actual}`);
      expect(actual).assertClose(517.5, PRECISION);
      logInfo(`${BUNDLE}SizeValueOf_0105 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0106
     * @tc.name      FilePreviewDLP_SizeValueOf_0106
     * @tc.desc      sizeValueOf(fraction=-93) returns -930
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_SizeValueOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeValueOf_0106 begin`);
      const actual: number = sizeValueOf(-93);
      logInfo(`sizeValueOf(fraction=-93): actual=${actual}`);
      expect(actual).assertEqual(-930);
      logInfo(`${BUNDLE}SizeValueOf_0106 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0107
     * @tc.name      FilePreviewDLP_SizeValueOf_0107
     * @tc.desc      sizeValueOf(fraction=-31) returns -310
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_SizeValueOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeValueOf_0107 begin`);
      const actual: number = sizeValueOf(-31);
      logInfo(`sizeValueOf(fraction=-31): actual=${actual}`);
      expect(actual).assertEqual(-310);
      logInfo(`${BUNDLE}SizeValueOf_0107 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0108
     * @tc.name      FilePreviewDLP_SizeValueOf_0108
     * @tc.desc      sizeValueOf(fraction=95.81) returns 958.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0108 begin`);
      const actual: number = sizeValueOf(95.81);
      logInfo(`sizeValueOf(fraction=95.81): actual=${actual}`);
      expect(actual).assertClose(958.1, PRECISION);
      logInfo(`${BUNDLE}SizeValueOf_0108 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0109
     * @tc.name      FilePreviewDLP_SizeValueOf_0109
     * @tc.desc      sizeValueOf(fraction=-17) returns -170
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_SizeValueOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeValueOf_0109 begin`);
      const actual: number = sizeValueOf(-17);
      logInfo(`sizeValueOf(fraction=-17): actual=${actual}`);
      expect(actual).assertEqual(-170);
      logInfo(`${BUNDLE}SizeValueOf_0109 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0110
     * @tc.name      FilePreviewDLP_SizeValueOf_0110
     * @tc.desc      sizeValueOf(fraction=73) returns 730
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0110 begin`);
      const actual: number = sizeValueOf(73);
      logInfo(`sizeValueOf(fraction=73): actual=${actual}`);
      expect(actual).assertEqual(730);
      logInfo(`${BUNDLE}SizeValueOf_0110 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0111
     * @tc.name      FilePreviewDLP_SizeValueOf_0111
     * @tc.desc      sizeValueOf(fraction=99) returns 990
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0111 begin`);
      const actual: number = sizeValueOf(99);
      logInfo(`sizeValueOf(fraction=99): actual=${actual}`);
      expect(actual).assertEqual(990);
      logInfo(`${BUNDLE}SizeValueOf_0111 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0112
     * @tc.name      FilePreviewDLP_SizeValueOf_0112
     * @tc.desc      sizeValueOf(fraction=32.56) returns 325.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0112 begin`);
      const actual: number = sizeValueOf(32.56);
      logInfo(`sizeValueOf(fraction=32.56): actual=${actual}`);
      expect(actual).assertClose(325.6, PRECISION);
      logInfo(`${BUNDLE}SizeValueOf_0112 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0113
     * @tc.name      FilePreviewDLP_SizeValueOf_0113
     * @tc.desc      sizeValueOf(fraction=31.06) returns 310.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0113 begin`);
      const actual: number = sizeValueOf(31.06);
      logInfo(`sizeValueOf(fraction=31.06): actual=${actual}`);
      expect(actual).assertClose(310.6, PRECISION);
      logInfo(`${BUNDLE}SizeValueOf_0113 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0114
     * @tc.name      FilePreviewDLP_SizeValueOf_0114
     * @tc.desc      sizeValueOf(fraction=63) returns 630
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0114 begin`);
      const actual: number = sizeValueOf(63);
      logInfo(`sizeValueOf(fraction=63): actual=${actual}`);
      expect(actual).assertEqual(630);
      logInfo(`${BUNDLE}SizeValueOf_0114 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0115
     * @tc.name      FilePreviewDLP_SizeValueOf_0115
     * @tc.desc      sizeValueOf(fraction=15.21) returns 152.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0115 begin`);
      const actual: number = sizeValueOf(15.21);
      logInfo(`sizeValueOf(fraction=15.21): actual=${actual}`);
      expect(actual).assertClose(152.1, PRECISION);
      logInfo(`${BUNDLE}SizeValueOf_0115 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0116
     * @tc.name      FilePreviewDLP_SizeValueOf_0116
     * @tc.desc      sizeValueOf(fraction=84.05) returns 840.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0116 begin`);
      const actual: number = sizeValueOf(84.05);
      logInfo(`sizeValueOf(fraction=84.05): actual=${actual}`);
      expect(actual).assertClose(840.5, PRECISION);
      logInfo(`${BUNDLE}SizeValueOf_0116 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0117
     * @tc.name      FilePreviewDLP_SizeValueOf_0117
     * @tc.desc      sizeValueOf(fraction=94.53) returns 945.3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0117 begin`);
      const actual: number = sizeValueOf(94.53);
      logInfo(`sizeValueOf(fraction=94.53): actual=${actual}`);
      expect(actual).assertClose(945.3, PRECISION);
      logInfo(`${BUNDLE}SizeValueOf_0117 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0118
     * @tc.name      FilePreviewDLP_SizeValueOf_0118
     * @tc.desc      sizeValueOf(fraction=48.22) returns 482.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0118 begin`);
      const actual: number = sizeValueOf(48.22);
      logInfo(`sizeValueOf(fraction=48.22): actual=${actual}`);
      expect(actual).assertClose(482.2, PRECISION);
      logInfo(`${BUNDLE}SizeValueOf_0118 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0119
     * @tc.name      FilePreviewDLP_SizeValueOf_0119
     * @tc.desc      sizeValueOf(fraction=7) returns 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0119 begin`);
      const actual: number = sizeValueOf(7);
      logInfo(`sizeValueOf(fraction=7): actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}SizeValueOf_0119 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0120
     * @tc.name      FilePreviewDLP_SizeValueOf_0120
     * @tc.desc      sizeValueOf(fraction=45.17) returns 451.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0120 begin`);
      const actual: number = sizeValueOf(45.17);
      logInfo(`sizeValueOf(fraction=45.17): actual=${actual}`);
      expect(actual).assertClose(451.7, PRECISION);
      logInfo(`${BUNDLE}SizeValueOf_0120 end`);
    });
  });
}
