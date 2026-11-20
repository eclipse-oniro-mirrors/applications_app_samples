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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { thresholdOf } from '../model/TitleExpansionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandTitle]';
const BUNDLE: string = 'ExpandTitle_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for thresholdOf (51 cases). */
export default function thresholdOf3Test(): void {
  describe('ThresholdOf3Test', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0193
     * @tc.name      ExpandTitle_ThresholdOf_0193
     * @tc.desc      thresholdOf(normalTitleHeight=1080, expandTitleHeight=1248) returns 1164
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0193 begin`);
      const actual: number = thresholdOf(1080, 1248);
      logInfo(`thresholdOf(normalTitleHeight=1080, expan...: actual=${actual}`);
      expect(actual).assertEqual(1164);
      logInfo(`${BUNDLE}ThresholdOf_0193 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0194
     * @tc.name      ExpandTitle_ThresholdOf_0194
     * @tc.desc      thresholdOf(normalTitleHeight=1080, expandTitleHeight=1344) returns 1212
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0194 begin`);
      const actual: number = thresholdOf(1080, 1344);
      logInfo(`thresholdOf(normalTitleHeight=1080, expan...: actual=${actual}`);
      expect(actual).assertEqual(1212);
      logInfo(`${BUNDLE}ThresholdOf_0194 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0195
     * @tc.name      ExpandTitle_ThresholdOf_0195
     * @tc.desc      thresholdOf(normalTitleHeight=1080, expandTitleHeight=1440) returns 1260
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0195 begin`);
      const actual: number = thresholdOf(1080, 1440);
      logInfo(`thresholdOf(normalTitleHeight=1080, expan...: actual=${actual}`);
      expect(actual).assertEqual(1260);
      logInfo(`${BUNDLE}ThresholdOf_0195 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0196
     * @tc.name      ExpandTitle_ThresholdOf_0196
     * @tc.desc      thresholdOf(normalTitleHeight=1080, expandTitleHeight=1536) returns 1308
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0196 begin`);
      const actual: number = thresholdOf(1080, 1536);
      logInfo(`thresholdOf(normalTitleHeight=1080, expan...: actual=${actual}`);
      expect(actual).assertEqual(1308);
      logInfo(`${BUNDLE}ThresholdOf_0196 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0197
     * @tc.name      ExpandTitle_ThresholdOf_0197
     * @tc.desc      thresholdOf(normalTitleHeight=1080, expandTitleHeight=1632) returns 1356
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0197 begin`);
      const actual: number = thresholdOf(1080, 1632);
      logInfo(`thresholdOf(normalTitleHeight=1080, expan...: actual=${actual}`);
      expect(actual).assertEqual(1356);
      logInfo(`${BUNDLE}ThresholdOf_0197 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0198
     * @tc.name      ExpandTitle_ThresholdOf_0198
     * @tc.desc      thresholdOf(normalTitleHeight=1080, expandTitleHeight=1728) returns 1404
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0198 begin`);
      const actual: number = thresholdOf(1080, 1728);
      logInfo(`thresholdOf(normalTitleHeight=1080, expan...: actual=${actual}`);
      expect(actual).assertEqual(1404);
      logInfo(`${BUNDLE}ThresholdOf_0198 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0199
     * @tc.name      ExpandTitle_ThresholdOf_0199
     * @tc.desc      thresholdOf(normalTitleHeight=1080, expandTitleHeight=1824) returns 1452
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0199 begin`);
      const actual: number = thresholdOf(1080, 1824);
      logInfo(`thresholdOf(normalTitleHeight=1080, expan...: actual=${actual}`);
      expect(actual).assertEqual(1452);
      logInfo(`${BUNDLE}ThresholdOf_0199 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0200
     * @tc.name      ExpandTitle_ThresholdOf_0200
     * @tc.desc      thresholdOf(normalTitleHeight=1920, expandTitleHeight=1920) returns 1920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0200 begin`);
      const actual: number = thresholdOf(1920, 1920);
      logInfo(`thresholdOf(normalTitleHeight=1920, expan...: actual=${actual}`);
      expect(actual).assertEqual(1920);
      logInfo(`${BUNDLE}ThresholdOf_0200 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0201
     * @tc.name      ExpandTitle_ThresholdOf_0201
     * @tc.desc      thresholdOf(normalTitleHeight=1920, expandTitleHeight=-1) returns 959.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThresholdOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThresholdOf_0201 begin`);
      const actual: number = thresholdOf(1920, -1);
      logInfo(`thresholdOf(normalTitleHeight=1920, expan...: actual=${actual}`);
      expect(actual).assertClose(959.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0201 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0202
     * @tc.name      ExpandTitle_ThresholdOf_0202
     * @tc.desc      thresholdOf(normalTitleHeight=1920, expandTitleHeight=10) returns 965
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0202 begin`);
      const actual: number = thresholdOf(1920, 10);
      logInfo(`thresholdOf(normalTitleHeight=1920, expan...: actual=${actual}`);
      expect(actual).assertEqual(965);
      logInfo(`${BUNDLE}ThresholdOf_0202 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0203
     * @tc.name      ExpandTitle_ThresholdOf_0203
     * @tc.desc      thresholdOf(normalTitleHeight=1920, expandTitleHeight=96) returns 1008
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0203 begin`);
      const actual: number = thresholdOf(1920, 96);
      logInfo(`thresholdOf(normalTitleHeight=1920, expan...: actual=${actual}`);
      expect(actual).assertEqual(1008);
      logInfo(`${BUNDLE}ThresholdOf_0203 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0204
     * @tc.name      ExpandTitle_ThresholdOf_0204
     * @tc.desc      thresholdOf(normalTitleHeight=1920, expandTitleHeight=192) returns 1056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0204 begin`);
      const actual: number = thresholdOf(1920, 192);
      logInfo(`thresholdOf(normalTitleHeight=1920, expan...: actual=${actual}`);
      expect(actual).assertEqual(1056);
      logInfo(`${BUNDLE}ThresholdOf_0204 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0205
     * @tc.name      ExpandTitle_ThresholdOf_0205
     * @tc.desc      thresholdOf(normalTitleHeight=1920, expandTitleHeight=288) returns 1104
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0205 begin`);
      const actual: number = thresholdOf(1920, 288);
      logInfo(`thresholdOf(normalTitleHeight=1920, expan...: actual=${actual}`);
      expect(actual).assertEqual(1104);
      logInfo(`${BUNDLE}ThresholdOf_0205 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0206
     * @tc.name      ExpandTitle_ThresholdOf_0206
     * @tc.desc      thresholdOf(normalTitleHeight=1920, expandTitleHeight=384) returns 1152
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0206 begin`);
      const actual: number = thresholdOf(1920, 384);
      logInfo(`thresholdOf(normalTitleHeight=1920, expan...: actual=${actual}`);
      expect(actual).assertEqual(1152);
      logInfo(`${BUNDLE}ThresholdOf_0206 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0207
     * @tc.name      ExpandTitle_ThresholdOf_0207
     * @tc.desc      thresholdOf(normalTitleHeight=1920, expandTitleHeight=480) returns 1200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0207 begin`);
      const actual: number = thresholdOf(1920, 480);
      logInfo(`thresholdOf(normalTitleHeight=1920, expan...: actual=${actual}`);
      expect(actual).assertEqual(1200);
      logInfo(`${BUNDLE}ThresholdOf_0207 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0208
     * @tc.name      ExpandTitle_ThresholdOf_0208
     * @tc.desc      thresholdOf(normalTitleHeight=1920, expandTitleHeight=576) returns 1248
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0208 begin`);
      const actual: number = thresholdOf(1920, 576);
      logInfo(`thresholdOf(normalTitleHeight=1920, expan...: actual=${actual}`);
      expect(actual).assertEqual(1248);
      logInfo(`${BUNDLE}ThresholdOf_0208 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0209
     * @tc.name      ExpandTitle_ThresholdOf_0209
     * @tc.desc      thresholdOf(normalTitleHeight=1920, expandTitleHeight=672) returns 1296
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0209 begin`);
      const actual: number = thresholdOf(1920, 672);
      logInfo(`thresholdOf(normalTitleHeight=1920, expan...: actual=${actual}`);
      expect(actual).assertEqual(1296);
      logInfo(`${BUNDLE}ThresholdOf_0209 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0210
     * @tc.name      ExpandTitle_ThresholdOf_0210
     * @tc.desc      thresholdOf(normalTitleHeight=1920, expandTitleHeight=768) returns 1344
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0210 begin`);
      const actual: number = thresholdOf(1920, 768);
      logInfo(`thresholdOf(normalTitleHeight=1920, expan...: actual=${actual}`);
      expect(actual).assertEqual(1344);
      logInfo(`${BUNDLE}ThresholdOf_0210 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0211
     * @tc.name      ExpandTitle_ThresholdOf_0211
     * @tc.desc      thresholdOf(normalTitleHeight=1920, expandTitleHeight=864) returns 1392
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0211 begin`);
      const actual: number = thresholdOf(1920, 864);
      logInfo(`thresholdOf(normalTitleHeight=1920, expan...: actual=${actual}`);
      expect(actual).assertEqual(1392);
      logInfo(`${BUNDLE}ThresholdOf_0211 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0212
     * @tc.name      ExpandTitle_ThresholdOf_0212
     * @tc.desc      thresholdOf(normalTitleHeight=1920, expandTitleHeight=960) returns 1440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0212 begin`);
      const actual: number = thresholdOf(1920, 960);
      logInfo(`thresholdOf(normalTitleHeight=1920, expan...: actual=${actual}`);
      expect(actual).assertEqual(1440);
      logInfo(`${BUNDLE}ThresholdOf_0212 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0213
     * @tc.name      ExpandTitle_ThresholdOf_0213
     * @tc.desc      thresholdOf(normalTitleHeight=1920, expandTitleHeight=1056) returns 1488
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0213 begin`);
      const actual: number = thresholdOf(1920, 1056);
      logInfo(`thresholdOf(normalTitleHeight=1920, expan...: actual=${actual}`);
      expect(actual).assertEqual(1488);
      logInfo(`${BUNDLE}ThresholdOf_0213 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0214
     * @tc.name      ExpandTitle_ThresholdOf_0214
     * @tc.desc      thresholdOf(normalTitleHeight=1920, expandTitleHeight=1152) returns 1536
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0214 begin`);
      const actual: number = thresholdOf(1920, 1152);
      logInfo(`thresholdOf(normalTitleHeight=1920, expan...: actual=${actual}`);
      expect(actual).assertEqual(1536);
      logInfo(`${BUNDLE}ThresholdOf_0214 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0215
     * @tc.name      ExpandTitle_ThresholdOf_0215
     * @tc.desc      thresholdOf(normalTitleHeight=1920, expandTitleHeight=1248) returns 1584
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0215 begin`);
      const actual: number = thresholdOf(1920, 1248);
      logInfo(`thresholdOf(normalTitleHeight=1920, expan...: actual=${actual}`);
      expect(actual).assertEqual(1584);
      logInfo(`${BUNDLE}ThresholdOf_0215 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0216
     * @tc.name      ExpandTitle_ThresholdOf_0216
     * @tc.desc      thresholdOf(normalTitleHeight=1920, expandTitleHeight=1344) returns 1632
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0216 begin`);
      const actual: number = thresholdOf(1920, 1344);
      logInfo(`thresholdOf(normalTitleHeight=1920, expan...: actual=${actual}`);
      expect(actual).assertEqual(1632);
      logInfo(`${BUNDLE}ThresholdOf_0216 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0217
     * @tc.name      ExpandTitle_ThresholdOf_0217
     * @tc.desc      thresholdOf(normalTitleHeight=1920, expandTitleHeight=1440) returns 1680
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0217 begin`);
      const actual: number = thresholdOf(1920, 1440);
      logInfo(`thresholdOf(normalTitleHeight=1920, expan...: actual=${actual}`);
      expect(actual).assertEqual(1680);
      logInfo(`${BUNDLE}ThresholdOf_0217 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0218
     * @tc.name      ExpandTitle_ThresholdOf_0218
     * @tc.desc      thresholdOf(normalTitleHeight=1920, expandTitleHeight=1536) returns 1728
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0218 begin`);
      const actual: number = thresholdOf(1920, 1536);
      logInfo(`thresholdOf(normalTitleHeight=1920, expan...: actual=${actual}`);
      expect(actual).assertEqual(1728);
      logInfo(`${BUNDLE}ThresholdOf_0218 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0219
     * @tc.name      ExpandTitle_ThresholdOf_0219
     * @tc.desc      thresholdOf(normalTitleHeight=1920, expandTitleHeight=1632) returns 1776
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0219 begin`);
      const actual: number = thresholdOf(1920, 1632);
      logInfo(`thresholdOf(normalTitleHeight=1920, expan...: actual=${actual}`);
      expect(actual).assertEqual(1776);
      logInfo(`${BUNDLE}ThresholdOf_0219 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0220
     * @tc.name      ExpandTitle_ThresholdOf_0220
     * @tc.desc      thresholdOf(normalTitleHeight=1920, expandTitleHeight=1728) returns 1824
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0220 begin`);
      const actual: number = thresholdOf(1920, 1728);
      logInfo(`thresholdOf(normalTitleHeight=1920, expan...: actual=${actual}`);
      expect(actual).assertEqual(1824);
      logInfo(`${BUNDLE}ThresholdOf_0220 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0221
     * @tc.name      ExpandTitle_ThresholdOf_0221
     * @tc.desc      thresholdOf(normalTitleHeight=1920, expandTitleHeight=1824) returns 1872
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0221 begin`);
      const actual: number = thresholdOf(1920, 1824);
      logInfo(`thresholdOf(normalTitleHeight=1920, expan...: actual=${actual}`);
      expect(actual).assertEqual(1872);
      logInfo(`${BUNDLE}ThresholdOf_0221 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0222
     * @tc.name      ExpandTitle_ThresholdOf_0222
     * @tc.desc      thresholdOf(normalTitleHeight=-1, expandTitleHeight=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThresholdOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThresholdOf_0222 begin`);
      const actual: number = thresholdOf(-1, -1);
      logInfo(`thresholdOf(normalTitleHeight=-1, expandT...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ThresholdOf_0222 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0223
     * @tc.name      ExpandTitle_ThresholdOf_0223
     * @tc.desc      thresholdOf(normalTitleHeight=-1, expandTitleHeight=10) returns 4.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThresholdOf_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThresholdOf_0223 begin`);
      const actual: number = thresholdOf(-1, 10);
      logInfo(`thresholdOf(normalTitleHeight=-1, expandT...: actual=${actual}`);
      expect(actual).assertClose(4.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0223 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0224
     * @tc.name      ExpandTitle_ThresholdOf_0224
     * @tc.desc      thresholdOf(normalTitleHeight=-1, expandTitleHeight=96) returns 47.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThresholdOf_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThresholdOf_0224 begin`);
      const actual: number = thresholdOf(-1, 96);
      logInfo(`thresholdOf(normalTitleHeight=-1, expandT...: actual=${actual}`);
      expect(actual).assertClose(47.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0224 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0225
     * @tc.name      ExpandTitle_ThresholdOf_0225
     * @tc.desc      thresholdOf(normalTitleHeight=-1, expandTitleHeight=192) returns 95.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThresholdOf_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThresholdOf_0225 begin`);
      const actual: number = thresholdOf(-1, 192);
      logInfo(`thresholdOf(normalTitleHeight=-1, expandT...: actual=${actual}`);
      expect(actual).assertClose(95.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0225 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0226
     * @tc.name      ExpandTitle_ThresholdOf_0226
     * @tc.desc      thresholdOf(normalTitleHeight=-1, expandTitleHeight=288) returns 143.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThresholdOf_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThresholdOf_0226 begin`);
      const actual: number = thresholdOf(-1, 288);
      logInfo(`thresholdOf(normalTitleHeight=-1, expandT...: actual=${actual}`);
      expect(actual).assertClose(143.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0226 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0227
     * @tc.name      ExpandTitle_ThresholdOf_0227
     * @tc.desc      thresholdOf(normalTitleHeight=-1, expandTitleHeight=384) returns 191.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThresholdOf_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThresholdOf_0227 begin`);
      const actual: number = thresholdOf(-1, 384);
      logInfo(`thresholdOf(normalTitleHeight=-1, expandT...: actual=${actual}`);
      expect(actual).assertClose(191.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0227 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0228
     * @tc.name      ExpandTitle_ThresholdOf_0228
     * @tc.desc      thresholdOf(normalTitleHeight=-1, expandTitleHeight=480) returns 239.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThresholdOf_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThresholdOf_0228 begin`);
      const actual: number = thresholdOf(-1, 480);
      logInfo(`thresholdOf(normalTitleHeight=-1, expandT...: actual=${actual}`);
      expect(actual).assertClose(239.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0228 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0229
     * @tc.name      ExpandTitle_ThresholdOf_0229
     * @tc.desc      thresholdOf(normalTitleHeight=-1, expandTitleHeight=576) returns 287.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThresholdOf_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThresholdOf_0229 begin`);
      const actual: number = thresholdOf(-1, 576);
      logInfo(`thresholdOf(normalTitleHeight=-1, expandT...: actual=${actual}`);
      expect(actual).assertClose(287.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0229 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0230
     * @tc.name      ExpandTitle_ThresholdOf_0230
     * @tc.desc      thresholdOf(normalTitleHeight=-1, expandTitleHeight=672) returns 335.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThresholdOf_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThresholdOf_0230 begin`);
      const actual: number = thresholdOf(-1, 672);
      logInfo(`thresholdOf(normalTitleHeight=-1, expandT...: actual=${actual}`);
      expect(actual).assertClose(335.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0230 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0231
     * @tc.name      ExpandTitle_ThresholdOf_0231
     * @tc.desc      thresholdOf(normalTitleHeight=-1, expandTitleHeight=768) returns 383.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThresholdOf_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThresholdOf_0231 begin`);
      const actual: number = thresholdOf(-1, 768);
      logInfo(`thresholdOf(normalTitleHeight=-1, expandT...: actual=${actual}`);
      expect(actual).assertClose(383.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0231 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0232
     * @tc.name      ExpandTitle_ThresholdOf_0232
     * @tc.desc      thresholdOf(normalTitleHeight=-1, expandTitleHeight=864) returns 431.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThresholdOf_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThresholdOf_0232 begin`);
      const actual: number = thresholdOf(-1, 864);
      logInfo(`thresholdOf(normalTitleHeight=-1, expandT...: actual=${actual}`);
      expect(actual).assertClose(431.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0232 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0233
     * @tc.name      ExpandTitle_ThresholdOf_0233
     * @tc.desc      thresholdOf(normalTitleHeight=-1, expandTitleHeight=960) returns 479.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThresholdOf_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThresholdOf_0233 begin`);
      const actual: number = thresholdOf(-1, 960);
      logInfo(`thresholdOf(normalTitleHeight=-1, expandT...: actual=${actual}`);
      expect(actual).assertClose(479.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0233 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0234
     * @tc.name      ExpandTitle_ThresholdOf_0234
     * @tc.desc      thresholdOf(normalTitleHeight=-1, expandTitleHeight=1056) returns 527.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThresholdOf_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThresholdOf_0234 begin`);
      const actual: number = thresholdOf(-1, 1056);
      logInfo(`thresholdOf(normalTitleHeight=-1, expandT...: actual=${actual}`);
      expect(actual).assertClose(527.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0234 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0235
     * @tc.name      ExpandTitle_ThresholdOf_0235
     * @tc.desc      thresholdOf(normalTitleHeight=-1, expandTitleHeight=1152) returns 575.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThresholdOf_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThresholdOf_0235 begin`);
      const actual: number = thresholdOf(-1, 1152);
      logInfo(`thresholdOf(normalTitleHeight=-1, expandT...: actual=${actual}`);
      expect(actual).assertClose(575.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0235 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0236
     * @tc.name      ExpandTitle_ThresholdOf_0236
     * @tc.desc      thresholdOf(normalTitleHeight=-1, expandTitleHeight=1248) returns 623.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThresholdOf_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThresholdOf_0236 begin`);
      const actual: number = thresholdOf(-1, 1248);
      logInfo(`thresholdOf(normalTitleHeight=-1, expandT...: actual=${actual}`);
      expect(actual).assertClose(623.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0236 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0237
     * @tc.name      ExpandTitle_ThresholdOf_0237
     * @tc.desc      thresholdOf(normalTitleHeight=-1, expandTitleHeight=1344) returns 671.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThresholdOf_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThresholdOf_0237 begin`);
      const actual: number = thresholdOf(-1, 1344);
      logInfo(`thresholdOf(normalTitleHeight=-1, expandT...: actual=${actual}`);
      expect(actual).assertClose(671.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0237 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0238
     * @tc.name      ExpandTitle_ThresholdOf_0238
     * @tc.desc      thresholdOf(normalTitleHeight=-1, expandTitleHeight=1440) returns 719.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThresholdOf_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThresholdOf_0238 begin`);
      const actual: number = thresholdOf(-1, 1440);
      logInfo(`thresholdOf(normalTitleHeight=-1, expandT...: actual=${actual}`);
      expect(actual).assertClose(719.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0238 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0239
     * @tc.name      ExpandTitle_ThresholdOf_0239
     * @tc.desc      thresholdOf(normalTitleHeight=-1, expandTitleHeight=1536) returns 767.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThresholdOf_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThresholdOf_0239 begin`);
      const actual: number = thresholdOf(-1, 1536);
      logInfo(`thresholdOf(normalTitleHeight=-1, expandT...: actual=${actual}`);
      expect(actual).assertClose(767.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0239 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0240
     * @tc.name      ExpandTitle_ThresholdOf_0240
     * @tc.desc      thresholdOf(normalTitleHeight=-1, expandTitleHeight=1632) returns 815.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThresholdOf_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThresholdOf_0240 begin`);
      const actual: number = thresholdOf(-1, 1632);
      logInfo(`thresholdOf(normalTitleHeight=-1, expandT...: actual=${actual}`);
      expect(actual).assertClose(815.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0240 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0241
     * @tc.name      ExpandTitle_ThresholdOf_0241
     * @tc.desc      thresholdOf(normalTitleHeight=-1, expandTitleHeight=1728) returns 863.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThresholdOf_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThresholdOf_0241 begin`);
      const actual: number = thresholdOf(-1, 1728);
      logInfo(`thresholdOf(normalTitleHeight=-1, expandT...: actual=${actual}`);
      expect(actual).assertClose(863.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0241 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0242
     * @tc.name      ExpandTitle_ThresholdOf_0242
     * @tc.desc      thresholdOf(normalTitleHeight=-1, expandTitleHeight=1824) returns 911.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThresholdOf_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThresholdOf_0242 begin`);
      const actual: number = thresholdOf(-1, 1824);
      logInfo(`thresholdOf(normalTitleHeight=-1, expandT...: actual=${actual}`);
      expect(actual).assertClose(911.5, PRECISION);
      logInfo(`${BUNDLE}ThresholdOf_0242 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THRESHOLD_OF_0243
     * @tc.name      ExpandTitle_ThresholdOf_0243
     * @tc.desc      thresholdOf(normalTitleHeight=10, expandTitleHeight=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThresholdOf_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThresholdOf_0243 begin`);
      const actual: number = thresholdOf(10, 10);
      logInfo(`thresholdOf(normalTitleHeight=10, expandT...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ThresholdOf_0243 end`);
    });
  });
}
