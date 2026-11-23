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
export default function remainingAfter6Test(): void {
  describe('RemainingAfter6Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0481
     * @tc.name      WindowStartIcon_RemainingAfter_0481
     * @tc.desc      remainingAfter(ticks=190, initial=67.03) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0481', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0481 begin`);
      const actual: number = remainingAfter(190, 67.03);
      logInfo(`remainingAfter(ticks=190, initial=67.03): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0481 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0482
     * @tc.name      WindowStartIcon_RemainingAfter_0482
     * @tc.desc      remainingAfter(ticks=110, initial=-73) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0482', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0482 begin`);
      const actual: number = remainingAfter(110, -73);
      logInfo(`remainingAfter(ticks=110, initial=-73): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0482 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0483
     * @tc.name      WindowStartIcon_RemainingAfter_0483
     * @tc.desc      remainingAfter(ticks=145, initial=155) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0483', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0483 begin`);
      const actual: number = remainingAfter(145, 155);
      logInfo(`remainingAfter(ticks=145, initial=155): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}RemainingAfter_0483 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0484
     * @tc.name      WindowStartIcon_RemainingAfter_0484
     * @tc.desc      remainingAfter(ticks=185, initial=-73) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0484', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0484 begin`);
      const actual: number = remainingAfter(185, -73);
      logInfo(`remainingAfter(ticks=185, initial=-73): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0484 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0485
     * @tc.name      WindowStartIcon_RemainingAfter_0485
     * @tc.desc      remainingAfter(ticks=105, initial=170) returns 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0485', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0485 begin`);
      const actual: number = remainingAfter(105, 170);
      logInfo(`remainingAfter(ticks=105, initial=170): actual=${actual}`);
      expect(actual).assertEqual(65);
      logInfo(`${BUNDLE}RemainingAfter_0485 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0486
     * @tc.name      WindowStartIcon_RemainingAfter_0486
     * @tc.desc      remainingAfter(ticks=165, initial=142) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0486', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0486 begin`);
      const actual: number = remainingAfter(165, 142);
      logInfo(`remainingAfter(ticks=165, initial=142): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0486 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0487
     * @tc.name      WindowStartIcon_RemainingAfter_0487
     * @tc.desc      remainingAfter(ticks=165, initial=155) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0487', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0487 begin`);
      const actual: number = remainingAfter(165, 155);
      logInfo(`remainingAfter(ticks=165, initial=155): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0487 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0488
     * @tc.name      WindowStartIcon_RemainingAfter_0488
     * @tc.desc      remainingAfter(ticks=45, initial=155) returns 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0488', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0488 begin`);
      const actual: number = remainingAfter(45, 155);
      logInfo(`remainingAfter(ticks=45, initial=155): actual=${actual}`);
      expect(actual).assertEqual(110);
      logInfo(`${BUNDLE}RemainingAfter_0488 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0489
     * @tc.name      WindowStartIcon_RemainingAfter_0489
     * @tc.desc      remainingAfter(ticks=65, initial=90) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0489', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0489 begin`);
      const actual: number = remainingAfter(65, 90);
      logInfo(`remainingAfter(ticks=65, initial=90): actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}RemainingAfter_0489 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0490
     * @tc.name      WindowStartIcon_RemainingAfter_0490
     * @tc.desc      remainingAfter(ticks=90, initial=120) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0490', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0490 begin`);
      const actual: number = remainingAfter(90, 120);
      logInfo(`remainingAfter(ticks=90, initial=120): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}RemainingAfter_0490 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0491
     * @tc.name      WindowStartIcon_RemainingAfter_0491
     * @tc.desc      remainingAfter(ticks=80, initial=75.76) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0491', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0491 begin`);
      const actual: number = remainingAfter(80, 75.76);
      logInfo(`remainingAfter(ticks=80, initial=75.76): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0491 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0492
     * @tc.name      WindowStartIcon_RemainingAfter_0492
     * @tc.desc      remainingAfter(ticks=80.32, initial=175) returns 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0492', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0492 begin`);
      const actual: number = remainingAfter(80.32, 175);
      logInfo(`remainingAfter(ticks=80.32, initial=175): actual=${actual}`);
      expect(actual).assertEqual(95);
      logInfo(`${BUNDLE}RemainingAfter_0492 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0493
     * @tc.name      WindowStartIcon_RemainingAfter_0493
     * @tc.desc      remainingAfter(ticks=97, initial=61) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0493', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0493 begin`);
      const actual: number = remainingAfter(97, 61);
      logInfo(`remainingAfter(ticks=97, initial=61): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0493 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0494
     * @tc.name      WindowStartIcon_RemainingAfter_0494
     * @tc.desc      remainingAfter(ticks=155, initial=75) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0494', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0494 begin`);
      const actual: number = remainingAfter(155, 75);
      logInfo(`remainingAfter(ticks=155, initial=75): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0494 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0495
     * @tc.name      WindowStartIcon_RemainingAfter_0495
     * @tc.desc      remainingAfter(ticks=50.37, initial=60) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0495', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0495 begin`);
      const actual: number = remainingAfter(50.37, 60);
      logInfo(`remainingAfter(ticks=50.37, initial=60): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}RemainingAfter_0495 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0496
     * @tc.name      WindowStartIcon_RemainingAfter_0496
     * @tc.desc      remainingAfter(ticks=2, initial=3) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0496', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0496 begin`);
      const actual: number = remainingAfter(2, 3);
      logInfo(`remainingAfter(ticks=2, initial=3): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}RemainingAfter_0496 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0497
     * @tc.name      WindowStartIcon_RemainingAfter_0497
     * @tc.desc      remainingAfter(ticks=60, initial=61) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0497', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0497 begin`);
      const actual: number = remainingAfter(60, 61);
      logInfo(`remainingAfter(ticks=60, initial=61): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}RemainingAfter_0497 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0498
     * @tc.name      WindowStartIcon_RemainingAfter_0498
     * @tc.desc      remainingAfter(ticks=185, initial=133) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0498', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0498 begin`);
      const actual: number = remainingAfter(185, 133);
      logInfo(`remainingAfter(ticks=185, initial=133): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0498 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0499
     * @tc.name      WindowStartIcon_RemainingAfter_0499
     * @tc.desc      remainingAfter(ticks=195, initial=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0499', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0499 begin`);
      const actual: number = remainingAfter(195, 2);
      logInfo(`remainingAfter(ticks=195, initial=2): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0499 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0500
     * @tc.name      WindowStartIcon_RemainingAfter_0500
     * @tc.desc      remainingAfter(ticks=95, initial=120) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0500 begin`);
      const actual: number = remainingAfter(95, 120);
      logInfo(`remainingAfter(ticks=95, initial=120): actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}RemainingAfter_0500 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0501
     * @tc.name      WindowStartIcon_RemainingAfter_0501
     * @tc.desc      remainingAfter(ticks=-5, initial=200) returns 200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0501', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0501 begin`);
      const actual: number = remainingAfter(-5, 200);
      logInfo(`remainingAfter(ticks=-5, initial=200): actual=${actual}`);
      expect(actual).assertEqual(200);
      logInfo(`${BUNDLE}RemainingAfter_0501 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0502
     * @tc.name      WindowStartIcon_RemainingAfter_0502
     * @tc.desc      remainingAfter(ticks=142, initial=145) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0502', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0502 begin`);
      const actual: number = remainingAfter(142, 145);
      logInfo(`remainingAfter(ticks=142, initial=145): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}RemainingAfter_0502 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0503
     * @tc.name      WindowStartIcon_RemainingAfter_0503
     * @tc.desc      remainingAfter(ticks=100, initial=80) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0503', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0503 begin`);
      const actual: number = remainingAfter(100, 80);
      logInfo(`remainingAfter(ticks=100, initial=80): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0503 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0504
     * @tc.name      WindowStartIcon_RemainingAfter_0504
     * @tc.desc      remainingAfter(ticks=175, initial=20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0504', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0504 begin`);
      const actual: number = remainingAfter(175, 20);
      logInfo(`remainingAfter(ticks=175, initial=20): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0504 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0505
     * @tc.name      WindowStartIcon_RemainingAfter_0505
     * @tc.desc      remainingAfter(ticks=195, initial=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0505', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0505 begin`);
      const actual: number = remainingAfter(195, 15);
      logInfo(`remainingAfter(ticks=195, initial=15): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0505 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0506
     * @tc.name      WindowStartIcon_RemainingAfter_0506
     * @tc.desc      remainingAfter(ticks=45, initial=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0506', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0506 begin`);
      const actual: number = remainingAfter(45, 2);
      logInfo(`remainingAfter(ticks=45, initial=2): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0506 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0507
     * @tc.name      WindowStartIcon_RemainingAfter_0507
     * @tc.desc      remainingAfter(ticks=20, initial=105) returns 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0507', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0507 begin`);
      const actual: number = remainingAfter(20, 105);
      logInfo(`remainingAfter(ticks=20, initial=105): actual=${actual}`);
      expect(actual).assertEqual(85);
      logInfo(`${BUNDLE}RemainingAfter_0507 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0508
     * @tc.name      WindowStartIcon_RemainingAfter_0508
     * @tc.desc      remainingAfter(ticks=58.09, initial=200) returns 142
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0508', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0508 begin`);
      const actual: number = remainingAfter(58.09, 200);
      logInfo(`remainingAfter(ticks=58.09, initial=200): actual=${actual}`);
      expect(actual).assertEqual(142);
      logInfo(`${BUNDLE}RemainingAfter_0508 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0509
     * @tc.name      WindowStartIcon_RemainingAfter_0509
     * @tc.desc      remainingAfter(ticks=175, initial=176) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0509', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0509 begin`);
      const actual: number = remainingAfter(175, 176);
      logInfo(`remainingAfter(ticks=175, initial=176): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}RemainingAfter_0509 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0510
     * @tc.name      WindowStartIcon_RemainingAfter_0510
     * @tc.desc      remainingAfter(ticks=95, initial=105) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0510 begin`);
      const actual: number = remainingAfter(95, 105);
      logInfo(`remainingAfter(ticks=95, initial=105): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}RemainingAfter_0510 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0511
     * @tc.name      WindowStartIcon_RemainingAfter_0511
     * @tc.desc      remainingAfter(ticks=-81, initial=25) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0511', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0511 begin`);
      const actual: number = remainingAfter(-81, 25);
      logInfo(`remainingAfter(ticks=-81, initial=25): actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}RemainingAfter_0511 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0512
     * @tc.name      WindowStartIcon_RemainingAfter_0512
     * @tc.desc      remainingAfter(ticks=80.32, initial=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0512', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0512 begin`);
      const actual: number = remainingAfter(80.32, 10);
      logInfo(`remainingAfter(ticks=80.32, initial=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0512 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0513
     * @tc.name      WindowStartIcon_RemainingAfter_0513
     * @tc.desc      remainingAfter(ticks=195, initial=95) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0513', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0513 begin`);
      const actual: number = remainingAfter(195, 95);
      logInfo(`remainingAfter(ticks=195, initial=95): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0513 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0514
     * @tc.name      WindowStartIcon_RemainingAfter_0514
     * @tc.desc      remainingAfter(ticks=-5, initial=142) returns 142
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0514', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0514 begin`);
      const actual: number = remainingAfter(-5, 142);
      logInfo(`remainingAfter(ticks=-5, initial=142): actual=${actual}`);
      expect(actual).assertEqual(142);
      logInfo(`${BUNDLE}RemainingAfter_0514 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0515
     * @tc.name      WindowStartIcon_RemainingAfter_0515
     * @tc.desc      remainingAfter(ticks=75, initial=180) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0515', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0515 begin`);
      const actual: number = remainingAfter(75, 180);
      logInfo(`remainingAfter(ticks=75, initial=180): actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}RemainingAfter_0515 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0516
     * @tc.name      WindowStartIcon_RemainingAfter_0516
     * @tc.desc      remainingAfter(ticks=15, initial=180) returns 165
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0516', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0516 begin`);
      const actual: number = remainingAfter(15, 180);
      logInfo(`remainingAfter(ticks=15, initial=180): actual=${actual}`);
      expect(actual).assertEqual(165);
      logInfo(`${BUNDLE}RemainingAfter_0516 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0517
     * @tc.name      WindowStartIcon_RemainingAfter_0517
     * @tc.desc      remainingAfter(ticks=115, initial=165) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0517', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0517 begin`);
      const actual: number = remainingAfter(115, 165);
      logInfo(`remainingAfter(ticks=115, initial=165): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}RemainingAfter_0517 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0518
     * @tc.name      WindowStartIcon_RemainingAfter_0518
     * @tc.desc      remainingAfter(ticks=120, initial=-73) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0518', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0518 begin`);
      const actual: number = remainingAfter(120, -73);
      logInfo(`remainingAfter(ticks=120, initial=-73): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0518 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0519
     * @tc.name      WindowStartIcon_RemainingAfter_0519
     * @tc.desc      remainingAfter(ticks=80, initial=120) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0519', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0519 begin`);
      const actual: number = remainingAfter(80, 120);
      logInfo(`remainingAfter(ticks=80, initial=120): actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}RemainingAfter_0519 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0520
     * @tc.name      WindowStartIcon_RemainingAfter_0520
     * @tc.desc      remainingAfter(ticks=125, initial=165) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0520', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0520 begin`);
      const actual: number = remainingAfter(125, 165);
      logInfo(`remainingAfter(ticks=125, initial=165): actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}RemainingAfter_0520 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0521
     * @tc.name      WindowStartIcon_RemainingAfter_0521
     * @tc.desc      remainingAfter(ticks=190, initial=50) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0521', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0521 begin`);
      const actual: number = remainingAfter(190, 50);
      logInfo(`remainingAfter(ticks=190, initial=50): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0521 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0522
     * @tc.name      WindowStartIcon_RemainingAfter_0522
     * @tc.desc      remainingAfter(ticks=65, initial=-73) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0522', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0522 begin`);
      const actual: number = remainingAfter(65, -73);
      logInfo(`remainingAfter(ticks=65, initial=-73): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0522 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0523
     * @tc.name      WindowStartIcon_RemainingAfter_0523
     * @tc.desc      remainingAfter(ticks=20, initial=55) returns 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0523', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0523 begin`);
      const actual: number = remainingAfter(20, 55);
      logInfo(`remainingAfter(ticks=20, initial=55): actual=${actual}`);
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}RemainingAfter_0523 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0524
     * @tc.name      WindowStartIcon_RemainingAfter_0524
     * @tc.desc      remainingAfter(ticks=185, initial=200) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0524', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0524 begin`);
      const actual: number = remainingAfter(185, 200);
      logInfo(`remainingAfter(ticks=185, initial=200): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}RemainingAfter_0524 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0525
     * @tc.name      WindowStartIcon_RemainingAfter_0525
     * @tc.desc      remainingAfter(ticks=180, initial=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0525', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0525 begin`);
      const actual: number = remainingAfter(180, 3);
      logInfo(`remainingAfter(ticks=180, initial=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0525 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0526
     * @tc.name      WindowStartIcon_RemainingAfter_0526
     * @tc.desc      remainingAfter(ticks=120, initial=90) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0526', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0526 begin`);
      const actual: number = remainingAfter(120, 90);
      logInfo(`remainingAfter(ticks=120, initial=90): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0526 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0527
     * @tc.name      WindowStartIcon_RemainingAfter_0527
     * @tc.desc      remainingAfter(ticks=10, initial=-26) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0527', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0527 begin`);
      const actual: number = remainingAfter(10, -26);
      logInfo(`remainingAfter(ticks=10, initial=-26): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0527 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0528
     * @tc.name      WindowStartIcon_RemainingAfter_0528
     * @tc.desc      remainingAfter(ticks=55, initial=50) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0528', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0528 begin`);
      const actual: number = remainingAfter(55, 50);
      logInfo(`remainingAfter(ticks=55, initial=50): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0528 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0529
     * @tc.name      WindowStartIcon_RemainingAfter_0529
     * @tc.desc      remainingAfter(ticks=191, initial=70) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0529', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0529 begin`);
      const actual: number = remainingAfter(191, 70);
      logInfo(`remainingAfter(ticks=191, initial=70): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0529 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0530
     * @tc.name      WindowStartIcon_RemainingAfter_0530
     * @tc.desc      remainingAfter(ticks=142, initial=140) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0530', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0530 begin`);
      const actual: number = remainingAfter(142, 140);
      logInfo(`remainingAfter(ticks=142, initial=140): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0530 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0531
     * @tc.name      WindowStartIcon_RemainingAfter_0531
     * @tc.desc      remainingAfter(ticks=44, initial=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0531', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0531 begin`);
      const actual: number = remainingAfter(44, 3);
      logInfo(`remainingAfter(ticks=44, initial=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0531 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0532
     * @tc.name      WindowStartIcon_RemainingAfter_0532
     * @tc.desc      remainingAfter(ticks=190, initial=80) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0532', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0532 begin`);
      const actual: number = remainingAfter(190, 80);
      logInfo(`remainingAfter(ticks=190, initial=80): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0532 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0533
     * @tc.name      WindowStartIcon_RemainingAfter_0533
     * @tc.desc      remainingAfter(ticks=70, initial=130) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0533', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0533 begin`);
      const actual: number = remainingAfter(70, 130);
      logInfo(`remainingAfter(ticks=70, initial=130): actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}RemainingAfter_0533 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0534
     * @tc.name      WindowStartIcon_RemainingAfter_0534
     * @tc.desc      remainingAfter(ticks=50, initial=105) returns 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0534', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0534 begin`);
      const actual: number = remainingAfter(50, 105);
      logInfo(`remainingAfter(ticks=50, initial=105): actual=${actual}`);
      expect(actual).assertEqual(55);
      logInfo(`${BUNDLE}RemainingAfter_0534 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0535
     * @tc.name      WindowStartIcon_RemainingAfter_0535
     * @tc.desc      remainingAfter(ticks=170, initial=67.03) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0535', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0535 begin`);
      const actual: number = remainingAfter(170, 67.03);
      logInfo(`remainingAfter(ticks=170, initial=67.03): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0535 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0536
     * @tc.name      WindowStartIcon_RemainingAfter_0536
     * @tc.desc      remainingAfter(ticks=58.09, initial=90) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0536', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0536 begin`);
      const actual: number = remainingAfter(58.09, 90);
      logInfo(`remainingAfter(ticks=58.09, initial=90): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}RemainingAfter_0536 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0537
     * @tc.name      WindowStartIcon_RemainingAfter_0537
     * @tc.desc      remainingAfter(ticks=25, initial=50) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0537', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0537 begin`);
      const actual: number = remainingAfter(25, 50);
      logInfo(`remainingAfter(ticks=25, initial=50): actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}RemainingAfter_0537 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0538
     * @tc.name      WindowStartIcon_RemainingAfter_0538
     * @tc.desc      remainingAfter(ticks=195, initial=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0538', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0538 begin`);
      const actual: number = remainingAfter(195, 5);
      logInfo(`remainingAfter(ticks=195, initial=5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0538 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0539
     * @tc.name      WindowStartIcon_RemainingAfter_0539
     * @tc.desc      remainingAfter(ticks=75, initial=60) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0539', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0539 begin`);
      const actual: number = remainingAfter(75, 60);
      logInfo(`remainingAfter(ticks=75, initial=60): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0539 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0540
     * @tc.name      WindowStartIcon_RemainingAfter_0540
     * @tc.desc      remainingAfter(ticks=20, initial=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0540', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0540 begin`);
      const actual: number = remainingAfter(20, 2);
      logInfo(`remainingAfter(ticks=20, initial=2): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0540 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0541
     * @tc.name      WindowStartIcon_RemainingAfter_0541
     * @tc.desc      remainingAfter(ticks=170, initial=45) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0541', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0541 begin`);
      const actual: number = remainingAfter(170, 45);
      logInfo(`remainingAfter(ticks=170, initial=45): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0541 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0542
     * @tc.name      WindowStartIcon_RemainingAfter_0542
     * @tc.desc      remainingAfter(ticks=21, initial=180) returns 159
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0542', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0542 begin`);
      const actual: number = remainingAfter(21, 180);
      logInfo(`remainingAfter(ticks=21, initial=180): actual=${actual}`);
      expect(actual).assertEqual(159);
      logInfo(`${BUNDLE}RemainingAfter_0542 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0543
     * @tc.name      WindowStartIcon_RemainingAfter_0543
     * @tc.desc      remainingAfter(ticks=200, initial=96.17) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0543', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0543 begin`);
      const actual: number = remainingAfter(200, 96.17);
      logInfo(`remainingAfter(ticks=200, initial=96.17): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0543 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0544
     * @tc.name      WindowStartIcon_RemainingAfter_0544
     * @tc.desc      remainingAfter(ticks=100, initial=45) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0544', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0544 begin`);
      const actual: number = remainingAfter(100, 45);
      logInfo(`remainingAfter(ticks=100, initial=45): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0544 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0545
     * @tc.name      WindowStartIcon_RemainingAfter_0545
     * @tc.desc      remainingAfter(ticks=55, initial=70) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0545', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0545 begin`);
      const actual: number = remainingAfter(55, 70);
      logInfo(`remainingAfter(ticks=55, initial=70): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}RemainingAfter_0545 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0546
     * @tc.name      WindowStartIcon_RemainingAfter_0546
     * @tc.desc      remainingAfter(ticks=50.37, initial=-47) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0546', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0546 begin`);
      const actual: number = remainingAfter(50.37, -47);
      logInfo(`remainingAfter(ticks=50.37, initial=-47): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0546 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0547
     * @tc.name      WindowStartIcon_RemainingAfter_0547
     * @tc.desc      remainingAfter(ticks=120, initial=150) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0547', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0547 begin`);
      const actual: number = remainingAfter(120, 150);
      logInfo(`remainingAfter(ticks=120, initial=150): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}RemainingAfter_0547 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0548
     * @tc.name      WindowStartIcon_RemainingAfter_0548
     * @tc.desc      remainingAfter(ticks=70, initial=200) returns 130
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0548', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0548 begin`);
      const actual: number = remainingAfter(70, 200);
      logInfo(`remainingAfter(ticks=70, initial=200): actual=${actual}`);
      expect(actual).assertEqual(130);
      logInfo(`${BUNDLE}RemainingAfter_0548 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0549
     * @tc.name      WindowStartIcon_RemainingAfter_0549
     * @tc.desc      remainingAfter(ticks=90, initial=67.03) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0549', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0549 begin`);
      const actual: number = remainingAfter(90, 67.03);
      logInfo(`remainingAfter(ticks=90, initial=67.03): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0549 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0550
     * @tc.name      WindowStartIcon_RemainingAfter_0550
     * @tc.desc      remainingAfter(ticks=15, initial=-26) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0550', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0550 begin`);
      const actual: number = remainingAfter(15, -26);
      logInfo(`remainingAfter(ticks=15, initial=-26): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0550 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0551
     * @tc.name      WindowStartIcon_RemainingAfter_0551
     * @tc.desc      remainingAfter(ticks=162, initial=90) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0551', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0551 begin`);
      const actual: number = remainingAfter(162, 90);
      logInfo(`remainingAfter(ticks=162, initial=90): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0551 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0552
     * @tc.name      WindowStartIcon_RemainingAfter_0552
     * @tc.desc      remainingAfter(ticks=60, initial=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0552', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0552 begin`);
      const actual: number = remainingAfter(60, 10);
      logInfo(`remainingAfter(ticks=60, initial=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0552 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0553
     * @tc.name      WindowStartIcon_RemainingAfter_0553
     * @tc.desc      remainingAfter(ticks=80.32, initial=185) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0553', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0553 begin`);
      const actual: number = remainingAfter(80.32, 185);
      logInfo(`remainingAfter(ticks=80.32, initial=185): actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}RemainingAfter_0553 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0554
     * @tc.name      WindowStartIcon_RemainingAfter_0554
     * @tc.desc      remainingAfter(ticks=58.09, initial=140) returns 82
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0554', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0554 begin`);
      const actual: number = remainingAfter(58.09, 140);
      logInfo(`remainingAfter(ticks=58.09, initial=140): actual=${actual}`);
      expect(actual).assertEqual(82);
      logInfo(`${BUNDLE}RemainingAfter_0554 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0555
     * @tc.name      WindowStartIcon_RemainingAfter_0555
     * @tc.desc      remainingAfter(ticks=40, initial=105) returns 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0555', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0555 begin`);
      const actual: number = remainingAfter(40, 105);
      logInfo(`remainingAfter(ticks=40, initial=105): actual=${actual}`);
      expect(actual).assertEqual(65);
      logInfo(`${BUNDLE}RemainingAfter_0555 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0556
     * @tc.name      WindowStartIcon_RemainingAfter_0556
     * @tc.desc      remainingAfter(ticks=135, initial=200) returns 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0556', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0556 begin`);
      const actual: number = remainingAfter(135, 200);
      logInfo(`remainingAfter(ticks=135, initial=200): actual=${actual}`);
      expect(actual).assertEqual(65);
      logInfo(`${BUNDLE}RemainingAfter_0556 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0557
     * @tc.name      WindowStartIcon_RemainingAfter_0557
     * @tc.desc      remainingAfter(ticks=175, initial=160) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0557', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0557 begin`);
      const actual: number = remainingAfter(175, 160);
      logInfo(`remainingAfter(ticks=175, initial=160): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0557 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0558
     * @tc.name      WindowStartIcon_RemainingAfter_0558
     * @tc.desc      remainingAfter(ticks=145, initial=115) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0558', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0558 begin`);
      const actual: number = remainingAfter(145, 115);
      logInfo(`remainingAfter(ticks=145, initial=115): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0558 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0559
     * @tc.name      WindowStartIcon_RemainingAfter_0559
     * @tc.desc      remainingAfter(ticks=80.32, initial=120) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0559', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0559 begin`);
      const actual: number = remainingAfter(80.32, 120);
      logInfo(`remainingAfter(ticks=80.32, initial=120): actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}RemainingAfter_0559 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0560
     * @tc.name      WindowStartIcon_RemainingAfter_0560
     * @tc.desc      remainingAfter(ticks=65, initial=145) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0560', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0560 begin`);
      const actual: number = remainingAfter(65, 145);
      logInfo(`remainingAfter(ticks=65, initial=145): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}RemainingAfter_0560 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0561
     * @tc.name      WindowStartIcon_RemainingAfter_0561
     * @tc.desc      remainingAfter(ticks=5, initial=180) returns 175
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0561', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0561 begin`);
      const actual: number = remainingAfter(5, 180);
      logInfo(`remainingAfter(ticks=5, initial=180): actual=${actual}`);
      expect(actual).assertEqual(175);
      logInfo(`${BUNDLE}RemainingAfter_0561 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0562
     * @tc.name      WindowStartIcon_RemainingAfter_0562
     * @tc.desc      remainingAfter(ticks=45, initial=135) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0562', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0562 begin`);
      const actual: number = remainingAfter(45, 135);
      logInfo(`remainingAfter(ticks=45, initial=135): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}RemainingAfter_0562 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0563
     * @tc.name      WindowStartIcon_RemainingAfter_0563
     * @tc.desc      remainingAfter(ticks=20, initial=85) returns 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0563', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0563 begin`);
      const actual: number = remainingAfter(20, 85);
      logInfo(`remainingAfter(ticks=20, initial=85): actual=${actual}`);
      expect(actual).assertEqual(65);
      logInfo(`${BUNDLE}RemainingAfter_0563 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0564
     * @tc.name      WindowStartIcon_RemainingAfter_0564
     * @tc.desc      remainingAfter(ticks=191, initial=61) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0564', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0564 begin`);
      const actual: number = remainingAfter(191, 61);
      logInfo(`remainingAfter(ticks=191, initial=61): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0564 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0565
     * @tc.name      WindowStartIcon_RemainingAfter_0565
     * @tc.desc      remainingAfter(ticks=55, initial=165) returns 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0565', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0565 begin`);
      const actual: number = remainingAfter(55, 165);
      logInfo(`remainingAfter(ticks=55, initial=165): actual=${actual}`);
      expect(actual).assertEqual(110);
      logInfo(`${BUNDLE}RemainingAfter_0565 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0566
     * @tc.name      WindowStartIcon_RemainingAfter_0566
     * @tc.desc      remainingAfter(ticks=45, initial=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0566', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0566 begin`);
      const actual: number = remainingAfter(45, 3);
      logInfo(`remainingAfter(ticks=45, initial=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0566 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0567
     * @tc.name      WindowStartIcon_RemainingAfter_0567
     * @tc.desc      remainingAfter(ticks=130, initial=41.89) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0567', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0567 begin`);
      const actual: number = remainingAfter(130, 41.89);
      logInfo(`remainingAfter(ticks=130, initial=41.89): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0567 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0568
     * @tc.name      WindowStartIcon_RemainingAfter_0568
     * @tc.desc      remainingAfter(ticks=145, initial=91) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0568', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0568 begin`);
      const actual: number = remainingAfter(145, 91);
      logInfo(`remainingAfter(ticks=145, initial=91): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0568 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0569
     * @tc.name      WindowStartIcon_RemainingAfter_0569
     * @tc.desc      remainingAfter(ticks=162, initial=55) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0569', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0569 begin`);
      const actual: number = remainingAfter(162, 55);
      logInfo(`remainingAfter(ticks=162, initial=55): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0569 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0570
     * @tc.name      WindowStartIcon_RemainingAfter_0570
     * @tc.desc      remainingAfter(ticks=56, initial=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0570', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0570 begin`);
      const actual: number = remainingAfter(56, 10);
      logInfo(`remainingAfter(ticks=56, initial=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0570 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0571
     * @tc.name      WindowStartIcon_RemainingAfter_0571
     * @tc.desc      remainingAfter(ticks=80.32, initial=25) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0571', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0571 begin`);
      const actual: number = remainingAfter(80.32, 25);
      logInfo(`remainingAfter(ticks=80.32, initial=25): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0571 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0572
     * @tc.name      WindowStartIcon_RemainingAfter_0572
     * @tc.desc      remainingAfter(ticks=180, initial=25) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0572', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0572 begin`);
      const actual: number = remainingAfter(180, 25);
      logInfo(`remainingAfter(ticks=180, initial=25): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0572 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0573
     * @tc.name      WindowStartIcon_RemainingAfter_0573
     * @tc.desc      remainingAfter(ticks=130, initial=133) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0573', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0573 begin`);
      const actual: number = remainingAfter(130, 133);
      logInfo(`remainingAfter(ticks=130, initial=133): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}RemainingAfter_0573 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0574
     * @tc.name      WindowStartIcon_RemainingAfter_0574
     * @tc.desc      remainingAfter(ticks=135, initial=165) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0574', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0574 begin`);
      const actual: number = remainingAfter(135, 165);
      logInfo(`remainingAfter(ticks=135, initial=165): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}RemainingAfter_0574 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0575
     * @tc.name      WindowStartIcon_RemainingAfter_0575
     * @tc.desc      remainingAfter(ticks=-10, initial=190) returns 190
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0575', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0575 begin`);
      const actual: number = remainingAfter(-10, 190);
      logInfo(`remainingAfter(ticks=-10, initial=190): actual=${actual}`);
      expect(actual).assertEqual(190);
      logInfo(`${BUNDLE}RemainingAfter_0575 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0576
     * @tc.name      WindowStartIcon_RemainingAfter_0576
     * @tc.desc      remainingAfter(ticks=190, initial=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0576', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0576 begin`);
      const actual: number = remainingAfter(190, 100);
      logInfo(`remainingAfter(ticks=190, initial=100): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0576 end`);
    });
  });
}
