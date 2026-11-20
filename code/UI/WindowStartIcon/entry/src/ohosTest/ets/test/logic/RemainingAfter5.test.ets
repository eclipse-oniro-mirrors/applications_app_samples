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

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for remainingAfter (96 cases). */
export default function remainingAfter5Test(): void {
  describe('RemainingAfter5Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0385
     * @tc.name      WindowStartIcon_RemainingAfter_0385
     * @tc.desc      remainingAfter(ticks=80, initial=200) returns 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0385 begin`);
      const actual: number = remainingAfter(80, 200);
      logInfo(`remainingAfter(ticks=80, initial=200): actual=${actual}`);
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}RemainingAfter_0385 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0386
     * @tc.name      WindowStartIcon_RemainingAfter_0386
     * @tc.desc      remainingAfter(ticks=135, initial=45) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0386 begin`);
      const actual: number = remainingAfter(135, 45);
      logInfo(`remainingAfter(ticks=135, initial=45): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0386 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0387
     * @tc.name      WindowStartIcon_RemainingAfter_0387
     * @tc.desc      remainingAfter(ticks=180, initial=115) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0387 begin`);
      const actual: number = remainingAfter(180, 115);
      logInfo(`remainingAfter(ticks=180, initial=115): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0387 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0388
     * @tc.name      WindowStartIcon_RemainingAfter_0388
     * @tc.desc      remainingAfter(ticks=135, initial=30) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0388 begin`);
      const actual: number = remainingAfter(135, 30);
      logInfo(`remainingAfter(ticks=135, initial=30): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0388 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0389
     * @tc.name      WindowStartIcon_RemainingAfter_0389
     * @tc.desc      remainingAfter(ticks=75, initial=155) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0389 begin`);
      const actual: number = remainingAfter(75, 155);
      logInfo(`remainingAfter(ticks=75, initial=155): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}RemainingAfter_0389 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0390
     * @tc.name      WindowStartIcon_RemainingAfter_0390
     * @tc.desc      remainingAfter(ticks=-5, initial=150) returns 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0390 begin`);
      const actual: number = remainingAfter(-5, 150);
      logInfo(`remainingAfter(ticks=-5, initial=150): actual=${actual}`);
      expect(actual).assertEqual(150);
      logInfo(`${BUNDLE}RemainingAfter_0390 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0391
     * @tc.name      WindowStartIcon_RemainingAfter_0391
     * @tc.desc      remainingAfter(ticks=95, initial=-26) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0391 begin`);
      const actual: number = remainingAfter(95, -26);
      logInfo(`remainingAfter(ticks=95, initial=-26): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0391 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0392
     * @tc.name      WindowStartIcon_RemainingAfter_0392
     * @tc.desc      remainingAfter(ticks=140, initial=75) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0392 begin`);
      const actual: number = remainingAfter(140, 75);
      logInfo(`remainingAfter(ticks=140, initial=75): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0392 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0393
     * @tc.name      WindowStartIcon_RemainingAfter_0393
     * @tc.desc      remainingAfter(ticks=199, initial=96.17) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0393', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0393 begin`);
      const actual: number = remainingAfter(199, 96.17);
      logInfo(`remainingAfter(ticks=199, initial=96.17): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0393 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0394
     * @tc.name      WindowStartIcon_RemainingAfter_0394
     * @tc.desc      remainingAfter(ticks=65, initial=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0394 begin`);
      const actual: number = remainingAfter(65, 15);
      logInfo(`remainingAfter(ticks=65, initial=15): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0394 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0395
     * @tc.name      WindowStartIcon_RemainingAfter_0395
     * @tc.desc      remainingAfter(ticks=199, initial=40) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0395 begin`);
      const actual: number = remainingAfter(199, 40);
      logInfo(`remainingAfter(ticks=199, initial=40): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0395 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0396
     * @tc.name      WindowStartIcon_RemainingAfter_0396
     * @tc.desc      remainingAfter(ticks=105, initial=80) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0396 begin`);
      const actual: number = remainingAfter(105, 80);
      logInfo(`remainingAfter(ticks=105, initial=80): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0396 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0397
     * @tc.name      WindowStartIcon_RemainingAfter_0397
     * @tc.desc      remainingAfter(ticks=135, initial=80) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0397 begin`);
      const actual: number = remainingAfter(135, 80);
      logInfo(`remainingAfter(ticks=135, initial=80): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0397 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0398
     * @tc.name      WindowStartIcon_RemainingAfter_0398
     * @tc.desc      remainingAfter(ticks=130, initial=120) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0398 begin`);
      const actual: number = remainingAfter(130, 120);
      logInfo(`remainingAfter(ticks=130, initial=120): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0398 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0399
     * @tc.name      WindowStartIcon_RemainingAfter_0399
     * @tc.desc      remainingAfter(ticks=44, initial=55) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0399', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0399 begin`);
      const actual: number = remainingAfter(44, 55);
      logInfo(`remainingAfter(ticks=44, initial=55): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}RemainingAfter_0399 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0400
     * @tc.name      WindowStartIcon_RemainingAfter_0400
     * @tc.desc      remainingAfter(ticks=-10, initial=150) returns 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0400 begin`);
      const actual: number = remainingAfter(-10, 150);
      logInfo(`remainingAfter(ticks=-10, initial=150): actual=${actual}`);
      expect(actual).assertEqual(150);
      logInfo(`${BUNDLE}RemainingAfter_0400 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0401
     * @tc.name      WindowStartIcon_RemainingAfter_0401
     * @tc.desc      remainingAfter(ticks=199, initial=25) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0401 begin`);
      const actual: number = remainingAfter(199, 25);
      logInfo(`remainingAfter(ticks=199, initial=25): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0401 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0402
     * @tc.name      WindowStartIcon_RemainingAfter_0402
     * @tc.desc      remainingAfter(ticks=20, initial=150) returns 130
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0402 begin`);
      const actual: number = remainingAfter(20, 150);
      logInfo(`remainingAfter(ticks=20, initial=150): actual=${actual}`);
      expect(actual).assertEqual(130);
      logInfo(`${BUNDLE}RemainingAfter_0402 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0403
     * @tc.name      WindowStartIcon_RemainingAfter_0403
     * @tc.desc      remainingAfter(ticks=50.37, initial=160) returns 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0403 begin`);
      const actual: number = remainingAfter(50.37, 160);
      logInfo(`remainingAfter(ticks=50.37, initial=160): actual=${actual}`);
      expect(actual).assertEqual(110);
      logInfo(`${BUNDLE}RemainingAfter_0403 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0404
     * @tc.name      WindowStartIcon_RemainingAfter_0404
     * @tc.desc      remainingAfter(ticks=40, initial=85) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0404 begin`);
      const actual: number = remainingAfter(40, 85);
      logInfo(`remainingAfter(ticks=40, initial=85): actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}RemainingAfter_0404 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0405
     * @tc.name      WindowStartIcon_RemainingAfter_0405
     * @tc.desc      remainingAfter(ticks=95, initial=135) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0405 begin`);
      const actual: number = remainingAfter(95, 135);
      logInfo(`remainingAfter(ticks=95, initial=135): actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}RemainingAfter_0405 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0406
     * @tc.name      WindowStartIcon_RemainingAfter_0406
     * @tc.desc      remainingAfter(ticks=70, initial=65) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0406 begin`);
      const actual: number = remainingAfter(70, 65);
      logInfo(`remainingAfter(ticks=70, initial=65): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0406 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0407
     * @tc.name      WindowStartIcon_RemainingAfter_0407
     * @tc.desc      remainingAfter(ticks=175, initial=-73) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0407 begin`);
      const actual: number = remainingAfter(175, -73);
      logInfo(`remainingAfter(ticks=175, initial=-73): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0407 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0408
     * @tc.name      WindowStartIcon_RemainingAfter_0408
     * @tc.desc      remainingAfter(ticks=45, initial=85) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0408 begin`);
      const actual: number = remainingAfter(45, 85);
      logInfo(`remainingAfter(ticks=45, initial=85): actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}RemainingAfter_0408 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0409
     * @tc.name      WindowStartIcon_RemainingAfter_0409
     * @tc.desc      remainingAfter(ticks=191, initial=25) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0409 begin`);
      const actual: number = remainingAfter(191, 25);
      logInfo(`remainingAfter(ticks=191, initial=25): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0409 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0410
     * @tc.name      WindowStartIcon_RemainingAfter_0410
     * @tc.desc      remainingAfter(ticks=3, initial=40) returns 37
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0410 begin`);
      const actual: number = remainingAfter(3, 40);
      logInfo(`remainingAfter(ticks=3, initial=40): actual=${actual}`);
      expect(actual).assertEqual(37);
      logInfo(`${BUNDLE}RemainingAfter_0410 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0411
     * @tc.name      WindowStartIcon_RemainingAfter_0411
     * @tc.desc      remainingAfter(ticks=175, initial=70) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0411 begin`);
      const actual: number = remainingAfter(175, 70);
      logInfo(`remainingAfter(ticks=175, initial=70): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0411 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0412
     * @tc.name      WindowStartIcon_RemainingAfter_0412
     * @tc.desc      remainingAfter(ticks=10, initial=30) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0412 begin`);
      const actual: number = remainingAfter(10, 30);
      logInfo(`remainingAfter(ticks=10, initial=30): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}RemainingAfter_0412 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0413
     * @tc.name      WindowStartIcon_RemainingAfter_0413
     * @tc.desc      remainingAfter(ticks=15, initial=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0413 begin`);
      const actual: number = remainingAfter(15, 15);
      logInfo(`remainingAfter(ticks=15, initial=15): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0413 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0414
     * @tc.name      WindowStartIcon_RemainingAfter_0414
     * @tc.desc      remainingAfter(ticks=40, initial=35) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0414 begin`);
      const actual: number = remainingAfter(40, 35);
      logInfo(`remainingAfter(ticks=40, initial=35): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0414 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0415
     * @tc.name      WindowStartIcon_RemainingAfter_0415
     * @tc.desc      remainingAfter(ticks=125, initial=41.89) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0415 begin`);
      const actual: number = remainingAfter(125, 41.89);
      logInfo(`remainingAfter(ticks=125, initial=41.89): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0415 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0416
     * @tc.name      WindowStartIcon_RemainingAfter_0416
     * @tc.desc      remainingAfter(ticks=100, initial=125) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0416 begin`);
      const actual: number = remainingAfter(100, 125);
      logInfo(`remainingAfter(ticks=100, initial=125): actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}RemainingAfter_0416 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0417
     * @tc.name      WindowStartIcon_RemainingAfter_0417
     * @tc.desc      remainingAfter(ticks=65, initial=100) returns 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0417 begin`);
      const actual: number = remainingAfter(65, 100);
      logInfo(`remainingAfter(ticks=65, initial=100): actual=${actual}`);
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}RemainingAfter_0417 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0418
     * @tc.name      WindowStartIcon_RemainingAfter_0418
     * @tc.desc      remainingAfter(ticks=135, initial=130) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0418 begin`);
      const actual: number = remainingAfter(135, 130);
      logInfo(`remainingAfter(ticks=135, initial=130): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0418 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0419
     * @tc.name      WindowStartIcon_RemainingAfter_0419
     * @tc.desc      remainingAfter(ticks=-81, initial=40) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0419 begin`);
      const actual: number = remainingAfter(-81, 40);
      logInfo(`remainingAfter(ticks=-81, initial=40): actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}RemainingAfter_0419 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0420
     * @tc.name      WindowStartIcon_RemainingAfter_0420
     * @tc.desc      remainingAfter(ticks=55, initial=105) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0420 begin`);
      const actual: number = remainingAfter(55, 105);
      logInfo(`remainingAfter(ticks=55, initial=105): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}RemainingAfter_0420 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0421
     * @tc.name      WindowStartIcon_RemainingAfter_0421
     * @tc.desc      remainingAfter(ticks=40, initial=155) returns 115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0421 begin`);
      const actual: number = remainingAfter(40, 155);
      logInfo(`remainingAfter(ticks=40, initial=155): actual=${actual}`);
      expect(actual).assertEqual(115);
      logInfo(`${BUNDLE}RemainingAfter_0421 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0422
     * @tc.name      WindowStartIcon_RemainingAfter_0422
     * @tc.desc      remainingAfter(ticks=195, initial=-47) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0422 begin`);
      const actual: number = remainingAfter(195, -47);
      logInfo(`remainingAfter(ticks=195, initial=-47): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0422 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0423
     * @tc.name      WindowStartIcon_RemainingAfter_0423
     * @tc.desc      remainingAfter(ticks=15, initial=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0423 begin`);
      const actual: number = remainingAfter(15, 1);
      logInfo(`remainingAfter(ticks=15, initial=1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0423 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0424
     * @tc.name      WindowStartIcon_RemainingAfter_0424
     * @tc.desc      remainingAfter(ticks=140, initial=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0424 begin`);
      const actual: number = remainingAfter(140, 1);
      logInfo(`remainingAfter(ticks=140, initial=1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0424 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0425
     * @tc.name      WindowStartIcon_RemainingAfter_0425
     * @tc.desc      remainingAfter(ticks=160, initial=45) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0425 begin`);
      const actual: number = remainingAfter(160, 45);
      logInfo(`remainingAfter(ticks=160, initial=45): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0425 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0426
     * @tc.name      WindowStartIcon_RemainingAfter_0426
     * @tc.desc      remainingAfter(ticks=15, initial=25) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0426 begin`);
      const actual: number = remainingAfter(15, 25);
      logInfo(`remainingAfter(ticks=15, initial=25): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}RemainingAfter_0426 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0427
     * @tc.name      WindowStartIcon_RemainingAfter_0427
     * @tc.desc      remainingAfter(ticks=130, initial=145) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0427 begin`);
      const actual: number = remainingAfter(130, 145);
      logInfo(`remainingAfter(ticks=130, initial=145): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}RemainingAfter_0427 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0428
     * @tc.name      WindowStartIcon_RemainingAfter_0428
     * @tc.desc      remainingAfter(ticks=162, initial=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0428 begin`);
      const actual: number = remainingAfter(162, 2);
      logInfo(`remainingAfter(ticks=162, initial=2): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0428 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0429
     * @tc.name      WindowStartIcon_RemainingAfter_0429
     * @tc.desc      remainingAfter(ticks=4, initial=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0429 begin`);
      const actual: number = remainingAfter(4, 1);
      logInfo(`remainingAfter(ticks=4, initial=1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0429 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0430
     * @tc.name      WindowStartIcon_RemainingAfter_0430
     * @tc.desc      remainingAfter(ticks=-10, initial=155) returns 155
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0430 begin`);
      const actual: number = remainingAfter(-10, 155);
      logInfo(`remainingAfter(ticks=-10, initial=155): actual=${actual}`);
      expect(actual).assertEqual(155);
      logInfo(`${BUNDLE}RemainingAfter_0430 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0431
     * @tc.name      WindowStartIcon_RemainingAfter_0431
     * @tc.desc      remainingAfter(ticks=40, initial=30) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0431 begin`);
      const actual: number = remainingAfter(40, 30);
      logInfo(`remainingAfter(ticks=40, initial=30): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0431 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0432
     * @tc.name      WindowStartIcon_RemainingAfter_0432
     * @tc.desc      remainingAfter(ticks=95, initial=40) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0432 begin`);
      const actual: number = remainingAfter(95, 40);
      logInfo(`remainingAfter(ticks=95, initial=40): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0432 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0433
     * @tc.name      WindowStartIcon_RemainingAfter_0433
     * @tc.desc      remainingAfter(ticks=150, initial=40) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0433 begin`);
      const actual: number = remainingAfter(150, 40);
      logInfo(`remainingAfter(ticks=150, initial=40): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0433 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0434
     * @tc.name      WindowStartIcon_RemainingAfter_0434
     * @tc.desc      remainingAfter(ticks=125, initial=45) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0434 begin`);
      const actual: number = remainingAfter(125, 45);
      logInfo(`remainingAfter(ticks=125, initial=45): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0434 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0435
     * @tc.name      WindowStartIcon_RemainingAfter_0435
     * @tc.desc      remainingAfter(ticks=120, initial=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0435 begin`);
      const actual: number = remainingAfter(120, 3);
      logInfo(`remainingAfter(ticks=120, initial=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0435 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0436
     * @tc.name      WindowStartIcon_RemainingAfter_0436
     * @tc.desc      remainingAfter(ticks=130, initial=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0436 begin`);
      const actual: number = remainingAfter(130, 5);
      logInfo(`remainingAfter(ticks=130, initial=5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0436 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0437
     * @tc.name      WindowStartIcon_RemainingAfter_0437
     * @tc.desc      remainingAfter(ticks=44, initial=133) returns 89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0437', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0437 begin`);
      const actual: number = remainingAfter(44, 133);
      logInfo(`remainingAfter(ticks=44, initial=133): actual=${actual}`);
      expect(actual).assertEqual(89);
      logInfo(`${BUNDLE}RemainingAfter_0437 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0438
     * @tc.name      WindowStartIcon_RemainingAfter_0438
     * @tc.desc      remainingAfter(ticks=150, initial=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0438', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0438 begin`);
      const actual: number = remainingAfter(150, 10);
      logInfo(`remainingAfter(ticks=150, initial=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0438 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0439
     * @tc.name      WindowStartIcon_RemainingAfter_0439
     * @tc.desc      remainingAfter(ticks=162, initial=20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0439', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0439 begin`);
      const actual: number = remainingAfter(162, 20);
      logInfo(`remainingAfter(ticks=162, initial=20): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0439 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0440
     * @tc.name      WindowStartIcon_RemainingAfter_0440
     * @tc.desc      remainingAfter(ticks=140, initial=160) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0440', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0440 begin`);
      const actual: number = remainingAfter(140, 160);
      logInfo(`remainingAfter(ticks=140, initial=160): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}RemainingAfter_0440 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0441
     * @tc.name      WindowStartIcon_RemainingAfter_0441
     * @tc.desc      remainingAfter(ticks=90, initial=25) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0441', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0441 begin`);
      const actual: number = remainingAfter(90, 25);
      logInfo(`remainingAfter(ticks=90, initial=25): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0441 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0442
     * @tc.name      WindowStartIcon_RemainingAfter_0442
     * @tc.desc      remainingAfter(ticks=-10, initial=61) returns 61
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0442', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0442 begin`);
      const actual: number = remainingAfter(-10, 61);
      logInfo(`remainingAfter(ticks=-10, initial=61): actual=${actual}`);
      expect(actual).assertEqual(61);
      logInfo(`${BUNDLE}RemainingAfter_0442 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0443
     * @tc.name      WindowStartIcon_RemainingAfter_0443
     * @tc.desc      remainingAfter(ticks=150, initial=160) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0443', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0443 begin`);
      const actual: number = remainingAfter(150, 160);
      logInfo(`remainingAfter(ticks=150, initial=160): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}RemainingAfter_0443 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0444
     * @tc.name      WindowStartIcon_RemainingAfter_0444
     * @tc.desc      remainingAfter(ticks=50.37, initial=120) returns 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0444', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0444 begin`);
      const actual: number = remainingAfter(50.37, 120);
      logInfo(`remainingAfter(ticks=50.37, initial=120): actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}RemainingAfter_0444 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0445
     * @tc.name      WindowStartIcon_RemainingAfter_0445
     * @tc.desc      remainingAfter(ticks=58.09, initial=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0445', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0445 begin`);
      const actual: number = remainingAfter(58.09, 5);
      logInfo(`remainingAfter(ticks=58.09, initial=5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0445 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0446
     * @tc.name      WindowStartIcon_RemainingAfter_0446
     * @tc.desc      remainingAfter(ticks=140, initial=-47) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0446', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0446 begin`);
      const actual: number = remainingAfter(140, -47);
      logInfo(`remainingAfter(ticks=140, initial=-47): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0446 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0447
     * @tc.name      WindowStartIcon_RemainingAfter_0447
     * @tc.desc      remainingAfter(ticks=50, initial=150) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0447', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0447 begin`);
      const actual: number = remainingAfter(50, 150);
      logInfo(`remainingAfter(ticks=50, initial=150): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}RemainingAfter_0447 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0448
     * @tc.name      WindowStartIcon_RemainingAfter_0448
     * @tc.desc      remainingAfter(ticks=95, initial=-47) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0448', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0448 begin`);
      const actual: number = remainingAfter(95, -47);
      logInfo(`remainingAfter(ticks=95, initial=-47): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0448 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0449
     * @tc.name      WindowStartIcon_RemainingAfter_0449
     * @tc.desc      remainingAfter(ticks=115, initial=105) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0449', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0449 begin`);
      const actual: number = remainingAfter(115, 105);
      logInfo(`remainingAfter(ticks=115, initial=105): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0449 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0450
     * @tc.name      WindowStartIcon_RemainingAfter_0450
     * @tc.desc      remainingAfter(ticks=185, initial=125) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0450', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0450 begin`);
      const actual: number = remainingAfter(185, 125);
      logInfo(`remainingAfter(ticks=185, initial=125): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0450 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0451
     * @tc.name      WindowStartIcon_RemainingAfter_0451
     * @tc.desc      remainingAfter(ticks=90, initial=140) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0451', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0451 begin`);
      const actual: number = remainingAfter(90, 140);
      logInfo(`remainingAfter(ticks=90, initial=140): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}RemainingAfter_0451 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0452
     * @tc.name      WindowStartIcon_RemainingAfter_0452
     * @tc.desc      remainingAfter(ticks=162, initial=75.76) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0452', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0452 begin`);
      const actual: number = remainingAfter(162, 75.76);
      logInfo(`remainingAfter(ticks=162, initial=75.76): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0452 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0453
     * @tc.name      WindowStartIcon_RemainingAfter_0453
     * @tc.desc      remainingAfter(ticks=-81, initial=50) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0453', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0453 begin`);
      const actual: number = remainingAfter(-81, 50);
      logInfo(`remainingAfter(ticks=-81, initial=50): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}RemainingAfter_0453 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0454
     * @tc.name      WindowStartIcon_RemainingAfter_0454
     * @tc.desc      remainingAfter(ticks=160, initial=145) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0454', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0454 begin`);
      const actual: number = remainingAfter(160, 145);
      logInfo(`remainingAfter(ticks=160, initial=145): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0454 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0455
     * @tc.name      WindowStartIcon_RemainingAfter_0455
     * @tc.desc      remainingAfter(ticks=35, initial=-47) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0455', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0455 begin`);
      const actual: number = remainingAfter(35, -47);
      logInfo(`remainingAfter(ticks=35, initial=-47): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0455 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0456
     * @tc.name      WindowStartIcon_RemainingAfter_0456
     * @tc.desc      remainingAfter(ticks=160, initial=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0456', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0456 begin`);
      const actual: number = remainingAfter(160, 15);
      logInfo(`remainingAfter(ticks=160, initial=15): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0456 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0457
     * @tc.name      WindowStartIcon_RemainingAfter_0457
     * @tc.desc      remainingAfter(ticks=1, initial=20) returns 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0457', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0457 begin`);
      const actual: number = remainingAfter(1, 20);
      logInfo(`remainingAfter(ticks=1, initial=20): actual=${actual}`);
      expect(actual).assertEqual(19);
      logInfo(`${BUNDLE}RemainingAfter_0457 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0458
     * @tc.name      WindowStartIcon_RemainingAfter_0458
     * @tc.desc      remainingAfter(ticks=15, initial=200) returns 185
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0458', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0458 begin`);
      const actual: number = remainingAfter(15, 200);
      logInfo(`remainingAfter(ticks=15, initial=200): actual=${actual}`);
      expect(actual).assertEqual(185);
      logInfo(`${BUNDLE}RemainingAfter_0458 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0459
     * @tc.name      WindowStartIcon_RemainingAfter_0459
     * @tc.desc      remainingAfter(ticks=21, initial=35) returns 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0459', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0459 begin`);
      const actual: number = remainingAfter(21, 35);
      logInfo(`remainingAfter(ticks=21, initial=35): actual=${actual}`);
      expect(actual).assertEqual(14);
      logInfo(`${BUNDLE}RemainingAfter_0459 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0460
     * @tc.name      WindowStartIcon_RemainingAfter_0460
     * @tc.desc      remainingAfter(ticks=55, initial=150) returns 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0460', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0460 begin`);
      const actual: number = remainingAfter(55, 150);
      logInfo(`remainingAfter(ticks=55, initial=150): actual=${actual}`);
      expect(actual).assertEqual(95);
      logInfo(`${BUNDLE}RemainingAfter_0460 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0461
     * @tc.name      WindowStartIcon_RemainingAfter_0461
     * @tc.desc      remainingAfter(ticks=115, initial=136) returns 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0461', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0461 begin`);
      const actual: number = remainingAfter(115, 136);
      logInfo(`remainingAfter(ticks=115, initial=136): actual=${actual}`);
      expect(actual).assertEqual(21);
      logInfo(`${BUNDLE}RemainingAfter_0461 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0462
     * @tc.name      WindowStartIcon_RemainingAfter_0462
     * @tc.desc      remainingAfter(ticks=100, initial=175) returns 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0462', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0462 begin`);
      const actual: number = remainingAfter(100, 175);
      logInfo(`remainingAfter(ticks=100, initial=175): actual=${actual}`);
      expect(actual).assertEqual(75);
      logInfo(`${BUNDLE}RemainingAfter_0462 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0463
     * @tc.name      WindowStartIcon_RemainingAfter_0463
     * @tc.desc      remainingAfter(ticks=190, initial=41.89) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0463', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0463 begin`);
      const actual: number = remainingAfter(190, 41.89);
      logInfo(`remainingAfter(ticks=190, initial=41.89): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0463 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0464
     * @tc.name      WindowStartIcon_RemainingAfter_0464
     * @tc.desc      remainingAfter(ticks=-10, initial=195) returns 195
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0464', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0464 begin`);
      const actual: number = remainingAfter(-10, 195);
      logInfo(`remainingAfter(ticks=-10, initial=195): actual=${actual}`);
      expect(actual).assertEqual(195);
      logInfo(`${BUNDLE}RemainingAfter_0464 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0465
     * @tc.name      WindowStartIcon_RemainingAfter_0465
     * @tc.desc      remainingAfter(ticks=120, initial=95) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0465', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0465 begin`);
      const actual: number = remainingAfter(120, 95);
      logInfo(`remainingAfter(ticks=120, initial=95): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0465 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0466
     * @tc.name      WindowStartIcon_RemainingAfter_0466
     * @tc.desc      remainingAfter(ticks=165, initial=200) returns 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0466', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0466 begin`);
      const actual: number = remainingAfter(165, 200);
      logInfo(`remainingAfter(ticks=165, initial=200): actual=${actual}`);
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}RemainingAfter_0466 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0467
     * @tc.name      WindowStartIcon_RemainingAfter_0467
     * @tc.desc      remainingAfter(ticks=30, initial=25) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0467', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0467 begin`);
      const actual: number = remainingAfter(30, 25);
      logInfo(`remainingAfter(ticks=30, initial=25): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0467 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0468
     * @tc.name      WindowStartIcon_RemainingAfter_0468
     * @tc.desc      remainingAfter(ticks=80.32, initial=170) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0468', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0468 begin`);
      const actual: number = remainingAfter(80.32, 170);
      logInfo(`remainingAfter(ticks=80.32, initial=170): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}RemainingAfter_0468 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0469
     * @tc.name      WindowStartIcon_RemainingAfter_0469
     * @tc.desc      remainingAfter(ticks=142, initial=130) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0469', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0469 begin`);
      const actual: number = remainingAfter(142, 130);
      logInfo(`remainingAfter(ticks=142, initial=130): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0469 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0470
     * @tc.name      WindowStartIcon_RemainingAfter_0470
     * @tc.desc      remainingAfter(ticks=155, initial=160) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0470', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0470 begin`);
      const actual: number = remainingAfter(155, 160);
      logInfo(`remainingAfter(ticks=155, initial=160): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}RemainingAfter_0470 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0471
     * @tc.name      WindowStartIcon_RemainingAfter_0471
     * @tc.desc      remainingAfter(ticks=55, initial=-26) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0471', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0471 begin`);
      const actual: number = remainingAfter(55, -26);
      logInfo(`remainingAfter(ticks=55, initial=-26): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0471 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0472
     * @tc.name      WindowStartIcon_RemainingAfter_0472
     * @tc.desc      remainingAfter(ticks=85, initial=61) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0472', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0472 begin`);
      const actual: number = remainingAfter(85, 61);
      logInfo(`remainingAfter(ticks=85, initial=61): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0472 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0473
     * @tc.name      WindowStartIcon_RemainingAfter_0473
     * @tc.desc      remainingAfter(ticks=125, initial=145) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0473', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0473 begin`);
      const actual: number = remainingAfter(125, 145);
      logInfo(`remainingAfter(ticks=125, initial=145): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}RemainingAfter_0473 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0474
     * @tc.name      WindowStartIcon_RemainingAfter_0474
     * @tc.desc      remainingAfter(ticks=100, initial=61) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0474', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0474 begin`);
      const actual: number = remainingAfter(100, 61);
      logInfo(`remainingAfter(ticks=100, initial=61): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0474 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0475
     * @tc.name      WindowStartIcon_RemainingAfter_0475
     * @tc.desc      remainingAfter(ticks=-10, initial=110) returns 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0475', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0475 begin`);
      const actual: number = remainingAfter(-10, 110);
      logInfo(`remainingAfter(ticks=-10, initial=110): actual=${actual}`);
      expect(actual).assertEqual(110);
      logInfo(`${BUNDLE}RemainingAfter_0475 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0476
     * @tc.name      WindowStartIcon_RemainingAfter_0476
     * @tc.desc      remainingAfter(ticks=80, initial=110) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0476', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0476 begin`);
      const actual: number = remainingAfter(80, 110);
      logInfo(`remainingAfter(ticks=80, initial=110): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}RemainingAfter_0476 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0477
     * @tc.name      WindowStartIcon_RemainingAfter_0477
     * @tc.desc      remainingAfter(ticks=155, initial=40) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0477', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0477 begin`);
      const actual: number = remainingAfter(155, 40);
      logInfo(`remainingAfter(ticks=155, initial=40): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0477 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0478
     * @tc.name      WindowStartIcon_RemainingAfter_0478
     * @tc.desc      remainingAfter(ticks=5, initial=25) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0478', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0478 begin`);
      const actual: number = remainingAfter(5, 25);
      logInfo(`remainingAfter(ticks=5, initial=25): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}RemainingAfter_0478 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0479
     * @tc.name      WindowStartIcon_RemainingAfter_0479
     * @tc.desc      remainingAfter(ticks=75, initial=165) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0479', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0479 begin`);
      const actual: number = remainingAfter(75, 165);
      logInfo(`remainingAfter(ticks=75, initial=165): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}RemainingAfter_0479 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0480
     * @tc.name      WindowStartIcon_RemainingAfter_0480
     * @tc.desc      remainingAfter(ticks=90, initial=105) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0480', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0480 begin`);
      const actual: number = remainingAfter(90, 105);
      logInfo(`remainingAfter(ticks=90, initial=105): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}RemainingAfter_0480 end`);
    });
  });
}
