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
import { heightChangeOf } from '../model/TitleExpansionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandTitle]';
const BUNDLE: string = 'ExpandTitle_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for heightChangeOf (50 cases). */
export default function heightChangeOf3Test(): void {
  describe('HeightChangeOf3Test', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0193
     * @tc.name      ExpandTitle_HeightChangeOf_0193
     * @tc.desc      heightChangeOf(offset=100, heightValue=1920, normalTitleHeight=1, expandTitleHeight=100) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0193 begin`);
      const actual: number = heightChangeOf(100, 1920, 1, 100);
      logInfo(`heightChangeOf(offset=100, heightValue=19...: actual=${actual}`);
      expect(actual).assertEqual(-1820);
      logInfo(`${BUNDLE}HeightChangeOf_0193 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0194
     * @tc.name      ExpandTitle_HeightChangeOf_0194
     * @tc.desc      heightChangeOf(offset=100, heightValue=1920, normalTitleHeight=0, expandTitleHeight=1) returns -...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0194 begin`);
      const actual: number = heightChangeOf(100, 1920, 0, 1);
      logInfo(`heightChangeOf(offset=100, heightValue=19...: actual=${actual}`);
      expect(actual).assertEqual(-1919);
      logInfo(`${BUNDLE}HeightChangeOf_0194 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0195
     * @tc.name      ExpandTitle_HeightChangeOf_0195
     * @tc.desc      heightChangeOf(offset=2, heightValue=1, normalTitleHeight=-1, expandTitleHeight=1080) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0195 begin`);
      const actual: number = heightChangeOf(2, 1, -1, 1080);
      logInfo(`heightChangeOf(offset=2, heightValue=1, n...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}HeightChangeOf_0195 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0196
     * @tc.name      ExpandTitle_HeightChangeOf_0196
     * @tc.desc      heightChangeOf(offset=0, heightValue=100, normalTitleHeight=-1, expandTitleHeight=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0196 begin`);
      const actual: number = heightChangeOf(0, 100, -1, 100);
      logInfo(`heightChangeOf(offset=0, heightValue=100,...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0196 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0197
     * @tc.name      ExpandTitle_HeightChangeOf_0197
     * @tc.desc      heightChangeOf(offset=-1, heightValue=1920, normalTitleHeight=100, expandTitleHeight=720) return...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0197 begin`);
      const actual: number = heightChangeOf(-1, 1920, 100, 720);
      logInfo(`heightChangeOf(offset=-1, heightValue=192...: actual=${actual}`);
      expect(actual).assertEqual(-1200);
      logInfo(`${BUNDLE}HeightChangeOf_0197 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0198
     * @tc.name      ExpandTitle_HeightChangeOf_0198
     * @tc.desc      heightChangeOf(offset=100, heightValue=0, normalTitleHeight=360, expandTitleHeight=-1) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0198 begin`);
      const actual: number = heightChangeOf(100, 0, 360, -1);
      logInfo(`heightChangeOf(offset=100, heightValue=0,...: actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}HeightChangeOf_0198 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0199
     * @tc.name      ExpandTitle_HeightChangeOf_0199
     * @tc.desc      heightChangeOf(offset=50, heightValue=100, normalTitleHeight=720, expandTitleHeight=1080) return...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0199 begin`);
      const actual: number = heightChangeOf(50, 100, 720, 1080);
      logInfo(`heightChangeOf(offset=50, heightValue=100...: actual=${actual}`);
      expect(actual).assertEqual(620);
      logInfo(`${BUNDLE}HeightChangeOf_0199 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0200
     * @tc.name      ExpandTitle_HeightChangeOf_0200
     * @tc.desc      heightChangeOf(offset=0, heightValue=-1, normalTitleHeight=100, expandTitleHeight=1920) returns 101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0200 begin`);
      const actual: number = heightChangeOf(0, -1, 100, 1920);
      logInfo(`heightChangeOf(offset=0, heightValue=-1, ...: actual=${actual}`);
      expect(actual).assertEqual(101);
      logInfo(`${BUNDLE}HeightChangeOf_0200 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0201
     * @tc.name      ExpandTitle_HeightChangeOf_0201
     * @tc.desc      heightChangeOf(offset=3, heightValue=0, normalTitleHeight=360, expandTitleHeight=360) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0201 begin`);
      const actual: number = heightChangeOf(3, 0, 360, 360);
      logInfo(`heightChangeOf(offset=3, heightValue=0, n...: actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}HeightChangeOf_0201 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0202
     * @tc.name      ExpandTitle_HeightChangeOf_0202
     * @tc.desc      heightChangeOf(offset=2, heightValue=0, normalTitleHeight=1, expandTitleHeight=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0202 begin`);
      const actual: number = heightChangeOf(2, 0, 1, 0);
      logInfo(`heightChangeOf(offset=2, heightValue=0, n...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}HeightChangeOf_0202 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0203
     * @tc.name      ExpandTitle_HeightChangeOf_0203
     * @tc.desc      heightChangeOf(offset=-1, heightValue=1920, normalTitleHeight=720, expandTitleHeight=-1) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0203 begin`);
      const actual: number = heightChangeOf(-1, 1920, 720, -1);
      logInfo(`heightChangeOf(offset=-1, heightValue=192...: actual=${actual}`);
      expect(actual).assertEqual(-1200);
      logInfo(`${BUNDLE}HeightChangeOf_0203 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0204
     * @tc.name      ExpandTitle_HeightChangeOf_0204
     * @tc.desc      heightChangeOf(offset=3, heightValue=1, normalTitleHeight=-1, expandTitleHeight=1080) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0204 begin`);
      const actual: number = heightChangeOf(3, 1, -1, 1080);
      logInfo(`heightChangeOf(offset=3, heightValue=1, n...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}HeightChangeOf_0204 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0205
     * @tc.name      ExpandTitle_HeightChangeOf_0205
     * @tc.desc      heightChangeOf(offset=0, heightValue=720, normalTitleHeight=0, expandTitleHeight=0) returns -720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0205 begin`);
      const actual: number = heightChangeOf(0, 720, 0, 0);
      logInfo(`heightChangeOf(offset=0, heightValue=720,...: actual=${actual}`);
      expect(actual).assertEqual(-720);
      logInfo(`${BUNDLE}HeightChangeOf_0205 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0206
     * @tc.name      ExpandTitle_HeightChangeOf_0206
     * @tc.desc      heightChangeOf(offset=0, heightValue=1, normalTitleHeight=0, expandTitleHeight=720) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0206 begin`);
      const actual: number = heightChangeOf(0, 1, 0, 720);
      logInfo(`heightChangeOf(offset=0, heightValue=1, n...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0206 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0207
     * @tc.name      ExpandTitle_HeightChangeOf_0207
     * @tc.desc      heightChangeOf(offset=1, heightValue=-1, normalTitleHeight=0, expandTitleHeight=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0207 begin`);
      const actual: number = heightChangeOf(1, -1, 0, 1);
      logInfo(`heightChangeOf(offset=1, heightValue=-1, ...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}HeightChangeOf_0207 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0208
     * @tc.name      ExpandTitle_HeightChangeOf_0208
     * @tc.desc      heightChangeOf(offset=1, heightValue=100, normalTitleHeight=1920, expandTitleHeight=-1) returns ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0208 begin`);
      const actual: number = heightChangeOf(1, 100, 1920, -1);
      logInfo(`heightChangeOf(offset=1, heightValue=100,...: actual=${actual}`);
      expect(actual).assertEqual(1820);
      logInfo(`${BUNDLE}HeightChangeOf_0208 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0209
     * @tc.name      ExpandTitle_HeightChangeOf_0209
     * @tc.desc      heightChangeOf(offset=1, heightValue=0, normalTitleHeight=0, expandTitleHeight=360) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0209 begin`);
      const actual: number = heightChangeOf(1, 0, 0, 360);
      logInfo(`heightChangeOf(offset=1, heightValue=0, n...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}HeightChangeOf_0209 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0210
     * @tc.name      ExpandTitle_HeightChangeOf_0210
     * @tc.desc      heightChangeOf(offset=1, heightValue=1, normalTitleHeight=-1, expandTitleHeight=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0210 begin`);
      const actual: number = heightChangeOf(1, 1, -1, 100);
      logInfo(`heightChangeOf(offset=1, heightValue=1, n...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}HeightChangeOf_0210 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0211
     * @tc.name      ExpandTitle_HeightChangeOf_0211
     * @tc.desc      heightChangeOf(offset=100, heightValue=720, normalTitleHeight=100, expandTitleHeight=1) returns ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0211 begin`);
      const actual: number = heightChangeOf(100, 720, 100, 1);
      logInfo(`heightChangeOf(offset=100, heightValue=72...: actual=${actual}`);
      expect(actual).assertEqual(-620);
      logInfo(`${BUNDLE}HeightChangeOf_0211 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0212
     * @tc.name      ExpandTitle_HeightChangeOf_0212
     * @tc.desc      heightChangeOf(offset=50, heightValue=1, normalTitleHeight=360, expandTitleHeight=0) returns 359
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0212 begin`);
      const actual: number = heightChangeOf(50, 1, 360, 0);
      logInfo(`heightChangeOf(offset=50, heightValue=1, ...: actual=${actual}`);
      expect(actual).assertEqual(359);
      logInfo(`${BUNDLE}HeightChangeOf_0212 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0213
     * @tc.name      ExpandTitle_HeightChangeOf_0213
     * @tc.desc      heightChangeOf(offset=-100, heightValue=0, normalTitleHeight=-1, expandTitleHeight=1920) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0213 begin`);
      const actual: number = heightChangeOf(-100, 0, -1, 1920);
      logInfo(`heightChangeOf(offset=-100, heightValue=0...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}HeightChangeOf_0213 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0214
     * @tc.name      ExpandTitle_HeightChangeOf_0214
     * @tc.desc      heightChangeOf(offset=50, heightValue=360, normalTitleHeight=100, expandTitleHeight=360) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0214 begin`);
      const actual: number = heightChangeOf(50, 360, 100, 360);
      logInfo(`heightChangeOf(offset=50, heightValue=360...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0214 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0215
     * @tc.name      ExpandTitle_HeightChangeOf_0215
     * @tc.desc      heightChangeOf(offset=1, heightValue=0, normalTitleHeight=0, expandTitleHeight=720) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0215 begin`);
      const actual: number = heightChangeOf(1, 0, 0, 720);
      logInfo(`heightChangeOf(offset=1, heightValue=0, n...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}HeightChangeOf_0215 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0216
     * @tc.name      ExpandTitle_HeightChangeOf_0216
     * @tc.desc      heightChangeOf(offset=-1, heightValue=1080, normalTitleHeight=100, expandTitleHeight=1) returns ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0216 begin`);
      const actual: number = heightChangeOf(-1, 1080, 100, 1);
      logInfo(`heightChangeOf(offset=-1, heightValue=108...: actual=${actual}`);
      expect(actual).assertEqual(-980);
      logInfo(`${BUNDLE}HeightChangeOf_0216 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0217
     * @tc.name      ExpandTitle_HeightChangeOf_0217
     * @tc.desc      heightChangeOf(offset=2, heightValue=100, normalTitleHeight=-1, expandTitleHeight=1920) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0217 begin`);
      const actual: number = heightChangeOf(2, 100, -1, 1920);
      logInfo(`heightChangeOf(offset=2, heightValue=100,...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}HeightChangeOf_0217 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0218
     * @tc.name      ExpandTitle_HeightChangeOf_0218
     * @tc.desc      heightChangeOf(offset=3, heightValue=720, normalTitleHeight=0, expandTitleHeight=1080) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0218 begin`);
      const actual: number = heightChangeOf(3, 720, 0, 1080);
      logInfo(`heightChangeOf(offset=3, heightValue=720,...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}HeightChangeOf_0218 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0219
     * @tc.name      ExpandTitle_HeightChangeOf_0219
     * @tc.desc      heightChangeOf(offset=0, heightValue=1080, normalTitleHeight=1080, expandTitleHeight=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0219 begin`);
      const actual: number = heightChangeOf(0, 1080, 1080, 1);
      logInfo(`heightChangeOf(offset=0, heightValue=1080...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0219 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0220
     * @tc.name      ExpandTitle_HeightChangeOf_0220
     * @tc.desc      heightChangeOf(offset=0, heightValue=0, normalTitleHeight=1920, expandTitleHeight=-1) returns 1920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0220 begin`);
      const actual: number = heightChangeOf(0, 0, 1920, -1);
      logInfo(`heightChangeOf(offset=0, heightValue=0, n...: actual=${actual}`);
      expect(actual).assertEqual(1920);
      logInfo(`${BUNDLE}HeightChangeOf_0220 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0221
     * @tc.name      ExpandTitle_HeightChangeOf_0221
     * @tc.desc      heightChangeOf(offset=0, heightValue=360, normalTitleHeight=1920, expandTitleHeight=-1) returns ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0221 begin`);
      const actual: number = heightChangeOf(0, 360, 1920, -1);
      logInfo(`heightChangeOf(offset=0, heightValue=360,...: actual=${actual}`);
      expect(actual).assertEqual(1560);
      logInfo(`${BUNDLE}HeightChangeOf_0221 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0222
     * @tc.name      ExpandTitle_HeightChangeOf_0222
     * @tc.desc      heightChangeOf(offset=-100, heightValue=1080, normalTitleHeight=360, expandTitleHeight=720) retu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0222 begin`);
      const actual: number = heightChangeOf(-100, 1080, 360, 720);
      logInfo(`heightChangeOf(offset=-100, heightValue=1...: actual=${actual}`);
      expect(actual).assertEqual(-360);
      logInfo(`${BUNDLE}HeightChangeOf_0222 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0223
     * @tc.name      ExpandTitle_HeightChangeOf_0223
     * @tc.desc      heightChangeOf(offset=-100, heightValue=1920, normalTitleHeight=-1, expandTitleHeight=0) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0223 begin`);
      const actual: number = heightChangeOf(-100, 1920, -1, 0);
      logInfo(`heightChangeOf(offset=-100, heightValue=1...: actual=${actual}`);
      expect(actual).assertEqual(-1920);
      logInfo(`${BUNDLE}HeightChangeOf_0223 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0224
     * @tc.name      ExpandTitle_HeightChangeOf_0224
     * @tc.desc      heightChangeOf(offset=-100, heightValue=720, normalTitleHeight=100, expandTitleHeight=0) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0224 begin`);
      const actual: number = heightChangeOf(-100, 720, 100, 0);
      logInfo(`heightChangeOf(offset=-100, heightValue=7...: actual=${actual}`);
      expect(actual).assertEqual(-620);
      logInfo(`${BUNDLE}HeightChangeOf_0224 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0225
     * @tc.name      ExpandTitle_HeightChangeOf_0225
     * @tc.desc      heightChangeOf(offset=50, heightValue=1920, normalTitleHeight=360, expandTitleHeight=1920) retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0225 begin`);
      const actual: number = heightChangeOf(50, 1920, 360, 1920);
      logInfo(`heightChangeOf(offset=50, heightValue=192...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0225 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0226
     * @tc.name      ExpandTitle_HeightChangeOf_0226
     * @tc.desc      heightChangeOf(offset=1, heightValue=360, normalTitleHeight=100, expandTitleHeight=360) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0226 begin`);
      const actual: number = heightChangeOf(1, 360, 100, 360);
      logInfo(`heightChangeOf(offset=1, heightValue=360,...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0226 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0227
     * @tc.name      ExpandTitle_HeightChangeOf_0227
     * @tc.desc      heightChangeOf(offset=3, heightValue=-1, normalTitleHeight=100, expandTitleHeight=1080) returns 101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0227 begin`);
      const actual: number = heightChangeOf(3, -1, 100, 1080);
      logInfo(`heightChangeOf(offset=3, heightValue=-1, ...: actual=${actual}`);
      expect(actual).assertEqual(101);
      logInfo(`${BUNDLE}HeightChangeOf_0227 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0228
     * @tc.name      ExpandTitle_HeightChangeOf_0228
     * @tc.desc      heightChangeOf(offset=-1, heightValue=1080, normalTitleHeight=360, expandTitleHeight=100) return...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0228 begin`);
      const actual: number = heightChangeOf(-1, 1080, 360, 100);
      logInfo(`heightChangeOf(offset=-1, heightValue=108...: actual=${actual}`);
      expect(actual).assertEqual(-720);
      logInfo(`${BUNDLE}HeightChangeOf_0228 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0229
     * @tc.name      ExpandTitle_HeightChangeOf_0229
     * @tc.desc      heightChangeOf(offset=-100, heightValue=1080, normalTitleHeight=100, expandTitleHeight=1920) ret...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0229 begin`);
      const actual: number = heightChangeOf(-100, 1080, 100, 1920);
      logInfo(`heightChangeOf(offset=-100, heightValue=1...: actual=${actual}`);
      expect(actual).assertEqual(-100);
      logInfo(`${BUNDLE}HeightChangeOf_0229 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0230
     * @tc.name      ExpandTitle_HeightChangeOf_0230
     * @tc.desc      heightChangeOf(offset=-1, heightValue=1, normalTitleHeight=1920, expandTitleHeight=360) returns ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0230 begin`);
      const actual: number = heightChangeOf(-1, 1, 1920, 360);
      logInfo(`heightChangeOf(offset=-1, heightValue=1, ...: actual=${actual}`);
      expect(actual).assertEqual(1919);
      logInfo(`${BUNDLE}HeightChangeOf_0230 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0231
     * @tc.name      ExpandTitle_HeightChangeOf_0231
     * @tc.desc      heightChangeOf(offset=2, heightValue=1080, normalTitleHeight=100, expandTitleHeight=0) returns -980
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0231 begin`);
      const actual: number = heightChangeOf(2, 1080, 100, 0);
      logInfo(`heightChangeOf(offset=2, heightValue=1080...: actual=${actual}`);
      expect(actual).assertEqual(-980);
      logInfo(`${BUNDLE}HeightChangeOf_0231 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0232
     * @tc.name      ExpandTitle_HeightChangeOf_0232
     * @tc.desc      heightChangeOf(offset=0, heightValue=1080, normalTitleHeight=-1, expandTitleHeight=1920) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0232 begin`);
      const actual: number = heightChangeOf(0, 1080, -1, 1920);
      logInfo(`heightChangeOf(offset=0, heightValue=1080...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0232 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0233
     * @tc.name      ExpandTitle_HeightChangeOf_0233
     * @tc.desc      heightChangeOf(offset=-100, heightValue=1080, normalTitleHeight=0, expandTitleHeight=100) return...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0233 begin`);
      const actual: number = heightChangeOf(-100, 1080, 0, 100);
      logInfo(`heightChangeOf(offset=-100, heightValue=1...: actual=${actual}`);
      expect(actual).assertEqual(-980);
      logInfo(`${BUNDLE}HeightChangeOf_0233 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0234
     * @tc.name      ExpandTitle_HeightChangeOf_0234
     * @tc.desc      heightChangeOf(offset=-100, heightValue=720, normalTitleHeight=-1, expandTitleHeight=1080) retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0234 begin`);
      const actual: number = heightChangeOf(-100, 720, -1, 1080);
      logInfo(`heightChangeOf(offset=-100, heightValue=7...: actual=${actual}`);
      expect(actual).assertEqual(-100);
      logInfo(`${BUNDLE}HeightChangeOf_0234 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0235
     * @tc.name      ExpandTitle_HeightChangeOf_0235
     * @tc.desc      heightChangeOf(offset=3, heightValue=360, normalTitleHeight=-1, expandTitleHeight=720) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0235 begin`);
      const actual: number = heightChangeOf(3, 360, -1, 720);
      logInfo(`heightChangeOf(offset=3, heightValue=360,...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}HeightChangeOf_0235 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0236
     * @tc.name      ExpandTitle_HeightChangeOf_0236
     * @tc.desc      heightChangeOf(offset=3, heightValue=0, normalTitleHeight=1080, expandTitleHeight=360) returns 1080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0236 begin`);
      const actual: number = heightChangeOf(3, 0, 1080, 360);
      logInfo(`heightChangeOf(offset=3, heightValue=0, n...: actual=${actual}`);
      expect(actual).assertEqual(1080);
      logInfo(`${BUNDLE}HeightChangeOf_0236 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0237
     * @tc.name      ExpandTitle_HeightChangeOf_0237
     * @tc.desc      heightChangeOf(offset=3, heightValue=100, normalTitleHeight=0, expandTitleHeight=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0237 begin`);
      const actual: number = heightChangeOf(3, 100, 0, 100);
      logInfo(`heightChangeOf(offset=3, heightValue=100,...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0237 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0238
     * @tc.name      ExpandTitle_HeightChangeOf_0238
     * @tc.desc      heightChangeOf(offset=1, heightValue=0, normalTitleHeight=1, expandTitleHeight=-1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0238 begin`);
      const actual: number = heightChangeOf(1, 0, 1, -1);
      logInfo(`heightChangeOf(offset=1, heightValue=0, n...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}HeightChangeOf_0238 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0239
     * @tc.name      ExpandTitle_HeightChangeOf_0239
     * @tc.desc      heightChangeOf(offset=-1, heightValue=720, normalTitleHeight=1080, expandTitleHeight=0) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0239 begin`);
      const actual: number = heightChangeOf(-1, 720, 1080, 0);
      logInfo(`heightChangeOf(offset=-1, heightValue=720...: actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}HeightChangeOf_0239 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0240
     * @tc.name      ExpandTitle_HeightChangeOf_0240
     * @tc.desc      heightChangeOf(offset=2, heightValue=1080, normalTitleHeight=1080, expandTitleHeight=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0240 begin`);
      const actual: number = heightChangeOf(2, 1080, 1080, 0);
      logInfo(`heightChangeOf(offset=2, heightValue=1080...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0240 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0241
     * @tc.name      ExpandTitle_HeightChangeOf_0241
     * @tc.desc      heightChangeOf(offset=50, heightValue=-1, normalTitleHeight=-1, expandTitleHeight=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0241 begin`);
      const actual: number = heightChangeOf(50, -1, -1, 0);
      logInfo(`heightChangeOf(offset=50, heightValue=-1,...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}HeightChangeOf_0241 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0242
     * @tc.name      ExpandTitle_HeightChangeOf_0242
     * @tc.desc      heightChangeOf(offset=50, heightValue=1, normalTitleHeight=1, expandTitleHeight=1920) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0242 begin`);
      const actual: number = heightChangeOf(50, 1, 1, 1920);
      logInfo(`heightChangeOf(offset=50, heightValue=1, ...: actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}HeightChangeOf_0242 end`);
    });
  });
}
