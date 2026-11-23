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

/** Logic checks for remainingAfter (87 cases). */
export default function remainingAfter8Test(): void {
  describe('RemainingAfter8Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0673
     * @tc.name      WindowStartIcon_RemainingAfter_0673
     * @tc.desc      remainingAfter(ticks=25, initial=190) returns 165
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0673', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0673 begin`);
      const actual: number = remainingAfter(25, 190);
      logInfo(`remainingAfter(ticks=25, initial=190): actual=${actual}`);
      expect(actual).assertEqual(165);
      logInfo(`${BUNDLE}RemainingAfter_0673 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0674
     * @tc.name      WindowStartIcon_RemainingAfter_0674
     * @tc.desc      remainingAfter(ticks=90, initial=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0674', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0674 begin`);
      const actual: number = remainingAfter(90, 15);
      logInfo(`remainingAfter(ticks=90, initial=15): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0674 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0675
     * @tc.name      WindowStartIcon_RemainingAfter_0675
     * @tc.desc      remainingAfter(ticks=175, initial=41.89) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0675', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0675 begin`);
      const actual: number = remainingAfter(175, 41.89);
      logInfo(`remainingAfter(ticks=175, initial=41.89): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0675 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0676
     * @tc.name      WindowStartIcon_RemainingAfter_0676
     * @tc.desc      remainingAfter(ticks=185, initial=95) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0676', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0676 begin`);
      const actual: number = remainingAfter(185, 95);
      logInfo(`remainingAfter(ticks=185, initial=95): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0676 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0677
     * @tc.name      WindowStartIcon_RemainingAfter_0677
     * @tc.desc      remainingAfter(ticks=130, initial=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0677', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0677 begin`);
      const actual: number = remainingAfter(130, 1);
      logInfo(`remainingAfter(ticks=130, initial=1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0677 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0678
     * @tc.name      WindowStartIcon_RemainingAfter_0678
     * @tc.desc      remainingAfter(ticks=155, initial=120) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0678', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0678 begin`);
      const actual: number = remainingAfter(155, 120);
      logInfo(`remainingAfter(ticks=155, initial=120): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0678 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0679
     * @tc.name      WindowStartIcon_RemainingAfter_0679
     * @tc.desc      remainingAfter(ticks=80, initial=175) returns 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0679', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0679 begin`);
      const actual: number = remainingAfter(80, 175);
      logInfo(`remainingAfter(ticks=80, initial=175): actual=${actual}`);
      expect(actual).assertEqual(95);
      logInfo(`${BUNDLE}RemainingAfter_0679 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0680
     * @tc.name      WindowStartIcon_RemainingAfter_0680
     * @tc.desc      remainingAfter(ticks=191, initial=55) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0680', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0680 begin`);
      const actual: number = remainingAfter(191, 55);
      logInfo(`remainingAfter(ticks=191, initial=55): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0680 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0681
     * @tc.name      WindowStartIcon_RemainingAfter_0681
     * @tc.desc      remainingAfter(ticks=110, initial=175) returns 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0681', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0681 begin`);
      const actual: number = remainingAfter(110, 175);
      logInfo(`remainingAfter(ticks=110, initial=175): actual=${actual}`);
      expect(actual).assertEqual(65);
      logInfo(`${BUNDLE}RemainingAfter_0681 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0682
     * @tc.name      WindowStartIcon_RemainingAfter_0682
     * @tc.desc      remainingAfter(ticks=80.32, initial=50) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0682', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0682 begin`);
      const actual: number = remainingAfter(80.32, 50);
      logInfo(`remainingAfter(ticks=80.32, initial=50): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0682 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0683
     * @tc.name      WindowStartIcon_RemainingAfter_0683
     * @tc.desc      remainingAfter(ticks=50, initial=170) returns 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0683', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0683 begin`);
      const actual: number = remainingAfter(50, 170);
      logInfo(`remainingAfter(ticks=50, initial=170): actual=${actual}`);
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}RemainingAfter_0683 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0684
     * @tc.name      WindowStartIcon_RemainingAfter_0684
     * @tc.desc      remainingAfter(ticks=45, initial=55) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0684', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0684 begin`);
      const actual: number = remainingAfter(45, 55);
      logInfo(`remainingAfter(ticks=45, initial=55): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}RemainingAfter_0684 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0685
     * @tc.name      WindowStartIcon_RemainingAfter_0685
     * @tc.desc      remainingAfter(ticks=185, initial=40) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0685', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0685 begin`);
      const actual: number = remainingAfter(185, 40);
      logInfo(`remainingAfter(ticks=185, initial=40): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0685 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0686
     * @tc.name      WindowStartIcon_RemainingAfter_0686
     * @tc.desc      remainingAfter(ticks=4, initial=55) returns 51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0686', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0686 begin`);
      const actual: number = remainingAfter(4, 55);
      logInfo(`remainingAfter(ticks=4, initial=55): actual=${actual}`);
      expect(actual).assertEqual(51);
      logInfo(`${BUNDLE}RemainingAfter_0686 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0687
     * @tc.name      WindowStartIcon_RemainingAfter_0687
     * @tc.desc      remainingAfter(ticks=135, initial=95) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0687', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0687 begin`);
      const actual: number = remainingAfter(135, 95);
      logInfo(`remainingAfter(ticks=135, initial=95): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0687 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0688
     * @tc.name      WindowStartIcon_RemainingAfter_0688
     * @tc.desc      remainingAfter(ticks=58.09, initial=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0688', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0688 begin`);
      const actual: number = remainingAfter(58.09, 3);
      logInfo(`remainingAfter(ticks=58.09, initial=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0688 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0689
     * @tc.name      WindowStartIcon_RemainingAfter_0689
     * @tc.desc      remainingAfter(ticks=-1, initial=80) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0689', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0689 begin`);
      const actual: number = remainingAfter(-1, 80);
      logInfo(`remainingAfter(ticks=-1, initial=80): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}RemainingAfter_0689 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0690
     * @tc.name      WindowStartIcon_RemainingAfter_0690
     * @tc.desc      remainingAfter(ticks=65, initial=140) returns 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0690', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0690 begin`);
      const actual: number = remainingAfter(65, 140);
      logInfo(`remainingAfter(ticks=65, initial=140): actual=${actual}`);
      expect(actual).assertEqual(75);
      logInfo(`${BUNDLE}RemainingAfter_0690 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0691
     * @tc.name      WindowStartIcon_RemainingAfter_0691
     * @tc.desc      remainingAfter(ticks=95, initial=41.89) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0691', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0691 begin`);
      const actual: number = remainingAfter(95, 41.89);
      logInfo(`remainingAfter(ticks=95, initial=41.89): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0691 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0692
     * @tc.name      WindowStartIcon_RemainingAfter_0692
     * @tc.desc      remainingAfter(ticks=135, initial=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0692', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0692 begin`);
      const actual: number = remainingAfter(135, 2);
      logInfo(`remainingAfter(ticks=135, initial=2): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0692 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0693
     * @tc.name      WindowStartIcon_RemainingAfter_0693
     * @tc.desc      remainingAfter(ticks=58.09, initial=40) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0693', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0693 begin`);
      const actual: number = remainingAfter(58.09, 40);
      logInfo(`remainingAfter(ticks=58.09, initial=40): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0693 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0694
     * @tc.name      WindowStartIcon_RemainingAfter_0694
     * @tc.desc      remainingAfter(ticks=135, initial=135) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0694', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0694 begin`);
      const actual: number = remainingAfter(135, 135);
      logInfo(`remainingAfter(ticks=135, initial=135): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0694 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0695
     * @tc.name      WindowStartIcon_RemainingAfter_0695
     * @tc.desc      remainingAfter(ticks=162, initial=60) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0695', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0695 begin`);
      const actual: number = remainingAfter(162, 60);
      logInfo(`remainingAfter(ticks=162, initial=60): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0695 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0696
     * @tc.name      WindowStartIcon_RemainingAfter_0696
     * @tc.desc      remainingAfter(ticks=4, initial=140) returns 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0696', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0696 begin`);
      const actual: number = remainingAfter(4, 140);
      logInfo(`remainingAfter(ticks=4, initial=140): actual=${actual}`);
      expect(actual).assertEqual(136);
      logInfo(`${BUNDLE}RemainingAfter_0696 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0697
     * @tc.name      WindowStartIcon_RemainingAfter_0697
     * @tc.desc      remainingAfter(ticks=135, initial=145) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0697', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0697 begin`);
      const actual: number = remainingAfter(135, 145);
      logInfo(`remainingAfter(ticks=135, initial=145): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}RemainingAfter_0697 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0698
     * @tc.name      WindowStartIcon_RemainingAfter_0698
     * @tc.desc      remainingAfter(ticks=115, initial=91) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0698', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0698 begin`);
      const actual: number = remainingAfter(115, 91);
      logInfo(`remainingAfter(ticks=115, initial=91): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0698 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0699
     * @tc.name      WindowStartIcon_RemainingAfter_0699
     * @tc.desc      remainingAfter(ticks=50, initial=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0699', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0699 begin`);
      const actual: number = remainingAfter(50, 10);
      logInfo(`remainingAfter(ticks=50, initial=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0699 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0700
     * @tc.name      WindowStartIcon_RemainingAfter_0700
     * @tc.desc      remainingAfter(ticks=55, initial=160) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0700 begin`);
      const actual: number = remainingAfter(55, 160);
      logInfo(`remainingAfter(ticks=55, initial=160): actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}RemainingAfter_0700 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0701
     * @tc.name      WindowStartIcon_RemainingAfter_0701
     * @tc.desc      remainingAfter(ticks=145, initial=20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0701', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0701 begin`);
      const actual: number = remainingAfter(145, 20);
      logInfo(`remainingAfter(ticks=145, initial=20): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0701 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0702
     * @tc.name      WindowStartIcon_RemainingAfter_0702
     * @tc.desc      remainingAfter(ticks=-5, initial=135) returns 135
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0702', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0702 begin`);
      const actual: number = remainingAfter(-5, 135);
      logInfo(`remainingAfter(ticks=-5, initial=135): actual=${actual}`);
      expect(actual).assertEqual(135);
      logInfo(`${BUNDLE}RemainingAfter_0702 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0703
     * @tc.name      WindowStartIcon_RemainingAfter_0703
     * @tc.desc      remainingAfter(ticks=195, initial=41.89) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0703', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0703 begin`);
      const actual: number = remainingAfter(195, 41.89);
      logInfo(`remainingAfter(ticks=195, initial=41.89): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0703 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0704
     * @tc.name      WindowStartIcon_RemainingAfter_0704
     * @tc.desc      remainingAfter(ticks=175, initial=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0704', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0704 begin`);
      const actual: number = remainingAfter(175, 15);
      logInfo(`remainingAfter(ticks=175, initial=15): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0704 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0705
     * @tc.name      WindowStartIcon_RemainingAfter_0705
     * @tc.desc      remainingAfter(ticks=115, initial=135) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0705', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0705 begin`);
      const actual: number = remainingAfter(115, 135);
      logInfo(`remainingAfter(ticks=115, initial=135): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}RemainingAfter_0705 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0706
     * @tc.name      WindowStartIcon_RemainingAfter_0706
     * @tc.desc      remainingAfter(ticks=199, initial=155) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0706', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0706 begin`);
      const actual: number = remainingAfter(199, 155);
      logInfo(`remainingAfter(ticks=199, initial=155): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0706 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0707
     * @tc.name      WindowStartIcon_RemainingAfter_0707
     * @tc.desc      remainingAfter(ticks=45, initial=125) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0707', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0707 begin`);
      const actual: number = remainingAfter(45, 125);
      logInfo(`remainingAfter(ticks=45, initial=125): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}RemainingAfter_0707 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0708
     * @tc.name      WindowStartIcon_RemainingAfter_0708
     * @tc.desc      remainingAfter(ticks=80.32, initial=35) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0708', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0708 begin`);
      const actual: number = remainingAfter(80.32, 35);
      logInfo(`remainingAfter(ticks=80.32, initial=35): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0708 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0709
     * @tc.name      WindowStartIcon_RemainingAfter_0709
     * @tc.desc      remainingAfter(ticks=135, initial=185) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0709', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0709 begin`);
      const actual: number = remainingAfter(135, 185);
      logInfo(`remainingAfter(ticks=135, initial=185): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}RemainingAfter_0709 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0710
     * @tc.name      WindowStartIcon_RemainingAfter_0710
     * @tc.desc      remainingAfter(ticks=70, initial=45) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0710', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0710 begin`);
      const actual: number = remainingAfter(70, 45);
      logInfo(`remainingAfter(ticks=70, initial=45): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0710 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0711
     * @tc.name      WindowStartIcon_RemainingAfter_0711
     * @tc.desc      remainingAfter(ticks=142, initial=96.17) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0711', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0711 begin`);
      const actual: number = remainingAfter(142, 96.17);
      logInfo(`remainingAfter(ticks=142, initial=96.17): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0711 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0712
     * @tc.name      WindowStartIcon_RemainingAfter_0712
     * @tc.desc      remainingAfter(ticks=80, initial=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0712', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0712 begin`);
      const actual: number = remainingAfter(80, -1);
      logInfo(`remainingAfter(ticks=80, initial=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0712 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0713
     * @tc.name      WindowStartIcon_RemainingAfter_0713
     * @tc.desc      remainingAfter(ticks=60, initial=130) returns 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0713', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0713 begin`);
      const actual: number = remainingAfter(60, 130);
      logInfo(`remainingAfter(ticks=60, initial=130): actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}RemainingAfter_0713 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0714
     * @tc.name      WindowStartIcon_RemainingAfter_0714
     * @tc.desc      remainingAfter(ticks=50.37, initial=-26) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0714', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0714 begin`);
      const actual: number = remainingAfter(50.37, -26);
      logInfo(`remainingAfter(ticks=50.37, initial=-26): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0714 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0715
     * @tc.name      WindowStartIcon_RemainingAfter_0715
     * @tc.desc      remainingAfter(ticks=200, initial=130) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0715', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0715 begin`);
      const actual: number = remainingAfter(200, 130);
      logInfo(`remainingAfter(ticks=200, initial=130): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0715 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0716
     * @tc.name      WindowStartIcon_RemainingAfter_0716
     * @tc.desc      remainingAfter(ticks=142, initial=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0716', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0716 begin`);
      const actual: number = remainingAfter(142, -1);
      logInfo(`remainingAfter(ticks=142, initial=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0716 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0717
     * @tc.name      WindowStartIcon_RemainingAfter_0717
     * @tc.desc      remainingAfter(ticks=56, initial=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0717', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0717 begin`);
      const actual: number = remainingAfter(56, 15);
      logInfo(`remainingAfter(ticks=56, initial=15): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0717 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0718
     * @tc.name      WindowStartIcon_RemainingAfter_0718
     * @tc.desc      remainingAfter(ticks=50.37, initial=-92) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0718', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0718 begin`);
      const actual: number = remainingAfter(50.37, -92);
      logInfo(`remainingAfter(ticks=50.37, initial=-92): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0718 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0719
     * @tc.name      WindowStartIcon_RemainingAfter_0719
     * @tc.desc      remainingAfter(ticks=95, initial=35) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0719', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0719 begin`);
      const actual: number = remainingAfter(95, 35);
      logInfo(`remainingAfter(ticks=95, initial=35): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0719 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0720
     * @tc.name      WindowStartIcon_RemainingAfter_0720
     * @tc.desc      remainingAfter(ticks=80, initial=20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0720', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0720 begin`);
      const actual: number = remainingAfter(80, 20);
      logInfo(`remainingAfter(ticks=80, initial=20): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0720 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0721
     * @tc.name      WindowStartIcon_RemainingAfter_0721
     * @tc.desc      remainingAfter(ticks=125, initial=105) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0721', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0721 begin`);
      const actual: number = remainingAfter(125, 105);
      logInfo(`remainingAfter(ticks=125, initial=105): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0721 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0722
     * @tc.name      WindowStartIcon_RemainingAfter_0722
     * @tc.desc      remainingAfter(ticks=155, initial=70) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0722', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0722 begin`);
      const actual: number = remainingAfter(155, 70);
      logInfo(`remainingAfter(ticks=155, initial=70): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0722 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0723
     * @tc.name      WindowStartIcon_RemainingAfter_0723
     * @tc.desc      remainingAfter(ticks=75, initial=110) returns 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0723', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0723 begin`);
      const actual: number = remainingAfter(75, 110);
      logInfo(`remainingAfter(ticks=75, initial=110): actual=${actual}`);
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}RemainingAfter_0723 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0724
     * @tc.name      WindowStartIcon_RemainingAfter_0724
     * @tc.desc      remainingAfter(ticks=50.37, initial=200) returns 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0724', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0724 begin`);
      const actual: number = remainingAfter(50.37, 200);
      logInfo(`remainingAfter(ticks=50.37, initial=200): actual=${actual}`);
      expect(actual).assertEqual(150);
      logInfo(`${BUNDLE}RemainingAfter_0724 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0725
     * @tc.name      WindowStartIcon_RemainingAfter_0725
     * @tc.desc      remainingAfter(ticks=5, initial=165) returns 160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0725', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0725 begin`);
      const actual: number = remainingAfter(5, 165);
      logInfo(`remainingAfter(ticks=5, initial=165): actual=${actual}`);
      expect(actual).assertEqual(160);
      logInfo(`${BUNDLE}RemainingAfter_0725 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0726
     * @tc.name      WindowStartIcon_RemainingAfter_0726
     * @tc.desc      remainingAfter(ticks=56, initial=-26) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0726', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0726 begin`);
      const actual: number = remainingAfter(56, -26);
      logInfo(`remainingAfter(ticks=56, initial=-26): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0726 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0727
     * @tc.name      WindowStartIcon_RemainingAfter_0727
     * @tc.desc      remainingAfter(ticks=40, initial=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0727', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0727 begin`);
      const actual: number = remainingAfter(40, 10);
      logInfo(`remainingAfter(ticks=40, initial=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0727 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0728
     * @tc.name      WindowStartIcon_RemainingAfter_0728
     * @tc.desc      remainingAfter(ticks=10, initial=160) returns 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0728', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0728 begin`);
      const actual: number = remainingAfter(10, 160);
      logInfo(`remainingAfter(ticks=10, initial=160): actual=${actual}`);
      expect(actual).assertEqual(150);
      logInfo(`${BUNDLE}RemainingAfter_0728 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0729
     * @tc.name      WindowStartIcon_RemainingAfter_0729
     * @tc.desc      remainingAfter(ticks=199, initial=-73) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0729', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0729 begin`);
      const actual: number = remainingAfter(199, -73);
      logInfo(`remainingAfter(ticks=199, initial=-73): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0729 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0730
     * @tc.name      WindowStartIcon_RemainingAfter_0730
     * @tc.desc      remainingAfter(ticks=100, initial=85) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0730', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0730 begin`);
      const actual: number = remainingAfter(100, 85);
      logInfo(`remainingAfter(ticks=100, initial=85): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0730 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0731
     * @tc.name      WindowStartIcon_RemainingAfter_0731
     * @tc.desc      remainingAfter(ticks=44, initial=20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0731', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0731 begin`);
      const actual: number = remainingAfter(44, 20);
      logInfo(`remainingAfter(ticks=44, initial=20): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0731 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0732
     * @tc.name      WindowStartIcon_RemainingAfter_0732
     * @tc.desc      remainingAfter(ticks=115, initial=180) returns 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0732', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0732 begin`);
      const actual: number = remainingAfter(115, 180);
      logInfo(`remainingAfter(ticks=115, initial=180): actual=${actual}`);
      expect(actual).assertEqual(65);
      logInfo(`${BUNDLE}RemainingAfter_0732 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0733
     * @tc.name      WindowStartIcon_RemainingAfter_0733
     * @tc.desc      remainingAfter(ticks=55, initial=-92) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0733', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0733 begin`);
      const actual: number = remainingAfter(55, -92);
      logInfo(`remainingAfter(ticks=55, initial=-92): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0733 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0734
     * @tc.name      WindowStartIcon_RemainingAfter_0734
     * @tc.desc      remainingAfter(ticks=70, initial=190) returns 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0734', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0734 begin`);
      const actual: number = remainingAfter(70, 190);
      logInfo(`remainingAfter(ticks=70, initial=190): actual=${actual}`);
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}RemainingAfter_0734 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0735
     * @tc.name      WindowStartIcon_RemainingAfter_0735
     * @tc.desc      remainingAfter(ticks=75, initial=50) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0735', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0735 begin`);
      const actual: number = remainingAfter(75, 50);
      logInfo(`remainingAfter(ticks=75, initial=50): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0735 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0736
     * @tc.name      WindowStartIcon_RemainingAfter_0736
     * @tc.desc      remainingAfter(ticks=145, initial=176) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0736', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0736 begin`);
      const actual: number = remainingAfter(145, 176);
      logInfo(`remainingAfter(ticks=145, initial=176): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}RemainingAfter_0736 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0737
     * @tc.name      WindowStartIcon_RemainingAfter_0737
     * @tc.desc      remainingAfter(ticks=-5, initial=80) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0737', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0737 begin`);
      const actual: number = remainingAfter(-5, 80);
      logInfo(`remainingAfter(ticks=-5, initial=80): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}RemainingAfter_0737 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0738
     * @tc.name      WindowStartIcon_RemainingAfter_0738
     * @tc.desc      remainingAfter(ticks=95, initial=-92) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0738', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0738 begin`);
      const actual: number = remainingAfter(95, -92);
      logInfo(`remainingAfter(ticks=95, initial=-92): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0738 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0739
     * @tc.name      WindowStartIcon_RemainingAfter_0739
     * @tc.desc      remainingAfter(ticks=175, initial=115) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0739', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0739 begin`);
      const actual: number = remainingAfter(175, 115);
      logInfo(`remainingAfter(ticks=175, initial=115): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0739 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0740
     * @tc.name      WindowStartIcon_RemainingAfter_0740
     * @tc.desc      remainingAfter(ticks=135, initial=120) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0740', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0740 begin`);
      const actual: number = remainingAfter(135, 120);
      logInfo(`remainingAfter(ticks=135, initial=120): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0740 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0741
     * @tc.name      WindowStartIcon_RemainingAfter_0741
     * @tc.desc      remainingAfter(ticks=44, initial=70) returns 26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0741', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0741 begin`);
      const actual: number = remainingAfter(44, 70);
      logInfo(`remainingAfter(ticks=44, initial=70): actual=${actual}`);
      expect(actual).assertEqual(26);
      logInfo(`${BUNDLE}RemainingAfter_0741 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0742
     * @tc.name      WindowStartIcon_RemainingAfter_0742
     * @tc.desc      remainingAfter(ticks=75, initial=175) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0742', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0742 begin`);
      const actual: number = remainingAfter(75, 175);
      logInfo(`remainingAfter(ticks=75, initial=175): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}RemainingAfter_0742 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0743
     * @tc.name      WindowStartIcon_RemainingAfter_0743
     * @tc.desc      remainingAfter(ticks=35, initial=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0743', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0743 begin`);
      const actual: number = remainingAfter(35, 10);
      logInfo(`remainingAfter(ticks=35, initial=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0743 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0744
     * @tc.name      WindowStartIcon_RemainingAfter_0744
     * @tc.desc      remainingAfter(ticks=120, initial=30) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0744', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0744 begin`);
      const actual: number = remainingAfter(120, 30);
      logInfo(`remainingAfter(ticks=120, initial=30): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0744 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0745
     * @tc.name      WindowStartIcon_RemainingAfter_0745
     * @tc.desc      remainingAfter(ticks=90, initial=150) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0745', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0745 begin`);
      const actual: number = remainingAfter(90, 150);
      logInfo(`remainingAfter(ticks=90, initial=150): actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}RemainingAfter_0745 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0746
     * @tc.name      WindowStartIcon_RemainingAfter_0746
     * @tc.desc      remainingAfter(ticks=25, initial=130) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0746', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0746 begin`);
      const actual: number = remainingAfter(25, 130);
      logInfo(`remainingAfter(ticks=25, initial=130): actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}RemainingAfter_0746 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0747
     * @tc.name      WindowStartIcon_RemainingAfter_0747
     * @tc.desc      remainingAfter(ticks=200, initial=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0747', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0747 begin`);
      const actual: number = remainingAfter(200, -1);
      logInfo(`remainingAfter(ticks=200, initial=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0747 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0748
     * @tc.name      WindowStartIcon_RemainingAfter_0748
     * @tc.desc      remainingAfter(ticks=155, initial=-26) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0748', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0748 begin`);
      const actual: number = remainingAfter(155, -26);
      logInfo(`remainingAfter(ticks=155, initial=-26): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0748 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0749
     * @tc.name      WindowStartIcon_RemainingAfter_0749
     * @tc.desc      remainingAfter(ticks=199, initial=-26) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0749', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0749 begin`);
      const actual: number = remainingAfter(199, -26);
      logInfo(`remainingAfter(ticks=199, initial=-26): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0749 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0750
     * @tc.name      WindowStartIcon_RemainingAfter_0750
     * @tc.desc      remainingAfter(ticks=190, initial=115) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0750', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0750 begin`);
      const actual: number = remainingAfter(190, 115);
      logInfo(`remainingAfter(ticks=190, initial=115): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0750 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0751
     * @tc.name      WindowStartIcon_RemainingAfter_0751
     * @tc.desc      remainingAfter(ticks=-5, initial=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0751', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0751 begin`);
      const actual: number = remainingAfter(-5, -1);
      logInfo(`remainingAfter(ticks=-5, initial=-1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}RemainingAfter_0751 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0752
     * @tc.name      WindowStartIcon_RemainingAfter_0752
     * @tc.desc      remainingAfter(ticks=35, initial=136) returns 101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0752', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0752 begin`);
      const actual: number = remainingAfter(35, 136);
      logInfo(`remainingAfter(ticks=35, initial=136): actual=${actual}`);
      expect(actual).assertEqual(101);
      logInfo(`${BUNDLE}RemainingAfter_0752 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0753
     * @tc.name      WindowStartIcon_RemainingAfter_0753
     * @tc.desc      remainingAfter(ticks=1, initial=65) returns 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0753', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0753 begin`);
      const actual: number = remainingAfter(1, 65);
      logInfo(`remainingAfter(ticks=1, initial=65): actual=${actual}`);
      expect(actual).assertEqual(64);
      logInfo(`${BUNDLE}RemainingAfter_0753 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0754
     * @tc.name      WindowStartIcon_RemainingAfter_0754
     * @tc.desc      remainingAfter(ticks=75, initial=176) returns 101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0754', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0754 begin`);
      const actual: number = remainingAfter(75, 176);
      logInfo(`remainingAfter(ticks=75, initial=176): actual=${actual}`);
      expect(actual).assertEqual(101);
      logInfo(`${BUNDLE}RemainingAfter_0754 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0755
     * @tc.name      WindowStartIcon_RemainingAfter_0755
     * @tc.desc      remainingAfter(ticks=150, initial=80) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0755', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0755 begin`);
      const actual: number = remainingAfter(150, 80);
      logInfo(`remainingAfter(ticks=150, initial=80): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0755 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0756
     * @tc.name      WindowStartIcon_RemainingAfter_0756
     * @tc.desc      remainingAfter(ticks=30, initial=140) returns 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0756', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0756 begin`);
      const actual: number = remainingAfter(30, 140);
      logInfo(`remainingAfter(ticks=30, initial=140): actual=${actual}`);
      expect(actual).assertEqual(110);
      logInfo(`${BUNDLE}RemainingAfter_0756 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0757
     * @tc.name      WindowStartIcon_RemainingAfter_0757
     * @tc.desc      remainingAfter(ticks=80.32, initial=195) returns 115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0757', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0757 begin`);
      const actual: number = remainingAfter(80.32, 195);
      logInfo(`remainingAfter(ticks=80.32, initial=195): actual=${actual}`);
      expect(actual).assertEqual(115);
      logInfo(`${BUNDLE}RemainingAfter_0757 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0758
     * @tc.name      WindowStartIcon_RemainingAfter_0758
     * @tc.desc      remainingAfter(ticks=199, initial=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0758', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0758 begin`);
      const actual: number = remainingAfter(199, 10);
      logInfo(`remainingAfter(ticks=199, initial=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0758 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0759
     * @tc.name      WindowStartIcon_RemainingAfter_0759
     * @tc.desc      remainingAfter(ticks=165, initial=65) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0759', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0759 begin`);
      const actual: number = remainingAfter(165, 65);
      logInfo(`remainingAfter(ticks=165, initial=65): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0759 end`);
    });
  });
}
