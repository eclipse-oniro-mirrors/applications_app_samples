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
import { countAfterSelection } from '../model/FilePreviewDlpLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FilePreviewDLP]';
const BUNDLE: string = 'FilePreviewDLP_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for countAfterSelection (96 cases). */
export default function countAfterSelection2Test(): void {
  describe('CountAfterSelection2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0097
     * @tc.name      FilePreviewDLP_CountAfterSelection_0097
     * @tc.desc      countAfterSelection(currentCount=0, selectedCount=25) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0097 begin`);
      const actual: number = countAfterSelection(0, 25);
      logInfo(`countAfterSelection(currentCount=0, selec...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}CountAfterSelection_0097 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0098
     * @tc.name      FilePreviewDLP_CountAfterSelection_0098
     * @tc.desc      countAfterSelection(currentCount=0, selectedCount=30) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0098 begin`);
      const actual: number = countAfterSelection(0, 30);
      logInfo(`countAfterSelection(currentCount=0, selec...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}CountAfterSelection_0098 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0099
     * @tc.name      FilePreviewDLP_CountAfterSelection_0099
     * @tc.desc      countAfterSelection(currentCount=0, selectedCount=35) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0099 begin`);
      const actual: number = countAfterSelection(0, 35);
      logInfo(`countAfterSelection(currentCount=0, selec...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}CountAfterSelection_0099 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0100
     * @tc.name      FilePreviewDLP_CountAfterSelection_0100
     * @tc.desc      countAfterSelection(currentCount=0, selectedCount=40) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0100 begin`);
      const actual: number = countAfterSelection(0, 40);
      logInfo(`countAfterSelection(currentCount=0, selec...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}CountAfterSelection_0100 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0101
     * @tc.name      FilePreviewDLP_CountAfterSelection_0101
     * @tc.desc      countAfterSelection(currentCount=0, selectedCount=45) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0101 begin`);
      const actual: number = countAfterSelection(0, 45);
      logInfo(`countAfterSelection(currentCount=0, selec...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}CountAfterSelection_0101 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0102
     * @tc.name      FilePreviewDLP_CountAfterSelection_0102
     * @tc.desc      countAfterSelection(currentCount=0, selectedCount=50) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0102 begin`);
      const actual: number = countAfterSelection(0, 50);
      logInfo(`countAfterSelection(currentCount=0, selec...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}CountAfterSelection_0102 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0103
     * @tc.name      FilePreviewDLP_CountAfterSelection_0103
     * @tc.desc      countAfterSelection(currentCount=0, selectedCount=55) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0103 begin`);
      const actual: number = countAfterSelection(0, 55);
      logInfo(`countAfterSelection(currentCount=0, selec...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}CountAfterSelection_0103 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0104
     * @tc.name      FilePreviewDLP_CountAfterSelection_0104
     * @tc.desc      countAfterSelection(currentCount=0, selectedCount=60) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0104 begin`);
      const actual: number = countAfterSelection(0, 60);
      logInfo(`countAfterSelection(currentCount=0, selec...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}CountAfterSelection_0104 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0105
     * @tc.name      FilePreviewDLP_CountAfterSelection_0105
     * @tc.desc      countAfterSelection(currentCount=0, selectedCount=65) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0105 begin`);
      const actual: number = countAfterSelection(0, 65);
      logInfo(`countAfterSelection(currentCount=0, selec...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}CountAfterSelection_0105 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0106
     * @tc.name      FilePreviewDLP_CountAfterSelection_0106
     * @tc.desc      countAfterSelection(currentCount=0, selectedCount=70) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0106 begin`);
      const actual: number = countAfterSelection(0, 70);
      logInfo(`countAfterSelection(currentCount=0, selec...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}CountAfterSelection_0106 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0107
     * @tc.name      FilePreviewDLP_CountAfterSelection_0107
     * @tc.desc      countAfterSelection(currentCount=0, selectedCount=75) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0107 begin`);
      const actual: number = countAfterSelection(0, 75);
      logInfo(`countAfterSelection(currentCount=0, selec...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}CountAfterSelection_0107 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0108
     * @tc.name      FilePreviewDLP_CountAfterSelection_0108
     * @tc.desc      countAfterSelection(currentCount=0, selectedCount=80) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0108 begin`);
      const actual: number = countAfterSelection(0, 80);
      logInfo(`countAfterSelection(currentCount=0, selec...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}CountAfterSelection_0108 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0109
     * @tc.name      FilePreviewDLP_CountAfterSelection_0109
     * @tc.desc      countAfterSelection(currentCount=0, selectedCount=85) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0109 begin`);
      const actual: number = countAfterSelection(0, 85);
      logInfo(`countAfterSelection(currentCount=0, selec...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}CountAfterSelection_0109 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0110
     * @tc.name      FilePreviewDLP_CountAfterSelection_0110
     * @tc.desc      countAfterSelection(currentCount=0, selectedCount=90) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0110 begin`);
      const actual: number = countAfterSelection(0, 90);
      logInfo(`countAfterSelection(currentCount=0, selec...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}CountAfterSelection_0110 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0111
     * @tc.name      FilePreviewDLP_CountAfterSelection_0111
     * @tc.desc      countAfterSelection(currentCount=0, selectedCount=95) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0111 begin`);
      const actual: number = countAfterSelection(0, 95);
      logInfo(`countAfterSelection(currentCount=0, selec...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}CountAfterSelection_0111 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0112
     * @tc.name      FilePreviewDLP_CountAfterSelection_0112
     * @tc.desc      countAfterSelection(currentCount=0, selectedCount=105) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0112 begin`);
      const actual: number = countAfterSelection(0, 105);
      logInfo(`countAfterSelection(currentCount=0, selec...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}CountAfterSelection_0112 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0113
     * @tc.name      FilePreviewDLP_CountAfterSelection_0113
     * @tc.desc      countAfterSelection(currentCount=0, selectedCount=110) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0113 begin`);
      const actual: number = countAfterSelection(0, 110);
      logInfo(`countAfterSelection(currentCount=0, selec...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}CountAfterSelection_0113 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0114
     * @tc.name      FilePreviewDLP_CountAfterSelection_0114
     * @tc.desc      countAfterSelection(currentCount=0, selectedCount=26) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0114 begin`);
      const actual: number = countAfterSelection(0, 26);
      logInfo(`countAfterSelection(currentCount=0, selec...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}CountAfterSelection_0114 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0115
     * @tc.name      FilePreviewDLP_CountAfterSelection_0115
     * @tc.desc      countAfterSelection(currentCount=0, selectedCount=-26) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_CountAfterSelection_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0115 begin`);
      const actual: number = countAfterSelection(0, -26);
      logInfo(`countAfterSelection(currentCount=0, selec...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CountAfterSelection_0115 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0116
     * @tc.name      FilePreviewDLP_CountAfterSelection_0116
     * @tc.desc      countAfterSelection(currentCount=0, selectedCount=29.17) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0116 begin`);
      const actual: number = countAfterSelection(0, 29.17);
      logInfo(`countAfterSelection(currentCount=0, selec...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}CountAfterSelection_0116 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0117
     * @tc.name      FilePreviewDLP_CountAfterSelection_0117
     * @tc.desc      countAfterSelection(currentCount=500, selectedCount=10) returns 503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0117 begin`);
      const actual: number = countAfterSelection(500, 10);
      logInfo(`countAfterSelection(currentCount=500, sel...: actual=${actual}`);
      expect(actual).assertEqual(503);
      logInfo(`${BUNDLE}CountAfterSelection_0117 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0118
     * @tc.name      FilePreviewDLP_CountAfterSelection_0118
     * @tc.desc      countAfterSelection(currentCount=500, selectedCount=100) returns 503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0118 begin`);
      const actual: number = countAfterSelection(500, 100);
      logInfo(`countAfterSelection(currentCount=500, sel...: actual=${actual}`);
      expect(actual).assertEqual(503);
      logInfo(`${BUNDLE}CountAfterSelection_0118 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0119
     * @tc.name      FilePreviewDLP_CountAfterSelection_0119
     * @tc.desc      countAfterSelection(currentCount=500, selectedCount=-1) returns 500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_CountAfterSelection_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0119 begin`);
      const actual: number = countAfterSelection(500, -1);
      logInfo(`countAfterSelection(currentCount=500, sel...: actual=${actual}`);
      expect(actual).assertEqual(500);
      logInfo(`${BUNDLE}CountAfterSelection_0119 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0120
     * @tc.name      FilePreviewDLP_CountAfterSelection_0120
     * @tc.desc      countAfterSelection(currentCount=500, selectedCount=3) returns 503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0120 begin`);
      const actual: number = countAfterSelection(500, 3);
      logInfo(`countAfterSelection(currentCount=500, sel...: actual=${actual}`);
      expect(actual).assertEqual(503);
      logInfo(`${BUNDLE}CountAfterSelection_0120 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0121
     * @tc.name      FilePreviewDLP_CountAfterSelection_0121
     * @tc.desc      countAfterSelection(currentCount=500, selectedCount=15) returns 503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0121 begin`);
      const actual: number = countAfterSelection(500, 15);
      logInfo(`countAfterSelection(currentCount=500, sel...: actual=${actual}`);
      expect(actual).assertEqual(503);
      logInfo(`${BUNDLE}CountAfterSelection_0121 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0122
     * @tc.name      FilePreviewDLP_CountAfterSelection_0122
     * @tc.desc      countAfterSelection(currentCount=500, selectedCount=20) returns 503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0122 begin`);
      const actual: number = countAfterSelection(500, 20);
      logInfo(`countAfterSelection(currentCount=500, sel...: actual=${actual}`);
      expect(actual).assertEqual(503);
      logInfo(`${BUNDLE}CountAfterSelection_0122 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0123
     * @tc.name      FilePreviewDLP_CountAfterSelection_0123
     * @tc.desc      countAfterSelection(currentCount=500, selectedCount=25) returns 503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0123 begin`);
      const actual: number = countAfterSelection(500, 25);
      logInfo(`countAfterSelection(currentCount=500, sel...: actual=${actual}`);
      expect(actual).assertEqual(503);
      logInfo(`${BUNDLE}CountAfterSelection_0123 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0124
     * @tc.name      FilePreviewDLP_CountAfterSelection_0124
     * @tc.desc      countAfterSelection(currentCount=500, selectedCount=30) returns 503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0124 begin`);
      const actual: number = countAfterSelection(500, 30);
      logInfo(`countAfterSelection(currentCount=500, sel...: actual=${actual}`);
      expect(actual).assertEqual(503);
      logInfo(`${BUNDLE}CountAfterSelection_0124 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0125
     * @tc.name      FilePreviewDLP_CountAfterSelection_0125
     * @tc.desc      countAfterSelection(currentCount=500, selectedCount=35) returns 503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0125 begin`);
      const actual: number = countAfterSelection(500, 35);
      logInfo(`countAfterSelection(currentCount=500, sel...: actual=${actual}`);
      expect(actual).assertEqual(503);
      logInfo(`${BUNDLE}CountAfterSelection_0125 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0126
     * @tc.name      FilePreviewDLP_CountAfterSelection_0126
     * @tc.desc      countAfterSelection(currentCount=500, selectedCount=40) returns 503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0126 begin`);
      const actual: number = countAfterSelection(500, 40);
      logInfo(`countAfterSelection(currentCount=500, sel...: actual=${actual}`);
      expect(actual).assertEqual(503);
      logInfo(`${BUNDLE}CountAfterSelection_0126 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0127
     * @tc.name      FilePreviewDLP_CountAfterSelection_0127
     * @tc.desc      countAfterSelection(currentCount=500, selectedCount=45) returns 503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0127 begin`);
      const actual: number = countAfterSelection(500, 45);
      logInfo(`countAfterSelection(currentCount=500, sel...: actual=${actual}`);
      expect(actual).assertEqual(503);
      logInfo(`${BUNDLE}CountAfterSelection_0127 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0128
     * @tc.name      FilePreviewDLP_CountAfterSelection_0128
     * @tc.desc      countAfterSelection(currentCount=500, selectedCount=50) returns 503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0128 begin`);
      const actual: number = countAfterSelection(500, 50);
      logInfo(`countAfterSelection(currentCount=500, sel...: actual=${actual}`);
      expect(actual).assertEqual(503);
      logInfo(`${BUNDLE}CountAfterSelection_0128 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0129
     * @tc.name      FilePreviewDLP_CountAfterSelection_0129
     * @tc.desc      countAfterSelection(currentCount=500, selectedCount=55) returns 503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0129 begin`);
      const actual: number = countAfterSelection(500, 55);
      logInfo(`countAfterSelection(currentCount=500, sel...: actual=${actual}`);
      expect(actual).assertEqual(503);
      logInfo(`${BUNDLE}CountAfterSelection_0129 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0130
     * @tc.name      FilePreviewDLP_CountAfterSelection_0130
     * @tc.desc      countAfterSelection(currentCount=500, selectedCount=60) returns 503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0130 begin`);
      const actual: number = countAfterSelection(500, 60);
      logInfo(`countAfterSelection(currentCount=500, sel...: actual=${actual}`);
      expect(actual).assertEqual(503);
      logInfo(`${BUNDLE}CountAfterSelection_0130 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0131
     * @tc.name      FilePreviewDLP_CountAfterSelection_0131
     * @tc.desc      countAfterSelection(currentCount=500, selectedCount=65) returns 503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0131 begin`);
      const actual: number = countAfterSelection(500, 65);
      logInfo(`countAfterSelection(currentCount=500, sel...: actual=${actual}`);
      expect(actual).assertEqual(503);
      logInfo(`${BUNDLE}CountAfterSelection_0131 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0132
     * @tc.name      FilePreviewDLP_CountAfterSelection_0132
     * @tc.desc      countAfterSelection(currentCount=500, selectedCount=70) returns 503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0132 begin`);
      const actual: number = countAfterSelection(500, 70);
      logInfo(`countAfterSelection(currentCount=500, sel...: actual=${actual}`);
      expect(actual).assertEqual(503);
      logInfo(`${BUNDLE}CountAfterSelection_0132 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0133
     * @tc.name      FilePreviewDLP_CountAfterSelection_0133
     * @tc.desc      countAfterSelection(currentCount=500, selectedCount=75) returns 503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0133 begin`);
      const actual: number = countAfterSelection(500, 75);
      logInfo(`countAfterSelection(currentCount=500, sel...: actual=${actual}`);
      expect(actual).assertEqual(503);
      logInfo(`${BUNDLE}CountAfterSelection_0133 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0134
     * @tc.name      FilePreviewDLP_CountAfterSelection_0134
     * @tc.desc      countAfterSelection(currentCount=500, selectedCount=80) returns 503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0134 begin`);
      const actual: number = countAfterSelection(500, 80);
      logInfo(`countAfterSelection(currentCount=500, sel...: actual=${actual}`);
      expect(actual).assertEqual(503);
      logInfo(`${BUNDLE}CountAfterSelection_0134 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0135
     * @tc.name      FilePreviewDLP_CountAfterSelection_0135
     * @tc.desc      countAfterSelection(currentCount=500, selectedCount=85) returns 503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0135 begin`);
      const actual: number = countAfterSelection(500, 85);
      logInfo(`countAfterSelection(currentCount=500, sel...: actual=${actual}`);
      expect(actual).assertEqual(503);
      logInfo(`${BUNDLE}CountAfterSelection_0135 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0136
     * @tc.name      FilePreviewDLP_CountAfterSelection_0136
     * @tc.desc      countAfterSelection(currentCount=500, selectedCount=90) returns 503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0136 begin`);
      const actual: number = countAfterSelection(500, 90);
      logInfo(`countAfterSelection(currentCount=500, sel...: actual=${actual}`);
      expect(actual).assertEqual(503);
      logInfo(`${BUNDLE}CountAfterSelection_0136 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0137
     * @tc.name      FilePreviewDLP_CountAfterSelection_0137
     * @tc.desc      countAfterSelection(currentCount=500, selectedCount=95) returns 503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0137 begin`);
      const actual: number = countAfterSelection(500, 95);
      logInfo(`countAfterSelection(currentCount=500, sel...: actual=${actual}`);
      expect(actual).assertEqual(503);
      logInfo(`${BUNDLE}CountAfterSelection_0137 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0138
     * @tc.name      FilePreviewDLP_CountAfterSelection_0138
     * @tc.desc      countAfterSelection(currentCount=500, selectedCount=105) returns 503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0138 begin`);
      const actual: number = countAfterSelection(500, 105);
      logInfo(`countAfterSelection(currentCount=500, sel...: actual=${actual}`);
      expect(actual).assertEqual(503);
      logInfo(`${BUNDLE}CountAfterSelection_0138 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0139
     * @tc.name      FilePreviewDLP_CountAfterSelection_0139
     * @tc.desc      countAfterSelection(currentCount=500, selectedCount=110) returns 503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0139 begin`);
      const actual: number = countAfterSelection(500, 110);
      logInfo(`countAfterSelection(currentCount=500, sel...: actual=${actual}`);
      expect(actual).assertEqual(503);
      logInfo(`${BUNDLE}CountAfterSelection_0139 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0140
     * @tc.name      FilePreviewDLP_CountAfterSelection_0140
     * @tc.desc      countAfterSelection(currentCount=500, selectedCount=26) returns 503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0140 begin`);
      const actual: number = countAfterSelection(500, 26);
      logInfo(`countAfterSelection(currentCount=500, sel...: actual=${actual}`);
      expect(actual).assertEqual(503);
      logInfo(`${BUNDLE}CountAfterSelection_0140 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0141
     * @tc.name      FilePreviewDLP_CountAfterSelection_0141
     * @tc.desc      countAfterSelection(currentCount=500, selectedCount=-26) returns 500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_CountAfterSelection_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0141 begin`);
      const actual: number = countAfterSelection(500, -26);
      logInfo(`countAfterSelection(currentCount=500, sel...: actual=${actual}`);
      expect(actual).assertEqual(500);
      logInfo(`${BUNDLE}CountAfterSelection_0141 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0142
     * @tc.name      FilePreviewDLP_CountAfterSelection_0142
     * @tc.desc      countAfterSelection(currentCount=500, selectedCount=29.17) returns 503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0142 begin`);
      const actual: number = countAfterSelection(500, 29.17);
      logInfo(`countAfterSelection(currentCount=500, sel...: actual=${actual}`);
      expect(actual).assertEqual(503);
      logInfo(`${BUNDLE}CountAfterSelection_0142 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0143
     * @tc.name      FilePreviewDLP_CountAfterSelection_0143
     * @tc.desc      countAfterSelection(currentCount=999, selectedCount=10) returns 1002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0143 begin`);
      const actual: number = countAfterSelection(999, 10);
      logInfo(`countAfterSelection(currentCount=999, sel...: actual=${actual}`);
      expect(actual).assertEqual(1002);
      logInfo(`${BUNDLE}CountAfterSelection_0143 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0144
     * @tc.name      FilePreviewDLP_CountAfterSelection_0144
     * @tc.desc      countAfterSelection(currentCount=999, selectedCount=100) returns 1002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0144 begin`);
      const actual: number = countAfterSelection(999, 100);
      logInfo(`countAfterSelection(currentCount=999, sel...: actual=${actual}`);
      expect(actual).assertEqual(1002);
      logInfo(`${BUNDLE}CountAfterSelection_0144 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0145
     * @tc.name      FilePreviewDLP_CountAfterSelection_0145
     * @tc.desc      countAfterSelection(currentCount=999, selectedCount=-1) returns 999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_CountAfterSelection_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0145 begin`);
      const actual: number = countAfterSelection(999, -1);
      logInfo(`countAfterSelection(currentCount=999, sel...: actual=${actual}`);
      expect(actual).assertEqual(999);
      logInfo(`${BUNDLE}CountAfterSelection_0145 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0146
     * @tc.name      FilePreviewDLP_CountAfterSelection_0146
     * @tc.desc      countAfterSelection(currentCount=999, selectedCount=3) returns 1002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0146 begin`);
      const actual: number = countAfterSelection(999, 3);
      logInfo(`countAfterSelection(currentCount=999, sel...: actual=${actual}`);
      expect(actual).assertEqual(1002);
      logInfo(`${BUNDLE}CountAfterSelection_0146 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0147
     * @tc.name      FilePreviewDLP_CountAfterSelection_0147
     * @tc.desc      countAfterSelection(currentCount=999, selectedCount=15) returns 1002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0147 begin`);
      const actual: number = countAfterSelection(999, 15);
      logInfo(`countAfterSelection(currentCount=999, sel...: actual=${actual}`);
      expect(actual).assertEqual(1002);
      logInfo(`${BUNDLE}CountAfterSelection_0147 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0148
     * @tc.name      FilePreviewDLP_CountAfterSelection_0148
     * @tc.desc      countAfterSelection(currentCount=999, selectedCount=20) returns 1002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0148 begin`);
      const actual: number = countAfterSelection(999, 20);
      logInfo(`countAfterSelection(currentCount=999, sel...: actual=${actual}`);
      expect(actual).assertEqual(1002);
      logInfo(`${BUNDLE}CountAfterSelection_0148 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0149
     * @tc.name      FilePreviewDLP_CountAfterSelection_0149
     * @tc.desc      countAfterSelection(currentCount=999, selectedCount=25) returns 1002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0149 begin`);
      const actual: number = countAfterSelection(999, 25);
      logInfo(`countAfterSelection(currentCount=999, sel...: actual=${actual}`);
      expect(actual).assertEqual(1002);
      logInfo(`${BUNDLE}CountAfterSelection_0149 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0150
     * @tc.name      FilePreviewDLP_CountAfterSelection_0150
     * @tc.desc      countAfterSelection(currentCount=999, selectedCount=30) returns 1002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0150 begin`);
      const actual: number = countAfterSelection(999, 30);
      logInfo(`countAfterSelection(currentCount=999, sel...: actual=${actual}`);
      expect(actual).assertEqual(1002);
      logInfo(`${BUNDLE}CountAfterSelection_0150 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0151
     * @tc.name      FilePreviewDLP_CountAfterSelection_0151
     * @tc.desc      countAfterSelection(currentCount=999, selectedCount=35) returns 1002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0151 begin`);
      const actual: number = countAfterSelection(999, 35);
      logInfo(`countAfterSelection(currentCount=999, sel...: actual=${actual}`);
      expect(actual).assertEqual(1002);
      logInfo(`${BUNDLE}CountAfterSelection_0151 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0152
     * @tc.name      FilePreviewDLP_CountAfterSelection_0152
     * @tc.desc      countAfterSelection(currentCount=999, selectedCount=40) returns 1002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0152 begin`);
      const actual: number = countAfterSelection(999, 40);
      logInfo(`countAfterSelection(currentCount=999, sel...: actual=${actual}`);
      expect(actual).assertEqual(1002);
      logInfo(`${BUNDLE}CountAfterSelection_0152 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0153
     * @tc.name      FilePreviewDLP_CountAfterSelection_0153
     * @tc.desc      countAfterSelection(currentCount=999, selectedCount=45) returns 1002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0153 begin`);
      const actual: number = countAfterSelection(999, 45);
      logInfo(`countAfterSelection(currentCount=999, sel...: actual=${actual}`);
      expect(actual).assertEqual(1002);
      logInfo(`${BUNDLE}CountAfterSelection_0153 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0154
     * @tc.name      FilePreviewDLP_CountAfterSelection_0154
     * @tc.desc      countAfterSelection(currentCount=999, selectedCount=50) returns 1002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0154 begin`);
      const actual: number = countAfterSelection(999, 50);
      logInfo(`countAfterSelection(currentCount=999, sel...: actual=${actual}`);
      expect(actual).assertEqual(1002);
      logInfo(`${BUNDLE}CountAfterSelection_0154 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0155
     * @tc.name      FilePreviewDLP_CountAfterSelection_0155
     * @tc.desc      countAfterSelection(currentCount=999, selectedCount=55) returns 1002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0155 begin`);
      const actual: number = countAfterSelection(999, 55);
      logInfo(`countAfterSelection(currentCount=999, sel...: actual=${actual}`);
      expect(actual).assertEqual(1002);
      logInfo(`${BUNDLE}CountAfterSelection_0155 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0156
     * @tc.name      FilePreviewDLP_CountAfterSelection_0156
     * @tc.desc      countAfterSelection(currentCount=999, selectedCount=60) returns 1002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0156 begin`);
      const actual: number = countAfterSelection(999, 60);
      logInfo(`countAfterSelection(currentCount=999, sel...: actual=${actual}`);
      expect(actual).assertEqual(1002);
      logInfo(`${BUNDLE}CountAfterSelection_0156 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0157
     * @tc.name      FilePreviewDLP_CountAfterSelection_0157
     * @tc.desc      countAfterSelection(currentCount=999, selectedCount=65) returns 1002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0157 begin`);
      const actual: number = countAfterSelection(999, 65);
      logInfo(`countAfterSelection(currentCount=999, sel...: actual=${actual}`);
      expect(actual).assertEqual(1002);
      logInfo(`${BUNDLE}CountAfterSelection_0157 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0158
     * @tc.name      FilePreviewDLP_CountAfterSelection_0158
     * @tc.desc      countAfterSelection(currentCount=999, selectedCount=70) returns 1002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0158 begin`);
      const actual: number = countAfterSelection(999, 70);
      logInfo(`countAfterSelection(currentCount=999, sel...: actual=${actual}`);
      expect(actual).assertEqual(1002);
      logInfo(`${BUNDLE}CountAfterSelection_0158 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0159
     * @tc.name      FilePreviewDLP_CountAfterSelection_0159
     * @tc.desc      countAfterSelection(currentCount=999, selectedCount=75) returns 1002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0159 begin`);
      const actual: number = countAfterSelection(999, 75);
      logInfo(`countAfterSelection(currentCount=999, sel...: actual=${actual}`);
      expect(actual).assertEqual(1002);
      logInfo(`${BUNDLE}CountAfterSelection_0159 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0160
     * @tc.name      FilePreviewDLP_CountAfterSelection_0160
     * @tc.desc      countAfterSelection(currentCount=999, selectedCount=80) returns 1002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0160 begin`);
      const actual: number = countAfterSelection(999, 80);
      logInfo(`countAfterSelection(currentCount=999, sel...: actual=${actual}`);
      expect(actual).assertEqual(1002);
      logInfo(`${BUNDLE}CountAfterSelection_0160 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0161
     * @tc.name      FilePreviewDLP_CountAfterSelection_0161
     * @tc.desc      countAfterSelection(currentCount=999, selectedCount=85) returns 1002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0161 begin`);
      const actual: number = countAfterSelection(999, 85);
      logInfo(`countAfterSelection(currentCount=999, sel...: actual=${actual}`);
      expect(actual).assertEqual(1002);
      logInfo(`${BUNDLE}CountAfterSelection_0161 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0162
     * @tc.name      FilePreviewDLP_CountAfterSelection_0162
     * @tc.desc      countAfterSelection(currentCount=999, selectedCount=90) returns 1002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0162 begin`);
      const actual: number = countAfterSelection(999, 90);
      logInfo(`countAfterSelection(currentCount=999, sel...: actual=${actual}`);
      expect(actual).assertEqual(1002);
      logInfo(`${BUNDLE}CountAfterSelection_0162 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0163
     * @tc.name      FilePreviewDLP_CountAfterSelection_0163
     * @tc.desc      countAfterSelection(currentCount=999, selectedCount=95) returns 1002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0163 begin`);
      const actual: number = countAfterSelection(999, 95);
      logInfo(`countAfterSelection(currentCount=999, sel...: actual=${actual}`);
      expect(actual).assertEqual(1002);
      logInfo(`${BUNDLE}CountAfterSelection_0163 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0164
     * @tc.name      FilePreviewDLP_CountAfterSelection_0164
     * @tc.desc      countAfterSelection(currentCount=999, selectedCount=105) returns 1002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0164 begin`);
      const actual: number = countAfterSelection(999, 105);
      logInfo(`countAfterSelection(currentCount=999, sel...: actual=${actual}`);
      expect(actual).assertEqual(1002);
      logInfo(`${BUNDLE}CountAfterSelection_0164 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0165
     * @tc.name      FilePreviewDLP_CountAfterSelection_0165
     * @tc.desc      countAfterSelection(currentCount=999, selectedCount=110) returns 1002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0165 begin`);
      const actual: number = countAfterSelection(999, 110);
      logInfo(`countAfterSelection(currentCount=999, sel...: actual=${actual}`);
      expect(actual).assertEqual(1002);
      logInfo(`${BUNDLE}CountAfterSelection_0165 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0166
     * @tc.name      FilePreviewDLP_CountAfterSelection_0166
     * @tc.desc      countAfterSelection(currentCount=999, selectedCount=26) returns 1002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0166 begin`);
      const actual: number = countAfterSelection(999, 26);
      logInfo(`countAfterSelection(currentCount=999, sel...: actual=${actual}`);
      expect(actual).assertEqual(1002);
      logInfo(`${BUNDLE}CountAfterSelection_0166 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0167
     * @tc.name      FilePreviewDLP_CountAfterSelection_0167
     * @tc.desc      countAfterSelection(currentCount=999, selectedCount=-26) returns 999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_CountAfterSelection_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0167 begin`);
      const actual: number = countAfterSelection(999, -26);
      logInfo(`countAfterSelection(currentCount=999, sel...: actual=${actual}`);
      expect(actual).assertEqual(999);
      logInfo(`${BUNDLE}CountAfterSelection_0167 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0168
     * @tc.name      FilePreviewDLP_CountAfterSelection_0168
     * @tc.desc      countAfterSelection(currentCount=999, selectedCount=29.17) returns 1002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0168 begin`);
      const actual: number = countAfterSelection(999, 29.17);
      logInfo(`countAfterSelection(currentCount=999, sel...: actual=${actual}`);
      expect(actual).assertEqual(1002);
      logInfo(`${BUNDLE}CountAfterSelection_0168 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0169
     * @tc.name      FilePreviewDLP_CountAfterSelection_0169
     * @tc.desc      countAfterSelection(currentCount=1000, selectedCount=0) returns 1000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0169 begin`);
      const actual: number = countAfterSelection(1000, 0);
      logInfo(`countAfterSelection(currentCount=1000, se...: actual=${actual}`);
      expect(actual).assertEqual(1000);
      logInfo(`${BUNDLE}CountAfterSelection_0169 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0170
     * @tc.name      FilePreviewDLP_CountAfterSelection_0170
     * @tc.desc      countAfterSelection(currentCount=1000, selectedCount=1) returns 1001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0170 begin`);
      const actual: number = countAfterSelection(1000, 1);
      logInfo(`countAfterSelection(currentCount=1000, se...: actual=${actual}`);
      expect(actual).assertEqual(1001);
      logInfo(`${BUNDLE}CountAfterSelection_0170 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0171
     * @tc.name      FilePreviewDLP_CountAfterSelection_0171
     * @tc.desc      countAfterSelection(currentCount=1000, selectedCount=2) returns 1002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0171 begin`);
      const actual: number = countAfterSelection(1000, 2);
      logInfo(`countAfterSelection(currentCount=1000, se...: actual=${actual}`);
      expect(actual).assertEqual(1002);
      logInfo(`${BUNDLE}CountAfterSelection_0171 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0172
     * @tc.name      FilePreviewDLP_CountAfterSelection_0172
     * @tc.desc      countAfterSelection(currentCount=1000, selectedCount=10) returns 1003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0172 begin`);
      const actual: number = countAfterSelection(1000, 10);
      logInfo(`countAfterSelection(currentCount=1000, se...: actual=${actual}`);
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}CountAfterSelection_0172 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0173
     * @tc.name      FilePreviewDLP_CountAfterSelection_0173
     * @tc.desc      countAfterSelection(currentCount=1000, selectedCount=100) returns 1003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0173 begin`);
      const actual: number = countAfterSelection(1000, 100);
      logInfo(`countAfterSelection(currentCount=1000, se...: actual=${actual}`);
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}CountAfterSelection_0173 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0174
     * @tc.name      FilePreviewDLP_CountAfterSelection_0174
     * @tc.desc      countAfterSelection(currentCount=1000, selectedCount=-1) returns 1000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_CountAfterSelection_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0174 begin`);
      const actual: number = countAfterSelection(1000, -1);
      logInfo(`countAfterSelection(currentCount=1000, se...: actual=${actual}`);
      expect(actual).assertEqual(1000);
      logInfo(`${BUNDLE}CountAfterSelection_0174 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0175
     * @tc.name      FilePreviewDLP_CountAfterSelection_0175
     * @tc.desc      countAfterSelection(currentCount=1000, selectedCount=3) returns 1003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0175 begin`);
      const actual: number = countAfterSelection(1000, 3);
      logInfo(`countAfterSelection(currentCount=1000, se...: actual=${actual}`);
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}CountAfterSelection_0175 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0176
     * @tc.name      FilePreviewDLP_CountAfterSelection_0176
     * @tc.desc      countAfterSelection(currentCount=1000, selectedCount=15) returns 1003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0176 begin`);
      const actual: number = countAfterSelection(1000, 15);
      logInfo(`countAfterSelection(currentCount=1000, se...: actual=${actual}`);
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}CountAfterSelection_0176 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0177
     * @tc.name      FilePreviewDLP_CountAfterSelection_0177
     * @tc.desc      countAfterSelection(currentCount=1000, selectedCount=20) returns 1003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0177 begin`);
      const actual: number = countAfterSelection(1000, 20);
      logInfo(`countAfterSelection(currentCount=1000, se...: actual=${actual}`);
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}CountAfterSelection_0177 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0178
     * @tc.name      FilePreviewDLP_CountAfterSelection_0178
     * @tc.desc      countAfterSelection(currentCount=1000, selectedCount=25) returns 1003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0178 begin`);
      const actual: number = countAfterSelection(1000, 25);
      logInfo(`countAfterSelection(currentCount=1000, se...: actual=${actual}`);
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}CountAfterSelection_0178 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0179
     * @tc.name      FilePreviewDLP_CountAfterSelection_0179
     * @tc.desc      countAfterSelection(currentCount=1000, selectedCount=30) returns 1003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0179 begin`);
      const actual: number = countAfterSelection(1000, 30);
      logInfo(`countAfterSelection(currentCount=1000, se...: actual=${actual}`);
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}CountAfterSelection_0179 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0180
     * @tc.name      FilePreviewDLP_CountAfterSelection_0180
     * @tc.desc      countAfterSelection(currentCount=1000, selectedCount=35) returns 1003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0180 begin`);
      const actual: number = countAfterSelection(1000, 35);
      logInfo(`countAfterSelection(currentCount=1000, se...: actual=${actual}`);
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}CountAfterSelection_0180 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0181
     * @tc.name      FilePreviewDLP_CountAfterSelection_0181
     * @tc.desc      countAfterSelection(currentCount=1000, selectedCount=40) returns 1003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0181 begin`);
      const actual: number = countAfterSelection(1000, 40);
      logInfo(`countAfterSelection(currentCount=1000, se...: actual=${actual}`);
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}CountAfterSelection_0181 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0182
     * @tc.name      FilePreviewDLP_CountAfterSelection_0182
     * @tc.desc      countAfterSelection(currentCount=1000, selectedCount=45) returns 1003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0182 begin`);
      const actual: number = countAfterSelection(1000, 45);
      logInfo(`countAfterSelection(currentCount=1000, se...: actual=${actual}`);
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}CountAfterSelection_0182 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0183
     * @tc.name      FilePreviewDLP_CountAfterSelection_0183
     * @tc.desc      countAfterSelection(currentCount=1000, selectedCount=50) returns 1003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0183 begin`);
      const actual: number = countAfterSelection(1000, 50);
      logInfo(`countAfterSelection(currentCount=1000, se...: actual=${actual}`);
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}CountAfterSelection_0183 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0184
     * @tc.name      FilePreviewDLP_CountAfterSelection_0184
     * @tc.desc      countAfterSelection(currentCount=1000, selectedCount=55) returns 1003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0184 begin`);
      const actual: number = countAfterSelection(1000, 55);
      logInfo(`countAfterSelection(currentCount=1000, se...: actual=${actual}`);
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}CountAfterSelection_0184 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0185
     * @tc.name      FilePreviewDLP_CountAfterSelection_0185
     * @tc.desc      countAfterSelection(currentCount=1000, selectedCount=60) returns 1003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0185 begin`);
      const actual: number = countAfterSelection(1000, 60);
      logInfo(`countAfterSelection(currentCount=1000, se...: actual=${actual}`);
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}CountAfterSelection_0185 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0186
     * @tc.name      FilePreviewDLP_CountAfterSelection_0186
     * @tc.desc      countAfterSelection(currentCount=1000, selectedCount=65) returns 1003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0186 begin`);
      const actual: number = countAfterSelection(1000, 65);
      logInfo(`countAfterSelection(currentCount=1000, se...: actual=${actual}`);
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}CountAfterSelection_0186 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0187
     * @tc.name      FilePreviewDLP_CountAfterSelection_0187
     * @tc.desc      countAfterSelection(currentCount=1000, selectedCount=70) returns 1003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0187 begin`);
      const actual: number = countAfterSelection(1000, 70);
      logInfo(`countAfterSelection(currentCount=1000, se...: actual=${actual}`);
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}CountAfterSelection_0187 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0188
     * @tc.name      FilePreviewDLP_CountAfterSelection_0188
     * @tc.desc      countAfterSelection(currentCount=1000, selectedCount=75) returns 1003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0188 begin`);
      const actual: number = countAfterSelection(1000, 75);
      logInfo(`countAfterSelection(currentCount=1000, se...: actual=${actual}`);
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}CountAfterSelection_0188 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0189
     * @tc.name      FilePreviewDLP_CountAfterSelection_0189
     * @tc.desc      countAfterSelection(currentCount=1000, selectedCount=80) returns 1003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0189 begin`);
      const actual: number = countAfterSelection(1000, 80);
      logInfo(`countAfterSelection(currentCount=1000, se...: actual=${actual}`);
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}CountAfterSelection_0189 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0190
     * @tc.name      FilePreviewDLP_CountAfterSelection_0190
     * @tc.desc      countAfterSelection(currentCount=1000, selectedCount=85) returns 1003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0190 begin`);
      const actual: number = countAfterSelection(1000, 85);
      logInfo(`countAfterSelection(currentCount=1000, se...: actual=${actual}`);
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}CountAfterSelection_0190 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0191
     * @tc.name      FilePreviewDLP_CountAfterSelection_0191
     * @tc.desc      countAfterSelection(currentCount=1000, selectedCount=90) returns 1003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0191 begin`);
      const actual: number = countAfterSelection(1000, 90);
      logInfo(`countAfterSelection(currentCount=1000, se...: actual=${actual}`);
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}CountAfterSelection_0191 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0192
     * @tc.name      FilePreviewDLP_CountAfterSelection_0192
     * @tc.desc      countAfterSelection(currentCount=1000, selectedCount=95) returns 1003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0192 begin`);
      const actual: number = countAfterSelection(1000, 95);
      logInfo(`countAfterSelection(currentCount=1000, se...: actual=${actual}`);
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}CountAfterSelection_0192 end`);
    });
  });
}
