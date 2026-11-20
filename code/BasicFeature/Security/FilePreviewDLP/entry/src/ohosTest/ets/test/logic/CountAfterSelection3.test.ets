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

/** Logic checks for countAfterSelection (75 cases). */
export default function countAfterSelection3Test(): void {
  describe('CountAfterSelection3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0193
     * @tc.name      FilePreviewDLP_CountAfterSelection_0193
     * @tc.desc      countAfterSelection(currentCount=1000, selectedCount=105) returns 1003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0193 begin`);
      const actual: number = countAfterSelection(1000, 105);
      logInfo(`countAfterSelection(currentCount=1000, se...: actual=${actual}`);
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}CountAfterSelection_0193 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0194
     * @tc.name      FilePreviewDLP_CountAfterSelection_0194
     * @tc.desc      countAfterSelection(currentCount=1000, selectedCount=110) returns 1003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0194 begin`);
      const actual: number = countAfterSelection(1000, 110);
      logInfo(`countAfterSelection(currentCount=1000, se...: actual=${actual}`);
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}CountAfterSelection_0194 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0195
     * @tc.name      FilePreviewDLP_CountAfterSelection_0195
     * @tc.desc      countAfterSelection(currentCount=1000, selectedCount=26) returns 1003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0195 begin`);
      const actual: number = countAfterSelection(1000, 26);
      logInfo(`countAfterSelection(currentCount=1000, se...: actual=${actual}`);
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}CountAfterSelection_0195 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0196
     * @tc.name      FilePreviewDLP_CountAfterSelection_0196
     * @tc.desc      countAfterSelection(currentCount=1000, selectedCount=-26) returns 1000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_CountAfterSelection_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0196 begin`);
      const actual: number = countAfterSelection(1000, -26);
      logInfo(`countAfterSelection(currentCount=1000, se...: actual=${actual}`);
      expect(actual).assertEqual(1000);
      logInfo(`${BUNDLE}CountAfterSelection_0196 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0197
     * @tc.name      FilePreviewDLP_CountAfterSelection_0197
     * @tc.desc      countAfterSelection(currentCount=1000, selectedCount=29.17) returns 1003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0197 begin`);
      const actual: number = countAfterSelection(1000, 29.17);
      logInfo(`countAfterSelection(currentCount=1000, se...: actual=${actual}`);
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}CountAfterSelection_0197 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0198
     * @tc.name      FilePreviewDLP_CountAfterSelection_0198
     * @tc.desc      countAfterSelection(currentCount=59999, selectedCount=10) returns 60002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0198 begin`);
      const actual: number = countAfterSelection(59999, 10);
      logInfo(`countAfterSelection(currentCount=59999, s...: actual=${actual}`);
      expect(actual).assertEqual(60002);
      logInfo(`${BUNDLE}CountAfterSelection_0198 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0199
     * @tc.name      FilePreviewDLP_CountAfterSelection_0199
     * @tc.desc      countAfterSelection(currentCount=59999, selectedCount=100) returns 60002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0199 begin`);
      const actual: number = countAfterSelection(59999, 100);
      logInfo(`countAfterSelection(currentCount=59999, s...: actual=${actual}`);
      expect(actual).assertEqual(60002);
      logInfo(`${BUNDLE}CountAfterSelection_0199 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0200
     * @tc.name      FilePreviewDLP_CountAfterSelection_0200
     * @tc.desc      countAfterSelection(currentCount=59999, selectedCount=-1) returns 59999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_CountAfterSelection_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0200 begin`);
      const actual: number = countAfterSelection(59999, -1);
      logInfo(`countAfterSelection(currentCount=59999, s...: actual=${actual}`);
      expect(actual).assertEqual(59999);
      logInfo(`${BUNDLE}CountAfterSelection_0200 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0201
     * @tc.name      FilePreviewDLP_CountAfterSelection_0201
     * @tc.desc      countAfterSelection(currentCount=59999, selectedCount=3) returns 60002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0201 begin`);
      const actual: number = countAfterSelection(59999, 3);
      logInfo(`countAfterSelection(currentCount=59999, s...: actual=${actual}`);
      expect(actual).assertEqual(60002);
      logInfo(`${BUNDLE}CountAfterSelection_0201 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0202
     * @tc.name      FilePreviewDLP_CountAfterSelection_0202
     * @tc.desc      countAfterSelection(currentCount=59999, selectedCount=15) returns 60002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0202 begin`);
      const actual: number = countAfterSelection(59999, 15);
      logInfo(`countAfterSelection(currentCount=59999, s...: actual=${actual}`);
      expect(actual).assertEqual(60002);
      logInfo(`${BUNDLE}CountAfterSelection_0202 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0203
     * @tc.name      FilePreviewDLP_CountAfterSelection_0203
     * @tc.desc      countAfterSelection(currentCount=59999, selectedCount=20) returns 60002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0203 begin`);
      const actual: number = countAfterSelection(59999, 20);
      logInfo(`countAfterSelection(currentCount=59999, s...: actual=${actual}`);
      expect(actual).assertEqual(60002);
      logInfo(`${BUNDLE}CountAfterSelection_0203 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0204
     * @tc.name      FilePreviewDLP_CountAfterSelection_0204
     * @tc.desc      countAfterSelection(currentCount=59999, selectedCount=25) returns 60002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0204 begin`);
      const actual: number = countAfterSelection(59999, 25);
      logInfo(`countAfterSelection(currentCount=59999, s...: actual=${actual}`);
      expect(actual).assertEqual(60002);
      logInfo(`${BUNDLE}CountAfterSelection_0204 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0205
     * @tc.name      FilePreviewDLP_CountAfterSelection_0205
     * @tc.desc      countAfterSelection(currentCount=59999, selectedCount=30) returns 60002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0205 begin`);
      const actual: number = countAfterSelection(59999, 30);
      logInfo(`countAfterSelection(currentCount=59999, s...: actual=${actual}`);
      expect(actual).assertEqual(60002);
      logInfo(`${BUNDLE}CountAfterSelection_0205 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0206
     * @tc.name      FilePreviewDLP_CountAfterSelection_0206
     * @tc.desc      countAfterSelection(currentCount=59999, selectedCount=35) returns 60002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0206 begin`);
      const actual: number = countAfterSelection(59999, 35);
      logInfo(`countAfterSelection(currentCount=59999, s...: actual=${actual}`);
      expect(actual).assertEqual(60002);
      logInfo(`${BUNDLE}CountAfterSelection_0206 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0207
     * @tc.name      FilePreviewDLP_CountAfterSelection_0207
     * @tc.desc      countAfterSelection(currentCount=59999, selectedCount=40) returns 60002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0207 begin`);
      const actual: number = countAfterSelection(59999, 40);
      logInfo(`countAfterSelection(currentCount=59999, s...: actual=${actual}`);
      expect(actual).assertEqual(60002);
      logInfo(`${BUNDLE}CountAfterSelection_0207 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0208
     * @tc.name      FilePreviewDLP_CountAfterSelection_0208
     * @tc.desc      countAfterSelection(currentCount=59999, selectedCount=45) returns 60002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0208 begin`);
      const actual: number = countAfterSelection(59999, 45);
      logInfo(`countAfterSelection(currentCount=59999, s...: actual=${actual}`);
      expect(actual).assertEqual(60002);
      logInfo(`${BUNDLE}CountAfterSelection_0208 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0209
     * @tc.name      FilePreviewDLP_CountAfterSelection_0209
     * @tc.desc      countAfterSelection(currentCount=59999, selectedCount=50) returns 60002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0209 begin`);
      const actual: number = countAfterSelection(59999, 50);
      logInfo(`countAfterSelection(currentCount=59999, s...: actual=${actual}`);
      expect(actual).assertEqual(60002);
      logInfo(`${BUNDLE}CountAfterSelection_0209 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0210
     * @tc.name      FilePreviewDLP_CountAfterSelection_0210
     * @tc.desc      countAfterSelection(currentCount=59999, selectedCount=55) returns 60002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0210 begin`);
      const actual: number = countAfterSelection(59999, 55);
      logInfo(`countAfterSelection(currentCount=59999, s...: actual=${actual}`);
      expect(actual).assertEqual(60002);
      logInfo(`${BUNDLE}CountAfterSelection_0210 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0211
     * @tc.name      FilePreviewDLP_CountAfterSelection_0211
     * @tc.desc      countAfterSelection(currentCount=59999, selectedCount=60) returns 60002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0211 begin`);
      const actual: number = countAfterSelection(59999, 60);
      logInfo(`countAfterSelection(currentCount=59999, s...: actual=${actual}`);
      expect(actual).assertEqual(60002);
      logInfo(`${BUNDLE}CountAfterSelection_0211 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0212
     * @tc.name      FilePreviewDLP_CountAfterSelection_0212
     * @tc.desc      countAfterSelection(currentCount=59999, selectedCount=65) returns 60002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0212 begin`);
      const actual: number = countAfterSelection(59999, 65);
      logInfo(`countAfterSelection(currentCount=59999, s...: actual=${actual}`);
      expect(actual).assertEqual(60002);
      logInfo(`${BUNDLE}CountAfterSelection_0212 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0213
     * @tc.name      FilePreviewDLP_CountAfterSelection_0213
     * @tc.desc      countAfterSelection(currentCount=59999, selectedCount=70) returns 60002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0213 begin`);
      const actual: number = countAfterSelection(59999, 70);
      logInfo(`countAfterSelection(currentCount=59999, s...: actual=${actual}`);
      expect(actual).assertEqual(60002);
      logInfo(`${BUNDLE}CountAfterSelection_0213 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0214
     * @tc.name      FilePreviewDLP_CountAfterSelection_0214
     * @tc.desc      countAfterSelection(currentCount=59999, selectedCount=75) returns 60002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0214 begin`);
      const actual: number = countAfterSelection(59999, 75);
      logInfo(`countAfterSelection(currentCount=59999, s...: actual=${actual}`);
      expect(actual).assertEqual(60002);
      logInfo(`${BUNDLE}CountAfterSelection_0214 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0215
     * @tc.name      FilePreviewDLP_CountAfterSelection_0215
     * @tc.desc      countAfterSelection(currentCount=59999, selectedCount=80) returns 60002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0215 begin`);
      const actual: number = countAfterSelection(59999, 80);
      logInfo(`countAfterSelection(currentCount=59999, s...: actual=${actual}`);
      expect(actual).assertEqual(60002);
      logInfo(`${BUNDLE}CountAfterSelection_0215 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0216
     * @tc.name      FilePreviewDLP_CountAfterSelection_0216
     * @tc.desc      countAfterSelection(currentCount=59999, selectedCount=85) returns 60002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0216 begin`);
      const actual: number = countAfterSelection(59999, 85);
      logInfo(`countAfterSelection(currentCount=59999, s...: actual=${actual}`);
      expect(actual).assertEqual(60002);
      logInfo(`${BUNDLE}CountAfterSelection_0216 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0217
     * @tc.name      FilePreviewDLP_CountAfterSelection_0217
     * @tc.desc      countAfterSelection(currentCount=59999, selectedCount=90) returns 60002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0217 begin`);
      const actual: number = countAfterSelection(59999, 90);
      logInfo(`countAfterSelection(currentCount=59999, s...: actual=${actual}`);
      expect(actual).assertEqual(60002);
      logInfo(`${BUNDLE}CountAfterSelection_0217 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0218
     * @tc.name      FilePreviewDLP_CountAfterSelection_0218
     * @tc.desc      countAfterSelection(currentCount=59999, selectedCount=95) returns 60002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0218 begin`);
      const actual: number = countAfterSelection(59999, 95);
      logInfo(`countAfterSelection(currentCount=59999, s...: actual=${actual}`);
      expect(actual).assertEqual(60002);
      logInfo(`${BUNDLE}CountAfterSelection_0218 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0219
     * @tc.name      FilePreviewDLP_CountAfterSelection_0219
     * @tc.desc      countAfterSelection(currentCount=59999, selectedCount=105) returns 60002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0219 begin`);
      const actual: number = countAfterSelection(59999, 105);
      logInfo(`countAfterSelection(currentCount=59999, s...: actual=${actual}`);
      expect(actual).assertEqual(60002);
      logInfo(`${BUNDLE}CountAfterSelection_0219 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0220
     * @tc.name      FilePreviewDLP_CountAfterSelection_0220
     * @tc.desc      countAfterSelection(currentCount=59999, selectedCount=110) returns 60002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0220 begin`);
      const actual: number = countAfterSelection(59999, 110);
      logInfo(`countAfterSelection(currentCount=59999, s...: actual=${actual}`);
      expect(actual).assertEqual(60002);
      logInfo(`${BUNDLE}CountAfterSelection_0220 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0221
     * @tc.name      FilePreviewDLP_CountAfterSelection_0221
     * @tc.desc      countAfterSelection(currentCount=59999, selectedCount=26) returns 60002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0221 begin`);
      const actual: number = countAfterSelection(59999, 26);
      logInfo(`countAfterSelection(currentCount=59999, s...: actual=${actual}`);
      expect(actual).assertEqual(60002);
      logInfo(`${BUNDLE}CountAfterSelection_0221 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0222
     * @tc.name      FilePreviewDLP_CountAfterSelection_0222
     * @tc.desc      countAfterSelection(currentCount=59999, selectedCount=-26) returns 59999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_CountAfterSelection_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0222 begin`);
      const actual: number = countAfterSelection(59999, -26);
      logInfo(`countAfterSelection(currentCount=59999, s...: actual=${actual}`);
      expect(actual).assertEqual(59999);
      logInfo(`${BUNDLE}CountAfterSelection_0222 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0223
     * @tc.name      FilePreviewDLP_CountAfterSelection_0223
     * @tc.desc      countAfterSelection(currentCount=59999, selectedCount=29.17) returns 60002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0223 begin`);
      const actual: number = countAfterSelection(59999, 29.17);
      logInfo(`countAfterSelection(currentCount=59999, s...: actual=${actual}`);
      expect(actual).assertEqual(60002);
      logInfo(`${BUNDLE}CountAfterSelection_0223 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0224
     * @tc.name      FilePreviewDLP_CountAfterSelection_0224
     * @tc.desc      countAfterSelection(currentCount=60000, selectedCount=0) returns 60000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0224 begin`);
      const actual: number = countAfterSelection(60000, 0);
      logInfo(`countAfterSelection(currentCount=60000, s...: actual=${actual}`);
      expect(actual).assertEqual(60000);
      logInfo(`${BUNDLE}CountAfterSelection_0224 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0225
     * @tc.name      FilePreviewDLP_CountAfterSelection_0225
     * @tc.desc      countAfterSelection(currentCount=60000, selectedCount=1) returns 60001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0225 begin`);
      const actual: number = countAfterSelection(60000, 1);
      logInfo(`countAfterSelection(currentCount=60000, s...: actual=${actual}`);
      expect(actual).assertEqual(60001);
      logInfo(`${BUNDLE}CountAfterSelection_0225 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0226
     * @tc.name      FilePreviewDLP_CountAfterSelection_0226
     * @tc.desc      countAfterSelection(currentCount=60000, selectedCount=2) returns 60002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0226 begin`);
      const actual: number = countAfterSelection(60000, 2);
      logInfo(`countAfterSelection(currentCount=60000, s...: actual=${actual}`);
      expect(actual).assertEqual(60002);
      logInfo(`${BUNDLE}CountAfterSelection_0226 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0227
     * @tc.name      FilePreviewDLP_CountAfterSelection_0227
     * @tc.desc      countAfterSelection(currentCount=60000, selectedCount=10) returns 60003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0227 begin`);
      const actual: number = countAfterSelection(60000, 10);
      logInfo(`countAfterSelection(currentCount=60000, s...: actual=${actual}`);
      expect(actual).assertEqual(60003);
      logInfo(`${BUNDLE}CountAfterSelection_0227 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0228
     * @tc.name      FilePreviewDLP_CountAfterSelection_0228
     * @tc.desc      countAfterSelection(currentCount=60000, selectedCount=100) returns 60003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0228 begin`);
      const actual: number = countAfterSelection(60000, 100);
      logInfo(`countAfterSelection(currentCount=60000, s...: actual=${actual}`);
      expect(actual).assertEqual(60003);
      logInfo(`${BUNDLE}CountAfterSelection_0228 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0229
     * @tc.name      FilePreviewDLP_CountAfterSelection_0229
     * @tc.desc      countAfterSelection(currentCount=60000, selectedCount=-1) returns 60000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_CountAfterSelection_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0229 begin`);
      const actual: number = countAfterSelection(60000, -1);
      logInfo(`countAfterSelection(currentCount=60000, s...: actual=${actual}`);
      expect(actual).assertEqual(60000);
      logInfo(`${BUNDLE}CountAfterSelection_0229 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0230
     * @tc.name      FilePreviewDLP_CountAfterSelection_0230
     * @tc.desc      countAfterSelection(currentCount=60000, selectedCount=3) returns 60003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0230 begin`);
      const actual: number = countAfterSelection(60000, 3);
      logInfo(`countAfterSelection(currentCount=60000, s...: actual=${actual}`);
      expect(actual).assertEqual(60003);
      logInfo(`${BUNDLE}CountAfterSelection_0230 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0231
     * @tc.name      FilePreviewDLP_CountAfterSelection_0231
     * @tc.desc      countAfterSelection(currentCount=60000, selectedCount=15) returns 60003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0231 begin`);
      const actual: number = countAfterSelection(60000, 15);
      logInfo(`countAfterSelection(currentCount=60000, s...: actual=${actual}`);
      expect(actual).assertEqual(60003);
      logInfo(`${BUNDLE}CountAfterSelection_0231 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0232
     * @tc.name      FilePreviewDLP_CountAfterSelection_0232
     * @tc.desc      countAfterSelection(currentCount=60000, selectedCount=20) returns 60003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0232 begin`);
      const actual: number = countAfterSelection(60000, 20);
      logInfo(`countAfterSelection(currentCount=60000, s...: actual=${actual}`);
      expect(actual).assertEqual(60003);
      logInfo(`${BUNDLE}CountAfterSelection_0232 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0233
     * @tc.name      FilePreviewDLP_CountAfterSelection_0233
     * @tc.desc      countAfterSelection(currentCount=60000, selectedCount=25) returns 60003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0233 begin`);
      const actual: number = countAfterSelection(60000, 25);
      logInfo(`countAfterSelection(currentCount=60000, s...: actual=${actual}`);
      expect(actual).assertEqual(60003);
      logInfo(`${BUNDLE}CountAfterSelection_0233 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0234
     * @tc.name      FilePreviewDLP_CountAfterSelection_0234
     * @tc.desc      countAfterSelection(currentCount=60000, selectedCount=30) returns 60003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0234 begin`);
      const actual: number = countAfterSelection(60000, 30);
      logInfo(`countAfterSelection(currentCount=60000, s...: actual=${actual}`);
      expect(actual).assertEqual(60003);
      logInfo(`${BUNDLE}CountAfterSelection_0234 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0235
     * @tc.name      FilePreviewDLP_CountAfterSelection_0235
     * @tc.desc      countAfterSelection(currentCount=60000, selectedCount=35) returns 60003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0235 begin`);
      const actual: number = countAfterSelection(60000, 35);
      logInfo(`countAfterSelection(currentCount=60000, s...: actual=${actual}`);
      expect(actual).assertEqual(60003);
      logInfo(`${BUNDLE}CountAfterSelection_0235 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0236
     * @tc.name      FilePreviewDLP_CountAfterSelection_0236
     * @tc.desc      countAfterSelection(currentCount=60000, selectedCount=40) returns 60003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0236 begin`);
      const actual: number = countAfterSelection(60000, 40);
      logInfo(`countAfterSelection(currentCount=60000, s...: actual=${actual}`);
      expect(actual).assertEqual(60003);
      logInfo(`${BUNDLE}CountAfterSelection_0236 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0237
     * @tc.name      FilePreviewDLP_CountAfterSelection_0237
     * @tc.desc      countAfterSelection(currentCount=60000, selectedCount=45) returns 60003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0237 begin`);
      const actual: number = countAfterSelection(60000, 45);
      logInfo(`countAfterSelection(currentCount=60000, s...: actual=${actual}`);
      expect(actual).assertEqual(60003);
      logInfo(`${BUNDLE}CountAfterSelection_0237 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0238
     * @tc.name      FilePreviewDLP_CountAfterSelection_0238
     * @tc.desc      countAfterSelection(currentCount=60000, selectedCount=50) returns 60003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0238 begin`);
      const actual: number = countAfterSelection(60000, 50);
      logInfo(`countAfterSelection(currentCount=60000, s...: actual=${actual}`);
      expect(actual).assertEqual(60003);
      logInfo(`${BUNDLE}CountAfterSelection_0238 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0239
     * @tc.name      FilePreviewDLP_CountAfterSelection_0239
     * @tc.desc      countAfterSelection(currentCount=60000, selectedCount=55) returns 60003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0239 begin`);
      const actual: number = countAfterSelection(60000, 55);
      logInfo(`countAfterSelection(currentCount=60000, s...: actual=${actual}`);
      expect(actual).assertEqual(60003);
      logInfo(`${BUNDLE}CountAfterSelection_0239 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0240
     * @tc.name      FilePreviewDLP_CountAfterSelection_0240
     * @tc.desc      countAfterSelection(currentCount=60000, selectedCount=60) returns 60003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0240 begin`);
      const actual: number = countAfterSelection(60000, 60);
      logInfo(`countAfterSelection(currentCount=60000, s...: actual=${actual}`);
      expect(actual).assertEqual(60003);
      logInfo(`${BUNDLE}CountAfterSelection_0240 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0241
     * @tc.name      FilePreviewDLP_CountAfterSelection_0241
     * @tc.desc      countAfterSelection(currentCount=60000, selectedCount=65) returns 60003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0241 begin`);
      const actual: number = countAfterSelection(60000, 65);
      logInfo(`countAfterSelection(currentCount=60000, s...: actual=${actual}`);
      expect(actual).assertEqual(60003);
      logInfo(`${BUNDLE}CountAfterSelection_0241 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0242
     * @tc.name      FilePreviewDLP_CountAfterSelection_0242
     * @tc.desc      countAfterSelection(currentCount=60000, selectedCount=70) returns 60003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0242 begin`);
      const actual: number = countAfterSelection(60000, 70);
      logInfo(`countAfterSelection(currentCount=60000, s...: actual=${actual}`);
      expect(actual).assertEqual(60003);
      logInfo(`${BUNDLE}CountAfterSelection_0242 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0243
     * @tc.name      FilePreviewDLP_CountAfterSelection_0243
     * @tc.desc      countAfterSelection(currentCount=60000, selectedCount=75) returns 60003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0243 begin`);
      const actual: number = countAfterSelection(60000, 75);
      logInfo(`countAfterSelection(currentCount=60000, s...: actual=${actual}`);
      expect(actual).assertEqual(60003);
      logInfo(`${BUNDLE}CountAfterSelection_0243 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0244
     * @tc.name      FilePreviewDLP_CountAfterSelection_0244
     * @tc.desc      countAfterSelection(currentCount=60000, selectedCount=80) returns 60003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0244 begin`);
      const actual: number = countAfterSelection(60000, 80);
      logInfo(`countAfterSelection(currentCount=60000, s...: actual=${actual}`);
      expect(actual).assertEqual(60003);
      logInfo(`${BUNDLE}CountAfterSelection_0244 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0245
     * @tc.name      FilePreviewDLP_CountAfterSelection_0245
     * @tc.desc      countAfterSelection(currentCount=60000, selectedCount=85) returns 60003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0245 begin`);
      const actual: number = countAfterSelection(60000, 85);
      logInfo(`countAfterSelection(currentCount=60000, s...: actual=${actual}`);
      expect(actual).assertEqual(60003);
      logInfo(`${BUNDLE}CountAfterSelection_0245 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0246
     * @tc.name      FilePreviewDLP_CountAfterSelection_0246
     * @tc.desc      countAfterSelection(currentCount=60000, selectedCount=90) returns 60003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0246 begin`);
      const actual: number = countAfterSelection(60000, 90);
      logInfo(`countAfterSelection(currentCount=60000, s...: actual=${actual}`);
      expect(actual).assertEqual(60003);
      logInfo(`${BUNDLE}CountAfterSelection_0246 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0247
     * @tc.name      FilePreviewDLP_CountAfterSelection_0247
     * @tc.desc      countAfterSelection(currentCount=60000, selectedCount=95) returns 60003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0247 begin`);
      const actual: number = countAfterSelection(60000, 95);
      logInfo(`countAfterSelection(currentCount=60000, s...: actual=${actual}`);
      expect(actual).assertEqual(60003);
      logInfo(`${BUNDLE}CountAfterSelection_0247 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0248
     * @tc.name      FilePreviewDLP_CountAfterSelection_0248
     * @tc.desc      countAfterSelection(currentCount=60000, selectedCount=105) returns 60003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0248 begin`);
      const actual: number = countAfterSelection(60000, 105);
      logInfo(`countAfterSelection(currentCount=60000, s...: actual=${actual}`);
      expect(actual).assertEqual(60003);
      logInfo(`${BUNDLE}CountAfterSelection_0248 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0249
     * @tc.name      FilePreviewDLP_CountAfterSelection_0249
     * @tc.desc      countAfterSelection(currentCount=60000, selectedCount=110) returns 60003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0249 begin`);
      const actual: number = countAfterSelection(60000, 110);
      logInfo(`countAfterSelection(currentCount=60000, s...: actual=${actual}`);
      expect(actual).assertEqual(60003);
      logInfo(`${BUNDLE}CountAfterSelection_0249 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0250
     * @tc.name      FilePreviewDLP_CountAfterSelection_0250
     * @tc.desc      countAfterSelection(currentCount=60000, selectedCount=26) returns 60003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0250 begin`);
      const actual: number = countAfterSelection(60000, 26);
      logInfo(`countAfterSelection(currentCount=60000, s...: actual=${actual}`);
      expect(actual).assertEqual(60003);
      logInfo(`${BUNDLE}CountAfterSelection_0250 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0251
     * @tc.name      FilePreviewDLP_CountAfterSelection_0251
     * @tc.desc      countAfterSelection(currentCount=60000, selectedCount=-26) returns 60000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_CountAfterSelection_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0251 begin`);
      const actual: number = countAfterSelection(60000, -26);
      logInfo(`countAfterSelection(currentCount=60000, s...: actual=${actual}`);
      expect(actual).assertEqual(60000);
      logInfo(`${BUNDLE}CountAfterSelection_0251 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0252
     * @tc.name      FilePreviewDLP_CountAfterSelection_0252
     * @tc.desc      countAfterSelection(currentCount=60000, selectedCount=29.17) returns 60003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0252 begin`);
      const actual: number = countAfterSelection(60000, 29.17);
      logInfo(`countAfterSelection(currentCount=60000, s...: actual=${actual}`);
      expect(actual).assertEqual(60003);
      logInfo(`${BUNDLE}CountAfterSelection_0252 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0253
     * @tc.name      FilePreviewDLP_CountAfterSelection_0253
     * @tc.desc      countAfterSelection(currentCount=61000, selectedCount=10) returns 61003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0253 begin`);
      const actual: number = countAfterSelection(61000, 10);
      logInfo(`countAfterSelection(currentCount=61000, s...: actual=${actual}`);
      expect(actual).assertEqual(61003);
      logInfo(`${BUNDLE}CountAfterSelection_0253 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0254
     * @tc.name      FilePreviewDLP_CountAfterSelection_0254
     * @tc.desc      countAfterSelection(currentCount=61000, selectedCount=100) returns 61003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0254 begin`);
      const actual: number = countAfterSelection(61000, 100);
      logInfo(`countAfterSelection(currentCount=61000, s...: actual=${actual}`);
      expect(actual).assertEqual(61003);
      logInfo(`${BUNDLE}CountAfterSelection_0254 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0255
     * @tc.name      FilePreviewDLP_CountAfterSelection_0255
     * @tc.desc      countAfterSelection(currentCount=61000, selectedCount=-1) returns 61000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_CountAfterSelection_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0255 begin`);
      const actual: number = countAfterSelection(61000, -1);
      logInfo(`countAfterSelection(currentCount=61000, s...: actual=${actual}`);
      expect(actual).assertEqual(61000);
      logInfo(`${BUNDLE}CountAfterSelection_0255 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0256
     * @tc.name      FilePreviewDLP_CountAfterSelection_0256
     * @tc.desc      countAfterSelection(currentCount=61000, selectedCount=3) returns 61003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0256 begin`);
      const actual: number = countAfterSelection(61000, 3);
      logInfo(`countAfterSelection(currentCount=61000, s...: actual=${actual}`);
      expect(actual).assertEqual(61003);
      logInfo(`${BUNDLE}CountAfterSelection_0256 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0257
     * @tc.name      FilePreviewDLP_CountAfterSelection_0257
     * @tc.desc      countAfterSelection(currentCount=61000, selectedCount=15) returns 61003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0257 begin`);
      const actual: number = countAfterSelection(61000, 15);
      logInfo(`countAfterSelection(currentCount=61000, s...: actual=${actual}`);
      expect(actual).assertEqual(61003);
      logInfo(`${BUNDLE}CountAfterSelection_0257 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0258
     * @tc.name      FilePreviewDLP_CountAfterSelection_0258
     * @tc.desc      countAfterSelection(currentCount=61000, selectedCount=20) returns 61003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0258 begin`);
      const actual: number = countAfterSelection(61000, 20);
      logInfo(`countAfterSelection(currentCount=61000, s...: actual=${actual}`);
      expect(actual).assertEqual(61003);
      logInfo(`${BUNDLE}CountAfterSelection_0258 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0259
     * @tc.name      FilePreviewDLP_CountAfterSelection_0259
     * @tc.desc      countAfterSelection(currentCount=61000, selectedCount=25) returns 61003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0259 begin`);
      const actual: number = countAfterSelection(61000, 25);
      logInfo(`countAfterSelection(currentCount=61000, s...: actual=${actual}`);
      expect(actual).assertEqual(61003);
      logInfo(`${BUNDLE}CountAfterSelection_0259 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0260
     * @tc.name      FilePreviewDLP_CountAfterSelection_0260
     * @tc.desc      countAfterSelection(currentCount=61000, selectedCount=30) returns 61003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0260 begin`);
      const actual: number = countAfterSelection(61000, 30);
      logInfo(`countAfterSelection(currentCount=61000, s...: actual=${actual}`);
      expect(actual).assertEqual(61003);
      logInfo(`${BUNDLE}CountAfterSelection_0260 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0261
     * @tc.name      FilePreviewDLP_CountAfterSelection_0261
     * @tc.desc      countAfterSelection(currentCount=61000, selectedCount=35) returns 61003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0261 begin`);
      const actual: number = countAfterSelection(61000, 35);
      logInfo(`countAfterSelection(currentCount=61000, s...: actual=${actual}`);
      expect(actual).assertEqual(61003);
      logInfo(`${BUNDLE}CountAfterSelection_0261 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0262
     * @tc.name      FilePreviewDLP_CountAfterSelection_0262
     * @tc.desc      countAfterSelection(currentCount=61000, selectedCount=40) returns 61003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0262 begin`);
      const actual: number = countAfterSelection(61000, 40);
      logInfo(`countAfterSelection(currentCount=61000, s...: actual=${actual}`);
      expect(actual).assertEqual(61003);
      logInfo(`${BUNDLE}CountAfterSelection_0262 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0263
     * @tc.name      FilePreviewDLP_CountAfterSelection_0263
     * @tc.desc      countAfterSelection(currentCount=61000, selectedCount=45) returns 61003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0263 begin`);
      const actual: number = countAfterSelection(61000, 45);
      logInfo(`countAfterSelection(currentCount=61000, s...: actual=${actual}`);
      expect(actual).assertEqual(61003);
      logInfo(`${BUNDLE}CountAfterSelection_0263 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0264
     * @tc.name      FilePreviewDLP_CountAfterSelection_0264
     * @tc.desc      countAfterSelection(currentCount=61000, selectedCount=50) returns 61003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0264 begin`);
      const actual: number = countAfterSelection(61000, 50);
      logInfo(`countAfterSelection(currentCount=61000, s...: actual=${actual}`);
      expect(actual).assertEqual(61003);
      logInfo(`${BUNDLE}CountAfterSelection_0264 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0265
     * @tc.name      FilePreviewDLP_CountAfterSelection_0265
     * @tc.desc      countAfterSelection(currentCount=61000, selectedCount=55) returns 61003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0265 begin`);
      const actual: number = countAfterSelection(61000, 55);
      logInfo(`countAfterSelection(currentCount=61000, s...: actual=${actual}`);
      expect(actual).assertEqual(61003);
      logInfo(`${BUNDLE}CountAfterSelection_0265 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0266
     * @tc.name      FilePreviewDLP_CountAfterSelection_0266
     * @tc.desc      countAfterSelection(currentCount=61000, selectedCount=60) returns 61003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0266 begin`);
      const actual: number = countAfterSelection(61000, 60);
      logInfo(`countAfterSelection(currentCount=61000, s...: actual=${actual}`);
      expect(actual).assertEqual(61003);
      logInfo(`${BUNDLE}CountAfterSelection_0266 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0267
     * @tc.name      FilePreviewDLP_CountAfterSelection_0267
     * @tc.desc      countAfterSelection(currentCount=61000, selectedCount=65) returns 61003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0267 begin`);
      const actual: number = countAfterSelection(61000, 65);
      logInfo(`countAfterSelection(currentCount=61000, s...: actual=${actual}`);
      expect(actual).assertEqual(61003);
      logInfo(`${BUNDLE}CountAfterSelection_0267 end`);
    });
  });
}
