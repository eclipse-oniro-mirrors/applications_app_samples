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
import { yieldToEventLoop } from '../YieldToEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { remainingAfter } from '../model/AdvertisingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowStartIcon]';
const BUNDLE: string = 'WindowStartIcon_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for remainingAfter (96 cases). */
export default function remainingAfter4Test(): void {
  describe('RemainingAfter4Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0289
     * @tc.name      WindowStartIcon_RemainingAfter_0289
     * @tc.desc      remainingAfter(ticks=-10, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0289 begin`);
      const actual: number = remainingAfter(-10, 0);
      logInfo(`remainingAfter(ticks=-10, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0289 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0290
     * @tc.name      WindowStartIcon_RemainingAfter_0290
     * @tc.desc      remainingAfter(ticks=58.09, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0290 begin`);
      const actual: number = remainingAfter(58.09, 0);
      logInfo(`remainingAfter(ticks=58.09, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0290 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0291
     * @tc.name      WindowStartIcon_RemainingAfter_0291
     * @tc.desc      remainingAfter(ticks=80.32, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0291 begin`);
      const actual: number = remainingAfter(80.32, 0);
      logInfo(`remainingAfter(ticks=80.32, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0291 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0292
     * @tc.name      WindowStartIcon_RemainingAfter_0292
     * @tc.desc      remainingAfter(ticks=142, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0292 begin`);
      const actual: number = remainingAfter(142, 0);
      logInfo(`remainingAfter(ticks=142, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0292 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0293
     * @tc.name      WindowStartIcon_RemainingAfter_0293
     * @tc.desc      remainingAfter(ticks=97, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0293 begin`);
      const actual: number = remainingAfter(97, 0);
      logInfo(`remainingAfter(ticks=97, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0293 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0294
     * @tc.name      WindowStartIcon_RemainingAfter_0294
     * @tc.desc      remainingAfter(ticks=-81, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0294 begin`);
      const actual: number = remainingAfter(-81, 0);
      logInfo(`remainingAfter(ticks=-81, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0294 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0295
     * @tc.name      WindowStartIcon_RemainingAfter_0295
     * @tc.desc      remainingAfter(ticks=50.37, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0295 begin`);
      const actual: number = remainingAfter(50.37, 0);
      logInfo(`remainingAfter(ticks=50.37, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0295 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0296
     * @tc.name      WindowStartIcon_RemainingAfter_0296
     * @tc.desc      remainingAfter(ticks=191, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0296 begin`);
      const actual: number = remainingAfter(191, 0);
      logInfo(`remainingAfter(ticks=191, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0296 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0297
     * @tc.name      WindowStartIcon_RemainingAfter_0297
     * @tc.desc      remainingAfter(ticks=21, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0297 begin`);
      const actual: number = remainingAfter(21, 0);
      logInfo(`remainingAfter(ticks=21, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0297 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0298
     * @tc.name      WindowStartIcon_RemainingAfter_0298
     * @tc.desc      remainingAfter(ticks=44, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0298 begin`);
      const actual: number = remainingAfter(44, 0);
      logInfo(`remainingAfter(ticks=44, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0298 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0299
     * @tc.name      WindowStartIcon_RemainingAfter_0299
     * @tc.desc      remainingAfter(ticks=-1, initial=45) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0299 begin`);
      const actual: number = remainingAfter(-1, 45);
      logInfo(`remainingAfter(ticks=-1, initial=45): actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}RemainingAfter_0299 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0300
     * @tc.name      WindowStartIcon_RemainingAfter_0300
     * @tc.desc      remainingAfter(ticks=175, initial=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0300 begin`);
      const actual: number = remainingAfter(175, 3);
      logInfo(`remainingAfter(ticks=175, initial=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0300 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0301
     * @tc.name      WindowStartIcon_RemainingAfter_0301
     * @tc.desc      remainingAfter(ticks=30, initial=20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0301 begin`);
      const actual: number = remainingAfter(30, 20);
      logInfo(`remainingAfter(ticks=30, initial=20): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0301 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0302
     * @tc.name      WindowStartIcon_RemainingAfter_0302
     * @tc.desc      remainingAfter(ticks=60, initial=90) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0302 begin`);
      const actual: number = remainingAfter(60, 90);
      logInfo(`remainingAfter(ticks=60, initial=90): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}RemainingAfter_0302 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0303
     * @tc.name      WindowStartIcon_RemainingAfter_0303
     * @tc.desc      remainingAfter(ticks=125, initial=160) returns 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0303 begin`);
      const actual: number = remainingAfter(125, 160);
      logInfo(`remainingAfter(ticks=125, initial=160): actual=${actual}`);
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}RemainingAfter_0303 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0304
     * @tc.name      WindowStartIcon_RemainingAfter_0304
     * @tc.desc      remainingAfter(ticks=150, initial=180) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0304 begin`);
      const actual: number = remainingAfter(150, 180);
      logInfo(`remainingAfter(ticks=150, initial=180): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}RemainingAfter_0304 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0305
     * @tc.name      WindowStartIcon_RemainingAfter_0305
     * @tc.desc      remainingAfter(ticks=170, initial=115) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0305 begin`);
      const actual: number = remainingAfter(170, 115);
      logInfo(`remainingAfter(ticks=170, initial=115): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0305 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0306
     * @tc.name      WindowStartIcon_RemainingAfter_0306
     * @tc.desc      remainingAfter(ticks=150, initial=120) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0306 begin`);
      const actual: number = remainingAfter(150, 120);
      logInfo(`remainingAfter(ticks=150, initial=120): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0306 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0307
     * @tc.name      WindowStartIcon_RemainingAfter_0307
     * @tc.desc      remainingAfter(ticks=65, initial=50) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0307 begin`);
      const actual: number = remainingAfter(65, 50);
      logInfo(`remainingAfter(ticks=65, initial=50): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0307 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0308
     * @tc.name      WindowStartIcon_RemainingAfter_0308
     * @tc.desc      remainingAfter(ticks=70, initial=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0308 begin`);
      const actual: number = remainingAfter(70, 3);
      logInfo(`remainingAfter(ticks=70, initial=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0308 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0309
     * @tc.name      WindowStartIcon_RemainingAfter_0309
     * @tc.desc      remainingAfter(ticks=45, initial=25) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0309 begin`);
      const actual: number = remainingAfter(45, 25);
      logInfo(`remainingAfter(ticks=45, initial=25): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0309 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0310
     * @tc.name      WindowStartIcon_RemainingAfter_0310
     * @tc.desc      remainingAfter(ticks=100, initial=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0310 begin`);
      const actual: number = remainingAfter(100, -1);
      logInfo(`remainingAfter(ticks=100, initial=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0310 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0311
     * @tc.name      WindowStartIcon_RemainingAfter_0311
     * @tc.desc      remainingAfter(ticks=180, initial=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0311 begin`);
      const actual: number = remainingAfter(180, 5);
      logInfo(`remainingAfter(ticks=180, initial=5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0311 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0312
     * @tc.name      WindowStartIcon_RemainingAfter_0312
     * @tc.desc      remainingAfter(ticks=160, initial=110) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0312 begin`);
      const actual: number = remainingAfter(160, 110);
      logInfo(`remainingAfter(ticks=160, initial=110): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0312 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0313
     * @tc.name      WindowStartIcon_RemainingAfter_0313
     * @tc.desc      remainingAfter(ticks=199, initial=61) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0313 begin`);
      const actual: number = remainingAfter(199, 61);
      logInfo(`remainingAfter(ticks=199, initial=61): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0313 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0314
     * @tc.name      WindowStartIcon_RemainingAfter_0314
     * @tc.desc      remainingAfter(ticks=162, initial=35) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0314 begin`);
      const actual: number = remainingAfter(162, 35);
      logInfo(`remainingAfter(ticks=162, initial=35): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0314 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0315
     * @tc.name      WindowStartIcon_RemainingAfter_0315
     * @tc.desc      remainingAfter(ticks=85, initial=175) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0315 begin`);
      const actual: number = remainingAfter(85, 175);
      logInfo(`remainingAfter(ticks=85, initial=175): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}RemainingAfter_0315 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0316
     * @tc.name      WindowStartIcon_RemainingAfter_0316
     * @tc.desc      remainingAfter(ticks=-5, initial=105) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0316 begin`);
      const actual: number = remainingAfter(-5, 105);
      logInfo(`remainingAfter(ticks=-5, initial=105): actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}RemainingAfter_0316 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0317
     * @tc.name      WindowStartIcon_RemainingAfter_0317
     * @tc.desc      remainingAfter(ticks=145, initial=-26) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0317 begin`);
      const actual: number = remainingAfter(145, -26);
      logInfo(`remainingAfter(ticks=145, initial=-26): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0317 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0318
     * @tc.name      WindowStartIcon_RemainingAfter_0318
     * @tc.desc      remainingAfter(ticks=175, initial=145) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0318 begin`);
      const actual: number = remainingAfter(175, 145);
      logInfo(`remainingAfter(ticks=175, initial=145): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0318 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0319
     * @tc.name      WindowStartIcon_RemainingAfter_0319
     * @tc.desc      remainingAfter(ticks=175, initial=85) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0319 begin`);
      const actual: number = remainingAfter(175, 85);
      logInfo(`remainingAfter(ticks=175, initial=85): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0319 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0320
     * @tc.name      WindowStartIcon_RemainingAfter_0320
     * @tc.desc      remainingAfter(ticks=55, initial=80) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0320 begin`);
      const actual: number = remainingAfter(55, 80);
      logInfo(`remainingAfter(ticks=55, initial=80): actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}RemainingAfter_0320 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0321
     * @tc.name      WindowStartIcon_RemainingAfter_0321
     * @tc.desc      remainingAfter(ticks=200, initial=165) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0321 begin`);
      const actual: number = remainingAfter(200, 165);
      logInfo(`remainingAfter(ticks=200, initial=165): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0321 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0322
     * @tc.name      WindowStartIcon_RemainingAfter_0322
     * @tc.desc      remainingAfter(ticks=70, initial=67.03) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0322 begin`);
      const actual: number = remainingAfter(70, 67.03);
      logInfo(`remainingAfter(ticks=70, initial=67.03): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0322 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0323
     * @tc.name      WindowStartIcon_RemainingAfter_0323
     * @tc.desc      remainingAfter(ticks=110, initial=85) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0323 begin`);
      const actual: number = remainingAfter(110, 85);
      logInfo(`remainingAfter(ticks=110, initial=85): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0323 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0324
     * @tc.name      WindowStartIcon_RemainingAfter_0324
     * @tc.desc      remainingAfter(ticks=145, initial=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0324 begin`);
      const actual: number = remainingAfter(145, 5);
      logInfo(`remainingAfter(ticks=145, initial=5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0324 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0325
     * @tc.name      WindowStartIcon_RemainingAfter_0325
     * @tc.desc      remainingAfter(ticks=20, initial=45) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0325 begin`);
      const actual: number = remainingAfter(20, 45);
      logInfo(`remainingAfter(ticks=20, initial=45): actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}RemainingAfter_0325 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0326
     * @tc.name      WindowStartIcon_RemainingAfter_0326
     * @tc.desc      remainingAfter(ticks=140, initial=105) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0326 begin`);
      const actual: number = remainingAfter(140, 105);
      logInfo(`remainingAfter(ticks=140, initial=105): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0326 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0327
     * @tc.name      WindowStartIcon_RemainingAfter_0327
     * @tc.desc      remainingAfter(ticks=115, initial=70) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0327 begin`);
      const actual: number = remainingAfter(115, 70);
      logInfo(`remainingAfter(ticks=115, initial=70): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0327 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0328
     * @tc.name      WindowStartIcon_RemainingAfter_0328
     * @tc.desc      remainingAfter(ticks=25, initial=145) returns 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0328 begin`);
      const actual: number = remainingAfter(25, 145);
      logInfo(`remainingAfter(ticks=25, initial=145): actual=${actual}`);
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}RemainingAfter_0328 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0329
     * @tc.name      WindowStartIcon_RemainingAfter_0329
     * @tc.desc      remainingAfter(ticks=-1, initial=120) returns 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0329 begin`);
      const actual: number = remainingAfter(-1, 120);
      logInfo(`remainingAfter(ticks=-1, initial=120): actual=${actual}`);
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}RemainingAfter_0329 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0330
     * @tc.name      WindowStartIcon_RemainingAfter_0330
     * @tc.desc      remainingAfter(ticks=15, initial=170) returns 155
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0330 begin`);
      const actual: number = remainingAfter(15, 170);
      logInfo(`remainingAfter(ticks=15, initial=170): actual=${actual}`);
      expect(actual).assertEqual(155);
      logInfo(`${BUNDLE}RemainingAfter_0330 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0331
     * @tc.name      WindowStartIcon_RemainingAfter_0331
     * @tc.desc      remainingAfter(ticks=20, initial=120) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0331 begin`);
      const actual: number = remainingAfter(20, 120);
      logInfo(`remainingAfter(ticks=20, initial=120): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}RemainingAfter_0331 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0332
     * @tc.name      WindowStartIcon_RemainingAfter_0332
     * @tc.desc      remainingAfter(ticks=95, initial=20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0332 begin`);
      const actual: number = remainingAfter(95, 20);
      logInfo(`remainingAfter(ticks=95, initial=20): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0332 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0333
     * @tc.name      WindowStartIcon_RemainingAfter_0333
     * @tc.desc      remainingAfter(ticks=55, initial=75) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0333 begin`);
      const actual: number = remainingAfter(55, 75);
      logInfo(`remainingAfter(ticks=55, initial=75): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}RemainingAfter_0333 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0334
     * @tc.name      WindowStartIcon_RemainingAfter_0334
     * @tc.desc      remainingAfter(ticks=180, initial=150) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0334 begin`);
      const actual: number = remainingAfter(180, 150);
      logInfo(`remainingAfter(ticks=180, initial=150): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0334 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0335
     * @tc.name      WindowStartIcon_RemainingAfter_0335
     * @tc.desc      remainingAfter(ticks=-10, initial=15) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0335 begin`);
      const actual: number = remainingAfter(-10, 15);
      logInfo(`remainingAfter(ticks=-10, initial=15): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}RemainingAfter_0335 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0336
     * @tc.name      WindowStartIcon_RemainingAfter_0336
     * @tc.desc      remainingAfter(ticks=190, initial=91) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0336 begin`);
      const actual: number = remainingAfter(190, 91);
      logInfo(`remainingAfter(ticks=190, initial=91): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0336 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0337
     * @tc.name      WindowStartIcon_RemainingAfter_0337
     * @tc.desc      remainingAfter(ticks=-81, initial=-92) returns -92
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0337 begin`);
      const actual: number = remainingAfter(-81, -92);
      logInfo(`remainingAfter(ticks=-81, initial=-92): actual=${actual}`);
      expect(actual).assertEqual(-92);
      logInfo(`${BUNDLE}RemainingAfter_0337 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0338
     * @tc.name      WindowStartIcon_RemainingAfter_0338
     * @tc.desc      remainingAfter(ticks=50, initial=35) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0338 begin`);
      const actual: number = remainingAfter(50, 35);
      logInfo(`remainingAfter(ticks=50, initial=35): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0338 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0339
     * @tc.name      WindowStartIcon_RemainingAfter_0339
     * @tc.desc      remainingAfter(ticks=90, initial=160) returns 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0339 begin`);
      const actual: number = remainingAfter(90, 160);
      logInfo(`remainingAfter(ticks=90, initial=160): actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}RemainingAfter_0339 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0340
     * @tc.name      WindowStartIcon_RemainingAfter_0340
     * @tc.desc      remainingAfter(ticks=130, initial=190) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0340 begin`);
      const actual: number = remainingAfter(130, 190);
      logInfo(`remainingAfter(ticks=130, initial=190): actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}RemainingAfter_0340 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0341
     * @tc.name      WindowStartIcon_RemainingAfter_0341
     * @tc.desc      remainingAfter(ticks=185, initial=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0341 begin`);
      const actual: number = remainingAfter(185, 15);
      logInfo(`remainingAfter(ticks=185, initial=15): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0341 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0342
     * @tc.name      WindowStartIcon_RemainingAfter_0342
     * @tc.desc      remainingAfter(ticks=120, initial=105) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0342 begin`);
      const actual: number = remainingAfter(120, 105);
      logInfo(`remainingAfter(ticks=120, initial=105): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0342 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0343
     * @tc.name      WindowStartIcon_RemainingAfter_0343
     * @tc.desc      remainingAfter(ticks=15, initial=115) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0343 begin`);
      const actual: number = remainingAfter(15, 115);
      logInfo(`remainingAfter(ticks=15, initial=115): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}RemainingAfter_0343 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0344
     * @tc.name      WindowStartIcon_RemainingAfter_0344
     * @tc.desc      remainingAfter(ticks=130, initial=140) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0344 begin`);
      const actual: number = remainingAfter(130, 140);
      logInfo(`remainingAfter(ticks=130, initial=140): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}RemainingAfter_0344 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0345
     * @tc.name      WindowStartIcon_RemainingAfter_0345
     * @tc.desc      remainingAfter(ticks=65, initial=20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0345 begin`);
      const actual: number = remainingAfter(65, 20);
      logInfo(`remainingAfter(ticks=65, initial=20): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0345 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0346
     * @tc.name      WindowStartIcon_RemainingAfter_0346
     * @tc.desc      remainingAfter(ticks=50.37, initial=65) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0346 begin`);
      const actual: number = remainingAfter(50.37, 65);
      logInfo(`remainingAfter(ticks=50.37, initial=65): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}RemainingAfter_0346 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0347
     * @tc.name      WindowStartIcon_RemainingAfter_0347
     * @tc.desc      remainingAfter(ticks=160, initial=75) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0347 begin`);
      const actual: number = remainingAfter(160, 75);
      logInfo(`remainingAfter(ticks=160, initial=75): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0347 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0348
     * @tc.name      WindowStartIcon_RemainingAfter_0348
     * @tc.desc      remainingAfter(ticks=150, initial=175) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0348 begin`);
      const actual: number = remainingAfter(150, 175);
      logInfo(`remainingAfter(ticks=150, initial=175): actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}RemainingAfter_0348 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0349
     * @tc.name      WindowStartIcon_RemainingAfter_0349
     * @tc.desc      remainingAfter(ticks=40, initial=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0349 begin`);
      const actual: number = remainingAfter(40, -1);
      logInfo(`remainingAfter(ticks=40, initial=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0349 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0350
     * @tc.name      WindowStartIcon_RemainingAfter_0350
     * @tc.desc      remainingAfter(ticks=20, initial=75) returns 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0350 begin`);
      const actual: number = remainingAfter(20, 75);
      logInfo(`remainingAfter(ticks=20, initial=75): actual=${actual}`);
      expect(actual).assertEqual(55);
      logInfo(`${BUNDLE}RemainingAfter_0350 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0351
     * @tc.name      WindowStartIcon_RemainingAfter_0351
     * @tc.desc      remainingAfter(ticks=21, initial=91) returns 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0351 begin`);
      const actual: number = remainingAfter(21, 91);
      logInfo(`remainingAfter(ticks=21, initial=91): actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}RemainingAfter_0351 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0352
     * @tc.name      WindowStartIcon_RemainingAfter_0352
     * @tc.desc      remainingAfter(ticks=70, initial=100) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0352 begin`);
      const actual: number = remainingAfter(70, 100);
      logInfo(`remainingAfter(ticks=70, initial=100): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}RemainingAfter_0352 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0353
     * @tc.name      WindowStartIcon_RemainingAfter_0353
     * @tc.desc      remainingAfter(ticks=115, initial=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0353 begin`);
      const actual: number = remainingAfter(115, 5);
      logInfo(`remainingAfter(ticks=115, initial=5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0353 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0354
     * @tc.name      WindowStartIcon_RemainingAfter_0354
     * @tc.desc      remainingAfter(ticks=140, initial=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0354 begin`);
      const actual: number = remainingAfter(140, 3);
      logInfo(`remainingAfter(ticks=140, initial=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0354 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0355
     * @tc.name      WindowStartIcon_RemainingAfter_0355
     * @tc.desc      remainingAfter(ticks=80.32, initial=75.76) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0355 begin`);
      const actual: number = remainingAfter(80.32, 75.76);
      logInfo(`remainingAfter(ticks=80.32, initial=75.76): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0355 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0356
     * @tc.name      WindowStartIcon_RemainingAfter_0356
     * @tc.desc      remainingAfter(ticks=60, initial=95) returns 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0356 begin`);
      const actual: number = remainingAfter(60, 95);
      logInfo(`remainingAfter(ticks=60, initial=95): actual=${actual}`);
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}RemainingAfter_0356 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0357
     * @tc.name      WindowStartIcon_RemainingAfter_0357
     * @tc.desc      remainingAfter(ticks=15, initial=140) returns 125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0357 begin`);
      const actual: number = remainingAfter(15, 140);
      logInfo(`remainingAfter(ticks=15, initial=140): actual=${actual}`);
      expect(actual).assertEqual(125);
      logInfo(`${BUNDLE}RemainingAfter_0357 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0358
     * @tc.name      WindowStartIcon_RemainingAfter_0358
     * @tc.desc      remainingAfter(ticks=-10, initial=67.03) returns 67.03
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0358 begin`);
      const actual: number = remainingAfter(-10, 67.03);
      logInfo(`remainingAfter(ticks=-10, initial=67.03): actual=${actual}`);
      expect(actual).assertClose(67.03, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0358 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0359
     * @tc.name      WindowStartIcon_RemainingAfter_0359
     * @tc.desc      remainingAfter(ticks=200, initial=190) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0359 begin`);
      const actual: number = remainingAfter(200, 190);
      logInfo(`remainingAfter(ticks=200, initial=190): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0359 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0360
     * @tc.name      WindowStartIcon_RemainingAfter_0360
     * @tc.desc      remainingAfter(ticks=15, initial=160) returns 145
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0360 begin`);
      const actual: number = remainingAfter(15, 160);
      logInfo(`remainingAfter(ticks=15, initial=160): actual=${actual}`);
      expect(actual).assertEqual(145);
      logInfo(`${BUNDLE}RemainingAfter_0360 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0361
     * @tc.name      WindowStartIcon_RemainingAfter_0361
     * @tc.desc      remainingAfter(ticks=191, initial=136) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0361 begin`);
      const actual: number = remainingAfter(191, 136);
      logInfo(`remainingAfter(ticks=191, initial=136): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0361 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0362
     * @tc.name      WindowStartIcon_RemainingAfter_0362
     * @tc.desc      remainingAfter(ticks=100, initial=130) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0362 begin`);
      const actual: number = remainingAfter(100, 130);
      logInfo(`remainingAfter(ticks=100, initial=130): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}RemainingAfter_0362 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0363
     * @tc.name      WindowStartIcon_RemainingAfter_0363
     * @tc.desc      remainingAfter(ticks=10, initial=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0363 begin`);
      const actual: number = remainingAfter(10, 10);
      logInfo(`remainingAfter(ticks=10, initial=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0363 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0364
     * @tc.name      WindowStartIcon_RemainingAfter_0364
     * @tc.desc      remainingAfter(ticks=175, initial=155) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0364 begin`);
      const actual: number = remainingAfter(175, 155);
      logInfo(`remainingAfter(ticks=175, initial=155): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0364 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0365
     * @tc.name      WindowStartIcon_RemainingAfter_0365
     * @tc.desc      remainingAfter(ticks=4, initial=5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0365 begin`);
      const actual: number = remainingAfter(4, 5);
      logInfo(`remainingAfter(ticks=4, initial=5): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}RemainingAfter_0365 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0366
     * @tc.name      WindowStartIcon_RemainingAfter_0366
     * @tc.desc      remainingAfter(ticks=65, initial=160) returns 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0366 begin`);
      const actual: number = remainingAfter(65, 160);
      logInfo(`remainingAfter(ticks=65, initial=160): actual=${actual}`);
      expect(actual).assertEqual(95);
      logInfo(`${BUNDLE}RemainingAfter_0366 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0367
     * @tc.name      WindowStartIcon_RemainingAfter_0367
     * @tc.desc      remainingAfter(ticks=125, initial=140) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0367 begin`);
      const actual: number = remainingAfter(125, 140);
      logInfo(`remainingAfter(ticks=125, initial=140): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}RemainingAfter_0367 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0368
     * @tc.name      WindowStartIcon_RemainingAfter_0368
     * @tc.desc      remainingAfter(ticks=120, initial=75) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0368 begin`);
      const actual: number = remainingAfter(120, 75);
      logInfo(`remainingAfter(ticks=120, initial=75): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0368 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0369
     * @tc.name      WindowStartIcon_RemainingAfter_0369
     * @tc.desc      remainingAfter(ticks=44, initial=25) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0369 begin`);
      const actual: number = remainingAfter(44, 25);
      logInfo(`remainingAfter(ticks=44, initial=25): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0369 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0370
     * @tc.name      WindowStartIcon_RemainingAfter_0370
     * @tc.desc      remainingAfter(ticks=135, initial=160) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0370 begin`);
      const actual: number = remainingAfter(135, 160);
      logInfo(`remainingAfter(ticks=135, initial=160): actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}RemainingAfter_0370 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0371
     * @tc.name      WindowStartIcon_RemainingAfter_0371
     * @tc.desc      remainingAfter(ticks=-81, initial=-26) returns -26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0371 begin`);
      const actual: number = remainingAfter(-81, -26);
      logInfo(`remainingAfter(ticks=-81, initial=-26): actual=${actual}`);
      expect(actual).assertEqual(-26);
      logInfo(`${BUNDLE}RemainingAfter_0371 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0372
     * @tc.name      WindowStartIcon_RemainingAfter_0372
     * @tc.desc      remainingAfter(ticks=55, initial=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0372 begin`);
      const actual: number = remainingAfter(55, 3);
      logInfo(`remainingAfter(ticks=55, initial=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0372 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0373
     * @tc.name      WindowStartIcon_RemainingAfter_0373
     * @tc.desc      remainingAfter(ticks=162, initial=155) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0373', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0373 begin`);
      const actual: number = remainingAfter(162, 155);
      logInfo(`remainingAfter(ticks=162, initial=155): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0373 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0374
     * @tc.name      WindowStartIcon_RemainingAfter_0374
     * @tc.desc      remainingAfter(ticks=50, initial=41.89) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0374', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0374 begin`);
      const actual: number = remainingAfter(50, 41.89);
      logInfo(`remainingAfter(ticks=50, initial=41.89): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0374 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0375
     * @tc.name      WindowStartIcon_RemainingAfter_0375
     * @tc.desc      remainingAfter(ticks=15, initial=145) returns 130
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0375', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0375 begin`);
      const actual: number = remainingAfter(15, 145);
      logInfo(`remainingAfter(ticks=15, initial=145): actual=${actual}`);
      expect(actual).assertEqual(130);
      logInfo(`${BUNDLE}RemainingAfter_0375 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0376
     * @tc.name      WindowStartIcon_RemainingAfter_0376
     * @tc.desc      remainingAfter(ticks=50, initial=100) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0376', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0376 begin`);
      const actual: number = remainingAfter(50, 100);
      logInfo(`remainingAfter(ticks=50, initial=100): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}RemainingAfter_0376 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0377
     * @tc.name      WindowStartIcon_RemainingAfter_0377
     * @tc.desc      remainingAfter(ticks=100, initial=25) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0377', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0377 begin`);
      const actual: number = remainingAfter(100, 25);
      logInfo(`remainingAfter(ticks=100, initial=25): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0377 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0378
     * @tc.name      WindowStartIcon_RemainingAfter_0378
     * @tc.desc      remainingAfter(ticks=175, initial=67.03) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0378', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0378 begin`);
      const actual: number = remainingAfter(175, 67.03);
      logInfo(`remainingAfter(ticks=175, initial=67.03): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0378 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0379
     * @tc.name      WindowStartIcon_RemainingAfter_0379
     * @tc.desc      remainingAfter(ticks=-1, initial=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0379 begin`);
      const actual: number = remainingAfter(-1, 1);
      logInfo(`remainingAfter(ticks=-1, initial=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}RemainingAfter_0379 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0380
     * @tc.name      WindowStartIcon_RemainingAfter_0380
     * @tc.desc      remainingAfter(ticks=175, initial=159) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0380', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0380 begin`);
      const actual: number = remainingAfter(175, 159);
      logInfo(`remainingAfter(ticks=175, initial=159): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0380 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0381
     * @tc.name      WindowStartIcon_RemainingAfter_0381
     * @tc.desc      remainingAfter(ticks=80.32, initial=85) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0381 begin`);
      const actual: number = remainingAfter(80.32, 85);
      logInfo(`remainingAfter(ticks=80.32, initial=85): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}RemainingAfter_0381 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0382
     * @tc.name      WindowStartIcon_RemainingAfter_0382
     * @tc.desc      remainingAfter(ticks=95, initial=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0382', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0382 begin`);
      const actual: number = remainingAfter(95, 15);
      logInfo(`remainingAfter(ticks=95, initial=15): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0382 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0383
     * @tc.name      WindowStartIcon_RemainingAfter_0383
     * @tc.desc      remainingAfter(ticks=-5, initial=-73) returns -73
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0383', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0383 begin`);
      const actual: number = remainingAfter(-5, -73);
      logInfo(`remainingAfter(ticks=-5, initial=-73): actual=${actual}`);
      expect(actual).assertEqual(-73);
      logInfo(`${BUNDLE}RemainingAfter_0383 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0384
     * @tc.name      WindowStartIcon_RemainingAfter_0384
     * @tc.desc      remainingAfter(ticks=15, initial=150) returns 135
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0384', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0384 begin`);
      const actual: number = remainingAfter(15, 150);
      logInfo(`remainingAfter(ticks=15, initial=150): actual=${actual}`);
      expect(actual).assertEqual(135);
      logInfo(`${BUNDLE}RemainingAfter_0384 end`);
    });
  });
}
