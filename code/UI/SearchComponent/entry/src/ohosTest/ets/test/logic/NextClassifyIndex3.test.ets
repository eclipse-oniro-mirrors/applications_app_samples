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
import { yieldToEventLoop } from '../../utils/TestScheduler';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { nextClassifyIndex } from '../model/SearchComponentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SearchComponent]';
const BUNDLE: string = 'SearchComponent_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for nextClassifyIndex (96 cases). */
export default function nextClassifyIndex3Test(): void {
  describe('NextClassifyIndex3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0193
     * @tc.name      SearchComponent_NextClassifyIndex_0193
     * @tc.desc      nextClassifyIndex(current=59999, index=30) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0193 begin`);
      const actual: number = nextClassifyIndex(59999, 30);
      logInfo(`nextClassifyIndex(current=59999, index=30): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}NextClassifyIndex_0193 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0194
     * @tc.name      SearchComponent_NextClassifyIndex_0194
     * @tc.desc      nextClassifyIndex(current=59999, index=35) returns 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0194 begin`);
      const actual: number = nextClassifyIndex(59999, 35);
      logInfo(`nextClassifyIndex(current=59999, index=35): actual=${actual}`);
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}NextClassifyIndex_0194 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0195
     * @tc.name      SearchComponent_NextClassifyIndex_0195
     * @tc.desc      nextClassifyIndex(current=59999, index=40) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0195 begin`);
      const actual: number = nextClassifyIndex(59999, 40);
      logInfo(`nextClassifyIndex(current=59999, index=40): actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}NextClassifyIndex_0195 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0196
     * @tc.name      SearchComponent_NextClassifyIndex_0196
     * @tc.desc      nextClassifyIndex(current=59999, index=45) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0196 begin`);
      const actual: number = nextClassifyIndex(59999, 45);
      logInfo(`nextClassifyIndex(current=59999, index=45): actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}NextClassifyIndex_0196 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0197
     * @tc.name      SearchComponent_NextClassifyIndex_0197
     * @tc.desc      nextClassifyIndex(current=59999, index=50) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0197 begin`);
      const actual: number = nextClassifyIndex(59999, 50);
      logInfo(`nextClassifyIndex(current=59999, index=50): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}NextClassifyIndex_0197 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0198
     * @tc.name      SearchComponent_NextClassifyIndex_0198
     * @tc.desc      nextClassifyIndex(current=59999, index=55) returns 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0198 begin`);
      const actual: number = nextClassifyIndex(59999, 55);
      logInfo(`nextClassifyIndex(current=59999, index=55): actual=${actual}`);
      expect(actual).assertEqual(55);
      logInfo(`${BUNDLE}NextClassifyIndex_0198 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0199
     * @tc.name      SearchComponent_NextClassifyIndex_0199
     * @tc.desc      nextClassifyIndex(current=59999, index=60) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0199 begin`);
      const actual: number = nextClassifyIndex(59999, 60);
      logInfo(`nextClassifyIndex(current=59999, index=60): actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}NextClassifyIndex_0199 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0200
     * @tc.name      SearchComponent_NextClassifyIndex_0200
     * @tc.desc      nextClassifyIndex(current=59999, index=65) returns 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0200 begin`);
      const actual: number = nextClassifyIndex(59999, 65);
      logInfo(`nextClassifyIndex(current=59999, index=65): actual=${actual}`);
      expect(actual).assertEqual(65);
      logInfo(`${BUNDLE}NextClassifyIndex_0200 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0201
     * @tc.name      SearchComponent_NextClassifyIndex_0201
     * @tc.desc      nextClassifyIndex(current=59999, index=70) returns 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0201 begin`);
      const actual: number = nextClassifyIndex(59999, 70);
      logInfo(`nextClassifyIndex(current=59999, index=70): actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}NextClassifyIndex_0201 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0202
     * @tc.name      SearchComponent_NextClassifyIndex_0202
     * @tc.desc      nextClassifyIndex(current=59999, index=75) returns 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0202 begin`);
      const actual: number = nextClassifyIndex(59999, 75);
      logInfo(`nextClassifyIndex(current=59999, index=75): actual=${actual}`);
      expect(actual).assertEqual(75);
      logInfo(`${BUNDLE}NextClassifyIndex_0202 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0203
     * @tc.name      SearchComponent_NextClassifyIndex_0203
     * @tc.desc      nextClassifyIndex(current=59999, index=80) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0203 begin`);
      const actual: number = nextClassifyIndex(59999, 80);
      logInfo(`nextClassifyIndex(current=59999, index=80): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}NextClassifyIndex_0203 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0204
     * @tc.name      SearchComponent_NextClassifyIndex_0204
     * @tc.desc      nextClassifyIndex(current=59999, index=85) returns 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0204 begin`);
      const actual: number = nextClassifyIndex(59999, 85);
      logInfo(`nextClassifyIndex(current=59999, index=85): actual=${actual}`);
      expect(actual).assertEqual(85);
      logInfo(`${BUNDLE}NextClassifyIndex_0204 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0205
     * @tc.name      SearchComponent_NextClassifyIndex_0205
     * @tc.desc      nextClassifyIndex(current=59999, index=90) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0205 begin`);
      const actual: number = nextClassifyIndex(59999, 90);
      logInfo(`nextClassifyIndex(current=59999, index=90): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}NextClassifyIndex_0205 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0206
     * @tc.name      SearchComponent_NextClassifyIndex_0206
     * @tc.desc      nextClassifyIndex(current=59999, index=95) returns 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0206 begin`);
      const actual: number = nextClassifyIndex(59999, 95);
      logInfo(`nextClassifyIndex(current=59999, index=95): actual=${actual}`);
      expect(actual).assertEqual(95);
      logInfo(`${BUNDLE}NextClassifyIndex_0206 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0207
     * @tc.name      SearchComponent_NextClassifyIndex_0207
     * @tc.desc      nextClassifyIndex(current=59999, index=105) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0207 begin`);
      const actual: number = nextClassifyIndex(59999, 105);
      logInfo(`nextClassifyIndex(current=59999, index=105): actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}NextClassifyIndex_0207 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0208
     * @tc.name      SearchComponent_NextClassifyIndex_0208
     * @tc.desc      nextClassifyIndex(current=59999, index=-45) returns -45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_NextClassifyIndex_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0208 begin`);
      const actual: number = nextClassifyIndex(59999, -45);
      logInfo(`nextClassifyIndex(current=59999, index=-45): actual=${actual}`);
      expect(actual).assertEqual(-45);
      logInfo(`${BUNDLE}NextClassifyIndex_0208 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0209
     * @tc.name      SearchComponent_NextClassifyIndex_0209
     * @tc.desc      nextClassifyIndex(current=59999, index=-77) returns -77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_NextClassifyIndex_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0209 begin`);
      const actual: number = nextClassifyIndex(59999, -77);
      logInfo(`nextClassifyIndex(current=59999, index=-77): actual=${actual}`);
      expect(actual).assertEqual(-77);
      logInfo(`${BUNDLE}NextClassifyIndex_0209 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0210
     * @tc.name      SearchComponent_NextClassifyIndex_0210
     * @tc.desc      nextClassifyIndex(current=59999, index=109) returns 109
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0210 begin`);
      const actual: number = nextClassifyIndex(59999, 109);
      logInfo(`nextClassifyIndex(current=59999, index=109): actual=${actual}`);
      expect(actual).assertEqual(109);
      logInfo(`${BUNDLE}NextClassifyIndex_0210 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0211
     * @tc.name      SearchComponent_NextClassifyIndex_0211
     * @tc.desc      nextClassifyIndex(current=60000, index=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0211 begin`);
      const actual: number = nextClassifyIndex(60000, 0);
      logInfo(`nextClassifyIndex(current=60000, index=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NextClassifyIndex_0211 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0212
     * @tc.name      SearchComponent_NextClassifyIndex_0212
     * @tc.desc      nextClassifyIndex(current=60000, index=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0212 begin`);
      const actual: number = nextClassifyIndex(60000, 1);
      logInfo(`nextClassifyIndex(current=60000, index=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextClassifyIndex_0212 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0213
     * @tc.name      SearchComponent_NextClassifyIndex_0213
     * @tc.desc      nextClassifyIndex(current=60000, index=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0213 begin`);
      const actual: number = nextClassifyIndex(60000, -1);
      logInfo(`nextClassifyIndex(current=60000, index=-1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}NextClassifyIndex_0213 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0214
     * @tc.name      SearchComponent_NextClassifyIndex_0214
     * @tc.desc      nextClassifyIndex(current=60000, index=-2) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0214 begin`);
      const actual: number = nextClassifyIndex(60000, -2);
      logInfo(`nextClassifyIndex(current=60000, index=-2): actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}NextClassifyIndex_0214 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0215
     * @tc.name      SearchComponent_NextClassifyIndex_0215
     * @tc.desc      nextClassifyIndex(current=60000, index=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0215 begin`);
      const actual: number = nextClassifyIndex(60000, 2);
      logInfo(`nextClassifyIndex(current=60000, index=2): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}NextClassifyIndex_0215 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0216
     * @tc.name      SearchComponent_NextClassifyIndex_0216
     * @tc.desc      nextClassifyIndex(current=60000, index=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0216 begin`);
      const actual: number = nextClassifyIndex(60000, 5);
      logInfo(`nextClassifyIndex(current=60000, index=5): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}NextClassifyIndex_0216 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0217
     * @tc.name      SearchComponent_NextClassifyIndex_0217
     * @tc.desc      nextClassifyIndex(current=60000, index=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0217 begin`);
      const actual: number = nextClassifyIndex(60000, 10);
      logInfo(`nextClassifyIndex(current=60000, index=10): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}NextClassifyIndex_0217 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0218
     * @tc.name      SearchComponent_NextClassifyIndex_0218
     * @tc.desc      nextClassifyIndex(current=60000, index=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0218 begin`);
      const actual: number = nextClassifyIndex(60000, 3);
      logInfo(`nextClassifyIndex(current=60000, index=3): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}NextClassifyIndex_0218 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0219
     * @tc.name      SearchComponent_NextClassifyIndex_0219
     * @tc.desc      nextClassifyIndex(current=60000, index=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0219 begin`);
      const actual: number = nextClassifyIndex(60000, 100);
      logInfo(`nextClassifyIndex(current=60000, index=100): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}NextClassifyIndex_0219 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0220
     * @tc.name      SearchComponent_NextClassifyIndex_0220
     * @tc.desc      nextClassifyIndex(current=60000, index=15) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0220 begin`);
      const actual: number = nextClassifyIndex(60000, 15);
      logInfo(`nextClassifyIndex(current=60000, index=15): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}NextClassifyIndex_0220 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0221
     * @tc.name      SearchComponent_NextClassifyIndex_0221
     * @tc.desc      nextClassifyIndex(current=60000, index=20) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0221 begin`);
      const actual: number = nextClassifyIndex(60000, 20);
      logInfo(`nextClassifyIndex(current=60000, index=20): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}NextClassifyIndex_0221 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0222
     * @tc.name      SearchComponent_NextClassifyIndex_0222
     * @tc.desc      nextClassifyIndex(current=60000, index=25) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0222 begin`);
      const actual: number = nextClassifyIndex(60000, 25);
      logInfo(`nextClassifyIndex(current=60000, index=25): actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}NextClassifyIndex_0222 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0223
     * @tc.name      SearchComponent_NextClassifyIndex_0223
     * @tc.desc      nextClassifyIndex(current=60000, index=30) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0223 begin`);
      const actual: number = nextClassifyIndex(60000, 30);
      logInfo(`nextClassifyIndex(current=60000, index=30): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}NextClassifyIndex_0223 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0224
     * @tc.name      SearchComponent_NextClassifyIndex_0224
     * @tc.desc      nextClassifyIndex(current=60000, index=35) returns 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0224 begin`);
      const actual: number = nextClassifyIndex(60000, 35);
      logInfo(`nextClassifyIndex(current=60000, index=35): actual=${actual}`);
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}NextClassifyIndex_0224 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0225
     * @tc.name      SearchComponent_NextClassifyIndex_0225
     * @tc.desc      nextClassifyIndex(current=60000, index=40) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0225 begin`);
      const actual: number = nextClassifyIndex(60000, 40);
      logInfo(`nextClassifyIndex(current=60000, index=40): actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}NextClassifyIndex_0225 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0226
     * @tc.name      SearchComponent_NextClassifyIndex_0226
     * @tc.desc      nextClassifyIndex(current=60000, index=45) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0226 begin`);
      const actual: number = nextClassifyIndex(60000, 45);
      logInfo(`nextClassifyIndex(current=60000, index=45): actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}NextClassifyIndex_0226 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0227
     * @tc.name      SearchComponent_NextClassifyIndex_0227
     * @tc.desc      nextClassifyIndex(current=60000, index=50) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0227 begin`);
      const actual: number = nextClassifyIndex(60000, 50);
      logInfo(`nextClassifyIndex(current=60000, index=50): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}NextClassifyIndex_0227 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0228
     * @tc.name      SearchComponent_NextClassifyIndex_0228
     * @tc.desc      nextClassifyIndex(current=60000, index=55) returns 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0228 begin`);
      const actual: number = nextClassifyIndex(60000, 55);
      logInfo(`nextClassifyIndex(current=60000, index=55): actual=${actual}`);
      expect(actual).assertEqual(55);
      logInfo(`${BUNDLE}NextClassifyIndex_0228 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0229
     * @tc.name      SearchComponent_NextClassifyIndex_0229
     * @tc.desc      nextClassifyIndex(current=60000, index=60) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0229 begin`);
      const actual: number = nextClassifyIndex(60000, 60);
      logInfo(`nextClassifyIndex(current=60000, index=60): actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}NextClassifyIndex_0229 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0230
     * @tc.name      SearchComponent_NextClassifyIndex_0230
     * @tc.desc      nextClassifyIndex(current=60000, index=65) returns 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0230 begin`);
      const actual: number = nextClassifyIndex(60000, 65);
      logInfo(`nextClassifyIndex(current=60000, index=65): actual=${actual}`);
      expect(actual).assertEqual(65);
      logInfo(`${BUNDLE}NextClassifyIndex_0230 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0231
     * @tc.name      SearchComponent_NextClassifyIndex_0231
     * @tc.desc      nextClassifyIndex(current=60000, index=70) returns 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0231 begin`);
      const actual: number = nextClassifyIndex(60000, 70);
      logInfo(`nextClassifyIndex(current=60000, index=70): actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}NextClassifyIndex_0231 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0232
     * @tc.name      SearchComponent_NextClassifyIndex_0232
     * @tc.desc      nextClassifyIndex(current=60000, index=75) returns 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0232 begin`);
      const actual: number = nextClassifyIndex(60000, 75);
      logInfo(`nextClassifyIndex(current=60000, index=75): actual=${actual}`);
      expect(actual).assertEqual(75);
      logInfo(`${BUNDLE}NextClassifyIndex_0232 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0233
     * @tc.name      SearchComponent_NextClassifyIndex_0233
     * @tc.desc      nextClassifyIndex(current=60000, index=80) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0233 begin`);
      const actual: number = nextClassifyIndex(60000, 80);
      logInfo(`nextClassifyIndex(current=60000, index=80): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}NextClassifyIndex_0233 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0234
     * @tc.name      SearchComponent_NextClassifyIndex_0234
     * @tc.desc      nextClassifyIndex(current=60000, index=85) returns 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0234 begin`);
      const actual: number = nextClassifyIndex(60000, 85);
      logInfo(`nextClassifyIndex(current=60000, index=85): actual=${actual}`);
      expect(actual).assertEqual(85);
      logInfo(`${BUNDLE}NextClassifyIndex_0234 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0235
     * @tc.name      SearchComponent_NextClassifyIndex_0235
     * @tc.desc      nextClassifyIndex(current=60000, index=90) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0235 begin`);
      const actual: number = nextClassifyIndex(60000, 90);
      logInfo(`nextClassifyIndex(current=60000, index=90): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}NextClassifyIndex_0235 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0236
     * @tc.name      SearchComponent_NextClassifyIndex_0236
     * @tc.desc      nextClassifyIndex(current=60000, index=95) returns 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0236 begin`);
      const actual: number = nextClassifyIndex(60000, 95);
      logInfo(`nextClassifyIndex(current=60000, index=95): actual=${actual}`);
      expect(actual).assertEqual(95);
      logInfo(`${BUNDLE}NextClassifyIndex_0236 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0237
     * @tc.name      SearchComponent_NextClassifyIndex_0237
     * @tc.desc      nextClassifyIndex(current=60000, index=105) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0237 begin`);
      const actual: number = nextClassifyIndex(60000, 105);
      logInfo(`nextClassifyIndex(current=60000, index=105): actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}NextClassifyIndex_0237 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0238
     * @tc.name      SearchComponent_NextClassifyIndex_0238
     * @tc.desc      nextClassifyIndex(current=60000, index=-45) returns -45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_NextClassifyIndex_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0238 begin`);
      const actual: number = nextClassifyIndex(60000, -45);
      logInfo(`nextClassifyIndex(current=60000, index=-45): actual=${actual}`);
      expect(actual).assertEqual(-45);
      logInfo(`${BUNDLE}NextClassifyIndex_0238 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0239
     * @tc.name      SearchComponent_NextClassifyIndex_0239
     * @tc.desc      nextClassifyIndex(current=60000, index=-77) returns -77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_NextClassifyIndex_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0239 begin`);
      const actual: number = nextClassifyIndex(60000, -77);
      logInfo(`nextClassifyIndex(current=60000, index=-77): actual=${actual}`);
      expect(actual).assertEqual(-77);
      logInfo(`${BUNDLE}NextClassifyIndex_0239 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0240
     * @tc.name      SearchComponent_NextClassifyIndex_0240
     * @tc.desc      nextClassifyIndex(current=60000, index=109) returns 109
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0240 begin`);
      const actual: number = nextClassifyIndex(60000, 109);
      logInfo(`nextClassifyIndex(current=60000, index=109): actual=${actual}`);
      expect(actual).assertEqual(109);
      logInfo(`${BUNDLE}NextClassifyIndex_0240 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0241
     * @tc.name      SearchComponent_NextClassifyIndex_0241
     * @tc.desc      nextClassifyIndex(current=61000, index=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0241 begin`);
      const actual: number = nextClassifyIndex(61000, 0);
      logInfo(`nextClassifyIndex(current=61000, index=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NextClassifyIndex_0241 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0242
     * @tc.name      SearchComponent_NextClassifyIndex_0242
     * @tc.desc      nextClassifyIndex(current=61000, index=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0242 begin`);
      const actual: number = nextClassifyIndex(61000, 1);
      logInfo(`nextClassifyIndex(current=61000, index=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextClassifyIndex_0242 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0243
     * @tc.name      SearchComponent_NextClassifyIndex_0243
     * @tc.desc      nextClassifyIndex(current=61000, index=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0243 begin`);
      const actual: number = nextClassifyIndex(61000, -1);
      logInfo(`nextClassifyIndex(current=61000, index=-1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}NextClassifyIndex_0243 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0244
     * @tc.name      SearchComponent_NextClassifyIndex_0244
     * @tc.desc      nextClassifyIndex(current=61000, index=-2) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0244 begin`);
      const actual: number = nextClassifyIndex(61000, -2);
      logInfo(`nextClassifyIndex(current=61000, index=-2): actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}NextClassifyIndex_0244 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0245
     * @tc.name      SearchComponent_NextClassifyIndex_0245
     * @tc.desc      nextClassifyIndex(current=61000, index=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0245 begin`);
      const actual: number = nextClassifyIndex(61000, 2);
      logInfo(`nextClassifyIndex(current=61000, index=2): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}NextClassifyIndex_0245 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0246
     * @tc.name      SearchComponent_NextClassifyIndex_0246
     * @tc.desc      nextClassifyIndex(current=61000, index=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0246 begin`);
      const actual: number = nextClassifyIndex(61000, 5);
      logInfo(`nextClassifyIndex(current=61000, index=5): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}NextClassifyIndex_0246 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0247
     * @tc.name      SearchComponent_NextClassifyIndex_0247
     * @tc.desc      nextClassifyIndex(current=61000, index=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0247 begin`);
      const actual: number = nextClassifyIndex(61000, 10);
      logInfo(`nextClassifyIndex(current=61000, index=10): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}NextClassifyIndex_0247 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0248
     * @tc.name      SearchComponent_NextClassifyIndex_0248
     * @tc.desc      nextClassifyIndex(current=61000, index=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0248 begin`);
      const actual: number = nextClassifyIndex(61000, 3);
      logInfo(`nextClassifyIndex(current=61000, index=3): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}NextClassifyIndex_0248 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0249
     * @tc.name      SearchComponent_NextClassifyIndex_0249
     * @tc.desc      nextClassifyIndex(current=61000, index=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0249 begin`);
      const actual: number = nextClassifyIndex(61000, 100);
      logInfo(`nextClassifyIndex(current=61000, index=100): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}NextClassifyIndex_0249 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0250
     * @tc.name      SearchComponent_NextClassifyIndex_0250
     * @tc.desc      nextClassifyIndex(current=61000, index=15) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0250 begin`);
      const actual: number = nextClassifyIndex(61000, 15);
      logInfo(`nextClassifyIndex(current=61000, index=15): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}NextClassifyIndex_0250 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0251
     * @tc.name      SearchComponent_NextClassifyIndex_0251
     * @tc.desc      nextClassifyIndex(current=61000, index=20) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0251 begin`);
      const actual: number = nextClassifyIndex(61000, 20);
      logInfo(`nextClassifyIndex(current=61000, index=20): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}NextClassifyIndex_0251 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0252
     * @tc.name      SearchComponent_NextClassifyIndex_0252
     * @tc.desc      nextClassifyIndex(current=61000, index=25) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0252 begin`);
      const actual: number = nextClassifyIndex(61000, 25);
      logInfo(`nextClassifyIndex(current=61000, index=25): actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}NextClassifyIndex_0252 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0253
     * @tc.name      SearchComponent_NextClassifyIndex_0253
     * @tc.desc      nextClassifyIndex(current=61000, index=30) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0253 begin`);
      const actual: number = nextClassifyIndex(61000, 30);
      logInfo(`nextClassifyIndex(current=61000, index=30): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}NextClassifyIndex_0253 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0254
     * @tc.name      SearchComponent_NextClassifyIndex_0254
     * @tc.desc      nextClassifyIndex(current=61000, index=35) returns 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0254 begin`);
      const actual: number = nextClassifyIndex(61000, 35);
      logInfo(`nextClassifyIndex(current=61000, index=35): actual=${actual}`);
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}NextClassifyIndex_0254 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0255
     * @tc.name      SearchComponent_NextClassifyIndex_0255
     * @tc.desc      nextClassifyIndex(current=61000, index=40) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0255 begin`);
      const actual: number = nextClassifyIndex(61000, 40);
      logInfo(`nextClassifyIndex(current=61000, index=40): actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}NextClassifyIndex_0255 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0256
     * @tc.name      SearchComponent_NextClassifyIndex_0256
     * @tc.desc      nextClassifyIndex(current=61000, index=45) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0256 begin`);
      const actual: number = nextClassifyIndex(61000, 45);
      logInfo(`nextClassifyIndex(current=61000, index=45): actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}NextClassifyIndex_0256 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0257
     * @tc.name      SearchComponent_NextClassifyIndex_0257
     * @tc.desc      nextClassifyIndex(current=61000, index=50) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0257 begin`);
      const actual: number = nextClassifyIndex(61000, 50);
      logInfo(`nextClassifyIndex(current=61000, index=50): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}NextClassifyIndex_0257 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0258
     * @tc.name      SearchComponent_NextClassifyIndex_0258
     * @tc.desc      nextClassifyIndex(current=61000, index=55) returns 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0258 begin`);
      const actual: number = nextClassifyIndex(61000, 55);
      logInfo(`nextClassifyIndex(current=61000, index=55): actual=${actual}`);
      expect(actual).assertEqual(55);
      logInfo(`${BUNDLE}NextClassifyIndex_0258 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0259
     * @tc.name      SearchComponent_NextClassifyIndex_0259
     * @tc.desc      nextClassifyIndex(current=61000, index=60) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0259 begin`);
      const actual: number = nextClassifyIndex(61000, 60);
      logInfo(`nextClassifyIndex(current=61000, index=60): actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}NextClassifyIndex_0259 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0260
     * @tc.name      SearchComponent_NextClassifyIndex_0260
     * @tc.desc      nextClassifyIndex(current=61000, index=65) returns 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0260 begin`);
      const actual: number = nextClassifyIndex(61000, 65);
      logInfo(`nextClassifyIndex(current=61000, index=65): actual=${actual}`);
      expect(actual).assertEqual(65);
      logInfo(`${BUNDLE}NextClassifyIndex_0260 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0261
     * @tc.name      SearchComponent_NextClassifyIndex_0261
     * @tc.desc      nextClassifyIndex(current=61000, index=70) returns 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0261 begin`);
      const actual: number = nextClassifyIndex(61000, 70);
      logInfo(`nextClassifyIndex(current=61000, index=70): actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}NextClassifyIndex_0261 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0262
     * @tc.name      SearchComponent_NextClassifyIndex_0262
     * @tc.desc      nextClassifyIndex(current=61000, index=75) returns 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0262 begin`);
      const actual: number = nextClassifyIndex(61000, 75);
      logInfo(`nextClassifyIndex(current=61000, index=75): actual=${actual}`);
      expect(actual).assertEqual(75);
      logInfo(`${BUNDLE}NextClassifyIndex_0262 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0263
     * @tc.name      SearchComponent_NextClassifyIndex_0263
     * @tc.desc      nextClassifyIndex(current=61000, index=80) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0263 begin`);
      const actual: number = nextClassifyIndex(61000, 80);
      logInfo(`nextClassifyIndex(current=61000, index=80): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}NextClassifyIndex_0263 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0264
     * @tc.name      SearchComponent_NextClassifyIndex_0264
     * @tc.desc      nextClassifyIndex(current=61000, index=85) returns 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0264 begin`);
      const actual: number = nextClassifyIndex(61000, 85);
      logInfo(`nextClassifyIndex(current=61000, index=85): actual=${actual}`);
      expect(actual).assertEqual(85);
      logInfo(`${BUNDLE}NextClassifyIndex_0264 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0265
     * @tc.name      SearchComponent_NextClassifyIndex_0265
     * @tc.desc      nextClassifyIndex(current=61000, index=90) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0265 begin`);
      const actual: number = nextClassifyIndex(61000, 90);
      logInfo(`nextClassifyIndex(current=61000, index=90): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}NextClassifyIndex_0265 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0266
     * @tc.name      SearchComponent_NextClassifyIndex_0266
     * @tc.desc      nextClassifyIndex(current=61000, index=95) returns 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0266 begin`);
      const actual: number = nextClassifyIndex(61000, 95);
      logInfo(`nextClassifyIndex(current=61000, index=95): actual=${actual}`);
      expect(actual).assertEqual(95);
      logInfo(`${BUNDLE}NextClassifyIndex_0266 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0267
     * @tc.name      SearchComponent_NextClassifyIndex_0267
     * @tc.desc      nextClassifyIndex(current=61000, index=105) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0267 begin`);
      const actual: number = nextClassifyIndex(61000, 105);
      logInfo(`nextClassifyIndex(current=61000, index=105): actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}NextClassifyIndex_0267 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0268
     * @tc.name      SearchComponent_NextClassifyIndex_0268
     * @tc.desc      nextClassifyIndex(current=61000, index=-45) returns -45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_NextClassifyIndex_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0268 begin`);
      const actual: number = nextClassifyIndex(61000, -45);
      logInfo(`nextClassifyIndex(current=61000, index=-45): actual=${actual}`);
      expect(actual).assertEqual(-45);
      logInfo(`${BUNDLE}NextClassifyIndex_0268 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0269
     * @tc.name      SearchComponent_NextClassifyIndex_0269
     * @tc.desc      nextClassifyIndex(current=61000, index=-77) returns -77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_NextClassifyIndex_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0269 begin`);
      const actual: number = nextClassifyIndex(61000, -77);
      logInfo(`nextClassifyIndex(current=61000, index=-77): actual=${actual}`);
      expect(actual).assertEqual(-77);
      logInfo(`${BUNDLE}NextClassifyIndex_0269 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0270
     * @tc.name      SearchComponent_NextClassifyIndex_0270
     * @tc.desc      nextClassifyIndex(current=61000, index=109) returns 109
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0270 begin`);
      const actual: number = nextClassifyIndex(61000, 109);
      logInfo(`nextClassifyIndex(current=61000, index=109): actual=${actual}`);
      expect(actual).assertEqual(109);
      logInfo(`${BUNDLE}NextClassifyIndex_0270 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0271
     * @tc.name      SearchComponent_NextClassifyIndex_0271
     * @tc.desc      nextClassifyIndex(current=3599000, index=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0271 begin`);
      const actual: number = nextClassifyIndex(3599000, 0);
      logInfo(`nextClassifyIndex(current=3599000, index=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NextClassifyIndex_0271 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0272
     * @tc.name      SearchComponent_NextClassifyIndex_0272
     * @tc.desc      nextClassifyIndex(current=3599000, index=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0272 begin`);
      const actual: number = nextClassifyIndex(3599000, 1);
      logInfo(`nextClassifyIndex(current=3599000, index=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextClassifyIndex_0272 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0273
     * @tc.name      SearchComponent_NextClassifyIndex_0273
     * @tc.desc      nextClassifyIndex(current=3599000, index=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0273 begin`);
      const actual: number = nextClassifyIndex(3599000, -1);
      logInfo(`nextClassifyIndex(current=3599000, index=-1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}NextClassifyIndex_0273 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0274
     * @tc.name      SearchComponent_NextClassifyIndex_0274
     * @tc.desc      nextClassifyIndex(current=3599000, index=-2) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0274 begin`);
      const actual: number = nextClassifyIndex(3599000, -2);
      logInfo(`nextClassifyIndex(current=3599000, index=-2): actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}NextClassifyIndex_0274 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0275
     * @tc.name      SearchComponent_NextClassifyIndex_0275
     * @tc.desc      nextClassifyIndex(current=3599000, index=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0275 begin`);
      const actual: number = nextClassifyIndex(3599000, 2);
      logInfo(`nextClassifyIndex(current=3599000, index=2): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}NextClassifyIndex_0275 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0276
     * @tc.name      SearchComponent_NextClassifyIndex_0276
     * @tc.desc      nextClassifyIndex(current=3599000, index=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0276 begin`);
      const actual: number = nextClassifyIndex(3599000, 5);
      logInfo(`nextClassifyIndex(current=3599000, index=5): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}NextClassifyIndex_0276 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0277
     * @tc.name      SearchComponent_NextClassifyIndex_0277
     * @tc.desc      nextClassifyIndex(current=3599000, index=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0277 begin`);
      const actual: number = nextClassifyIndex(3599000, 10);
      logInfo(`nextClassifyIndex(current=3599000, index=10): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}NextClassifyIndex_0277 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0278
     * @tc.name      SearchComponent_NextClassifyIndex_0278
     * @tc.desc      nextClassifyIndex(current=3599000, index=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0278 begin`);
      const actual: number = nextClassifyIndex(3599000, 3);
      logInfo(`nextClassifyIndex(current=3599000, index=3): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}NextClassifyIndex_0278 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0279
     * @tc.name      SearchComponent_NextClassifyIndex_0279
     * @tc.desc      nextClassifyIndex(current=3599000, index=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0279 begin`);
      const actual: number = nextClassifyIndex(3599000, 100);
      logInfo(`nextClassifyIndex(current=3599000, index=...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}NextClassifyIndex_0279 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0280
     * @tc.name      SearchComponent_NextClassifyIndex_0280
     * @tc.desc      nextClassifyIndex(current=3599000, index=15) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0280 begin`);
      const actual: number = nextClassifyIndex(3599000, 15);
      logInfo(`nextClassifyIndex(current=3599000, index=15): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}NextClassifyIndex_0280 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0281
     * @tc.name      SearchComponent_NextClassifyIndex_0281
     * @tc.desc      nextClassifyIndex(current=3599000, index=20) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0281 begin`);
      const actual: number = nextClassifyIndex(3599000, 20);
      logInfo(`nextClassifyIndex(current=3599000, index=20): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}NextClassifyIndex_0281 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0282
     * @tc.name      SearchComponent_NextClassifyIndex_0282
     * @tc.desc      nextClassifyIndex(current=3599000, index=25) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0282 begin`);
      const actual: number = nextClassifyIndex(3599000, 25);
      logInfo(`nextClassifyIndex(current=3599000, index=25): actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}NextClassifyIndex_0282 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0283
     * @tc.name      SearchComponent_NextClassifyIndex_0283
     * @tc.desc      nextClassifyIndex(current=3599000, index=30) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0283 begin`);
      const actual: number = nextClassifyIndex(3599000, 30);
      logInfo(`nextClassifyIndex(current=3599000, index=30): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}NextClassifyIndex_0283 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0284
     * @tc.name      SearchComponent_NextClassifyIndex_0284
     * @tc.desc      nextClassifyIndex(current=3599000, index=35) returns 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0284 begin`);
      const actual: number = nextClassifyIndex(3599000, 35);
      logInfo(`nextClassifyIndex(current=3599000, index=35): actual=${actual}`);
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}NextClassifyIndex_0284 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0285
     * @tc.name      SearchComponent_NextClassifyIndex_0285
     * @tc.desc      nextClassifyIndex(current=3599000, index=40) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0285 begin`);
      const actual: number = nextClassifyIndex(3599000, 40);
      logInfo(`nextClassifyIndex(current=3599000, index=40): actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}NextClassifyIndex_0285 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0286
     * @tc.name      SearchComponent_NextClassifyIndex_0286
     * @tc.desc      nextClassifyIndex(current=3599000, index=45) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0286 begin`);
      const actual: number = nextClassifyIndex(3599000, 45);
      logInfo(`nextClassifyIndex(current=3599000, index=45): actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}NextClassifyIndex_0286 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0287
     * @tc.name      SearchComponent_NextClassifyIndex_0287
     * @tc.desc      nextClassifyIndex(current=3599000, index=50) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0287 begin`);
      const actual: number = nextClassifyIndex(3599000, 50);
      logInfo(`nextClassifyIndex(current=3599000, index=50): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}NextClassifyIndex_0287 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0288
     * @tc.name      SearchComponent_NextClassifyIndex_0288
     * @tc.desc      nextClassifyIndex(current=3599000, index=55) returns 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0288 begin`);
      const actual: number = nextClassifyIndex(3599000, 55);
      logInfo(`nextClassifyIndex(current=3599000, index=55): actual=${actual}`);
      expect(actual).assertEqual(55);
      logInfo(`${BUNDLE}NextClassifyIndex_0288 end`);
    });
  });
}
