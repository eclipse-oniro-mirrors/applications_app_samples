'use static';

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
import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { WishBoard } from '../Shared/WishBoard';
import { logSuite } from '../Shared/Copy';

export default function SequenceFiveCTest(): void {
  describe('SequenceFiveCTest', () => {
    beforeAll(() => {
      logSuite('SequenceFiveCTest', 'begin');
    });
    beforeEach(async () => {
      // Yield so long transition matrices do not starve the watchdog.
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('SequenceFiveCTest', 'end');
    });

    /**
     * @tc.name SequenceFiveCTest_case_0001
     * @tc.desc state-transition: replay user action sequence CUUUU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0001', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.clickUpdate();
      board.clickUpdate();
      board.clickUpdate();
      expect(board.parentText).assertEqual('');
      expect(board.mainTitle()).assertEqual('');
      expect(board.bottomEcho()).assertEqual('');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(4);
      expect(board.inputEvents).assertEqual(1);
      expect(board.isEmpty()).assertEqual(true);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0002
     * @tc.desc state-transition: replay user action sequence CAUUU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0002', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.clickUpdate();
      board.clickUpdate();
      board.clickUpdate();
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(3);
      expect(board.inputEvents).assertEqual(2);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0003
     * @tc.desc state-transition: replay user action sequence CNUUU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0003', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.clickUpdate();
      board.clickUpdate();
      board.clickUpdate();
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.mainTitle()).assertEqual('\u65b0');
      expect(board.bottomEcho()).assertEqual('\u65b0');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(3);
      expect(board.inputEvents).assertEqual(2);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0004
     * @tc.desc state-transition: replay user action sequence CCUUU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0004', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clearText();
      board.clickUpdate();
      board.clickUpdate();
      board.clickUpdate();
      expect(board.parentText).assertEqual('');
      expect(board.mainTitle()).assertEqual('');
      expect(board.bottomEcho()).assertEqual('');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(3);
      expect(board.inputEvents).assertEqual(2);
      expect(board.isEmpty()).assertEqual(true);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0005
     * @tc.desc state-transition: replay user action sequence CUAUU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0005', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.typeText('A');
      board.clickUpdate();
      board.clickUpdate();
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(3);
      expect(board.inputEvents).assertEqual(2);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0006
     * @tc.desc state-transition: replay user action sequence CAAUU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0006', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.typeText('A');
      board.clickUpdate();
      board.clickUpdate();
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0007
     * @tc.desc state-transition: replay user action sequence CNAUU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0007', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.typeText('A');
      board.clickUpdate();
      board.clickUpdate();
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0008
     * @tc.desc state-transition: replay user action sequence CCAUU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0008', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clearText();
      board.typeText('A');
      board.clickUpdate();
      board.clickUpdate();
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0009
     * @tc.desc state-transition: replay user action sequence CUNUU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0009', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.typeText('\u65b0');
      board.clickUpdate();
      board.clickUpdate();
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.mainTitle()).assertEqual('\u65b0');
      expect(board.bottomEcho()).assertEqual('\u65b0');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(3);
      expect(board.inputEvents).assertEqual(2);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0010
     * @tc.desc state-transition: replay user action sequence CANUU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0010', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.typeText('\u65b0');
      board.clickUpdate();
      board.clickUpdate();
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.mainTitle()).assertEqual('\u65b0');
      expect(board.bottomEcho()).assertEqual('\u65b0');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0011
     * @tc.desc state-transition: replay user action sequence CNNUU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0011', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.typeText('\u65b0');
      board.clickUpdate();
      board.clickUpdate();
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.mainTitle()).assertEqual('\u65b0');
      expect(board.bottomEcho()).assertEqual('\u65b0');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0012
     * @tc.desc state-transition: replay user action sequence CCNUU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0012', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clearText();
      board.typeText('\u65b0');
      board.clickUpdate();
      board.clickUpdate();
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.mainTitle()).assertEqual('\u65b0');
      expect(board.bottomEcho()).assertEqual('\u65b0');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0013
     * @tc.desc state-transition: replay user action sequence CUCUU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0013', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.clearText();
      board.clickUpdate();
      board.clickUpdate();
      expect(board.parentText).assertEqual('');
      expect(board.mainTitle()).assertEqual('');
      expect(board.bottomEcho()).assertEqual('');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(3);
      expect(board.inputEvents).assertEqual(2);
      expect(board.isEmpty()).assertEqual(true);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0014
     * @tc.desc state-transition: replay user action sequence CACUU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0014', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.clearText();
      board.clickUpdate();
      board.clickUpdate();
      expect(board.parentText).assertEqual('');
      expect(board.mainTitle()).assertEqual('');
      expect(board.bottomEcho()).assertEqual('');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(true);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0015
     * @tc.desc state-transition: replay user action sequence CNCUU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0015', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.clearText();
      board.clickUpdate();
      board.clickUpdate();
      expect(board.parentText).assertEqual('');
      expect(board.mainTitle()).assertEqual('');
      expect(board.bottomEcho()).assertEqual('');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(true);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0016
     * @tc.desc state-transition: replay user action sequence CCCUU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0016', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clearText();
      board.clearText();
      board.clickUpdate();
      board.clickUpdate();
      expect(board.parentText).assertEqual('');
      expect(board.mainTitle()).assertEqual('');
      expect(board.bottomEcho()).assertEqual('');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(true);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0017
     * @tc.desc state-transition: replay user action sequence CUUAU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0017', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.clickUpdate();
      board.typeText('A');
      board.clickUpdate();
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(3);
      expect(board.inputEvents).assertEqual(2);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0018
     * @tc.desc state-transition: replay user action sequence CAUAU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0018', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.clickUpdate();
      board.typeText('A');
      board.clickUpdate();
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0019
     * @tc.desc state-transition: replay user action sequence CNUAU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0019', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.clickUpdate();
      board.typeText('A');
      board.clickUpdate();
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0020
     * @tc.desc state-transition: replay user action sequence CCUAU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0020', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clearText();
      board.clickUpdate();
      board.typeText('A');
      board.clickUpdate();
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0021
     * @tc.desc state-transition: replay user action sequence CUAAU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0021', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.typeText('A');
      board.typeText('A');
      board.clickUpdate();
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0022
     * @tc.desc state-transition: replay user action sequence CAAAU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0022', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.typeText('A');
      board.typeText('A');
      board.clickUpdate();
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0023
     * @tc.desc state-transition: replay user action sequence CNAAU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0023', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.typeText('A');
      board.typeText('A');
      board.clickUpdate();
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0024
     * @tc.desc state-transition: replay user action sequence CCAAU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0024', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clearText();
      board.typeText('A');
      board.typeText('A');
      board.clickUpdate();
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0025
     * @tc.desc state-transition: replay user action sequence CUNAU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0025', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.typeText('\u65b0');
      board.typeText('A');
      board.clickUpdate();
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0026
     * @tc.desc state-transition: replay user action sequence CANAU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0026', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.typeText('\u65b0');
      board.typeText('A');
      board.clickUpdate();
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0027
     * @tc.desc state-transition: replay user action sequence CNNAU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0027', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.typeText('\u65b0');
      board.typeText('A');
      board.clickUpdate();
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0028
     * @tc.desc state-transition: replay user action sequence CCNAU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0028', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clearText();
      board.typeText('\u65b0');
      board.typeText('A');
      board.clickUpdate();
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0029
     * @tc.desc state-transition: replay user action sequence CUCAU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0029', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.clearText();
      board.typeText('A');
      board.clickUpdate();
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0030
     * @tc.desc state-transition: replay user action sequence CACAU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0030', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.clearText();
      board.typeText('A');
      board.clickUpdate();
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0031
     * @tc.desc state-transition: replay user action sequence CNCAU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0031', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.clearText();
      board.typeText('A');
      board.clickUpdate();
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0032
     * @tc.desc state-transition: replay user action sequence CCCAU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0032', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clearText();
      board.clearText();
      board.typeText('A');
      board.clickUpdate();
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0033
     * @tc.desc state-transition: replay user action sequence CUUNU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0033', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.clickUpdate();
      board.typeText('\u65b0');
      board.clickUpdate();
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.mainTitle()).assertEqual('\u65b0');
      expect(board.bottomEcho()).assertEqual('\u65b0');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(3);
      expect(board.inputEvents).assertEqual(2);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0034
     * @tc.desc state-transition: replay user action sequence CAUNU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0034', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.clickUpdate();
      board.typeText('\u65b0');
      board.clickUpdate();
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.mainTitle()).assertEqual('\u65b0');
      expect(board.bottomEcho()).assertEqual('\u65b0');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0035
     * @tc.desc state-transition: replay user action sequence CNUNU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0035', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.clickUpdate();
      board.typeText('\u65b0');
      board.clickUpdate();
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.mainTitle()).assertEqual('\u65b0');
      expect(board.bottomEcho()).assertEqual('\u65b0');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0036
     * @tc.desc state-transition: replay user action sequence CCUNU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0036', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clearText();
      board.clickUpdate();
      board.typeText('\u65b0');
      board.clickUpdate();
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.mainTitle()).assertEqual('\u65b0');
      expect(board.bottomEcho()).assertEqual('\u65b0');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0037
     * @tc.desc state-transition: replay user action sequence CUANU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0037', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.typeText('A');
      board.typeText('\u65b0');
      board.clickUpdate();
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.mainTitle()).assertEqual('\u65b0');
      expect(board.bottomEcho()).assertEqual('\u65b0');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0038
     * @tc.desc state-transition: replay user action sequence CAANU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0038', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.typeText('A');
      board.typeText('\u65b0');
      board.clickUpdate();
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.mainTitle()).assertEqual('\u65b0');
      expect(board.bottomEcho()).assertEqual('\u65b0');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0039
     * @tc.desc state-transition: replay user action sequence CNANU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0039', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.typeText('A');
      board.typeText('\u65b0');
      board.clickUpdate();
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.mainTitle()).assertEqual('\u65b0');
      expect(board.bottomEcho()).assertEqual('\u65b0');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0040
     * @tc.desc state-transition: replay user action sequence CCANU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0040', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clearText();
      board.typeText('A');
      board.typeText('\u65b0');
      board.clickUpdate();
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.mainTitle()).assertEqual('\u65b0');
      expect(board.bottomEcho()).assertEqual('\u65b0');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0041
     * @tc.desc state-transition: replay user action sequence CUNNU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0041', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.typeText('\u65b0');
      board.typeText('\u65b0');
      board.clickUpdate();
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.mainTitle()).assertEqual('\u65b0');
      expect(board.bottomEcho()).assertEqual('\u65b0');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0042
     * @tc.desc state-transition: replay user action sequence CANNU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0042', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.typeText('\u65b0');
      board.typeText('\u65b0');
      board.clickUpdate();
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.mainTitle()).assertEqual('\u65b0');
      expect(board.bottomEcho()).assertEqual('\u65b0');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0043
     * @tc.desc state-transition: replay user action sequence CNNNU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0043', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.typeText('\u65b0');
      board.typeText('\u65b0');
      board.clickUpdate();
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.mainTitle()).assertEqual('\u65b0');
      expect(board.bottomEcho()).assertEqual('\u65b0');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0044
     * @tc.desc state-transition: replay user action sequence CCNNU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0044', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clearText();
      board.typeText('\u65b0');
      board.typeText('\u65b0');
      board.clickUpdate();
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.mainTitle()).assertEqual('\u65b0');
      expect(board.bottomEcho()).assertEqual('\u65b0');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0045
     * @tc.desc state-transition: replay user action sequence CUCNU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0045', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.clearText();
      board.typeText('\u65b0');
      board.clickUpdate();
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.mainTitle()).assertEqual('\u65b0');
      expect(board.bottomEcho()).assertEqual('\u65b0');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0046
     * @tc.desc state-transition: replay user action sequence CACNU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0046', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.clearText();
      board.typeText('\u65b0');
      board.clickUpdate();
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.mainTitle()).assertEqual('\u65b0');
      expect(board.bottomEcho()).assertEqual('\u65b0');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0047
     * @tc.desc state-transition: replay user action sequence CNCNU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0047', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.clearText();
      board.typeText('\u65b0');
      board.clickUpdate();
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.mainTitle()).assertEqual('\u65b0');
      expect(board.bottomEcho()).assertEqual('\u65b0');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0048
     * @tc.desc state-transition: replay user action sequence CCCNU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0048', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clearText();
      board.clearText();
      board.typeText('\u65b0');
      board.clickUpdate();
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.mainTitle()).assertEqual('\u65b0');
      expect(board.bottomEcho()).assertEqual('\u65b0');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0049
     * @tc.desc state-transition: replay user action sequence CUUCU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0049', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.clickUpdate();
      board.clearText();
      board.clickUpdate();
      expect(board.parentText).assertEqual('');
      expect(board.mainTitle()).assertEqual('');
      expect(board.bottomEcho()).assertEqual('');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(3);
      expect(board.inputEvents).assertEqual(2);
      expect(board.isEmpty()).assertEqual(true);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0050
     * @tc.desc state-transition: replay user action sequence CAUCU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0050', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.clickUpdate();
      board.clearText();
      board.clickUpdate();
      expect(board.parentText).assertEqual('');
      expect(board.mainTitle()).assertEqual('');
      expect(board.bottomEcho()).assertEqual('');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(true);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0051
     * @tc.desc state-transition: replay user action sequence CNUCU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0051', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.clickUpdate();
      board.clearText();
      board.clickUpdate();
      expect(board.parentText).assertEqual('');
      expect(board.mainTitle()).assertEqual('');
      expect(board.bottomEcho()).assertEqual('');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(true);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0052
     * @tc.desc state-transition: replay user action sequence CCUCU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0052', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clearText();
      board.clickUpdate();
      board.clearText();
      board.clickUpdate();
      expect(board.parentText).assertEqual('');
      expect(board.mainTitle()).assertEqual('');
      expect(board.bottomEcho()).assertEqual('');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(true);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0053
     * @tc.desc state-transition: replay user action sequence CUACU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0053', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.typeText('A');
      board.clearText();
      board.clickUpdate();
      expect(board.parentText).assertEqual('');
      expect(board.mainTitle()).assertEqual('');
      expect(board.bottomEcho()).assertEqual('');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(true);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0054
     * @tc.desc state-transition: replay user action sequence CAACU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0054', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.typeText('A');
      board.clearText();
      board.clickUpdate();
      expect(board.parentText).assertEqual('');
      expect(board.mainTitle()).assertEqual('');
      expect(board.bottomEcho()).assertEqual('');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(true);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0055
     * @tc.desc state-transition: replay user action sequence CNACU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0055', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.typeText('A');
      board.clearText();
      board.clickUpdate();
      expect(board.parentText).assertEqual('');
      expect(board.mainTitle()).assertEqual('');
      expect(board.bottomEcho()).assertEqual('');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(true);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0056
     * @tc.desc state-transition: replay user action sequence CCACU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0056', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clearText();
      board.typeText('A');
      board.clearText();
      board.clickUpdate();
      expect(board.parentText).assertEqual('');
      expect(board.mainTitle()).assertEqual('');
      expect(board.bottomEcho()).assertEqual('');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(true);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0057
     * @tc.desc state-transition: replay user action sequence CUNCU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0057', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.typeText('\u65b0');
      board.clearText();
      board.clickUpdate();
      expect(board.parentText).assertEqual('');
      expect(board.mainTitle()).assertEqual('');
      expect(board.bottomEcho()).assertEqual('');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(true);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0058
     * @tc.desc state-transition: replay user action sequence CANCU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0058', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.typeText('\u65b0');
      board.clearText();
      board.clickUpdate();
      expect(board.parentText).assertEqual('');
      expect(board.mainTitle()).assertEqual('');
      expect(board.bottomEcho()).assertEqual('');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(true);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0059
     * @tc.desc state-transition: replay user action sequence CNNCU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0059', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.typeText('\u65b0');
      board.clearText();
      board.clickUpdate();
      expect(board.parentText).assertEqual('');
      expect(board.mainTitle()).assertEqual('');
      expect(board.bottomEcho()).assertEqual('');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(true);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0060
     * @tc.desc state-transition: replay user action sequence CCNCU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0060', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clearText();
      board.typeText('\u65b0');
      board.clearText();
      board.clickUpdate();
      expect(board.parentText).assertEqual('');
      expect(board.mainTitle()).assertEqual('');
      expect(board.bottomEcho()).assertEqual('');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(true);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0061
     * @tc.desc state-transition: replay user action sequence CUCCU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0061', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.clearText();
      board.clearText();
      board.clickUpdate();
      expect(board.parentText).assertEqual('');
      expect(board.mainTitle()).assertEqual('');
      expect(board.bottomEcho()).assertEqual('');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(true);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0062
     * @tc.desc state-transition: replay user action sequence CACCU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0062', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.clearText();
      board.clearText();
      board.clickUpdate();
      expect(board.parentText).assertEqual('');
      expect(board.mainTitle()).assertEqual('');
      expect(board.bottomEcho()).assertEqual('');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(true);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0063
     * @tc.desc state-transition: replay user action sequence CNCCU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0063', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.clearText();
      board.clearText();
      board.clickUpdate();
      expect(board.parentText).assertEqual('');
      expect(board.mainTitle()).assertEqual('');
      expect(board.bottomEcho()).assertEqual('');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(true);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0064
     * @tc.desc state-transition: replay user action sequence CCCCU and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0064', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clearText();
      board.clearText();
      board.clearText();
      board.clickUpdate();
      expect(board.parentText).assertEqual('');
      expect(board.mainTitle()).assertEqual('');
      expect(board.bottomEcho()).assertEqual('');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(true);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0065
     * @tc.desc state-transition: replay user action sequence CUUUA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0065', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.clickUpdate();
      board.clickUpdate();
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(3);
      expect(board.inputEvents).assertEqual(2);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0066
     * @tc.desc state-transition: replay user action sequence CAUUA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0066', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.clickUpdate();
      board.clickUpdate();
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0067
     * @tc.desc state-transition: replay user action sequence CNUUA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0067', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.clickUpdate();
      board.clickUpdate();
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0068
     * @tc.desc state-transition: replay user action sequence CCUUA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0068', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clearText();
      board.clickUpdate();
      board.clickUpdate();
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0069
     * @tc.desc state-transition: replay user action sequence CUAUA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0069', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.typeText('A');
      board.clickUpdate();
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0070
     * @tc.desc state-transition: replay user action sequence CAAUA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0070', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.typeText('A');
      board.clickUpdate();
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0071
     * @tc.desc state-transition: replay user action sequence CNAUA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0071', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.typeText('A');
      board.clickUpdate();
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0072
     * @tc.desc state-transition: replay user action sequence CCAUA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0072', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clearText();
      board.typeText('A');
      board.clickUpdate();
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0073
     * @tc.desc state-transition: replay user action sequence CUNUA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0073', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.typeText('\u65b0');
      board.clickUpdate();
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0074
     * @tc.desc state-transition: replay user action sequence CANUA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0074', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.typeText('\u65b0');
      board.clickUpdate();
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0075
     * @tc.desc state-transition: replay user action sequence CNNUA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0075', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.typeText('\u65b0');
      board.clickUpdate();
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0076
     * @tc.desc state-transition: replay user action sequence CCNUA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0076', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clearText();
      board.typeText('\u65b0');
      board.clickUpdate();
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0077
     * @tc.desc state-transition: replay user action sequence CUCUA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0077', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.clearText();
      board.clickUpdate();
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0078
     * @tc.desc state-transition: replay user action sequence CACUA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0078', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.clearText();
      board.clickUpdate();
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0079
     * @tc.desc state-transition: replay user action sequence CNCUA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0079', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.clearText();
      board.clickUpdate();
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0080
     * @tc.desc state-transition: replay user action sequence CCCUA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0080', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clearText();
      board.clearText();
      board.clickUpdate();
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0081
     * @tc.desc state-transition: replay user action sequence CUUAA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0081', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.clickUpdate();
      board.typeText('A');
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0082
     * @tc.desc state-transition: replay user action sequence CAUAA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0082', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.clickUpdate();
      board.typeText('A');
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0083
     * @tc.desc state-transition: replay user action sequence CNUAA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0083', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.clickUpdate();
      board.typeText('A');
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0084
     * @tc.desc state-transition: replay user action sequence CCUAA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0084', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clearText();
      board.clickUpdate();
      board.typeText('A');
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0085
     * @tc.desc state-transition: replay user action sequence CUAAA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0085', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.typeText('A');
      board.typeText('A');
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0086
     * @tc.desc state-transition: replay user action sequence CAAAA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0086', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.typeText('A');
      board.typeText('A');
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      expect(board.inputEvents).assertEqual(5);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0087
     * @tc.desc state-transition: replay user action sequence CNAAA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0087', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.typeText('A');
      board.typeText('A');
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      expect(board.inputEvents).assertEqual(5);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0088
     * @tc.desc state-transition: replay user action sequence CCAAA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0088', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clearText();
      board.typeText('A');
      board.typeText('A');
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      expect(board.inputEvents).assertEqual(5);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0089
     * @tc.desc state-transition: replay user action sequence CUNAA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0089', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.typeText('\u65b0');
      board.typeText('A');
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0090
     * @tc.desc state-transition: replay user action sequence CANAA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0090', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.typeText('\u65b0');
      board.typeText('A');
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      expect(board.inputEvents).assertEqual(5);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0091
     * @tc.desc state-transition: replay user action sequence CNNAA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0091', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.typeText('\u65b0');
      board.typeText('A');
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      expect(board.inputEvents).assertEqual(5);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0092
     * @tc.desc state-transition: replay user action sequence CCNAA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0092', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clearText();
      board.typeText('\u65b0');
      board.typeText('A');
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      expect(board.inputEvents).assertEqual(5);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0093
     * @tc.desc state-transition: replay user action sequence CUCAA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0093', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.clearText();
      board.typeText('A');
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0094
     * @tc.desc state-transition: replay user action sequence CACAA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0094', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.clearText();
      board.typeText('A');
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      expect(board.inputEvents).assertEqual(5);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0095
     * @tc.desc state-transition: replay user action sequence CNCAA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0095', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.clearText();
      board.typeText('A');
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      expect(board.inputEvents).assertEqual(5);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0096
     * @tc.desc state-transition: replay user action sequence CCCAA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0096', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clearText();
      board.clearText();
      board.typeText('A');
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      expect(board.inputEvents).assertEqual(5);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0097
     * @tc.desc state-transition: replay user action sequence CUUNA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0097', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.clickUpdate();
      board.typeText('\u65b0');
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0098
     * @tc.desc state-transition: replay user action sequence CAUNA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0098', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.clickUpdate();
      board.typeText('\u65b0');
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0099
     * @tc.desc state-transition: replay user action sequence CNUNA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0099', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.clickUpdate();
      board.typeText('\u65b0');
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0100
     * @tc.desc state-transition: replay user action sequence CCUNA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0100', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clearText();
      board.clickUpdate();
      board.typeText('\u65b0');
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0101
     * @tc.desc state-transition: replay user action sequence CUANA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0101', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.typeText('A');
      board.typeText('\u65b0');
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0102
     * @tc.desc state-transition: replay user action sequence CAANA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0102', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.typeText('A');
      board.typeText('\u65b0');
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      expect(board.inputEvents).assertEqual(5);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0103
     * @tc.desc state-transition: replay user action sequence CNANA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0103', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.typeText('A');
      board.typeText('\u65b0');
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      expect(board.inputEvents).assertEqual(5);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0104
     * @tc.desc state-transition: replay user action sequence CCANA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0104', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clearText();
      board.typeText('A');
      board.typeText('\u65b0');
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      expect(board.inputEvents).assertEqual(5);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0105
     * @tc.desc state-transition: replay user action sequence CUNNA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0105', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.typeText('\u65b0');
      board.typeText('\u65b0');
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0106
     * @tc.desc state-transition: replay user action sequence CANNA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0106', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.typeText('\u65b0');
      board.typeText('\u65b0');
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      expect(board.inputEvents).assertEqual(5);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0107
     * @tc.desc state-transition: replay user action sequence CNNNA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0107', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.typeText('\u65b0');
      board.typeText('\u65b0');
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      expect(board.inputEvents).assertEqual(5);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0108
     * @tc.desc state-transition: replay user action sequence CCNNA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0108', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clearText();
      board.typeText('\u65b0');
      board.typeText('\u65b0');
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      expect(board.inputEvents).assertEqual(5);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0109
     * @tc.desc state-transition: replay user action sequence CUCNA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0109', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.clearText();
      board.typeText('\u65b0');
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0110
     * @tc.desc state-transition: replay user action sequence CACNA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0110', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.clearText();
      board.typeText('\u65b0');
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      expect(board.inputEvents).assertEqual(5);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0111
     * @tc.desc state-transition: replay user action sequence CNCNA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0111', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.clearText();
      board.typeText('\u65b0');
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      expect(board.inputEvents).assertEqual(5);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0112
     * @tc.desc state-transition: replay user action sequence CCCNA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0112', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clearText();
      board.clearText();
      board.typeText('\u65b0');
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      expect(board.inputEvents).assertEqual(5);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0113
     * @tc.desc state-transition: replay user action sequence CUUCA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0113', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.clickUpdate();
      board.clearText();
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0114
     * @tc.desc state-transition: replay user action sequence CAUCA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0114', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.clickUpdate();
      board.clearText();
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0115
     * @tc.desc state-transition: replay user action sequence CNUCA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0115', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.clickUpdate();
      board.clearText();
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0116
     * @tc.desc state-transition: replay user action sequence CCUCA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0116', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clearText();
      board.clickUpdate();
      board.clearText();
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0117
     * @tc.desc state-transition: replay user action sequence CUACA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0117', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.typeText('A');
      board.clearText();
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0118
     * @tc.desc state-transition: replay user action sequence CAACA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0118', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.typeText('A');
      board.clearText();
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      expect(board.inputEvents).assertEqual(5);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0119
     * @tc.desc state-transition: replay user action sequence CNACA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0119', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.typeText('A');
      board.clearText();
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      expect(board.inputEvents).assertEqual(5);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0120
     * @tc.desc state-transition: replay user action sequence CCACA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0120', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clearText();
      board.typeText('A');
      board.clearText();
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      expect(board.inputEvents).assertEqual(5);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0121
     * @tc.desc state-transition: replay user action sequence CUNCA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0121', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.typeText('\u65b0');
      board.clearText();
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0122
     * @tc.desc state-transition: replay user action sequence CANCA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0122', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.typeText('\u65b0');
      board.clearText();
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      expect(board.inputEvents).assertEqual(5);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0123
     * @tc.desc state-transition: replay user action sequence CNNCA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0123', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.typeText('\u65b0');
      board.clearText();
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      expect(board.inputEvents).assertEqual(5);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0124
     * @tc.desc state-transition: replay user action sequence CCNCA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0124', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clearText();
      board.typeText('\u65b0');
      board.clearText();
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      expect(board.inputEvents).assertEqual(5);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0125
     * @tc.desc state-transition: replay user action sequence CUCCA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0125', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.clearText();
      board.clearText();
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0126
     * @tc.desc state-transition: replay user action sequence CACCA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0126', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.clearText();
      board.clearText();
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      expect(board.inputEvents).assertEqual(5);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0127
     * @tc.desc state-transition: replay user action sequence CNCCA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0127', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.clearText();
      board.clearText();
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      expect(board.inputEvents).assertEqual(5);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0128
     * @tc.desc state-transition: replay user action sequence CCCCA and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0128', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clearText();
      board.clearText();
      board.clearText();
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      expect(board.inputEvents).assertEqual(5);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0129
     * @tc.desc state-transition: replay user action sequence CUUUN and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0129', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.clickUpdate();
      board.clickUpdate();
      board.typeText('\u65b0');
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.mainTitle()).assertEqual('\u65b0');
      expect(board.bottomEcho()).assertEqual('\u65b0');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(3);
      expect(board.inputEvents).assertEqual(2);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0130
     * @tc.desc state-transition: replay user action sequence CAUUN and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0130', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.clickUpdate();
      board.clickUpdate();
      board.typeText('\u65b0');
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.mainTitle()).assertEqual('\u65b0');
      expect(board.bottomEcho()).assertEqual('\u65b0');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0131
     * @tc.desc state-transition: replay user action sequence CNUUN and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0131', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.clickUpdate();
      board.clickUpdate();
      board.typeText('\u65b0');
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.mainTitle()).assertEqual('\u65b0');
      expect(board.bottomEcho()).assertEqual('\u65b0');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0132
     * @tc.desc state-transition: replay user action sequence CCUUN and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0132', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clearText();
      board.clickUpdate();
      board.clickUpdate();
      board.typeText('\u65b0');
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.mainTitle()).assertEqual('\u65b0');
      expect(board.bottomEcho()).assertEqual('\u65b0');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0133
     * @tc.desc state-transition: replay user action sequence CUAUN and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0133', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.typeText('A');
      board.clickUpdate();
      board.typeText('\u65b0');
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.mainTitle()).assertEqual('\u65b0');
      expect(board.bottomEcho()).assertEqual('\u65b0');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0134
     * @tc.desc state-transition: replay user action sequence CAAUN and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0134', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.typeText('A');
      board.clickUpdate();
      board.typeText('\u65b0');
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.mainTitle()).assertEqual('\u65b0');
      expect(board.bottomEcho()).assertEqual('\u65b0');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0135
     * @tc.desc state-transition: replay user action sequence CNAUN and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0135', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.typeText('A');
      board.clickUpdate();
      board.typeText('\u65b0');
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.mainTitle()).assertEqual('\u65b0');
      expect(board.bottomEcho()).assertEqual('\u65b0');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0136
     * @tc.desc state-transition: replay user action sequence CCAUN and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0136', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clearText();
      board.typeText('A');
      board.clickUpdate();
      board.typeText('\u65b0');
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.mainTitle()).assertEqual('\u65b0');
      expect(board.bottomEcho()).assertEqual('\u65b0');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0137
     * @tc.desc state-transition: replay user action sequence CUNUN and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0137', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.clickUpdate();
      board.typeText('\u65b0');
      board.clickUpdate();
      board.typeText('\u65b0');
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.mainTitle()).assertEqual('\u65b0');
      expect(board.bottomEcho()).assertEqual('\u65b0');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(2);
      expect(board.inputEvents).assertEqual(3);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0138
     * @tc.desc state-transition: replay user action sequence CANUN and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0138', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('A');
      board.typeText('\u65b0');
      board.clickUpdate();
      board.typeText('\u65b0');
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.mainTitle()).assertEqual('\u65b0');
      expect(board.bottomEcho()).assertEqual('\u65b0');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

    /**
     * @tc.name SequenceFiveCTest_case_0139
     * @tc.desc state-transition: replay user action sequence CNNUN and verify parent text, placeholder and counters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SequenceFiveCTest_case_0139', 0, () => {
      const board: WishBoard = new WishBoard();
      expect(board.parentText).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(board.mainPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
      board.clearText();
      board.typeText('\u65b0');
      board.typeText('\u65b0');
      board.clickUpdate();
      board.typeText('\u65b0');
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.mainTitle()).assertEqual('\u65b0');
      expect(board.bottomEcho()).assertEqual('\u65b0');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputPlaceholder()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(4);
      expect(board.isEmpty()).assertEqual(false);
    });

  });
}
