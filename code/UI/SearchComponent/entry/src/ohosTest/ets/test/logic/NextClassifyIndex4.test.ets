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

/** Logic checks for nextClassifyIndex (61 cases). */
export default function nextClassifyIndex4Test(): void {
  describe('NextClassifyIndex4Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0289
     * @tc.name      SearchComponent_NextClassifyIndex_0289
     * @tc.desc      nextClassifyIndex(current=3599000, index=60) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0289 begin`);
      const actual: number = nextClassifyIndex(3599000, 60);
      logInfo(`nextClassifyIndex(current=3599000, index=60): actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}NextClassifyIndex_0289 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0290
     * @tc.name      SearchComponent_NextClassifyIndex_0290
     * @tc.desc      nextClassifyIndex(current=3599000, index=65) returns 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0290 begin`);
      const actual: number = nextClassifyIndex(3599000, 65);
      logInfo(`nextClassifyIndex(current=3599000, index=65): actual=${actual}`);
      expect(actual).assertEqual(65);
      logInfo(`${BUNDLE}NextClassifyIndex_0290 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0291
     * @tc.name      SearchComponent_NextClassifyIndex_0291
     * @tc.desc      nextClassifyIndex(current=3599000, index=70) returns 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0291 begin`);
      const actual: number = nextClassifyIndex(3599000, 70);
      logInfo(`nextClassifyIndex(current=3599000, index=70): actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}NextClassifyIndex_0291 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0292
     * @tc.name      SearchComponent_NextClassifyIndex_0292
     * @tc.desc      nextClassifyIndex(current=3599000, index=75) returns 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0292 begin`);
      const actual: number = nextClassifyIndex(3599000, 75);
      logInfo(`nextClassifyIndex(current=3599000, index=75): actual=${actual}`);
      expect(actual).assertEqual(75);
      logInfo(`${BUNDLE}NextClassifyIndex_0292 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0293
     * @tc.name      SearchComponent_NextClassifyIndex_0293
     * @tc.desc      nextClassifyIndex(current=3599000, index=80) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0293 begin`);
      const actual: number = nextClassifyIndex(3599000, 80);
      logInfo(`nextClassifyIndex(current=3599000, index=80): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}NextClassifyIndex_0293 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0294
     * @tc.name      SearchComponent_NextClassifyIndex_0294
     * @tc.desc      nextClassifyIndex(current=3599000, index=85) returns 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0294 begin`);
      const actual: number = nextClassifyIndex(3599000, 85);
      logInfo(`nextClassifyIndex(current=3599000, index=85): actual=${actual}`);
      expect(actual).assertEqual(85);
      logInfo(`${BUNDLE}NextClassifyIndex_0294 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0295
     * @tc.name      SearchComponent_NextClassifyIndex_0295
     * @tc.desc      nextClassifyIndex(current=3599000, index=90) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0295 begin`);
      const actual: number = nextClassifyIndex(3599000, 90);
      logInfo(`nextClassifyIndex(current=3599000, index=90): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}NextClassifyIndex_0295 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0296
     * @tc.name      SearchComponent_NextClassifyIndex_0296
     * @tc.desc      nextClassifyIndex(current=3599000, index=95) returns 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0296 begin`);
      const actual: number = nextClassifyIndex(3599000, 95);
      logInfo(`nextClassifyIndex(current=3599000, index=95): actual=${actual}`);
      expect(actual).assertEqual(95);
      logInfo(`${BUNDLE}NextClassifyIndex_0296 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0297
     * @tc.name      SearchComponent_NextClassifyIndex_0297
     * @tc.desc      nextClassifyIndex(current=3599000, index=105) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0297 begin`);
      const actual: number = nextClassifyIndex(3599000, 105);
      logInfo(`nextClassifyIndex(current=3599000, index=...: actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}NextClassifyIndex_0297 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0298
     * @tc.name      SearchComponent_NextClassifyIndex_0298
     * @tc.desc      nextClassifyIndex(current=3599000, index=-45) returns -45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_NextClassifyIndex_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0298 begin`);
      const actual: number = nextClassifyIndex(3599000, -45);
      logInfo(`nextClassifyIndex(current=3599000, index=...: actual=${actual}`);
      expect(actual).assertEqual(-45);
      logInfo(`${BUNDLE}NextClassifyIndex_0298 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0299
     * @tc.name      SearchComponent_NextClassifyIndex_0299
     * @tc.desc      nextClassifyIndex(current=3599000, index=-77) returns -77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_NextClassifyIndex_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0299 begin`);
      const actual: number = nextClassifyIndex(3599000, -77);
      logInfo(`nextClassifyIndex(current=3599000, index=...: actual=${actual}`);
      expect(actual).assertEqual(-77);
      logInfo(`${BUNDLE}NextClassifyIndex_0299 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0300
     * @tc.name      SearchComponent_NextClassifyIndex_0300
     * @tc.desc      nextClassifyIndex(current=3599000, index=109) returns 109
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0300 begin`);
      const actual: number = nextClassifyIndex(3599000, 109);
      logInfo(`nextClassifyIndex(current=3599000, index=...: actual=${actual}`);
      expect(actual).assertEqual(109);
      logInfo(`${BUNDLE}NextClassifyIndex_0300 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0301
     * @tc.name      SearchComponent_NextClassifyIndex_0301
     * @tc.desc      nextClassifyIndex(current=3600000, index=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0301 begin`);
      const actual: number = nextClassifyIndex(3600000, 0);
      logInfo(`nextClassifyIndex(current=3600000, index=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NextClassifyIndex_0301 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0302
     * @tc.name      SearchComponent_NextClassifyIndex_0302
     * @tc.desc      nextClassifyIndex(current=3600000, index=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0302 begin`);
      const actual: number = nextClassifyIndex(3600000, 1);
      logInfo(`nextClassifyIndex(current=3600000, index=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextClassifyIndex_0302 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0303
     * @tc.name      SearchComponent_NextClassifyIndex_0303
     * @tc.desc      nextClassifyIndex(current=3600000, index=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0303 begin`);
      const actual: number = nextClassifyIndex(3600000, -1);
      logInfo(`nextClassifyIndex(current=3600000, index=-1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}NextClassifyIndex_0303 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0304
     * @tc.name      SearchComponent_NextClassifyIndex_0304
     * @tc.desc      nextClassifyIndex(current=3600000, index=-2) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0304 begin`);
      const actual: number = nextClassifyIndex(3600000, -2);
      logInfo(`nextClassifyIndex(current=3600000, index=-2): actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}NextClassifyIndex_0304 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0305
     * @tc.name      SearchComponent_NextClassifyIndex_0305
     * @tc.desc      nextClassifyIndex(current=3600000, index=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0305 begin`);
      const actual: number = nextClassifyIndex(3600000, 2);
      logInfo(`nextClassifyIndex(current=3600000, index=2): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}NextClassifyIndex_0305 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0306
     * @tc.name      SearchComponent_NextClassifyIndex_0306
     * @tc.desc      nextClassifyIndex(current=3600000, index=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0306 begin`);
      const actual: number = nextClassifyIndex(3600000, 5);
      logInfo(`nextClassifyIndex(current=3600000, index=5): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}NextClassifyIndex_0306 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0307
     * @tc.name      SearchComponent_NextClassifyIndex_0307
     * @tc.desc      nextClassifyIndex(current=3600000, index=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0307 begin`);
      const actual: number = nextClassifyIndex(3600000, 10);
      logInfo(`nextClassifyIndex(current=3600000, index=10): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}NextClassifyIndex_0307 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0308
     * @tc.name      SearchComponent_NextClassifyIndex_0308
     * @tc.desc      nextClassifyIndex(current=3600000, index=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0308 begin`);
      const actual: number = nextClassifyIndex(3600000, 3);
      logInfo(`nextClassifyIndex(current=3600000, index=3): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}NextClassifyIndex_0308 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0309
     * @tc.name      SearchComponent_NextClassifyIndex_0309
     * @tc.desc      nextClassifyIndex(current=3600000, index=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0309 begin`);
      const actual: number = nextClassifyIndex(3600000, 100);
      logInfo(`nextClassifyIndex(current=3600000, index=...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}NextClassifyIndex_0309 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0310
     * @tc.name      SearchComponent_NextClassifyIndex_0310
     * @tc.desc      nextClassifyIndex(current=3600000, index=15) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0310 begin`);
      const actual: number = nextClassifyIndex(3600000, 15);
      logInfo(`nextClassifyIndex(current=3600000, index=15): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}NextClassifyIndex_0310 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0311
     * @tc.name      SearchComponent_NextClassifyIndex_0311
     * @tc.desc      nextClassifyIndex(current=3600000, index=20) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0311 begin`);
      const actual: number = nextClassifyIndex(3600000, 20);
      logInfo(`nextClassifyIndex(current=3600000, index=20): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}NextClassifyIndex_0311 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0312
     * @tc.name      SearchComponent_NextClassifyIndex_0312
     * @tc.desc      nextClassifyIndex(current=3600000, index=25) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0312 begin`);
      const actual: number = nextClassifyIndex(3600000, 25);
      logInfo(`nextClassifyIndex(current=3600000, index=25): actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}NextClassifyIndex_0312 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0313
     * @tc.name      SearchComponent_NextClassifyIndex_0313
     * @tc.desc      nextClassifyIndex(current=3600000, index=30) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0313 begin`);
      const actual: number = nextClassifyIndex(3600000, 30);
      logInfo(`nextClassifyIndex(current=3600000, index=30): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}NextClassifyIndex_0313 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0314
     * @tc.name      SearchComponent_NextClassifyIndex_0314
     * @tc.desc      nextClassifyIndex(current=3600000, index=35) returns 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0314 begin`);
      const actual: number = nextClassifyIndex(3600000, 35);
      logInfo(`nextClassifyIndex(current=3600000, index=35): actual=${actual}`);
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}NextClassifyIndex_0314 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0315
     * @tc.name      SearchComponent_NextClassifyIndex_0315
     * @tc.desc      nextClassifyIndex(current=3600000, index=40) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0315 begin`);
      const actual: number = nextClassifyIndex(3600000, 40);
      logInfo(`nextClassifyIndex(current=3600000, index=40): actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}NextClassifyIndex_0315 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0316
     * @tc.name      SearchComponent_NextClassifyIndex_0316
     * @tc.desc      nextClassifyIndex(current=3600000, index=45) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0316 begin`);
      const actual: number = nextClassifyIndex(3600000, 45);
      logInfo(`nextClassifyIndex(current=3600000, index=45): actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}NextClassifyIndex_0316 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0317
     * @tc.name      SearchComponent_NextClassifyIndex_0317
     * @tc.desc      nextClassifyIndex(current=3600000, index=50) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0317 begin`);
      const actual: number = nextClassifyIndex(3600000, 50);
      logInfo(`nextClassifyIndex(current=3600000, index=50): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}NextClassifyIndex_0317 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0318
     * @tc.name      SearchComponent_NextClassifyIndex_0318
     * @tc.desc      nextClassifyIndex(current=3600000, index=55) returns 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0318 begin`);
      const actual: number = nextClassifyIndex(3600000, 55);
      logInfo(`nextClassifyIndex(current=3600000, index=55): actual=${actual}`);
      expect(actual).assertEqual(55);
      logInfo(`${BUNDLE}NextClassifyIndex_0318 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0319
     * @tc.name      SearchComponent_NextClassifyIndex_0319
     * @tc.desc      nextClassifyIndex(current=3600000, index=60) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0319 begin`);
      const actual: number = nextClassifyIndex(3600000, 60);
      logInfo(`nextClassifyIndex(current=3600000, index=60): actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}NextClassifyIndex_0319 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0320
     * @tc.name      SearchComponent_NextClassifyIndex_0320
     * @tc.desc      nextClassifyIndex(current=3600000, index=65) returns 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0320 begin`);
      const actual: number = nextClassifyIndex(3600000, 65);
      logInfo(`nextClassifyIndex(current=3600000, index=65): actual=${actual}`);
      expect(actual).assertEqual(65);
      logInfo(`${BUNDLE}NextClassifyIndex_0320 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0321
     * @tc.name      SearchComponent_NextClassifyIndex_0321
     * @tc.desc      nextClassifyIndex(current=3600000, index=70) returns 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0321 begin`);
      const actual: number = nextClassifyIndex(3600000, 70);
      logInfo(`nextClassifyIndex(current=3600000, index=70): actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}NextClassifyIndex_0321 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0322
     * @tc.name      SearchComponent_NextClassifyIndex_0322
     * @tc.desc      nextClassifyIndex(current=3600000, index=75) returns 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0322 begin`);
      const actual: number = nextClassifyIndex(3600000, 75);
      logInfo(`nextClassifyIndex(current=3600000, index=75): actual=${actual}`);
      expect(actual).assertEqual(75);
      logInfo(`${BUNDLE}NextClassifyIndex_0322 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0323
     * @tc.name      SearchComponent_NextClassifyIndex_0323
     * @tc.desc      nextClassifyIndex(current=3600000, index=80) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0323 begin`);
      const actual: number = nextClassifyIndex(3600000, 80);
      logInfo(`nextClassifyIndex(current=3600000, index=80): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}NextClassifyIndex_0323 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0324
     * @tc.name      SearchComponent_NextClassifyIndex_0324
     * @tc.desc      nextClassifyIndex(current=3600000, index=85) returns 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0324 begin`);
      const actual: number = nextClassifyIndex(3600000, 85);
      logInfo(`nextClassifyIndex(current=3600000, index=85): actual=${actual}`);
      expect(actual).assertEqual(85);
      logInfo(`${BUNDLE}NextClassifyIndex_0324 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0325
     * @tc.name      SearchComponent_NextClassifyIndex_0325
     * @tc.desc      nextClassifyIndex(current=3600000, index=90) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0325 begin`);
      const actual: number = nextClassifyIndex(3600000, 90);
      logInfo(`nextClassifyIndex(current=3600000, index=90): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}NextClassifyIndex_0325 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0326
     * @tc.name      SearchComponent_NextClassifyIndex_0326
     * @tc.desc      nextClassifyIndex(current=3600000, index=95) returns 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0326 begin`);
      const actual: number = nextClassifyIndex(3600000, 95);
      logInfo(`nextClassifyIndex(current=3600000, index=95): actual=${actual}`);
      expect(actual).assertEqual(95);
      logInfo(`${BUNDLE}NextClassifyIndex_0326 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0327
     * @tc.name      SearchComponent_NextClassifyIndex_0327
     * @tc.desc      nextClassifyIndex(current=3600000, index=105) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0327 begin`);
      const actual: number = nextClassifyIndex(3600000, 105);
      logInfo(`nextClassifyIndex(current=3600000, index=...: actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}NextClassifyIndex_0327 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0328
     * @tc.name      SearchComponent_NextClassifyIndex_0328
     * @tc.desc      nextClassifyIndex(current=3600000, index=-45) returns -45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_NextClassifyIndex_0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0328 begin`);
      const actual: number = nextClassifyIndex(3600000, -45);
      logInfo(`nextClassifyIndex(current=3600000, index=...: actual=${actual}`);
      expect(actual).assertEqual(-45);
      logInfo(`${BUNDLE}NextClassifyIndex_0328 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0329
     * @tc.name      SearchComponent_NextClassifyIndex_0329
     * @tc.desc      nextClassifyIndex(current=3600000, index=-77) returns -77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_NextClassifyIndex_0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0329 begin`);
      const actual: number = nextClassifyIndex(3600000, -77);
      logInfo(`nextClassifyIndex(current=3600000, index=...: actual=${actual}`);
      expect(actual).assertEqual(-77);
      logInfo(`${BUNDLE}NextClassifyIndex_0329 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0330
     * @tc.name      SearchComponent_NextClassifyIndex_0330
     * @tc.desc      nextClassifyIndex(current=3600000, index=109) returns 109
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0330 begin`);
      const actual: number = nextClassifyIndex(3600000, 109);
      logInfo(`nextClassifyIndex(current=3600000, index=...: actual=${actual}`);
      expect(actual).assertEqual(109);
      logInfo(`${BUNDLE}NextClassifyIndex_0330 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0331
     * @tc.name      SearchComponent_NextClassifyIndex_0331
     * @tc.desc      nextClassifyIndex(current=1, index=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0331 begin`);
      const actual: number = nextClassifyIndex(1, 0);
      logInfo(`nextClassifyIndex(current=1, index=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NextClassifyIndex_0331 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0332
     * @tc.name      SearchComponent_NextClassifyIndex_0332
     * @tc.desc      nextClassifyIndex(current=1, index=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0332 begin`);
      const actual: number = nextClassifyIndex(1, 1);
      logInfo(`nextClassifyIndex(current=1, index=1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}NextClassifyIndex_0332 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0333
     * @tc.name      SearchComponent_NextClassifyIndex_0333
     * @tc.desc      nextClassifyIndex(current=1, index=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0333 begin`);
      const actual: number = nextClassifyIndex(1, -1);
      logInfo(`nextClassifyIndex(current=1, index=-1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}NextClassifyIndex_0333 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0334
     * @tc.name      SearchComponent_NextClassifyIndex_0334
     * @tc.desc      nextClassifyIndex(current=1, index=-2) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0334 begin`);
      const actual: number = nextClassifyIndex(1, -2);
      logInfo(`nextClassifyIndex(current=1, index=-2): actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}NextClassifyIndex_0334 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0335
     * @tc.name      SearchComponent_NextClassifyIndex_0335
     * @tc.desc      nextClassifyIndex(current=1, index=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0335 begin`);
      const actual: number = nextClassifyIndex(1, 2);
      logInfo(`nextClassifyIndex(current=1, index=2): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}NextClassifyIndex_0335 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0336
     * @tc.name      SearchComponent_NextClassifyIndex_0336
     * @tc.desc      nextClassifyIndex(current=1, index=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0336 begin`);
      const actual: number = nextClassifyIndex(1, 5);
      logInfo(`nextClassifyIndex(current=1, index=5): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}NextClassifyIndex_0336 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0337
     * @tc.name      SearchComponent_NextClassifyIndex_0337
     * @tc.desc      nextClassifyIndex(current=1, index=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0337 begin`);
      const actual: number = nextClassifyIndex(1, 10);
      logInfo(`nextClassifyIndex(current=1, index=10): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}NextClassifyIndex_0337 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0338
     * @tc.name      SearchComponent_NextClassifyIndex_0338
     * @tc.desc      nextClassifyIndex(current=1, index=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0338 begin`);
      const actual: number = nextClassifyIndex(1, 3);
      logInfo(`nextClassifyIndex(current=1, index=3): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}NextClassifyIndex_0338 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0339
     * @tc.name      SearchComponent_NextClassifyIndex_0339
     * @tc.desc      nextClassifyIndex(current=1, index=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0339 begin`);
      const actual: number = nextClassifyIndex(1, 100);
      logInfo(`nextClassifyIndex(current=1, index=100): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}NextClassifyIndex_0339 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0340
     * @tc.name      SearchComponent_NextClassifyIndex_0340
     * @tc.desc      nextClassifyIndex(current=1, index=15) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0340 begin`);
      const actual: number = nextClassifyIndex(1, 15);
      logInfo(`nextClassifyIndex(current=1, index=15): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}NextClassifyIndex_0340 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0341
     * @tc.name      SearchComponent_NextClassifyIndex_0341
     * @tc.desc      nextClassifyIndex(current=1, index=20) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0341 begin`);
      const actual: number = nextClassifyIndex(1, 20);
      logInfo(`nextClassifyIndex(current=1, index=20): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}NextClassifyIndex_0341 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0342
     * @tc.name      SearchComponent_NextClassifyIndex_0342
     * @tc.desc      nextClassifyIndex(current=1, index=25) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0342 begin`);
      const actual: number = nextClassifyIndex(1, 25);
      logInfo(`nextClassifyIndex(current=1, index=25): actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}NextClassifyIndex_0342 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0343
     * @tc.name      SearchComponent_NextClassifyIndex_0343
     * @tc.desc      nextClassifyIndex(current=1, index=30) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0343 begin`);
      const actual: number = nextClassifyIndex(1, 30);
      logInfo(`nextClassifyIndex(current=1, index=30): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}NextClassifyIndex_0343 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0344
     * @tc.name      SearchComponent_NextClassifyIndex_0344
     * @tc.desc      nextClassifyIndex(current=1, index=35) returns 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0344 begin`);
      const actual: number = nextClassifyIndex(1, 35);
      logInfo(`nextClassifyIndex(current=1, index=35): actual=${actual}`);
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}NextClassifyIndex_0344 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0345
     * @tc.name      SearchComponent_NextClassifyIndex_0345
     * @tc.desc      nextClassifyIndex(current=1, index=40) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0345 begin`);
      const actual: number = nextClassifyIndex(1, 40);
      logInfo(`nextClassifyIndex(current=1, index=40): actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}NextClassifyIndex_0345 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0346
     * @tc.name      SearchComponent_NextClassifyIndex_0346
     * @tc.desc      nextClassifyIndex(current=1, index=45) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0346 begin`);
      const actual: number = nextClassifyIndex(1, 45);
      logInfo(`nextClassifyIndex(current=1, index=45): actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}NextClassifyIndex_0346 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0347
     * @tc.name      SearchComponent_NextClassifyIndex_0347
     * @tc.desc      nextClassifyIndex(current=1, index=50) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0347 begin`);
      const actual: number = nextClassifyIndex(1, 50);
      logInfo(`nextClassifyIndex(current=1, index=50): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}NextClassifyIndex_0347 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0348
     * @tc.name      SearchComponent_NextClassifyIndex_0348
     * @tc.desc      nextClassifyIndex(current=1, index=55) returns 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0348 begin`);
      const actual: number = nextClassifyIndex(1, 55);
      logInfo(`nextClassifyIndex(current=1, index=55): actual=${actual}`);
      expect(actual).assertEqual(55);
      logInfo(`${BUNDLE}NextClassifyIndex_0348 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0349
     * @tc.name      SearchComponent_NextClassifyIndex_0349
     * @tc.desc      nextClassifyIndex(current=1, index=60) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0349 begin`);
      const actual: number = nextClassifyIndex(1, 60);
      logInfo(`nextClassifyIndex(current=1, index=60): actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}NextClassifyIndex_0349 end`);
    });
  });
}
