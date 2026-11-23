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
export default function remainingAfter7Test(): void {
  describe('RemainingAfter7Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0577
     * @tc.name      WindowStartIcon_RemainingAfter_0577
     * @tc.desc      remainingAfter(ticks=105, initial=165) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0577', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0577 begin`);
      const actual: number = remainingAfter(105, 165);
      logInfo(`remainingAfter(ticks=105, initial=165): actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}RemainingAfter_0577 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0578
     * @tc.name      WindowStartIcon_RemainingAfter_0578
     * @tc.desc      remainingAfter(ticks=160, initial=195) returns 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0578', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0578 begin`);
      const actual: number = remainingAfter(160, 195);
      logInfo(`remainingAfter(ticks=160, initial=195): actual=${actual}`);
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}RemainingAfter_0578 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0579
     * @tc.name      WindowStartIcon_RemainingAfter_0579
     * @tc.desc      remainingAfter(ticks=-81, initial=165) returns 165
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0579', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0579 begin`);
      const actual: number = remainingAfter(-81, 165);
      logInfo(`remainingAfter(ticks=-81, initial=165): actual=${actual}`);
      expect(actual).assertEqual(165);
      logInfo(`${BUNDLE}RemainingAfter_0579 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0580
     * @tc.name      WindowStartIcon_RemainingAfter_0580
     * @tc.desc      remainingAfter(ticks=145, initial=120) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0580', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0580 begin`);
      const actual: number = remainingAfter(145, 120);
      logInfo(`remainingAfter(ticks=145, initial=120): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0580 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0581
     * @tc.name      WindowStartIcon_RemainingAfter_0581
     * @tc.desc      remainingAfter(ticks=145, initial=70) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0581', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0581 begin`);
      const actual: number = remainingAfter(145, 70);
      logInfo(`remainingAfter(ticks=145, initial=70): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0581 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0582
     * @tc.name      WindowStartIcon_RemainingAfter_0582
     * @tc.desc      remainingAfter(ticks=95, initial=155) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0582', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0582 begin`);
      const actual: number = remainingAfter(95, 155);
      logInfo(`remainingAfter(ticks=95, initial=155): actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}RemainingAfter_0582 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0583
     * @tc.name      WindowStartIcon_RemainingAfter_0583
     * @tc.desc      remainingAfter(ticks=110, initial=120) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0583', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0583 begin`);
      const actual: number = remainingAfter(110, 120);
      logInfo(`remainingAfter(ticks=110, initial=120): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}RemainingAfter_0583 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0584
     * @tc.name      WindowStartIcon_RemainingAfter_0584
     * @tc.desc      remainingAfter(ticks=-10, initial=40) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0584', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0584 begin`);
      const actual: number = remainingAfter(-10, 40);
      logInfo(`remainingAfter(ticks=-10, initial=40): actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}RemainingAfter_0584 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0585
     * @tc.name      WindowStartIcon_RemainingAfter_0585
     * @tc.desc      remainingAfter(ticks=50.37, initial=70) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0585', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0585 begin`);
      const actual: number = remainingAfter(50.37, 70);
      logInfo(`remainingAfter(ticks=50.37, initial=70): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}RemainingAfter_0585 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0586
     * @tc.name      WindowStartIcon_RemainingAfter_0586
     * @tc.desc      remainingAfter(ticks=30, initial=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0586', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0586 begin`);
      const actual: number = remainingAfter(30, 5);
      logInfo(`remainingAfter(ticks=30, initial=5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0586 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0587
     * @tc.name      WindowStartIcon_RemainingAfter_0587
     * @tc.desc      remainingAfter(ticks=97, initial=65) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0587', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0587 begin`);
      const actual: number = remainingAfter(97, 65);
      logInfo(`remainingAfter(ticks=97, initial=65): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0587 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0588
     * @tc.name      WindowStartIcon_RemainingAfter_0588
     * @tc.desc      remainingAfter(ticks=20, initial=80) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0588', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0588 begin`);
      const actual: number = remainingAfter(20, 80);
      logInfo(`remainingAfter(ticks=20, initial=80): actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}RemainingAfter_0588 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0589
     * @tc.name      WindowStartIcon_RemainingAfter_0589
     * @tc.desc      remainingAfter(ticks=50.37, initial=55) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0589', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0589 begin`);
      const actual: number = remainingAfter(50.37, 55);
      logInfo(`remainingAfter(ticks=50.37, initial=55): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}RemainingAfter_0589 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0590
     * @tc.name      WindowStartIcon_RemainingAfter_0590
     * @tc.desc      remainingAfter(ticks=30, initial=50) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0590', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0590 begin`);
      const actual: number = remainingAfter(30, 50);
      logInfo(`remainingAfter(ticks=30, initial=50): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}RemainingAfter_0590 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0591
     * @tc.name      WindowStartIcon_RemainingAfter_0591
     * @tc.desc      remainingAfter(ticks=10, initial=190) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0591', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0591 begin`);
      const actual: number = remainingAfter(10, 190);
      logInfo(`remainingAfter(ticks=10, initial=190): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}RemainingAfter_0591 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0592
     * @tc.name      WindowStartIcon_RemainingAfter_0592
     * @tc.desc      remainingAfter(ticks=97, initial=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0592', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0592 begin`);
      const actual: number = remainingAfter(97, 10);
      logInfo(`remainingAfter(ticks=97, initial=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0592 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0593
     * @tc.name      WindowStartIcon_RemainingAfter_0593
     * @tc.desc      remainingAfter(ticks=85, initial=60) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0593', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0593 begin`);
      const actual: number = remainingAfter(85, 60);
      logInfo(`remainingAfter(ticks=85, initial=60): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0593 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0594
     * @tc.name      WindowStartIcon_RemainingAfter_0594
     * @tc.desc      remainingAfter(ticks=56, initial=125) returns 69
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0594', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0594 begin`);
      const actual: number = remainingAfter(56, 125);
      logInfo(`remainingAfter(ticks=56, initial=125): actual=${actual}`);
      expect(actual).assertEqual(69);
      logInfo(`${BUNDLE}RemainingAfter_0594 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0595
     * @tc.name      WindowStartIcon_RemainingAfter_0595
     * @tc.desc      remainingAfter(ticks=120, initial=67.03) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0595', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0595 begin`);
      const actual: number = remainingAfter(120, 67.03);
      logInfo(`remainingAfter(ticks=120, initial=67.03): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0595 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0596
     * @tc.name      WindowStartIcon_RemainingAfter_0596
     * @tc.desc      remainingAfter(ticks=175, initial=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0596', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0596 begin`);
      const actual: number = remainingAfter(175, 5);
      logInfo(`remainingAfter(ticks=175, initial=5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0596 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0597
     * @tc.name      WindowStartIcon_RemainingAfter_0597
     * @tc.desc      remainingAfter(ticks=185, initial=50) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0597', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0597 begin`);
      const actual: number = remainingAfter(185, 50);
      logInfo(`remainingAfter(ticks=185, initial=50): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0597 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0598
     * @tc.name      WindowStartIcon_RemainingAfter_0598
     * @tc.desc      remainingAfter(ticks=35, initial=140) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0598', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0598 begin`);
      const actual: number = remainingAfter(35, 140);
      logInfo(`remainingAfter(ticks=35, initial=140): actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}RemainingAfter_0598 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0599
     * @tc.name      WindowStartIcon_RemainingAfter_0599
     * @tc.desc      remainingAfter(ticks=180, initial=67.03) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0599', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0599 begin`);
      const actual: number = remainingAfter(180, 67.03);
      logInfo(`remainingAfter(ticks=180, initial=67.03): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0599 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0600
     * @tc.name      WindowStartIcon_RemainingAfter_0600
     * @tc.desc      remainingAfter(ticks=191, initial=133) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0600 begin`);
      const actual: number = remainingAfter(191, 133);
      logInfo(`remainingAfter(ticks=191, initial=133): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0600 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0601
     * @tc.name      WindowStartIcon_RemainingAfter_0601
     * @tc.desc      remainingAfter(ticks=20, initial=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0601', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0601 begin`);
      const actual: number = remainingAfter(20, -1);
      logInfo(`remainingAfter(ticks=20, initial=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0601 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0602
     * @tc.name      WindowStartIcon_RemainingAfter_0602
     * @tc.desc      remainingAfter(ticks=1, initial=136) returns 135
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0602', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0602 begin`);
      const actual: number = remainingAfter(1, 136);
      logInfo(`remainingAfter(ticks=1, initial=136): actual=${actual}`);
      expect(actual).assertEqual(135);
      logInfo(`${BUNDLE}RemainingAfter_0602 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0603
     * @tc.name      WindowStartIcon_RemainingAfter_0603
     * @tc.desc      remainingAfter(ticks=-10, initial=175) returns 175
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0603', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0603 begin`);
      const actual: number = remainingAfter(-10, 175);
      logInfo(`remainingAfter(ticks=-10, initial=175): actual=${actual}`);
      expect(actual).assertEqual(175);
      logInfo(`${BUNDLE}RemainingAfter_0603 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0604
     * @tc.name      WindowStartIcon_RemainingAfter_0604
     * @tc.desc      remainingAfter(ticks=40, initial=60) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0604', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0604 begin`);
      const actual: number = remainingAfter(40, 60);
      logInfo(`remainingAfter(ticks=40, initial=60): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}RemainingAfter_0604 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0605
     * @tc.name      WindowStartIcon_RemainingAfter_0605
     * @tc.desc      remainingAfter(ticks=142, initial=-92) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0605', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0605 begin`);
      const actual: number = remainingAfter(142, -92);
      logInfo(`remainingAfter(ticks=142, initial=-92): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0605 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0606
     * @tc.name      WindowStartIcon_RemainingAfter_0606
     * @tc.desc      remainingAfter(ticks=30, initial=60) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0606', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0606 begin`);
      const actual: number = remainingAfter(30, 60);
      logInfo(`remainingAfter(ticks=30, initial=60): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}RemainingAfter_0606 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0607
     * @tc.name      WindowStartIcon_RemainingAfter_0607
     * @tc.desc      remainingAfter(ticks=130, initial=45) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0607', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0607 begin`);
      const actual: number = remainingAfter(130, 45);
      logInfo(`remainingAfter(ticks=130, initial=45): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0607 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0608
     * @tc.name      WindowStartIcon_RemainingAfter_0608
     * @tc.desc      remainingAfter(ticks=195, initial=140) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0608', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0608 begin`);
      const actual: number = remainingAfter(195, 140);
      logInfo(`remainingAfter(ticks=195, initial=140): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0608 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0609
     * @tc.name      WindowStartIcon_RemainingAfter_0609
     * @tc.desc      remainingAfter(ticks=85, initial=40) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0609', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0609 begin`);
      const actual: number = remainingAfter(85, 40);
      logInfo(`remainingAfter(ticks=85, initial=40): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0609 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0610
     * @tc.name      WindowStartIcon_RemainingAfter_0610
     * @tc.desc      remainingAfter(ticks=65, initial=41.89) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0610', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0610 begin`);
      const actual: number = remainingAfter(65, 41.89);
      logInfo(`remainingAfter(ticks=65, initial=41.89): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0610 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0611
     * @tc.name      WindowStartIcon_RemainingAfter_0611
     * @tc.desc      remainingAfter(ticks=150, initial=142) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0611', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0611 begin`);
      const actual: number = remainingAfter(150, 142);
      logInfo(`remainingAfter(ticks=150, initial=142): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0611 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0612
     * @tc.name      WindowStartIcon_RemainingAfter_0612
     * @tc.desc      remainingAfter(ticks=80.32, initial=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0612', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0612 begin`);
      const actual: number = remainingAfter(80.32, -1);
      logInfo(`remainingAfter(ticks=80.32, initial=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0612 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0613
     * @tc.name      WindowStartIcon_RemainingAfter_0613
     * @tc.desc      remainingAfter(ticks=5, initial=85) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0613', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0613 begin`);
      const actual: number = remainingAfter(5, 85);
      logInfo(`remainingAfter(ticks=5, initial=85): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}RemainingAfter_0613 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0614
     * @tc.name      WindowStartIcon_RemainingAfter_0614
     * @tc.desc      remainingAfter(ticks=200, initial=145) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0614', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0614 begin`);
      const actual: number = remainingAfter(200, 145);
      logInfo(`remainingAfter(ticks=200, initial=145): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0614 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0615
     * @tc.name      WindowStartIcon_RemainingAfter_0615
     * @tc.desc      remainingAfter(ticks=185, initial=85) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0615', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0615 begin`);
      const actual: number = remainingAfter(185, 85);
      logInfo(`remainingAfter(ticks=185, initial=85): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0615 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0616
     * @tc.name      WindowStartIcon_RemainingAfter_0616
     * @tc.desc      remainingAfter(ticks=140, initial=150) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0616', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0616 begin`);
      const actual: number = remainingAfter(140, 150);
      logInfo(`remainingAfter(ticks=140, initial=150): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}RemainingAfter_0616 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0617
     * @tc.name      WindowStartIcon_RemainingAfter_0617
     * @tc.desc      remainingAfter(ticks=142, initial=67.03) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0617', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0617 begin`);
      const actual: number = remainingAfter(142, 67.03);
      logInfo(`remainingAfter(ticks=142, initial=67.03): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0617 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0618
     * @tc.name      WindowStartIcon_RemainingAfter_0618
     * @tc.desc      remainingAfter(ticks=162, initial=200) returns 38
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0618', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0618 begin`);
      const actual: number = remainingAfter(162, 200);
      logInfo(`remainingAfter(ticks=162, initial=200): actual=${actual}`);
      expect(actual).assertEqual(38);
      logInfo(`${BUNDLE}RemainingAfter_0618 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0619
     * @tc.name      WindowStartIcon_RemainingAfter_0619
     * @tc.desc      remainingAfter(ticks=50.37, initial=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0619', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0619 begin`);
      const actual: number = remainingAfter(50.37, 10);
      logInfo(`remainingAfter(ticks=50.37, initial=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0619 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0620
     * @tc.name      WindowStartIcon_RemainingAfter_0620
     * @tc.desc      remainingAfter(ticks=35, initial=160) returns 125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0620', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0620 begin`);
      const actual: number = remainingAfter(35, 160);
      logInfo(`remainingAfter(ticks=35, initial=160): actual=${actual}`);
      expect(actual).assertEqual(125);
      logInfo(`${BUNDLE}RemainingAfter_0620 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0621
     * @tc.name      WindowStartIcon_RemainingAfter_0621
     * @tc.desc      remainingAfter(ticks=-1, initial=-92) returns -92
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0621', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0621 begin`);
      const actual: number = remainingAfter(-1, -92);
      logInfo(`remainingAfter(ticks=-1, initial=-92): actual=${actual}`);
      expect(actual).assertEqual(-92);
      logInfo(`${BUNDLE}RemainingAfter_0621 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0622
     * @tc.name      WindowStartIcon_RemainingAfter_0622
     * @tc.desc      remainingAfter(ticks=110, initial=135) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0622', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0622 begin`);
      const actual: number = remainingAfter(110, 135);
      logInfo(`remainingAfter(ticks=110, initial=135): actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}RemainingAfter_0622 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0623
     * @tc.name      WindowStartIcon_RemainingAfter_0623
     * @tc.desc      remainingAfter(ticks=80.32, initial=40) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0623', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0623 begin`);
      const actual: number = remainingAfter(80.32, 40);
      logInfo(`remainingAfter(ticks=80.32, initial=40): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0623 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0624
     * @tc.name      WindowStartIcon_RemainingAfter_0624
     * @tc.desc      remainingAfter(ticks=115, initial=190) returns 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0624', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0624 begin`);
      const actual: number = remainingAfter(115, 190);
      logInfo(`remainingAfter(ticks=115, initial=190): actual=${actual}`);
      expect(actual).assertEqual(75);
      logInfo(`${BUNDLE}RemainingAfter_0624 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0625
     * @tc.name      WindowStartIcon_RemainingAfter_0625
     * @tc.desc      remainingAfter(ticks=50, initial=180) returns 130
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0625', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0625 begin`);
      const actual: number = remainingAfter(50, 180);
      logInfo(`remainingAfter(ticks=50, initial=180): actual=${actual}`);
      expect(actual).assertEqual(130);
      logInfo(`${BUNDLE}RemainingAfter_0625 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0626
     * @tc.name      WindowStartIcon_RemainingAfter_0626
     * @tc.desc      remainingAfter(ticks=135, initial=75.76) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0626', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0626 begin`);
      const actual: number = remainingAfter(135, 75.76);
      logInfo(`remainingAfter(ticks=135, initial=75.76): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0626 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0627
     * @tc.name      WindowStartIcon_RemainingAfter_0627
     * @tc.desc      remainingAfter(ticks=160, initial=115) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0627', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0627 begin`);
      const actual: number = remainingAfter(160, 115);
      logInfo(`remainingAfter(ticks=160, initial=115): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0627 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0628
     * @tc.name      WindowStartIcon_RemainingAfter_0628
     * @tc.desc      remainingAfter(ticks=60, initial=105) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0628', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0628 begin`);
      const actual: number = remainingAfter(60, 105);
      logInfo(`remainingAfter(ticks=60, initial=105): actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}RemainingAfter_0628 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0629
     * @tc.name      WindowStartIcon_RemainingAfter_0629
     * @tc.desc      remainingAfter(ticks=100, initial=75.76) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0629', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0629 begin`);
      const actual: number = remainingAfter(100, 75.76);
      logInfo(`remainingAfter(ticks=100, initial=75.76): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0629 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0630
     * @tc.name      WindowStartIcon_RemainingAfter_0630
     * @tc.desc      remainingAfter(ticks=1, initial=-73) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0630', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0630 begin`);
      const actual: number = remainingAfter(1, -73);
      logInfo(`remainingAfter(ticks=1, initial=-73): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0630 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0631
     * @tc.name      WindowStartIcon_RemainingAfter_0631
     * @tc.desc      remainingAfter(ticks=60, initial=35) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0631', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0631 begin`);
      const actual: number = remainingAfter(60, 35);
      logInfo(`remainingAfter(ticks=60, initial=35): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0631 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0632
     * @tc.name      WindowStartIcon_RemainingAfter_0632
     * @tc.desc      remainingAfter(ticks=58.09, initial=20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0632', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0632 begin`);
      const actual: number = remainingAfter(58.09, 20);
      logInfo(`remainingAfter(ticks=58.09, initial=20): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0632 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0633
     * @tc.name      WindowStartIcon_RemainingAfter_0633
     * @tc.desc      remainingAfter(ticks=97, initial=-92) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0633', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0633 begin`);
      const actual: number = remainingAfter(97, -92);
      logInfo(`remainingAfter(ticks=97, initial=-92): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0633 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0634
     * @tc.name      WindowStartIcon_RemainingAfter_0634
     * @tc.desc      remainingAfter(ticks=10, initial=130) returns 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0634', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0634 begin`);
      const actual: number = remainingAfter(10, 130);
      logInfo(`remainingAfter(ticks=10, initial=130): actual=${actual}`);
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}RemainingAfter_0634 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0635
     * @tc.name      WindowStartIcon_RemainingAfter_0635
     * @tc.desc      remainingAfter(ticks=110, initial=200) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0635', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0635 begin`);
      const actual: number = remainingAfter(110, 200);
      logInfo(`remainingAfter(ticks=110, initial=200): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}RemainingAfter_0635 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0636
     * @tc.name      WindowStartIcon_RemainingAfter_0636
     * @tc.desc      remainingAfter(ticks=-10, initial=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0636', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0636 begin`);
      const actual: number = remainingAfter(-10, 100);
      logInfo(`remainingAfter(ticks=-10, initial=100): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}RemainingAfter_0636 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0637
     * @tc.name      WindowStartIcon_RemainingAfter_0637
     * @tc.desc      remainingAfter(ticks=142, initial=75.76) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0637', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0637 begin`);
      const actual: number = remainingAfter(142, 75.76);
      logInfo(`remainingAfter(ticks=142, initial=75.76): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0637 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0638
     * @tc.name      WindowStartIcon_RemainingAfter_0638
     * @tc.desc      remainingAfter(ticks=60, initial=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0638', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0638 begin`);
      const actual: number = remainingAfter(60, 15);
      logInfo(`remainingAfter(ticks=60, initial=15): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0638 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0639
     * @tc.name      WindowStartIcon_RemainingAfter_0639
     * @tc.desc      remainingAfter(ticks=195, initial=85) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0639', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0639 begin`);
      const actual: number = remainingAfter(195, 85);
      logInfo(`remainingAfter(ticks=195, initial=85): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0639 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0640
     * @tc.name      WindowStartIcon_RemainingAfter_0640
     * @tc.desc      remainingAfter(ticks=80, initial=135) returns 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0640', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0640 begin`);
      const actual: number = remainingAfter(80, 135);
      logInfo(`remainingAfter(ticks=80, initial=135): actual=${actual}`);
      expect(actual).assertEqual(55);
      logInfo(`${BUNDLE}RemainingAfter_0640 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0641
     * @tc.name      WindowStartIcon_RemainingAfter_0641
     * @tc.desc      remainingAfter(ticks=135, initial=50) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0641', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0641 begin`);
      const actual: number = remainingAfter(135, 50);
      logInfo(`remainingAfter(ticks=135, initial=50): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0641 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0642
     * @tc.name      WindowStartIcon_RemainingAfter_0642
     * @tc.desc      remainingAfter(ticks=115, initial=61) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0642', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0642 begin`);
      const actual: number = remainingAfter(115, 61);
      logInfo(`remainingAfter(ticks=115, initial=61): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0642 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0643
     * @tc.name      WindowStartIcon_RemainingAfter_0643
     * @tc.desc      remainingAfter(ticks=75, initial=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0643', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0643 begin`);
      const actual: number = remainingAfter(75, 15);
      logInfo(`remainingAfter(ticks=75, initial=15): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0643 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0644
     * @tc.name      WindowStartIcon_RemainingAfter_0644
     * @tc.desc      remainingAfter(ticks=1, initial=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0644', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0644 begin`);
      const actual: number = remainingAfter(1, 2);
      logInfo(`remainingAfter(ticks=1, initial=2): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}RemainingAfter_0644 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0645
     * @tc.name      WindowStartIcon_RemainingAfter_0645
     * @tc.desc      remainingAfter(ticks=191, initial=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0645', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0645 begin`);
      const actual: number = remainingAfter(191, 3);
      logInfo(`remainingAfter(ticks=191, initial=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0645 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0646
     * @tc.name      WindowStartIcon_RemainingAfter_0646
     * @tc.desc      remainingAfter(ticks=50, initial=30) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0646', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0646 begin`);
      const actual: number = remainingAfter(50, 30);
      logInfo(`remainingAfter(ticks=50, initial=30): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0646 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0647
     * @tc.name      WindowStartIcon_RemainingAfter_0647
     * @tc.desc      remainingAfter(ticks=30, initial=-92) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0647', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0647 begin`);
      const actual: number = remainingAfter(30, -92);
      logInfo(`remainingAfter(ticks=30, initial=-92): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0647 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0648
     * @tc.name      WindowStartIcon_RemainingAfter_0648
     * @tc.desc      remainingAfter(ticks=85, initial=176) returns 91
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0648', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0648 begin`);
      const actual: number = remainingAfter(85, 176);
      logInfo(`remainingAfter(ticks=85, initial=176): actual=${actual}`);
      expect(actual).assertEqual(91);
      logInfo(`${BUNDLE}RemainingAfter_0648 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0649
     * @tc.name      WindowStartIcon_RemainingAfter_0649
     * @tc.desc      remainingAfter(ticks=105, initial=-73) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0649', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0649 begin`);
      const actual: number = remainingAfter(105, -73);
      logInfo(`remainingAfter(ticks=105, initial=-73): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0649 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0650
     * @tc.name      WindowStartIcon_RemainingAfter_0650
     * @tc.desc      remainingAfter(ticks=199, initial=30) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0650', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0650 begin`);
      const actual: number = remainingAfter(199, 30);
      logInfo(`remainingAfter(ticks=199, initial=30): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0650 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0651
     * @tc.name      WindowStartIcon_RemainingAfter_0651
     * @tc.desc      remainingAfter(ticks=125, initial=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0651', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0651 begin`);
      const actual: number = remainingAfter(125, 1);
      logInfo(`remainingAfter(ticks=125, initial=1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0651 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0652
     * @tc.name      WindowStartIcon_RemainingAfter_0652
     * @tc.desc      remainingAfter(ticks=-1, initial=165) returns 165
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0652', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0652 begin`);
      const actual: number = remainingAfter(-1, 165);
      logInfo(`remainingAfter(ticks=-1, initial=165): actual=${actual}`);
      expect(actual).assertEqual(165);
      logInfo(`${BUNDLE}RemainingAfter_0652 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0653
     * @tc.name      WindowStartIcon_RemainingAfter_0653
     * @tc.desc      remainingAfter(ticks=2, initial=135) returns 133
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0653', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0653 begin`);
      const actual: number = remainingAfter(2, 135);
      logInfo(`remainingAfter(ticks=2, initial=135): actual=${actual}`);
      expect(actual).assertEqual(133);
      logInfo(`${BUNDLE}RemainingAfter_0653 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0654
     * @tc.name      WindowStartIcon_RemainingAfter_0654
     * @tc.desc      remainingAfter(ticks=170, initial=30) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0654', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0654 begin`);
      const actual: number = remainingAfter(170, 30);
      logInfo(`remainingAfter(ticks=170, initial=30): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0654 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0655
     * @tc.name      WindowStartIcon_RemainingAfter_0655
     * @tc.desc      remainingAfter(ticks=185, initial=70) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0655', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0655 begin`);
      const actual: number = remainingAfter(185, 70);
      logInfo(`remainingAfter(ticks=185, initial=70): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0655 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0656
     * @tc.name      WindowStartIcon_RemainingAfter_0656
     * @tc.desc      remainingAfter(ticks=145, initial=165) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0656', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0656 begin`);
      const actual: number = remainingAfter(145, 165);
      logInfo(`remainingAfter(ticks=145, initial=165): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}RemainingAfter_0656 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0657
     * @tc.name      WindowStartIcon_RemainingAfter_0657
     * @tc.desc      remainingAfter(ticks=191, initial=35) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0657', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0657 begin`);
      const actual: number = remainingAfter(191, 35);
      logInfo(`remainingAfter(ticks=191, initial=35): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0657 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0658
     * @tc.name      WindowStartIcon_RemainingAfter_0658
     * @tc.desc      remainingAfter(ticks=120, initial=61) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0658', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0658 begin`);
      const actual: number = remainingAfter(120, 61);
      logInfo(`remainingAfter(ticks=120, initial=61): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0658 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0659
     * @tc.name      WindowStartIcon_RemainingAfter_0659
     * @tc.desc      remainingAfter(ticks=44, initial=30) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0659', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0659 begin`);
      const actual: number = remainingAfter(44, 30);
      logInfo(`remainingAfter(ticks=44, initial=30): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0659 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0660
     * @tc.name      WindowStartIcon_RemainingAfter_0660
     * @tc.desc      remainingAfter(ticks=35, initial=95) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0660', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0660 begin`);
      const actual: number = remainingAfter(35, 95);
      logInfo(`remainingAfter(ticks=35, initial=95): actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}RemainingAfter_0660 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0661
     * @tc.name      WindowStartIcon_RemainingAfter_0661
     * @tc.desc      remainingAfter(ticks=45, initial=35) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0661', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0661 begin`);
      const actual: number = remainingAfter(45, 35);
      logInfo(`remainingAfter(ticks=45, initial=35): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0661 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0662
     * @tc.name      WindowStartIcon_RemainingAfter_0662
     * @tc.desc      remainingAfter(ticks=175, initial=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0662', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0662 begin`);
      const actual: number = remainingAfter(175, -1);
      logInfo(`remainingAfter(ticks=175, initial=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0662 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0663
     * @tc.name      WindowStartIcon_RemainingAfter_0663
     * @tc.desc      remainingAfter(ticks=150, initial=60) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0663', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0663 begin`);
      const actual: number = remainingAfter(150, 60);
      logInfo(`remainingAfter(ticks=150, initial=60): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0663 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0664
     * @tc.name      WindowStartIcon_RemainingAfter_0664
     * @tc.desc      remainingAfter(ticks=175, initial=185) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0664', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0664 begin`);
      const actual: number = remainingAfter(175, 185);
      logInfo(`remainingAfter(ticks=175, initial=185): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}RemainingAfter_0664 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0665
     * @tc.name      WindowStartIcon_RemainingAfter_0665
     * @tc.desc      remainingAfter(ticks=1, initial=-92) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0665', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0665 begin`);
      const actual: number = remainingAfter(1, -92);
      logInfo(`remainingAfter(ticks=1, initial=-92): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0665 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0666
     * @tc.name      WindowStartIcon_RemainingAfter_0666
     * @tc.desc      remainingAfter(ticks=100, initial=170) returns 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0666', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0666 begin`);
      const actual: number = remainingAfter(100, 170);
      logInfo(`remainingAfter(ticks=100, initial=170): actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}RemainingAfter_0666 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0667
     * @tc.name      WindowStartIcon_RemainingAfter_0667
     * @tc.desc      remainingAfter(ticks=-10, initial=35) returns 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0667', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0667 begin`);
      const actual: number = remainingAfter(-10, 35);
      logInfo(`remainingAfter(ticks=-10, initial=35): actual=${actual}`);
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}RemainingAfter_0667 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0668
     * @tc.name      WindowStartIcon_RemainingAfter_0668
     * @tc.desc      remainingAfter(ticks=-1, initial=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0668', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0668 begin`);
      const actual: number = remainingAfter(-1, 3);
      logInfo(`remainingAfter(ticks=-1, initial=3): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}RemainingAfter_0668 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0669
     * @tc.name      WindowStartIcon_RemainingAfter_0669
     * @tc.desc      remainingAfter(ticks=-81, initial=135) returns 135
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0669', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0669 begin`);
      const actual: number = remainingAfter(-81, 135);
      logInfo(`remainingAfter(ticks=-81, initial=135): actual=${actual}`);
      expect(actual).assertEqual(135);
      logInfo(`${BUNDLE}RemainingAfter_0669 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0670
     * @tc.name      WindowStartIcon_RemainingAfter_0670
     * @tc.desc      remainingAfter(ticks=45, initial=145) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0670', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0670 begin`);
      const actual: number = remainingAfter(45, 145);
      logInfo(`remainingAfter(ticks=45, initial=145): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}RemainingAfter_0670 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0671
     * @tc.name      WindowStartIcon_RemainingAfter_0671
     * @tc.desc      remainingAfter(ticks=60, initial=55) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0671', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0671 begin`);
      const actual: number = remainingAfter(60, 55);
      logInfo(`remainingAfter(ticks=60, initial=55): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0671 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0672
     * @tc.name      WindowStartIcon_RemainingAfter_0672
     * @tc.desc      remainingAfter(ticks=55, initial=30) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0672', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0672 begin`);
      const actual: number = remainingAfter(55, 30);
      logInfo(`remainingAfter(ticks=55, initial=30): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0672 end`);
    });
  });
}
